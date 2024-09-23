@implementation TDDistiller

- (int)fileCompression
{
  return self->_fileCompression;
}

- (void)setFileCompression:(int)a3
{
  self->_fileCompression = a3;
  if (a3 == 1)
    objc_msgSend(MEMORY[0x24BE28C20], "setFileEncoding:", 0);
}

- (void)_logError:(id)a3
{
  -[TDLogger logError:](-[TDDistiller logger](self, "logger"), "logError:", a3);
}

- (void)_logWarning:(id)a3
{
  -[TDLogger logWarning:](-[TDDistiller logger](self, "logger"), "logWarning:", a3);
}

- (void)_logInfo:(id)a3
{
  -[TDLogger logInfo:](-[TDDistiller logger](self, "logger"), "logInfo:", a3);
}

- (void)_logExtra:(id)a3
{
  -[TDLogger logExtra:](-[TDDistiller logger](self, "logger"), "logExtra:", a3);
}

- (void)_accumulateErrorDescription:(id)a3
{
  if (-[NSString length](-[TDDistiller accumulatedErrorDescription](self, "accumulatedErrorDescription"), "length"))
    a3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ -- %@"), a3, -[TDDistiller accumulatedErrorDescription](self, "accumulatedErrorDescription"));
  -[TDDistiller setAccumulatedErrorDescription:](self, "setAccumulatedErrorDescription:", a3);
}

- (void)_logErrorAndAccumulateDescription:(id)a3
{
  -[TDDistiller _logError:](self, "_logError:");
  -[TDDistiller _accumulateErrorDescription:](self, "_accumulateErrorDescription:", a3);
}

- (BOOL)_setupWithOutputPath:(id)a3 attemptIncremental:(BOOL)a4
{
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  id v10;
  int v11;
  id v12;
  BOOL result;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  self->_assetStoreVersionNumber = 17;
  if (!a4)
  {
    -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AttemptingIncremental %d isIncremental %d on document %@"), 0, 0, a3));
    self->_assetStore = (CUIMutableCommonAssetStorage *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C40]), "initWithPath:", a3);
LABEL_9:
    self->_renditionEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = objc_alloc(MEMORY[0x24BDBCE30]);
    self->_mainThreadPerformRunLoopModes = (NSArray *)objc_msgSend(v12, "initWithObjects:", *MEMORY[0x24BDBCA90], CFSTR("DistillWaitRunLoopMode"), 0);
    -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Theme document and asset store created"));
    return 1;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", a3))
  {
    -[TDDistiller setIncremental:](self, "setIncremental:", 1);
    -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AttemptingIncremental %d isIncremental %d on document %@"), 1, 1, a3));
    self->_assetStore = (CUIMutableCommonAssetStorage *)-[TDProMergeableCommonAssetStorage initWithPath:]([TDProMergeableCommonAssetStorage alloc], "initWithPath:", a3);
    if (-[CoreThemeDocument pathToRepresentedDocument](self->_document, "pathToRepresentedDocument")
      && (objc_msgSend((id)-[CUIMutableCommonAssetStorage uuid](self->_assetStore, "uuid"), "isEqual:", -[CoreThemeDocument uuid](self->_document, "uuid")) & 1) == 0)
    {
      v14 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Definition (%@) and CAR (%@) files do not match."), -[CoreThemeDocument pathToRepresentedDocument](self->_document, "pathToRepresentedDocument"), a3);
    }
    else
    {
      v6 = -[CoreThemeDocument colorSpaceID](self->_document, "colorSpaceID");
      if (v6 == -[CUIMutableCommonAssetStorage colorSpaceID](self->_assetStore, "colorSpaceID"))
      {
        v7 = -[CUIMutableCommonAssetStorage storageVersion](self->_assetStore, "storageVersion");
        v8 = -[CUIMutableCommonAssetStorage schemaVersion](self->_assetStore, "schemaVersion");
        v9 = -[TDDistiller assetStoreVersionNumber](self, "assetStoreVersionNumber");
        v10 = -[CoreThemeDocument metadatumForKey:](self->_document, "metadatumForKey:", CFSTR("CoreThemeSchemaVersion"));
        if (v10)
          v11 = objc_msgSend(v10, "unsignedIntValue");
        else
          v11 = 1;
        if (v7 == v9 && v8 == v11)
        {
          v15 = -[CUIMutableCommonAssetStorage distilledInCoreUIVersion](self->_assetStore, "distilledInCoreUIVersion");
          v16 = objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)-[CUIMutableCommonAssetStorage storageTimestamp](self->_assetStore, "storageTimestamp"));
          v17 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
          v18 = objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BDD0D08]);
          v19 = &unk_24EF40930;
          if (v18)
            v19 = (void *)v18;
          NSLog(CFSTR("Performing incremental distill to file at path: %@ (%@ bytes, last distilled with CoreUI version %d on %@)"), a3, v19, v15, v16);
          goto LABEL_9;
        }
        v14 = CFSTR("Definition and CAR version numbers do not match.");
      }
      else
      {
        v14 = CFSTR("Definition and CAR color spaces do not match.");
      }
    }
    -[TDDistiller _logError:](self, "_logError:", v14);
    -[TDDistiller setIncremental:](self, "setIncremental:", 0);

    result = 0;
    self->_assetStore = 0;
  }
  else
  {
    -[TDDistiller _logError:](self, "_logError:", CFSTR("No CAR file to increment doing a clean distill"));
    return 0;
  }
  return result;
}

- (id)_keySpecsToRemoveFromKeySpecs:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (objc_msgSend(a3, "count"))
  {
    if (-[CoreThemeDocument countOfRenditionsMatchingRenditionKeySpecs:](self->_document, "countOfRenditionsMatchingRenditionKeySpecs:", a3))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(a3);
            v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
            if (!-[CoreThemeDocument countOfRenditionsMatchingRenditionKeySpec:](self->_document, "countOfRenditionsMatchingRenditionKeySpec:", v10))objc_msgSend(v5, "addObject:", v10);
          }
          v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }
    }
    else
    {
      objc_msgSend(v5, "addObjectsFromArray:", a3);
    }
  }
  return v5;
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4
{
  return -[TDDistiller initWithDocument:outputPath:attemptIncremental:versionString:](self, "initWithDocument:outputPath:attemptIncremental:versionString:", a3, a4, 0, 0);
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 versionString:(id)a5
{
  return -[TDDistiller initWithDocument:outputPath:attemptIncremental:versionString:](self, "initWithDocument:outputPath:attemptIncremental:versionString:", a3, a4, 0, a5);
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 attemptIncremental:(BOOL)a5
{
  return -[TDDistiller initWithDocument:outputPath:attemptIncremental:versionString:](self, "initWithDocument:outputPath:attemptIncremental:versionString:", a3, a4, a5, 0);
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 attemptIncremental:(BOOL)a5 versionString:(id)a6
{
  _BOOL8 v7;
  TDDistiller *v10;
  objc_super v12;

  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TDDistiller;
  v10 = -[TDDistiller init](&v12, sel_init);
  if (v10)
  {
    v10->_document = (CoreThemeDocument *)a3;
    if (-[TDDistiller _setupWithOutputPath:attemptIncremental:](v10, "_setupWithOutputPath:attemptIncremental:", a4, v7))
    {
      -[TDDistiller setAssetStoreVersionString:](v10, "setAssetStoreVersionString:", a6);
    }
    else
    {
      -[TDDistiller dealloc](v10, "dealloc");
      return 0;
    }
  }
  return v10;
}

- (id)documentPath
{
  return -[NSURL path](-[TDPersistentDocument fileURL](self->_document, "fileURL"), "path");
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  -[TDDistiller setCompletionHandler:](self, "setCompletionHandler:", 0);
  -[TDDistiller setLogger:](self, "setLogger:", 0);
  -[TDDistiller setCallbackThread:](self, "setCallbackThread:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDDistiller;
  -[TDDistiller dealloc](&v3, sel_dealloc);
}

- (id)keyFormatData
{
  -[CoreThemeDocument renditionKeyFormat](self->_document, "renditionKeyFormat");
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
}

- (id)_keyDataFromKey:(const _renditionkeytoken *)a3
{
  const _renditionkeyfmt *v3;
  size_t var2;
  __int128 *v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  _BYTE v12[22];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v12 = 0u;
  v3 = -[CoreThemeDocument renditionKeyFormat](self->_document, "renditionKeyFormat", 0, 0, 0, 0, 0, *(_QWORD *)&v12[14]);
  var2 = v3->var2;
  if (var2 < 0x16)
    v5 = &v11;
  else
    v5 = (__int128 *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
  CUIFillCARKeyArrayForRenditionKey();
  v6 = v3->var2;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  v8 = 2 * v3->var2;
  if (v6 < 0x16)
    v9 = (void *)objc_msgSend(v7, "initWithBytes:length:", v5, v8);
  else
    v9 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:freeWhenDone:", v5, v8, 1);
  return v9;
}

- (id)_filterRenditions:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "mipLevels");
        v10 = (void *)objc_msgSend(v9, "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(face != nil) AND (face.identifier != 0)")));
        if (objc_msgSend(v10, "count"))
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                v15 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "textureImage"));
                if (v15 != 0x7FFFFFFFFFFFFFFFLL)
                  objc_msgSend(v4, "addIndex:", v15);
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            }
            while (v12);
          }
        }
      }
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v16 = (void *)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v16, "removeObjectsAtIndexes:", v4);
    return v16;
  }
  return a3;
}

- (id)_textureFaceExclusionPredicate
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(((entity = 'TextureImageRenditionSpec') AND ((textureLevelAssignment.face = nil) OR (textureLevelAssignment.face.identifier = 0))) OR (renditionType.constantName != 'kCUITextureImageRenditionType'))"));
}

- (id)_renditionsWithError:(id *)a3
{
  id v5;
  const _renditionkeyfmt *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];

  v5 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self->_document, "objectsForEntity:withPredicate:sortDescriptors:error:", CFSTR("RenditionSpec"), 0, 0, a3);
  v6 = -[CoreThemeDocument renditionKeyFormat](self->_document, "renditionKeyFormat");
  v7 = -[TDDistiller _filterRenditions:](self, "_filterRenditions:", v5);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__TDDistiller__renditionsWithError___block_invoke;
  v12[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v12[4] = v6;
  v8 = (void *)objc_msgSend(v7, "sortedArrayUsingComparator:", v12);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  __midpointQuickPermuteInRange(v8, 0, objc_msgSend(v8, "count"), v9);
  v10 = objc_msgSend(v9, "count");
  if (v10 != objc_msgSend(v8, "count"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDDistiller.m"), 418, CFSTR("%s __midpointQuickPermute result doesn't match original count"), "-[TDDistiller _renditionsWithError:]");
  return v9;
}

uint64_t __36__TDDistiller__renditionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "keySpec"), "key");
  objc_msgSend((id)objc_msgSend(a3, "keySpec"), "key");
  return CUICompareRenditionKey();
}

- (id)_renditionsFromProductions:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BDD14B8];
        v12 = objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("production"));
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v12, objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v10), 0, 4, 0));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  return -[TDDistiller _filterRenditions:](self, "_filterRenditions:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self->_document, "objectsForEntity:withPredicate:sortDescriptors:error:", CFSTR("RenditionSpec"), objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v5), 0, a4));
}

- (BOOL)setAsset:(id)a3 withKey:(const _renditionkeytoken *)a4 fromRenditionSpec:(id)a5
{
  return -[CUIMutableCommonAssetStorage setAsset:forKey:](self->_assetStore, "setAsset:forKey:", a3, -[TDDistiller _keyDataFromKey:](self, "_keyDataFromKey:", a4));
}

- (unint64_t)_removeRenditionsWithKeySpecs:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(a3);
      v10 = -[TDDistiller _keyDataFromKey:](self, "_keyDataFromKey:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "key"));
      if (-[CUIMutableCommonAssetStorage assetExistsForKey:](self->_assetStore, "assetExistsForKey:", v10))
      {
        ++v7;
        -[TDDistiller removeRenditionsFromAssetStoreWithKey:](self, "removeRenditionsFromAssetStoreWithKey:", v10);
      }
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v6);
  return v7;
}

- (id)_productionForRenditionSpec:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "production");
  if (!v5)
    -[TDDistiller _logWarning:](self, "_logWarning:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Found a rendition spec not associated with any element production: %@"), a3));
  return v5;
}

- (BOOL)distillRenditions
{
  void *v3;
  TDRenditionsDistiller *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TDRenditionsDistiller *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  TDRenditionsDistiller *v24;
  id v25;
  char v26[88];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2276A576C](self, a2);
  v25 = 0;
  v4 = -[TDRenditionsDistiller initWithDocument:shouldCompressCSIDataFlag:]([TDRenditionsDistiller alloc], "initWithDocument:shouldCompressCSIDataFlag:", self->_document, 1);
  -[TDRenditionsDistiller setLogger:](v4, "setLogger:", -[TDDistiller logger](self, "logger"));
  -[TDRenditionsDistiller detachDistillationThread](v4, "detachDistillationThread");
  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Fetching and distilling renditions"));
  v5 = -[TDDistiller _renditionsWithError:](self, "_renditionsWithError:", &v25);
  v6 = objc_msgSend(v5, "count");
  -[CoreThemeDocument renditionKeyFormat](self->_document, "renditionKeyFormat");
  -[TDDistiller setAssetStoreRenditionCount:](self, "setAssetStoreRenditionCount:", v6);
  if (v25)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v25, "localizedDescription"));
    -[TDRenditionsDistiller enqueueAbortFlag](v4, "enqueueAbortFlag");
    v7 = 0;
  }
  else
  {
    v23 = v3;
    v24 = v4;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    if (v6)
    {
      v9 = 0;
      while (1)
      {
        if (-[TDDistiller isCancelled](self, "isCancelled"))
        {
          -[TDRenditionsDistiller enqueueAbortFlag](v24, "enqueueAbortFlag");
          goto LABEL_21;
        }
        v10 = (void *)MEMORY[0x2276A576C]();
        v11 = (void *)objc_msgSend(v5, "objectAtIndex:", v9);
        v12 = (void *)objc_msgSend(v11, "keySpec");
        if (!-[TDDistiller setAsset:withKey:fromRenditionSpec:](self, "setAsset:withKey:fromRenditionSpec:", 0, objc_msgSend(v12, "key"), v11))
        {
          -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: couldnot write key to file\n%@\n"), objc_msgSend(v12, "keyDescription")));

          goto LABEL_20;
        }
        objc_msgSend(v12, "key");
        CUIRenditionKeyCopy();
        CUIRenditionKeyStandardize();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v26, 4 * CUIRenditionKeyTokenCount());
        if ((objc_msgSend(v8, "containsObject:", v13) & 1) != 0)
          break;
        -[TDRenditionsDistiller enqueueRenditionSpec:](v24, "enqueueRenditionSpec:", v11);
        objc_msgSend(v8, "addObject:", v13);

        objc_autoreleasePoolPop(v10);
        if (v6 == ++v9)
          goto LABEL_9;
      }
      -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Identical key for two renditions\n\n%@\n"), objc_msgSend(v12, "keyDescription")));

LABEL_20:
      -[TDRenditionsDistiller enqueueAbortFlag](v24, "enqueueAbortFlag");
      objc_autoreleasePoolPop(v10);
LABEL_21:
      v7 = 0;
    }
    else
    {
LABEL_9:

      v14 = v24;
      -[TDRenditionsDistiller enqueueLastRenditionFlag](v24, "enqueueLastRenditionFlag");
      v15 = (void *)objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC");
      v16 = -[TDRenditionsDistiller nextCSIDataInfoFromQueue](v24, "nextCSIDataInfoFromQueue");
      if (v16 && (v17 = (void *)v16, !-[TDDistiller isCancelled](self, "isCancelled")))
      {
        while (1)
        {
          v18 = (void *)MEMORY[0x2276A576C]();
          if (objc_msgSend((id)objc_msgSend(v17, "objectForKey:", CFSTR("DistillingAborted")), "BOOLValue"))break;
          v19 = objc_msgSend(v17, "objectForKey:", CFSTR("CSIData"));
          v20 = (void *)objc_msgSend(v15, "objectWithID:", objc_msgSend(v17, "objectForKey:", CFSTR("RenditionSpec")));
          v7 = -[TDDistiller setAsset:withKey:fromRenditionSpec:](self, "setAsset:withKey:fromRenditionSpec:", v19, objc_msgSend((id)objc_msgSend(v20, "keySpec"), "key"), v20);
          objc_autoreleasePoolPop(v18);
          v14 = v24;
          v21 = -[TDRenditionsDistiller nextCSIDataInfoFromQueue](v24, "nextCSIDataInfoFromQueue");
          if (v21)
          {
            v17 = (void *)v21;
            if (!-[TDDistiller isCancelled](self, "isCancelled"))
              continue;
          }
          goto LABEL_12;
        }
        objc_autoreleasePoolPop(v18);
        v7 = 0;
        v14 = v24;
      }
      else
      {
        v7 = 1;
      }
LABEL_12:
      -[TDRenditionsDistiller waitUntilFinished](v14, "waitUntilFinished");
    }
    v3 = v23;
  }
  objc_autoreleasePoolPop(v3);
  return v7;
}

- (BOOL)distillThemeAppearances
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2276A576C](self, a2);
  v16 = 0;
  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Fetching and distilling appearances"));
  v4 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("Appearance"), 0, &v16);
  v5 = v16;
  if (v16)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v16, "localizedDescription"));
  }
  else
  {
    v6 = v4;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[CUIMutableCommonAssetStorage setAppearanceIdentifier:forName:](self->_assetStore, "setAppearanceIdentifier:forName:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identifier"), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "name"));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }
  }
  objc_autoreleasePoolPop(v3);
  return v5 == 0;
}

- (BOOL)distillLocalizationss
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2276A576C](self, a2);
  v17 = 0;
  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Fetching and distilling localizations"));
  v4 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("Localization"), 0, &v17);
  v5 = v17;
  if (v17)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v17, "localizedDescription"));
  }
  else
  {
    v6 = v4;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "identifier"))
            -[CUIMutableCommonAssetStorage setLocalizationIdentifier:forName:](self->_assetStore, "setLocalizationIdentifier:forName:", objc_msgSend(v11, "identifier"), objc_msgSend(v11, "name"));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }
  }
  objc_autoreleasePoolPop(v3);
  return v5 == 0;
}

- (BOOL)distillCatalogGlobals
{
  void *v4;
  id v5;
  id v6;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = (void *)MEMORY[0x2276A576C]();
  v12 = 0;
  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Fetching and distilling catalog globals"));
  v5 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("CatalogGlobals"), 0, &v12);
  v6 = v12;
  if (v12)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v12, "localizedDescription"));
  }
  else
  {
    v8 = v5;
    v9 = objc_msgSend(v5, "count");
    if (v9 >= 2)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDDistiller.m"), 653, CFSTR("More than one CatalogGlobals entity"));
    }
    else if (!v9)
    {
      goto LABEL_3;
    }
    v10 = (void *)objc_msgSend(v8, "firstObject");
    v11 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(v10, "dictionaryForArchiving"), 0, 0);
    if (v11)
      -[CUIMutableCommonAssetStorage setCatalogGlobalData:](self->_assetStore, "setCatalogGlobalData:", v11);
  }
LABEL_3:
  objc_autoreleasePoolPop(v4);
  return v6 == 0;
}

- (BOOL)_distillColorDefinitions:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      v15 = v6;
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x2276A576C]();
        v11 = (void *)objc_msgSend(v9, "valueForKey:", CFSTR("name"));
        v12 = (void *)objc_msgSend(v11, "valueForKey:", CFSTR("selector"));
        v13 = objc_msgSend((id)objc_msgSend(v11, "valueForKey:", CFSTR("isExcludedFromFilter")), "BOOLValue");
        LODWORD(v9) = objc_msgSend((id)objc_msgSend(v9, "valueForKey:", CFSTR("physicalColor")), "unsignedIntValue");
        -[TDDistiller _logExtra:](self, "_logExtra:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Writing color A:%u R:%u G:%u B:%u name %@ excludeFromFilter %d"), v9 >> 24, BYTE2(v9), BYTE1(v9), v9, v12, v13));
        -[CUIMutableCommonAssetStorage setColor:forName:excludeFromFilter:](self->_assetStore, "setColor:forName:excludeFromFilter:", v9, objc_msgSend(v12, "UTF8String"), v13);
        objc_autoreleasePoolPop(v10);
      }
      v6 = v15 + v5;
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
    if (v6)
      -[TDDistiller _logExtra:](self, "_logExtra:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully distilled and stored %lu colors"), v6));
  }
  return 1;
}

- (BOOL)distillCustomColors
{
  void *v3;
  id v4;
  BOOL v5;
  id v7;

  v3 = (void *)MEMORY[0x2276A576C](self, a2);
  v7 = 0;
  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Fetching and distilling color definitions"));
  v4 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("ColorDefinition"), 0, &v7);
  if (v7)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v7, "localizedDescription", v4));
    v5 = 0;
  }
  else
  {
    v5 = -[TDDistiller _distillColorDefinitions:](self, "_distillColorDefinitions:", v4);
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)_distillFonts:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  double v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      v18 = v7;
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2276A576C]();
        v12 = objc_msgSend(v10, "postscriptName");
        v13 = objc_msgSend((id)objc_msgSend(v10, "selector"), "constantName");
        objc_msgSend((id)objc_msgSend(v10, "baselineOffset"), "floatValue");
        v15 = v14;
        -[TDDistiller _logExtra:](self, "_logExtra:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Writing font %@ for %@"), v12, v13));
        LODWORD(v16) = v15;
        -[CUIMutableCommonAssetStorage setFontName:baselineOffset:forFontSelector:](self->_assetStore, "setFontName:baselineOffset:forFontSelector:", v12, v13, v16);
        objc_autoreleasePoolPop(v11);
      }
      v7 = v18 + v6;
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
    if (v7)
      -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully distilled and stored %lu fonts"), v7));
  }
  return 1;
}

- (BOOL)distillCustomFonts
{
  void *v3;
  id v4;
  BOOL v5;
  id v7;

  v3 = (void *)MEMORY[0x2276A576C](self, a2);
  v7 = 0;
  -[TDDistiller _logInfo:](self, "_logInfo:", CFSTR("Fetching and distilling font definitions"));
  v4 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("FontDefinition"), 0, &v7);
  if (v7)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v7, "localizedDescription", v4));
    v5 = 0;
  }
  else
  {
    v5 = -[TDDistiller _distillFonts:](self, "_distillFonts:", v4);
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)distillCustomFontSizes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("FontSizeDefinition"), 0, &v15);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend((id)objc_msgSend(v8, "selector"), "selectorName");
        objc_msgSend((id)objc_msgSend(v8, "pointSize"), "floatValue");
        -[CUIMutableCommonAssetStorage setFontSize:forFontSizeSelector:](self->_assetStore, "setFontSize:forFontSizeSelector:", v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }
  return 1;
}

- (id)_copyStandardEffectDefinitions
{
  int64_t v2;
  id v3;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[CoreThemeDocument targetPlatform](self->_document, "targetPlatform");
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  if (v2)
    return (id)objc_msgSend(v3, "initWithCapacity:", 0);
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", 50);
  v6 = (void *)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", 0);
  if (objc_msgSend(v6, "effectDefinitionCount"))
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(v6, "effectDefinitionAtIndex:", v7);
      if (*(_QWORD *)(v8 + 72))
      {
        v9 = v8 + 32;
        do
        {
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v6, "schemaEffectRenditionsForPartDefinition:", v9));
          v10 = *(_QWORD *)(v9 + 480);
          v9 += 440;
        }
        while (v10);
      }
      ++v7;
    }
    while (v7 < objc_msgSend(v6, "effectDefinitionCount"));
  }
  return v5;
}

- (BOOL)_distillNamedElements:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[88];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x2276A576C]();
        v11 = (void *)objc_msgSend((id)objc_msgSend(v9, "production"), "baseKeySpec");
        objc_msgSend(v11, "key");
        CUIRenditionKeyCopy();
        CUIRenditionKeySetValueForAttribute();
        if (objc_msgSend((id)objc_msgSend(v11, "part"), "identifier"))
        {
          if (objc_msgSend((id)objc_msgSend(v11, "part"), "identifier") != 181)
          {
            v15 = 0;
            if (objc_msgSend(-[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self->_document, "objectsForEntity:withPredicate:sortDescriptors:error:", CFSTR("RenditionKeySpec"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("nameIdentifier == %d AND part.identifier == %d"), objc_msgSend(v11, "nameIdentifier"), 181), 0, &v15), "count"))
            {
              CUIRenditionKeySetValueForAttribute();
            }
          }
        }
        MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)objc_msgSend(v9, "name"));
        v13 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xB734F61BuLL);
        CFStringGetFileSystemRepresentation((CFStringRef)objc_msgSend(v9, "name"), v13, MaximumSizeOfFileSystemRepresentation);
        -[CUIMutableCommonAssetStorage setRenditionKey:hotSpot:forName:](self->_assetStore, "setRenditionKey:hotSpot:forName:", v20, v13, 0.0, 0.0);
        free(v13);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v6);
  }
  -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully stored %ld asset name entries."), objc_msgSend(a3, "count")));
  return 1;
}

- (BOOL)distillNamedElements
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v7;

  v7 = 0;
  v3 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("production.isActive = YES"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("name"), 1);
  v5 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self->_document, "objectsForEntity:withPredicate:sortDescriptors:error:", CFSTR("NamedElement"), v3, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4), &v7);

  return -[TDDistiller _distillNamedElements:](self, "_distillNamedElements:", v5);
}

- (BOOL)_distillCursorFacetDefinitions:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v12;
  id v14;
  void *v15;

  v5 = (void *)MEMORY[0x2276A576C](self, a2);
  if (objc_msgSend(a3, "count"))
  {
    v14 = a3;
    v15 = v5;
    v6 = (void *)objc_msgSend(a3, "objectEnumerator");
    v7 = objc_msgSend(v6, "nextObject");
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        v9 = -1.0;
        v10 = -1.0;
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "entity"), "name"), "isEqualToString:", CFSTR("CursorFacetDefinition")))
        {
          v10 = (double)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", CFSTR("hotSpotX")), "integerValue");
          v9 = (double)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", CFSTR("hotSpotY")), "integerValue");
        }
        MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)objc_msgSend(v8, "valueForKey:", CFSTR("facetName")));
        v12 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x70829098uLL);
        CFStringGetFileSystemRepresentation((CFStringRef)objc_msgSend(v8, "valueForKey:", CFSTR("facetName")), v12, MaximumSizeOfFileSystemRepresentation);
        -[CUIMutableCommonAssetStorage setRenditionKey:hotSpot:forName:](self->_assetStore, "setRenditionKey:hotSpot:forName:", objc_msgSend((id)objc_msgSend(v8, "valueForKey:", CFSTR("keySpec")), "key"), v12, v10, v9);
        free(v12);
        v8 = (void *)objc_msgSend(v6, "nextObject");
      }
      while (v8);
    }
    -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully stored %ld facet definitions"), objc_msgSend(v14, "count")));
    v5 = v15;
  }
  objc_autoreleasePoolPop(v5);
  return 1;
}

- (BOOL)distillCursorFacetDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  id v20;

  v3 = (void *)MEMORY[0x2276A576C](self, a2);
  v20 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("facetName"), 1);
  v5 = (void *)objc_msgSend(-[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("CursorFacetDefinition"), objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4), &v20), "mutableCopy");

  if (v20)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v20, "localizedDescription"));
  }
  else
  {
    v7 = objc_msgSend(v5, "count");
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    if (v7 >= 1)
    {
      for (i = 0; i != v7; ++i)
      {
        v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", i), "valueForKey:", CFSTR("cursorProductions")), "objectEnumerator");
        while (1)
        {
          v11 = (void *)objc_msgSend(v10, "nextObject");
          if (!v11)
            break;
          if ((objc_msgSend((id)objc_msgSend(v11, "valueForKey:", CFSTR("isActive")), "BOOLValue") & 1) != 0)
            goto LABEL_11;
        }
        objc_msgSend(v8, "addIndex:", i);
LABEL_11:
        ;
      }
    }
    objc_msgSend(v5, "removeObjectsAtIndexes:", v8);
    v12 = objc_msgSend(v5, "count");
    v13 = v12 - 1;
    if (v12 <= 1)
      goto LABEL_21;
    v14 = 0;
    v15 = v12 - 2;
    v16 = 1;
    do
    {
      while (1)
      {
        v17 = v14 + 1;
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v14), "valueForKey:", CFSTR("facetName")), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v14 + 1), "valueForKey:", CFSTR("facetName"))) & 1) == 0)break;
        -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("More than one definition of the facet name: %@"), objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v14), "valueForKey:", CFSTR("facetName"))));
        v16 = 0;
        v6 = 0;
        if (v15 == v14++)
          goto LABEL_22;
      }
      ++v14;
    }
    while (v13 != v17);
    if ((v16 & 1) != 0)
    {
LABEL_21:
      v6 = -[TDDistiller _distillCursorFacetDefinitions:](self, "_distillCursorFacetDefinitions:", v5);
      goto LABEL_22;
    }
  }
  v6 = 0;
LABEL_22:

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (void)finishDistillationWithSuccess:(BOOL)a3
{
  -[TDDistiller setSuccessful:](self, "setSuccessful:", a3);
  -[TDDistiller performSelectorOnCallbackThread:withObject:waitUntilDone:](self, "performSelectorOnCallbackThread:withObject:waitUntilDone:", sel_markDistillationAsFinished, 0, 0);
}

- (void)markDistillationAsFinished
{
  void (**v3)(id, BOOL, uint64_t);
  void (**v4)(id, BOOL, uint64_t);
  void *v5;
  __CFString *v6;
  void *v7;
  NSString *v8;
  uint64_t v9;

  -[TDDistiller setFinished:](self, "setFinished:", 1);
  v3 = -[TDDistiller completionHandler](self, "completionHandler");
  if (v3)
  {
    v4 = v3;
    if (-[NSString length](-[TDDistiller accumulatedErrorDescription](self, "accumulatedErrorDescription"), "length"))
    {
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = CoreThemeDefinitionErrorDomain[0];
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = -[TDDistiller accumulatedErrorDescription](self, "accumulatedErrorDescription");
      v9 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 0, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x24BDD0FC8], 0));
    }
    else
    {
      v9 = 0;
    }
    v4[2](v4, -[TDDistiller isSuccessful](self, "isSuccessful"), v9);
    -[TDDistiller setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[TDDistiller setAccumulatedErrorDescription:](self, "setAccumulatedErrorDescription:", 0);
}

- (void)_resetDocumentUuid:(id)a3
{
  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Setting document uuid."));
  -[CoreThemeDocument setUuid:](self->_document, "setUuid:", a3);
  if (-[TDPersistentDocument fileURL](self->_document, "fileURL"))
    -[TDPersistentDocument saveDocument:](self->_document, "saveDocument:", self);
}

- (id)dateOfLastDistill
{
  if (self->_assetStore && -[TDDistiller isIncremental](self, "isIncremental"))
    return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)-[CUIMutableCommonAssetStorage storageTimestamp](self->_assetStore, "storageTimestamp"));
  else
    return 0;
}

- (void)_distillChanges:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("CAR exists. Beginning incremental distill"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    objc_msgSend(v5, "setName:", objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, NSStringFromSelector(a2)));
  }
  v9 = (void *)objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__TDDistiller__distillChanges___block_invoke;
  v10[3] = &unk_24EF2C800;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a2;
  objc_msgSend(v9, "performBlockAndWait:", v10);

  self->_assetStore = 0;
  -[TDDistiller finishDistillationWithSuccess:](self, "finishDistillationWithSuccess:", *((unsigned __int8 *)v12 + 24));
  _Block_object_dispose(&v11, 8);
}

uint64_t __31__TDDistiller__distillChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  objc_class *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  char v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v1 = a1;
  v67 = *MEMORY[0x24BDAC8D0];
  v64 = 0;
  v63 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "dateOfLastDistill");
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "historian");
  v4 = (void *)objc_msgSend(v3, "colorsChangedSinceDate:", v2);
  v5 = objc_msgSend(v4, "count");
  result = objc_msgSend(*(id *)(v1 + 32), "_distillColorDefinitions:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  if (!(_DWORD)result)
    return result;
  v7 = (void *)objc_msgSend(v3, "fontsChangedSinceDate:", v2);
  v8 = v7;
  v9 = v5 || objc_msgSend(v7, "count") != 0;
  result = objc_msgSend(*(id *)(v1 + 32), "_distillFonts:", v8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  if (!(_DWORD)result)
    return result;
  result = objc_msgSend(*(id *)(v1 + 32), "distillCustomFontSizes");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  if (!(_DWORD)result)
    return result;
  v10 = (void *)objc_msgSend(v3, "namedElementsChangedSinceDate:", v2);
  v11 = v10;
  v12 = v9 || objc_msgSend(v10, "count") != 0;
  result = objc_msgSend(*(id *)(v1 + 32), "_distillNamedElements:", v11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  if (!(_DWORD)result)
    return result;
  v13 = (void *)objc_msgSend(v3, "facetDefinitionsChangedSinceDate:", v2);
  v14 = v13;
  v15 = v12 || objc_msgSend(v13, "count") != 0;
  result = objc_msgSend(*(id *)(v1 + 32), "_distillCursorFacetDefinitions:", v14);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  if (!(_DWORD)result)
    return result;
  v16 = objc_msgSend(*(id *)(v1 + 32), "_removeRenditionsWithKeySpecs:", objc_msgSend(*(id *)(v1 + 32), "_keySpecsToRemoveFromKeySpecs:", objc_msgSend(v3, "keySpecsForRenditionsRemovedSinceDate:", v2)));
  if (v16)
    v17 = 1;
  else
    v17 = v15;
  v64 = v17;
  *(_QWORD *)(*(_QWORD *)(v1 + 32) + 32) = objc_msgSend(v3, "productionsChangedSinceDate:uuidNeedsReset:", v2, &v64);
  v18 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count");
  if (v18)
    v19 = 0;
  else
    v19 = v64 == 0;
  v20 = !v19;
  v64 = v20;
  if (v18)
  {
    v21 = CFSTR("s");
    if (v18 == 1)
      v21 = &stru_24EF2D4A8;
    objc_msgSend(*(id *)(v1 + 32), "_logExtra:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found %lu changed production%@."), v18, v21));
  }
  v22 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isActive = NO")));
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(*(id *)(v1 + 32), "_logWarning:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removing renditions for %lu inactive productions"), objc_msgSend(v22, "count")));
    v23 = (void *)objc_msgSend(*(id *)(v1 + 32), "_renditionsFromProductions:error:", v22, &v63);
    v24 = *(void **)(v1 + 32);
    if (v63)
    {
      v25 = objc_msgSend(v63, "localizedDescription");
      v26 = v24;
LABEL_35:
      result = objc_msgSend(v26, "_logErrorAndAccumulateDescription:", v25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 0;
      return result;
    }
    v16 += objc_msgSend(v24, "_removeRenditionsWithKeySpecs:", objc_msgSend(v24, "_keySpecsToRemoveFromKeySpecs:", objc_msgSend(v23, "valueForKey:", CFSTR("keySpec"))));
  }
  v27 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isActive = YES")));
  if (!objc_msgSend(v27, "count"))
    goto LABEL_52;
  objc_msgSend(*(id *)(v1 + 32), "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Active changed productions: %lu"), objc_msgSend(v27, "count")));
  v28 = (void *)objc_msgSend(*(id *)(v1 + 32), "_renditionsFromProductions:error:", v27, &v63);
  if (v63)
  {
    v29 = *(void **)(v1 + 32);
    v25 = objc_msgSend(v63, "localizedDescription");
    v26 = v29;
    goto LABEL_35;
  }
  v30 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "countOfRenditionsMatchingRenditionKeySpecs:", objc_msgSend(v28, "valueForKey:", CFSTR("keySpec")));
  v31 = objc_msgSend(v28, "count");
  if (v30 < v31)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 32), CFSTR("TDDistiller.m"), 1113, CFSTR("-[TDDistiller _distillChanges] rendition counting mismatch."));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = v30 == v31;
  obj = v28;
  if (v30 != v31)
  {
    v61 = 0uLL;
    v62 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (result)
    {
      v40 = result;
      v41 = *(_QWORD *)v60;
      v51 = *(_QWORD *)v60;
      v52 = v1;
      do
      {
        v42 = 0;
        v53 = v40;
        do
        {
          if (*(_QWORD *)v60 != v41)
            objc_enumerationMutation(v28);
          v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v42), "keySpec");
          if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "countOfRenditionsMatchingRenditionKeySpec:", v43) >= 2)
          {
            v44 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 250);
            v45 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "renditionsMatchingRenditionKeySpec:", v43);
            v46 = objc_msgSend(v45, "count");
            if (v46)
            {
              for (i = 0;
                    i != v46;
                    objc_msgSend(v44, "appendString:", objc_msgSend(v49, "stringWithFormat:", CFSTR("\n\t%lu. %@ Rendition: %@"), i, NSStringFromClass(v50), v48)))
              {
                v48 = (void *)objc_msgSend(v45, "objectAtIndex:", i);
                objc_msgSend(v48, "production");
                v49 = (void *)MEMORY[0x24BDD17C8];
                ++i;
                v50 = (objc_class *)objc_opt_class();
              }
            }
            v1 = v52;
            objc_msgSend(*(id *)(v52 + 32), "_logErrorAndAccumulateDescription:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Identical keys for %lu renditions.\n\t%@%@"), v46, objc_msgSend(v43, "keyDescription"), v44));
            v40 = v53;
            v28 = obj;
            v41 = v51;
          }
          ++v42;
        }
        while (v42 != v40);
        result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
        v40 = result;
      }
      while (result);
    }
    return result;
  }
  v57 = 0uLL;
  v58 = 0uLL;
  v55 = 0uLL;
  v56 = 0uLL;
  v32 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v56 != v35)
          objc_enumerationMutation(v28);
        v37 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "assetExistsForKey:", objc_msgSend(*(id *)(v1 + 32), "_keyDataFromKey:", objc_msgSend((id)objc_msgSend(v37, "keySpec"), "key"))) & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = objc_msgSend(*(id *)(v1 + 32), "setAsset:withKey:fromRenditionSpec:", objc_msgSend(v37, "createCSIRepresentationWithCompression:colorSpaceID:document:", 1, objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "colorSpaceID"), *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8)), objc_msgSend((id)objc_msgSend(v37, "keySpec"), "key"), v37);
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24))
            goto LABEL_53;
          ++v34;
        }
      }
      v33 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v33);
  }
  else
  {
LABEL_52:
    v34 = 0;
  }
LABEL_53:
  if (v16)
    objc_msgSend(*(id *)(v1 + 32), "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu renditions removed from the CAR"), v16));
  if (v34)
    objc_msgSend(*(id *)(v1 + 32), "_logInfo:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu renditions added to the CAR"), v34));
  objc_msgSend(*(id *)(v1 + 32), "setAssetStoreRenditionCount:", (_DWORD)v34 - (_DWORD)v16 + objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "renditionCount"));
  if (v64)
  {
    v38 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(*(id *)(v1 + 32), "setAssetStoreUuid:", v38);
    objc_msgSend(*(id *)(v1 + 32), "setAssetStoreAssociatedChecksum:", objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "checksum"));
    v39 = v38;
  }
  else
  {
    v38 = 0;
  }
  result = objc_msgSend(*(id *)(v1 + 32), "assetStoreWriteToDisk");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(v1 + 32), "_logErrorAndAccumulateDescription:", CFSTR("Failed to write to CAR"));
  if (v64)
    return objc_msgSend(*(id *)(v1 + 32), "performSelectorOnCallbackThread:withObject:waitUntilDone:", sel__resetDocumentUuid_, v38, 1);
  return result;
}

- (void)removeRenditionsFromAssetStoreWithKey:(id)a3
{
  -[CUIMutableCommonAssetStorage removeAssetForKey:](self->_assetStore, "removeAssetForKey:", a3);
}

- (void)setAssetStoreRenditionCount:(unsigned int)a3
{
  -[CUIMutableCommonAssetStorage setRenditionCount:](self->_assetStore, "setRenditionCount:", *(_QWORD *)&a3);
}

- (void)setAssetStoreUuid:(id)a3
{
  -[CUIMutableCommonAssetStorage setUuid:](self->_assetStore, "setUuid:", a3);
}

- (NSUUID)uuid
{
  return (NSUUID *)-[CUIMutableCommonAssetStorage uuid](self->_assetStore, "uuid");
}

- (void)setAssetStoreAssociatedChecksum:(unsigned int)a3
{
  -[CUIMutableCommonAssetStorage setAssociatedChecksum:](self->_assetStore, "setAssociatedChecksum:", *(_QWORD *)&a3);
}

- (void)setAssetStoreKeyFormatData:(id)a3
{
  -[CUIMutableCommonAssetStorage setKeyFormatData:](self->_assetStore, "setKeyFormatData:", a3);
}

- (void)setAssetStoreKeySemantics:(int)a3
{
  -[CUIMutableCommonAssetStorage setKeySemantics:](self->_assetStore, "setKeySemantics:", *(_QWORD *)&a3);
}

- (void)setAssetStorageVersion:(unsigned int)a3
{
  -[CUIMutableCommonAssetStorage setStorageVersion:](self->_assetStore, "setStorageVersion:", *(_QWORD *)&a3);
}

- (void)setAssetStorageVersionString:(const char *)a3
{
  -[CUIMutableCommonAssetStorage setVersionString:](self->_assetStore, "setVersionString:", a3);
}

- (void)setAssetSchemaVersion:(unsigned int)a3
{
  -[CUIMutableCommonAssetStorage setSchemaVersion:](self->_assetStore, "setSchemaVersion:", *(_QWORD *)&a3);
}

- (void)setAssetColorSpaceID:(unsigned int)a3
{
  -[CUIMutableCommonAssetStorage setColorSpaceID:](self->_assetStore, "setColorSpaceID:", *(_QWORD *)&a3);
}

- (void)setDeploymentPlatform:(id)a3
{
  -[CUIMutableCommonAssetStorage setDeploymentPlatform:](self->_assetStore, "setDeploymentPlatform:", a3);
}

- (void)setDeploymentPlatformVersion:(id)a3
{
  -[CUIMutableCommonAssetStorage setDeploymentPlatformVersion:](self->_assetStore, "setDeploymentPlatformVersion:", a3);
}

- (void)setAuthoringTool:(id)a3
{
  -[CUIMutableCommonAssetStorage setAuthoringTool:](self->_assetStore, "setAuthoringTool:", a3);
}

- (BOOL)assetStoreWriteToDisk
{
  unint64_t v3;
  int v4;
  int v5;
  int v6;
  BOOL v7;
  BOOL v8;
  _BOOL4 v9;

  v3 = -[CoreThemeDocument targetPlatform](self->_document, "targetPlatform");
  v4 = -[CoreThemeDocument majorVersion](self->_document, "majorVersion");
  v5 = -[CoreThemeDocument minorVersion](self->_document, "minorVersion");
  v6 = -[CoreThemeDocument patchVersion](self->_document, "patchVersion");
  if (v3 != 4)
  {
    if (v3)
    {
      if (v3 <= 3 && (v4 < 9 || v4 == 9 && v5 <= 2))
LABEL_18:
        -[CUIMutableCommonAssetStorage setEnableLargeCarKeyWorkaround:](self->_assetStore, "setEnableLargeCarKeyWorkaround:", 1);
    }
    else
    {
      v7 = v5 < 12 && v4 < 11;
      if (v6 >= 5)
        v7 = 0;
      v8 = v5 < 11 && v4 < 11;
      if (v7 || v8)
        goto LABEL_18;
    }
  }
  v9 = -[CUIMutableCommonAssetStorage writeToDiskAndCompact:](self->_assetStore, "writeToDiskAndCompact:", 1);
  if (v9)
    LOBYTE(v9) = -[CUIMutableCommonAssetStorage validateFile](self->_assetStore, "validateFile") == 0;
  return v9;
}

- (void)_distill:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  CUIMutableCommonAssetStorage *assetStore;
  size_t v12;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  char __dst[256];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v5 = (void *)MEMORY[0x2276A576C](self, a2, a3);
  v6 = (void *)MEMORY[0x2276A576C]();
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    objc_msgSend(v7, "setName:", objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v10, NSStringFromSelector(a2)));
  }
  -[TDDistiller _logExtra:](self, "_logExtra:", CFSTR("Beginning clean distill."));
  assetStore = self->_assetStore;
  if (!assetStore)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", CFSTR("ERROR: Each TDDistiller instance can be distilled only one time!"));
    *((_BYTE *)v16 + 24) = 0;
  }
  objc_autoreleasePoolPop(v6);
  if (assetStore)
  {
    -[TDDistiller setDeploymentPlatformVersion:](self, "setDeploymentPlatformVersion:", -[CoreThemeDocument minimumDeploymentVersion](self->_document, "minimumDeploymentVersion"));
    -[CoreThemeDocument targetPlatform](self->_document, "targetPlatform");
    -[TDDistiller setDeploymentPlatform:](self, "setDeploymentPlatform:", CUIPlatformNameForPlatform());
    stpncpy(__dst, "@(#)PROGRAM:CoreThemeDefinition  PROJECT:CoreThemeDefinition-609\n", 0x100uLL);
    v12 = strnlen(__dst, 0x100uLL) - 1;
    if (__dst[v12] == 10)
      __dst[v12] = 32;
    -[TDDistiller setAuthoringTool:](self, "setAuthoringTool:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s [IIO-%s]"), __dst, CGGetImageIOVersion()));
    v13 = (void *)objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __24__TDDistiller__distill___block_invoke;
    v14[3] = &unk_24EF2C800;
    v14[4] = self;
    v14[5] = &v15;
    v14[6] = a2;
    objc_msgSend(v13, "performBlockAndWait:", v14);
  }
  if (-[TDDistiller isCancelled](self, "isCancelled"))
  {
    *((_BYTE *)v16 + 24) = 0;
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", CFSTR("Distill aborted. No data written to CAR"));
  }

  self->_assetStore = 0;
  self->_renditionEntries = 0;
  objc_autoreleasePoolPop(v5);
  -[TDDistiller finishDistillationWithSuccess:](self, "finishDistillationWithSuccess:", *((unsigned __int8 *)v16 + 24));
  _Block_object_dispose(&v15, 8);
}

uint64_t __24__TDDistiller__distill___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  id obj;
  id obja;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40[128];
  char __str[256];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "distillCatalogGlobals");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "distillThemeAppearances");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "distillLocalizationss");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "distillCustomColors");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "distillCustomFonts");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "distillCustomFontSizes");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "distillNamedElements");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  v3 = objc_msgSend(*(id *)(a1 + 32), "distillCursorFacetDefinitions");
  v4 = *(id **)(a1 + 32);
  if ((v3 & 1) == 0)
  {
    v20 = CFSTR("distilling Cursor Facet Definitions failed");
LABEL_32:
    result = objc_msgSend(v4, "_logErrorAndAccumulateDescription:", v20);
LABEL_33:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    return result;
  }
  objc_msgSend(v4, "setAssetStoreKeyFormatData:", objc_msgSend(*(id *)(a1 + 32), "keyFormatData"));
  objc_msgSend(*(id *)(a1 + 32), "setAssetStoreKeySemantics:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "renditionKeySemantics"));
  result = objc_msgSend(*(id *)(a1 + 32), "distillRenditions");
  if (!(_DWORD)result)
    goto LABEL_33;
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    goto LABEL_33;
  objc_msgSend(*(id *)(a1 + 32), "setAssetStorageVersion:", objc_msgSend(*(id *)(a1 + 32), "assetStoreVersionNumber"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deviceTraitsUsedForOptimization"))
  {
    v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deviceTraitsUsedForOptimization");
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v35, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "idiomValue")));
          objc_msgSend(v34, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "subtype")));
          v13 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "scale");
          objc_msgSend(v31, "addObject:", objc_msgSend(v13, "numberWithInteger:", llround(v14)));
          objc_msgSend(v33, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "graphicsFeatureSetClassValue")));
          objc_msgSend(v32, "addObject:", objc_msgSend(v12, "graphicsFeatureSetFallbackValues"));
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "memoryPerformanceClass")));
          objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "displayGamutValue")));
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "deploymentTargetValue")));
          if (objc_msgSend((id)objc_msgSend(v12, "hostedIdiomValues"), "count"))
            objc_msgSend(v30, "addObject:", objc_msgSend(v12, "hostedIdiomValues"));
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v9);
    }
    obja = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v27 = (void *)MEMORY[0x24BDD17C8];
    v26 = __arrayToString(v35);
    v25 = __arrayToString(v34);
    v24 = __arrayToString(v31);
    v23 = __arrayToString(v6);
    v22 = __arrayToString(v33);
    v15 = __arrayToString(v32);
    v16 = __arrayToString(v5);
    v17 = __arrayToString(v7);
    objc_msgSend(obja, "setThinningArguments:", objc_msgSend(v27, "stringWithFormat:", CFSTR("optimized <idiom %@> <subtype %@> <scale %@> <gamut %@> <graphics %@> <graphicsfallback %@> <memory %@> <deployment %@> <hostedIdioms %@>"), v26, v25, v24, v23, v22, v15, v16, v17, __arrayToString(v30)));

  }
  snprintf(__str, 0x100uLL, "%s", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetStoreVersionString"), "UTF8String"));
  objc_msgSend(*(id *)(a1 + 32), "setAssetStorageVersionString:", __str);
  v18 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "metadatumForKey:", CFSTR("CoreThemeSchemaVersion"));
  if (v18)
    v19 = objc_msgSend(v18, "unsignedIntValue");
  else
    v19 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setAssetSchemaVersion:", v19);
  v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "uuid");
  if (!v21)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TDDistiller.m"), 1497, CFSTR("No document uuid!"));
    v4 = *(id **)(a1 + 32);
    v20 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-[TDDistiller _distill:] is surprised that %@ doesn't have a uuid!"), objc_msgSend(v4[1], "displayName"));
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAssetStoreUuid:", v21);
  objc_msgSend(*(id *)(a1 + 32), "setAssetStoreAssociatedChecksum:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "checksum"));
  objc_msgSend(*(id *)(a1 + 32), "setAssetColorSpaceID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "colorSpaceID"));
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_logErrorAndAccumulateDescription:", CFSTR("Failed to write to CAR"));
  result = objc_msgSend(*(id *)(a1 + 32), "assetStoreWriteToDisk");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_logErrorAndAccumulateDescription:", CFSTR("Failed to write to CAR"));
  return result;
}

- (void)saveAndDistillWithCompletionHandler:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  -[CoreThemeDocument _processModelProductions](self->_document, "_processModelProductions");
  if (!-[TDDistiller dontPackRenditionsBeforeDistilling](self, "dontPackRenditionsBeforeDistilling"))
  {
    if (-[TDDistiller isIncremental](self, "isIncremental"))
      -[CoreThemeDocument incrementallyPackRenditionsSinceDate:error:](self->_document, "incrementallyPackRenditionsSinceDate:error:", -[TDDistiller dateOfLastDistill](self, "dateOfLastDistill"), &v6);
    else
      -[CoreThemeDocument packRenditionsError:](self->_document, "packRenditionsError:", &v6);
    if (v6)
      goto LABEL_7;
  }
  objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC"), "save:", &v7);
  if (v7)
  {
LABEL_7:
    if (a3)
    {
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
      -[TDDistiller setFinished:](self, "setFinished:", 1);
      -[TDDistiller setSuccessful:](self, "setSuccessful:", 0);
    }
  }
  else
  {
    -[TDDistiller setCompletionHandler:](self, "setCompletionHandler:", a3);
    if (-[TDDistiller isIncremental](self, "isIncremental"))
      v5 = sel__distillChanges_;
    else
      v5 = sel__distill_;
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", v5, self, 0);
  }
}

- (void)waitUntilFinished
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF40]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v3, self, sel_waitTimerDidFire_, 0, 0, 0.0);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  objc_msgSend(v5, "addTimer:forMode:", v4, CFSTR("DistillWaitRunLoopMode"));
  -[TDDistiller setCallbackThread:](self, "setCallbackThread:", objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"));
  if (!-[TDDistiller isFinished](self, "isFinished"))
  {
    do
      objc_msgSend(v5, "runMode:beforeDate:", CFSTR("DistillWaitRunLoopMode"), v3);
    while (!-[TDDistiller isFinished](self, "isFinished"));
  }
  objc_msgSend(v4, "invalidate");

  -[TDLogger waitForLoggingToComplete](-[TDDistiller logger](self, "logger"), "waitForLoggingToComplete");
}

- (void)cancelDistill
{
  if (-[TDDistiller isIncremental](self, "isIncremental"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDDistiller.m"), 1601, CFSTR("Cancelling incremental distill is not implemented."));
  -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", CFSTR("Canceling. Cleaning up."));
  -[TDDistiller setCancelled:](self, "setCancelled:", 1);
}

- (void)performSelectorOnCallbackThread:(SEL)a3 withObject:(id)a4 waitUntilDone:(BOOL)a5
{
  _BOOL8 v5;
  NSThread *v9;

  v5 = a5;
  v9 = -[TDDistiller callbackThread](self, "callbackThread");
  if (!v9)
    v9 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  -[TDDistiller performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", a3, v9, a4, v5, self->_mainThreadPerformRunLoopModes);
}

- (BOOL)isIncremental
{
  return self->_incremental;
}

- (void)setIncremental:(BOOL)a3
{
  self->_incremental = a3;
}

- (NSString)assetStoreVersionString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssetStoreVersionString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (int64_t)assetStoreVersionNumber
{
  return self->_assetStoreVersionNumber;
}

- (void)setAssetStoreVersionNumber:(int64_t)a3
{
  self->_assetStoreVersionNumber = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isSuccessful
{
  return self->_successful;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (TDLogger)logger
{
  return (TDLogger *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)dontPackRenditionsBeforeDistilling
{
  return self->_dontPackRenditionsBeforeDistilling;
}

- (void)setDontPackRenditionsBeforeDistilling:(BOOL)a3
{
  self->_dontPackRenditionsBeforeDistilling = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSString)accumulatedErrorDescription
{
  return self->_accumulatedErrorDescription;
}

- (void)setAccumulatedErrorDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSThread)callbackThread
{
  return (NSThread *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCallbackThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

@end
