@implementation CoreThemeDocument

+ (void)initialize
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *__stringp;

  __coreThemeLoggingEnabled = getenv("CoreThemeLoggingEnabled") != 0;
  v2 = getenv("CoreUI_PACKING");
  if (v2)
  {
    v3 = v2;
    v4 = strdup(v2);
    __stringp = v4;
    v5 = strsep(&__stringp, ":");
    v6 = strsep(&__stringp, ":");
    v7 = atoi(v5);
    __packing_max_area = v7;
    if (v6)
    {
      v8 = atoi(v6);
      __packing_imageSize_allowed = v8;
    }
    else
    {
      v8 = __packing_imageSize_allowed;
    }
    free(v4);
    NSLog(CFSTR("-[CoreThemeDocument initialize] CoreUI_PACKING set '%s' using value %d:%d"), v3, v7, v8);
  }
}

+ (int)maximumAreaOfPackableImageForScale:(unint64_t)a3
{
  return __packing_imageSize_allowed * a3;
}

- (void)setMinimumDeploymentVersion:(id)a3
{
  NSString *minimumDeploymentVersion;
  NSString *v6;
  NSArray *v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  int64_t v11;
  int majorVersion;
  void *v13;
  int v14;
  int minorVersion;
  uint64_t v16;

  minimumDeploymentVersion = self->_minimumDeploymentVersion;
  if (minimumDeploymentVersion != a3)
  {

    v6 = (NSString *)objc_msgSend(a3, "copy");
    self->_minimumDeploymentVersion = v6;
    v7 = -[NSString componentsSeparatedByString:](v6, "componentsSeparatedByString:", CFSTR("."));
    v8 = -[NSArray count](v7, "count");
    if (v8)
    {
      v9 = v8;
      self->_majorVersion = objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", 0), "intValue");
      if (v9 != 1)
      {
        self->_minorVersion = objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", 1), "intValue");
        if (v9 < 3)
          v10 = 0;
        else
          v10 = objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", 2), "intValue");
LABEL_8:
        self->_patchVersion = v10;
        if (-[CoreThemeDocument targetPlatform](self, "targetPlatform"))
        {
          if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 5)
            goto LABEL_23;
          v11 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
          majorVersion = self->_majorVersion;
          if (v11 == 4)
          {
            if (majorVersion < 2)
            {
              v13 = (void *)MEMORY[0x24BE28C20];
              if (majorVersion == 1)
                goto LABEL_27;
              goto LABEL_20;
            }
LABEL_23:
            v13 = (void *)MEMORY[0x24BE28C20];
            v16 = 2;
            goto LABEL_24;
          }
          if (majorVersion >= 9)
            goto LABEL_23;
          v13 = (void *)MEMORY[0x24BE28C20];
          if (majorVersion == 8)
          {
LABEL_27:
            v16 = 1;
            goto LABEL_24;
          }
        }
        else
        {
          v14 = self->_majorVersion;
          if (v14 >= 10)
          {
            if (v14 != 10)
              goto LABEL_23;
            minorVersion = self->_minorVersion;
            if (minorVersion > 10)
              goto LABEL_23;
            if (minorVersion >= 10)
            {
              v13 = (void *)MEMORY[0x24BE28C20];
              goto LABEL_27;
            }
          }
          v13 = (void *)MEMORY[0x24BE28C20];
        }
LABEL_20:
        v16 = 0;
LABEL_24:
        objc_msgSend(v13, "setFileEncoding:", v16);
        goto LABEL_25;
      }
    }
    else
    {
      self->_majorVersion = 0x7FFFFFFF;
    }
    v10 = 0;
    self->_minorVersion = 0;
    goto LABEL_8;
  }
LABEL_25:
  -[CoreThemeDocument _updateDeviceTraits](self, "_updateDeviceTraits");
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)patchVersion
{
  return self->_patchVersion;
}

- (TDDeviceTraits)optimizeForDeviceTraits
{
  return (TDDeviceTraits *)-[NSMutableArray firstObject](self->_deviceTraits, "firstObject");
}

- (void)setOptimizeForDeviceTraits:(id)a3
{
  if (a3)
    -[CoreThemeDocument addDeviceTraitForOptimization:](self, "addDeviceTraitForOptimization:");
  else
    -[CoreThemeDocument removeDeviceTraitsForOptimization](self, "removeDeviceTraitsForOptimization");
}

- (void)addDeviceTraitForOptimization:(id)a3
{
  NSMutableArray *deviceTraits;
  id v6;

  if (a3)
  {
    deviceTraits = self->_deviceTraits;
    if (!deviceTraits)
    {
      deviceTraits = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->_deviceTraits = deviceTraits;
    }
    -[NSMutableArray addObject:](deviceTraits, "addObject:", a3);
    if (objc_msgSend(a3, "dynamicDisplayModeValue") == 1)
    {
      v6 = (id)objc_msgSend(a3, "copyWithZone:", -[CoreThemeDocument zone](self, "zone"));
      objc_msgSend(v6, "setScale:", 1.0);
      objc_msgSend(v6, "setDisplayGamut:", CFSTR("sRGB"));
      -[NSMutableArray addObject:](self->_deviceTraits, "addObject:", v6);

    }
  }
}

- (void)removeDeviceTraitsForOptimization
{

  self->_deviceTraits = 0;
}

- (id)deviceTraitsUsedForOptimization
{
  return self->_deviceTraits;
}

- (BOOL)shouldGenerateScale:(unsigned int)a3
{
  NSMutableArray *deviceTraits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  deviceTraits = self->_deviceTraits;
  if (!deviceTraits)
  {
LABEL_11:
    LOBYTE(v5) = 1;
    return v5;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deviceTraits, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = (double)a3;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(deviceTraits);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "scale");
      if (v10 == v8)
        goto LABEL_11;
      if (v6 == ++v9)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deviceTraits, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        LOBYTE(v5) = 0;
        if (v6)
          goto LABEL_4;
        return v5;
      }
    }
  }
  return v5;
}

- (void)updateRenditionSpec:(id)a3
{
  int64_t v5;
  int majorVersion;
  _BOOL8 v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  int v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[CoreThemeDocument targetPlatform](self, "targetPlatform"))
    {
      if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") != 5
        && (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 1
         || -[CoreThemeDocument targetPlatform](self, "targetPlatform") == 4
         || -[CoreThemeDocument targetPlatform](self, "targetPlatform") == 3
         || -[CoreThemeDocument targetPlatform](self, "targetPlatform") == 2))
      {
        v5 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
        majorVersion = self->_majorVersion;
        if (v5 != 4)
        {
          if (majorVersion < 8 || (v10 = 1, majorVersion == 8) && self->_minorVersion < 0)
            v10 = 0;
          objc_msgSend(a3, "setAllowsMultiPassEncoding:", v10);
          objc_msgSend(a3, "setAllowsOptimalRowbytesPacking:", v10);
          v11 = self->_majorVersion;
          if (v11 > 8)
            goto LABEL_20;
          v7 = 0;
          if (v11 == 8 && self->_minorVersion >= 4)
            goto LABEL_20;
          goto LABEL_19;
        }
        v7 = majorVersion > 1;
LABEL_18:
        objc_msgSend(a3, "setAllowsMultiPassEncoding:", v7);
LABEL_19:
        objc_msgSend(a3, "setAllowsOptimalRowbytesPacking:", v7);
LABEL_20:
        objc_msgSend(a3, "setAllowsCompactCompression:", -[CoreThemeDocument shouldSupportCompactCompression](self, "shouldSupportCompactCompression"));
        return;
      }
    }
    else
    {
      v8 = self->_majorVersion;
      if (v8 < 10 || (v8 == 10 ? (v9 = self->_minorVersion <= 9) : (v9 = 0), v9))
      {
        v7 = 0;
        goto LABEL_18;
      }
    }
    v7 = 1;
    goto LABEL_18;
  }
}

- (BOOL)shouldSupportCompactCompression
{
  return -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 10);
}

- (BOOL)shouldAllowPaletteImageCompression
{
  return -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 11);
}

- (BOOL)shouldAllowPaletteImageCompressionForDeploymentTarget:(unsigned int)a3
{
  return a3 > 2;
}

- (BOOL)shouldAllowHevcCompression
{
  return !-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 20)
      && -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 12);
}

- (BOOL)shouldAllowHevcCompressionForDeploymentTarget:(unsigned int)a3
{
  _BOOL4 v4;

  v4 = !-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 20);
  return a3 > 2 && v4;
}

- (BOOL)shouldAllowDeepmapCompression
{
  return -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 13);
}

- (BOOL)shouldAllowDeepmapCompressionForDeploymentTarget:(unsigned int)a3
{
  return a3 > 2;
}

+ (BOOL)deepmap2CompressionEnabled
{
  return 1;
}

- (BOOL)shouldAllowDeepmap2Compression
{
  return -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 14);
}

- (BOOL)shouldAllowDeepmap2CompressionForDeploymentTarget:(unsigned int)a3
{
  return a3 > 4;
}

- (BOOL)shouldCreateForwardstopForLossy
{
  return !-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 12);
}

- (BOOL)shouldCreate2018ForwardstopForLossless
{
  if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 11))
    return 0;
  else
    return !-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 13);
}

- (BOOL)shouldCreate2019ForwardstopForLossless
{
  return !-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 14);
}

- (void)changedObjectsNotification:(id)a3
{
  void *v5;
  void *v6;

  if (objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[TDPersistentDocument managedObjectContext](self, "managedObjectContext")))
  {
    v5 = (void *)objc_msgSend(a3, "userInfo");
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBB430]), "allObjects"));
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBB598]), "allObjects"));
    objc_msgSend(-[CoreThemeDocument historian](self, "historian"), "updateEntriesForManagedObjects:", v6);
  }
}

- (id)_predicateForRenditionKeySpec:(id)a3
{
  const __CFString *v4;
  char *v5;
  void *v6;
  char **v7;
  const __CFString *v8;
  char *v9;
  char **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[11];
  const __CFString *v17;
  char *v18;
  const __CFString *v19;
  _QWORD v20[30];

  v20[29] = *MEMORY[0x24BDAC8D0];
  v17 = CFSTR("part");
  v18 = sel_part;
  v19 = CFSTR("direction");
  v20[0] = sel_direction;
  v20[1] = CFSTR("state");
  v20[2] = sel_state;
  v20[3] = CFSTR("presentationState");
  v20[4] = sel_presentationState;
  v20[5] = CFSTR("size");
  v20[6] = sel_size;
  v20[7] = CFSTR("element");
  v20[8] = sel_element;
  v20[9] = CFSTR("value");
  v20[10] = sel_value;
  v20[11] = CFSTR("layer");
  v20[12] = sel_layer;
  v20[13] = CFSTR("idiom");
  v20[14] = sel_idiom;
  v20[15] = CFSTR("graphicsFeatureSetClass");
  v20[16] = sel_graphicsFeatureSetClass;
  v20[17] = CFSTR("sizeClassHorizontal");
  v20[18] = sel_sizeClassHorizontal;
  v20[19] = CFSTR("sizeClassVertical");
  v20[20] = sel_sizeClassVertical;
  v20[21] = CFSTR("appearance");
  v20[22] = sel_appearance;
  v20[23] = CFSTR("localization");
  v20[24] = sel_localization;
  v20[25] = CFSTR("target");
  v20[26] = sel_target;
  v20[27] = 0;
  v20[28] = 0;
  v4 = CFSTR("nameIdentifier");
  v5 = sel_nameIdentifier;
  v15 = CFSTR("dimension1");
  v16[0] = sel_dimension1;
  v16[1] = CFSTR("dimension2");
  v16[2] = sel_dimension2;
  v16[3] = CFSTR("scaleFactor");
  v16[4] = sel_scaleFactor;
  v16[5] = CFSTR("subtype");
  v16[6] = sel_subtype;
  v16[7] = CFSTR("memoryClass");
  v16[8] = sel_memoryClass;
  v16[9] = 0;
  v16[10] = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 21);
  v7 = (char **)v16;
  do
  {
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("keySpec.%K == %d"), v4, objc_msgSend(a3, "performSelector:", v5)));
    v4 = (const __CFString *)*(v7 - 1);
    v5 = *v7;
    v7 += 2;
  }
  while (v4);
  v8 = v17;
  if (v17)
  {
    v9 = v18;
    v10 = (char **)v20;
    do
    {
      v11 = (void *)objc_msgSend(a3, "performSelector:", v9);
      if (v11)
        v12 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("keySpec.%K.identifier == %d"), v8, objc_msgSend(v11, "identifier"));
      else
        v12 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("( keySpec.%K.identifier == 0 OR keySpec.%K == NULL)"), v8, v8);
      objc_msgSend(v6, "addObject:", v12);
      v8 = (const __CFString *)*(v10 - 1);
      v9 = *v10;
      v10 += 2;
    }
    while (v8);
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v6);

  return v13;
}

- (void)_getFilename:(id *)a3 scaleFactor:(unsigned int *)a4 category:(id *)a5 bitSource:(id *)a6 forFileURL:(id)a7
{
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  id v21;
  uint64_t v22;
  void *v23;
  char isKindOfClass;

  v13 = (void *)objc_msgSend(a7, "lastPathComponent");
  v14 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", v13);
  v15 = objc_msgSend(-[CoreThemeDocument rootPathForProductionData](self, "rootPathForProductionData"), "td_stringByStandardizingPath");
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_msgSend((id)objc_msgSend(a7, "URLByStandardizingPath"), "path");
    if (objc_msgSend(v17, "rangeOfString:options:", v16, 8))
    {
      if (a5)
        *a5 = 0;
      if (a6)
        *a6 = 0;
    }
    else
    {
      v18 = (__CFString *)objc_msgSend((id)objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v16, "length")+ (objc_msgSend((id)objc_msgSend(v16, "substringWithRange:", objc_msgSend(v16, "length") - 1, 1), "isEqualToString:", CFSTR("/")) ^ 1)), "stringByDeletingLastPathComponent");
      v19 = (void *)-[__CFString pathComponents](v18, "pathComponents");
      if ((!-[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("hasNoBitSource"))
         || -[CoreThemeDocument isCustomLook](self, "isCustomLook"))
        && objc_msgSend(v19, "count"))
      {
        v20 = (__CFString *)objc_msgSend(v19, "objectAtIndex:", 0);
      }
      else
      {
        v20 = &stru_24EF2D4A8;
      }
      if (-[__CFString length](v20, "length") && (unint64_t)objc_msgSend(v19, "count") >= 2)
      {
        v18 = (__CFString *)-[__CFString substringFromIndex:](v18, "substringFromIndex:", -[__CFString length](v20, "length") + 1);
      }
      else if (-[__CFString length](v20, "length"))
      {
        v18 = &stru_24EF2D4A8;
      }
      if (a6)
      {
        v21 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("ThemeBitSource"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("path == %@"), v20), 0);
        v22 = objc_msgSend(v21, "count");
        v23 = 0;
        if (v22 == 1)
        {
          objc_msgSend(v21, "objectAtIndex:", 0);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v23 = 0;
          if ((isKindOfClass & 1) != 0)
            v23 = (void *)objc_msgSend(v21, "objectAtIndex:", 0);
        }
        *a6 = v23;
      }
      if (a5)
        *a5 = v18;
    }
  }
  if (a3)
    *a3 = v13;
  if (a4)
    *a4 = v14;
}

+ (id)_sharedDocumentList
{
  if (_sharedDocumentList_pred != -1)
    dispatch_once(&_sharedDocumentList_pred, &__block_literal_global_3);
  return (id)sDocList;
}

uint64_t __40__CoreThemeDocument__sharedDocumentList__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  sDocList = result;
  return result;
}

+ (void)_addThemeDocument:(id)a3
{
  objc_msgSend(a1, "_sharedDocumentList");
  objc_msgSend((id)sDocList, "addObject:", a3);
}

- (CoreThemeDocument)init
{
  CoreThemeDocument *v2;
  TDThreadMOCOrganizer *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CoreThemeDocument;
  v2 = -[CoreThemeDocument init](&v6, sel_init);
  if (v2)
  {
    v2->constantArrayControllers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->cachedConstantArrays = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->_cachedAppearances = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_cachedUnknownAppearanceIds = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v2->_cachedLocalizations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_cachedUnknownLocalizationIds = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v2->_cachedModelAssets = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CoreThemeDocument primeArrayControllers](v2, "primeArrayControllers");
    v3 = [TDThreadMOCOrganizer alloc];
    v2->m_mocOrganizer = -[TDThreadMOCOrganizer initWithDocument:mainThread:](v3, "initWithDocument:mainThread:", v2, objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"));
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_changedObjectsNotification_, *MEMORY[0x24BDBB468], 0);
    -[CoreThemeDocument setTargetPlatform:](v2, "setTargetPlatform:", objc_msgSend((id)objc_opt_class(), "defaultTargetPlatform"));
    v2->_majorVersion = 0x7FFFFFFF;
    v2->_minorVersion = 0x7FFFFFFF;
    v2->_patchVersion = 0x7FFFFFFF;
  }
  return v2;
}

- (CoreThemeDocument)initWithType:(id)a3 targetPlatform:(int64_t)a4 error:(id *)a5
{
  CoreThemeDocument *v7;
  CoreThemeDocument *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CoreThemeDocument;
  v7 = -[TDPersistentDocument initWithType:error:](&v11, sel_initWithType_error_, a3, a5);
  v8 = v7;
  if (v7)
  {
    v7->_majorVersion = 0x7FFFFFFF;
    v7->_minorVersion = 0x7FFFFFFF;
    v7->_patchVersion = 0x7FFFFFFF;
    v9 = -[CoreThemeDocument buildModelError:](v7, "buildModelError:", a5);
    -[CoreThemeDocument setTargetPlatform:](v8, "setTargetPlatform:", a4);
    if (!v9)
    {

      return 0;
    }
  }
  return v8;
}

- (CoreThemeDocument)initWithType:(id)a3 error:(id *)a4
{
  CoreThemeDocument *v5;
  CoreThemeDocument *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CoreThemeDocument;
  v5 = -[TDPersistentDocument initWithType:error:](&v8, sel_initWithType_error_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_majorVersion = 0x7FFFFFFF;
    v5->_minorVersion = 0x7FFFFFFF;
    v5->_patchVersion = 0x7FFFFFFF;
    if (!-[CoreThemeDocument buildModelError:](v5, "buildModelError:", a4))
    {

      return 0;
    }
  }
  return v6;
}

- (CoreThemeDocument)initWithContentsOfURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  CoreThemeDocument *v6;
  CoreThemeDocument *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CoreThemeDocument;
  v6 = -[TDPersistentDocument initWithContentsOfURL:ofType:error:](&v9, sel_initWithContentsOfURL_ofType_error_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_majorVersion = 0x7FFFFFFF;
    v6->_minorVersion = 0x7FFFFFFF;
    v6->_patchVersion = 0x7FFFFFFF;
    if (!-[CoreThemeDocument buildModelError:](v6, "buildModelError:", a5))
    {

      return 0;
    }
  }
  return v7;
}

+ (id)createConfiguredDocumentAtURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "createConfiguredDocumentAtURL:targetPlatform:error:", a3, objc_msgSend((id)objc_opt_class(), "defaultTargetPlatform"), a4);
}

+ (id)createConfiguredDocumentAtURL:(id)a3 targetPlatform:(int64_t)a4 error:(id *)a5
{
  id v8;
  id result;
  id v10;

  v8 = objc_alloc((Class)a1);
  result = (id)objc_msgSend(v8, "initWithType:targetPlatform:error:", CoreThemeDocumentFileType, a4, a5);
  if (result)
  {
    v10 = result;
    objc_msgSend(result, "setFileURL:", a3);
    if (objc_msgSend((id)objc_msgSend(v10, "managedObjectContext"), "save:", a5))
    {
      objc_msgSend(v10, "_configureAfterFirstSave");
      if (objc_msgSend((id)objc_msgSend(v10, "managedObjectContext"), "save:", a5))
        return v10;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (int64_t)dataModelVersionFromMetadata:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("CoreThemeDefinitionDataModelKey"));
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSProThemeDefinitionDataModelKey"));
  if (v4)
    v5 = (void *)v4;
  return objc_msgSend(v5, "integerValue");
}

+ (id)migrateDocumentAtURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v8;
  CoreThemeDefinitionMigrator *v9;
  CoreThemeDefinitionMigrator *v10;
  uint64_t v11;
  void *v12;

  v8 = objc_msgSend(MEMORY[0x24BDBB738], "metadataForPersistentStoreOfType:URL:options:error:", *MEMORY[0x24BDBB580], a3, 0, a5);
  if (!v8)
    return 0;
  v9 = -[CoreThemeDefinitionMigrator initWithURL:oldVersion:newVersion:]([CoreThemeDefinitionMigrator alloc], "initWithURL:oldVersion:newVersion:", a3, objc_msgSend(a1, "dataModelVersionFromMetadata:", v8), objc_msgSend(a1, "dataModelVersion"));
  if (!v9)
  {
    if (a5)
    {
      v12 = 0;
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Unrecognized document format, migration failed"), CFSTR("reason")));
      return v12;
    }
    return 0;
  }
  v10 = v9;
  objc_msgSend(a1, "presentMigrationProgress");
  if (-[CoreThemeDefinitionMigrator migrateWithError:](v10, "migrateWithError:", a5))
  {
    v11 = -[CoreThemeDefinitionMigrator temporaryMigrationPath](v10, "temporaryMigrationPath");
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
    NSLog(CFSTR("Created temporary migration file at path: %@"), v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(a1, "closeMigrationProgress");
  return v12;
}

- (void)dealloc
{
  _renditionkeyfmt *keyFormat;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  keyFormat = self->_keyFormat;
  if (keyFormat)
    free(keyFormat);
  -[CoreThemeDocument setPathToRepresentedDocument:](self, "setPathToRepresentedDocument:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CoreThemeDocument;
  -[TDPersistentDocument dealloc](&v4, sel_dealloc);
}

- (id)updateToEmbeddedSchemaVersion2AndReturnAlertString:(id *)a3
{
  id v4;
  id v5;
  CoreThemeDocument *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  id obj;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = -[CoreThemeDocument _namedTextEffectPartDefinition](self, "_namedTextEffectPartDefinition", a3);
  v22 = -[CoreThemeDocument _namedImageEffectPartDefinition](self, "_namedImageEffectPartDefinition");
  v5 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 178);
  v21 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = v4;
  v6 = self;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("EffectStyleProduction"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("partDefinition = %@"), v4), 0);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v11, "baseKeySpec"), "setPart:", v5);
        objc_msgSend(v11, "setPartDefinition:", v22);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = (void *)objc_msgSend(v11, "renditions");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "keySpec"), "setPart:", v5);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }
        v17 = -[CoreThemeDocument createEffectStyleProductionForPartDefinition:withNameIdentifier:](v6, "createEffectStyleProductionForPartDefinition:withNameIdentifier:", v23, objc_msgSend((id)objc_msgSend(v11, "name"), "identifier"));
        objc_msgSend(v21, "addObject:", objc_msgSend((id)objc_msgSend(v11, "name"), "name"));
        objc_msgSend(v20, "addObject:", v17);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }
  return CFSTR("Named Effects now support both high quality and simplified text variants. Your original effect definitions have been classified as 'High Quality Image Effects' and new 'Simplified Text Effect' effect definitions have been created with the same name, using default values. Adjust your effect definitions accordingly.");
}

- (id)managedObjectModel
{
  id result;
  void *v4;
  id v5;

  result = self->m_managedObjectModel;
  if (!result)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreThemeDefinition"));
    v5 = objc_alloc(MEMORY[0x24BDBB6B0]);
    result = (id)objc_msgSend(v5, "initWithContentsOfURL:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend(v4, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", +[CoreThemeDocument dataModelVersion](CoreThemeDocument, "dataModelVersion")), CFSTR("mom"))));
    self->m_managedObjectModel = (NSManagedObjectModel *)result;
    if (!result)
    {
      NSLog(CFSTR("-[CoreThemeDocument managedObjectModel] couldn't load %@"), objc_msgSend(v4, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", +[CoreThemeDocument dataModelVersion](CoreThemeDocument, "dataModelVersion")), CFSTR("mom")));
      return self->m_managedObjectModel;
    }
  }
  return result;
}

- (id)mocOrganizer
{
  return self->m_mocOrganizer;
}

- (id)historian
{
  id result;

  result = self->m_historian;
  if (!result)
  {
    result = -[TDHistorian initWithDocument:]([TDHistorian alloc], "initWithDocument:", self);
    self->m_historian = (TDHistorian *)result;
  }
  return result;
}

- (id)_cachedConstantsForEntity:(id)a3
{
  id v5;
  void *v6;

  v5 = (id)-[NSMutableDictionary objectForKey:](self->cachedConstantArrays, "objectForKey:");
  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("identifier"), 1);
    v5 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", a3, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6));

    if (v5)
      -[NSMutableDictionary setObject:forKey:](self->cachedConstantArrays, "setObject:forKey:", v5, a3);
  }
  return v5;
}

- (id)themeConstant:(id)a3 withIdentifier:(int64_t)a4
{
  int v4;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a4 > 0xFFFFFFFE)
    return 0;
  v4 = a4;
  v7 = -[CoreThemeDocument _cachedConstantsForEntity:](self, "_cachedConstantsForEntity:");
  if (!objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("identifier"), 1);
    v7 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", a3, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = *(_QWORD *)v16;
LABEL_6:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v11)
      objc_enumerationMutation(v7);
    v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
    if (objc_msgSend(v13, "identifier") == v4)
      return v13;
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v10)
        goto LABEL_6;
      return v13;
    }
  }
}

- (id)elementWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeElement"), a3);
}

- (id)partWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemePart"), a3);
}

- (id)sizeWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeSize"), a3);
}

- (id)directionWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeDirection"), a3);
}

- (id)stateWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeState"), a3);
}

- (id)previousStateWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeState"), a3);
}

- (id)presentationStateWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemePresentationState"), a3);
}

- (id)valueWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeValue"), a3);
}

- (id)previousValueWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeValue"), a3);
}

- (id)drawingLayerWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeDrawingLayer"), a3);
}

- (id)idiomWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeIdiom"), a3);
}

- (id)graphicsFeatureSetClassWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeGraphicsFeatureSetClass"), a3);
}

- (id)displayGamutWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeDisplayGamut"), a3);
}

- (id)deploymentTargetWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeDeploymentTarget"), a3);
}

- (id)sizeClassWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeUISizeClass"), a3);
}

- (id)templateRenderingModeWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("RenderingMode"), a3);
}

- (id)compressionTypeWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeCompressionType"), a3);
}

- (id)schemaCategoryWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("SchemaCategory"), a3);
}

- (id)effectTypeWithIdentifier:(unsigned int)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("EffectType"), a3);
}

- (id)effectParameterTypeWithIdentifier:(unsigned int)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("EffectParameterType"), a3);
}

- (id)effectParameterValueWithType:(unsigned int)a3 inComponent:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(a4, "parameters");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v14 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v13);
      if (objc_msgSend((id)objc_msgSend(v14, "parameterType"), "identifier") == (_DWORD)v7)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
  }
  if (!v14 && v5)
  {
    v14 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("EffectParameterValue"));
    objc_msgSend(v14, "setComponent:", a4);
    v15 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("EffectParameterType"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier == %d"), v7), 0);
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v14, "setParameterType:", objc_msgSend(v15, "objectAtIndex:", 0));
      v16 = v7 - 2;
      if ((v7 - 2) > 6)
      {
        v18 = &unk_24EF40948;
        v17 = &unk_24EF408D0;
        v19 = &unk_24EF408D0;
      }
      else
      {
        v17 = *(&off_24EF2C558 + v16);
        v18 = (void *)qword_24EF2C590[v16];
        v19 = *(&off_24EF2C5C8 + v16);
      }
      objc_msgSend(v14, "setIntValue:", v17);
      objc_msgSend(v14, "setColorValue:", &unk_24EF408D0);
      objc_msgSend(v14, "setFloatValue:", v18);
      objc_msgSend(v14, "setAngleValue:", v19);
      v20 = objc_msgSend((id)objc_msgSend(a4, "effectType"), "identifier");
      if ((_DWORD)v7 == 2 && v20 == 1397715043)
        objc_msgSend(v14, "setFloatValue:", &unk_24EF40968);
      v21 = objc_msgSend((id)objc_msgSend(a4, "effectType"), "identifier");
      if ((_DWORD)v7 == 2 && v21 == 1180787813)
        objc_msgSend(v14, "setFloatValue:", &unk_24EF40968);
    }
  }
  return v14;
}

- (id)effectComponentWithType:(unsigned int)a3 inRendition:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (void *)objc_msgSend(a4, "components");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v9);
      v14 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v13);
      if (objc_msgSend((id)objc_msgSend(v14, "effectType"), "identifier") == (_DWORD)v7)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
  }
  if (!v14 && v5)
  {
    v14 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("EffectComponent"));
    objc_msgSend(v14, "setEffectType:", -[CoreThemeDocument effectTypeWithIdentifier:](self, "effectTypeWithIdentifier:", v7));
    v15 = (void *)objc_msgSend(MEMORY[0x24BE28C78], "requiredEffectParametersForEffectType:", v7);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[CoreThemeDocument effectParameterValueWithType:inComponent:createIfNeeded:](self, "effectParameterValueWithType:inComponent:createIfNeeded:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "unsignedIntValue"), v14, 1);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }
    objc_msgSend(v14, "setRendition:", a4);
  }
  return v14;
}

- (id)renditionTypeWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("RenditionType"), a3);
}

- (id)renditionSubtypeWithIdentifier:(unsigned int)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("RenditionSubtype"), a3);
}

- (id)iterationTypeWithIdentifier:(int)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("IterationType"), a3);
}

- (id)pixelFormatWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("TexturePixelFormat"), a3);
}

- (id)textureFaceWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("TextureFace"), a3);
}

- (id)textureInterpretaitionWithIdentifier:(unsigned int)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("TextureInterpretation"), a3);
}

- (id)constantWithName:(id)a3 forIdentifier:(int64_t)a4
{
  id v6;

  v6 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", a3, objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %ld"), a4), 0);
  if (objc_msgSend(v6, "count"))
    return (id)objc_msgSend(v6, "objectAtIndex:", 0);
  else
    return -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", a3);
}

- (id)psdImageRefForAsset:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(-[CoreThemeDocument rootPathForProductionData](self, "rootPathForProductionData"), "stringByAppendingPathComponent:", objc_msgSend(a3, "sourceRelativePath"));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v3))
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE28C60]), "initWithPath:", v3);
  else
    return 0;
}

- (id)appearanceWithIdentifier:(int64_t)a3
{
  void *v6;
  NSMutableArray *cachedAppearances;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((-[NSMutableSet containsObject:](self->_cachedUnknownAppearanceIds, "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:")) & 1) != 0)return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  cachedAppearances = self->_cachedAppearances;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachedAppearances, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(cachedAppearances);
      v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
      if (objc_msgSend(v6, "identifier") == a3)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachedAppearances, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    if (v6)
      return v6;
  }
LABEL_13:
  v12 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Appearance"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %d"), a3), 0);
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1395, CFSTR("more than one appearance with identifier %d"), (unsigned __int16)a3);
  v6 = (void *)objc_msgSend(v12, "firstObject");
  if (v6)
    -[NSMutableArray addObject:](self->_cachedAppearances, "addObject:", v6);
  return v6;
}

- (id)appearanceWithIdentifier:(int64_t)a3 name:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v10;
  id v11;

  v5 = a5;
  v10 = -[CoreThemeDocument appearanceWithIdentifier:](self, "appearanceWithIdentifier:");
  if (v10)
  {
    v11 = v10;
    if (!a4)
      return v11;
  }
  else if (!a4
         || !v5
         || (v11 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Appearance")),
             objc_msgSend(v11, "setIdentifier:", (unsigned __int16)a3),
             objc_msgSend(v11, "setName:", a4),
             -[NSMutableArray addObject:](self->_cachedAppearances, "addObject:", v11),
             v11,
             !v11))
  {
    -[NSMutableSet addObject:](self->_cachedUnknownAppearanceIds, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3));
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(v11, "name"), "isEqualToString:", a4) & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1424, CFSTR("different appearance identifier for appearance name, got %ld but previously got %ld"), a3, objc_msgSend(v11, "identifier"));
  return v11;
}

- (id)localizationWithIdentifier:(int64_t)a3
{
  void *v6;
  NSMutableArray *cachedLocalizations;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((-[NSMutableSet containsObject:](self->_cachedUnknownLocalizationIds, "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:")) & 1) != 0)return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  cachedLocalizations = self->_cachedLocalizations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachedLocalizations, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(cachedLocalizations);
      v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
      if (objc_msgSend(v6, "identifier") == a3)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachedLocalizations, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    if (v6)
      return v6;
  }
LABEL_13:
  v12 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Localization"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %d"), a3), 0);
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1451, CFSTR("more than one localization with identifier %d"), (unsigned __int16)a3);
  v6 = (void *)objc_msgSend(v12, "firstObject");
  if (v6)
    -[NSMutableArray addObject:](self->_cachedLocalizations, "addObject:", v6);
  return v6;
}

- (id)localizationWithIdentifier:(int64_t)a3 name:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v10;
  id v11;

  v5 = a5;
  v10 = -[CoreThemeDocument localizationWithIdentifier:](self, "localizationWithIdentifier:");
  if (v10)
  {
    v11 = v10;
    if (!a4)
      return v11;
  }
  else if (!a4
         || !v5
         || (v11 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Localization")),
             objc_msgSend(v11, "setIdentifier:", (unsigned __int16)a3),
             objc_msgSend(v11, "setName:", a4),
             -[NSMutableArray addObject:](self->_cachedLocalizations, "addObject:", v11),
             v11,
             !v11))
  {
    -[NSMutableSet addObject:](self->_cachedUnknownLocalizationIds, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3));
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(v11, "name"), "isEqualToString:", a4) & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1481, CFSTR("Different localization identifier %ld for localization name, got %@ but previously got %@ getting different name identifier pairs"), a3, a4, objc_msgSend(v11, "name"));
  return v11;
}

- (id)glyphWeightWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeGlyphWeight"), a3);
}

- (id)glyphSizeWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("ThemeGlyphSize"), a3);
}

- (id)vectorGlyphRenderingModeWithIdentifier:(int64_t)a3
{
  return -[CoreThemeDocument themeConstant:withIdentifier:](self, "themeConstant:withIdentifier:", CFSTR("VectorGlyphRenderingMode"), a3);
}

- (id)mappingForPhotoshopLayerIndex:(int64_t)a3 themeDrawingLayerIdentifier:(int64_t)a4
{
  id v7;
  id v9;
  uint64_t v10;

  if (!a3)
    return 0;
  v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("LayerMapping"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("photoshopLayerIndex = %d AND themeDrawingLayer.identifier = %d"), a3, a4), 0);
  if (objc_msgSend(v7, "count"))
    return (id)objc_msgSend(v7, "objectAtIndex:", 0);
  v10 = objc_msgSend(-[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("ThemeDrawingLayer"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %d"), a4), 0), "objectAtIndex:", 0);
  v9 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("LayerMapping"));
  objc_msgSend(v9, "setPhotoshopLayerIndex:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3));
  objc_msgSend(v9, "setThemeDrawingLayer:", v10);
  return v9;
}

- (id)allObjectsForEntity:(id)a3 withSortDescriptors:(id)a4
{
  id v6;
  void *v8;
  id v9;

  v9 = 0;
  v6 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self, "allObjectsForEntity:withSortDescriptors:error:", a3, a4, &v9);
  if (v9)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1536, CFSTR("%@"), objc_msgSend(v9, "localizedDescription"));
  }
  return v6;
}

- (id)allObjectsForEntity:(id)a3 withSortDescriptors:(id)a4 error:(id *)a5
{
  return -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self, "objectsForEntity:withPredicate:sortDescriptors:error:", a3, 0, a4, a5);
}

- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5
{
  id v7;
  void *v9;
  id v10;

  v10 = 0;
  v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self, "objectsForEntity:withPredicate:sortDescriptors:error:", a3, a4, a5, &v10);
  if (v10)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1553, CFSTR("%@"), objc_msgSend(v10, "localizedDescription"));
  }
  return v7;
}

- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  return -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:withContext:error:](self, "objectsForEntity:withPredicate:sortDescriptors:withContext:error:", a3, a4, a5, objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC"), a6);
}

- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 withContext:(id)a6 error:(id *)a7
{
  id v13;
  void *v14;

  v13 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(v13, "setEntity:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3));
  if (a4)
    objc_msgSend(v13, "setPredicate:", a4);
  if (a5)
    objc_msgSend(v13, "setSortDescriptors:", a5);
  v14 = (void *)objc_msgSend(a6, "executeFetchRequest:error:", v13, a7);

  return v14;
}

- (unint64_t)countForEntity:(id)a3 withPredicate:(id)a4
{
  id v7;
  unint64_t v8;
  uint64_t v10;

  v7 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(v7, "setEntity:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3));
  if (a4)
    objc_msgSend(v7, "setPredicate:", a4);
  v10 = 0;
  v8 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC"), "countForFetchRequest:error:", v7, &v10);

  return v8;
}

- (id)newObjectForEntity:(id)a3
{
  uint64_t v6;
  void *v7;
  void *v8;

  v6 = objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  if (v6 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1605, CFSTR("-[CoreThemeDocument newObjectForEntity:] can only be called from the main thread."));
  v7 = (void *)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3);
  v8 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)objc_msgSend(v7, "managedObjectClassName"))), "initWithEntity:insertIntoManagedObjectContext:", v7, -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  if (!v8)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1610, CFSTR("object for entity %@ not created"), a3);
  return v8;
}

- (void)deleteObjects:(id)a3
{
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  if (v6 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1616, CFSTR("-[CoreThemeDocument deleteObjects:] can only be called from the main thread."));
  v7 = -[TDPersistentDocument managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_msgSend(a3, "objectEnumerator");
  v9 = objc_msgSend(v8, "nextObject");
  if (v9)
  {
    v10 = v9;
    do
    {
      objc_msgSend(v7, "deleteObject:", v10);
      v10 = objc_msgSend(v8, "nextObject");
    }
    while (v10);
  }
}

- (void)deleteObject:(id)a3
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  if (v6 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 1627, CFSTR("-[CoreThemeDocument deleteObject:] can only be called from the main thread."));
  objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "deleteObject:", a3);
}

- (void)deleteProduction:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  objc_msgSend(a3, "deleteRenditionsInDocument:shouldDeleteAssetFiles:", self, a4);
  -[CoreThemeDocument deleteObject:](self, "deleteObject:", a3);
}

- (void)deleteProductions:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a3);
        -[CoreThemeDocument deleteProduction:shouldDeleteAssetFiles:](self, "deleteProduction:shouldDeleteAssetFiles:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (id)minimalDisplayNameForThemeConstant:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a3, "displayName");
  v5 = objc_msgSend(a3, "identifier");
  return (id)objc_msgSend((id)objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24EF2D4A8), "stringByReplacingOccurrencesOfString:withString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d-"), v5), &stru_24EF2D4A8);
}

- (id)folderNameFromRenditionKey:(id)a3 forPartDefinition:(id)a4
{
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id result;

  v7 = objc_msgSend(a4, "partFeatures");
  v8 = (void *)objc_msgSend(a4, "element");
  v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "displayName"), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24EF2D4A8);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v8, "parts"), "count") < 2)
  {
    v10 = 0;
    if ((v7 & 0x200) != 0)
      goto LABEL_3;
  }
  else
  {
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "displayName"), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24EF2D4A8), "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_24EF2D4A8);
    if ((v7 & 0x200) != 0)
    {
LABEL_3:
      v11 = 0;
      goto LABEL_6;
    }
  }
  v11 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", objc_msgSend(a3, "themeSize")));
LABEL_6:
  if ((v7 & 0x38) != 0)
    v12 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", objc_msgSend(a3, "themeDirection")));
  else
    v12 = 0;
  if ((~v7 & 0x10004) != 0)
    v13 = 0;
  else
    v13 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", objc_msgSend(a3, "themePresentationState")));
  v14 = objc_msgSend(a3, "themeScale");
  if (v10)
    v9 = (void *)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v10);
  if (v11)
    v9 = (void *)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v11);
  if (v12)
    v9 = (void *)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v12);
  if (v13)
    v9 = (void *)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v13);
  result = v9;
  if (v14 == 2)
    return (id)objc_msgSend(v9, "stringByAppendingString:", CFSTR("@2x"));
  return result;
}

- (id)defaultPNGFileNameForSchemaRendition:(id)a3 withPartDefinition:(id)a4
{
  return (id)objc_msgSend(-[CoreThemeDocument defaultBaseFileNameForSchemaRendition:withPartDefinition:](self, "defaultBaseFileNameForSchemaRendition:withPartDefinition:", a3, a4), "stringByAppendingPathExtension:", CFSTR("png"));
}

- (id)defaultBaseFileNameForSchemaRendition:(id)a3 withPartDefinition:(id)a4
{
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;

  v7 = objc_msgSend(a4, "partFeatures");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend(a3, "key"));
  v9 = -[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](self, "folderNameFromRenditionKey:forPartDefinition:", v8, a4);
  v10 = objc_msgSend(v8, "themeScale");
  if (v10 == 2)
  {
    v11 = CFSTR("@2x");
    v9 = (id)objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@2x"), &stru_24EF2D4A8);
  }
  else
  {
    v11 = 0;
  }
  if ((*(_QWORD *)&v7 & 0x10004) == 4)
    v12 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", objc_msgSend(v8, "themePresentationState")));
  else
    v12 = 0;
  if (objc_msgSend(v8, "themeLayer") >= 1)
  {
    v13 = -[CoreThemeDocument drawingLayerWithIdentifier:](self, "drawingLayerWithIdentifier:", objc_msgSend(v8, "themeLayer"));
    goto LABEL_11;
  }
  if ((v7 & 0x1000) == 0)
  {
    v13 = -[CoreThemeDocument stateWithIdentifier:](self, "stateWithIdentifier:", objc_msgSend(v8, "themeState"));
LABEL_11:
    v14 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", v13);
    if ((v7 & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v14 = 0;
  if ((v7 & 0x4000) == 0)
  {
LABEL_12:
    if ((v7 & 1) != 0)
    {
      v15 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument valueWithIdentifier:](self, "valueWithIdentifier:", objc_msgSend(v8, "themeValue")));
      goto LABEL_17;
    }
LABEL_19:
    v18 = 0;
    if (!v12)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_15:
  v16 = objc_msgSend(a4, "cuiPartDefinition");
  v17 = objc_msgSend(v8, "themeDimension1");
  if (v17 >= objc_msgSend((id)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform")), "dimensionDefinitionCountForPartDefinition:", v16))goto LABEL_19;
  v15 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(v16 + 32 * v17 + 64)), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24EF2D4A8);
LABEL_17:
  v18 = v15;
  if (v12)
LABEL_20:
    v9 = (id)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v12);
LABEL_21:
  if (v14)
    v9 = (id)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v14);
  if (v18)
    v9 = (id)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v18);
  if (v10 == 2)
    v9 = (id)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%@"), v11);

  return v9;
}

- (id)defaultPathComponentsForPartDefinition:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "element"), "category"), "displayName"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "element"), "displayName"));
}

- (id)createReferencePNGForSchemaRendition:(id)a3 withPartDefinition:(id)a4 atLocation:(id)a5 error:(id *)a6
{
  id v10;
  const __CFURL *v11;
  CGImageDestination *v12;
  BOOL v13;

  v10 = -[CoreThemeDocument defaultPNGFileNameForSchemaRendition:withPartDefinition:](self, "defaultPNGFileNameForSchemaRendition:withPartDefinition:", a3, a4);
  if (a5)
  {
    v11 = (const __CFURL *)objc_msgSend(a5, "URLByAppendingPathComponent:", v10);
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", -[__CFURL path](v11, "path")) & 1) == 0)
    {
      -[CoreThemeDocument assetManagementDelegate](self, "assetManagementDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TDAssetManagementDelegate willCreateAssetAtURL:](-[CoreThemeDocument assetManagementDelegate](self, "assetManagementDelegate"), "willCreateAssetAtURL:", v11);
      v12 = CGImageDestinationCreateWithURL(v11, CFSTR("public.png"), 1uLL, 0);
      CGImageDestinationAddImage(v12, (CGImageRef)objc_msgSend((id)objc_msgSend(a3, "referenceImage"), "image"), 0);
      v13 = CGImageDestinationFinalize(v12);
      CFRelease(v12);
      if (!v13)
      {
        v10 = 0;
        if (a6)
          *a6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Unable to write image"), *MEMORY[0x24BDD0FC8]));
      }
    }
  }
  return v10;
}

- (id)_themeBitSource:(id *)a3
{
  id v4;

  v4 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("ThemeBitSource"), 0);
  if (objc_msgSend(v4, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
      NSLog(CFSTR("Expecting only one ThemeBitSource, but found %lu"), objc_msgSend(v4, "count"));
    return (id)objc_msgSend(v4, "objectAtIndex:", 0);
  }
  else
  {
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("No ThemeBitSource found"), *MEMORY[0x24BDD0FC8]));
    return 0;
  }
}

- (id)_themeBitSourceForReferencedFilesAtURLs:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSArray *v8;
  unint64_t UncommonItemInArrays;
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  TDThemeBitSource *v18;
  _QWORD v19[5];

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79__CoreThemeDocument__themeBitSourceForReferencedFilesAtURLs_createIfNecessary___block_invoke;
  v19[3] = &unk_24EF2C028;
  v19[4] = v7;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v19);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "lastObject"), "pathExtension"), "isEqualToString:", CFSTR("imagestack")))objc_msgSend(v7, "removeLastObject");
  v8 = -[NSURL pathComponents](-[TDPersistentDocument fileURL](self, "fileURL"), "pathComponents");
  UncommonItemInArrays = indexOfFirstUncommonItemInArrays(v7, v8);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = -[NSArray count](v8, "count");
  v12 = objc_msgSend(v7, "count");
  if (UncommonItemInArrays != 0x7FFFFFFFFFFFFFFFLL && UncommonItemInArrays < v11)
  {
    v13 = v12;
    if (UncommonItemInArrays < v11 - 1)
    {
      v14 = ~UncommonItemInArrays + v11;
      do
      {
        objc_msgSend(v10, "addObject:", CFSTR("../"));
        --v14;
      }
      while (v14);
    }
    if (UncommonItemInArrays < v13)
    {
      do
        objc_msgSend(v10, "addObject:", objc_msgSend(v7, "objectAtIndex:", UncommonItemInArrays++));
      while (v13 != UncommonItemInArrays);
    }
  }

  v15 = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v10);
  v16 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self, "objectsForEntity:withPredicate:sortDescriptors:error:", CFSTR("ThemeBitSource"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("path"), v15), 0, 0);
  if (objc_msgSend(v16, "count"))
    return (id)objc_msgSend(v16, "objectAtIndex:", 0);
  if (!v4)
    return 0;
  v18 = -[TDThemeBitSource initWithEntity:insertIntoManagedObjectContext:]([TDThemeBitSource alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeBitSource")), -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  -[TDThemeBitSource setPath:](v18, "setPath:", v15);
  return v18;
}

uint64_t __79__CoreThemeDocument__themeBitSourceForReferencedFilesAtURLs_createIfNecessary___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;

  if ((void *)*MEMORY[0x24BDBD430] != a2)
  {
    v4 = result;
    v5 = (void *)objc_msgSend(a2, "pathComponents");
    v6 = *(void **)(v4 + 32);
    if (a3)
    {
      result = indexOfFirstUncommonItemInArrays(v6, v5);
      if (result != 0x7FFFFFFFFFFFFFFFLL)
        return objc_msgSend(*(id *)(v4 + 32), "removeObjectsInRange:", result, objc_msgSend(*(id *)(v4 + 32), "count") - result);
    }
    else
    {
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      return objc_msgSend(*(id *)(v4 + 32), "removeLastObject");
    }
  }
  return result;
}

- (BOOL)createPSDReferenceArtworkForRenditionGroup:(id)a3 atDestination:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", a3, a4, a5);
  -[CoreThemeDocument assetManagementDelegate](self, "assetManagementDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TDAssetManagementDelegate willCreateAssetAtURL:](-[CoreThemeDocument assetManagementDelegate](self, "assetManagementDelegate"), "willCreateAssetAtURL:", a4);
  if ((objc_msgSend(v8, "fileExistsAtPath:", objc_msgSend(a4, "path")) & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TEUseOldStylePSDLayout")))v9 = (void *)objc_msgSend(a3, "mutablePSDImageRef");
    else
      v9 = (void *)objc_msgSend(a3, "mutablePSDImageRefColumnStyle");
    objc_msgSend(v9, "saveToURL:completionHandler:", a4, 0);
  }
  return 1;
}

- (BOOL)allowMultipleInstancesOfElementID:(int64_t)a3
{
  return a3 == 101;
}

- (id)createProductionWithRenditionGroup:(id)a3 forPartDefinition:(id)a4 artworkFormat:(id)a5 shouldReplaceExisting:(BOOL)a6 error:(id *)a7
{
  return -[CoreThemeDocument createProductionWithRenditionGroup:forPartDefinition:artworkFormat:nameElement:shouldReplaceExisting:error:](self, "createProductionWithRenditionGroup:forPartDefinition:artworkFormat:nameElement:shouldReplaceExisting:error:", a3, a4, a5, 0, a6, a7);
}

- (id)createProductionWithRenditionGroup:(id)a3 forPartDefinition:(id)a4 artworkFormat:(id)a5 nameElement:(id)a6 shouldReplaceExisting:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v8;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  char v19;
  id v20;
  BOOL v21;
  id v22;
  CoreThemeDocument *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  CTDPSDPreviewRef *v76;
  CTDPSDPreviewRef *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  id v101;
  void *v102;
  uint64_t m;
  void *v104;
  void *v105;
  void *v106;
  unint64_t v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  const __CFString *v115;
  void *v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  CoreThemeDocument *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  const __CFString *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t n;
  void *v138;
  id v139;
  id v140;
  void *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t ii;
  void *v152;
  id v153;
  double v154;
  double v155;
  double v156;
  void *v158;
  uint64_t v159;
  id v160;
  void *v161;
  uint64_t v162;
  void *v163;
  id v164;
  id v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v174;
  uint64_t v175;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v186;
  CoreThemeDocument *v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  id v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  uint64_t v224;

  v8 = a7;
  v224 = *MEMORY[0x24BDAC8D0];
  v166 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v187 = self;
  v11 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("ElementProduction"), 0);
  obj = a3;
  objc_msgSend((id)objc_msgSend(a3, "baseKey"), "keyList");
  v213 = 0u;
  v214 = 0u;
  v215 = 0u;
  v216 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v213, v223, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v214;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v214 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v17, "baseKeySpec"), "key");
        CUISystemThemeRenditionKeyFormat();
        if (CUIEqualRenditionKeys())
        {
          v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "partDefinition"), "element"), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a4, "element"), "name"));
          v19 = v18;
          if (v18)
            v20 = v17;
          else
            v20 = v14;
          if (v18)
            v21 = !v8;
          else
            v21 = 1;
          if (v21)
          {
            v14 = v20;
            if ((v18 & 1) != 0)
              goto LABEL_22;
          }
          else
          {
            objc_msgSend(v17, "deleteRenditionsInDocument:shouldDeleteAssetFiles:", v187, 1);
            -[CoreThemeDocument deleteObject:](v187, "deleteObject:", v17);
            if ((v19 & 1) != 0)
              goto LABEL_22;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v213, v223, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }
LABEL_22:
  v22 = a4;
  v23 = v187;
  v24 = -[CoreThemeDocument allowMultipleInstancesOfElementID:](v187, "allowMultipleInstancesOfElementID:", objc_msgSend(a4, "elementID"));
  if (v14 && !v24)
    return v14;
  if (objc_msgSend(a5, "isEqualToString:", CoreThemeArtworkFormatPNG))
  {
    v14 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("SchemaElementProduction"));
    objc_msgSend(v14, "setIsExcludedFromFilter:", *MEMORY[0x24BDBD268]);
    v25 = obj;
    v26 = (void *)objc_msgSend((id)objc_msgSend(obj, "renditions"), "objectAtIndex:", 0);
    objc_msgSend(v14, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v26, "type")));
    objc_msgSend(v14, "setRenditionSubtype:", -[CoreThemeDocument renditionSubtypeWithIdentifier:](v187, "renditionSubtypeWithIdentifier:", objc_msgSend(v26, "subtype")));
    v27 = (void *)objc_msgSend(v26, "slices");
    if (objc_msgSend(v27, "count"))
    {
      v28 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v27, "count"));
      v209 = 0u;
      v210 = 0u;
      v211 = 0u;
      v212 = 0u;
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v209, v222, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v210;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v210 != v31)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v209 + 1) + 8 * j), "rectValue");
            v34 = v33;
            v36 = v35;
            v38 = v37;
            v40 = v39;
            v41 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("Slice"));
            objc_msgSend(v41, "setSliceRect:", v34, v36, v38, v40);
            objc_msgSend(v28, "addObject:", v41);
          }
          v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v209, v222, 16);
        }
        while (v30);
      }
      objc_msgSend(v14, "setSlices:", v28);
      v25 = obj;
      v22 = a4;
    }
    v42 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
    objc_msgSend(v42, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(v25, "baseKey"), "keyList"), v187);
    objc_msgSend(v14, "setBaseKeySpec:", v42);

    objc_msgSend(v14, "setPartDefinition:", v22);
    obja = (id)objc_msgSend(v25, "renditions");
    v43 = -[CoreThemeDocument defaultPathComponentsForPartDefinition:](v187, "defaultPathComponentsForPartDefinition:", v22);
    v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](v187, "rootPathForProductionData"));
    v45 = -[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](v187, "folderNameFromRenditionKey:forPartDefinition:", objc_msgSend(v25, "baseKey"), v22);
    v46 = objc_msgSend(v43, "stringByAppendingPathComponent:", v45);
    objc_msgSend(v14, "setFolderName:", v45);
    objc_msgSend(v14, "setComment:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("From: %@"), v45));
    v47 = -[CoreThemeDocument _themeBitSource:](v187, "_themeBitSource:", a8);
    if (v47)
    {
      v48 = v47;
      v49 = (void *)objc_msgSend((id)objc_msgSend(v44, "URLByAppendingPathComponent:", objc_msgSend(v47, "name")), "URLByAppendingPathComponent:", v46);
      if ((objc_msgSend(v166, "fileExistsAtPath:", objc_msgSend(v49, "path")) & 1) != 0
        || (v208 = 0,
            (objc_msgSend(v166, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v49, 1, 0, &v208) & 1) != 0))
      {
        v170 = objc_msgSend((id)objc_msgSend(v25, "baseKey"), "themeScale");
        v204 = 0u;
        v205 = 0u;
        v206 = 0u;
        v207 = 0u;
        v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v204, v221, 16);
        if (v50)
        {
          v51 = v50;
          v164 = v48;
          v167 = v46;
          v186 = v14;
          v52 = *(_QWORD *)v205;
          do
          {
            for (k = 0; k != v51; ++k)
            {
              if (*(_QWORD *)v205 != v52)
                objc_enumerationMutation(obja);
              v54 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * k);
              v208 = 0;
              v55 = -[CoreThemeDocument createReferencePNGForSchemaRendition:withPartDefinition:atLocation:error:](v23, "createReferencePNGForSchemaRendition:withPartDefinition:atLocation:error:", v54, v22, v49, &v208);
              if (v208)
              {
                v56 = objc_msgSend((id)objc_msgSend(v49, "URLByAppendingPathComponent:", v55), "path");
                NSLog(CFSTR("Unable to create reference asset at path %@. File creation error: %@"), v56, objc_msgSend(v208, "localizedDescription"));
              }
              else
              {
                v57 = -[CoreThemeDocument newObjectForEntity:](v23, "newObjectForEntity:", CFSTR("PNGAsset"));
                objc_msgSend(v57, "setCategory:", v167);
                objc_msgSend(v57, "setName:", v55);
                objc_msgSend(v57, "setSource:", v164);
                objc_msgSend(v57, "setScaleFactor:", v170);
                v58 = -[CoreThemeDocument newObjectForEntity:](v23, "newObjectForEntity:", CFSTR("SchemaRenditionSpec"));
                objc_msgSend((id)objc_msgSend(v58, "keySpec"), "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v54, "key"), v23);
                -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v23, "_normalizeRenditionKeySpec:forSchemaRendition:", objc_msgSend(v58, "keySpec"), v54);
                objc_msgSend(v58, "setAsset:", v57);
                objc_msgSend(v58, "setProduction:", v186);
                objc_msgSend(v58, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v23, "renditionTypeWithIdentifier:", objc_msgSend(v54, "type")));
                -[CoreThemeDocument assetManagementDelegate](v23, "assetManagementDelegate");
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  -[TDAssetManagementDelegate didCreateAsset:atURL:](-[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate"), "didCreateAsset:atURL:", v57, objc_msgSend(v49, "URLByAppendingPathComponent:", v55));

                v23 = v187;
                v22 = a4;
              }
            }
            v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v204, v221, 16);
          }
          while (v51);
          return v186;
        }
        return v14;
      }
      if (a8)
      {
        v114 = objc_msgSend(v208, "localizedDescription");
        if (v114)
          v115 = (const __CFString *)v114;
        else
          v115 = CFSTR("Unable to write new folder to file system.");
        v116 = (void *)MEMORY[0x24BDD1540];
        v117 = *MEMORY[0x24BDD0B88];
        v118 = v14;
        v119 = objc_msgSend(v208, "code");
        v120 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Couldn't create folder for reference assets."), *MEMORY[0x24BDD0FC8], v115, *MEMORY[0x24BDD0FD8], 0);
        v121 = v119;
        v14 = v118;
        *a8 = (id)objc_msgSend(v116, "errorWithDomain:code:userInfo:", v117, v121, v120);
      }
    }
    v122 = v187;
    goto LABEL_113;
  }
  if (!objc_msgSend(a5, "isEqualToString:", CoreThemeArtworkFormatPSD))
  {
    if (!objc_msgSend(a5, "isEqualToString:", CoreThemeArtworkFormatCAAR))
      return 0;
    v81 = -[CoreThemeDocument _themeBitSource:](v187, "_themeBitSource:", a8);
    if (!v81)
      return 0;
    v82 = (void *)v81;
    v83 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](v187, "rootPathForProductionData"));
    v84 = -[CoreThemeDocument defaultPathComponentsForPartDefinition:](v187, "defaultPathComponentsForPartDefinition:", a4);
    v85 = (void *)objc_msgSend((id)objc_msgSend(v83, "URLByAppendingPathComponent:", objc_msgSend(v82, "name")), "URLByAppendingPathComponent:", v84);
    v86 = a4;
    v87 = v85;
    if ((objc_msgSend(v166, "fileExistsAtPath:", objc_msgSend(v85, "path")) & 1) == 0)
    {
      v208 = 0;
      if ((objc_msgSend(v166, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v87, 1, 0, &v208) & 1) == 0)goto LABEL_117;
      v86 = a4;
    }
    v88 = -[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](v187, "folderNameFromRenditionKey:forPartDefinition:", objc_msgSend(obj, "baseKey"), v86);
    v89 = objc_msgSend(v88, "stringByAppendingPathExtension:", CFSTR("caml"));
    v90 = (void *)objc_msgSend(v87, "URLByAppendingPathComponent:", v89);
    if ((objc_msgSend(v90, "checkResourceIsReachableAndReturnError:", a8) & 1) == 0)
    {
      v89 = objc_msgSend(v88, "stringByAppendingPathExtension:", CFSTR("ca"));
      v90 = (void *)objc_msgSend(v87, "URLByAppendingPathComponent:", v89);
    }
    if ((objc_msgSend(v90, "checkResourceIsReachableAndReturnError:", a8) & 1) == 0)
    {
      v89 = objc_msgSend(v88, "stringByAppendingPathExtension:", CFSTR("caar"));
      v90 = (void *)objc_msgSend(v87, "URLByAppendingPathComponent:", v89);
    }
    -[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TDAssetManagementDelegate willCreateAssetAtURL:](-[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate"), "willCreateAssetAtURL:", v90);
    v91 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("MicaAsset"));
    objc_msgSend(v91, "setCategory:", v84);
    objc_msgSend(v91, "setName:", v89);
    objc_msgSend(v91, "setScaleFactor:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "themeScale"));
    objc_msgSend(v91, "setSource:", v82);
    -[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TDAssetManagementDelegate didCreateAsset:atURL:](-[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate"), "didCreateAsset:atURL:", v91, v90);
    v174 = v90;
    v92 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("MicaElementProduction"));
    objc_msgSend(v92, "setAsset:", v91);
    objc_msgSend(v92, "setPartDefinition:", a4);
    objc_msgSend(v92, "setComment:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Production for %@"), objc_msgSend(v84, "stringByAppendingPathComponent:", v89)));
    objc_msgSend(v92, "setIsExcludedFromFilter:", *MEMORY[0x24BDBD268]);
    v93 = (void *)objc_msgSend((id)objc_msgSend(obj, "renditions"), "objectAtIndex:", 0);
    objc_msgSend(v92, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v93, "type")));
    objc_msgSend(v92, "setRenditionSubtype:", -[CoreThemeDocument renditionSubtypeWithIdentifier:](v187, "renditionSubtypeWithIdentifier:", objc_msgSend(v93, "subtype")));
    v94 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
    objc_msgSend(v94, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "keyList"), v187);
    v186 = v92;
    objc_msgSend(v92, "setBaseKeySpec:", v94);

    v95 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    objc_msgSend(v95, "setName:", CFSTR("rootLayer"));
    v183 = v95;
    objc_msgSend(v95, "setFrame:", 0.0, 0.0, 128.0, 128.0);
    v96 = (void *)objc_msgSend(obj, "schemaLayersAndLayerGroups");
    v97 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    v191 = 0u;
    v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v188, v217, 16);
    if (v98)
    {
      v99 = v98;
      v100 = 0x24BE28000uLL;
      v101 = *(id *)v189;
      v102 = v95;
      objb = *(id *)v189;
      do
      {
        for (m = 0; m != v99; ++m)
        {
          if (*(id *)v189 != v101)
            objc_enumerationMutation(v96);
          v104 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v104, "isStart"))
            {
              v105 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
              objc_msgSend(v105, "setName:", objc_msgSend(v104, "name"));
              objc_msgSend(v102, "addSublayer:", v105);
              objc_msgSend(v97, "addObject:", v105);
              v102 = v105;
            }
            else
            {
              objc_msgSend(v97, "removeLastObject");
              v102 = v183;
              if (objc_msgSend(v97, "count"))
                v102 = (void *)objc_msgSend(v97, "lastObject");
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v106 = (void *)objc_msgSend(v104, "rendition");
              v107 = v100;
              v108 = v96;
              v109 = -[CoreThemeDocument newObjectForEntity:](v23, "newObjectForEntity:", CFSTR("MicaRenditionSpec"));
              v110 = objc_msgSend(v109, "keySpec");
              v111 = objc_msgSend(v106, "key");
              v112 = (void *)v110;
              v23 = v187;
              objc_msgSend(v112, "setAttributesFromRenditionKey:withDocument:", v111, v187);
              -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v187, "_normalizeRenditionKeySpec:forSchemaRendition:", objc_msgSend(v109, "keySpec"), v106);
              objc_msgSend(v109, "setProduction:", v186);
              objc_msgSend(v109, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v106, "type")));
              objc_msgSend(v109, "setLayerPath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v97, "valueForKey:", CFSTR("name")), "arrayByAddingObject:", objc_msgSend(v104, "name")), "componentsJoinedByString:", CFSTR("/")));
              v113 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
              objc_msgSend(v113, "setName:", objc_msgSend(v104, "name"));
              objc_msgSend(v102, "bounds");
              objc_msgSend(v113, "setFrame:");
              objc_msgSend(v102, "addSublayer:", v113);

              v96 = v108;
              v100 = v107;
              v101 = objb;
            }
          }
        }
        v99 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v188, v217, 16);
      }
      while (v99);
    }
    objc_msgSend(v174, "fileSystemRepresentation");
    CAEncodeLayerTreeToFile();
    return v186;
  }
  v59 = -[CoreThemeDocument _themeBitSource:](v187, "_themeBitSource:", a8);
  if (!v59)
    return 0;
  v60 = (void *)v59;
  v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](v187, "rootPathForProductionData"));
  v62 = -[CoreThemeDocument defaultPathComponentsForPartDefinition:](v187, "defaultPathComponentsForPartDefinition:", a4);
  v63 = (void *)objc_msgSend((id)objc_msgSend(v61, "URLByAppendingPathComponent:", objc_msgSend(v60, "name")), "URLByAppendingPathComponent:", v62);
  if ((objc_msgSend(v166, "fileExistsAtPath:", objc_msgSend(v63, "path")) & 1) == 0)
  {
    v208 = 0;
    if ((objc_msgSend(v166, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v63, 1, 0, &v208) & 1) == 0)
    {
LABEL_117:
      if (a8)
      {
        v128 = objc_msgSend(v208, "localizedDescription");
        if (v128)
          v129 = (const __CFString *)v128;
        else
          v129 = CFSTR("Unable to write new folder to file system.");
        v130 = (void *)MEMORY[0x24BDD1540];
        v131 = *MEMORY[0x24BDD0B88];
        v132 = objc_msgSend(v208, "code");
        *a8 = (id)objc_msgSend(v130, "errorWithDomain:code:userInfo:", v131, v132, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Couldn't create folder for reference assets."), *MEMORY[0x24BDD0FC8], v129, *MEMORY[0x24BDD0FD8], 0));
      }
      return 0;
    }
  }
  v64 = objc_msgSend(-[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](v187, "folderNameFromRenditionKey:forPartDefinition:", objc_msgSend(obj, "baseKey"), a4), "stringByAppendingPathExtension:", CFSTR("psd"));
  v65 = (void *)objc_msgSend(v63, "URLByAppendingPathComponent:", v64);
  if (!-[CoreThemeDocument createPSDReferenceArtworkForRenditionGroup:atDestination:error:](v187, "createPSDReferenceArtworkForRenditionGroup:atDestination:error:", obj, v65, a8))
  {
    if (a8)
    {
      v123 = (void *)MEMORY[0x24BDD1540];
      v124 = *MEMORY[0x24BDD0B88];
      v125 = (void *)MEMORY[0x24BDBCE70];
      v126 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't make reference PSD image. Filename: %@"), v64);
      v127 = (void *)objc_msgSend(v123, "errorWithDomain:code:userInfo:", v124, 0, objc_msgSend(v125, "dictionaryWithObject:forKey:", v126, *MEMORY[0x24BDD0FC8]));
      v14 = 0;
      *a8 = v127;
      return v14;
    }
    return 0;
  }
  v66 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("PhotoshopAsset"));
  objc_msgSend(v66, "setCategory:", v62);
  objc_msgSend(v66, "setName:", v64);
  objc_msgSend(v66, "setScaleFactor:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "themeScale"));
  objc_msgSend(v66, "setSource:", v60);
  -[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TDAssetManagementDelegate didCreateAsset:atURL:](-[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate"), "didCreateAsset:atURL:", v66, v65);
  v14 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("PhotoshopElementProduction"));
  objc_msgSend(v14, "setAsset:", v66);
  objc_msgSend(v14, "setPartDefinition:", a4);
  objc_msgSend(v14, "setComment:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Production for %@"), objc_msgSend(v62, "stringByAppendingPathComponent:", v64)));
  objc_msgSend(v14, "setIsExcludedFromFilter:", *MEMORY[0x24BDBD268]);
  v67 = (void *)objc_msgSend((id)objc_msgSend(obj, "renditions"), "objectAtIndex:", 0);
  objc_msgSend(v14, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v67, "type")));
  objc_msgSend(v14, "setRenditionSubtype:", -[CoreThemeDocument renditionSubtypeWithIdentifier:](v187, "renditionSubtypeWithIdentifier:", objc_msgSend(v67, "subtype")));
  v68 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
  objc_msgSend(v68, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "keyList"), v187);
  objc_msgSend(v14, "setBaseKeySpec:", v68);

  v69 = objc_msgSend(a4, "partFeatures");
  if ((v69 & 0x8000) != 0)
    v70 = 3;
  else
    v70 = 4;
  if ((v69 & 0x10004) == 4)
    v71 = 1;
  else
    v71 = v70;
  objc_msgSend(v14, "setRowIterationType:", -[CoreThemeDocument iterationTypeWithIdentifier:](v187, "iterationTypeWithIdentifier:", v71));
  if ((v69 & 0x4000) != 0)
    v72 = 2;
  else
    v72 = 4;
  if ((v69 & 1) != 0)
    v73 = 0;
  else
    v73 = v72;
  objc_msgSend(v14, "setColumnIterationType:", -[CoreThemeDocument iterationTypeWithIdentifier:](v187, "iterationTypeWithIdentifier:", v73));
  v74 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v75 = objc_msgSend((id)objc_msgSend(a4, "validStatesWithDocument:", v187), "count");
  v182 = v69;
  if ((v69 & 0x80) != 0)
    objc_msgSend(v74, "addObject:", -[CoreThemeDocument mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:](v187, "mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:", v75++, 3));
  if ((v69 & 0x2000) != 0)
    objc_msgSend(v74, "addObject:", -[CoreThemeDocument mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:](v187, "mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:", v75, 2));
  if (objc_msgSend(v74, "count"))
    objc_msgSend(v14, "addLayerMappings:", v74);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TEUseOldStylePSDLayout")) & 1) == 0)
  {
    objc_msgSend(v14, "setRowCount:", &unk_24EF40918);
    objc_msgSend(v14, "setColumnCount:", &unk_24EF40918);
    objc = (id)objc_msgSend(obj, "schemaLayersAndLayerGroups");
    v184 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v200 = 0u;
    v201 = 0u;
    v202 = 0u;
    v203 = 0u;
    v133 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v200, v220, 16);
    if (v133)
    {
      v134 = v133;
      v186 = v14;
      v135 = 0;
      v136 = *(_QWORD *)v201;
      v171 = *(_QWORD *)v201;
      do
      {
        for (n = 0; n != v134; ++n)
        {
          if (*(_QWORD *)v201 != v136)
            objc_enumerationMutation(objc);
          v138 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v138, "isStart"))
            {
              v139 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("PhotoshopLayer"));
              objc_msgSend(v139, "setName:", objc_msgSend(v138, "name"));
              objc_msgSend(v139, "setParentLayer:", v135);
              objc_msgSend(v184, "addObject:", v139);
              v135 = (uint64_t)v139;
            }
            else
            {
              objc_msgSend(v184, "removeLastObject");
              if (objc_msgSend(v184, "count"))
                v135 = objc_msgSend(v184, "lastObject");
              else
                v135 = 0;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v140 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("PhotoshopLayer"));
              objc_msgSend(v140, "setParentLayer:", v135);
              objc_msgSend(v140, "setName:", objc_msgSend(v138, "name"));
              v141 = (void *)objc_msgSend(v138, "rendition");
              v142 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("PhotoshopRenditionSpec"));
              objc_msgSend(v142, "setProduction:", v186);
              objc_msgSend((id)objc_msgSend(v142, "keySpec"), "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v141, "key"), v187);
              objc_msgSend((id)objc_msgSend(v142, "keySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(a6, "identifier"), "unsignedIntValue"));
              -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v187, "_normalizeRenditionKeySpec:forSchemaRendition:", objc_msgSend(v142, "keySpec"), v141);
              v136 = v171;
              objc_msgSend(v142, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v141, "type")));
              objc_msgSend(v142, "setPhotoshopLayer:", v140);
            }
          }
        }
        v134 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v200, v220, 16);
      }
      while (v134);
      return v186;
    }
    return v14;
  }
  v76 = -[CTDPSDPreviewRef initWithPath:]([CTDPSDPreviewRef alloc], "initWithPath:", objc_msgSend(v65, "path"));
  if (!v76)
    return 0;
  v77 = v76;
  v78 = objc_msgSend(v67, "rowSlices");
  v79 = objc_msgSend(v67, "columnSlices");
  if (-[CTDPSDPreviewRef sliceRowCount](v77, "sliceRowCount") < 1)
    v80 = 0;
  else
    v80 = -[CTDPSDPreviewRef sliceRowCount](v77, "sliceRowCount");
  if (-[CTDPSDPreviewRef sliceColumnCount](v77, "sliceColumnCount") < 1)
    v143 = 0;
  else
    v143 = -[CTDPSDPreviewRef sliceColumnCount](v77, "sliceColumnCount");
  if (objc_msgSend(v67, "type") == 6)
  {
    v144 = 1;
    v145 = 1;
  }
  else
  {
    if (v80 < 1 || v143 < 1 || v80 % v78 || v143 % v79)
    {
      if (a8)
      {
        v158 = (void *)MEMORY[0x24BDD1540];
        v159 = *MEMORY[0x24BDD0B88];
        v160 = v14;
        v161 = (void *)MEMORY[0x24BDBCE70];
        v162 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reference PSD has wrong number of slices. Couldn't create production. Filename: %@"), v64);
        v163 = v161;
        v14 = v160;
        *a8 = (id)objc_msgSend(v158, "errorWithDomain:code:userInfo:", v159, 0, objc_msgSend(v163, "dictionaryWithObject:forKey:", v162, *MEMORY[0x24BDD0FC8]));
      }
      -[CoreThemeDocument deleteObject:](v187, "deleteObject:", objc_msgSend(v14, "asset"));
      v122 = v187;
LABEL_113:
      -[CoreThemeDocument deleteObject:](v122, "deleteObject:", v14);
      return 0;
    }
    v144 = (uint64_t)(double)(v143 / v79);
    v145 = (uint64_t)(double)(v80 / v78);
  }
  objc_msgSend(v14, "setRowCount:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v145));
  objc_msgSend(v14, "setColumnCount:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v144));
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v165 = (id)objc_msgSend(obj, "themeSchemaLayers");
  v172 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v196, v219, 16);
  if (v172)
  {
    v186 = v14;
    v168 = *(_QWORD *)v197;
    do
    {
      v146 = 0;
      do
      {
        if (*(_QWORD *)v197 != v168)
          objc_enumerationMutation(v165);
        v175 = v146;
        v147 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * v146);
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        objd = (id)objc_msgSend(v147, "renditions");
        v148 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v192, v218, 16);
        if (v148)
        {
          v149 = v148;
          v150 = *(_QWORD *)v193;
          do
          {
            for (ii = 0; ii != v149; ++ii)
            {
              if (*(_QWORD *)v193 != v150)
                objc_enumerationMutation(objd);
              v152 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * ii);
              v153 = -[CoreThemeDocument newObjectForEntity:](v187, "newObjectForEntity:", CFSTR("PhotoshopRenditionSpec"));
              objc_msgSend(v153, "setProduction:", v186);
              objc_msgSend((id)objc_msgSend(v153, "keySpec"), "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v152, "key"), v187);
              -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v187, "_normalizeRenditionKeySpec:forSchemaRendition:", objc_msgSend(v153, "keySpec"), v152);
              objc_msgSend(v153, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v152, "type")));
              objc_msgSend(v153, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v147, "index")), CFSTR("layer"));
              objc_msgSend(v152, "renditionCoordinatesForPartFeatures:", v182);
              v155 = v154;
              objc_msgSend(v153, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (v145 + ~(uint64_t)v156) & ~((v145 + ~(uint64_t)v156) >> 63)), CFSTR("row"));
              objc_msgSend(v153, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)v155), CFSTR("column"));

            }
            v149 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v192, v218, 16);
          }
          while (v149);
        }
        v146 = v175 + 1;
      }
      while (v175 + 1 != v172);
      v172 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v196, v219, 16);
    }
    while (v172);
    return v186;
  }
  return v14;
}

- (void)_normalizeRenditionKeySpec:(id)a3 forSchemaRendition:(id)a4
{
  if (!objc_msgSend(a3, "size"))
    objc_msgSend(a3, "setSize:", -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", 0));
  if (!objc_msgSend(a3, "state"))
    objc_msgSend(a3, "setState:", -[CoreThemeDocument stateWithIdentifier:](self, "stateWithIdentifier:", 0));
  if (!objc_msgSend(a3, "presentationState"))
    objc_msgSend(a3, "setPresentationState:", -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", 0));
  if (!objc_msgSend(a3, "direction"))
    objc_msgSend(a3, "setDirection:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", 0));
  if (!objc_msgSend(a3, "value"))
    objc_msgSend(a3, "setValue:", -[CoreThemeDocument valueWithIdentifier:](self, "valueWithIdentifier:", 0));
  if (!objc_msgSend(a3, "layer"))
    objc_msgSend(a3, "setLayer:", -[CoreThemeDocument drawingLayerWithIdentifier:](self, "drawingLayerWithIdentifier:", 0));
}

- (id)createEffectStyleProductionForPartDefinition:(id)a3
{
  return -[CoreThemeDocument createEffectStyleProductionForPartDefinition:withNameIdentifier:](self, "createEffectStyleProductionForPartDefinition:withNameIdentifier:", a3, 0);
}

- (id)createEffectStyleProductionForPartDefinition:(id)a3 withNameIdentifier:(id)a4
{
  const __CFString *v7;
  id v8;
  id v9;
  void *v10;

  if (a4)
    v7 = CFSTR("NamedEffectProduction");
  else
    v7 = CFSTR("EffectStyleProduction");
  v8 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v7);
  objc_msgSend(v8, "setIsExcludedFromFilter:", *MEMORY[0x24BDBD268]);
  objc_msgSend(v8, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 7));
  v9 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
  v10 = (void *)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform"));
  objc_msgSend(a3, "element");
  objc_msgSend(v9, "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v10, "partDefinitionWithName:forElementDefinition:", objc_msgSend(a3, "name"), objc_msgSend((id)objc_opt_class(), "elementDefinitionWithName:withSchema:", objc_msgSend((id)objc_msgSend(a3, "element"), "name"), v10))+ 16, self);
  objc_msgSend(v8, "setBaseKeySpec:", v9);

  if (a4)
    objc_msgSend((id)objc_msgSend(v8, "baseKeySpec"), "setNameIdentifier:", objc_msgSend(a4, "unsignedIntValue"));
  objc_msgSend(v8, "setComment:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("System Effect: %@ - %@"), objc_msgSend((id)objc_msgSend(a3, "element"), "name"), objc_msgSend(a3, "name")));
  objc_msgSend(v8, "setPartDefinition:", a3);
  objc_msgSend(v8, "generateRenditionsWithDocument:", self);
  return v8;
}

- (id)namedEffectProductionWithName:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id result;
  id v10;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("NamedEffectProduction"));
  v6 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name = %@"), a3);
  v7 = (void *)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
  objc_msgSend(v5, "setPredicate:", v6);
  v10 = 0;
  v8 = (void *)objc_msgSend(v7, "executeFetchRequest:error:", v5, &v10);

  if (v10)
  {
    NSLog(CFSTR("Unable to lookup named effect using name: %@  %@"), a3, objc_msgSend(v10, "localizedDescription"));
    return 0;
  }
  else
  {
    result = (id)objc_msgSend(v8, "count");
    if (result)
      return (id)objc_msgSend(v8, "objectAtIndex:", 0);
  }
  return result;
}

- (id)_namedTextEffectPartDefinition
{
  id v2;
  id result;

  v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("SchemaPartDefinition"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name = %@ AND element.name = %@"), CFSTR("Named Text"), CFSTR("Named Effect")), 0);
  result = (id)objc_msgSend(v2, "count");
  if (result)
    return (id)objc_msgSend(v2, "objectAtIndex:", 0);
  return result;
}

- (id)_namedImageEffectPartDefinition
{
  id v2;
  id result;

  v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("SchemaPartDefinition"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name = %@ AND element.name = %@"), CFSTR("Named Image"), CFSTR("Named Effect")), 0);
  result = (id)objc_msgSend(v2, "count");
  if (result)
    return (id)objc_msgSend(v2, "objectAtIndex:", 0);
  return result;
}

- (id)createNamedEffectProductionWithName:(id)a3 isText:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;

  if (a4)
    v6 = -[CoreThemeDocument _namedTextEffectPartDefinition](self, "_namedTextEffectPartDefinition");
  else
    v6 = -[CoreThemeDocument _namedImageEffectPartDefinition](self, "_namedImageEffectPartDefinition");
  v7 = v6;
  v8 = -[CoreThemeDocument namedEffectProductionWithName:](self, "namedEffectProductionWithName:", a3);
  if (v8)
    return -[CoreThemeDocument createEffectStyleProductionForPartDefinition:withNameIdentifier:](self, "createEffectStyleProductionForPartDefinition:withNameIdentifier:", v7, objc_msgSend((id)objc_msgSend(v8, "name"), "identifier"));
  v10 = -[CoreThemeDocument _createNamedElementWithNextAvailableIdentifier](self, "_createNamedElementWithNextAvailableIdentifier");
  v11 = -[CoreThemeDocument createEffectStyleProductionForPartDefinition:withNameIdentifier:](self, "createEffectStyleProductionForPartDefinition:withNameIdentifier:", v7, objc_msgSend(v10, "identifier"));
  objc_msgSend(v10, "setName:", a3);
  objc_msgSend(v10, "setProduction:", v11);
  return v11;
}

- (id)_createPhotoshopElementProductionWithAsset:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("PhotoshopElementProduction"));
  objc_msgSend(v5, "setValue:forKey:", a3, CFSTR("asset"));
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0), CFSTR("isExcludedFromFilter"));
  objc_msgSend(v5, "setValue:forKey:", -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 0), CFSTR("renditionType"));
  v6 = -[CoreThemeDocument iterationTypeWithIdentifier:](self, "iterationTypeWithIdentifier:", 4);
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("rowIterationType"));
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("columnIterationType"));
  v7 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
  objc_msgSend(v7, "setScaleFactor:", objc_msgSend(a3, "scaleFactor"));
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("baseKeySpec"));

  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("From: %@/%@"), objc_msgSend(a3, "category"), objc_msgSend(a3, "name")), CFSTR("comment"));
  return v5;
}

- (id)_namedImagePartDefinition
{
  id v2;
  id result;

  v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("SchemaPartDefinition"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name = %@ AND element.name = %@"), CFSTR("Artwork Image"), CFSTR("Named Asset")), 0);
  result = (id)objc_msgSend(v2, "count");
  if (result)
    return (id)objc_msgSend(v2, "objectAtIndex:", 0);
  return result;
}

- (id)_createNamedElementWithNextAvailableIdentifier
{
  void *cachedMaxIdentifierInUse;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  cachedMaxIdentifierInUse = (void *)self->cachedMaxIdentifierInUse;
  if ((uint64_t)cachedMaxIdentifierInUse > 0)
  {
LABEL_2:
    self->cachedMaxIdentifierInUse = (int64_t)cachedMaxIdentifierInUse + 1;
    return -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:");
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("identifier"), 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("NamedElement"));
  v7 = (void *)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
  objc_msgSend(v6, "setSortDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5));

  objc_msgSend(v6, "setFetchLimit:", 1);
  v9 = 0;
  v8 = (void *)objc_msgSend(v7, "executeFetchRequest:error:", v6, &v9);

  if (!v9)
  {
    cachedMaxIdentifierInUse = (void *)objc_msgSend(v8, "count");
    if (cachedMaxIdentifierInUse)
    {
      cachedMaxIdentifierInUse = (void *)objc_msgSend(v8, "objectAtIndex:", 0);
      if (cachedMaxIdentifierInUse)
        cachedMaxIdentifierInUse = (void *)objc_msgSend((id)objc_msgSend(cachedMaxIdentifierInUse, "identifier"), "integerValue");
    }
    goto LABEL_2;
  }
  NSLog(CFSTR("Unable to compute next element name: %@"), objc_msgSend(v9, "localizedDescription"));
  return 0;
}

- (id)_createNamedElementWithIdentifier:(int64_t)a3
{
  id v5;

  v5 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedElement"));
  objc_msgSend(v5, "setIdentifier:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3));
  if (self->cachedMaxIdentifierInUse < a3)
    self->cachedMaxIdentifierInUse = a3;
  return v5;
}

- (id)namedElementWithName:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id result;
  id v10;

  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("NamedElement"));
  v6 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name = %@"), a3);
  v7 = -[TDPersistentDocument managedObjectContext](self, "managedObjectContext");
  objc_msgSend(v5, "setPredicate:", v6);
  v10 = 0;
  v8 = (void *)objc_msgSend(v7, "executeFetchRequest:error:", v5, &v10);

  if (v10)
  {
    NSLog(CFSTR("Unable to lookup named element with name: %@  %@"), a3, objc_msgSend(v10, "localizedDescription"));
    return 0;
  }
  else
  {
    result = (id)objc_msgSend(v8, "count");
    if (result)
      return (id)objc_msgSend(v8, "objectAtIndex:", 0);
  }
  return result;
}

- (id)namedElementsForElementDefinition:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "parts"), "anyObject"), "productions"), "valueForKey:", CFSTR("name")), "allObjects");
}

- (id)elementProductionsWithName:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v10;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("name"), 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("ElementProduction"));
  v7 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name = %@"), a3);
  objc_msgSend(v6, "setSortDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5));
  objc_msgSend(v6, "setPredicate:", v7);
  v10 = 0;
  v8 = (void *)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC"), "executeFetchRequest:error:", v6, &v10);

  if (v10)
  {
    NSLog(CFSTR("Unable to lookup named artwork using name: %@  %@"), a3, objc_msgSend(v10, "localizedDescription"));
    return 0;
  }
  return v8;
}

- (id)namedArtworkProductionWithName:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id result;
  id v10;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("NamedArtworkProduction"));
  v6 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name = %@"), a3);
  v7 = (void *)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
  objc_msgSend(v5, "setPredicate:", v6);
  v10 = 0;
  v8 = (void *)objc_msgSend(v7, "executeFetchRequest:error:", v5, &v10);

  if (v10)
  {
    NSLog(CFSTR("Unable to lookup named artwork using name: %@  %@"), a3, objc_msgSend(v10, "localizedDescription"));
    return 0;
  }
  else
  {
    result = (id)objc_msgSend(v8, "count");
    if (result)
      return (id)objc_msgSend(v8, "objectAtIndex:", 0);
  }
  return result;
}

- (id)slicesComputedForImageSize:(CGSize)a3 usingSliceInsets:(id)a4 resizableSliceSize:(CGSize)a5 withRenditionType:(int64_t)a6
{
  void *v6;
  double var3;
  double var2;
  double var1;
  double var0;
  unint64_t width;
  unint64_t height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v6 = 0;
  v55 = *MEMORY[0x24BDAC8D0];
  if (a3.width <= 0.0 || a3.height <= 0.0)
    return v6;
  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  if (a4.var0 < 0.0 && a4.var2 < 0.0 && a4.var3 < 0.0 && a4.var1 < 0.0)
    return 0;
  width = (unint64_t)a3.width;
  height = (unint64_t)a3.height;
  if (a4.var0 >= 0.0 && a6 == 3 && a4.var2 >= 0.0 && a4.var1 >= 0.0 && a4.var3 >= 0.0)
  {
    if (a5.width >= 1.0)
      v14 = a5.width;
    else
      v14 = 1.0;
    v15 = (double)width - (a4.var1 + a4.var3) - v14;
    if (v15 < 0.0)
      v15 = 0.0;
    v16 = (double)height;
    v17 = (double)height - (a4.var0 + var2);
    if (a5.height >= 1.0)
      v18 = a5.height;
    else
      v18 = 1.0;
    v19 = v17 - v18;
    if (v17 - v18 < 0.0)
      v19 = 0.0;
    v20 = a4.var1 + v14 + v15;
    if ((double)width - v20 >= 0.0)
      v21 = (double)width - v20;
    else
      v21 = 0.0;
    v22 = var0 + v18 + v19;
    if (v16 - v22 >= 0.0)
      v23 = v16 - v22;
    else
      v23 = 0.0;
    v24 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, 0.0, var1, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", var1, 0.0, v14, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v20, 0.0, v21, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, var0, var1, v18));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", var1, var0, v14, v18));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v20, var0, v21, v18));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, v22, var1, v23));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", var1, v22, v14, v23));
    v25 = (void *)MEMORY[0x24BDD1968];
    v26 = v20;
    v27 = v22;
    v28 = v21;
    v29 = v23;
    goto LABEL_49;
  }
  if (a6 == 1 && a4.var1 >= 0.0 && a4.var3 >= 0.0)
  {
    if (a5.width >= 1.0)
      v30 = a5.width;
    else
      v30 = 1.0;
    if ((double)width - (a4.var1 + a4.var3) - v30 >= 0.0)
      v31 = (double)width - (a4.var1 + a4.var3) - v30;
    else
      v31 = 0.0;
    v24 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, 0.0, var1, (double)height));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", var1, 0.0, v30, (double)height));
    v32 = var1 + v30;
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v32, 0.0, v31, (double)height));
    v25 = (void *)MEMORY[0x24BDD1968];
    v26 = v32 + v31;
    v27 = 0.0;
    v28 = var3;
    v29 = (double)height;
LABEL_49:
    objc_msgSend(v24, "addObject:", objc_msgSend(v25, "valueWithRect:", v26, v27, v28, v29));
    goto LABEL_50;
  }
  if (a4.var0 >= 0.0 && a6 == 2 && a4.var2 >= 0.0)
  {
    if (a5.height >= 1.0)
      v33 = a5.height;
    else
      v33 = 1.0;
    if ((double)height - (a4.var0 + a4.var2) - v33 >= 0.0)
      v34 = (double)height - (a4.var0 + a4.var2) - v33;
    else
      v34 = 0.0;
    v24 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, 0.0, (double)width, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, var0, (double)width, v33));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, var0 + v33, (double)width, v34));
    v25 = (void *)MEMORY[0x24BDD1968];
    v26 = 0.0;
    v27 = v33 + var0 + v34;
    v28 = (double)width;
    v29 = var2;
    goto LABEL_49;
  }
  if ((unint64_t)a6 > 0xC || ((1 << a6) & 0x1801) == 0)
  {
    v49 = +[TDLogger defaultLogger](TDLogger, "defaultLogger");
    objc_msgSend(v49, "logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Edge insets were specified but didn't match the rendition type")));
  }
  v24 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, 0.0, (double)width, (double)height));
LABEL_50:
  if (!objc_msgSend(v24, "count"))
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v24, "count"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v35 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v51 != v37)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "rectValue");
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v47 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
        objc_msgSend(v47, "setSliceRect:", v40, v42, v44, v46);
        objc_msgSend(v6, "addObject:", v47);
      }
      v36 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v36);
  }
  return v6;
}

- (id)createTextStyleProductionsForImportInfos:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  char v11;
  char v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;

  if (!objc_msgSend(a3, "count"))
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 85);
  v33 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 231);
  v32 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1015);
  v31 = -[CoreThemeDocument displayGamuts](self, "displayGamuts");
  v30 = -[CoreThemeDocument idioms](self, "idioms");
  v29 = -[CoreThemeDocument sizeClasses](self, "sizeClasses");
  v7 = (void *)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_432);
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_msgSend(v7, "objectAtIndex:", v8);
      v10 = (id)objc_msgSend(v6, "lastObject");
      v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "name"), "name"), "isEqualToString:", objc_msgSend(v9, "name"));
      if (v10)
        v12 = v11;
      else
        v12 = 0;
      if ((v12 & 1) != 0)
        goto LABEL_9;
      v10 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextStyleProduction"));
      v13 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v9, "nameIdentifier"));
      objc_msgSend(v13, "setName:", objc_msgSend(v9, "name"));
      objc_msgSend(v13, "setProduction:", v10);
      objc_msgSend(v10, "setRenditionType:", v32);
      v14 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
      objc_msgSend(v14, "setElement:", v34);
      objc_msgSend(v14, "setPart:", v33);
      objc_msgSend(v14, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v13, "identifier"), "unsignedIntValue"));
      objc_msgSend(v10, "setBaseKeySpec:", v14);

      if (v10)
      {
LABEL_9:
        v15 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextStyleRenditionSpec"));
        objc_msgSend(v15, "setAlignment:", (__int16)objc_msgSend(v9, "textAlignment"));
        objc_msgSend(v15, "setFontName:", objc_msgSend(v9, "fontName"));
        objc_msgSend(v9, "fontSize");
        *(float *)&v16 = v16;
        objc_msgSend(v15, "setFontSize:", v16);
        objc_msgSend(v9, "maxPointSize");
        *(float *)&v17 = v17;
        objc_msgSend(v15, "setMaxPointSize:", v17);
        objc_msgSend(v9, "minPointSize");
        *(float *)&v18 = v18;
        objc_msgSend(v15, "setMinPointSize:", v18);
        objc_msgSend(v15, "setScalingStyle:", (__int16)objc_msgSend(v9, "scalingStyle"));
        objc_msgSend(v15, "setProduction:", v10);
        objc_msgSend(v15, "setRenditionType:", v32);
        v19 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v19, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v10, "baseKeySpec"), "nameIdentifier"));
        objc_msgSend(v19, "setElement:", v34);
        objc_msgSend(v19, "setPart:", v33);
        objc_msgSend(v19, "setGamut:", objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v9, "displayGamut")));
        objc_msgSend(v19, "setIdiom:", objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v9, "idiom")));
        objc_msgSend(v19, "setSubtype:", objc_msgSend(v9, "subtype"));
        v35 = v12;
        v20 = v7;
        v21 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v9, "sizeClassHorizontal"));
        v22 = v6;
        v23 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v9, "sizeClassVertical"));
        v24 = v21;
        v7 = v20;
        objc_msgSend(v19, "setSizeClassHorizontal:", v24);
        objc_msgSend(v19, "setSizeClassVertical:", v23);
        objc_msgSend(v19, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v9, "appearanceIdentifier"), objc_msgSend(v9, "appearanceName"), 1));
        v25 = objc_msgSend(v9, "localizationIdentifier");
        v26 = objc_msgSend(v9, "localizationName");
        v27 = v25;
        v6 = v22;
        objc_msgSend(v19, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", v27, v26, 1));
        objc_msgSend(v15, "setKeySpec:", v19);

        if ((v35 & 1) == 0)
          objc_msgSend(v22, "addObject:", v10);
      }
      ++v8;
    }
    while (v8 < objc_msgSend(v7, "count"));
  }
  return v6;
}

uint64_t __68__CoreThemeDocument_createTextStyleProductionsForImportInfos_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

- (id)createNamedColorProductionsForImportInfos:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;
  char v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3, a4);
  v7 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 85);
  v31 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 217);
  v30 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1009);
  v29 = -[CoreThemeDocument displayGamuts](self, "displayGamuts");
  v28 = -[CoreThemeDocument idioms](self, "idioms");
  v8 = (void *)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_437);
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v25 = v7;
    v26 = v6;
    v27 = v8;
    while (1)
    {
      v10 = (void *)objc_msgSend(v8, "objectAtIndex:", v9);
      if (!objc_msgSend(v10, "colorComponents"))
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 3356, CFSTR("All colors need to have the colorComponents set when being imported into a Core Theme Document color named '%@'."), objc_msgSend(v10, "name"));
      v11 = (id)objc_msgSend(v6, "lastObject");
      v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "name"), "name"), "isEqualToString:", objc_msgSend(v10, "name"));
      if (v11)
        v13 = v12;
      else
        v13 = 0;
      if ((v13 & 1) == 0)
      {
        v11 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedColorProduction"));
        v14 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v10, "nameIdentifier"));
        objc_msgSend(v14, "setName:", objc_msgSend(v10, "name"));
        objc_msgSend(v14, "setProduction:", v11);
        objc_msgSend(v11, "setRenditionType:", v30);
        v15 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v15, "setElement:", v7);
        objc_msgSend(v15, "setPart:", v31);
        objc_msgSend(v15, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v14, "identifier"), "unsignedIntValue"));
        objc_msgSend(v11, "setBaseKeySpec:", v15);

        if (!v11)
          goto LABEL_22;
      }
      v16 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedColorRenditionSpec"));
      v17 = (void *)objc_msgSend(v10, "colorComponents");
      if (objc_msgSend(v17, "count") == 4)
        break;
      if (objc_msgSend(v17, "count") == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 1;
        goto LABEL_14;
      }
LABEL_15:
      if (objc_msgSend(v10, "colorSpaceID"))
        v21 = objc_msgSend(v10, "colorSpaceID");
      else
        v21 = 1;
      objc_msgSend(v16, "setColorSpaceID:", v21);
      if (objc_msgSend((id)objc_msgSend(v10, "systemColorName"), "length"))
        objc_msgSend(v16, "setSystemColorName:", objc_msgSend(v10, "systemColorName"));
      objc_msgSend(v16, "setProduction:", v11);
      objc_msgSend(v16, "setRenditionType:", v30);
      v22 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
      objc_msgSend(v22, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v11, "baseKeySpec"), "nameIdentifier"));
      objc_msgSend(v22, "setElement:", v7);
      objc_msgSend(v22, "setPart:", v31);
      objc_msgSend(v22, "setGamut:", objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v10, "displayGamut")));
      objc_msgSend(v22, "setIdiom:", objc_msgSend(v28, "objectAtIndex:", objc_msgSend(v10, "idiom")));
      objc_msgSend(v22, "setSubtype:", objc_msgSend(v10, "subtype"));
      objc_msgSend(v22, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v10, "appearanceIdentifier"), objc_msgSend(v10, "appearanceName"), 1));
      objc_msgSend(v22, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v10, "localizationIdentifier"), objc_msgSend(v10, "localizationName"), 1));
      objc_msgSend(v16, "setKeySpec:", v22);

      v8 = v27;
      if ((v13 & 1) == 0)
        objc_msgSend(v6, "addObject:", v11);
LABEL_22:
      if (++v9 >= (unint64_t)objc_msgSend(v8, "count"))
        return v6;
    }
    v18 = 1;
    v19 = 2;
    v20 = 3;
LABEL_14:
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 0), "doubleValue");
    objc_msgSend(v16, "setRed:");
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v18), "doubleValue");
    objc_msgSend(v16, "setGreen:");
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v19), "doubleValue");
    objc_msgSend(v16, "setBlue:");
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v20), "doubleValue");
    objc_msgSend(v16, "setAlpha:");
    v7 = v25;
    v6 = v26;
    goto LABEL_15;
  }
  return v6;
}

uint64_t __69__CoreThemeDocument_createNamedColorProductionsForImportInfos_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

- (id)_sizeIndexesByNameFromNamedAssetImportInfos:(id)a3
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  double v23;
  double v24;
  double v25;
  id v27;
  id obj;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_445);
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "count");
  v7 = 0;
  v8 = 0;
  v9 = 0;
  do
  {
    if (v8 < objc_msgSend(v6, "count"))
      v7 = (void *)objc_msgSend(v6, "objectAtIndex:", v8);
    if (!v9)
      v9 = (void *)objc_msgSend(v7, "name");
    if (!objc_msgSend(v9, "isEqualToString:", objc_msgSend(v7, "name"))
      || v8 == objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v27, "count"))
      {
        v10 = objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_446);
        if (v10 && v9)
          objc_msgSend(v30, "setObject:forKey:", v10, v9);
        else
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 3478, CFSTR("sortedSizes and currentName should not be nil"));
      }

      if (v8 >= objc_msgSend(v6, "count"))
        v11 = 0;
      else
        v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = (void *)objc_msgSend(v7, "name", v11);
    }
    if (v8 < objc_msgSend(v6, "count"))
    {
      v12 = objc_msgSend(v7, "iconSize");
      if (v12)
      {
        v13 = v12;
        if (objc_msgSend(v27, "indexOfObject:", v12) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v27, "addObject:", v13);
      }
    }
    ++v8;
  }
  while (v8 <= objc_msgSend(v6, "count"));
  v29 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_msgSend(v30, "allKeys");
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v19 = (void *)objc_msgSend(v30, "valueForKey:", v18);
        v20 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        if (objc_msgSend(v19, "count"))
        {
          v21 = 0;
          do
          {
            v22 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("MultisizeImageSetSizeIndex"));
            objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", v21), "sizeValue");
            v24 = v23;
            objc_msgSend(v22, "setWidth:", (int)v25);
            objc_msgSend(v22, "setHeight:", (int)v24);
            objc_msgSend(v22, "setIndex:", (__int16)(v21 + 1));
            objc_msgSend(v20, "addObject:", v22);
            ++v21;
          }
          while (v21 < objc_msgSend(v19, "count"));
        }
        objc_msgSend(v29, "setObject:forKey:", v20, v18);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  return v29;
}

uint64_t __65__CoreThemeDocument__sizeIndexesByNameFromNamedAssetImportInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

uint64_t __65__CoreThemeDocument__sizeIndexesByNameFromNamedAssetImportInfos___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a2, "sizeValue");
  v5 = v4;
  v7 = v6;
  objc_msgSend(a3, "sizeValue");
  v10 = v8 * v9;
  if (v5 * v7 < v10)
    return -1;
  else
    return v5 * v7 > v10;
}

- (BOOL)needToCreateForwardstopForPlatform
{
  return -[CoreThemeDocument targetPlatform](self, "targetPlatform") != 0;
}

- (BOOL)isArtworkRenditionEligibleForForwardstop:(id)a3
{
  void *v5;
  BOOL result;

  result = objc_msgSend((id)objc_msgSend(a3, "compressionType"), "identifier") != 4
        && objc_msgSend((id)objc_msgSend(a3, "compressionType"), "identifier") != 5
        && ((v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "asset"), "fileURLWithDocument:", self), "pathExtension"), !objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("PNG")))|| !objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("PDF"))|| !objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("SVG")))&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "keySpec"), "part"), "identifier") == 181&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "keySpec"), "element"), "identifier") == 85;
  return result;
}

- (BOOL)needToCreateForwardstopFor2018DeploymentVariant:(id)a3 withCompressionTypes:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!-[CoreThemeDocument needToCreateForwardstopForPlatform](self, "needToCreateForwardstopForPlatform"))
    return 0;
  if (objc_msgSend((id)objc_msgSend(a3, "renditionType"), "identifier"))
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a3, "production");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  objc_msgSend(a3, "production");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  v8 = objc_msgSend(a3, "compressionType");
  if (v8 == objc_msgSend(a4, "objectAtIndex:", 3))
    return -[CoreThemeDocument shouldCreateForwardstopForLossy](self, "shouldCreateForwardstopForLossy");
  v9 = objc_msgSend(a3, "compressionType");
  if (v9 != objc_msgSend(a4, "objectAtIndex:", 2))
  {
    v10 = objc_msgSend(a3, "compressionType");
    if (v10 != objc_msgSend(a4, "objectAtIndex:", 0))
      return 0;
  }
  return -[CoreThemeDocument shouldCreate2018ForwardstopForLossless](self, "shouldCreate2018ForwardstopForLossless");
}

- (BOOL)needToCreateForwardstopFor2019DeploymentVariant:(id)a3 withCompressionTypes:(id)a4
{
  uint64_t v7;
  uint64_t v8;

  if (-[CoreThemeDocument needToCreateForwardstopForPlatform](self, "needToCreateForwardstopForPlatform")
    && !objc_msgSend((id)objc_msgSend(a3, "renditionType"), "identifier")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(a3, "production"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_msgSend(a3, "production"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && ((v7 = objc_msgSend(a3, "compressionType"), v7 == objc_msgSend(a4, "objectAtIndex:", 2))
     || (v8 = objc_msgSend(a3, "compressionType"), v8 == objc_msgSend(a4, "objectAtIndex:", 0))))
  {
    return -[CoreThemeDocument shouldCreate2019ForwardstopForLossless](self, "shouldCreate2019ForwardstopForLossless");
  }
  else
  {
    return 0;
  }
}

- (void)createForwardstops:(id)a3 withCompressionTypes:(id)a4 withDeploymentTargets:(id)a5
{
  _BOOL4 v9;
  BOOL v10;
  id v11;
  id v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[CoreThemeDocument isArtworkRenditionEligibleForForwardstop:](self, "isArtworkRenditionEligibleForForwardstop:", a3))
  {
    v9 = -[CoreThemeDocument needToCreateForwardstopFor2018DeploymentVariant:withCompressionTypes:](self, "needToCreateForwardstopFor2018DeploymentVariant:withCompressionTypes:", a3, a4);
    v10 = -[CoreThemeDocument needToCreateForwardstopFor2019DeploymentVariant:withCompressionTypes:](self, "needToCreateForwardstopFor2019DeploymentVariant:withCompressionTypes:", a3, a4);
    if (v9)
    {
      v11 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("SimpleArtworkRenditionSpec"));
      objc_msgSend((id)objc_msgSend(a3, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 0));
      objc_msgSend(a3, "copyAttributesInto:", v11);
      objc_msgSend(v11, "setAllowsPaletteImageCompression:", -[CoreThemeDocument shouldAllowPaletteImageCompressionForDeploymentTarget:](self, "shouldAllowPaletteImageCompressionForDeploymentTarget:", 3));
      objc_msgSend(v11, "setAllowsDeepmapCompression:", -[CoreThemeDocument shouldAllowDeepmapCompressionForDeploymentTarget:](self, "shouldAllowDeepmapCompressionForDeploymentTarget:", 3));
      objc_msgSend(v11, "setAllowsHevcCompression:", -[CoreThemeDocument shouldAllowHevcCompressionForDeploymentTarget:](self, "shouldAllowHevcCompressionForDeploymentTarget:", 3));
      objc_msgSend(v11, "setProduction:", objc_msgSend(a3, "production"));
      objc_msgSend(v11, "setAsset:", objc_msgSend(a3, "asset"));
      objc_msgSend(v11, "setSlices:", objc_msgSend(a3, "slices"));
      objc_msgSend(v11, "resetToBaseKeySpec");
      objc_msgSend((id)objc_msgSend(a3, "keySpec"), "copyAttributesInto:", objc_msgSend(v11, "keySpec"));
      objc_msgSend((id)objc_msgSend(v11, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 3));

      if (v10)
      {
        v12 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("SimpleArtworkRenditionSpec"));
        objc_msgSend(a3, "copyAttributesInto:", v12);
LABEL_9:
        objc_msgSend(v12, "setAllowsDeepmap2Compression:", -[CoreThemeDocument shouldAllowDeepmap2CompressionForDeploymentTarget:](self, "shouldAllowDeepmap2CompressionForDeploymentTarget:", 5));
        objc_msgSend(v12, "setProduction:", objc_msgSend(a3, "production"));
        objc_msgSend(v12, "setAsset:", objc_msgSend(a3, "asset"));
        objc_msgSend(v12, "setSlices:", objc_msgSend(a3, "slices"));
        objc_msgSend(v12, "resetToBaseKeySpec");
        objc_msgSend((id)objc_msgSend(a3, "keySpec"), "copyAttributesInto:", objc_msgSend(v12, "keySpec"));
        objc_msgSend((id)objc_msgSend(v12, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 5));

        return;
      }
    }
    else
    {
      objc_msgSend(a3, "setAllowsPaletteImageCompression:", -[CoreThemeDocument shouldAllowPaletteImageCompression](self, "shouldAllowPaletteImageCompression"));
      objc_msgSend(a3, "setAllowsHevcCompression:", -[CoreThemeDocument shouldAllowHevcCompression](self, "shouldAllowHevcCompression"));
      objc_msgSend(a3, "setAllowsDeepmapCompression:", -[CoreThemeDocument shouldAllowDeepmapCompression](self, "shouldAllowDeepmapCompression"));
      if (v10)
      {
        v12 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("SimpleArtworkRenditionSpec"));
        objc_msgSend((id)objc_msgSend(a3, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 0));
        objc_msgSend(a3, "copyAttributesInto:", v12);
        goto LABEL_9;
      }
    }
    objc_msgSend(a3, "setAllowsDeepmap2Compression:", -[CoreThemeDocument shouldAllowDeepmap2Compression](self, "shouldAllowDeepmap2Compression"));
  }
}

- (id)compressionTypes
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D08] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D08];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)deploymentTargets
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D10] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D10];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument deploymentTargetWithIdentifier:](self, "deploymentTargetWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)idioms
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D50] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D50];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument idiomWithIdentifier:](self, "idiomWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)displayGamuts
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D20] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D20];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)sizeClasses
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D98] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D98];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)featureSetClasses
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D40] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D40];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument graphicsFeatureSetClassWithIdentifier:](self, "graphicsFeatureSetClassWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)directions
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D18] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D18];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)textureFaces
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28D80] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28D80];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument textureFaceWithIdentifier:](self, "textureFaceWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)glyphsSizes
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28DB0] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28DB0];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument glyphSizeWithIdentifier:](self, "glyphSizeWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)glyphWeights
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28DB8] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28DB8];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument glyphWeightWithIdentifier:](self, "glyphWeightWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)glyphRenderingModes
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (*(_QWORD *)(MEMORY[0x24BE28DA8] + 16))
  {
    v4 = (_QWORD *)MEMORY[0x24BE28DA8];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument vectorGlyphRenderingModeWithIdentifier:](self, "vectorGlyphRenderingModeWithIdentifier:", *v4));
      v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (void)_createForwardstopRenditions
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;

  v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("RenditionSpec"), 0);
  v4 = -[CoreThemeDocument compressionTypes](self, "compressionTypes");
  v5 = -[CoreThemeDocument deploymentTargets](self, "deploymentTargets");
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
      -[CoreThemeDocument createForwardstops:withCompressionTypes:withDeploymentTargets:](self, "createForwardstops:withCompressionTypes:withDeploymentTargets:", objc_msgSend(v3, "objectAtIndex:", v6++), v4, v5);
    while (v6 < objc_msgSend(v3, "count"));
  }
}

- (id)createNamedArtworkProductionsForAssets:(id)a3 customInfos:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  NSMutableDictionary *explicitlyPackedPackings;
  uint64_t v59;
  NSMutableDictionary *explicitlyPackedContents;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  id v89;
  id v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  uint64_t v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  void *v108;
  id v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  id v145;
  id v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  uint64_t v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  unsigned int v167;
  unsigned int v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  unsigned int v174;
  double v175;
  uint64_t v176;
  uint64_t v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t n;
  void *v185;
  id v186;
  void *v187;
  id v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t ii;
  uint64_t v194;
  id v195;
  void *v196;
  uint64_t v198;
  uint64_t v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  double v222;
  double v223;
  id v224;
  id v226;
  int v227;
  double v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v236;
  id v237;
  id v238;
  uint64_t v239;
  id v240;
  id v241;
  void *v242;
  id v243;
  id v244;
  id v245;
  id v246;
  void *v247;
  id v248;
  id v250;
  void *v251;
  double v252;
  id v253;
  uint64_t v254;
  id v255;
  void *v256;
  double v257;
  void *v258;
  void *v259;
  double v260;
  void *v261;
  id v262;
  id obj;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  _QWORD v272[5];
  _QWORD v273[5];
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  _BYTE v302[128];
  _BYTE v303[128];
  _BYTE v304[128];
  _BYTE v305[128];
  _BYTE v306[128];
  _BYTE v307[128];
  _BYTE v308[128];
  _BYTE v309[128];
  _BYTE v310[128];
  uint64_t v311;
  CGRect v312;

  v311 = *MEMORY[0x24BDAC8D0];
  v242 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3, a4, a5);
  v240 = -[CoreThemeDocument _namedImagePartDefinition](self, "_namedImagePartDefinition");
  v243 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 85);
  v237 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 181);
  v220 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 42);
  v224 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 208);
  v219 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 218);
  v234 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 220);
  v241 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 0);
  v207 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1);
  v206 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 2);
  v205 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 3);
  v230 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1002);
  v229 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1018);
  v217 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1006);
  v218 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1010);
  v246 = -[CoreThemeDocument idioms](self, "idioms");
  v245 = -[CoreThemeDocument displayGamuts](self, "displayGamuts");
  v226 = -[CoreThemeDocument deploymentTargets](self, "deploymentTargets");
  v232 = -[CoreThemeDocument featureSetClasses](self, "featureSetClasses");
  v244 = -[CoreThemeDocument sizeClasses](self, "sizeClasses");
  v236 = -[CoreThemeDocument directions](self, "directions");
  obj = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("NamedArtworkProduction"), 0, 0));
  v262 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v248 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 10);
  v216 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 11);
  v215 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 12);
  v214 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 20);
  v213 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 23);
  v212 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 30);
  v211 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 21);
  v210 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 24);
  v209 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 31);
  v208 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 34);
  v238 = -[CoreThemeDocument templateRenderingModeWithIdentifier:](self, "templateRenderingModeWithIdentifier:", 0);
  v233 = -[CoreThemeDocument templateRenderingModeWithIdentifier:](self, "templateRenderingModeWithIdentifier:", 1);
  v231 = -[CoreThemeDocument templateRenderingModeWithIdentifier:](self, "templateRenderingModeWithIdentifier:", 2);
  v253 = -[CoreThemeDocument compressionTypes](self, "compressionTypes");
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Tag"), 0, 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v298, v310, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v299;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v299 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v298 + 1) + 8 * i)), objc_msgSend(*(id *)(*((_QWORD *)&v298 + 1) + 8 * i), "identifier"));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v298, v310, 16);
    }
    while (v9);
  }
  v12 = a4;
  v221 = -[CoreThemeDocument _sizeIndexesByNameFromNamedAssetImportInfos:](self, "_sizeIndexesByNameFromNamedAssetImportInfos:", a4);
  v13 = a3;
  v261 = v6;
  if (objc_msgSend(a3, "count"))
  {
    v14 = 0;
    v15 = 0x24BDD1000;
    v16 = *MEMORY[0x24BDBF090];
    v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v247 = (void *)*MEMORY[0x24BDBD430];
    v222 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v223 = *MEMORY[0x24BDBF148];
    v239 = *MEMORY[0x24BDBD268];
    while (1)
    {
      v20 = (void *)objc_msgSend(v13, "objectAtIndex:", v14);
      v21 = objc_msgSend(v12, "count");
      v258 = v20;
      v254 = v14;
      if (v21 != objc_msgSend(v13, "count"))
        break;
      v22 = (void *)objc_msgSend(v12, "objectAtIndex:", v14);
      v23 = v22;
      if (v20 == v247)
      {
        v24 = objc_msgSend(v22, "name");
        if (!v23)
          goto LABEL_28;
      }
      else
      {
        if (!v22)
          goto LABEL_15;
        v24 = objc_msgSend(v22, "name");
      }
      if (objc_msgSend(v23, "renditionType") != 1002
        && objc_msgSend(v23, "renditionType") != 1018
        && objc_msgSend(v23, "renditionType") != 1004
        && objc_msgSend(v23, "renditionType") != 1006)
      {
        v156 = objc_msgSend(v23, "renditionType");
        v158 = v222;
        v157 = v223;
        if (v156 != 1000)
          objc_msgSend(v258, "sourceImageSizeWithDocument:", self, v223, v222);
        v201 = v157;
        v202 = v158;
        objc_msgSend(v23, "sliceInsets");
        v228 = v159;
        v252 = v160;
        v257 = v161;
        v260 = v162;
        objc_msgSend(v23, "resizableSliceSize");
        v203 = v163;
        v204 = v164;
        v165 = (void *)objc_msgSend(v258, "fileURLWithDocument:", self);
        if (objc_msgSend(v23, "renditionType") == 1000)
        {
          v30 = v19;
          v31 = v18;
          v32 = v17;
          v33 = v16;
        }
        else
        {
          v166 = v23;
          if (objc_msgSend(v23, "renditionType") == 1017
            || objc_msgSend((id)objc_msgSend(v165, "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF"))
            && objc_msgSend((id)objc_msgSend(v165, "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG")))
          {
            v30 = v19;
            v31 = v18;
            v32 = v17;
            v33 = v16;
          }
          else
          {
            v200 = v16;
            v167 = objc_msgSend(v258, "fileScaleFactor");
            v168 = objc_msgSend(v258, "scaleFactor");
            objc_msgSend(v166, "alignmentRect");
            v33 = v169;
            v32 = v170;
            v31 = v171;
            v30 = v172;
            if (v167)
            {
              v173 = (double)v167;
            }
            else
            {
              v174 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", objc_msgSend(v165, "lastPathComponent"));
              if (v174)
                v173 = (double)v174;
              else
                v173 = 1.0;
            }
            objc_msgSend(v258, "setFileScaleFactor:", v173);
            v175 = (double)v168 / v173;
            v23 = v166;
            if (v175 != 1.0)
            {
              v228 = v228 * v175;
              v252 = v252 * v175;
              v257 = v257 * v175;
              v260 = v260 * v175;
              v203 = v203 * v175;
              v204 = v204 * v175;
              v33 = v33 * v175;
              v32 = v32 * v175;
              v30 = v30 * v175;
              v31 = v31 * v175;
            }
            v16 = v200;
          }
        }
        v28 = -[CoreThemeDocument slicesComputedForImageSize:usingSliceInsets:resizableSliceSize:withRenditionType:](self, "slicesComputedForImageSize:usingSliceInsets:resizableSliceSize:withRenditionType:", objc_msgSend(v23, "renditionType"), v201, v202, v228, v252, v257, v260, v203, v204);
        v176 = objc_msgSend(v28, "count");
        if (v176 >= 1)
        {
          v177 = v176;
          if (objc_msgSend(v23, "renditionType") < 1)
            goto LABEL_309;
          if (v177 == 9)
          {
            v180 = objc_msgSend(v23, "renditionType");
            v27 = 0;
            v34 = v241;
            if (v180 == 3)
              v34 = v205;
          }
          else
          {
            if (v177 != 4)
            {
LABEL_309:
              v27 = 0;
              v255 = v241;
              goto LABEL_31;
            }
            if (objc_msgSend(v23, "renditionType") == 1)
              v178 = v207;
            else
              v178 = v241;
            v179 = objc_msgSend(v23, "renditionType");
            v27 = 0;
            v34 = v206;
            if (v179 != 2)
              v34 = v178;
          }
          goto LABEL_30;
        }
        v27 = 0;
LABEL_29:
        v34 = v241;
LABEL_30:
        v255 = v34;
        goto LABEL_31;
      }
      if (objc_msgSend(v23, "renditionType") == 1002 || objc_msgSend(v23, "renditionType") == 1018)
      {
        v26 = objc_msgSend(v23, "renditionType");
        v27 = 0;
        v28 = 0;
        v29 = v230;
        if (v26 != 1002)
          v29 = v229;
      }
      else
      {
        if (objc_msgSend(v23, "renditionType") == 1004)
        {
          if (!self->_explicitlyPackedIdentifiers)
            self->_explicitlyPackedIdentifiers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          v297 = 0u;
          v296 = 0u;
          v295 = 0u;
          v294 = 0u;
          v53 = (void *)objc_msgSend(v23, "containedImageNames");
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v294, v309, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v295;
            do
            {
              for (j = 0; j != v55; ++j)
              {
                if (*(_QWORD *)v295 != v56)
                  objc_enumerationMutation(v53);
                -[NSMutableDictionary setObject:forKey:](self->_explicitlyPackedIdentifiers, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v23, "nameIdentifier")), *(_QWORD *)(*((_QWORD *)&v294 + 1) + 8 * j));
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v294, v309, 16);
            }
            while (v55);
          }
          explicitlyPackedPackings = self->_explicitlyPackedPackings;
          if (!explicitlyPackedPackings)
          {
            explicitlyPackedPackings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
            self->_explicitlyPackedPackings = explicitlyPackedPackings;
          }
          v59 = objc_msgSend(v23, "name");
          -[NSMutableDictionary setObject:forKey:](explicitlyPackedPackings, "setObject:forKey:", v59, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v23, "nameIdentifier")));
          explicitlyPackedContents = self->_explicitlyPackedContents;
          v12 = a4;
          if (!explicitlyPackedContents)
          {
            explicitlyPackedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
            self->_explicitlyPackedContents = explicitlyPackedContents;
          }
          v61 = objc_msgSend(v23, "containedImageNames");
          -[NSMutableDictionary setObject:forKey:](explicitlyPackedContents, "setObject:forKey:", v61, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v23, "nameIdentifier")));
          v15 = 0x24BDD1000uLL;
          v13 = a3;
          goto LABEL_280;
        }
        v74 = objc_msgSend(v23, "renditionType");
        v27 = 0;
        v28 = 0;
        v29 = v241;
        if (v74 == 1006)
          v29 = v217;
      }
      v255 = v29;
      v30 = v19;
      v31 = v18;
      v32 = v17;
      v33 = v16;
LABEL_31:
      v259 = v23;
      if (objc_msgSend(v23, "renditionType") == 1002 || objc_msgSend(v23, "renditionType") == 1018)
      {
        v292 = 0u;
        v293 = 0u;
        v290 = 0u;
        v291 = 0u;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v290, v308, 16);
        if (!v35)
          goto LABEL_95;
        v36 = v35;
        v37 = *(_QWORD *)v291;
LABEL_35:
        v38 = 0;
        while (1)
        {
          if (*(_QWORD *)v291 != v37)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v290 + 1) + 8 * v38);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "name"), "name"), "isEqualToString:", v24) & 1) != 0)
          {
            break;
          }
          if (v36 == ++v38)
          {
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v290, v308, 16);
            if (v36)
              goto LABEL_35;
            goto LABEL_95;
          }
        }
      }
      else if (objc_msgSend(v23, "iconSize"))
      {
        v288 = 0uLL;
        v289 = 0uLL;
        v286 = 0uLL;
        v287 = 0uLL;
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v286, v307, 16);
        if (!v40)
          goto LABEL_95;
        v41 = v40;
        v42 = *(_QWORD *)v287;
LABEL_46:
        v43 = 0;
        while (1)
        {
          if (*(_QWORD *)v287 != v42)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v286 + 1) + 8 * v43);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "name"), "name"), "isEqualToString:", v24) & 1) != 0)
          {
            break;
          }
          if (v41 == ++v43)
          {
            v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v286, v307, 16);
            v44 = 0;
            if (v41)
              goto LABEL_46;
            goto LABEL_96;
          }
        }
      }
      else
      {
        v284 = 0uLL;
        v285 = 0uLL;
        v282 = 0uLL;
        v283 = 0uLL;
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v282, v306, 16);
        if (!v45)
          goto LABEL_95;
        v46 = v45;
        v47 = *(_QWORD *)v283;
LABEL_56:
        v48 = 0;
        while (1)
        {
          if (*(_QWORD *)v283 != v47)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v282 + 1) + 8 * v48);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "name"), "name"), "isEqualToString:", v24) & 1) != 0)
              {
                break;
              }
            }
          }
          if (v46 == ++v48)
          {
            v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v282, v306, 16);
            v44 = 0;
            if (v46)
              goto LABEL_56;
            goto LABEL_96;
          }
        }
      }
      if (v39)
      {
        objc_opt_class();
        v49 = v259;
        if ((objc_opt_isKindOfClass() & 1) == 0
          || objc_msgSend(v259, "renditionType") == 1002
          || objc_msgSend(v259, "renditionType") == 1018)
        {
          v50 = v255;
          if (objc_msgSend(v259, "renditionType") != 1002 && objc_msgSend(v259, "renditionType") != 1018
            || !objc_msgSend(v39, "isMemberOfClass:", objc_opt_class()))
          {
            v52 = v39;
            if ((v27 & 1) == 0)
              goto LABEL_154;
            goto LABEL_155;
          }
          v44 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedArtworkProduction"));
          objc_msgSend(v44, "setBaseKeySpec:", objc_msgSend(v39, "baseKeySpec"));
          objc_msgSend(v44, "setRenditions:", objc_msgSend(v39, "renditions"));
          objc_msgSend((id)objc_msgSend(v44, "baseKeySpec"), "setPart:", v224);
          objc_msgSend(v44, "setRenditionType:", objc_msgSend(v39, "renditionType"));
          goto LABEL_96;
        }
        v52 = (id)objc_msgSend(v39, "flattenedImageProduction");
        v50 = v255;
        if (v52)
          goto LABEL_93;
        v52 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedArtworkProduction"));
        objc_msgSend(v39, "setFlattenedImageProduction:", v52);
        v62 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v62, "setElement:", objc_msgSend((id)objc_msgSend(v39, "baseKeySpec"), "element"));
        objc_msgSend(v62, "setPart:", v224);
        objc_msgSend(v52, "setBaseKeySpec:", v62);
        objc_msgSend(v52, "setRenditionType:", v241);

        v49 = v259;
        if (v52)
        {
LABEL_93:
          if ((v27 & 1) == 0)
            goto LABEL_154;
          goto LABEL_155;
        }
      }
LABEL_95:
      v44 = 0;
LABEL_96:
      if (objc_msgSend(v259, "renditionType") == 1002 || objc_msgSend(v259, "renditionType") == 1018)
      {
        v63 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("LayerStackProduction"));
        v52 = v63;
        if (v44)
          objc_msgSend(v63, "setFlattenedImageProduction:", v44);
      }
      else if (objc_msgSend(v259, "iconSize"))
      {
        v52 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("MultisizeImageSetProduction"));
        objc_msgSend(v52, "setSizeIndexes:", objc_msgSend(v221, "objectForKey:", objc_msgSend(v259, "name")));
      }
      else
      {
        v52 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedArtworkProduction"));
        objc_msgSend(v52, "setMakeOpaqueIfPossible:", 1);
      }
      v64 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
      if ((v27 & 1) != 0)
        v65 = -[CoreThemeDocument _createNamedElementWithNextAvailableIdentifier](self, "_createNamedElementWithNextAvailableIdentifier");
      else
        v65 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v259, "nameIdentifier"));
      v66 = v65;
      v250 = v28;
      objc_msgSend(v65, "setName:", v24);
      objc_msgSend(v66, "setProduction:", v52);
      objc_msgSend(v64, "setElement:", v243);
      if ((v27 & 1) != 0 || (v67 = objc_msgSend(v259, "iconSize"), v68 = v234, !v67))
        v68 = v237;
      objc_msgSend(v64, "setPart:", v68);
      objc_msgSend(v64, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v66, "identifier"), "unsignedIntValue"));
      objc_msgSend(v52, "setBaseKeySpec:", v64);

      objc_msgSend(v52, "setPartDefinition:", v240);
      objc_msgSend(v52, "setIsExcludedFromFilter:", v239);
      v50 = v255;
      objc_msgSend(v52, "setRenditionType:", v255);
      objc_msgSend(v52, "setRenditionSubtype:", v248);
      v69 = v52;
      objc_msgSend(v52, "setComment:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Named Image from: %@"), objc_msgSend(v258, "name")));
      if ((v27 & 1) != 0)
      {
        if (+[TDAsset isTemplateFromImageFilename:](TDAsset, "isTemplateFromImageFilename:", objc_msgSend(v258, "name")))
        {
          v70 = v52;
          v71 = v233;
        }
        else
        {
          v70 = v52;
          v71 = v238;
        }
        objc_msgSend(v70, "setTemplateRenderingMode:", v71);
        v49 = v259;
      }
      else
      {
        v49 = v259;
        v72 = objc_msgSend(v259, "renditionSubtype");
        v73 = v248;
        switch(v72)
        {
          case 10:
            goto LABEL_127;
          case 11:
            v73 = v216;
            goto LABEL_127;
          case 12:
            v73 = v215;
            goto LABEL_127;
          case 20:
            v73 = v214;
            goto LABEL_127;
          case 21:
            v73 = v211;
            goto LABEL_127;
          case 23:
            v73 = v213;
            goto LABEL_127;
          case 24:
            v73 = v210;
            goto LABEL_127;
          case 30:
            v73 = v212;
            goto LABEL_127;
          case 31:
            v73 = v209;
            goto LABEL_127;
          case 34:
            v73 = v208;
LABEL_127:
            objc_msgSend(v52, "setRenditionSubtype:", v73);
            break;
          default:
            break;
        }
        v75 = objc_msgSend(v259, "templateRenderingMode", v73);
        v76 = v238;
        if (!v75 || (v76 = v231, v75 == 2) || (v76 = v233, v75 == 1))
          objc_msgSend(v52, "setTemplateRenderingMode:", v76);
        objc_msgSend(v52, "setOptOutOfThinning:", objc_msgSend(v259, "optOutOfThinning", v76));
        objc_msgSend(v52, "setIsFlippable:", objc_msgSend(v259, "isFlippable"));
        objc_msgSend(v52, "setDateOfLastChange:", objc_msgSend(v259, "modificationDate"));
        objc_msgSend(v52, "setHasCustomDateOfLastChange:", 1);
        if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 17))
          objc_msgSend(v52, "setPreservesVectorRepresentation:", objc_msgSend(v259, "preservesVectorRepresentation"));
        objc_msgSend(v52, "setAutoscalingType:", objc_msgSend(v259, "autoscalingType"));
        v77 = (void *)objc_msgSend(v259, "tags");
        if (objc_msgSend(v77, "count") && -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 1))
        {
          v227 = v27;
          v78 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v278 = 0u;
          v279 = 0u;
          v280 = 0u;
          v281 = 0u;
          v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v278, v305, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v279;
            do
            {
              for (k = 0; k != v80; ++k)
              {
                if (*(_QWORD *)v279 != v81)
                  objc_enumerationMutation(v77);
                v83 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * k);
                v84 = (void *)objc_msgSend(v261, "objectForKey:", v83);
                if (objc_msgSend(v84, "count"))
                {
                  if (objc_msgSend(v84, "count") != 1)
                    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 4292, CFSTR("We should ONLY have 1 tag with a name, tag names need to be Unique"));
                  v85 = (id)objc_msgSend(v84, "objectAtIndex:", 0);
                }
                else
                {
                  v85 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Tag"));
                  objc_msgSend(v85, "setIdentifier:", v83);
                  objc_msgSend(v261, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v85), v83);
                }
                v15 = 0x24BDD1000uLL;
                objc_msgSend(v78, "addObject:", v85);
              }
              v80 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v278, v305, 16);
            }
            while (v80);
          }
          v52 = v69;
          objc_msgSend(v69, "addTags:", v78);
          v86 = objc_msgSend(v77, "count");
          if (v86 != objc_msgSend(v78, "count"))
            objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 4299, CFSTR("Supplied tags should always equal the count of tags on the production else the counts are wrong"));

          v13 = a3;
          v49 = v259;
          v27 = v227;
          v50 = v255;
        }
        if (objc_msgSend((id)objc_msgSend(v49, "universalTypeIdentifier"), "length"))
          objc_msgSend(v52, "setUniversalTypeIdentifier:", objc_msgSend(v49, "universalTypeIdentifier"));
      }
      objc_msgSend(obj, "addObject:", v52);
      objc_msgSend(v242, "addObject:", v52);
      v28 = v250;
      if ((v27 & 1) == 0)
      {
LABEL_154:
        v87 = objc_msgSend(v49, "iconSize");
        v51 = CFSTR("MultisizeImageRenditionSpec");
        if (v87)
          goto LABEL_159;
      }
LABEL_155:
      v88 = objc_msgSend(v50, "identifier", v51);
      v51 = CFSTR("LayerStackRenditionSpec");
      if (v88 != 1002)
      {
        if (objc_msgSend(v50, "identifier", CFSTR("LayerStackRenditionSpec")) == 1018)
          v51 = CFSTR("LayerStackRenditionSpec");
        else
          v51 = CFSTR("SimpleArtworkRenditionSpec");
      }
LABEL_159:
      v89 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v51);
      v90 = v89;
      objc_msgSend(v89, "setProduction:", v52);
      objc_msgSend(v89, "setPreserveForArchiveOnly:", objc_msgSend(v49, "preserveForArchiveOnly"));
      objc_opt_class();
      v91 = v258;
      v256 = v52;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v89, "setAsset:", v258);
          if ((v27 & 1) != 0)
          {
            v27 = 1;
          }
          else
          {
            objc_msgSend(v49, "canvasSize");
            objc_msgSend(v89, "setCanvasSize:");
            v251 = v89;
            objc_msgSend(v89, "setCompressionType:", objc_msgSend(v253, "objectAtIndexedSubscript:", objc_msgSend(v49, "compressionType")));
            v102 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
            v274 = 0u;
            v275 = 0u;
            v276 = 0u;
            v277 = 0u;
            v103 = (void *)objc_msgSend(v49, "layerReferences");
            v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v274, v304, 16);
            if (v104)
            {
              v105 = v104;
              v106 = *(_QWORD *)v275;
              do
              {
                for (m = 0; m != v105; ++m)
                {
                  if (*(_QWORD *)v275 != v106)
                    objc_enumerationMutation(v103);
                  v108 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * m);
                  v109 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("LayerReference"));
                  objc_msgSend(v108, "frame");
                  objc_msgSend(v109, "setFrameRect:", floor(v110), floor(v111));
                  objc_msgSend(v109, "setName:", objc_msgSend(v108, "layerName"));
                  v112 = *(void **)(v15 + 1760);
                  objc_msgSend(v108, "opacity");
                  objc_msgSend(v109, "setOpacity:", objc_msgSend(v112, "numberWithDouble:"));
                  objc_msgSend(v109, "setBlendMode:", objc_msgSend(*(id *)(v15 + 1760), "numberWithInt:", objc_msgSend(v108, "blendMode")));
                  objc_msgSend(v109, "setMakeOpaqueIfPossible:", objc_msgSend(v108, "makeOpaqueIfPossible"));
                  v113 = (void *)objc_msgSend(obj, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(v108, "layerName")));
                  if (objc_msgSend(v113, "count")
                    && (objc_msgSend(v113, "objectAtIndex:", 0), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                    && (v114 = objc_msgSend(v113, "objectAtIndex:", 0)) != 0)
                  {
                    v115 = (void *)v114;
                    objc_msgSend(v109, "setReference:", v114);
                    objc_msgSend(v115, "setMakeOpaqueIfPossible:", objc_msgSend(v109, "makeOpaqueIfPossible"));
                  }
                  else
                  {
                    objc_msgSend(v262, "addObject:", v109);
                  }
                  objc_msgSend(v102, "addObject:", v109);

                }
                v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v274, v304, 16);
              }
              while (v105);
            }
            v89 = v251;
            objc_msgSend(v251, "setLayerReferences:", v102);

            v27 = 0;
            v13 = a3;
            v91 = v258;
            v49 = v259;
            v52 = v256;
          }
        }
        goto LABEL_214;
      }
      objc_msgSend(v89, "setAsset:", v258);
      objc_msgSend(v49, "physicalSizeInMeters");
      if (v92 > 0.0 && v93 > 0.0)
      {
        v94 = v89;
LABEL_169:
        objc_msgSend(v94, "setPhysicalSizeInMeters:", v92, v93);
        goto LABEL_171;
      }
      if (v92 == 0.0 && v93 == 0.0)
      {
        v94 = v89;
        v93 = v222;
        v92 = v223;
        goto LABEL_169;
      }
      v95 = objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v198 = objc_msgSend(v258, "name");
      v96 = (void *)v95;
      v49 = v259;
      objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 4344, CFSTR("%@ recognition image asset should have at both width/height in the physical size > 0"), v198);
LABEL_171:
      v312.origin.x = v33;
      v312.origin.y = v32;
      v312.size.width = v31;
      v312.size.height = v30;
      if (CGRectIsEmpty(v312))
      {
        if ((v27 & 1) != 0)
          goto LABEL_175;
        objc_msgSend(v49, "alignmentRect");
        v33 = v97;
        v32 = v98;
        v31 = v99;
        v30 = v100;
      }
      objc_msgSend(v89, "setAlignmentRect:", v33, v32, v31, v30);
LABEL_175:
      if (objc_msgSend(v28, "count"))
        objc_msgSend(v89, "setSlices:", v28);
      if (objc_msgSend(v49, "renditionType") == 1000)
      {
        if (!-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 5))
          goto LABEL_212;
        if (objc_msgSend(v49, "compressionType") == 2
          || !objc_msgSend(v49, "compressionType")
          || objc_msgSend(v49, "compressionType") == 1)
        {
          goto LABEL_211;
        }
        objc_msgSend(v89, "setCompressionType:", objc_msgSend(v253, "objectAtIndexedSubscript:", 0));
        if (objc_msgSend(v49, "compressionType") && objc_msgSend(v49, "compressionType") != 1)
        {
          v199 = objc_msgSend(v49, "name");
          v49 = v259;
          NSLog(CFSTR("CoreUI: Only Lossless Compression is supported on data files name:'%@' url:'%@'"), v199, objc_msgSend(v259, "fileURL"));
        }
      }
      else
      {
        v101 = objc_msgSend(v49, "compressionType");
        if ((unint64_t)(v101 - 4) >= 2)
        {
          if (v101 == 3)
          {
            if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 3))
              goto LABEL_211;
          }
          else
          {
            if (v101 != 7 || -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 10))
            {
LABEL_211:
              v120 = objc_msgSend(v49, "compressionType");
              v119 = v253;
              goto LABEL_213;
            }
LABEL_208:
            if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 3))
            {
              v119 = v253;
              v120 = 3;
LABEL_213:
              objc_msgSend(v89, "setCompressionType:", objc_msgSend(v119, "objectAtIndexedSubscript:", v120));
              goto LABEL_214;
            }
          }
LABEL_212:
          v119 = v253;
          v120 = 0;
          goto LABEL_213;
        }
        if (!-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 4))
          goto LABEL_208;
        objc_msgSend(v89, "setCompressionType:", objc_msgSend(v253, "objectAtIndexedSubscript:", objc_msgSend(v49, "compressionType")));
        if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 1
          || -[CoreThemeDocument targetPlatform](self, "targetPlatform") == 4
          || -[CoreThemeDocument targetPlatform](self, "targetPlatform") == 3)
        {
          v116 = objc_msgSend(v226, "objectAtIndexedSubscript:", 1);
          v117 = (void *)objc_msgSend(v89, "keySpec");
          v118 = v116;
          v49 = v259;
          objc_msgSend(v117, "setTarget:", v118);
        }
      }
LABEL_214:
      objc_msgSend(v89, "resetToBaseKeySpec");
      v121 = (void *)objc_msgSend(v89, "keySpec");
      objc_msgSend(v121, "setScaleFactor:", objc_msgSend(v91, "scaleFactor"));
      if (!objc_msgSend(v52, "preservesVectorRepresentation")
        || objc_msgSend(v121, "scaleFactor")
        || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "fileURLWithDocument:", self), "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF"))&& (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "fileURLWithDocument:", self), "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG"))|| objc_msgSend((id)objc_msgSend(v121, "glyphWeight"), "identifier")))
      {
        if ((v27 & 1) != 0)
          goto LABEL_220;
      }
      else
      {
        objc_msgSend(v121, "setScaleFactor:", objc_msgSend(v91, "fileScaleFactor"));
        objc_msgSend(v121, "setPart:", v220);
        if ((v27 & 1) != 0)
        {
LABEL_220:
          objc_msgSend(v121, "setSubtype:", +[TDAsset subtypeFromImageFilename:](TDAsset, "subtypeFromImageFilename:", objc_msgSend(v91, "name")));
          v52 = v256;
          v122 = +[TDAsset idiomFromImageFilename:](TDAsset, "idiomFromImageFilename:", objc_msgSend(v91, "name"));
          goto LABEL_223;
        }
      }
      objc_msgSend(v121, "setSubtype:", objc_msgSend(v49, "subtype"));
      v122 = objc_msgSend(v49, "idiom");
LABEL_223:
      v123 = (void *)objc_msgSend(v246, "objectAtIndex:", v122);
      objc_msgSend(v121, "setIdiom:", v123);
      if (objc_msgSend(v123, "identifier") == 6)
        objc_msgSend(v52, "setMakeOpaqueIfPossible:", 1);
      if (!v27)
      {
        objc_msgSend(v121, "setGamut:", objc_msgSend(v245, "objectAtIndexedSubscript:", objc_msgSend(v259, "displayGamut")));
        v126 = objc_msgSend(v244, "objectAtIndexedSubscript:", objc_msgSend(v259, "sizeClassHorizontal"));
        v127 = objc_msgSend(v244, "objectAtIndexedSubscript:", objc_msgSend(v259, "sizeClassVertical"));
        v128 = v126;
        v125 = v259;
        objc_msgSend(v121, "setSizeClassHorizontal:", v128);
        objc_msgSend(v121, "setSizeClassVertical:", v127);
        objc_msgSend(v121, "setMemoryClass:", objc_msgSend(v259, "memoryClass"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v129 = objc_msgSend(v89, "compressionType");
          v124 = v253;
          v14 = v254;
          if (v129 == objc_msgSend(v253, "objectAtIndexedSubscript:", 4)
            || (v130 = objc_msgSend(v89, "compressionType"), v130 == objc_msgSend(v253, "objectAtIndexedSubscript:", 5)))
          {
            v12 = a4;
            v125 = v259;
            if (!-[CoreThemeDocument targetPlatform](self, "targetPlatform"))
              goto LABEL_243;
            if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 2)
              goto LABEL_243;
            objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", 2));
            if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") != 1)
              goto LABEL_243;
            v132 = v226;
            v133 = 1;
          }
          else
          {
            v131 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "asset"), "fileURLWithDocument:", self), "pathExtension");
            if (objc_msgSend(v131, "caseInsensitiveCompare:", CFSTR("HEIF"))
              && objc_msgSend(v131, "caseInsensitiveCompare:", CFSTR("HEIC")))
            {
              objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", objc_msgSend(v259, "graphicsFeatureSetClass")));
              v125 = v259;
              objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", objc_msgSend(v259, "graphicsFeatureSetClass")));
              v12 = a4;
LABEL_243:
              if (objc_msgSend(v125, "appearanceName"))
              {
                v134 = objc_msgSend(v125, "appearanceIdentifier");
                v135 = objc_msgSend(v259, "appearanceName");
                v136 = v134;
                v125 = v259;
                objc_msgSend(v121, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", v136, v135, 1));
              }
              if (objc_msgSend(v125, "localizationName"))
              {
                v137 = objc_msgSend(v125, "localizationIdentifier");
                v138 = objc_msgSend(v259, "localizationName");
                v139 = v137;
                v125 = v259;
                objc_msgSend(v121, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", v139, v138, 1));
              }
              objc_msgSend(v121, "setDirection:", objc_msgSend(v236, "objectAtIndexedSubscript:", objc_msgSend(v125, "layoutDirection")));
              goto LABEL_248;
            }
            v12 = a4;
            v125 = v259;
            if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") != 1
              && -[CoreThemeDocument targetPlatform](self, "targetPlatform") != 4
              && -[CoreThemeDocument targetPlatform](self, "targetPlatform") != 3)
            {
              goto LABEL_243;
            }
            v132 = v226;
            v133 = 2;
          }
          objc_msgSend(v121, "setTarget:", objc_msgSend(v132, "objectAtIndexedSubscript:", v133));
          goto LABEL_243;
        }
        objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", objc_msgSend(v259, "graphicsFeatureSetClass")));
        v12 = a4;
        v124 = v253;
        v14 = v254;
        goto LABEL_243;
      }
      objc_msgSend(v121, "setGamut:", objc_msgSend(v245, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v121, "setSizeClassHorizontal:", objc_msgSend(v244, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v121, "setSizeClassVertical:", objc_msgSend(v244, "objectAtIndexedSubscript:", 0));
      v12 = a4;
      v124 = v253;
      v14 = v254;
      v125 = v259;
LABEL_248:
      if (objc_msgSend(v125, "iconSize"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v140 = (void *)objc_msgSend(v256, "sizeIndexes");
            v273[0] = MEMORY[0x24BDAC760];
            v273[1] = 3221225472;
            v273[2] = __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke;
            v273[3] = &unk_24EF2C110;
            v273[4] = v125;
            v141 = (void *)objc_msgSend((id)objc_msgSend(v140, "objectsPassingTest:", v273), "anyObject");
            if (v141)
            {
              v142 = v141;
              objc_msgSend(v121, "setDimension2:", objc_msgSend(v141, "index"));
              objc_msgSend(v89, "setSizeIndex:", v142);
            }
            v143 = (void *)objc_msgSend(v256, "multisizeImageSetRenditions");
            v272[0] = MEMORY[0x24BDAC760];
            v272[1] = 3221225472;
            v272[2] = __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke_2;
            v272[3] = &unk_24EF2C110;
            v272[4] = v121;
            v144 = objc_msgSend((id)objc_msgSend(v143, "objectsPassingTest:", v272), "anyObject");
            if (v144)
            {
              objc_msgSend(v89, "setMultisizeImageSetRendition:", v144);
              v125 = v259;
            }
            else
            {
              v145 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("MultisizeImageSetRenditionSpec"));
              objc_msgSend(v145, "setRenditionType:", v218);
              v146 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
              objc_msgSend(v146, "setElement:", v243);
              objc_msgSend(v146, "setPart:", v219);
              objc_msgSend(v146, "setNameIdentifier:", objc_msgSend(v259, "nameIdentifier"));
              objc_msgSend(v146, "setIdiom:", objc_msgSend(v121, "idiom"));
              objc_msgSend(v146, "setSubtype:", objc_msgSend(v121, "subtype"));
              objc_msgSend(v145, "setKeySpec:", v146);

              objc_msgSend(v145, "setProduction:", v256);
              objc_msgSend(v89, "setMultisizeImageSetRendition:", v145);
              v147 = v145;
              v125 = v259;
              v13 = a3;
              objc_msgSend(v147, "setMultisizeImageSetProduction:", v256);
            }
            v124 = v253;
          }
        }
      }
      objc_msgSend(v89, "setPreserveForArchiveOnly:", objc_msgSend(v125, "preserveForArchiveOnly"));
      if (-[CoreThemeDocument targetPlatform](self, "targetPlatform"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v148 = objc_msgSend(v89, "compressionType");
          if ((v148 == objc_msgSend(v124, "objectAtIndexedSubscript:", 4)
             || (v149 = objc_msgSend(v89, "compressionType"),
                 v149 == objc_msgSend(v124, "objectAtIndexedSubscript:", 5)))
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "keySpec"), "target"), "identifier") == 1)
          {
            v150 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("SimpleArtworkRenditionSpec"));
            objc_msgSend(v150, "setProduction:", v256);
            objc_msgSend(v150, "setAsset:", objc_msgSend(v89, "asset"));
            objc_msgSend(v89, "alignmentRect");
            objc_msgSend(v150, "setAlignmentRect:");
            objc_msgSend(v150, "setSlices:", objc_msgSend(v89, "slices"));
            objc_msgSend(v150, "setIsBackstop:", 1);
            objc_msgSend(v89, "copyAttributesInto:", v150);
            if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 3))
              v151 = 3;
            else
              v151 = 0;
            objc_msgSend(v150, "setCompressionType:", objc_msgSend(v124, "objectAtIndexedSubscript:", v151));
            if (objc_msgSend((id)objc_msgSend(v150, "compressionType"), "identifier") == 3)
            {
              objc_msgSend(v150, "setAllowsHevcCompression:", -[CoreThemeDocument shouldAllowHevcCompression](self, "shouldAllowHevcCompression"));
            }
            else if (!objc_msgSend((id)objc_msgSend(v150, "compressionType"), "identifier"))
            {
              objc_msgSend(v150, "setAllowsPaletteImageCompression:", -[CoreThemeDocument shouldAllowPaletteImageCompression](self, "shouldAllowPaletteImageCompression"));
              objc_msgSend(v150, "setAllowsDeepmapCompression:", -[CoreThemeDocument shouldAllowDeepmapCompression](self, "shouldAllowDeepmapCompression"));
              objc_msgSend(v150, "setAllowsDeepmap2Compression:", -[CoreThemeDocument shouldAllowDeepmap2Compression](self, "shouldAllowDeepmap2Compression"));
            }
            objc_msgSend(v150, "resetToBaseKeySpec");
            v155 = (void *)objc_msgSend(v150, "keySpec");
            objc_msgSend(v155, "setIdiom:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "idiom"));
            objc_msgSend(v155, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "scaleFactor"));
            objc_msgSend(v155, "setSubtype:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "subtype"));
            objc_msgSend(v155, "setGamut:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "gamut"));
            objc_msgSend(v155, "setSizeClassHorizontal:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassHorizontal"));
            objc_msgSend(v155, "setSizeClassVertical:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassVertical"));
            objc_msgSend(v155, "setMemoryClass:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "memoryClass"));
            objc_msgSend(v155, "setDirection:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "direction"));
            objc_msgSend(v155, "setGraphicsFeatureSetClass:", 0);
            if ((objc_msgSend(v150, "allowsPaletteImageCompression") & 1) != 0
              || (objc_msgSend(v150, "allowsHevcCompression") & 1) != 0
              || objc_msgSend(v150, "allowsDeepmapCompression"))
            {
              objc_msgSend((id)objc_msgSend(v150, "keySpec"), "setTarget:", -[CoreThemeDocument deploymentTargetWithIdentifier:](self, "deploymentTargetWithIdentifier:", 3));
            }
            if (objc_msgSend(v150, "allowsDeepmap2Compression"))
              objc_msgSend((id)objc_msgSend(v150, "keySpec"), "setTarget:", -[CoreThemeDocument deploymentTargetWithIdentifier:](self, "deploymentTargetWithIdentifier:", 5));

            v12 = a4;
          }
          else
          {
            v152 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "asset"), "fileURLWithDocument:", self), "pathExtension");
            if ((!objc_msgSend(v152, "caseInsensitiveCompare:", CFSTR("HEIF"))
               || !objc_msgSend(v152, "caseInsensitiveCompare:", CFSTR("HEIC")))
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "keySpec"), "target"), "identifier") == 2)
            {
              v153 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("SimpleArtworkRenditionSpec"));
              objc_msgSend(v153, "setProduction:", v256);
              objc_msgSend(v153, "resetToBaseKeySpec");
              v154 = (void *)objc_msgSend(v153, "keySpec");
              objc_msgSend(v153, "setAsset:", objc_msgSend(v89, "asset"));
              objc_msgSend(v89, "alignmentRect");
              objc_msgSend(v153, "setAlignmentRect:");
              objc_msgSend(v153, "setSlices:", objc_msgSend(v89, "slices"));
              objc_msgSend(v153, "setCompressionType:", objc_msgSend(v124, "objectAtIndexedSubscript:", 3));
              objc_msgSend(v153, "setIsBackstop:", 1);
              objc_msgSend(v154, "setIdiom:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "idiom"));
              objc_msgSend(v154, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "scaleFactor"));
              objc_msgSend(v154, "setSubtype:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "subtype"));
              objc_msgSend(v154, "setGamut:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "gamut"));
              objc_msgSend(v154, "setSizeClassHorizontal:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassHorizontal"));
              objc_msgSend(v154, "setSizeClassVertical:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassVertical"));
              objc_msgSend(v154, "setMemoryClass:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "memoryClass"));
              objc_msgSend(v154, "setDirection:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "direction"));
              objc_msgSend(v154, "setGraphicsFeatureSetClass:", 0);
              objc_msgSend(v154, "setAppearance:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "appearance"));
              objc_msgSend(v154, "setTarget:", objc_msgSend(v226, "objectAtIndexedSubscript:", 0));

            }
          }
        }
      }
LABEL_280:
      if (++v14 >= (unint64_t)objc_msgSend(v13, "count"))
        goto LABEL_313;
    }
    if (v20 == v247)
      v25 = objc_msgSend(0, "name");
    else
LABEL_15:
      v25 = objc_msgSend(v20, "baseName");
    v24 = v25;
    v23 = 0;
LABEL_28:
    v28 = 0;
    v27 = 1;
    v30 = v19;
    v31 = v18;
    v32 = v17;
    v33 = v16;
    goto LABEL_29;
  }
LABEL_313:
  -[CoreThemeDocument _removeRedundantPDFBasedRenditionsForAssets:](self, "_removeRedundantPDFBasedRenditionsForAssets:", v13);
  v270 = 0u;
  v271 = 0u;
  v268 = 0u;
  v269 = 0u;
  v181 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v268, v303, 16);
  if (v181)
  {
    v182 = v181;
    v183 = *(_QWORD *)v269;
    do
    {
      for (n = 0; n != v182; ++n)
      {
        if (*(_QWORD *)v269 != v183)
          objc_enumerationMutation(v262);
        v185 = *(void **)(*((_QWORD *)&v268 + 1) + 8 * n);
        v186 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("NamedArtworkProduction"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(v185, "name")), 0);
        if (objc_msgSend(v186, "count")
          && (objc_msgSend(v186, "objectAtIndex:", 0), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v187 = (void *)objc_msgSend(v186, "objectAtIndex:", 0);
        }
        else
        {
          NSLog(CFSTR("Couldn't resolve layer reference for layerName %@ in Layer Stack %@"), objc_msgSend(v185, "name"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v185, "stack"), "production"), "name"));
          v187 = 0;
        }
        objc_msgSend(v185, "setReference:", v187);
        objc_msgSend(v187, "setMakeOpaqueIfPossible:", objc_msgSend(v185, "makeOpaqueIfPossible"));
      }
      v182 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v268, v303, 16);
    }
    while (v182);
  }

  if (self->_explicitlyPackedIdentifiers)
  {
    v188 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("NamedElement"), 0);
    v264 = 0u;
    v265 = 0u;
    v266 = 0u;
    v267 = 0u;
    v189 = (void *)-[NSMutableDictionary allKeys](self->_explicitlyPackedIdentifiers, "allKeys");
    v190 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v264, v302, 16);
    if (v190)
    {
      v191 = v190;
      v192 = *(_QWORD *)v265;
      do
      {
        for (ii = 0; ii != v191; ++ii)
        {
          if (*(_QWORD *)v265 != v192)
            objc_enumerationMutation(v189);
          v194 = *(_QWORD *)(*((_QWORD *)&v264 + 1) + 8 * ii);
          v195 = (id)-[NSMutableDictionary objectForKey:](self->_explicitlyPackedIdentifiers, "objectForKey:", v194);
          -[NSMutableDictionary removeObjectForKey:](self->_explicitlyPackedIdentifiers, "removeObjectForKey:", v194);
          v196 = (void *)objc_msgSend((id)objc_msgSend(v188, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name == %@"), v194)), "firstObject");
          if (v196)
            -[NSMutableDictionary setObject:forKey:](self->_explicitlyPackedIdentifiers, "setObject:forKey:", v195, objc_msgSend(v196, "identifier"));
          else
            NSLog(CFSTR("CoreThemeDefinition: key '%@' is defined as contained in a packing but we don't have any assets that match it skipping"), v194);

        }
        v191 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v264, v302, 16);
      }
      while (v191);
    }
  }
  return v242;
}

BOOL __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "iconSize"), "sizeValue");
  v4 = v3;
  return objc_msgSend(a2, "height") == (int)v5 && objc_msgSend(a2, "width") == (int)v4;
}

BOOL __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  int v5;
  _BOOL8 result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "idiom");
  result = 0;
  if (v4 == objc_msgSend((id)objc_msgSend(a2, "keySpec"), "idiom"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "subtype");
    if (v5 == objc_msgSend((id)objc_msgSend(a2, "keySpec"), "subtype"))
      return 1;
  }
  return result;
}

- (void)createNamedTexturesForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t UncommonItemInArrays;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _QWORD v101[3];

  v101[1] = *MEMORY[0x24BDAC8D0];
  v70 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41, a4, a5, a6);
  v66 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 181);
  v101[0] = objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("mipLevel"), 0);
  v63 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 1);
  v76 = -[CoreThemeDocument compressionTypes](self, "compressionTypes");
  v75 = -[CoreThemeDocument idioms](self, "idioms");
  v74 = -[CoreThemeDocument sizeClasses](self, "sizeClasses");
  v73 = -[CoreThemeDocument displayGamuts](self, "displayGamuts");
  v72 = -[CoreThemeDocument directions](self, "directions");
  v71 = -[CoreThemeDocument featureSetClasses](self, "featureSetClasses");
  v62 = -[CoreThemeDocument textureFaces](self, "textureFaces");
  if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 8))
  {
    v56 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1007);
    v55 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 10);
    v61 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Tag"), 0, 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v94 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v61, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i)), objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "identifier"));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
      }
      while (v9);
    }
    v59 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("NamedTextureProduction"), 0, 0));
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v58 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
    if (v58)
    {
      v57 = *(_QWORD *)v90;
      v65 = (void *)*MEMORY[0x24BDBD430];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v90 != v57)
            objc_enumerationMutation(a3);
          v60 = v12;
          v13 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v12);
          v14 = (void *)objc_msgSend(v59, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(v13, "name")));
          if (objc_msgSend(v14, "firstObject")
            && (objc_msgSend(v14, "firstObject"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v15 = (id)objc_msgSend(v14, "firstObject");
          }
          else
          {
            v15 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedTextureProduction"));
            v16 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v13, "nameIdentifier"));
            objc_msgSend(v16, "setName:", objc_msgSend(v13, "name"));
            objc_msgSend(v16, "setProduction:", v15);
            v17 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
            objc_msgSend(v15, "setBaseKeySpec:", v17);
            objc_msgSend(v17, "setElement:", v70);
            objc_msgSend(v17, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v16, "identifier"), "unsignedIntValue"));
            objc_msgSend(v15, "setDateOfLastChange:", objc_msgSend(v13, "modificationDate"));
            objc_msgSend(v15, "setOptOutOfThinning:", objc_msgSend(v13, "optOutOfThinning"));
            objc_msgSend(v15, "setTextureInterpretation:", -[CoreThemeDocument textureInterpretaitionWithIdentifier:](self, "textureInterpretaitionWithIdentifier:", objc_msgSend(v13, "textureInterpretation")));
            objc_msgSend(v15, "setRenditionType:", v56);
            objc_msgSend(v15, "setRenditionSubtype:", v55);

            objc_msgSend(v59, "addObject:", v15);
            if (v13)
            {
              v18 = (void *)objc_msgSend(v13, "tags");
              if (objc_msgSend(v18, "count"))
              {
                v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                v85 = 0u;
                v86 = 0u;
                v87 = 0u;
                v88 = 0u;
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v86;
                  v68 = v18;
                  do
                  {
                    for (j = 0; j != v21; ++j)
                    {
                      if (*(_QWORD *)v86 != v22)
                        objc_enumerationMutation(v68);
                      v24 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
                      v25 = (void *)objc_msgSend(v61, "objectForKey:", v24);
                      if (objc_msgSend(v25, "count"))
                      {
                        if (objc_msgSend(v25, "count") != 1)
                          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 4917, CFSTR("We should ONLY have 1 tag with a name, tag names need to be Unique"));
                        v26 = (id)objc_msgSend(v25, "objectAtIndex:", 0);
                      }
                      else
                      {
                        v26 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Tag"));
                        objc_msgSend(v26, "setIdentifier:", v24);
                        objc_msgSend(v61, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v26), v24);
                      }
                      objc_msgSend(v19, "addObject:", v26);
                    }
                    v18 = v68;
                    v21 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
                  }
                  while (v21);
                }
                objc_msgSend(v15, "addTags:", v19);
                v27 = objc_msgSend(v18, "count");
                if (v27 != objc_msgSend(v19, "count"))
                  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 4924, CFSTR("Supplied tags should always equal the count of tags on the production else the counts are wrong"));

              }
              if (objc_msgSend((id)objc_msgSend(v13, "universalTypeIdentifier"), "length"))
                objc_msgSend(v15, "setUniversalTypeIdentifier:", objc_msgSend(v13, "universalTypeIdentifier"));
            }
          }
          v28 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureRenditionSpec"));
          objc_msgSend(v28, "setProduction:", v15);
          objc_msgSend(v28, "setPixelFormat:", -[CoreThemeDocument pixelFormatWithIdentifier:](self, "pixelFormatWithIdentifier:", objc_msgSend(v13, "texturePixelFormat")));
          objc_msgSend(v28, "setCompressionType:", objc_msgSend(v76, "objectAtIndexedSubscript:", 0));
          -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", objc_msgSend(v13, "compressionType"));
          objc_msgSend(v28, "setCubeMap:", objc_msgSend(v13, "cubeMap"));
          objc_msgSend(v28, "setWidth:", objc_msgSend(v13, "textureWidth"));
          objc_msgSend(v28, "setHeight:", objc_msgSend(v13, "textureHeight"));
          objc_msgSend(v28, "resetToBaseKeySpec");
          objc_msgSend(v28, "setPreserveForArchiveOnly:", objc_msgSend(v13, "preserveForArchiveOnly"));
          v29 = (void *)objc_msgSend(v28, "keySpec");
          objc_msgSend(v29, "setIdiom:", objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v13, "idiom")));
          objc_msgSend(v29, "setScaleFactor:", objc_msgSend(v13, "scaleFactor"));
          objc_msgSend(v29, "setSubtype:", objc_msgSend(v13, "subtype"));
          objc_msgSend(v29, "setGamut:", objc_msgSend(v73, "objectAtIndexedSubscript:", objc_msgSend(v13, "displayGamut")));
          objc_msgSend(v29, "setSizeClassHorizontal:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassHorizontal")));
          objc_msgSend(v29, "setSizeClassVertical:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassVertical")));
          objc_msgSend(v29, "setMemoryClass:", objc_msgSend(v13, "memoryClass"));
          objc_msgSend(v29, "setDirection:", objc_msgSend(v72, "objectAtIndexedSubscript:", objc_msgSend(v13, "layoutDirection")));
          objc_msgSend(v29, "setGraphicsFeatureSetClass:", objc_msgSend(v71, "objectAtIndexedSubscript:", objc_msgSend(v13, "graphicsFeatureSetClass")));
          objc_msgSend(v29, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v13, "appearanceIdentifier"), objc_msgSend(v13, "appearanceName"), 1));
          objc_msgSend(v29, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v13, "localizationIdentifier"), objc_msgSend(v13, "localizationName"), 1));
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v64 = (id)objc_msgSend(v13, "textureInfos");
          v30 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
          if (v30)
          {
            v31 = v30;
            v69 = *(id *)v82;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(id *)v82 != v69)
                  objc_enumerationMutation(v64);
                v33 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
                v78 = 0;
                v77 = a5;
                v79 = 0;
                v80 = 0;
                v34 = (void *)objc_msgSend(v33, "fileURL");
                v35 = objc_msgSend(v33, "flipped");
                if (v34)
                  v36 = v34 == v65;
                else
                  v36 = 1;
                if (!v36)
                {
                  v39 = v35;
                  -[CoreThemeDocument _getFilename:scaleFactor:category:bitSource:forFileURL:](self, "_getFilename:scaleFactor:category:bitSource:forFileURL:", &v80, &v78, &v79, &v77, v34);
LABEL_47:
                  v40 = (void *)objc_msgSend(v34, "pathComponents");
                  UncommonItemInArrays = indexOfFirstUncommonItemInArrays((void *)objc_msgSend((id)objc_msgSend(v77, "fileURLWithDocument:", self), "pathComponents"), v40);
                  v42 = objc_msgSend(v40, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v40, "count") + ~UncommonItemInArrays);
                  v79 = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v42);
                  goto LABEL_48;
                }
                v37 = (void *)objc_msgSend(v13, "textureInfos");
                v38 = (void *)objc_msgSend((id)objc_msgSend(v37, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(mipLevel < %d) AND (fileURL != nil) AND (textureFace = %d)"), objc_msgSend(v33, "mipLevel"), objc_msgSend(v33, "textureFace"))), "sortedArrayUsingDescriptors:", v63);
                v34 = (void *)objc_msgSend((id)objc_msgSend(v38, "firstObject"), "fileURL");
                v39 = objc_msgSend((id)objc_msgSend(v38, "firstObject"), "flipped");
                -[CoreThemeDocument _getFilename:scaleFactor:category:bitSource:forFileURL:](self, "_getFilename:scaleFactor:category:bitSource:forFileURL:", &v80, &v78, &v79, &v77, v34);
                if (v34)
                  goto LABEL_47;
LABEL_48:
                v43 = v80;
                v44 = objc_msgSend(v13, "scaleFactor");
                v45 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v43, CFSTR("texture"), v44, v79, v77);
                v46 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureImageRenditionSpec"));
                objc_msgSend(v46, "setPreserveForArchiveOnly:", objc_msgSend(v13, "preserveForArchiveOnly"));
                if ((objc_msgSend(v13, "compressionType") & 0xFFFFFFFFFFFFFFFELL) == 4
                  && !-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 4))
                {
                  if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 3))
                    v47 = 3;
                  else
                    v47 = 0;
                }
                else
                {
                  v47 = objc_msgSend(v13, "compressionType");
                }
                objc_msgSend(v46, "setCompressionType:", objc_msgSend(v76, "objectAtIndexedSubscript:", v47));
                objc_msgSend(v46, "setProduction:", v15);
                objc_msgSend(v46, "setAsset:", v45);
                objc_msgSend(v46, "setFlipped:", v39);
                v48 = (__int16)objc_msgSend(v33, "mipLevel");
                if ((int)objc_msgSend(v28, "width") >> v48 < 2)
                  v49 = 1;
                else
                  v49 = ((int)objc_msgSend(v28, "width") >> v48);
                objc_msgSend(v46, "setWidth:", v49);
                if ((int)objc_msgSend(v28, "height") >> v48 < 2)
                  v50 = 1;
                else
                  v50 = ((int)objc_msgSend(v28, "height") >> v48);
                objc_msgSend(v46, "setHeight:", v50);
                v51 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureMipLevel"));
                if (objc_msgSend(v13, "cubeMap"))
                  objc_msgSend(v51, "setFace:", objc_msgSend(v62, "objectAtIndexedSubscript:", objc_msgSend(v33, "textureFace")));
                objc_msgSend(v51, "setLevel:", v48);
                objc_msgSend(v51, "setTextureImage:", v46);
                objc_msgSend(v28, "addMipLevelsObject:", v51);

                v52 = (void *)objc_msgSend(v46, "keySpec");
                objc_msgSend(v52, "setElement:", v70);
                objc_msgSend(v52, "setPart:", v66);
                objc_msgSend(v52, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v15, "baseKeySpec"), "nameIdentifier"));
                objc_msgSend(v52, "setIdiom:", objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v13, "idiom")));
                objc_msgSend(v52, "setScaleFactor:", objc_msgSend(v13, "scaleFactor"));
                objc_msgSend(v52, "setSubtype:", objc_msgSend(v13, "subtype"));
                objc_msgSend(v52, "setGamut:", objc_msgSend(v73, "objectAtIndexedSubscript:", objc_msgSend(v13, "displayGamut")));
                objc_msgSend(v52, "setSizeClassHorizontal:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassHorizontal")));
                objc_msgSend(v52, "setSizeClassVertical:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassVertical")));
                objc_msgSend(v52, "setMemoryClass:", objc_msgSend(v13, "memoryClass"));
                objc_msgSend(v52, "setDirection:", objc_msgSend(v72, "objectAtIndexedSubscript:", objc_msgSend(v13, "layoutDirection")));
                objc_msgSend(v52, "setGraphicsFeatureSetClass:", objc_msgSend(v71, "objectAtIndexedSubscript:", objc_msgSend(v13, "graphicsFeatureSetClass")));
                objc_msgSend(v52, "setDimension2:", objc_msgSend(v33, "mipLevel"));
                objc_msgSend(v52, "setAppearance:", objc_msgSend((id)objc_msgSend(v28, "keySpec"), "appearance"));

              }
              v31 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
            }
            while (v31);
          }

          v12 = v60 + 1;
        }
        while (v60 + 1 != v58);
        v58 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
      }
      while (v58);
    }

  }
}

- (void)createNamedModelsForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6
{
  id v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t UncommonItemInArrays;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v6 = a5;
  v72 = *MEMORY[0x24BDAC8D0];
  v8 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1011, a4, a5, a6);
  v44 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 10);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v10 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Tag"), 0, 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v66 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i)), objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "identifier"));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v12);
  }
  v49 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("ModelIOProduction"), 0, 0));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v15 = v44;
  v48 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v62;
    v42 = v8;
    v43 = v6;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v62 != v47)
          objc_enumerationMutation(a3);
        v51 = v16;
        v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v16);
        v58 = 0;
        v57 = v6;
        v59 = 0;
        v60 = 0;
        v50 = objc_msgSend(v17, "fileURL");
        v18 = (void *)objc_msgSend(v49, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(v17, "name")));
        if (objc_msgSend(v18, "firstObject"))
        {
          objc_msgSend(v18, "firstObject");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = (void *)objc_msgSend(v18, "firstObject");
LABEL_35:
            v32 = (void *)v50;
            goto LABEL_36;
          }
        }
        v19 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("ModelIOProduction"));
        v20 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v17, "nameIdentifier"));
        objc_msgSend(v20, "setName:", objc_msgSend(v17, "name"));
        objc_msgSend(v20, "setProduction:", v19);
        v21 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v21, "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 164));
        objc_msgSend(v21, "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 60));
        objc_msgSend(v21, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v20, "identifier"), "unsignedIntValue"));
        objc_msgSend(v19, "setBaseKeySpec:", v21);
        objc_msgSend(v19, "setDateOfLastChange:", objc_msgSend(v17, "modificationDate"));
        objc_msgSend(v19, "setRenditionType:", v8);
        objc_msgSend(v19, "setRenditionSubtype:", v15);

        v52 = v19;
        objc_msgSend(v49, "addObject:", v19);
        if (!v17)
          goto LABEL_35;
        v22 = (void *)objc_msgSend(v17, "tags");
        if (objc_msgSend(v22, "count"))
        {
          v46 = v17;
          v23 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v54;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v54 != v26)
                  objc_enumerationMutation(v22);
                v28 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
                v29 = (void *)objc_msgSend(v9, "objectForKey:", v28);
                if (objc_msgSend(v29, "count"))
                {
                  if (objc_msgSend(v29, "count") != 1)
                    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 5169, CFSTR("We should ONLY have 1 tag with a name, tag names need to be Unique"));
                  v30 = (id)objc_msgSend(v29, "objectAtIndex:", 0);
                }
                else
                {
                  v30 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Tag"));
                  objc_msgSend(v30, "setIdentifier:", v28);
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v30), v28);
                }
                objc_msgSend(v23, "addObject:", v30);
              }
              v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
            }
            while (v25);
          }
          objc_msgSend(v52, "addTags:", v23);
          v31 = objc_msgSend(v22, "count");
          if (v31 != objc_msgSend(v23, "count"))
            objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 5176, CFSTR("Supplied tags should always equal the count of tags on the production else the counts are wrong"));

          v8 = v42;
          v6 = v43;
          v15 = v44;
          v17 = v46;
        }
        v32 = (void *)v50;
        if (objc_msgSend((id)objc_msgSend(v17, "universalTypeIdentifier"), "length"))
          objc_msgSend(v52, "setUniversalTypeIdentifier:", objc_msgSend(v17, "universalTypeIdentifier"));
LABEL_36:
        -[CoreThemeDocument _getFilename:scaleFactor:category:bitSource:forFileURL:](self, "_getFilename:scaleFactor:category:bitSource:forFileURL:", &v60, &v58, &v59, &v57, v32);
        if (v32)
        {
          v33 = (void *)objc_msgSend(v32, "pathComponents");
          UncommonItemInArrays = indexOfFirstUncommonItemInArrays((void *)objc_msgSend((id)objc_msgSend(v57, "fileURLWithDocument:", self), "pathComponents"), v33);
          v35 = objc_msgSend(v33, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v33, "count") + ~UncommonItemInArrays);
          v59 = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v35);
        }
        v36 = v60;
        v37 = objc_msgSend(v17, "scaleFactor");
        v38 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v36, CFSTR("model"), v37, v59, v57);
        v39 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("ModelIORenditionSpec"));
        objc_msgSend(v39, "setAsset:", v38);
        objc_msgSend(v39, "setProduction:", v52);
        objc_msgSend(v39, "setPreserveForArchiveOnly:", objc_msgSend(v17, "preserveForArchiveOnly"));
        objc_msgSend(v39, "resetToBaseKeySpec");
        v40 = (void *)objc_msgSend(v39, "keySpec");
        objc_msgSend(v40, "setIdiom:", -[CoreThemeDocument idiomWithIdentifier:](self, "idiomWithIdentifier:", objc_msgSend(v17, "idiom")));
        objc_msgSend(v40, "setScaleFactor:", objc_msgSend(v17, "scaleFactor"));
        objc_msgSend(v40, "setSubtype:", objc_msgSend(v17, "subtype"));
        objc_msgSend(v40, "setGamut:", -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", objc_msgSend(v17, "displayGamut")));
        objc_msgSend(v40, "setSizeClassHorizontal:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v17, "sizeClassHorizontal")));
        objc_msgSend(v40, "setSizeClassVertical:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v17, "sizeClassVertical")));
        objc_msgSend(v40, "setMemoryClass:", objc_msgSend(v17, "memoryClass"));
        objc_msgSend(v40, "setDirection:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", objc_msgSend(v17, "layoutDirection")));
        objc_msgSend(v40, "setGraphicsFeatureSetClass:", -[CoreThemeDocument graphicsFeatureSetClassWithIdentifier:](self, "graphicsFeatureSetClassWithIdentifier:", objc_msgSend(v17, "graphicsFeatureSetClass")));
        objc_msgSend(v40, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v17, "appearanceIdentifier"), objc_msgSend(v17, "appearanceName"), 1));
        objc_msgSend(v40, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v17, "localizationIdentifier"), objc_msgSend(v17, "localizationName"), 1));

        v16 = v51 + 1;
      }
      while (v51 + 1 != v48);
      v48 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v48);
  }

}

- (void)createNamedRecognitionObjectsForAssets:(id)a3 customInfos:(id)a4 error:(id *)a5
{
  id v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v35;
  id v36;
  id v38;
  id v39;
  unint64_t v40;
  void *v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v5 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v36 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 85, a4, a5);
  v39 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 207);
  v38 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1014);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Tag"), 0, 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i)), objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "identifier"));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v10);
  }
  v41 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("RecognitionObjectProduction"), 0, 0));
  v14 = v36;
  v13 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v15 = 0;
    v35 = v5;
    do
    {
      v16 = (void *)objc_msgSend(v5, "objectAtIndex:", v15);
      v17 = (void *)objc_msgSend(v41, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(v16, "name")));
      v43 = v16;
      if (objc_msgSend(v17, "firstObject")
        && (objc_msgSend(v17, "firstObject"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v18 = (void *)objc_msgSend(v17, "firstObject");
      }
      else
      {
        v42 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RecognitionObjectProduction"));
        v40 = v15;
        if (objc_msgSend(v16, "nameIdentifier"))
          v19 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v16, "nameIdentifier"));
        else
          v19 = -[CoreThemeDocument _createNamedElementWithNextAvailableIdentifier](self, "_createNamedElementWithNextAvailableIdentifier");
        v20 = v19;
        objc_msgSend(v19, "setName:", objc_msgSend(v16, "name"));
        v18 = v42;
        objc_msgSend(v20, "setProduction:", v42);
        v21 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v42, "setBaseKeySpec:", v21);
        objc_msgSend(v21, "setElement:", v14);
        objc_msgSend(v21, "setPart:", v39);
        objc_msgSend(v21, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v20, "identifier"), "unsignedIntValue"));
        objc_msgSend(v42, "setDateOfLastChange:", objc_msgSend(v16, "modificationDate"));
        objc_msgSend(v42, "setRenditionType:", v38);

        objc_msgSend(v41, "addObject:", v42);
        if (v16)
        {
          v22 = (void *)objc_msgSend(v16, "tags");
          if (objc_msgSend(v22, "count"))
          {
            v23 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v45;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v45 != v26)
                    objc_enumerationMutation(v22);
                  v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
                  v29 = (void *)objc_msgSend(v7, "objectForKey:", v28);
                  if (objc_msgSend(v29, "count"))
                  {
                    if (objc_msgSend(v29, "count") != 1)
                      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 5307, CFSTR("We should ONLY have 1 tag with a name, tag names need to be Unique"));
                    v30 = (id)objc_msgSend(v29, "objectAtIndex:", 0);
                  }
                  else
                  {
                    v30 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Tag"));
                    objc_msgSend(v30, "setIdentifier:", v28);
                    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v30), v28);
                  }
                  objc_msgSend(v23, "addObject:", v30);
                }
                v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              }
              while (v25);
            }
            objc_msgSend(v42, "addTags:", v23);
            v31 = objc_msgSend(v22, "count");
            if (v31 != objc_msgSend(v23, "count"))
              objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 5314, CFSTR("Supplied tags should always equal the count of tags on the production else the counts are wrong"));

            v5 = v35;
            v14 = v36;
            v13 = a3;
            v18 = v42;
            v16 = v43;
          }
          v15 = v40;
          if (objc_msgSend((id)objc_msgSend(v16, "universalTypeIdentifier"), "length"))
            objc_msgSend(v18, "setUniversalTypeIdentifier:", objc_msgSend(v16, "universalTypeIdentifier"));
        }
        else
        {
          v15 = v40;
        }
      }
      v32 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RecognitionObjectRenditionSpec"));
      objc_msgSend(v32, "setAsset:", objc_msgSend(v13, "objectAtIndex:", v15));
      objc_msgSend(v32, "setProduction:", v18);
      objc_msgSend(v32, "setVersion:", objc_msgSend(v43, "objectVersion"));
      objc_msgSend(v43, "transformation");
      objc_msgSend(v32, "setReferenceOriginTransform:");
      objc_msgSend(v32, "setPreserveForArchiveOnly:", objc_msgSend(v43, "preserveForArchiveOnly"));
      objc_msgSend(v32, "resetToBaseKeySpec");
      v33 = (void *)objc_msgSend(v32, "keySpec");
      objc_msgSend(v33, "setIdiom:", -[CoreThemeDocument idiomWithIdentifier:](self, "idiomWithIdentifier:", objc_msgSend(v43, "idiom")));
      objc_msgSend(v33, "setScaleFactor:", objc_msgSend(v43, "scaleFactor"));
      objc_msgSend(v33, "setSubtype:", objc_msgSend(v43, "subtype"));
      objc_msgSend(v33, "setGamut:", -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", objc_msgSend(v43, "displayGamut")));
      objc_msgSend(v33, "setSizeClassHorizontal:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v43, "sizeClassHorizontal")));
      objc_msgSend(v33, "setSizeClassVertical:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v43, "sizeClassVertical")));
      objc_msgSend(v33, "setMemoryClass:", objc_msgSend(v43, "memoryClass"));
      objc_msgSend(v33, "setDirection:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", objc_msgSend(v43, "layoutDirection")));
      objc_msgSend(v33, "setGraphicsFeatureSetClass:", -[CoreThemeDocument graphicsFeatureSetClassWithIdentifier:](self, "graphicsFeatureSetClassWithIdentifier:", objc_msgSend(v43, "graphicsFeatureSetClass")));

      ++v15;
    }
    while (v15 < objc_msgSend(v5, "count"));
  }

}

- (void)createNamedGlyphVectorForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6
{
  id v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t UncommonItemInArrays;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  TDVectorGlyphReader *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  int64_t v47;
  uint64_t v48;
  unsigned int v49;
  id v50;
  void *v51;
  double v52;
  void *v53;
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  id v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  unsigned int v79;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  void *v85;
  TDVectorGlyphReader *v86;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v6 = a3;
  v115 = *MEMORY[0x24BDAC8D0];
  v112 = a5;
  v97 = -[CoreThemeDocument displayGamuts](self, "displayGamuts", a3, a4);
  v96 = -[CoreThemeDocument idioms](self, "idioms");
  v8 = -[CoreThemeDocument sizeClasses](self, "sizeClasses");
  v95 = -[CoreThemeDocument directions](self, "directions");
  v94 = -[CoreThemeDocument featureSetClasses](self, "featureSetClasses");
  v93 = -[CoreThemeDocument glyphsSizes](self, "glyphsSizes");
  v92 = -[CoreThemeDocument glyphWeights](self, "glyphWeights");
  v72 = -[CoreThemeDocument glyphRenderingModes](self, "glyphRenderingModes");
  v98 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 85);
  v78 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 59);
  v90 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 181);
  v89 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 0);
  v73 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1017);
  v91 = -[CoreThemeDocument deploymentTargetWithIdentifier:](self, "deploymentTargetWithIdentifier:", 5);
  v77 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v9 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Tag"), 0, 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v109 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v77, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i)), objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i), "identifier"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
    }
    while (v11);
  }
  -[CoreThemeDocument targetPlatform](self, "targetPlatform");
  v84 = CUIMaxScaleForTargetPlatform();
  -[CoreThemeDocument targetPlatform](self, "targetPlatform");
  v79 = CUIMinScaleForTargetPlatform();
  v75 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("NamedVectorGlyphProduction"), 0, 0));
  if (objc_msgSend(v6, "count"))
  {
    v14 = 0;
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v74 = v6;
    v85 = v8;
    while (1)
    {
      v76 = v14;
      v19 = (void *)objc_msgSend(v6, "objectAtIndex:", v14);
      v105 = 0;
      v106 = 0;
      v107 = 0;
      v20 = (void *)objc_msgSend(v19, "fileURL");
      -[CoreThemeDocument _getFilename:scaleFactor:category:bitSource:forFileURL:](self, "_getFilename:scaleFactor:category:bitSource:forFileURL:", &v107, &v105, &v106, &v112, v20);
      if (v20)
      {
        v21 = (void *)objc_msgSend(v20, "pathComponents");
        UncommonItemInArrays = indexOfFirstUncommonItemInArrays((void *)objc_msgSend((id)objc_msgSend(v112, "fileURLWithDocument:", self), "pathComponents"), v21);
        v23 = objc_msgSend(v21, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v21, "count") + ~UncommonItemInArrays);
        v106 = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v23);
      }
      v24 = (void *)objc_msgSend(v75, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(v19, "name")));
      if (objc_msgSend(v24, "firstObject")
        && (objc_msgSend(v24, "firstObject"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = (id)objc_msgSend(v24, "firstObject");
        v26 = v77;
        if (!v20)
          goto LABEL_78;
      }
      else
      {
        v87 = v20;
        v25 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedVectorGlyphProduction"));
        v26 = v77;
        v27 = objc_msgSend(v19, "nameIdentifier")
            ? -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v19, "nameIdentifier")): -[CoreThemeDocument _createNamedElementWithNextAvailableIdentifier](self, "_createNamedElementWithNextAvailableIdentifier");
        v28 = v27;
        objc_msgSend(v27, "setName:", objc_msgSend(v19, "name"));
        objc_msgSend(v28, "setProduction:", v25);
        v29 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v25, "setBaseKeySpec:", v29);
        objc_msgSend(v29, "setElement:", v98);
        objc_msgSend(v29, "setPart:", v78);
        objc_msgSend(v29, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v28, "identifier"), "unsignedIntValue"));
        objc_msgSend(v29, "setTarget:", v91);
        objc_msgSend(v25, "setDateOfLastChange:", objc_msgSend(v19, "modificationDate"));
        objc_msgSend(v25, "setRenditionType:", v73);
        objc_msgSend(v25, "setIsFlippable:", objc_msgSend(v19, "isFlippable"));

        objc_msgSend(v75, "addObject:", v25);
        if (v19)
        {
          v30 = (void *)objc_msgSend(v19, "tags");
          if (objc_msgSend(v30, "count"))
          {
            v99 = v25;
            v31 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v102;
              do
              {
                for (j = 0; j != v33; ++j)
                {
                  if (*(_QWORD *)v102 != v34)
                    objc_enumerationMutation(v30);
                  v36 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j);
                  v37 = (void *)objc_msgSend(v77, "objectForKey:", v36);
                  if (objc_msgSend(v37, "count"))
                  {
                    if (objc_msgSend(v37, "count") != 1)
                      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 5481, CFSTR("We should ONLY have 1 tag with a name, tag names need to be Unique"));
                    v38 = (id)objc_msgSend(v37, "objectAtIndex:", 0);
                  }
                  else
                  {
                    v38 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Tag"));
                    objc_msgSend(v38, "setIdentifier:", v36);
                    objc_msgSend(v77, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v38), v36);
                  }
                  objc_msgSend(v31, "addObject:", v38);
                }
                v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
              }
              while (v33);
            }
            v25 = v99;
            objc_msgSend(v99, "addTags:", v31);
            v39 = objc_msgSend(v30, "count");
            if (v39 != objc_msgSend(v31, "count"))
              objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 5488, CFSTR("Supplied tags should always equal the count of tags on the production else the counts are wrong"));

            v20 = v87;
          }
          if (objc_msgSend((id)objc_msgSend(v19, "universalTypeIdentifier"), "length"))
            objc_msgSend(v25, "setUniversalTypeIdentifier:", objc_msgSend(v19, "universalTypeIdentifier"));
          objc_msgSend(v25, "setVectorGlyphRenderingMode:", objc_msgSend(v72, "objectAtIndex:", objc_msgSend(v19, "vectorGlyphRenderingMode")));
          if (!v20)
LABEL_78:
            -[CoreThemeDocument createNamedGlyphVectorForCustomInfos:referenceFiles:bitSource:error:].cold.1();
        }
        else if (!v20)
        {
          goto LABEL_78;
        }
      }
      v40 = +[TDVectorGlyphReader vectorGlyphReaderWithURL:platform:error:](TDVectorGlyphReader, "vectorGlyphReaderWithURL:platform:error:", v20, -[CoreThemeDocument targetPlatform](self, "targetPlatform"), a6);
      if (!v40)
        break;
      v100 = v25;
      v41 = 1;
      v86 = v40;
      do
      {
        v82 = v41 & 0x7FFFFFFFFFFFFFFELL;
        v42 = 1;
        v88 = v41;
        do
        {
          v83 = v42;
          if (-[TDVectorGlyphReader vectorGlyphExistsWithWeight:size:error:](v40, "vectorGlyphExistsWithWeight:size:error:"))
          {
LABEL_45:
            v43 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("VectorGlyphRenditionSpec"));
            v44 = v107;
            v45 = objc_msgSend(v19, "scaleFactor");
            v46 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v44, CFSTR("png"), v45, v106, v112);
            objc_msgSend(v46, "setScaleFactor:", 0);
            objc_msgSend(v46, "setFileScaleFactor:", objc_msgSend(v19, "scaleFactor"));
            if (!objc_msgSend(v46, "fileScaleFactor"))
              objc_msgSend(v46, "setFileScaleFactor:", 1);
            v81 = v46;
            objc_msgSend(v43, "setAsset:", v46);
            objc_msgSend(v43, "setProduction:", v100);
            objc_msgSend(v43, "setAlignmentRect:", v15, v16, v17, v18);
            v47 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
            v48 = v88;
            if (!v47)
              v48 = v82;
            if (v83 == 4 && v48 == 2)
            {
              -[CoreThemeDocument targetPlatform](self, "targetPlatform");
              v49 = CUIMinDimensionForVectorGlyph();
              -[CoreThemeDocument targetPlatform](self, "targetPlatform");
              if (v49 < CUIMaxDimensionForVectorGlyph())
              {
                do
                {
                  v50 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("AvaliableVectorSize"));
                  v51 = (void *)MEMORY[0x24BDD16E0];
                  -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                  CUIPointSizeForDimensionForVectorGlyph();
                  objc_msgSend(v50, "setPointSize:", objc_msgSend(v51, "numberWithInt:", (int)v52));
                  objc_msgSend(v43, "addAvaliablePointSizesObject:", v50);

                  ++v49;
                  -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                }
                while (CUIMaxDimensionForVectorGlyph() > (unsigned __int16)v49);
              }
            }
            objc_msgSend(v43, "resetToBaseKeySpec");
            v53 = (void *)objc_msgSend(v43, "keySpec");
            objc_msgSend(v53, "setElement:", v98);
            objc_msgSend(v53, "setPart:", v78);
            objc_msgSend(v53, "setIdiom:", objc_msgSend(v96, "objectAtIndexedSubscript:", objc_msgSend(v19, "idiom")));
            objc_msgSend(v53, "setScaleFactor:", objc_msgSend(v81, "fileScaleFactor"));
            objc_msgSend(v53, "setSubtype:", objc_msgSend(v19, "subtype"));
            objc_msgSend(v53, "setGamut:", objc_msgSend(v97, "objectAtIndexedSubscript:", objc_msgSend(v19, "displayGamut")));
            objc_msgSend(v53, "setSizeClassHorizontal:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassHorizontal")));
            objc_msgSend(v53, "setSizeClassVertical:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassVertical")));
            objc_msgSend(v53, "setMemoryClass:", objc_msgSend(v19, "memoryClass"));
            objc_msgSend(v53, "setDirection:", objc_msgSend(v95, "objectAtIndexedSubscript:", objc_msgSend(v19, "layoutDirection")));
            objc_msgSend(v53, "setGraphicsFeatureSetClass:", objc_msgSend(v94, "objectAtIndexedSubscript:", objc_msgSend(v19, "graphicsFeatureSetClass")));
            objc_msgSend(v53, "setGlyphSize:", objc_msgSend(v93, "objectAtIndexedSubscript:", v88));
            objc_msgSend(v53, "setGlyphWeight:", objc_msgSend(v92, "objectAtIndexedSubscript:", v83));
            objc_msgSend(v53, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "appearanceIdentifier"), objc_msgSend(v19, "appearanceName"), 1));
            objc_msgSend(v53, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "localizationIdentifier"), objc_msgSend(v19, "localizationName"), 1));
            v54 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
            v55 = v82;
            if (v54)
              v55 = v88;
            if (v83 == 4 && v55 == 2 && v79 <= v84)
            {
              v56 = v79;
              do
              {
                if (-[CoreThemeDocument shouldGenerateScale:](self, "shouldGenerateScale:", v56))
                {
                  -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                  for (k = CUIMinDimensionForVectorGlyph(); ; k = (k + 1))
                  {
                    -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                    if (k >= CUIMaxDimensionForVectorGlyph())
                      break;
                    v58 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("VectorGlyphImageRenditionSpec"));
                    v59 = v107;
                    v60 = objc_msgSend(v19, "scaleFactor");
                    v61 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v59, CFSTR("png"), v60, v106, v112);
                    objc_msgSend(v61, "setFileScaleFactor:", objc_msgSend(v19, "scaleFactor"));
                    objc_msgSend(v61, "setScaleFactor:", v56);
                    objc_msgSend(v58, "setAsset:", v61);
                    -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                    CUIPointSizeForDimensionForVectorGlyph();
                    v63 = v62;
                    -[TDVectorGlyphReader defaultPointSize](v86, "defaultPointSize");
                    objc_msgSend(v58, "setPostScaleFactor:", v63 / v64);
                    objc_msgSend(v58, "setRenditionType:", v89);
                    objc_msgSend(v58, "setAllowsDeepmap2Compression:", -[CoreThemeDocument shouldAllowDeepmap2CompressionForDeploymentTarget:](self, "shouldAllowDeepmap2CompressionForDeploymentTarget:", objc_msgSend(v91, "identifier")));
                    objc_msgSend(v58, "setProduction:", v100);
                    objc_msgSend(v58, "resetToBaseKeySpec");
                    v65 = (void *)objc_msgSend(v58, "keySpec");
                    objc_msgSend(v65, "setElement:", v98);
                    objc_msgSend(v65, "setPart:", v90);
                    objc_msgSend(v65, "setIdiom:", objc_msgSend(v96, "objectAtIndexedSubscript:", objc_msgSend(v19, "idiom")));
                    objc_msgSend(v65, "setScaleFactor:", v56);
                    objc_msgSend(v65, "setSubtype:", objc_msgSend(v19, "subtype"));
                    objc_msgSend(v65, "setGamut:", objc_msgSend(v97, "objectAtIndexedSubscript:", objc_msgSend(v19, "displayGamut")));
                    objc_msgSend(v65, "setSizeClassHorizontal:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassHorizontal")));
                    objc_msgSend(v65, "setSizeClassVertical:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassVertical")));
                    objc_msgSend(v65, "setMemoryClass:", objc_msgSend(v19, "memoryClass"));
                    objc_msgSend(v65, "setDirection:", objc_msgSend(v95, "objectAtIndexedSubscript:", objc_msgSend(v19, "layoutDirection")));
                    objc_msgSend(v65, "setGraphicsFeatureSetClass:", objc_msgSend(v94, "objectAtIndexedSubscript:", objc_msgSend(v19, "graphicsFeatureSetClass")));
                    objc_msgSend(v65, "setGlyphSize:", objc_msgSend(v93, "objectAtIndexedSubscript:", v88));
                    objc_msgSend(v65, "setGlyphWeight:", objc_msgSend(v92, "objectAtIndexedSubscript:", 4));
                    objc_msgSend(v65, "setDimension2:", k);
                    objc_msgSend(v65, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "appearanceIdentifier"), objc_msgSend(v19, "appearanceName"), 1));
                    objc_msgSend(v65, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "localizationIdentifier"), objc_msgSend(v19, "localizationName"), 1));
                  }
                }
                v56 = (v56 + 1);
              }
              while (v56 <= v84);
            }
          }
          else
          {
            -[CoreThemeDocument targetPlatform](self, "targetPlatform");
            v66 = (uint64_t *)CUIPreferredVectorGlyphConfigurationsForPlatform();
            v67 = *v66;
            if (*v66)
            {
              v68 = v66 + 3;
              do
              {
                v69 = *(v68 - 2);
                if (!v69)
                  break;
                if (v67 == v83 && v69 == v88)
                {
                  if (-[TDVectorGlyphReader isInterpolatableForWeight:size:](v86, "isInterpolatableForWeight:size:"))
                    goto LABEL_45;
                  break;
                }
                v70 = *v68;
                v68 += 3;
                v67 = v70;
              }
              while (v70);
            }
          }
          v42 = v83 + 1;
          v40 = v86;
        }
        while (v83 != 9);
        v41 = v88 + 1;
      }
      while (v88 != 3);

      v14 = v76 + 1;
      v6 = v74;
      if (v76 + 1 >= (unint64_t)objc_msgSend(v74, "count"))
        goto LABEL_76;
    }

  }
  else
  {
LABEL_76:

  }
}

- (id)updateAutomaticTexturesForCustomInfos:(id)a3 allTextureInfos:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CGImageSource *v16;
  CGImageSource *v17;
  CGImageRef ImageAtIndex;
  int v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id obj;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[120];
  uint64_t v50;
  _OWORD v51[5];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "count"))
  {
    v47 = 0;
    v38 = (id)objc_msgSend(a4, "mutableCopy");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v44;
      v7 = *MEMORY[0x24BDBD430];
      obj = a3;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v10 = (void *)objc_msgSend(v9, "textureInfos");
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v40;
            while (2)
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v40 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                if (objc_msgSend(v15, "fileURL") != v7)
                {
                  v16 = CGImageSourceCreateWithURL((CFURLRef)objc_msgSend(v15, "fileURL"), 0);
                  if (v16)
                  {
                    v17 = v16;
                    ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
                    CFRelease(v17);
                    if (ImageAtIndex)
                    {
                      v47 = 2;
                      memset(v51, 0, sizeof(v51));
                      v19 = -1;
                      v20 = &v50;
                      do
                      {
                        -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                        objc_msgSend(v9, "displayGamut");
                        objc_msgSend(v9, "textureInterpretation");
                        v21 = CUIGetFormatForFeatureSetAndPixelFormat();
                        v22 = v47;
                        *((_QWORD *)v51 + v47) = v21;
                        v47 = v22 - 1;
                        ++v20;
                        ++v19;
                      }
                      while (v22 > 0);
                      if (v19)
                      {
                        v23 = v19 + 1;
                        while (*((_QWORD *)v51 + (v23 - 2)) == *v20)
                        {
                          if (--v23 <= 1)
                            goto LABEL_24;
                        }
                      }
                      else
                      {
LABEL_24:
                        v23 = 1;
                      }
                      v24 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                      if (v24 <= 5 && ((1 << v24) & 0x3A) != 0)
                      {
                        if (v23 >= 1)
                        {
                          for (j = 0; j != v23; ++j)
                          {
                            v26 = *((_QWORD *)v51 + j);
                            if (v26)
                            {
                              v27 = (void *)objc_msgSend(v9, "copyWithZone:", 0);
                              objc_msgSend(v27, "setTexturePixelFormat:", v26);
                              objc_msgSend(v27, "setGraphicsFeatureSetClass:", j);
                              objc_msgSend(v38, "addObject:", v27);

                            }
                          }
                        }
                      }
                      else
                      {
                        v28 = v23 - 1;
                        if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 18))
                          v29 = v28;
                        else
                          v29 = 0;
                        if ((v29 & 0x80000000) == 0)
                        {
                          while (1)
                          {
                            v30 = *((_QWORD *)v51 + v29);
                            v31 = v29;
                            if (v30)
                              break;
                            --v29;
                            if ((int)v31 < 1)
                              goto LABEL_32;
                          }
                          v32 = (void *)objc_msgSend(v9, "copyWithZone:", 0);
                          objc_msgSend(v32, "setTexturePixelFormat:", v30);
                          objc_msgSend(v32, "setGraphicsFeatureSetClass:", v31);
                          objc_msgSend(v38, "addObject:", v32);

                        }
                      }
LABEL_32:
                      CFRelease(ImageAtIndex);
                    }
                    goto LABEL_33;
                  }
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_33:
          ++v8;
        }
        while (v8 != v37);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        v37 = v33;
      }
      while (v33);
    }
    return v38;
  }
  return a4;
}

+ (id)_imageAssetURLsByCopyingFileURLs:(id)a3 toManagedLocationAtURL:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_msgSend(a4, "URLByAppendingPathComponent:", CFSTR("NamedImages"));
  if ((objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0
    || (v11 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, a5),
        result = 0,
        v11))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v22 = a5;
      v15 = *(_QWORD *)v25;
      v16 = (void *)*MEMORY[0x24BDBD430];
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(a3);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
          if (v18 == v16)
          {
            v20 = v8;
            v21 = v16;
          }
          else
          {
            v23 = 0;
            v19 = (void *)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v18, "lastPathComponent"));
            if (objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", &v23)
              && (NSLog(CFSTR("File already exists: %@.  Overwriting."), v18),
                  (objc_msgSend(v9, "removeItemAtURL:error:", v19, &v23) & 1) == 0)
              || (objc_msgSend(v9, "copyItemAtURL:toURL:error:", v18, v19, &v23) & 1) == 0)
            {
              if (v22)
                *v22 = v23;
              return 0;
            }
            v20 = v8;
            v21 = v19;
          }
          objc_msgSend(v20, "addObject:", v21);
          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
          continue;
        break;
      }
    }
    return v8;
  }
  return result;
}

- (int64_t)_compareFlattenedKeySpec1:(id)a3 toKeySpec2:(id)a4
{
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v6 = objc_msgSend(a3, "scaleFactor");
  if (v6 != objc_msgSend(a4, "scaleFactor"))
    return -1;
  v7 = objc_msgSend(a3, "idiom");
  if (v7 != objc_msgSend(a4, "idiom"))
    return -1;
  v8 = objc_msgSend(a3, "subtype");
  if (v8 != objc_msgSend(a4, "subtype"))
    return -1;
  v9 = objc_msgSend(a3, "gamut");
  if (v9 == objc_msgSend(a4, "gamut"))
    return 0;
  else
    return -1;
}

- (void)_addResolvedLayerReferenceToFlattenedImageRendition:(id)a3 usingArtworkRendition:(id)a4 andLayerReference:(id)a5
{
  id v8;

  v8 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("ResolvedLayerReference"));
  objc_msgSend(v8, "setReference:", a4);
  objc_msgSend(v8, "setBlendMode:", objc_msgSend(a5, "blendMode"));
  objc_msgSend(a5, "frameRect");
  objc_msgSend(v8, "setFrameRect:");
  objc_msgSend(v8, "setName:", objc_msgSend(a5, "name"));
  objc_msgSend(v8, "setOpacity:", objc_msgSend(a5, "opacity"));
  objc_msgSend(a3, "addLayerReferencesObject:", v8);
  objc_msgSend(a3, "setAsset:", objc_msgSend(a4, "asset"));
}

- (void)_makeRadiosityImages
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  double v18;
  id obj;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 209);
  v20 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("LayerStackProduction"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("renditionType.identifier == %d"), 1002), 0);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v4;
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v4);
        v6 = objc_msgSend(v5, "flattenedImageProduction");
        if (v6)
        {
          v7 = (void *)v6;
          v8 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("SimpleArtworkElementProduction"));
          objc_msgSend(v8, "setTemplateRenderingMode:", objc_msgSend(v7, "templateRenderingMode"));
          v9 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
          objc_msgSend(v9, "setElement:", objc_msgSend((id)objc_msgSend(v5, "baseKeySpec"), "element"));
          objc_msgSend(v9, "setPart:", v3);
          objc_msgSend(v8, "setBaseKeySpec:", v9);
          objc_msgSend(v8, "setRenditionType:", v20);
          objc_msgSend(v8, "setTags:", objc_msgSend(v5, "tags"));
          objc_msgSend(v5, "setRadiosityImageProduction:", v8);
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v10 = (void *)objc_msgSend(v7, "renditions");
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                v16 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RadiosityImageRenditionSpec"));
                objc_msgSend(v16, "setFlattenedImage:", v15);
                objc_msgSend(v16, "setProduction:", v8);
                objc_msgSend(v16, "setAsset:", objc_msgSend(v15, "asset"));
                v17 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
                objc_msgSend(v17, "setElement:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "element"));
                objc_msgSend(v17, "setPart:", v3);
                objc_msgSend(v17, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "scaleFactor"));
                objc_msgSend(v17, "setIdiom:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "idiom"));
                objc_msgSend(v17, "setSubtype:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "subtype"));
                objc_msgSend(v17, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "nameIdentifier"));
                objc_msgSend(v17, "setGraphicsFeatureSetClass:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "graphicsFeatureSetClass"));
                objc_msgSend(v17, "setTarget:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "target"));
                objc_msgSend(v17, "setGamut:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "gamut"));
                objc_msgSend(v16, "setCompressionType:", objc_msgSend(v15, "compressionType"));
                objc_msgSend(v16, "setKeySpec:", v17);
                v18 = (double)objc_msgSend(v17, "scaleFactor") * 40.0;
                objc_msgSend(v16, "setWidth:", (int)((double)(int)objc_msgSend(v15, "width") + v18 * 2.0));
                objc_msgSend(v16, "setHeight:", (int)((double)(int)objc_msgSend(v15, "height") + v18 * 2.0));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }
        }
        v4 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }
}

- (void)_tidyUpLayerStacks
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _TDLayerStackFilterHelper *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t n;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  uint64_t v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t jj;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t kk;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  id v73;
  id v74;
  id obj;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  uint64_t v173;

  v173 = *MEMORY[0x24BDAC8D0];
  v80 = -[CoreThemeDocument idioms](self, "idioms");
  v79 = -[CoreThemeDocument sizeClasses](self, "sizeClasses");
  v93 = -[CoreThemeDocument compressionTypes](self, "compressionTypes");
  v92 = -[CoreThemeDocument deploymentTargets](self, "deploymentTargets");
  v3 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("LayerStackProduction"), 0, 0);
  v94 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 208);
  v74 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 0);
  v91 = -[CoreThemeDocument graphicsFeatureSetClassWithIdentifier:](self, "graphicsFeatureSetClassWithIdentifier:", 2);
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  obj = v3;
  v77 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
  if (v77)
  {
    v76 = *(_QWORD *)v157;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v157 != v76)
          objc_enumerationMutation(obj);
        v78 = v4;
        v5 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v4);
        v6 = (void *)objc_msgSend(v5, "renditions");
        v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
        v152 = 0u;
        v153 = 0u;
        v154 = 0u;
        v155 = 0u;
        v7 = (void *)objc_msgSend(v5, "renditions");
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v152, v171, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v153;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v153 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * i);
              v13 = objc_alloc_init(_TDLayerStackFilterHelper);
              -[_TDLayerStackFilterHelper setLayerStackRendition:](v13, "setLayerStackRendition:", v12);
              objc_msgSend(v85, "addObject:", v13);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v152, v171, 16);
          }
          while (v9);
        }
        if (objc_msgSend(v85, "count"))
        {
          v14 = 0;
          do
          {
            v15 = (void *)objc_msgSend(v85, "objectAtIndex:", v14);
            if (objc_msgSend(v85, "count"))
            {
              v16 = 0;
              do
              {
                if (v14 != v16)
                  objc_msgSend(v15, "establishExclusionsWithHelper:idioms:sizeClasses:", objc_msgSend(v85, "objectAtIndex:", v16), v80, v79);
                ++v16;
              }
              while (v16 < objc_msgSend(v85, "count"));
            }
            ++v14;
          }
          while (v14 < objc_msgSend(v85, "count"));
        }
        v96 = (void *)objc_msgSend(v5, "name");
        v95 = (void *)objc_msgSend(v5, "flattenedImageProduction");
        if (v95)
        {
          v86 = (id)objc_msgSend((id)objc_msgSend(v5, "flattenedImageProduction"), "renditions");
        }
        else
        {
          v17 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedArtworkProduction"));
          objc_msgSend(v5, "setFlattenedImageProduction:", v17);
          objc_msgSend(v17, "setTags:", objc_msgSend(v5, "tags"));
          v18 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
          objc_msgSend(v18, "setElement:", objc_msgSend((id)objc_msgSend(v5, "baseKeySpec"), "element"));
          objc_msgSend(v18, "setPart:", v94);
          objc_msgSend(v17, "setBaseKeySpec:", v18);
          v95 = v17;
          objc_msgSend(v17, "setRenditionType:", v74);
          v86 = 0;
        }
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v81 = (id)objc_msgSend(v5, "renditions");
        v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v148, v170, 16);
        if (v83)
        {
          v82 = *(_QWORD *)v149;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v149 != v82)
                objc_enumerationMutation(v81);
              v84 = v19;
              v20 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v19);
              v103 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v144 = 0u;
              v145 = 0u;
              v146 = 0u;
              v147 = 0u;
              v97 = v20;
              v101 = (id)objc_msgSend(v20, "layerReferences");
              v104 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v144, v169, 16);
              if (v104)
              {
                v102 = *(_QWORD *)v145;
                do
                {
                  v21 = 0;
                  do
                  {
                    if (*(_QWORD *)v145 != v102)
                      objc_enumerationMutation(v101);
                    v106 = v21;
                    v22 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v21);
                    v140 = 0u;
                    v141 = 0u;
                    v142 = 0u;
                    v143 = 0u;
                    v23 = (void *)objc_msgSend((id)objc_msgSend(v22, "reference"), "renditions");
                    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v140, v168, 16);
                    if (v24)
                    {
                      v25 = v24;
                      v26 = *(_QWORD *)v141;
                      do
                      {
                        for (j = 0; j != v25; ++j)
                        {
                          if (*(_QWORD *)v141 != v26)
                            objc_enumerationMutation(v23);
                          v28 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * j);
                          v136 = 0u;
                          v137 = 0u;
                          v138 = 0u;
                          v139 = 0u;
                          v29 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v136, v167, 16);
                          if (v29)
                          {
                            v30 = v29;
                            v31 = *(_QWORD *)v137;
LABEL_41:
                            v32 = 0;
                            while (1)
                            {
                              if (*(_QWORD *)v137 != v31)
                                objc_enumerationMutation(v103);
                              if (!-[CoreThemeDocument _compareFlattenedKeySpec1:toKeySpec2:](self, "_compareFlattenedKeySpec1:toKeySpec2:", *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v32), objc_msgSend(v28, "keySpec")))break;
                              if (v30 == ++v32)
                              {
                                v30 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v136, v167, 16);
                                if (v30)
                                  goto LABEL_41;
                                goto LABEL_47;
                              }
                            }
                          }
                          else
                          {
LABEL_47:
                            objc_msgSend(v103, "addObject:", objc_msgSend(v28, "keySpec"));
                          }
                        }
                        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v140, v168, 16);
                      }
                      while (v25);
                    }
                    v21 = v106 + 1;
                  }
                  while (v106 + 1 != v104);
                  v104 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v144, v169, 16);
                }
                while (v104);
              }
              v134 = 0u;
              v135 = 0u;
              v132 = 0u;
              v133 = 0u;
              v33 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v132, v166, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v133;
                while (2)
                {
                  for (k = 0; k != v34; ++k)
                  {
                    if (*(_QWORD *)v133 != v35)
                      objc_enumerationMutation(v85);
                    v37 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * k);
                    if ((void *)objc_msgSend(v37, "layerStackRendition") == v97)
                    {
                      if (v37)
                      {
                        v38 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                        v128 = 0u;
                        v129 = 0u;
                        v130 = 0u;
                        v131 = 0u;
                        v39 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v128, v165, 16);
                        if (v39)
                        {
                          v40 = v39;
                          v41 = *(_QWORD *)v129;
                          do
                          {
                            for (m = 0; m != v40; ++m)
                            {
                              if (*(_QWORD *)v129 != v41)
                                objc_enumerationMutation(v103);
                              v43 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * m);
                              if (objc_msgSend(v37, "allowKey:", v43))
                                objc_msgSend(v38, "addObject:", v43);
                            }
                            v40 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v128, v165, 16);
                          }
                          while (v40);
                        }
                        v103 = v38;
                      }
                      goto LABEL_72;
                    }
                  }
                  v34 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v132, v166, 16);
                  if (v34)
                    continue;
                  break;
                }
              }
LABEL_72:
              v126 = 0u;
              v127 = 0u;
              v124 = 0u;
              v125 = 0u;
              v44 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v124, v164, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v125;
                do
                {
                  for (n = 0; n != v45; ++n)
                  {
                    if (*(_QWORD *)v125 != v46)
                      objc_enumerationMutation(v86);
                    v48 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * n);
                    v120 = 0u;
                    v121 = 0u;
                    v122 = 0u;
                    v123 = 0u;
                    v49 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v120, v163, 16);
                    if (v49)
                    {
                      v50 = v49;
                      v51 = *(_QWORD *)v121;
                      while (2)
                      {
                        for (ii = 0; ii != v50; ++ii)
                        {
                          if (*(_QWORD *)v121 != v51)
                            objc_enumerationMutation(v103);
                          v53 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * ii);
                          if (!-[CoreThemeDocument _compareFlattenedKeySpec1:toKeySpec2:](self, "_compareFlattenedKeySpec1:toKeySpec2:", v53, objc_msgSend(v48, "keySpec")))
                          {
                            objc_msgSend(v97, "canvasSize");
                            objc_msgSend(v48, "setWidth:", (int)v54);
                            objc_msgSend(v97, "canvasSize");
                            objc_msgSend(v48, "setHeight:", (int)v55);
                            objc_msgSend((id)objc_msgSend(v48, "keySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v96, "identifier"), "unsignedIntValue"));
                            objc_msgSend(v103, "removeObject:", v53);
                            goto LABEL_87;
                          }
                        }
                        v50 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v120, v163, 16);
                        if (v50)
                          continue;
                        break;
                      }
                    }
LABEL_87:
                    ;
                  }
                  v45 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v124, v164, 16);
                }
                while (v45);
              }
              v118 = 0u;
              v119 = 0u;
              v116 = 0u;
              v117 = 0u;
              v56 = v97;
              v88 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v116, v162, 16);
              if (v88)
              {
                v87 = *(_QWORD *)v117;
                do
                {
                  v57 = 0;
                  do
                  {
                    if (*(_QWORD *)v117 != v87)
                      objc_enumerationMutation(v103);
                    v90 = v57;
                    v58 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v57);
                    for (jj = objc_msgSend(v56, "compressionType");
                          ;
                          jj = objc_msgSend(v93, "objectAtIndexedSubscript:", 0))
                    {
                      v60 = jj;
                      if (!objc_msgSend(v58, "scaleFactor"))
                        break;
                      v98 = v60;
                      v61 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("FlattenedImageRenditionSpec"));
                      v62 = (void *)objc_msgSend(v56, "layerReferences");
                      v112 = 0u;
                      v113 = 0u;
                      v114 = 0u;
                      v115 = 0u;
                      v100 = v62;
                      v107 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v112, v161, 16);
                      if (v107)
                      {
                        v105 = *(_QWORD *)v113;
                        v99 = v61;
                        do
                        {
                          for (kk = 0; kk != v107; ++kk)
                          {
                            if (*(_QWORD *)v113 != v105)
                              objc_enumerationMutation(v100);
                            v64 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * kk);
                            v108 = 0u;
                            v109 = 0u;
                            v110 = 0u;
                            v111 = 0u;
                            v65 = (void *)objc_msgSend((id)objc_msgSend(v64, "reference"), "renditions");
                            v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v160, 16);
                            if (v66)
                            {
                              v67 = v66;
                              v68 = *(_QWORD *)v109;
LABEL_103:
                              v69 = 0;
                              while (1)
                              {
                                if (*(_QWORD *)v109 != v68)
                                  objc_enumerationMutation(v65);
                                v70 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v69);
                                if (!-[CoreThemeDocument _compareFlattenedKeySpec1:toKeySpec2:](self, "_compareFlattenedKeySpec1:toKeySpec2:", v58, objc_msgSend(v70, "keySpec")))break;
                                if (v67 == ++v69)
                                {
                                  v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v160, 16);
                                  if (v67)
                                    goto LABEL_103;
                                  goto LABEL_109;
                                }
                              }
                            }
                            else
                            {
LABEL_109:
                              v70 = (void *)objc_msgSend(MEMORY[0x24BE28C28], "bestMatchUsingObjects:getAttributeValueUsing:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:deploymentTarget:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsFeatureSetClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v64, "reference"), "renditions"), "allObjects"), &__block_literal_global_559, objc_msgSend((id)objc_msgSend(v58, "idiom"), "identifier"), objc_msgSend(v58, "subtype"), objc_msgSend((id)objc_msgSend(v58, "gamut"), "identifier"), objc_msgSend((id)objc_msgSend(v58, "target"), "identifier"), (double)objc_msgSend(v58, "scaleFactor"), objc_msgSend((id)objc_msgSend(v58, "direction"), "identifier"), objc_msgSend((id)objc_msgSend(v58, "sizeClassHorizontal"),
                                                              "identifier"),
                                              objc_msgSend((id)objc_msgSend(v58, "sizeClassVertical"), "identifier"), objc_msgSend(v58, "memoryClass"), objc_msgSend((id)objc_msgSend(v58, "graphicsFeatureSetClass"), "identifier"), 0, 0);
                              if (!v70)
                                objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 6060, CFSTR("We don't have a closest match in the layerstack oops"));
                              v61 = v99;
                            }
                            -[CoreThemeDocument _addResolvedLayerReferenceToFlattenedImageRendition:usingArtworkRendition:andLayerReference:](self, "_addResolvedLayerReferenceToFlattenedImageRendition:usingArtworkRendition:andLayerReference:", v61, v70, v64);
                          }
                          v107 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v112, v161, 16);
                        }
                        while (v107);
                      }
                      objc_msgSend(v61, "setOpaque:", 1);
                      v56 = v97;
                      objc_msgSend(v97, "canvasSize");
                      objc_msgSend(v61, "setWidth:", objc_msgSend(v58, "scaleFactor") * (int)v71);
                      objc_msgSend(v97, "canvasSize");
                      objc_msgSend(v61, "setHeight:", objc_msgSend(v58, "scaleFactor") * (int)v72);
                      v73 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
                      objc_msgSend(v73, "setPart:", v94);
                      objc_msgSend(v73, "setScaleFactor:", objc_msgSend(v58, "scaleFactor"));
                      objc_msgSend(v73, "setIdiom:", objc_msgSend(v58, "idiom"));
                      objc_msgSend(v73, "setSubtype:", objc_msgSend(v58, "subtype"));
                      objc_msgSend(v73, "setGamut:", objc_msgSend(v58, "gamut"));
                      objc_msgSend(v61, "setCompressionType:", v98);
                      objc_msgSend(v73, "setElement:", objc_msgSend((id)objc_msgSend(v95, "baseKeySpec"), "element"));
                      objc_msgSend(v73, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v96, "identifier"), "unsignedIntValue"));
                      objc_msgSend(v61, "setKeySpec:", v73);
                      objc_msgSend(v61, "setProduction:", v95);
                      if (objc_msgSend((id)objc_msgSend(v61, "compressionType"), "identifier") != 4
                        && objc_msgSend((id)objc_msgSend(v61, "compressionType"), "identifier") != 5)
                      {
                        break;
                      }
                      objc_msgSend(v73, "setGraphicsFeatureSetClass:", v91);
                      objc_msgSend(v73, "setTarget:", objc_msgSend(v92, "objectAtIndexedSubscript:", 1));
                    }
                    v57 = v90 + 1;
                  }
                  while (v90 + 1 != v88);
                  v88 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v116, v162, 16);
                }
                while (v88);
              }
              v19 = v84 + 1;
            }
            while (v84 + 1 != v83);
            v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v148, v170, 16);
          }
          while (v83);
        }

        v4 = v78 + 1;
      }
      while (v78 + 1 != v77);
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
    }
    while (v77);
  }
  -[CoreThemeDocument _makeRadiosityImages](self, "_makeRadiosityImages");
  -[CoreThemeDocument _makeSolidLayerStackTextures](self, "_makeSolidLayerStackTextures");
}

uint64_t __39__CoreThemeDocument__tidyUpLayerStacks__block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  return __valueForAttributeNamed(a2, a3);
}

- (void)_tidyUpRecognitionImages
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("ContentsRenditionSpec"), 0);
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v38;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(obj);
        v21 = v2;
        v3 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v2);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v22 = (id)objc_msgSend(v3, "contains");
        v4 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v4)
        {
          v5 = v4;
          v24 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v5; ++i)
            {
              if (*(_QWORD *)v34 != v24)
                objc_enumerationMutation(v22);
              v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("NamedArtworkProduction"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "name")), 0);
              v29 = 0u;
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
              if (v8)
              {
                v9 = v8;
                v10 = *(_QWORD *)v30;
                do
                {
                  for (j = 0; j != v9; ++j)
                  {
                    if (*(_QWORD *)v30 != v10)
                      objc_enumerationMutation(v7);
                    v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                    objc_msgSend(v12, "setRecognitionImage:", 1);
                    v27 = 0u;
                    v28 = 0u;
                    v25 = 0u;
                    v26 = 0u;
                    v13 = (void *)objc_msgSend(v12, "renditions");
                    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
                    if (v14)
                    {
                      v15 = v14;
                      v16 = *(_QWORD *)v26;
                      do
                      {
                        for (k = 0; k != v15; ++k)
                        {
                          if (*(_QWORD *)v26 != v16)
                            objc_enumerationMutation(v13);
                          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "setMonochrome:", 1);
                        }
                        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
                      }
                      while (v15);
                    }
                  }
                  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
                }
                while (v9);
              }
            }
            v5 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          }
          while (v5);
        }
        v2 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v20);
  }
}

- (void)_makeSolidLayerStackTextures
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CGImage *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  const __CFString *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  -[CoreThemeDocument targetPlatform](self, "targetPlatform");
  if (CUISDFTexturesSupported())
  {
    v3 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("LayerStackProduction"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("renditionType.identifier == %d"), 1018), 0);
    v49 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41);
    v48 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1007);
    v47 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 10);
    v52 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("NamedTextureProduction"), 0, 0));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v3;
    v36 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v36)
    {
      v4 = CFSTR("RenditionKeySpec");
      v35 = *(_QWORD *)v68;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v68 != v35)
            objc_enumerationMutation(obj);
          v37 = v5;
          v6 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v5);
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v38 = (id)objc_msgSend(v6, "renditions");
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          if (v40)
          {
            v39 = *(_QWORD *)v64;
            do
            {
              v7 = 0;
              do
              {
                if (*(_QWORD *)v64 != v39)
                  objc_enumerationMutation(v38);
                v41 = v7;
                v8 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v7);
                v59 = 0u;
                v60 = 0u;
                v61 = 0u;
                v62 = 0u;
                v42 = (id)objc_msgSend(v8, "layerReferences");
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                if (v44)
                {
                  v43 = *(_QWORD *)v60;
                  do
                  {
                    v9 = 0;
                    do
                    {
                      if (*(_QWORD *)v60 != v43)
                        objc_enumerationMutation(v42);
                      v45 = v9;
                      v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v9);
                      v55 = 0u;
                      v56 = 0u;
                      v57 = 0u;
                      v58 = 0u;
                      v46 = (id)objc_msgSend((id)objc_msgSend(v10, "reference"), "renditions");
                      v51 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                      if (v51)
                      {
                        v50 = *(_QWORD *)v56;
                        do
                        {
                          v11 = 0;
                          do
                          {
                            if (*(_QWORD *)v56 != v50)
                              objc_enumerationMutation(v46);
                            v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v11);
                            v13 = (CGImage *)objc_msgSend(v12, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)objc_msgSend(v12, "asset"), "fileURLWithDocument:", self), self, 0, 0);
                            -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                            CUICreateSDFEdgeTexturePixelFormat();
                            v14 = -[CoreThemeDocument pixelFormatWithIdentifier:](self, "pixelFormatWithIdentifier:", CUIConvertFromTXRPixelFormat());
                            -[CoreThemeDocument targetPlatform](self, "targetPlatform");
                            CUICreateSDFGradientTexturePixelFormat();
                            v15 = -[CoreThemeDocument pixelFormatWithIdentifier:](self, "pixelFormatWithIdentifier:", CUIConvertFromTXRPixelFormat());
                            v16 = (void *)objc_msgSend(v52, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.identifier == %d"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "production"), "name"), "identifier")));
                            v53 = v15;
                            v54 = v11;
                            if (objc_msgSend(v16, "firstObject")
                              && (objc_msgSend(v16, "firstObject"), objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v17 = (id)objc_msgSend(v16, "firstObject");
                            }
                            else
                            {
                              v17 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("NamedTextureProduction"));
                              v18 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v4);
                              objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v18);
                              objc_msgSend(v17, "setBaseKeySpec:", v18);
                              objc_msgSend((id)objc_msgSend(v17, "baseKeySpec"), "setElement:", v49);
                              objc_msgSend(v17, "setName:", objc_msgSend((id)objc_msgSend(v12, "production"), "name"));
                              objc_msgSend(v17, "setTextureInterpretation:", -[CoreThemeDocument textureInterpretaitionWithIdentifier:](self, "textureInterpretaitionWithIdentifier:", 0));
                              objc_msgSend(v17, "setRenditionType:", v48);
                              objc_msgSend(v17, "setRenditionSubtype:", v47);
                              objc_msgSend(v17, "setTags:", objc_msgSend((id)objc_msgSend(v12, "production"), "tags"));

                              objc_msgSend(v52, "addObject:", v17);
                            }
                            v19 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", objc_msgSend((id)objc_msgSend(v12, "asset"), "name"), CFSTR("texture"), objc_msgSend((id)objc_msgSend(v12, "asset"), "scaleFactor"), objc_msgSend((id)objc_msgSend(v12, "asset"), "category"), objc_msgSend((id)objc_msgSend(v12, "asset"), "source"));
                            v20 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v4);
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v20);
                            v21 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureRenditionSpec"));
                            objc_msgSend(v21, "setProduction:", v17);
                            objc_msgSend(v21, "setPixelFormat:", v14);
                            objc_msgSend(v21, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            objc_msgSend(v21, "setCubeMap:", 0);
                            objc_msgSend(v21, "setWidth:", CGImageGetWidth(v13));
                            objc_msgSend(v21, "setHeight:", CGImageGetWidth(v13));
                            objc_msgSend(v21, "setKeySpec:", v20);
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setDimension1:", 1);
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setDimension2:", 0);
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 0));

                            v22 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v4);
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v22);
                            v23 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureRawRenditionSpec"));
                            objc_msgSend(v23, "setProduction:", v17);
                            objc_msgSend(v19, "addRenditionsObject:", v23);
                            objc_msgSend(v23, "setAsset:", v19);
                            objc_msgSend(v23, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            objc_msgSend(v23, "setKeySpec:", v22);
                            v24 = v4;
                            objc_msgSend((id)objc_msgSend(v23, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            v25 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 181);
                            v26 = (void *)objc_msgSend(v23, "keySpec");
                            v27 = v25;
                            v4 = v24;
                            objc_msgSend(v26, "setPart:", v27);
                            objc_msgSend((id)objc_msgSend(v23, "keySpec"), "setDimension1:", 1);
                            objc_msgSend((id)objc_msgSend(v23, "keySpec"), "setDimension2:", 0);
                            objc_msgSend(v23, "setWidth:", CGImageGetWidth(v13));
                            objc_msgSend(v23, "setHeight:", CGImageGetWidth(v13));

                            v28 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureMipLevel"));
                            objc_msgSend(v28, "setTexture:", v21);
                            objc_msgSend(v28, "setTextureImage:", v23);
                            objc_msgSend(v28, "setLevel:", 0);
                            objc_msgSend(v21, "addMipLevelsObject:", v28);

                            v29 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v24);
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v29);
                            v30 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureRenditionSpec"));
                            objc_msgSend(v30, "setProduction:", v17);
                            objc_msgSend(v30, "setPixelFormat:", v53);
                            objc_msgSend(v30, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            objc_msgSend(v30, "setCubeMap:", 0);
                            objc_msgSend(v30, "setWidth:", CGImageGetWidth(v13));
                            objc_msgSend(v30, "setHeight:", CGImageGetWidth(v13));
                            objc_msgSend(v30, "setKeySpec:", v29);
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 0));
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setDimension1:", 2);
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setDimension2:", 0);

                            v31 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v24);
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v31);
                            v32 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureRawRenditionSpec"));
                            objc_msgSend(v32, "setProduction:", v17);
                            objc_msgSend(v19, "addRenditionsObject:", v32);
                            objc_msgSend(v32, "setAsset:", v19);
                            objc_msgSend(v32, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            objc_msgSend(v32, "setKeySpec:", v31);
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 181));
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setDimension1:", 2);
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setDimension2:", 0);
                            objc_msgSend(v32, "setWidth:", CGImageGetWidth(v13));
                            objc_msgSend(v32, "setHeight:", CGImageGetWidth(v13));

                            v33 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("TextureMipLevel"));
                            objc_msgSend(v33, "setTexture:", v30);
                            objc_msgSend(v33, "setTextureImage:", v32);
                            objc_msgSend(v33, "setLevel:", 0);
                            objc_msgSend(v30, "addMipLevelsObject:", v33);

                            CGImageRelease(v13);
                            v11 = v54 + 1;
                          }
                          while (v51 != v54 + 1);
                          v51 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                        }
                        while (v51);
                      }
                      v9 = v45 + 1;
                    }
                    while (v45 + 1 != v44);
                    v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                  }
                  while (v44);
                }
                v7 = v41 + 1;
              }
              while (v41 + 1 != v40);
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            }
            while (v40);
          }
          v5 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v36);
    }
  }
}

- (void)createNamedRenditionGroupProductionsForImportInfos:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t j;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  uint64_t v35;
  id v36;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v48 = -[CoreThemeDocument idioms](self, "idioms", a3, a4);
  v47 = -[CoreThemeDocument sizeClasses](self, "sizeClasses");
  v46 = -[CoreThemeDocument displayGamuts](self, "displayGamuts");
  v45 = -[CoreThemeDocument directions](self, "directions");
  v44 = -[CoreThemeDocument featureSetClasses](self, "featureSetClasses");
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v6 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Tag"), 0, 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v68 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i)), objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "identifier"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v8);
  }
  v43 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 85);
  v42 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 206);
  v41 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1013);
  v50 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("GroupedRecognitionProduction"), 0, 0));
  v40 = -[CoreThemeDocument renditionSubtypeWithIdentifier:](self, "renditionSubtypeWithIdentifier:", 10);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v51 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v64 != v49)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
        v13 = (void *)objc_msgSend(v50, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name.name == %@"), objc_msgSend(v12, "name")));
        if (objc_msgSend(v13, "firstObject")
          && (objc_msgSend(v13, "firstObject"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v13, "firstObject");
        }
        else
        {
          v14 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("GroupedRecognitionProduction"));
          v15 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", objc_msgSend(v12, "nameIdentifier"));
          objc_msgSend(v15, "setName:", objc_msgSend(v12, "name"));
          objc_msgSend(v15, "setProduction:", v14);
          v16 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
          objc_msgSend(v14, "setBaseKeySpec:", v16);
          objc_msgSend(v16, "setElement:", v43);
          objc_msgSend(v16, "setPart:", v42);
          objc_msgSend(v16, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v15, "identifier"), "unsignedIntValue"));
          objc_msgSend(v14, "setDateOfLastChange:", objc_msgSend(v12, "modificationDate"));
          objc_msgSend(v14, "setOptOutOfThinning:", objc_msgSend(v12, "optOutOfThinning"));
          objc_msgSend(v14, "setRenditionType:", v41);
          objc_msgSend(v14, "setRenditionSubtype:", v40);

          v54 = j;
          if (v12)
          {
            v17 = (void *)objc_msgSend(v12, "tags");
            if (objc_msgSend(v17, "count"))
            {
              v39 = v14;
              v52 = v12;
              v18 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
              v59 = 0u;
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v60;
                do
                {
                  for (k = 0; k != v20; ++k)
                  {
                    if (*(_QWORD *)v60 != v21)
                      objc_enumerationMutation(v17);
                    v23 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
                    v24 = (void *)objc_msgSend(v5, "objectForKey:", v23);
                    if (objc_msgSend(v24, "count"))
                    {
                      if (objc_msgSend(v24, "count") != 1)
                        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 6391, CFSTR("We should ONLY have 1 tag with a name, tag names need to be Unique"));
                      v25 = (id)objc_msgSend(v24, "objectAtIndex:", 0);
                    }
                    else
                    {
                      v25 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Tag"));
                      objc_msgSend(v25, "setIdentifier:", v23);
                      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v25), v23);
                    }
                    objc_msgSend(v18, "addObject:", v25);
                  }
                  v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                }
                while (v20);
              }
              v14 = v39;
              objc_msgSend(v39, "addTags:", v18);
              v26 = objc_msgSend(v17, "count");
              if (v26 != objc_msgSend(v18, "count"))
                objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 6398, CFSTR("Supplied tags should always equal the count of tags on the production else the counts are wrong"));

              v12 = v52;
            }
            if (objc_msgSend((id)objc_msgSend(v12, "universalTypeIdentifier"), "length"))
              objc_msgSend(v14, "setUniversalTypeIdentifier:", objc_msgSend(v12, "universalTypeIdentifier"));
          }
          v27 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("ContentsRenditionSpec"));
          objc_msgSend(v27, "setProduction:", v14);
          objc_msgSend(v27, "resetToBaseKeySpec");
          v53 = v27;
          v28 = (void *)objc_msgSend(v27, "keySpec");
          objc_msgSend(v28, "setIdiom:", objc_msgSend(v48, "objectAtIndexedSubscript:", objc_msgSend(v12, "idiom")));
          objc_msgSend(v28, "setScaleFactor:", objc_msgSend(v12, "scaleFactor"));
          objc_msgSend(v28, "setSubtype:", objc_msgSend(v12, "subtype"));
          objc_msgSend(v28, "setGamut:", objc_msgSend(v46, "objectAtIndexedSubscript:", objc_msgSend(v12, "displayGamut")));
          objc_msgSend(v28, "setSizeClassHorizontal:", objc_msgSend(v47, "objectAtIndexedSubscript:", objc_msgSend(v12, "sizeClassHorizontal")));
          objc_msgSend(v28, "setSizeClassVertical:", objc_msgSend(v47, "objectAtIndexedSubscript:", objc_msgSend(v12, "sizeClassVertical")));
          objc_msgSend(v28, "setMemoryClass:", objc_msgSend(v12, "memoryClass"));
          objc_msgSend(v28, "setDirection:", objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v12, "layoutDirection")));
          objc_msgSend(v28, "setGraphicsFeatureSetClass:", objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(v12, "graphicsFeatureSetClass")));
          objc_msgSend(v28, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v12, "appearanceIdentifier"), objc_msgSend(v12, "appearanceName"), 1));
          objc_msgSend(v28, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v12, "localizationIdentifier"), objc_msgSend(v12, "localizationName"), 1));
          v29 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v30 = (void *)objc_msgSend(v12, "containedImageNames");
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v56;
            do
            {
              for (m = 0; m != v32; ++m)
              {
                if (*(_QWORD *)v56 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * m);
                v36 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("ContentsName"));
                objc_msgSend(v36, "setName:", v35);
                objc_msgSend(v29, "addObject:", v36);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            }
            while (v32);
          }
          objc_msgSend(v53, "setContains:", v29);

          j = v54;
        }
      }
      v51 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v51);
  }

}

- (BOOL)_production:(id)a3 containsScale:(unsigned int)a4 andIdiom:(unsigned int)a5 andSubtype:(unsigned int)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_msgSend(a3, "renditions", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if (objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor") == a4
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "keySpec"), "idiom"), "identifier") == a5
          && objc_msgSend((id)objc_msgSend(v14, "keySpec"), "subtype") == a6)
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v11 = v10;
      if (v10)
        continue;
      break;
    }
  }
  return v10;
}

- (void)_generateWatchImages
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t ii;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t jj;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t kk;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  id v127;
  id obj;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  uint64_t v188;

  v188 = *MEMORY[0x24BDAC8D0];
  if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 4)
  {
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    obj = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("SimpleArtworkElementProduction"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("autoscalingType > 0")), 0);
    v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
    if (v130)
    {
      v129 = *(_QWORD *)v175;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v175 != v129)
          {
            v4 = v3;
            objc_enumerationMutation(obj);
            v3 = v4;
          }
          v131 = v3;
          v5 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v3);
          v132 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v170 = 0u;
          v171 = 0u;
          v172 = 0u;
          v173 = 0u;
          v136 = v5;
          v6 = (void *)objc_msgSend(v5, "renditions");
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v170, v186, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v171;
            do
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v171 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && objc_msgSend((id)objc_msgSend(v11, "asset"), "scaleFactor")
                  && (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "idiom"), "identifier")|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "idiom"), "identifier") == 5)&& !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphSize"), "identifier")&& !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphWeight"), "identifier")&& (!objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "asset"), "name"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF"))|| !objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "asset"), "name"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG"))))
                {
                  objc_msgSend(v132, "addObject:", v11);
                }
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v170, v186, 16);
            }
            while (v8);
          }
          v168 = 0u;
          v169 = 0u;
          v166 = 0u;
          v167 = 0u;
          v12 = v136;
          v134 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v166, v185, 16);
          if (v134)
          {
            v133 = *(_QWORD *)v167;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v167 != v133)
                  objc_enumerationMutation(v132);
                v135 = v13;
                v14 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v13);
                v15 = (void *)objc_msgSend(v14, "entity");
                v137 = v15;
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 320))
                {
                  v16 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend(v15, "name"));
                  v17 = (void *)objc_msgSend(v14, "slices");
                  if (objc_msgSend(v17, "count"))
                  {
                    v18 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v17, "count"));
                    v162 = 0u;
                    v163 = 0u;
                    v164 = 0u;
                    v165 = 0u;
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v162, v184, 16);
                    if (v19)
                    {
                      v20 = v19;
                      v21 = *(_QWORD *)v163;
                      do
                      {
                        for (j = 0; j != v20; ++j)
                        {
                          if (*(_QWORD *)v163 != v21)
                            objc_enumerationMutation(v17);
                          objc_msgSend(*(id *)(*((_QWORD *)&v162 + 1) + 8 * j), "sliceRect");
                          v24 = v23;
                          v26 = v25;
                          v28 = v27;
                          v30 = v29;
                          v31 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                          objc_msgSend(v31, "setSliceRect:", v24, v26, v28, v30);
                          objc_msgSend(v18, "addObject:", v31);

                        }
                        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v162, v184, 16);
                      }
                      while (v20);
                    }
                    objc_msgSend(v16, "setSlices:", v18);
                    v12 = v136;
                    v15 = v137;
                  }
                  objc_msgSend(v16, "setAsset:", objc_msgSend(v14, "asset"));
                  objc_msgSend(v16, "setProduction:", v12);
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v16);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v16, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v16, "keySpec"), "setSubtype:", 320);
                  objc_msgSend(v16, "setPostScaleFactor:", 0.91);
                  objc_msgSend(v16, "setCompressionType:", objc_msgSend(v14, "compressionType"));

                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 384))
                {
                  v32 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend(v15, "name"));
                  v33 = (void *)objc_msgSend(v14, "slices");
                  if (objc_msgSend(v33, "count"))
                  {
                    v34 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v33, "count"));
                    v158 = 0u;
                    v159 = 0u;
                    v160 = 0u;
                    v161 = 0u;
                    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v158, v183, 16);
                    if (v35)
                    {
                      v36 = v35;
                      v37 = *(_QWORD *)v159;
                      do
                      {
                        for (k = 0; k != v36; ++k)
                        {
                          if (*(_QWORD *)v159 != v37)
                            objc_enumerationMutation(v33);
                          objc_msgSend(*(id *)(*((_QWORD *)&v158 + 1) + 8 * k), "sliceRect");
                          v40 = v39;
                          v42 = v41;
                          v44 = v43;
                          v46 = v45;
                          v47 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                          objc_msgSend(v47, "setSliceRect:", v40, v42, v44, v46);
                          objc_msgSend(v34, "addObject:", v47);

                        }
                        v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v158, v183, 16);
                      }
                      while (v36);
                    }
                    objc_msgSend(v32, "setSlices:", v34);
                    v12 = v136;
                    v15 = v137;
                  }
                  objc_msgSend(v32, "setAsset:", objc_msgSend(v14, "asset"));
                  objc_msgSend(v32, "setProduction:", v12);
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v32);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v32, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setSubtype:", 384);
                  objc_msgSend(v32, "setPostScaleFactor:", 1.0);
                  objc_msgSend(v32, "setCompressionType:", objc_msgSend(v14, "compressionType"));

                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 340))
                {
                  v48 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend(v15, "name"));
                  v49 = (void *)objc_msgSend(v14, "slices");
                  if (objc_msgSend(v49, "count"))
                  {
                    v50 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v49, "count"));
                    v154 = 0u;
                    v155 = 0u;
                    v156 = 0u;
                    v157 = 0u;
                    v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
                    if (v51)
                    {
                      v52 = v51;
                      v53 = *(_QWORD *)v155;
                      do
                      {
                        for (m = 0; m != v52; ++m)
                        {
                          if (*(_QWORD *)v155 != v53)
                            objc_enumerationMutation(v49);
                          objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * m), "sliceRect");
                          v56 = v55;
                          v58 = v57;
                          v60 = v59;
                          v62 = v61;
                          v63 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                          objc_msgSend(v63, "setSliceRect:", v56, v58, v60, v62);
                          objc_msgSend(v50, "addObject:", v63);

                        }
                        v52 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
                      }
                      while (v52);
                    }
                    objc_msgSend(v48, "setSlices:", v50);
                    v12 = v136;
                    v15 = v137;
                  }
                  objc_msgSend(v48, "setAsset:", objc_msgSend(v14, "asset"));
                  objc_msgSend(v48, "setProduction:", v12);
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v48);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v48, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v48, "keySpec"), "setSubtype:", 340);
                  objc_msgSend(v48, "setPostScaleFactor:", 1.0);
                  objc_msgSend(v48, "setCompressionType:", objc_msgSend(v14, "compressionType"));

                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 390))
                {
                  v64 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend(v15, "name"));
                  v65 = (void *)objc_msgSend(v14, "slices");
                  if (objc_msgSend(v65, "count"))
                  {
                    v66 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v65, "count"));
                    v150 = 0u;
                    v151 = 0u;
                    v152 = 0u;
                    v153 = 0u;
                    v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v150, v181, 16);
                    if (v67)
                    {
                      v68 = v67;
                      v69 = *(_QWORD *)v151;
                      do
                      {
                        for (n = 0; n != v68; ++n)
                        {
                          if (*(_QWORD *)v151 != v69)
                            objc_enumerationMutation(v65);
                          objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * n), "sliceRect");
                          v72 = v71;
                          v74 = v73;
                          v76 = v75;
                          v78 = v77;
                          v79 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                          objc_msgSend(v79, "setSliceRect:", v72, v74, v76, v78);
                          objc_msgSend(v66, "addObject:", v79);

                        }
                        v68 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v150, v181, 16);
                      }
                      while (v68);
                    }
                    objc_msgSend(v64, "setSlices:", v66);
                    v12 = v136;
                    v15 = v137;
                  }
                  objc_msgSend(v64, "setAsset:", objc_msgSend(v14, "asset"));
                  objc_msgSend(v64, "setProduction:", v12);
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v64);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v64, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v64, "keySpec"), "setSubtype:", 390);
                  objc_msgSend(v64, "setPostScaleFactor:", 1.1);
                  objc_msgSend(v64, "setCompressionType:", objc_msgSend(v14, "compressionType"));

                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 430))
                {
                  v80 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend(v15, "name"));
                  v81 = (void *)objc_msgSend(v14, "slices");
                  if (objc_msgSend(v81, "count"))
                  {
                    v82 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v81, "count"));
                    v146 = 0u;
                    v147 = 0u;
                    v148 = 0u;
                    v149 = 0u;
                    v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v146, v180, 16);
                    if (v83)
                    {
                      v84 = v83;
                      v85 = *(_QWORD *)v147;
                      do
                      {
                        for (ii = 0; ii != v84; ++ii)
                        {
                          if (*(_QWORD *)v147 != v85)
                            objc_enumerationMutation(v81);
                          objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * ii), "sliceRect");
                          v88 = v87;
                          v90 = v89;
                          v92 = v91;
                          v94 = v93;
                          v95 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                          objc_msgSend(v95, "setSliceRect:", v88, v90, v92, v94);
                          objc_msgSend(v82, "addObject:", v95);

                        }
                        v84 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v146, v180, 16);
                      }
                      while (v84);
                    }
                    objc_msgSend(v80, "setSlices:", v82);
                    v12 = v136;
                    v15 = v137;
                  }
                  objc_msgSend(v80, "setAsset:", objc_msgSend(v14, "asset"));
                  objc_msgSend(v80, "setProduction:", v12);
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v80);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v80, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v80, "keySpec"), "setSubtype:", 430);
                  objc_msgSend(v80, "setPostScaleFactor:", 1.06);
                  objc_msgSend(v80, "setCompressionType:", objc_msgSend(v14, "compressionType"));

                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 484))
                {
                  v96 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend(v15, "name"));
                  v97 = (void *)objc_msgSend(v14, "slices");
                  if (objc_msgSend(v97, "count"))
                  {
                    v98 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v97, "count"));
                    v142 = 0u;
                    v143 = 0u;
                    v144 = 0u;
                    v145 = 0u;
                    v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v142, v179, 16);
                    if (v99)
                    {
                      v100 = v99;
                      v101 = *(_QWORD *)v143;
                      do
                      {
                        for (jj = 0; jj != v100; ++jj)
                        {
                          if (*(_QWORD *)v143 != v101)
                            objc_enumerationMutation(v97);
                          objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * jj), "sliceRect");
                          v104 = v103;
                          v106 = v105;
                          v108 = v107;
                          v110 = v109;
                          v111 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                          objc_msgSend(v111, "setSliceRect:", v104, v106, v108, v110);
                          objc_msgSend(v98, "addObject:", v111);

                        }
                        v100 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v142, v179, 16);
                      }
                      while (v100);
                    }
                    objc_msgSend(v96, "setSlices:", v98);
                    v12 = v136;
                    v15 = v137;
                  }
                  objc_msgSend(v96, "setAsset:", objc_msgSend(v14, "asset"));
                  objc_msgSend(v96, "setProduction:", v12);
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v96);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v96, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v96, "keySpec"), "setSubtype:", 484);
                  objc_msgSend(v96, "setPostScaleFactor:", 1.19);
                  objc_msgSend(v96, "setCompressionType:", objc_msgSend(v14, "compressionType"));

                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 502))
                {
                  v112 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend(v15, "name"));
                  v113 = (void *)objc_msgSend(v14, "slices");
                  if (objc_msgSend(v113, "count"))
                  {
                    v114 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v113, "count"));
                    v138 = 0u;
                    v139 = 0u;
                    v140 = 0u;
                    v141 = 0u;
                    v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v138, v178, 16);
                    if (v115)
                    {
                      v116 = v115;
                      v117 = *(_QWORD *)v139;
                      do
                      {
                        for (kk = 0; kk != v116; ++kk)
                        {
                          if (*(_QWORD *)v139 != v117)
                            objc_enumerationMutation(v113);
                          objc_msgSend(*(id *)(*((_QWORD *)&v138 + 1) + 8 * kk), "sliceRect");
                          v120 = v119;
                          v122 = v121;
                          v124 = v123;
                          v126 = v125;
                          v127 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                          objc_msgSend(v127, "setSliceRect:", v120, v122, v124, v126);
                          objc_msgSend(v114, "addObject:", v127);

                        }
                        v116 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v138, v178, 16);
                      }
                      while (v116);
                    }
                    objc_msgSend(v112, "setSlices:", v114);
                    v12 = v136;
                  }
                  objc_msgSend(v112, "setAsset:", objc_msgSend(v14, "asset"));
                  objc_msgSend(v112, "setProduction:", v12);
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v112);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v112, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v112, "keySpec"), "setSubtype:", 502);
                  objc_msgSend(v112, "setPostScaleFactor:", 1.19);
                  objc_msgSend(v112, "setCompressionType:", objc_msgSend(v14, "compressionType"));

                }
                v13 = v135 + 1;
              }
              while (v135 + 1 != v134);
              v134 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v166, v185, 16);
            }
            while (v134);
          }

          v3 = v131 + 1;
        }
        while (v131 + 1 != v130);
        v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
      }
      while (v130);
    }
  }
}

- (void)_backwardsCompatibilityPatchForLayoutDirection
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  if (!-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 9))
  {
    v3 = -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", 5);
    v4 = -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", 4);
    v39 = -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", 0);
    v5 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("SimpleArtworkRenditionSpec"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("keySpec.direction == %@ OR keySpec.direction == %@"), v3, v4), 0);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v61 != v9)
            objc_enumerationMutation(v5);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "production");
          if ((objc_msgSend(v6, "containsObject:", v11) & 1) == 0)
            objc_msgSend(v6, "addObject:", v11);
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v8);
    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v12 = v39;
    v41 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v57;
      v37 = v6;
      v38 = v3;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v57 != v40)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v13);
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v42 = v13;
          v43 = v14;
          v15 = (void *)objc_msgSend(v14, "renditions");
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v53;
LABEL_18:
            v19 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v19);
              if ((id)objc_msgSend((id)objc_msgSend(v20, "keySpec"), "direction") == v12
                || !objc_msgSend((id)objc_msgSend(v20, "keySpec"), "direction"))
              {
                break;
              }
              if (v17 == ++v19)
              {
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
                if (v17)
                  goto LABEL_18;
                goto LABEL_25;
              }
            }
          }
          else
          {
LABEL_25:
            v21 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("SimpleArtworkRenditionSpec"));
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v22 = (void *)objc_msgSend(v43, "renditions");
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v49;
LABEL_27:
              v26 = 0;
              while (1)
              {
                if (*(_QWORD *)v49 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v26);
                if ((id)objc_msgSend((id)objc_msgSend(v27, "keySpec"), "direction") == v3)
                  break;
                if (v24 == ++v26)
                {
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
                  if (v24)
                    goto LABEL_27;
                  goto LABEL_35;
                }
              }
              if (v27)
                goto LABEL_36;
            }
LABEL_35:
            v27 = (void *)objc_msgSend((id)objc_msgSend(v43, "renditions"), "anyObject");
LABEL_36:
            objc_msgSend(v27, "alignmentRect");
            objc_msgSend(v21, "setAlignmentRect:");
            objc_msgSend(v21, "setAlignmentRectString:", (id)objc_msgSend((id)objc_msgSend(v27, "alignmentRectString"), "copy"));
            objc_msgSend(v21, "setIsTintable:", objc_msgSend(v27, "isTintable"));
            objc_msgSend(v21, "setNonAlphaImageAreaString:", (id)objc_msgSend((id)objc_msgSend(v27, "nonAlphaImageAreaString"), "copy"));
            objc_msgSend(v21, "setOriginalImageSizeString:", (id)objc_msgSend((id)objc_msgSend(v27, "originalImageSizeString"), "copy"));
            objc_msgSend(v21, "setAsset:", objc_msgSend(v27, "asset"));
            objc_msgSend(v21, "setCompressionType:", objc_msgSend(v27, "compressionType"));
            v28 = (void *)objc_msgSend(v27, "slices");
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v45;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v45 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                  v34 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                  objc_msgSend(v33, "sliceRect");
                  objc_msgSend(v34, "setSliceRect:");
                  objc_msgSend(v34, "setSliceRectString:", (id)objc_msgSend((id)objc_msgSend(v33, "sliceRectString"), "copy"));
                  objc_msgSend(v34, "setProduction:", objc_msgSend(v33, "production"));
                  objc_msgSend(v34, "setRendition:", v21);
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
              }
              while (v30);
            }
            objc_msgSend(v21, "setAlphaCrop:", objc_msgSend(v27, "alphaCrop"));
            objc_msgSend(v21, "setHeight:", objc_msgSend(v27, "height"));
            objc_msgSend(v21, "setMonochrome:", objc_msgSend(v27, "monochrome"));
            objc_msgSend(v21, "setOpaque:", objc_msgSend(v27, "opaque"));
            objc_msgSend(v21, "setPackedPointX:", objc_msgSend(v27, "packedPointX"));
            objc_msgSend(v21, "setPackedPointY:", objc_msgSend(v27, "packedPointY"));
            objc_msgSend(v21, "setWidth:", objc_msgSend(v27, "width"));
            objc_msgSend(v27, "postScaleFactor");
            objc_msgSend(v21, "setPostScaleFactor:");
            objc_msgSend(v43, "addRenditionsObject:", v21);
            objc_msgSend(v21, "setRenditionType:", objc_msgSend(v27, "renditionType"));
            v35 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
            v12 = v39;
            objc_msgSend(v35, "setDirection:", v39);
            v36 = (void *)objc_msgSend(v27, "keySpec");
            objc_msgSend(v35, "setDimension1:", objc_msgSend(v36, "dimension1"));
            objc_msgSend(v35, "setDimension2:", objc_msgSend(v36, "dimension2"));
            objc_msgSend(v35, "setMemoryClass:", objc_msgSend(v36, "memoryClass"));
            objc_msgSend(v35, "setNameIdentifier:", objc_msgSend(v36, "nameIdentifier"));
            objc_msgSend(v35, "setScaleFactor:", objc_msgSend(v36, "scaleFactor"));
            objc_msgSend(v35, "setSubtype:", objc_msgSend(v36, "subtype"));
            objc_msgSend(v35, "setElement:", objc_msgSend(v36, "element"));
            objc_msgSend(v35, "setGamut:", objc_msgSend(v36, "gamut"));
            objc_msgSend(v35, "setGraphicsFeatureSetClass:", objc_msgSend(v36, "graphicsFeatureSetClass"));
            objc_msgSend(v35, "setIdiom:", objc_msgSend(v36, "idiom"));
            objc_msgSend(v35, "setLayer:", objc_msgSend(v36, "layer"));
            objc_msgSend(v35, "setPart:", objc_msgSend(v36, "part"));
            objc_msgSend(v35, "setPresentationState:", objc_msgSend(v36, "presentationState"));
            objc_msgSend(v35, "setPreviousState:", objc_msgSend(v36, "previousState"));
            objc_msgSend(v35, "setSize:", objc_msgSend(v36, "size"));
            objc_msgSend(v35, "setSizeClassVertical:", objc_msgSend(v36, "sizeClassVertical"));
            objc_msgSend(v35, "setSizeClassHorizontal:", objc_msgSend(v36, "sizeClassHorizontal"));
            objc_msgSend(v35, "setState:", objc_msgSend(v36, "state"));
            objc_msgSend(v35, "setTarget:", objc_msgSend(v36, "target"));
            objc_msgSend(v35, "setValue:", objc_msgSend(v36, "value"));
            objc_msgSend(v35, "setGlyphSize:", objc_msgSend(v36, "glyphSize"));
            objc_msgSend(v35, "setGlyphWeight:", objc_msgSend(v36, "glyphWeight"));
            objc_msgSend(v35, "setAppearance:", objc_msgSend(v36, "appearance"));
            objc_msgSend(v35, "setLocalization:", objc_msgSend(v36, "localization"));
            objc_msgSend(v21, "setKeySpec:", v35);
            v6 = v37;
            v3 = v38;
          }
          v13 = v42 + 1;
        }
        while (v42 + 1 != v41);
        v41 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      }
      while (v41);
    }
  }
}

- (void)importNamedAssetsFromFileURLs:(id)a3 referenceFiles:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *global_queue;
  _QWORD v14[9];
  BOOL v15;

  if (a4)
    v9 = -[CoreThemeDocument _themeBitSourceForReferencedFilesAtURLs:createIfNecessary:](self, "_themeBitSourceForReferencedFilesAtURLs:createIfNecessary:", a3, 1);
  else
    v9 = -[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", 0);
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(-[CoreThemeDocument rootPathForProductionData](self, "rootPathForProductionData"), "stringByAppendingPathComponent:", objc_msgSend(v9, "path"));
    v12 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v11, 1);
    global_queue = dispatch_get_global_queue(0, 0);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke;
    v14[3] = &unk_24EF2C1A0;
    v15 = a4;
    v14[4] = a3;
    v14[5] = self;
    v14[7] = v10;
    v14[8] = a5;
    v14[6] = v12;
    dispatch_async(global_queue, v14);
  }
  else if (a5)
  {
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
  }
}

void __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[6];
  __int128 v21;
  char v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v4 = objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v5 = *MEMORY[0x24BDBCC60];
  v29[0] = *MEMORY[0x24BDBCC60];
  v6 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = a1;
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "resourceValuesForKeys:error:", v6, 0), "objectForKey:", v5), "BOOLValue"))
        {
          v13 = (void *)objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v4, 6, 0);
          v14 = objc_msgSend(v13, "nextObject");
          if (v14)
          {
            v15 = v14;
            do
            {
              objc_msgSend(v2, "addObject:", v15);
              v15 = objc_msgSend(v13, "nextObject");
            }
            while (v15);
          }
        }
        else
        {
          objc_msgSend(v2, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  if (*(_BYTE *)(v19 + 72))
  {
    v16 = 1;
LABEL_18:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke_2;
    block[3] = &unk_24EF2C178;
    block[4] = *(_QWORD *)(v19 + 40);
    block[5] = v2;
    v22 = v16;
    v21 = *(_OWORD *)(v19 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    return;
  }
  v23 = 0;
  v17 = objc_msgSend((id)objc_opt_class(), "_imageAssetURLsByCopyingFileURLs:toManagedLocationAtURL:error:", v2, *(_QWORD *)(v19 + 48), &v23);
  if (v17)
  {
    v2 = (void *)v17;
    v16 = *(_BYTE *)(v19 + 72);
    goto LABEL_18;
  }
  NSLog(CFSTR("Unable to import named image assets: %@"), objc_msgSend(v23, "localizedDescription"));
  v18 = *(_QWORD *)(v19 + 64);
  if (v18)
    (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v23);
}

uint64_t __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t result;
  id v12;
  id v13;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "undoManager");
  v12 = 0;
  v13 = 0;
  v3 = (void *)MEMORY[0x2276A576C](objc_msgSend(v2, "disableUndoRegistration"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), 0);
  objc_autoreleasePoolPop(v3);
  v5 = (void *)MEMORY[0x2276A576C]();
  objc_msgSend(*(id *)(a1 + 32), "createNamedArtworkProductionsForAssets:customInfos:error:", v4, 0, &v13);
  v6 = v13;
  objc_autoreleasePoolPop(v5);

  if (v13)
  {
    NSLog(CFSTR("Unable to import image assets: %@"), objc_msgSend(v13, "localizedDescription"));
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v13);
  }
  v8 = (void *)MEMORY[0x2276A576C]();
  objc_msgSend(*(id *)(a1 + 32), "_tidyUpRecognitionImages");
  objc_msgSend(*(id *)(a1 + 32), "_generateWatchImages");
  objc_msgSend(*(id *)(a1 + 32), "_automaticSRGBGenerationFromP3");
  objc_msgSend(*(id *)(a1 + 32), "_automaticP3GenerationFromSRGB");
  objc_msgSend(*(id *)(a1 + 32), "_createForwardstopRenditions");
  objc_msgSend(*(id *)(a1 + 32), "_tidyUpLayerStacks");
  objc_msgSend(*(id *)(a1 + 32), "_optimizeForDeviceTraits");
  objc_msgSend(*(id *)(a1 + 32), "_backwardsCompatibilityPatchForLayoutDirection");
  objc_autoreleasePoolPop(v8);
  v9 = (void *)MEMORY[0x2276A576C]();
  objc_msgSend(*(id *)(a1 + 32), "packRenditionsError:", &v12);
  objc_autoreleasePoolPop(v9);
  v10 = v12;
  objc_msgSend(v2, "enableUndoRegistration");
  if (v10)
    NSLog(CFSTR("Unable to pack image assets: %@"), objc_msgSend(v12, "localizedDescription"));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, id))(result + 16))(result, v10 == 0, v12);
  return result;
}

- (BOOL)canImportNamedAssetImportInfo:(id)a3
{
  uint64_t v5;
  unsigned int v6;

  if (objc_msgSend(a3, "renditionType") != 1018
    || (-[CoreThemeDocument targetPlatform](self, "targetPlatform"), LODWORD(v5) = CUISDFTexturesSupported(), (_DWORD)v5))
  {
    if (!-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 19)
      || objc_msgSend(a3, "renditionType") < 0
      || objc_msgSend(a3, "renditionType") > 5
      || (v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "fileURL"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("HEIF"))) != 0&& (v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "fileURL"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("HEIC"))) != 0)
    {
      -[CoreThemeDocument targetPlatform](self, "targetPlatform");
      v6 = CUIMaxScaleForTargetPlatform();
      LOBYTE(v5) = -[CoreThemeDocument targetPlatform](self, "targetPlatform") == 4
                && objc_msgSend(a3, "idiom") == 5
                && objc_msgSend(a3, "scaleFactor") >= (unint64_t)v6
                || objc_msgSend(a3, "scaleFactor") <= (unint64_t)v6;
    }
  }
  return v5;
}

- (void)importNamedAssetsWithImportInfos:(id)a3 referenceFiles:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *global_queue;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD block[19];
  BOOL v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[16];
  _QWORD v40[9];
  int64x2_t v41;
  int64x2_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;

  v18 = a4;
  v29 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  CUILogLogToStderr();
  self->_donotstoreDocumentChecksum = 1;
  *((_BYTE *)v44 + 24) = 0;
  v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke;
  v40[3] = &unk_24EF2C1F0;
  v41 = vdupq_n_s64(0x404E000000000000uLL);
  v40[4] = self;
  v40[5] = a3;
  v42 = vdupq_n_s64(0x4056800000000000uLL);
  v40[6] = v12;
  v40[7] = a5;
  v40[8] = &v43;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v40);
  if (*((_BYTE *)v44 + 24))
    goto LABEL_2;
  v39[0] = v13;
  v39[1] = 3221225472;
  v39[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_3;
  v39[3] = &unk_24EF2C218;
  v39[4] = self;
  v39[5] = v27;
  v39[6] = v28;
  v39[7] = v24;
  v39[8] = v23;
  v39[9] = v26;
  v39[10] = v10;
  v39[11] = v25;
  v39[12] = v22;
  v39[13] = v29;
  v39[14] = v9;
  v39[15] = v11;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v39);
  if (objc_msgSend(v11, "count"))
  {
    v38[0] = v13;
    v38[1] = 3221225472;
    v38[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_4;
    v38[3] = &unk_24EF2C240;
    v38[4] = v11;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v38);
  }

  if (objc_msgSend(v9, "count"))
  {
    if (a5)
      (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreThemeDefinition"), 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Misconfigured TDNamedAssetInfo"), *MEMORY[0x24BDD0FC8])));
    goto LABEL_2;
  }
  v37[0] = v13;
  v37[1] = 3221225472;
  v37[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_5;
  v37[3] = &unk_24EF2C240;
  v37[4] = v20;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v37);
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_6;
  v36[3] = &unk_24EF2C240;
  v36[4] = v21;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v36);
  v35[0] = v13;
  v35[1] = 3221225472;
  v35[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_7;
  v35[3] = &unk_24EF2C240;
  v35[4] = v21;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v35);
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_8;
  v34[3] = &unk_24EF2C240;
  v34[4] = v8;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v34);
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_9;
  v33[3] = &unk_24EF2C240;
  v33[4] = v19;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v33);
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_10;
  v32[3] = &unk_24EF2C240;
  v32[4] = v17;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v32);
  if (v18)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v14, "addObjectsFromArray:", v20);
    objc_msgSend(v14, "addObjectsFromArray:", v21);
    objc_msgSend(v14, "addObjectsFromArray:", v19);
    v15 = -[CoreThemeDocument _themeBitSourceForReferencedFilesAtURLs:createIfNecessary:](self, "_themeBitSourceForReferencedFilesAtURLs:createIfNecessary:", v14, 1);

    if (v15)
    {
LABEL_10:
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_11;
      block[3] = &unk_24EF2C290;
      v31 = v18;
      block[4] = v20;
      block[5] = v21;
      block[6] = v19;
      block[7] = self;
      block[8] = v15;
      block[9] = v29;
      block[10] = v28;
      block[11] = v10;
      block[12] = v22;
      block[13] = v25;
      block[14] = v24;
      block[15] = v26;
      block[16] = v23;
      block[17] = v27;
      block[18] = a5;
      dispatch_async(global_queue, block);
      goto LABEL_2;
    }
  }
  else
  {
    v15 = -[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", 0);
    if (v15)
      goto LABEL_10;
  }
  if (a5)
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
LABEL_2:
  _Block_object_dispose(&v43, 8);
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  __int128 v13;

  objc_msgSend(a2, "verify");
  if (objc_msgSend(*(id *)(a1 + 32), "targetPlatform") == 1
    && !objc_msgSend(a2, "renditionType")
    && objc_msgSend(a2, "idiom") == 1
    && objc_msgSend(a2, "scaleFactor") == 3)
  {
    objc_msgSend((id)objc_msgSend(a2, "iconSize"), "sizeValue");
    if (v8 == *(double *)(a1 + 72) && v7 == *(double *)(a1 + 80))
    {
      v9 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_2;
      v12[3] = &unk_24EF2C1C8;
      v12[4] = a2;
      v13 = *(_OWORD *)(a1 + 88);
      if (objc_msgSend(v9, "indexOfObjectPassingTest:", v12) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = (void *)objc_msgSend(a2, "copy");
        objc_msgSend(v10, "setScaleFactor:", 2);
        objc_msgSend(v10, "setSubtype:", 1792);
        objc_msgSend(v10, "setIconSize:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithSize:", *(double *)(a1 + 88), *(double *)(a1 + 96)));
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

      }
    }
  }
  if (objc_msgSend(a2, "graphicsFeatureSetClass") >= 10 && objc_msgSend(a2, "graphicsFeatureSetClass") != 10)
  {
    if (objc_msgSend(a2, "graphicsFeatureSetClass") == 11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreThemeDefinition"), 4, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Unrecognised Metal GPU Family (Apple10) is not supported by this target platform"), *MEMORY[0x24BDD0FC8], 0, 0));
      NSLog(CFSTR("Apple10 not supported"));
LABEL_15:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      *a4 = 1;
      return objc_msgSend(*(id *)(a1 + 48), "addObject:", a2);
    }
    if (objc_msgSend(a2, "graphicsFeatureSetClass") >= 12)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreThemeDefinition"), 10, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Unrecognised Metal GPU Family"), *MEMORY[0x24BDD0FC8], 0, 0));
      NSLog(CFSTR("> Apple10 not supported"));
      goto LABEL_15;
    }
  }
  return objc_msgSend(*(id *)(a1 + 48), "addObject:", a2);
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  double v7;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "renditionType")
    || objc_msgSend(*(id *)(a1 + 32), "subtype") != 1792
    || objc_msgSend(*(id *)(a1 + 32), "idiom") != 1
    || objc_msgSend(*(id *)(a1 + 32), "scaleFactor") != 2)
  {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "iconSize"), "sizeValue");
  if (v7 != *(double *)(a1 + 40) || v6 != *(double *)(a1 + 48))
    return 0;
  result = 1;
  *a4 = 1;
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a2, "renditionType") != 1009
    && objc_msgSend(a2, "renditionType") != 1015
    && (objc_msgSend(a2, "compressionType") == 4 || objc_msgSend(a2, "compressionType") == 5)
    && objc_msgSend(a2, "compressionType") == 5
    && objc_msgSend(*(id *)(a1 + 32), "featureEnabled:", 16))
  {
    objc_msgSend(a2, "setCompressionType:", 4);
  }
  if (objc_msgSend(a2, "renditionType") == 1007)
  {
    if (!objc_msgSend(a2, "scaleFactor"))
      objc_msgSend(a2, "setScaleFactor:", 1);
    if (objc_msgSend(a2, "texturePixelFormat"))
      v4 = *(void **)(a1 + 48);
    else
      v4 = *(void **)(a1 + 40);
    return objc_msgSend(v4, "addObject:", a2);
  }
  if (objc_msgSend(a2, "renditionType") == 1009)
  {
    v4 = *(void **)(a1 + 56);
    return objc_msgSend(v4, "addObject:", a2);
  }
  if (objc_msgSend(a2, "renditionType") == 1015)
  {
    v4 = *(void **)(a1 + 64);
    return objc_msgSend(v4, "addObject:", a2);
  }
  if (objc_msgSend(a2, "renditionType") == 1011)
  {
    v4 = *(void **)(a1 + 72);
    return objc_msgSend(v4, "addObject:", a2);
  }
  if (objc_msgSend(a2, "renditionType") == 1014)
  {
    v4 = *(void **)(a1 + 80);
    return objc_msgSend(v4, "addObject:", a2);
  }
  if (objc_msgSend(a2, "renditionType") == 1017)
  {
    v4 = *(void **)(a1 + 88);
    return objc_msgSend(v4, "addObject:", a2);
  }
  if (objc_msgSend(a2, "renditionType") == 1013)
  {
    if (!objc_msgSend(a2, "scaleFactor"))
      objc_msgSend(a2, "setScaleFactor:", 1);
    objc_msgSend(*(id *)(a1 + 96), "addObject:", a2);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "canImportNamedAssetImportInfo:", a2))
  {
    if (objc_msgSend(a2, "renditionType") == 1002 || objc_msgSend(a2, "renditionType") == 1018)
      objc_msgSend(*(id *)(a1 + 104), "insertObject:atIndex:", a2, 0);
    else
      objc_msgSend(*(id *)(a1 + 104), "addObject:", a2);
    if (objc_msgSend(a2, "containedImageNames") && !objc_msgSend(a2, "renditionType"))
      objc_msgSend(*(id *)(a1 + 112), "addObject:", a2);
    if (objc_msgSend(a2, "renditionType") == 1002 || objc_msgSend(a2, "renditionType") == 1018)
    {
      if (!objc_msgSend(a2, "scaleFactor"))
        objc_msgSend(a2, "setScaleFactor:", 1);
      if (objc_msgSend(a2, "compressionType"))
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(a2, "compressionType"));
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = (void *)objc_msgSend(a2, "layerReferences", 0);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v13;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v13 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(a1 + 120), "setObject:forKey:", v6, objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "layerName"));
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          }
          while (v9);
        }

      }
    }
  }
  if (objc_msgSend(a2, "renditionType") == 1000 && !objc_msgSend(a2, "scaleFactor"))
    objc_msgSend(a2, "setScaleFactor:", 1);
  if (!objc_msgSend(a2, "renditionType"))
    objc_msgSend(a2, "setResizingMode:", 1);
  result = objc_msgSend(a2, "renditionType");
  if ((result & 0x8000000000000000) == 0)
  {
    result = objc_msgSend(a2, "renditionType");
    if (result <= 5)
    {
      result = objc_msgSend(a2, "scaleFactor");
      if (!result)
      {
        result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "fileURL"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF"));
        if (result)
          return objc_msgSend(a2, "setScaleFactor:", 1);
      }
    }
  }
  return result;
}

void *__87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a2, "name"));
  if (result)
    return (void *)objc_msgSend(a2, "setCompressionType:", (int)objc_msgSend(result, "intValue"));
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a2, "fileURL");
  v5 = *(void **)(a1 + 32);
  if (v4)
    v6 = objc_msgSend(a2, "fileURL");
  else
    v6 = *MEMORY[0x24BDBD430];
  return objc_msgSend(v5, "addObject:", v6);
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_msgSend(a2, "textureInfos", 0);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x24BDBD430];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "fileURL");
        v11 = *(void **)(a1 + 32);
        v12 = v7;
        if (v10)
          v12 = objc_msgSend(v9, "fileURL", v7);
        objc_msgSend(v11, "addObject:", v12);
        ++v8;
      }
      while (v5 != v8);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_msgSend(a2, "textureInfos", 0);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x24BDBD430];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "fileURL");
        v11 = *(void **)(a1 + 32);
        v12 = v7;
        if (v10)
          v12 = objc_msgSend(v9, "fileURL", v7);
        objc_msgSend(v11, "addObject:", v12);
        ++v8;
      }
      while (v5 != v8);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a2, "fileURL");
  v5 = *(void **)(a1 + 32);
  if (v4)
    v6 = objc_msgSend(a2, "fileURL");
  else
    v6 = *MEMORY[0x24BDBD430];
  return objc_msgSend(v5, "addObject:", v6);
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a2, "fileURL");
  v5 = *(void **)(a1 + 32);
  if (v4)
    v6 = objc_msgSend(a2, "fileURL");
  else
    v6 = *MEMORY[0x24BDBD430];
  return objc_msgSend(v5, "addObject:", v6);
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a2, "fileURL");
  v5 = *(void **)(a1 + 32);
  if (v4)
    v6 = objc_msgSend(a2, "fileURL");
  else
    v6 = *MEMORY[0x24BDBD430];
  return objc_msgSend(v5, "addObject:", v6);
}

void __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[6];
  __int128 v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;

  if (*(_BYTE *)(a1 + 152))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 48);
LABEL_3:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_15;
    block[3] = &unk_24EF2C268;
    block[4] = *(_QWORD *)(a1 + 56);
    block[5] = v2;
    v29 = *(_BYTE *)(a1 + 152);
    v21 = *(_OWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 136);
    v5 = *(_QWORD *)(a1 + 144);
    v22 = v3;
    v6 = *(_OWORD *)(a1 + 104);
    v23 = *(_OWORD *)(a1 + 88);
    v24 = v6;
    v25 = *(_OWORD *)(a1 + 120);
    v7 = *(_QWORD *)(a1 + 80);
    v26 = v4;
    v27 = v7;
    v28 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    return;
  }
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rootPathForProductionData"), "stringByAppendingPathComponent:", objc_msgSend(*(id *)(a1 + 64), "path"));
  v9 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v8, 1);
  v33 = 0;
  v2 = (void *)objc_msgSend((id)objc_opt_class(), "_imageAssetURLsByCopyingFileURLs:toManagedLocationAtURL:error:", *(_QWORD *)(a1 + 32), v9, &v33);
  v10 = objc_msgSend(v2, "count");
  if (v10 != objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    NSLog(CFSTR("Unable to import named image asssets: %@"), objc_msgSend(v33, "localizedDescription"));
    goto LABEL_10;
  }
  v11 = MEMORY[0x24BDAC760];
  v12 = *(void **)(a1 + 72);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_12;
  v32[3] = &unk_24EF2C240;
  v32[4] = v2;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v32);
  v13 = (void *)objc_msgSend((id)objc_opt_class(), "_imageAssetURLsByCopyingFileURLs:toManagedLocationAtURL:error:", *(_QWORD *)(a1 + 40), v9, &v33);
  v14 = objc_msgSend(v13, "count");
  if (v14 != objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    NSLog(CFSTR("Unable to import named image asssets: %@"), objc_msgSend(v33, "localizedDescription"));
LABEL_10:
    v18 = *(_QWORD *)(a1 + 144);
    if (v18)
      (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v33);
    return;
  }
  v15 = *(void **)(a1 + 80);
  v31[0] = v11;
  v31[1] = 3221225472;
  v31[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_13;
  v31[3] = &unk_24EF2C240;
  v31[4] = v13;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v31);
  v3 = (void *)objc_msgSend((id)objc_opt_class(), "_imageAssetURLsByCopyingFileURLs:toManagedLocationAtURL:error:", *(_QWORD *)(a1 + 48), v9, &v33);
  v16 = objc_msgSend(v3, "count");
  if (v16 == objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v17 = *(void **)(a1 + 88);
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_14;
    v30[3] = &unk_24EF2C240;
    v30[4] = v3;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v30);
    goto LABEL_3;
  }
  NSLog(CFSTR("Unable to import recognition object assets: %@"), objc_msgSend(v33, "localizedDescription"));
  v19 = *(_QWORD *)(a1 + 144);
  if (v19)
    (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v33);
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFileURL:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"));
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_msgSend(a2, "textureInfos", 0);
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setFileURL:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3));
      }
      while (v7 != v9);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFileURL:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"));
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  id v11;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "undoManager");
  objc_msgSend(v2, "disableUndoRegistration");
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:sortedCustomInfos:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &v11);
  v4 = objc_msgSend(v3, "count");
  if (v4 == objc_msgSend(v11, "count"))
  {
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "_addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:sortedCustomInfos:", *(_QWORD *)(a1 + 64), 0, *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), &v10);
    v6 = objc_msgSend(v5, "count");
    if (v6 == objc_msgSend(v10, "count"))
    {
      v9 = 0;
      objc_msgSend(*(id *)(a1 + 32), "createNamedRenditionGroupProductionsForImportInfos:error:", *(_QWORD *)(a1 + 80), &v9);
      if (v9
        || (objc_msgSend(*(id *)(a1 + 32), "createNamedArtworkProductionsForAssets:customInfos:error:", v3, v11, &v9), v9)
        || (objc_msgSend(*(id *)(a1 + 32), "createNamedRecognitionObjectsForAssets:customInfos:error:", v5, v10, &v9), v9)
        || (objc_msgSend(*(id *)(a1 + 32), "createNamedGlyphVectorForCustomInfos:referenceFiles:bitSource:error:", *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 48), &v9), v9)|| (objc_msgSend(*(id *)(a1 + 32), "createNamedColorProductionsForImportInfos:error:", *(_QWORD *)(a1 + 96), &v9), v9)|| (objc_msgSend(*(id *)(a1 + 32), "createNamedModelsForCustomInfos:referenceFiles:bitSource:error:", *(_QWORD *)(a1 + 104), *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 48),
              &v9),
            v9)
        || (objc_msgSend(*(id *)(a1 + 32), "createTextStyleProductionsForImportInfos:error:", *(_QWORD *)(a1 + 112), &v9), v9)|| (objc_msgSend(*(id *)(a1 + 32), "createNamedTexturesForCustomInfos:referenceFiles:bitSource:error:", objc_msgSend(*(id *)(a1 + 32), "updateAutomaticTexturesForCustomInfos:allTextureInfos:", *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128)), *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 48), &v9), v9))
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_tidyUpRecognitionImages");
        objc_msgSend(*(id *)(a1 + 32), "_generateWatchImages");
        objc_msgSend(*(id *)(a1 + 32), "_automaticSRGBGenerationFromP3");
        objc_msgSend(*(id *)(a1 + 32), "_automaticP3GenerationFromSRGB");
        objc_msgSend(*(id *)(a1 + 32), "_createForwardstopRenditions");
        objc_msgSend(*(id *)(a1 + 32), "_tidyUpLayerStacks");
        objc_msgSend(*(id *)(a1 + 32), "_optimizeForDeviceTraits");
        objc_msgSend(*(id *)(a1 + 32), "_backwardsCompatibilityPatchForLayoutDirection");
        v7 = 1;
      }
      objc_msgSend(v2, "enableUndoRegistration");
      result = *(_QWORD *)(a1 + 136);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, v7, v9);
    }
    else
    {
      NSLog(CFSTR("Unable to import named image assets because we couldn't make a database object for each file for some reason"));
      objc_msgSend(v2, "enableUndoRegistration");
      result = *(_QWORD *)(a1 + 136);
      if (result)
        return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
    }
  }
  else
  {
    NSLog(CFSTR("Unable to import named image assets because we couldn't make a database object for each file for some reason"));
    objc_msgSend(v2, "enableUndoRegistration");
    result = *(_QWORD *)(a1 + 136);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  }
  return result;
}

- (void)deleteNamedAssets:(id)a3 shouldDeleteAssetFiles:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *global_queue;
  id v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[6];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v24 = a5;
  v5 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a3;
  v28 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v8, "addObject:", v11, v24);
        v12 = (void *)objc_msgSend(v11, "renditions");
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v31 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v8, "addObject:", v17);
              v18 = objc_msgSend(v17, "asset");
              if (v18)
              {
                v19 = (void *)v18;
                objc_msgSend(v8, "addObject:", v18);
                if (v5)
                {
                  v20 = objc_msgSend(v19, "fileURLWithDocument:", self);
                  if (v20)
                    objc_msgSend(v9, "addObject:", v20);
                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v14);
        }
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v28);
  }
  v21 = -[TDPersistentDocument undoManager](self, "undoManager", v24);
  if (v5)
  {
    v22 = v21;
    objc_msgSend(v21, "disableUndoRegistration");
    -[CoreThemeDocument deleteObjects:](self, "deleteObjects:", v8);

    objc_msgSend(v22, "enableUndoRegistration");
  }
  else
  {
    -[CoreThemeDocument deleteObjects:](self, "deleteObjects:", v8);

  }
  if (objc_msgSend(v9, "count"))
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__CoreThemeDocument_deleteNamedAssets_shouldDeleteAssetFiles_completionHandler___block_invoke;
    block[3] = &unk_24EF2C2B8;
    block[4] = v9;
    block[5] = v25;
    dispatch_async(global_queue, block);
  }
  else if (v25)
  {
    (*(void (**)(void))(v25 + 16))();
  }

}

uint64_t __80__CoreThemeDocument_deleteNamedAssets_shouldDeleteAssetFiles_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_addAssetsFromCustomAssetInfos:(id)a3 bitSource:(id)a4 error:(id *)a5
{
  void *v9;
  _QWORD v11[8];

  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__CoreThemeDocument__addAssetsFromCustomAssetInfos_bitSource_error___block_invoke;
  v11[3] = &unk_24EF2C2E0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = v9;
  v11[7] = a5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);
  return v9;
}

void __68__CoreThemeDocument__addAssetsFromCustomAssetInfos_bitSource_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = (void *)objc_msgSend(a2, "customAsset");
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newObjectForEntity:", CFSTR("CustomAsset"));
  v12 = v8;
  if (!v8 && *(_QWORD *)(a1 + 56))
  {
    v9 = objc_alloc(MEMORY[0x24BDD1540]);
    v10 = objc_msgSend(v9, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to create CustomAsset entity. Data model may not support this operation."), *MEMORY[0x24BDD0FC8], 0));
    v8 = 0;
    **(_QWORD **)(a1 + 56) = v10;
    *a4 = 1;
  }
  objc_msgSend(v8, "setSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v12, "setCategory:", CFSTR("custom"));
  objc_msgSend(v12, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CustomAsset-%@-%@"), objc_msgSend(a2, "elementName"), objc_msgSend(a2, "partName")));
  objc_msgSend(v12, "setTemplateRenderingMode:", objc_msgSend(*(id *)(a1 + 32), "templateRenderingModeWithIdentifier:", objc_msgSend(a2, "templateRenderingMode")));
  objc_msgSend(v12, "setScaleFactor:", objc_msgSend((id)objc_msgSend(a2, "renditionKey"), "themeScale"));
  objc_msgSend(v12, "setReferenceData:", objc_msgSend(v7, "customAssetReferenceData"));
  v11 = v12;
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:");
    v11 = v12;
  }

}

- (BOOL)createCustomArtworkProductionsForCustomAssets:(id)a3 withImportInfos:(id)a4 error:(id *)a5
{
  uint64_t v8;
  _QWORD v10[7];

  v8 = objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3, a4, a5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__CoreThemeDocument_createCustomArtworkProductionsForCustomAssets_withImportInfos_error___block_invoke;
  v10[3] = &unk_24EF2C308;
  v10[4] = a4;
  v10[5] = self;
  v10[6] = v8;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v10);
  return 1;
}

uint64_t __89__CoreThemeDocument_createCustomArtworkProductionsForCustomAssets_withImportInfos_error___block_invoke(id *a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;

  v4 = (void *)objc_msgSend(a1[4], "objectAtIndexedSubscript:");
  objc_msgSend((id)objc_msgSend(v4, "customAsset"), "customAssetSize");
  v6 = v5;
  v8 = v7;
  v9 = a1[5];
  objc_msgSend(v4, "sliceInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "resizableSliceSize");
  v20 = (void *)objc_msgSend(v9, "slicesComputedForImageSize:usingSliceInsets:resizableSliceSize:withRenditionType:", objc_msgSend(v4, "renditionType"), v6, v8, v11, v13, v15, v17, v18, v19);
  v21 = (id)objc_msgSend(a1[5], "newObjectForEntity:", CFSTR("CustomArtworkProduction"));
  v22 = (void *)objc_msgSend(a1[5], "newObjectForEntity:", CFSTR("RenditionKeySpec"));
  objc_msgSend(v22, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(v4, "renditionKey"), "keyList"), a1[5]);
  objc_msgSend(v21, "setBaseKeySpec:", v22);

  objc_msgSend(v21, "setIsExcludedFromFilter:", *MEMORY[0x24BDBD268]);
  objc_msgSend(v21, "setRenditionType:", objc_msgSend(a1[5], "renditionTypeWithIdentifier:", objc_msgSend(v4, "renditionType")));
  objc_msgSend(v21, "setRenditionSubtype:", objc_msgSend(a1[5], "renditionSubtypeWithIdentifier:", objc_msgSend(v4, "renditionSubtype")));
  objc_msgSend(v21, "setTemplateRenderingMode:", objc_msgSend(a1[5], "templateRenderingModeWithIdentifier:", objc_msgSend(v4, "templateRenderingMode")));
  objc_msgSend(v21, "setOptOutOfThinning:", objc_msgSend(v4, "optOutOfThinning"));
  objc_msgSend(v21, "setComment:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Custom Asset from: %@"), objc_msgSend(a2, "name")));
  if (objc_msgSend(v4, "modificationDate"))
  {
    objc_msgSend(v21, "setDateOfLastChange:", objc_msgSend(v4, "modificationDate"));
    objc_msgSend(v21, "setHasCustomDateOfLastChange:", 1);
  }
  objc_msgSend(a1[6], "addObject:", v21);
  v23 = (id)objc_msgSend(a1[5], "newObjectForEntity:", CFSTR("CustomArtworkRenditionSpec"));
  objc_msgSend(v23, "setAsset:", a2);
  objc_msgSend(v23, "setProduction:", v21);
  objc_msgSend(v4, "alignmentRect");
  objc_msgSend(v23, "setAlignmentRect:");
  if (objc_msgSend(v20, "count"))
    objc_msgSend(v23, "setSlices:", v20);
  objc_msgSend(v23, "resetToBaseKeySpec");
  if (objc_msgSend((id)objc_msgSend(v4, "name"), "length"))
  {
    v24 = (void *)objc_msgSend(a1[5], "namedElementWithName:", objc_msgSend(v4, "name"));
    if (!v24)
    {
      v24 = (void *)objc_msgSend(a1[5], "_createNamedElementWithNextAvailableIdentifier");
      objc_msgSend(v24, "setName:", objc_msgSend(v4, "name"));
    }
    objc_msgSend(v24, "setProduction:", v21);
    objc_msgSend((id)objc_msgSend(v21, "baseKeySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v24, "identifier"), "unsignedIntValue"));
  }
  return objc_msgSend(v23, "resetToBaseKeySpec");
}

- (void)importCustomAssetsWithImportInfos:(id)a3 completionHandler:(id)a4
{
  id v7;
  _QWORD v8[8];

  v7 = -[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", 0);
  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __73__CoreThemeDocument_importCustomAssetsWithImportInfos_completionHandler___block_invoke;
    v8[3] = &unk_24EF2C330;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = v7;
    v8[7] = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);
  }
  else if (a4)
  {
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
}

uint64_t __73__CoreThemeDocument_importCustomAssetsWithImportInfos_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(void);
  uint64_t v7;

  v7 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "undoManager");
  objc_msgSend(v2, "disableUndoRegistration");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_addAssetsFromCustomAssetInfos:bitSource:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v7);
  v4 = objc_msgSend(v3, "count");
  if (v4 == objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "createCustomArtworkProductionsForCustomAssets:withImportInfos:error:", v3, *(_QWORD *)(a1 + 40), &v7);
    objc_msgSend(v2, "enableUndoRegistration");
    result = *(_QWORD *)(a1 + 56);
    if (!result)
      return result;
    v6 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    NSLog(CFSTR("Unable to import custom assets because we couldn't make a database object for each entry for some reason."));
    objc_msgSend(v2, "enableUndoRegistration");
    result = *(_QWORD *)(a1 + 56);
    if (!result)
      return result;
    v6 = *(uint64_t (**)(void))(result + 16);
  }
  return v6();
}

- (id)_genericPartDefinition
{
  id v2;
  id result;

  v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("SchemaPartDefinition"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name = %@ AND element.name = %@"), CFSTR("Push Button"), CFSTR("Push Button")), 0);
  result = (id)objc_msgSend(v2, "count");
  if (result)
    return (id)objc_msgSend(v2, "objectAtIndex:", 0);
  return result;
}

- (id)createElementProductionWithAsset:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[CoreThemeDocument _createPhotoshopElementProductionWithAsset:](self, "_createPhotoshopElementProductionWithAsset:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    NSLog(CFSTR("Creating Productions from unaffiliated PNG files is not supported."));
  return 0;
}

- (id)createAssetWithName:(id)a3 inCategory:(id)a4 forThemeBitSource:(id)a5
{
  return -[CoreThemeDocument createAssetWithName:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:scaleFactor:inCategory:forThemeBitSource:", a3, +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:"), a4, a5);
}

- (id)createAssetWithName:(id)a3 scaleFactor:(unsigned int)a4 inCategory:(id)a5 forThemeBitSource:(id)a6
{
  return -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", a3, objc_msgSend(a3, "pathExtension"), *(_QWORD *)&a4, a5, a6);
}

- (id)createAssetWithName:(id)a3 fileType:(id)a4 scaleFactor:(unsigned int)a5 inCategory:(id)a6 forThemeBitSource:(id)a7
{
  uint64_t v9;
  const __CFString *v13;
  id v14;

  v9 = *(_QWORD *)&a5;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("psd")))
  {
    v13 = CFSTR("PhotoshopAsset");
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("png")))
  {
    v13 = CFSTR("PNGAsset");
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("imagestack")))
  {
    v13 = CFSTR("ImageStackAsset");
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("texture")))
  {
    v13 = CFSTR("TextureAsset");
  }
  else
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("model")))
    {
      NSLog(CFSTR("Unsupported filetype encountered for asset %@"), a3);
      v14 = 0;
      goto LABEL_12;
    }
    v13 = CFSTR("ModelIOAsset");
  }
  v14 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", v13);
LABEL_12:
  objc_msgSend(v14, "setName:", a3);
  objc_msgSend(v14, "setScaleFactor:", v9);
  objc_msgSend(v14, "setCategory:", a6);
  objc_msgSend(v14, "setSource:", a7);
  return v14;
}

- (id)assetAtPath:(id)a3
{
  return -[CoreThemeDocument assetAtFileURL:](self, "assetAtFileURL:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3));
}

- (id)assetAtFileURL:(id)a3
{
  id result;
  BOOL v6;
  id v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v11 = 0;
  v10 = 0;
  -[CoreThemeDocument _getFilename:scaleFactor:category:bitSource:forFileURL:](self, "_getFilename:scaleFactor:category:bitSource:forFileURL:", &v13, &v11, &v12, &v10, a3);
  result = 0;
  if (v13)
    v6 = v11 == 0;
  else
    v6 = 1;
  if (!v6 && v12 != 0 && v10 != 0)
  {
    v9 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("PhotoshopAsset"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name == %@ AND scaleFactor == %u AND category == %@"), v13, v11, v12), 0);
    result = (id)objc_msgSend(v9, "count");
    if (result)
    {
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
        NSLog(CFSTR("WARNING: found multiple assets with path: %@"), objc_msgSend(a3, "path"));
      return (id)objc_msgSend(v9, "objectAtIndex:", 0);
    }
  }
  return result;
}

- (id)addAssetsAtFileURLs:(id)a3
{
  return -[CoreThemeDocument addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:](self, "addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:", a3, 1, 0, 0, 0);
}

- (id)addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4
{
  return -[CoreThemeDocument addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:](self, "addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:", a3, a4, 0, 0, 0);
}

- (id)addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4 referenceFiles:(BOOL)a5 bitSource:(id)a6 customInfos:(id)a7
{
  return -[CoreThemeDocument _addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:sortedCustomInfos:](self, "_addAssetsAtFileURLs:createProductions:referenceFiles:bitSource:customInfos:sortedCustomInfos:", a3, a4, a5, a6, a7, 0);
}

- (id)_addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4 referenceFiles:(BOOL)a5 bitSource:(id)a6 customInfos:(id)a7 sortedCustomInfos:(id *)a8
{
  _BOOL4 v11;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  CoreThemeDocument *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  id v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  int v47;
  BOOL v48;
  CoreThemeDocument *v49;
  uint64_t v50;
  const __CFString *v51;
  id v52;
  uint64_t v53;
  CoreThemeDocument *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  _QWORD v78[19];
  BOOL v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v11 = a5;
  v67 = a4;
  v82 = *MEMORY[0x24BDAC8D0];
  v66 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("Asset"), 0, 0));
  v63 = objc_msgSend(v66, "count");
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v65 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = 0;
  if (v11)
    v15 = (void *)objc_msgSend(a6, "fileURLWithDocument:", self);
  v16 = objc_msgSend(v15, "pathComponents");
  v17 = MEMORY[0x24BDAC760];
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke;
  v78[3] = &unk_24EF2C358;
  v78[4] = a6;
  v78[5] = a7;
  v55 = self;
  v78[6] = self;
  v78[7] = a3;
  v79 = v11;
  v78[8] = v15;
  v78[9] = v16;
  v78[10] = CFSTR("FilePDF");
  v78[11] = CFSTR("AssetName");
  v78[12] = CFSTR("Scale");
  v78[13] = CFSTR("FileScale");
  v78[14] = CFSTR("Category");
  v78[15] = CFSTR("FileBitSource");
  v78[17] = v14;
  v78[18] = a8;
  v78[16] = CFSTR("CustomInfo");
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v78);
  v77[0] = v17;
  v77[1] = 3221225472;
  v77[2] = __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke_2;
  v77[3] = &unk_24EF2C380;
  v77[4] = CFSTR("AssetName");
  v18 = (void *)objc_msgSend(v14, "sortedArrayUsingComparator:", v77);
  v19 = v18;
  if (a8)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v74 != v23)
            objc_enumerationMutation(v19);
          v25 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "objectForKey:", CFSTR("CustomInfo"));
          if (v25)
            objc_msgSend(v20, "addObject:", v25);
        }
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      }
      while (v22);
    }
    *a8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v20);
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v62 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  if (v62)
  {
    v58 = 0;
    v59 = 0;
    v60 = (id)*MEMORY[0x24BDBD430];
    v61 = *(_QWORD *)v70;
    v56 = !v67;
    v26 = self;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v70 != v61)
          objc_enumerationMutation(v19);
        v28 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v27);
        v29 = objc_msgSend(v28, "objectForKey:", CFSTR("AssetName"));
        v30 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", CFSTR("Scale")), "unsignedIntegerValue");
        v31 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", CFSTR("FileScale")), "unsignedIntegerValue");
        v32 = objc_msgSend(v28, "objectForKey:", CFSTR("Category"));
        v33 = objc_msgSend(v28, "objectForKey:", CFSTR("FileBitSource"));
        v34 = objc_msgSend(v28, "objectForKey:", CFSTR("FilePDF"));
        v68 = (void *)objc_msgSend(v28, "objectForKey:", CFSTR("CustomInfo"));
        if (v63)
        {
          if ((_DWORD)v31)
            v35 = v34 == 0;
          else
            v35 = 1;
          if (v35)
          {
            v36 = v30;
            v45 = (void *)objc_msgSend(v66, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name == %@ AND scaleFactor == %u AND category == %@"), v29, v30, v32));
            if (!objc_msgSend(v45, "count")
              || (objc_msgSend(v45, "objectAtIndex:", 0), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (v68)
              {
                v37 = objc_msgSend(v68, "renditionType");
                v38 = CFSTR("imagestack");
                if (v37 != 1002)
                {
                  if (objc_msgSend(v68, "renditionType") == 1018)
                    v38 = CFSTR("imagestack");
                  else
                    v38 = CFSTR("png");
                }
                v39 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](v26, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v29, v38, v36, v32, v33);
                if (objc_msgSend(v68, "renditionType") == 1000 || objc_msgSend(v68, "renditionType") == 1014)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v39, "setRawData:", 1);
                }
              }
              else
              {
                v39 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](v26, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v29, CFSTR("png"), v36, v32, v33);
              }
              goto LABEL_62;
            }
LABEL_41:
            v39 = (id)objc_msgSend(v45, "objectAtIndex:", 0);
          }
          else
          {
            v44 = v30;
            v45 = (void *)objc_msgSend(v66, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name == %@ AND scaleFactor == %u AND category == %@ AND fileScaleFactor == %@"), v29, v30, v32, v31));
            if (objc_msgSend(v45, "count"))
            {
              objc_msgSend(v45, "objectAtIndex:", 0);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_41;
            }
            v39 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](v26, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v29, CFSTR("png"), v44, v32, v33);
            objc_msgSend(v39, "setFileScaleFactor:", v31);
LABEL_62:
            objc_msgSend(v66, "addObject:", v39);
          }
LABEL_63:
          if (!v39)
            return 0;
          goto LABEL_64;
        }
        v57 = v33;
        v64 = v29;
        v40 = v30;
        v41 = 0;
        v42 = 0;
        if (v59)
        {
          v43 = 0;
          if (v58)
          {
            v42 = (void *)objc_msgSend(v59, "objectForKey:", CFSTR("AssetName"));
            v41 = objc_msgSend((id)objc_msgSend(v59, "objectForKey:", CFSTR("Scale")), "unsignedIntegerValue");
            v43 = (void *)objc_msgSend(v59, "objectForKey:", v32);
          }
        }
        else
        {
          v43 = 0;
        }
        v46 = objc_msgSend(v42, "isEqualToString:", v64);
        if (v41 == (_DWORD)v40)
          v47 = v46;
        else
          v47 = 0;
        if ((_DWORD)v31)
          v48 = v34 == 0;
        else
          v48 = 1;
        if (!v48)
        {
          v26 = v55;
          if (v47)
            objc_msgSend(v43, "isEqualToString:", v32);
          v39 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](v55, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v64, CFSTR("png"), v40, v32, v57);
          objc_msgSend(v39, "setFileScaleFactor:", v31);
          v58 = (uint64_t)v39;
          v59 = v28;
          goto LABEL_63;
        }
        v26 = v55;
        if (!v47 || (objc_msgSend(v43, "isEqualToString:", v32) & 1) == 0)
        {
          if (v68)
          {
            if (objc_msgSend(v68, "renditionType") != 1002 && objc_msgSend(v68, "renditionType") != 1018)
            {
              v58 = (uint64_t)v60;
              if (objc_msgSend(v68, "renditionType") != 1004)
              {
                v52 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](v55, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v64, CFSTR("png"), v40, v32, v57);
                v58 = (uint64_t)v52;
                if (objc_msgSend(v68, "renditionType") == 1000 || objc_msgSend(v68, "renditionType") == 1014)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v52, "setRawData:", 1);
                }
              }
              goto LABEL_71;
            }
            v49 = v55;
            v50 = v64;
            v51 = CFSTR("imagestack");
          }
          else
          {
            v49 = v55;
            v50 = v64;
            v51 = CFSTR("png");
          }
          v58 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](v49, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", v50, v51, v40, v32, v57);
        }
LABEL_71:
        v39 = (id)v58;
        if (!v58)
          return 0;
        objc_msgSend(v66, "addObject:", v58);
        v59 = v28;
LABEL_64:
        if (v39 != v60 && ((objc_msgSend(v39, "hasProduction") | v56) & 1) == 0)
          -[CoreThemeDocument createElementProductionWithAsset:](v26, "createElementProductionWithAsset:", v39);
        objc_msgSend(v65, "addObject:", v39);
        ++v27;
      }
      while (v62 != v27);
      v53 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      v62 = v53;
    }
    while (v53);
  }
  return v65;
}

uint64_t __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  void *v6;
  const __CFString **v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t UncommonItemInArrays;
  uint64_t v13;
  uint64_t result;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *PreferredIdentifierForTag;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;

  v5 = *(_QWORD *)(a1 + 32);
  v43 = 0;
  v44 = v5;
  v42 = 0;
  v41 = 1;
  if ((void *)*MEMORY[0x24BDBD430] == a2)
  {
    v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3), "name");
    v6 = 0;
    v42 = CFSTR("PackedAsset");
    v43 = v9;
  }
  else
  {
    v6 = a2;
    if (v5)
      v7 = 0;
    else
      v7 = &v42;
    if (v5)
      v8 = 0;
    else
      v8 = &v44;
    objc_msgSend(*(id *)(a1 + 48), "_getFilename:scaleFactor:category:bitSource:forFileURL:", &v43, &v41, v7, v8, a2);
  }
  v10 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v10 == objc_msgSend(*(id *)(a1 + 56), "count"))
    v41 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3), "scaleFactor");
  if (*(_BYTE *)(a1 + 152) && v6 && *(_QWORD *)(a1 + 64))
  {
    v11 = (void *)objc_msgSend(v6, "pathComponents");
    UncommonItemInArrays = indexOfFirstUncommonItemInArrays(*(void **)(a1 + 72), v11);
    v13 = objc_msgSend(v11, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v11, "count") + ~UncommonItemInArrays);
    result = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v13);
    v42 = (const __CFString *)result;
    if (!result)
      goto LABEL_18;
  }
  else
  {
    result = (uint64_t)v42;
    if (!v42)
LABEL_18:
      v42 = CFSTR("NamedImages");
  }
  if (!v43 || !v44)
    return result;
  objc_msgSend(*(id *)(a1 + 48), "targetPlatform");
  v15 = CUIMaxScaleForTargetPlatform();
  objc_msgSend(*(id *)(a1 + 48), "targetPlatform");
  v16 = CUIMinScaleForTargetPlatform();
  v17 = *(void **)(a1 + 40);
  if (v17 && objc_msgSend(v17, "count") > a3)
  {
    v18 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
    v19 = v18;
    if (v6 && v18)
    {
      if (objc_msgSend(v18, "renditionType") == 1000 && !objc_msgSend(v19, "universalTypeIdentifier"))
      {
        PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], (CFStringRef)objc_msgSend(v6, "pathExtension"), 0);
        objc_msgSend(v19, "setUniversalTypeIdentifier:", PreferredIdentifierForTag);

      }
    }
    else if (!v6)
    {
      goto LABEL_51;
    }
  }
  else
  {
    if (!v6)
      goto LABEL_51;
    v19 = 0;
  }
  if (objc_msgSend(v19, "renditionType") != 1000
    && objc_msgSend(v19, "renditionType") != 1017
    && (!objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF"))
     || !objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG"))))
  {
    v21 = (void *)MEMORY[0x24BDBCEB8];
    v22 = v43;
    v23 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v24 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41);
    v25 = (void *)objc_msgSend(v21, "arrayWithObjects:", v22, v23, v24, v42, v44, *(_QWORD *)(a1 + 80), 0);
    v26 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 80), 0);
    if (*(_QWORD *)(a1 + 144))
    {
      v27 = *(void **)(a1 + 40);
      if (v27)
      {
        if (objc_msgSend(v27, "count") > a3)
        {
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3));
          objc_msgSend(v26, "addObject:", *(_QWORD *)(a1 + 128));
        }
      }
    }
    result = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v25, v26);
    if (result)
      result = objc_msgSend(*(id *)(a1 + 136), "addObject:", result);
    while (v16 <= v15)
    {
      result = objc_msgSend(*(id *)(a1 + 48), "shouldGenerateScale:", v16);
      if ((_DWORD)result)
      {
        v28 = (void *)MEMORY[0x24BDBCEB8];
        v29 = v43;
        v30 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
        v31 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41);
        v32 = (void *)objc_msgSend(v28, "arrayWithObjects:", v29, v30, v31, v42, v44, *(_QWORD *)(a1 + 80), 0);
        v33 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 80), 0);
        if (*(_QWORD *)(a1 + 144))
        {
          v34 = *(void **)(a1 + 40);
          if (v34)
          {
            if (objc_msgSend(v34, "count") > a3)
            {
              objc_msgSend(v32, "addObject:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3));
              objc_msgSend(v33, "addObject:", *(_QWORD *)(a1 + 128));
            }
          }
        }
        result = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v32, v33);
        if (result)
          result = objc_msgSend(*(id *)(a1 + 136), "addObject:", result);
      }
      v16 = (v16 + 1);
    }
    return result;
  }
LABEL_51:
  v35 = (void *)MEMORY[0x24BDBCEB8];
  v36 = v43;
  v37 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41);
  v38 = (void *)objc_msgSend(v35, "arrayWithObjects:", v36, v37, v42, v44, 0);
  v39 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), 0);
  if (*(_QWORD *)(a1 + 144))
  {
    v40 = *(void **)(a1 + 40);
    if (v40)
    {
      if (objc_msgSend(v40, "count") > a3)
      {
        objc_msgSend(v38, "addObject:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3));
        objc_msgSend(v39, "addObject:", *(_QWORD *)(a1 + 128));
      }
    }
  }
  result = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v38, v39);
  if (result)
    return objc_msgSend(*(id *)(a1 + 136), "addObject:", result);
  return result;
}

uint64_t __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32)), "compare:", objc_msgSend(a3, "objectForKey:", *(_QWORD *)(a1 + 32)));
}

- (id)metadatumForKey:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (void *)objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator");
  if (!v6)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 8218, CFSTR("-[CoreThemeDocument metadatumForKey] expects a persistent store coordinator be associated with the operating context."));
  v7 = (void *)objc_msgSend(v6, "persistentStores");
  v8 = v7;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v9 = objc_msgSend(v7, "count");
  if (v9 != 1)
  {
    v10 = v9;
LABEL_7:
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 8223, CFSTR("-[CoreThemeDocument metadatumForKey] expects exactly one persistent store, but got %lu."), v10);
  }
  return (id)objc_msgSend((id)objc_msgSend(v6, "metadataForPersistentStore:", objc_msgSend(v8, "objectAtIndex:", 0)), "objectForKey:", a3);
}

- (void)setMetadatum:(id)a3 forKey:(id)a4
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v8 = objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  if (v8 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 8232, CFSTR("-[CoreThemeDocument setMetadatum:forKey:] must run from main thread."));
  v9 = (void *)objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator");
  v10 = (void *)objc_msgSend(v9, "persistentStores");
  if (objc_msgSend(v10, "count") != 1)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 8236, CFSTR("-[CoreThemeDocument setMetadatum:forKey:] expects exactly one persistent store."));
  v11 = (id)objc_msgSend((id)objc_msgSend(v9, "metadataForPersistentStore:", objc_msgSend(v10, "objectAtIndex:", 0)), "mutableCopy");
  objc_msgSend(v11, "setObject:forKey:", a3, a4);
  v12 = (void *)objc_msgSend(v10, "objectAtIndex:", 0);
  if ((objc_msgSend(v12, "isReadOnly") & 1) == 0)
    objc_msgSend(v9, "setMetadata:forPersistentStore:", v11, v12);
}

- (id)pathToAsset:(id)a3
{
  return (id)objc_msgSend(-[CoreThemeDocument rootPathForProductionData](self, "rootPathForProductionData"), "stringByAppendingPathComponent:", objc_msgSend(a3, "sourceRelativePath"));
}

- (id)rootPathForProductionData
{
  NSString *v3;

  v3 = -[CoreThemeDocument pathToRepresentedDocument](self, "pathToRepresentedDocument");
  if (!v3)
    v3 = -[NSURL path](-[TDPersistentDocument fileURL](self, "fileURL"), "path");
  return -[NSString td_stringByStandardizingPath](-[NSString stringByAppendingPathComponent:](-[NSString stringByDeletingLastPathComponent](v3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", -[CoreThemeDocument relativePathToProductionData](self, "relativePathToProductionData")), "td_stringByStandardizingPath");
}

- (id)relativePathToProductionData
{
  id result;
  __CFString *v4;
  __CFString *v5;

  result = self->_relativePathToProductionData;
  if (!result)
  {
    v4 = -[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("relativePathToProductionData"));
    v5 = CFSTR("./");
    if (v4)
      v5 = v4;
    result = v5;
    self->_relativePathToProductionData = (NSString *)result;
  }
  return result;
}

- (void)setRelativePathToProductionData:(id)a3
{
  NSString *relativePathToProductionData;

  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", a3, CFSTR("relativePathToProductionData"));
  relativePathToProductionData = self->_relativePathToProductionData;
  if (relativePathToProductionData != a3)
  {

    self->_relativePathToProductionData = (NSString *)a3;
  }
}

- (BOOL)isCustomLook
{
  return 0;
}

- (id)renditionsMatchingRenditionKeySpec:(id)a3
{
  return -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("RenditionSpec"), -[CoreThemeDocument _predicateForRenditionKeySpec:](self, "_predicateForRenditionKeySpec:", a3), 0);
}

- (unint64_t)countOfRenditionsMatchingRenditionKeySpec:(id)a3
{
  return -[CoreThemeDocument countForEntity:withPredicate:](self, "countForEntity:withPredicate:", CFSTR("RenditionSpec"), -[CoreThemeDocument _predicateForRenditionKeySpec:](self, "_predicateForRenditionKeySpec:", a3));
}

- (unint64_t)countOfRenditionsMatchingRenditionKeySpecs:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = (void *)objc_msgSend(a3, "objectEnumerator");
  v7 = objc_msgSend(v6, "nextObject");
  if (v7)
  {
    v8 = v7;
    do
    {
      objc_msgSend(v5, "addObject:", -[CoreThemeDocument _predicateForRenditionKeySpec:](self, "_predicateForRenditionKeySpec:", v8));
      v8 = objc_msgSend(v6, "nextObject");
    }
    while (v8);
  }
  v9 = -[CoreThemeDocument countForEntity:withPredicate:](self, "countForEntity:withPredicate:", CFSTR("RenditionSpec"), objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v5));

  return v9;
}

- (NSUUID)uuid
{
  NSUUID *result;

  result = -[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("uuid"));
  if (result)
    return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", result);
  return result;
}

- (void)setUuid:(id)a3
{
  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", objc_msgSend(a3, "UUIDString"), CFSTR("uuid"));
}

- (unsigned)checksum
{
  uLong v5;
  void *v6;
  unint64_t v7;
  uInt v8;

  if (self->_donotstoreDocumentChecksum)
    return 0;
  v5 = crc32(0, 0, 0);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", -[NSURL path](-[TDPersistentDocument fileURL](self, "fileURL"), "path"));
  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (HIDWORD(v7))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 8361, CFSTR("File data will be truncated due to zlib limitations"));
  return crc32(v5, (const Bytef *)objc_msgSend(v6, "bytes"), v8);
}

- (id)artworkFormat
{
  id result;

  result = -[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("artworkFormat"));
  if (!result)
    return (id)CoreThemeArtworkFormatPNG;
  return result;
}

- (void)setArtworkFormat:(id)a3
{
  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", a3, CFSTR("artworkFormat"));
}

+ (id)persistentStringForPlatform:(int64_t)a3
{
  return (id)CUIPlatformNameForPlatform();
}

+ (int64_t)platformForPersistentString:(id)a3
{
  return CUIPlatformForPlatformString();
}

- (void)setTargetPlatform:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *targetPlatform;
  void *v10;

  v5 = CUICurrentPlatform();
  if (v5 == 3)
    v6 = 3;
  else
    v6 = a3;
  if (v5 == 4)
    v7 = 4;
  else
    v7 = v6;
  v8 = objc_msgSend((id)objc_opt_class(), "persistentStringForPlatform:", v7);
  targetPlatform = self->_targetPlatform;
  if ((NSString *)v8 != targetPlatform)
  {
    v10 = (void *)v8;

    self->_targetPlatform = (NSString *)objc_msgSend(v10, "copy");
  }
  -[CoreThemeDocument _updateDeviceTraits](self, "_updateDeviceTraits");
}

- (void)_updateDeviceTraits
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  TDDeviceTraits *v9;
  TDDeviceTraits *v10;
  TDDeviceTraits *v11;
  TDDeviceTraits *v12;
  TDDeviceTraits *v13;
  id v14;

  if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 2
    && -[NSString length](self->_minimumDeploymentVersion, "length")
    && !self->_deviceTraits)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    v4 = MEMORY[0x24BE28D50];
    v5 = (void *)objc_msgSend(v3, "initWithUTF8String:", *(_QWORD *)(MEMORY[0x24BE28D50] + 64));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *(_QWORD *)(v4 + 184));
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *(_QWORD *)(v4 + 160));
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (void *)objc_msgSend(v7, "initWithUTF8String:", *(_QWORD *)(MEMORY[0x24BE28D20] + 16));
    v9 = -[TDDeviceTraits initWithPlatform:]([TDDeviceTraits alloc], "initWithPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform"));
    -[TDDeviceTraits setScale:](v9, "setScale:", 2.0);
    -[TDDeviceTraits setIdiom:](v9, "setIdiom:", v5);
    -[TDDeviceTraits setSubtype:](v9, "setSubtype:", 32401);
    -[TDDeviceTraits setDisplayGamut:](v9, "setDisplayGamut:", v8);
    -[TDDeviceTraits setDeploymentTarget:](v9, "setDeploymentTarget:", -[CoreThemeDocument minimumDeploymentVersion](self, "minimumDeploymentVersion"));
    -[TDDeviceTraits setMemoryPerformanceClass:](v9, "setMemoryPerformanceClass:", 16);
    -[TDDeviceTraits setGraphicsFeatureSetClass:](v9, "setGraphicsFeatureSetClass:", 0);
    -[TDDeviceTraits setGraphicsFeatureSetFallbacks:](v9, "setGraphicsFeatureSetFallbacks:", 0);
    -[TDDeviceTraits setSubtypeFallbackValues:](v9, "setSubtypeFallbackValues:", 0);
    -[CoreThemeDocument addDeviceTraitForOptimization:](self, "addDeviceTraitForOptimization:", v9);

    v10 = -[TDDeviceTraits initWithPlatform:]([TDDeviceTraits alloc], "initWithPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform"));
    -[TDDeviceTraits setScale:](v10, "setScale:", 1.0);
    -[TDDeviceTraits setIdiom:](v10, "setIdiom:", v5);
    -[TDDeviceTraits setSubtype:](v10, "setSubtype:", 32401);
    -[TDDeviceTraits setDisplayGamut:](v10, "setDisplayGamut:", v8);
    -[TDDeviceTraits setDeploymentTarget:](v10, "setDeploymentTarget:", -[CoreThemeDocument minimumDeploymentVersion](self, "minimumDeploymentVersion"));
    -[TDDeviceTraits setMemoryPerformanceClass:](v10, "setMemoryPerformanceClass:", 16);
    -[TDDeviceTraits setGraphicsFeatureSetClass:](v10, "setGraphicsFeatureSetClass:", 0);
    -[TDDeviceTraits setGraphicsFeatureSetFallbacks:](v10, "setGraphicsFeatureSetFallbacks:", 0);
    -[TDDeviceTraits setSubtypeFallbackValues:](v10, "setSubtypeFallbackValues:", 0);
    -[CoreThemeDocument addDeviceTraitForOptimization:](self, "addDeviceTraitForOptimization:", v10);

    v11 = -[TDDeviceTraits initWithPlatform:]([TDDeviceTraits alloc], "initWithPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform"));
    -[TDDeviceTraits setScale:](v11, "setScale:", 1.0);
    -[TDDeviceTraits setIdiom:](v11, "setIdiom:", v14);
    -[TDDeviceTraits setSubtype:](v11, "setSubtype:", 32401);
    -[TDDeviceTraits setDisplayGamut:](v11, "setDisplayGamut:", v8);
    -[TDDeviceTraits setDeploymentTarget:](v11, "setDeploymentTarget:", -[CoreThemeDocument minimumDeploymentVersion](self, "minimumDeploymentVersion"));
    -[TDDeviceTraits setMemoryPerformanceClass:](v11, "setMemoryPerformanceClass:", 16);
    -[TDDeviceTraits setGraphicsFeatureSetClass:](v11, "setGraphicsFeatureSetClass:", 0);
    -[TDDeviceTraits setGraphicsFeatureSetFallbacks:](v11, "setGraphicsFeatureSetFallbacks:", 0);
    -[TDDeviceTraits setSubtypeFallbackValues:](v11, "setSubtypeFallbackValues:", 0);
    -[CoreThemeDocument addDeviceTraitForOptimization:](self, "addDeviceTraitForOptimization:", v11);

    v12 = -[TDDeviceTraits initWithPlatform:]([TDDeviceTraits alloc], "initWithPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform"));
    -[TDDeviceTraits setScale:](v12, "setScale:", 1.0);
    -[TDDeviceTraits setIdiom:](v12, "setIdiom:", v6);
    -[TDDeviceTraits setSubtype:](v12, "setSubtype:", 32401);
    -[TDDeviceTraits setDisplayGamut:](v12, "setDisplayGamut:", v8);
    -[TDDeviceTraits setDeploymentTarget:](v12, "setDeploymentTarget:", -[CoreThemeDocument minimumDeploymentVersion](self, "minimumDeploymentVersion"));
    -[TDDeviceTraits setMemoryPerformanceClass:](v12, "setMemoryPerformanceClass:", 16);
    -[TDDeviceTraits setGraphicsFeatureSetClass:](v12, "setGraphicsFeatureSetClass:", 0);
    -[TDDeviceTraits setGraphicsFeatureSetFallbacks:](v12, "setGraphicsFeatureSetFallbacks:", 0);
    -[TDDeviceTraits setSubtypeFallbackValues:](v12, "setSubtypeFallbackValues:", 0);
    -[CoreThemeDocument addDeviceTraitForOptimization:](self, "addDeviceTraitForOptimization:", v12);

    v13 = -[TDDeviceTraits initWithPlatform:]([TDDeviceTraits alloc], "initWithPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform"));
    -[TDDeviceTraits setScale:](v13, "setScale:", 2.0);
    -[TDDeviceTraits setIdiom:](v13, "setIdiom:", v6);
    -[TDDeviceTraits setSubtype:](v13, "setSubtype:", 0);
    -[TDDeviceTraits setDisplayGamut:](v13, "setDisplayGamut:", v8);
    -[TDDeviceTraits setDeploymentTarget:](v13, "setDeploymentTarget:", -[CoreThemeDocument minimumDeploymentVersion](self, "minimumDeploymentVersion"));
    -[TDDeviceTraits setMemoryPerformanceClass:](v13, "setMemoryPerformanceClass:", 16);
    -[TDDeviceTraits setGraphicsFeatureSetClass:](v13, "setGraphicsFeatureSetClass:", 0);
    -[TDDeviceTraits setGraphicsFeatureSetFallbacks:](v13, "setGraphicsFeatureSetFallbacks:", 0);
    -[TDDeviceTraits setSubtypeFallbackValues:](v13, "setSubtypeFallbackValues:", 0);
    -[CoreThemeDocument addDeviceTraitForOptimization:](self, "addDeviceTraitForOptimization:", v13);

  }
}

- (int64_t)targetPlatform
{
  NSString *targetPlatform;
  void *v4;

  targetPlatform = self->_targetPlatform;
  v4 = (void *)objc_opt_class();
  if (targetPlatform)
    return objc_msgSend(v4, "platformForPersistentString:", self->_targetPlatform);
  else
    return objc_msgSend(v4, "defaultTargetPlatform");
}

+ (int64_t)targetPlatformForMOC:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "persistentStoreCoordinator");
  v4 = (void *)objc_msgSend(v3, "persistentStores");
  if (objc_msgSend(v4, "count"))
    return +[CoreThemeDocument platformForPersistentString:](CoreThemeDocument, "platformForPersistentString:", objc_msgSend((id)objc_msgSend(v3, "metadataForPersistentStore:", objc_msgSend(v4, "objectAtIndex:", 0)), "objectForKey:", CFSTR("targetPlatform")));
  else
    return +[CoreThemeDocument defaultTargetPlatform](CoreThemeDocument, "defaultTargetPlatform");
}

- (BOOL)buildModelError:(id *)a3
{
  TDThemeSchema *v4;

  v4 = -[TDThemeSchema initWithThemeDocument:]([TDThemeSchema alloc], "initWithThemeDocument:", self);
  if (-[TDPersistentDocument fileURL](self, "fileURL"))
    -[TDThemeSchema sanityCheckAndUpdateDocumentIfNecessary](v4, "sanityCheckAndUpdateDocumentIfNecessary");
  else
    -[TDThemeSchema resetThemeConstants](v4, "resetThemeConstants");

  return 1;
}

- (void)resetThemeConstants
{
  TDThemeSchema *v2;

  v2 = -[TDThemeSchema initWithThemeDocument:]([TDThemeSchema alloc], "initWithThemeDocument:", self);
  -[TDThemeSchema resetThemeConstants](v2, "resetThemeConstants");

}

- (void)primeArrayControllers
{
  -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 0);
  -[CoreThemeDocument drawingLayerWithIdentifier:](self, "drawingLayerWithIdentifier:", 0);
  -[CoreThemeDocument valueWithIdentifier:](self, "valueWithIdentifier:", 0);
  -[CoreThemeDocument stateWithIdentifier:](self, "stateWithIdentifier:", 0);
  -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", 0);
  -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", 0);
  -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 0);
  -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 1);
  -[CoreThemeDocument schemaCategoryWithIdentifier:](self, "schemaCategoryWithIdentifier:", 0);
}

+ (int64_t)dataModelVersion
{
  if (dataModelVersion_latestModelOnce != -1)
    dispatch_once(&dataModelVersion_latestModelOnce, &__block_literal_global_691);
  return dataModelVersion_latestModel;
}

uint64_t __37__CoreThemeDocument_dataModelVersion__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreThemeDefinition")), "URLsForResourcesWithExtension:subdirectory:", CFSTR("mom"), 0);
  v3[0] = objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("path"), 0);
  v1 = (void *)objc_msgSend((id)objc_msgSend(v0, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1)), "firstObject");
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "lastPathComponent"), "stringByReplacingOccurrencesOfString:withString:", objc_msgSend(CFSTR("."), "stringByAppendingString:", objc_msgSend(v1, "pathExtension")), &stru_24EF2D4A8), "stringByReplacingOccurrencesOfString:withString:", CFSTR("CoreThemeDefinition"), &stru_24EF2D4A8), "integerValue");
  dataModelVersion_latestModel = result;
  return result;
}

+ (id)dataModelNameForVersion:(int64_t)a3
{
  if (a3 < 1)
    return CFSTR("CoreThemeDefinition");
  else
    return (id)objc_msgSend(CFSTR("CoreThemeDefinition"), "stringByAppendingString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a3));
}

+ (void)presentMigrationProgress
{
  NSLog(CFSTR("Migrating data..."), a2);
}

+ (void)closeMigrationProgress
{
  NSLog(CFSTR("Done migrating data."), a2);
}

- (BOOL)didMigrate
{
  return self->m_didMigrate;
}

+ (BOOL)defaultAllowsExtendedRangePixelFormats
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "valueForKey:", CFSTR("AllowsExtendedRange"));
  if (v2)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 1;
}

- (BOOL)allowsExtendedRangePixelFormats
{
  return objc_msgSend(-[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("CoreThemeDocumentAllowsExtendedRangeKey")), "BOOLValue");
}

- (void)setAllowsExtendedRangePixelFormats:(BOOL)a3
{
  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("CoreThemeDocumentAllowsExtendedRangeKey"));
}

+ (unint64_t)standardColorSpaceID
{
  return 1;
}

- (unint64_t)colorSpaceID
{
  return objc_msgSend(-[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("NSCoreThemeDefinitionColorSpaceKey")), "unsignedIntegerValue");
}

+ (int)shouldConvertColorsFromColorSpaceWithIdentifier:(unint64_t)a3 toIdentifier:(unint64_t)a4 error:(id *)a5
{
  if (a3 > a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CoreThemeDocument.m"), 8747, CFSTR("Unexpected color conversion inquiry. Old version: %ld, New version: %ld"), a3, a4);
  return 1;
}

- (void)convertColorsFromColorSpaceWithIdentifier:(unint64_t)a3 toIdentifier:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int v12;
  int8x8_t v13;
  int64x2_t v14;
  int8x8_t v15;
  float64x2_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("ColorDefinition"), 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v16 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend((id)objc_msgSend(v11, "valueForKey:", CFSTR("physicalColor"), *(_OWORD *)&v16), "unsignedIntValue");
        v13 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v12), (uint32x2_t)0xFFFFFFF0FFFFFFF8), (int8x8_t)0xFF000000FFLL);
        v14.i64[0] = v13.u32[0];
        v14.i64[1] = v13.u32[1];
        v15 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(vrndxq_f64(vmulq_f64(vdivq_f64(vcvtq_f64_s64(v14), v16), v16)))), (uint32x2_t)0x1000000008), (int8x8_t)0xFF00000000FF00);
        objc_msgSend(v11, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", rint((double)v12 / 255.0 * 255.0) | (rint((double)HIBYTE(v12) / 255.0 * 255.0) << 24) | v15.i32[0] | v15.i32[1]), CFSTR("physicalColor"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4), CFSTR("NSCoreThemeDefinitionColorSpaceKey"));
}

- (BOOL)_canremoveKeyAttribte:(unsigned __int16)a3
{
  unint64_t v4;
  unint64_t v5;
  int v6;

  if (a3 == 12)
    return 0;
  v4 = 0;
  do
  {
    v5 = v4;
    if (v4 == 9)
      break;
    v6 = dword_226EC0904[++v4];
  }
  while (v6 != a3);
  return v5 > 8;
}

- (void)_updateKeyFormatWithContext:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v21;
  uint64_t v22;

  v22 = 0;
  v4 = objc_msgSend(-[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:withContext:error:](self, "objectsForEntity:withPredicate:sortDescriptors:withContext:error:", CFSTR("RenditionKeySpec"), 0, 0), "count");
  v21 = (void *)objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("RenditionKeySpec"), -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  v5 = objc_msgSend(&unk_24EF40A40, "count");
  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(&unk_24EF40A40, "objectAtIndex:", v6);
      v8 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("RenditionKeySpec"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K.identifier == 0"), v7), 0);
      v9 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("RenditionKeySpec"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == NULL"), v7), 0);
      v22 = 0;
      v10 = objc_msgSend(v8, "count");
      if (objc_msgSend(v9, "count") + v10 == v4
        && -[CoreThemeDocument _canremoveKeyAttribte:](self, "_canremoveKeyAttribte:", word_226EC092C[2 * v6]))
      {
        CUIRenditionKeyFormatRemoveAttribute();
      }
      ++v6;
    }
    while (v5 != v6);
  }
  v11 = objc_msgSend(&unk_24EF40A58, "count");
  if (v11)
  {
    v12 = 0;
    do
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("RenditionKeySpec"));
      v14 = objc_msgSend(&unk_24EF40A58, "objectAtIndex:", v12);
      v15 = objc_msgSend((id)objc_msgSend(v21, "attributesByName"), "objectForKey:", v14);
      v16 = objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", v14);
      v17 = objc_msgSend(MEMORY[0x24BDD1548], "expressionForFunction:arguments:", CFSTR("count:"), objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v16));
      v18 = objc_alloc_init(MEMORY[0x24BDBB660]);
      objc_msgSend(v18, "setName:", CFSTR("count"));
      objc_msgSend(v18, "setExpression:", v17);
      objc_msgSend(v18, "setExpressionResultType:", 200);
      objc_msgSend(v13, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v15, v18, 0));
      objc_msgSend(v13, "setPropertiesToGroupBy:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v15));
      objc_msgSend(v13, "setResultType:", 2);

      v22 = 0;
      v19 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", v13, &v22);
      if (objc_msgSend(v19, "count") == 1
        && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "firstObject"), "objectForKey:", v14), "integerValue"))
      {
        if (-[CoreThemeDocument _canremoveKeyAttribte:](self, "_canremoveKeyAttribte:", (unsigned __int16)*(_DWORD *)&word_226EC092C[2 * v12]))
        {
          CUIRenditionKeyFormatRemoveAttribute();
        }
      }
      ++v12;
    }
    while (v11 != v12);
  }
}

- (const)untrimmedRenditionKeyFormat
{
  -[CoreThemeDocument renditionKeySemantics](self, "renditionKeySemantics");
  return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat();
}

- (const)renditionKeyFormat
{
  const _renditionkeyfmt *result;
  const _renditionkeyfmt *v4;
  _renditionkeyfmt *v5;
  unint64_t var2;
  unint64_t i;
  void *v8;
  _QWORD v9[6];

  result = self->_keyFormat;
  if (!result)
  {
    v4 = -[CoreThemeDocument untrimmedRenditionKeyFormat](self, "untrimmedRenditionKeyFormat");
    v5 = (_renditionkeyfmt *)malloc_type_malloc(4 * v4->var2 + 12, 0x12A1DFBEuLL);
    self->_keyFormat = v5;
    v5->var0 = v4->var0;
    v5->var1 = v4->var1;
    var2 = v4->var2;
    v5->var2 = var2;
    if ((_DWORD)var2)
    {
      for (i = 0; i < var2; ++i)
        v5->var3[i] = v4->var3[i];
    }
    v8 = (void *)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__CoreThemeDocument_renditionKeyFormat__block_invoke;
    v9[3] = &unk_24EF2C3D0;
    v9[4] = self;
    v9[5] = v8;
    objc_msgSend(v8, "performBlockAndWait:", v9);
    return self->_keyFormat;
  }
  return result;
}

uint64_t __39__CoreThemeDocument_renditionKeyFormat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateKeyFormatWithContext:", *(_QWORD *)(a1 + 40));
}

- (int)renditionKeySemantics
{
  int64_t v2;

  v2 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
  if ((unint64_t)(v2 - 1) > 4)
    return 1;
  else
    return dword_226EC0990[v2 - 1];
}

- (int64_t)renditionKeySpecAttributeCount
{
  return -[CoreThemeDocument renditionKeyFormat](self, "renditionKeyFormat")[8];
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  return -[CoreThemeDocument renditionKeySemantics](self, "renditionKeySemantics") == 1;
}

- (id)customizedSchemaElementDefinitions
{
  return -[CoreThemeDocument _customizedSchemaDefinitionsForEntity:](self, "_customizedSchemaDefinitionsForEntity:", CFSTR("SchemaElementDefinition"));
}

- (id)customizedSchemaEffectDefinitions
{
  return -[CoreThemeDocument _customizedSchemaDefinitionsForEntity:](self, "_customizedSchemaDefinitionsForEntity:", CFSTR("SchemaEffectDefinition"));
}

- (id)customizedSchemaMaterialDefinitions
{
  return -[CoreThemeDocument _customizedSchemaDefinitionsForEntity:](self, "_customizedSchemaDefinitionsForEntity:", CFSTR("SchemaMaterialDefinition"));
}

- (id)_customizedSchemaDefinitionsForEntity:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v8 = 0;
  v4 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self, "objectsForEntity:withPredicate:sortDescriptors:error:", a3, objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1), 0, &v8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__CoreThemeDocument__customizedSchemaDefinitionsForEntity___block_invoke;
  v7[3] = &unk_24EF2C3F8;
  v7[4] = self;
  v5 = objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v7));
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
}

uint64_t __59__CoreThemeDocument__customizedSchemaDefinitionsForEntity___block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "customizationExistsForSchemaDefinition:", a2);
  return v3 & (objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("Named Asset")) ^ 1);
}

- (BOOL)customizationExistsForSchemaDefinition:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(a3, "parts");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "productions"), "count"))
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (void)removeCustomizationForSchemaDefinition:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(a3, "parts");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[CoreThemeDocument deleteProductions:shouldDeleteAssetFiles:](self, "deleteProductions:shouldDeleteAssetFiles:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "productions"), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (BOOL)customizeSchemaElementDefinition:(id)a3 usingArtworkFormat:(id)a4 shouldReplaceExisting:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  if (-[CoreThemeDocument allowMultipleInstancesOfElementID:](self, "allowMultipleInstancesOfElementID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "parts"), "anyObject"), "elementID")))
  {
    v11 = -[CoreThemeDocument _createNamedElementWithNextAvailableIdentifier](self, "_createNamedElementWithNextAvailableIdentifier");
    objc_msgSend(v11, "setName:", CFSTR("New Structured Image"));
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_msgSend(a3, "parts");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
LABEL_6:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v15)
        objc_enumerationMutation(v12);
      v17 = -[CoreThemeDocument customizeSchemaPartDefinition:usingArtworkFormat:nameElement:shouldReplaceExisting:error:](self, "customizeSchemaPartDefinition:usingArtworkFormat:nameElement:shouldReplaceExisting:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), a4, v11, v7, a6);
      if (!v17)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v14)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v17) = 1;
  }
  return v17;
}

- (BOOL)customizeSchemaEffectDefinition:(id)a3 shouldReplaceExisting:(BOOL)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL result;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(a3, "parts");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        if (!-[CoreThemeDocument createEffectStyleProductionForPartDefinition:](self, "createEffectStyleProductionForPartDefinition:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12)))
        {
          if (!a5)
            return 0;
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create production for effect definition: %@"), objc_msgSend(a3, "name"));
          v15 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x24BDD0FC8], 0));
          result = 0;
          *a5 = v15;
          return result;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  return 1;
}

- (BOOL)customizeSchemaMaterialDefinition:(id)a3 shouldReplaceExisting:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(a3, "parts");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = -[CoreThemeDocument customizeSchemaPartDefinition:usingArtworkFormat:nameElement:shouldReplaceExisting:error:](self, "customizeSchemaPartDefinition:usingArtworkFormat:nameElement:shouldReplaceExisting:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), CoreThemeArtworkFormatCAAR, 0, v6, a5);
      if (!v13)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)customizeSchemaPartDefinition:(id)a3 usingArtworkFormat:(id)a4 nameElement:(id)a5 shouldReplaceExisting:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v7 = a6;
  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_msgSend(a3, "renditionGroups");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(obj);
      v16 = -[CoreThemeDocument createProductionWithRenditionGroup:forPartDefinition:artworkFormat:nameElement:shouldReplaceExisting:error:](self, "createProductionWithRenditionGroup:forPartDefinition:artworkFormat:nameElement:shouldReplaceExisting:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15), a3, a4, a5, v7, a7);
      if (!v16)
        break;
      if (a5)
      {
        v17 = v16;
        objc_msgSend((id)objc_msgSend(v16, "baseKeySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(a5, "identifier"), "unsignedIntValue"));
        objc_msgSend(a5, "setProduction:", v17);
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    LOBYTE(v16) = 1;
  }
  return (char)v16;
}

- (id)schemaDefinitionWithElementID:(int64_t)a3
{
  id v4;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("SchemaPartDefinition"), 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "elementID") == a3
          && objc_msgSend((id)objc_msgSend(v9, "element"), "published"))
        {
          return (id)objc_msgSend(v9, "element");
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)schemaPartDefinitionWithElementID:(int64_t)a3 partID:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("SchemaPartDefinition"), 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (objc_msgSend(v11, "elementID") == a3
      && objc_msgSend(v11, "partID") == a4
      && (objc_msgSend((id)objc_msgSend(v11, "element"), "published") & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)namedArtworkProductions
{
  id v2;

  v2 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("NamedArtworkProduction"), 0);
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v2);
}

- (id)namedEffectProductions
{
  id v2;

  v2 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("NamedEffectProduction"), 0);
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v2);
}

- (void)exportCursorsToURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  id obj;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  obj = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("CursorFacetDefinition"), 0);
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(obj, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v8 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend(v7, "valueForKey:", CFSTR("facetName")), CFSTR("facetName"), objc_msgSend(v7, "valueForKey:", CFSTR("hotSpotX")), CFSTR("hotSpotX"), objc_msgSend(v7, "valueForKey:", CFSTR("hotSpotY")), CFSTR("hotSpotY"), 0);
        objc_msgSend(v11, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend((id)objc_msgSend(v7, "keySpec"), "dimension1")));
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  v12 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v11, 100, 200, &v12), "writeToURL:atomically:", a3, 1);
}

- (void)importCursorsFromURL:(id)a3 getUnusedImportedCursors:(id *)a4 getUnupdatedCursors:(id *)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v26;
  uint64_t v27;

  v6 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", a3);
  v26 = 0;
  v27 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, &v26, &v27);
  v8 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("CursorFacetDefinition"), 0);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_msgSend(v8, "objectEnumerator");
  v11 = objc_msgSend(v10, "nextObject");
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      objc_msgSend(v9, "setObject:forKey:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend((id)objc_msgSend(v12, "keySpec"), "dimension1")));
      v12 = (void *)objc_msgSend(v10, "nextObject");
    }
    while (v12);
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_msgSend(v7, "keyEnumerator");
  v15 = objc_msgSend(v14, "nextObject");
  if (v15)
  {
    v16 = v15;
    do
    {
      v17 = (void *)objc_msgSend(v7, "objectForKey:", v16);
      v18 = (void *)objc_msgSend(v9, "objectForKey:", v16);
      if (v18)
      {
        v19 = v18;
        objc_msgSend(v18, "setValue:forKey:", objc_msgSend(v17, "objectForKey:", CFSTR("facetName")), CFSTR("facetName"));
        objc_msgSend(v19, "setValue:forKey:", objc_msgSend(v17, "objectForKey:", CFSTR("hotSpotX")), CFSTR("hotSpotX"));
        objc_msgSend(v19, "setValue:forKey:", objc_msgSend(v17, "objectForKey:", CFSTR("hotSpotY")), CFSTR("hotSpotY"));
      }
      else
      {
        objc_msgSend(v13, "setObject:forKey:", v17, v16);
      }
      v16 = objc_msgSend(v14, "nextObject");
    }
    while (v16);
  }
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v13);
  if (a5)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v21 = (void *)objc_msgSend(v9, "keyEnumerator");
    v22 = objc_msgSend(v21, "nextObject");
    if (v22)
    {
      v23 = v22;
      do
      {
        if (!objc_msgSend(v7, "objectForKey:", v23))
          objc_msgSend(v20, "addObject:", objc_msgSend(v9, "objectForKey:", v23));
        v23 = objc_msgSend(v21, "nextObject");
      }
      while (v23);
    }
    *a5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v20);
  }
}

- (TDCatalogGlobals)catalogGlobals
{
  TDCatalogGlobals *catalogGlobals;
  id v5;
  unint64_t v6;
  BOOL v7;
  TDCatalogGlobals *v8;
  uint64_t v10;

  catalogGlobals = self->_catalogGlobals;
  if (!catalogGlobals)
  {
    v10 = 0;
    v5 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("CatalogGlobals"), 0, &v10);
    v6 = objc_msgSend(v5, "count");
    if (v10)
      v7 = 1;
    else
      v7 = v6 == 0;
    if (v7)
    {
      v8 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("CatalogGlobals"));
    }
    else
    {
      if (v6 >= 2)
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 9282, CFSTR("More than one CatalogGlobals entity"));
      v8 = (TDCatalogGlobals *)(id)objc_msgSend(v5, "firstObject");
    }
    catalogGlobals = v8;
    -[CoreThemeDocument willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("catalogGlobals"));
    self->_catalogGlobals = catalogGlobals;
    -[CoreThemeDocument didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("catalogGlobals"));
  }
  return catalogGlobals;
}

- (id)persistentStoreTypeForFileType:(id)a3
{
  void *v6;

  v6 = (void *)objc_msgSend(a3, "lowercaseString");
  if ((objc_msgSend(v6, "isEqualToString:", CoreThemeDocumentFileType) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(a3, "lowercaseString"), "isEqualToString:", CFSTR("tdd")) & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument.m"), 9299, CFSTR("Only valid file type is uicatalog"));
  }
  return (id)*MEMORY[0x24BDBB580];
}

- (id)updatedVersionsMetadataFromMetadata:(id)a3
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v14;
  void *v15;
  NSString *targetPlatform;
  id v17;

  v5 = CUIThemeInfoVersion();
  v6 = +[CoreThemeDocument dataModelVersion](CoreThemeDocument, "dataModelVersion");
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform")), "schemaVersion");
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("uuid"));
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("CoreThemeInfoVersion")), "integerValue");
  v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("CoreThemeDefinitionDataModelKey")), "integerValue");
  v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("CoreThemeSchemaVersion")), "integerValue");
  v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("targetPlatform")), "isEqualToString:", self->_targetPlatform);
  if (v8 && v9 == v5 && v10 == v6 && v11 == v7 && v12)
    return 0;
  if (a3)
    v14 = (void *)objc_msgSend(a3, "mutableCopy");
  else
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  v15 = v14;
  objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5), CFSTR("CoreThemeInfoVersion"));
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6), CFSTR("CoreThemeDefinitionDataModelKey"));
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7), CFSTR("CoreThemeSchemaVersion"));
  targetPlatform = self->_targetPlatform;
  if (targetPlatform)
    objc_msgSend(v15, "setObject:forKey:", targetPlatform, CFSTR("targetPlatform"));
  if (!v8)
  {
    v17 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v15, "setObject:forKey:", objc_msgSend(v17, "UUIDString"), CFSTR("uuid"));

  }
  return v15;
}

- (BOOL)configurePersistentStoreCoordinatorForURL:(id)a3 ofType:(id)a4 modelConfiguration:(id)a5 storeOptions:(id)a6 error:(id *)a7
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v12 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a6);
  v13 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDBB488]);
  v14 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDBB420]);
  v21.receiver = self;
  v21.super_class = (Class)CoreThemeDocument;
  v15 = -[TDPersistentDocument configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:](&v21, sel_configurePersistentStoreCoordinatorForURL_ofType_modelConfiguration_storeOptions_error_, a3, a4, a5, v12, a7);
  v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC"), "persistentStoreCoordinator"), "persistentStoreForURL:", a3);
  v17 = (void *)objc_msgSend(v16, "metadata");
  v18 = v17;
  if (self->_updateVersionMetadataState == 1 || !objc_msgSend(v17, "objectForKey:", CFSTR("uuid")))
  {
    v19 = -[CoreThemeDocument updatedVersionsMetadataFromMetadata:](self, "updatedVersionsMetadataFromMetadata:", v18);
    if (v19)
      objc_msgSend(v16, "setMetadata:", v19);
    self->_updateVersionMetadataState = 2;
  }
  return v15;
}

- (BOOL)checkCompatibilityOfDocumentAtURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  BOOL result;
  void *v22;
  __CFString *v23;

  v7 = -[CoreThemeDocument persistentStoreTypeForFileType:](self, "persistentStoreTypeForFileType:", a4);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBB738], "metadataForPersistentStoreOfType:URL:options:error:", v7, a3, 0, a5);
  if (!v8)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = CoreThemeDefinitionErrorDomain[0];
      v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Theme definition document is not compatible with this software"), *MEMORY[0x24BDD0FD8], CFSTR("Unrecognized format, missing document metadata"), *MEMORY[0x24BDD0FF0], 0);
LABEL_10:
      v16 = v13;
      v17 = v11;
      v18 = v12;
      v19 = 1;
LABEL_11:
      v20 = (void *)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16);
      result = 0;
      *a5 = v20;
      return result;
    }
    return 0;
  }
  v9 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("CoreThemeDefinitionDataModelKey"));
  if (v9)
    v10 = objc_msgSend(v9, "integerValue");
  else
    v10 = 0;
  v14 = +[CoreThemeDocument dataModelVersion](CoreThemeDocument, "dataModelVersion");
  if (v14 < v10)
  {
    if (a5)
    {
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The theme definition document / UI catalog is too new for this code. You are trying to open a document that is version %ld and this code can only handle up to version %ld"), v10, v14);
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = CoreThemeDefinitionErrorDomain[0];
      v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x24BDD0FD8], CFSTR("Update your CoreThemeDefinition framework and try again."), *MEMORY[0x24BDD0FF0], 0);
      goto LABEL_10;
    }
    return 0;
  }
  if (v10 <= 22)
  {
    if (a5)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = CoreThemeDefinitionErrorDomain[0];
      v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Theme definition document format is in an older format (<23)."), *MEMORY[0x24BDD0FD8], CFSTR("You need to migrate the document to open it."), *MEMORY[0x24BDD0FF0], 0);
      v17 = v22;
      v18 = v23;
      v19 = 101;
      goto LABEL_11;
    }
    return 0;
  }
  return 1;
}

- (BOOL)readFromURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSString *v13;
  objc_super v15;

  v9 = objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a5);
  if (v9)
  {
    v9 = -[CoreThemeDocument checkCompatibilityOfDocumentAtURL:ofType:error:](self, "checkCompatibilityOfDocumentAtURL:ofType:error:", a3, a4, a5);
    if (v9)
    {
      v15.receiver = self;
      v15.super_class = (Class)CoreThemeDocument;
      v9 = -[TDPersistentDocument readFromURL:ofType:error:](&v15, sel_readFromURL_ofType_error_, a3, a4, a5);
      if (v9)
      {
        v10 = -[CoreThemeDocument colorSpaceID](self, "colorSpaceID");
        v11 = +[CoreThemeDocument standardColorSpaceID](CoreThemeDocument, "standardColorSpaceID");
        if (v11 > v10)
        {
          v12 = v11;
          v9 = objc_msgSend((id)objc_opt_class(), "shouldConvertColorsFromColorSpaceWithIdentifier:toIdentifier:error:", v10, v11, a5);
          if (!v9)
            return v9;
          -[CoreThemeDocument convertColorsFromColorSpaceWithIdentifier:toIdentifier:](self, "convertColorsFromColorSpaceWithIdentifier:toIdentifier:", v10, v12);
          objc_msgSend((id)objc_opt_class(), "doneWithColorConversion");
        }

        v13 = (NSString *)objc_msgSend(-[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("targetPlatform")), "copy");
        self->_targetPlatform = v13;
        if (!v13)
          -[CoreThemeDocument setTargetPlatform:](self, "setTargetPlatform:", objc_msgSend((id)objc_opt_class(), "defaultTargetPlatform"));
        LOBYTE(v9) = 1;
      }
    }
  }
  return v9;
}

- (void)_synchronousSave
{
  -[TDPersistentDocument saveDocument:](self, "saveDocument:", 0);
}

- (void)_configureAfterFirstSave
{
  id v3;
  uint64_t v4;

  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[CoreThemeDocument standardColorSpaceID](CoreThemeDocument, "standardColorSpaceID")), CFSTR("NSCoreThemeDefinitionColorSpaceKey"));
  v3 = -[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", CFSTR("artworkFormat"));
  if (v3)
    v4 = (uint64_t)v3;
  else
    v4 = CoreThemeArtworkFormatPNG;
  -[CoreThemeDocument setArtworkFormat:](self, "setArtworkFormat:", v4);
  -[CoreThemeDocument setAllowsExtendedRangePixelFormats:](self, "setAllowsExtendedRangePixelFormats:", +[CoreThemeDocument defaultAllowsExtendedRangePixelFormats](CoreThemeDocument, "defaultAllowsExtendedRangePixelFormats"));
  -[CoreThemeDocument setRelativePathToProductionData:](self, "setRelativePathToProductionData:", CFSTR("./"));
  -[CoreThemeDocument addThemeBitSourceAtPath:createProductions:](self, "addThemeBitSourceAtPath:createProductions:", objc_msgSend((id)objc_opt_class(), "defaultThemeBitSourceURLForDocumentURL:", -[TDPersistentDocument fileURL](self, "fileURL")), 0);
  -[CoreThemeDocument _synchronousSave](self, "_synchronousSave");
}

+ (id)defaultThemeBitSourceURLForDocumentURL:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent"), "stringByDeletingPathExtension");
  if (-[__CFString length](v4, "length"))
    v5 = v4;
  else
    v5 = CFSTR("Aqua");
  return (id)objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("-Artwork")));
}

- (NSURL)themeBitSourceURL
{
  uint64_t v3;
  NSURL *v4;
  NSURL *v5;
  uint64_t v7;

  v7 = 0;
  v3 = objc_msgSend(-[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", &v7), "path");
  v4 = (NSURL *)objc_msgSend((id)objc_opt_class(), "defaultThemeBitSourceURLForDocumentURL:", -[TDPersistentDocument fileURL](self, "fileURL"));
  v5 = v4;
  if (v3 && !-[NSString isEqualToString:](-[NSURL lastPathComponent](v4, "lastPathComponent"), "isEqualToString:", v3))
    return -[NSURL URLByAppendingPathComponent:](-[NSURL URLByDeletingLastPathComponent](v5, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", v3);
  return v5;
}

- (id)themeBitSourceFolderName
{
  return (id)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", 0), "path"), "lastPathComponent");
}

- (BOOL)renameThemeBitSourceFolderTo:(id)a3 error:(id *)a4
{
  char v7;
  int v8;
  NSURL *v9;
  NSURL *v10;

  v7 = objc_msgSend(a3, "isEqualToString:", -[CoreThemeDocument themeBitSourceFolderName](self, "themeBitSourceFolderName"));
  LOBYTE(v8) = 1;
  if (a3)
  {
    if ((v7 & 1) == 0)
    {
      v9 = -[CoreThemeDocument themeBitSourceURL](self, "themeBitSourceURL");
      v10 = -[NSURL URLByAppendingPathComponent:](-[NSURL URLByDeletingLastPathComponent](v9, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", a3);
      if (-[NSURL checkResourceIsReachableAndReturnError:](v10, "checkResourceIsReachableAndReturnError:", 0)
        || (v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "moveItemAtURL:toURL:error:", v9, v10, a4)) != 0)
      {
        objc_msgSend(-[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", 0), "setPath:", a3);
        LOBYTE(v8) = 1;
      }
    }
  }
  return v8;
}

- (void)addThemeBitSourceAtPath:(id)a3 createProductions:(BOOL)a4
{
  uint64_t v5;
  TDThemeBitSource *v6;

  v5 = objc_msgSend(a3, "lastPathComponent");
  v6 = -[TDThemeBitSource initWithEntity:insertIntoManagedObjectContext:]([TDThemeBitSource alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeBitSource")), -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  -[TDThemeBitSource setPath:](v6, "setPath:", v5);

}

- (void)addThemeBitSourceAtPath:(id)a3
{
  -[CoreThemeDocument addThemeBitSourceAtPath:createProductions:](self, "addThemeBitSourceAtPath:createProductions:", a3, 0);
}

- (void)_removeRedundantPDFBasedRenditionsForAssets:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v10, "renditions"), "allObjects"));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[CoreThemeDocument _removeRedundantPDFBasedRenditions:](self, "_removeRedundantPDFBasedRenditions:", v5);

}

- (void)_removeRedundantPDFBasedRenditions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t k;
  void *v19;
  void *v20;
  int v21;
  uint64_t m;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id obj;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v47 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v74 != v7)
          objc_enumerationMutation(a3);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "keySpec");
        v10 = objc_msgSend(v9, "key");
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v10, 4 * CUIRenditionKeyTokenCount());
        if (objc_msgSend(v47, "containsObject:", v11))
        {
          v12 = objc_msgSend(-[CoreThemeDocument renditionsMatchingRenditionKeySpec:](self, "renditionsMatchingRenditionKeySpec:", v9), "sortedArrayUsingComparator:", &__block_literal_global_788);
          v13 = obj;
        }
        else
        {
          v13 = v47;
          v12 = (uint64_t)v11;
        }
        objc_msgSend(v13, "addObject:", v12);

      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v6);
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v48)
  {
    v46 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v70 != v46)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
        v16 = objc_msgSend(v15, "count");
        v51 = objc_alloc_init(MEMORY[0x24BDD1698]);
        v17 = objc_alloc_init(MEMORY[0x24BDD1698]);
        v50 = objc_alloc_init(MEMORY[0x24BDD1698]);
        v52 = objc_alloc_init(MEMORY[0x24BDD1698]);
        if (v16)
        {
          for (k = 0; k != v16; ++k)
          {
            v19 = (void *)objc_msgSend(v15, "objectAtIndex:", k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "keySpec"), "part"), "identifier") != 59)
            {
              v20 = (void *)objc_msgSend(v19, "asset");
              if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "name"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF"))|| !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "name"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG")))
              {
                objc_msgSend(v17, "addIndex:", k);
              }
              if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "name"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("PNG")))objc_msgSend(v51, "addIndex:", k);
              v21 = objc_msgSend(v20, "fileScaleFactor");
              if (v21 == objc_msgSend((id)objc_msgSend(v19, "keySpec"), "scaleFactor"))
                objc_msgSend(v52, "addIndex:", k);
            }
          }
          for (m = 0; m != v16; ++m)
          {
            v23 = (void *)objc_msgSend(v15, "objectAtIndex:", m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = (void *)objc_msgSend(v23, "asset");
              if (objc_msgSend((id)objc_msgSend(v23, "keySpec"), "scaleFactor"))
              {
                v25 = objc_msgSend(v24, "fileScaleFactor");
                if (v25 != objc_msgSend((id)objc_msgSend(v23, "keySpec"), "scaleFactor")
                  && (!objc_msgSend(v24, "fileScaleFactor")
                   || HIDWORD(div(objc_msgSend((id)objc_msgSend(v23, "keySpec"), "scaleFactor"), objc_msgSend(v24, "fileScaleFactor")).quot)|| objc_msgSend(v52, "count")))
                {
                  objc_msgSend(v50, "addIndex:", m);
                }
              }
            }
          }
        }
        if (objc_msgSend(v51, "count") && objc_msgSend(v17, "count"))
        {
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v26 = (void *)objc_msgSend(v15, "objectsAtIndexes:", v17);
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v66;
            do
            {
              for (n = 0; n != v28; ++n)
              {
                if (*(_QWORD *)v66 != v29)
                  objc_enumerationMutation(v26);
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * n), "asset"), *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * n));
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
            }
            while (v28);
          }
        }
        else if (objc_msgSend(v52, "count") && objc_msgSend(v50, "count"))
        {
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v31 = (void *)objc_msgSend(v15, "objectsAtIndexes:", v50);
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v62;
            do
            {
              for (ii = 0; ii != v33; ++ii)
              {
                if (*(_QWORD *)v62 != v34)
                  objc_enumerationMutation(v31);
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * ii), "asset"), *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ii));
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
            }
            while (v33);
          }
        }
        else if (objc_msgSend(v50, "count") == v16 - 1)
        {
          v59 = 0uLL;
          v60 = 0uLL;
          v57 = 0uLL;
          v58 = 0uLL;
          v36 = (void *)objc_msgSend(v15, "objectsAtIndexes:", v50);
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v58;
            do
            {
              for (jj = 0; jj != v38; ++jj)
              {
                if (*(_QWORD *)v58 != v39)
                  objc_enumerationMutation(v36);
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * jj), "asset"), *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * jj));
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
            }
            while (v38);
          }
        }
        else
        {
          v55 = 0uLL;
          v56 = 0uLL;
          v53 = 0uLL;
          v54 = 0uLL;
          v41 = (void *)objc_msgSend(v15, "subarrayWithRange:", 1);
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v54;
            do
            {
              for (kk = 0; kk != v43; ++kk)
              {
                if (*(_QWORD *)v54 != v44)
                  objc_enumerationMutation(v41);
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * kk), "asset"), *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * kk));
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
            }
            while (v43);
          }
        }

      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v48);
  }

}

uint64_t __56__CoreThemeDocument__removeRedundantPDFBasedRenditions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v4;

  v4 = objc_msgSend((id)objc_msgSend(a2, "asset"), "fileScaleFactor");
  if (v4 > objc_msgSend((id)objc_msgSend(a3, "asset"), "fileScaleFactor"))
    return -1;
  else
    return 1;
}

- (void)_delete:(id)a3 withRendition:(id)a4
{
  void *v7;
  void *v8;
  void *v9;

  v7 = (void *)objc_msgSend(a4, "production");
  objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "deleteObject:", a4);
  v8 = (void *)objc_msgSend(v7, "renditions");
  if (objc_msgSend(v8, "count") == 1 && objc_msgSend(v8, "containsObject:", a4))
    objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "deleteObject:", v7);
  v9 = (void *)objc_msgSend(a3, "renditions");
  if (objc_msgSend(v9, "count") == 1)
  {
    if (objc_msgSend(v9, "containsObject:", a4))
      objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "deleteObject:", a3);
  }
}

- (void)_insertRendition:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *packableRenditions;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t, void *, void *);
  void *v16;
  CoreThemeDocument *v17;

  packableRenditions = self->_packableRenditions;
  objc_sync_enter(packableRenditions);
  v8 = (void *)-[NSMutableDictionary objectForKey:](self->_packableRenditions, "objectForKey:", a4);
  v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v15 = __45__CoreThemeDocument__insertRendition_forKey___block_invoke;
    v16 = &unk_24EF2C380;
    v17 = self;
    v10 = 0;
    v11 = objc_msgSend(v8, "count");
    if (v11)
    {
      do
      {
        v12 = objc_msgSend(v9, "objectAtIndex:", (v11 + v10) >> 1);
        if (v15((uint64_t)v14, (void *)v12, a3) >= 0)
          v11 = (v11 + v10) >> 1;
        else
          v10 = ((v11 + v10) >> 1) + 1;
      }
      while (v10 < v11);
    }
    objc_msgSend(v9, "insertObject:atIndex:", a3, v10);
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    -[NSMutableDictionary setObject:forKey:](self->_packableRenditions, "setObject:forKey:", v13, a4);

    objc_msgSend(v13, "addObject:", a3);
  }
  objc_sync_exit(packableRenditions);
}

uint64_t __45__CoreThemeDocument__insertRendition_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v6;
  int v7;
  int v8;
  int v9;
  void *v11;
  void *v12;

  v6 = objc_msgSend(a2, "width");
  v7 = objc_msgSend(a2, "height") * v6;
  v8 = objc_msgSend(a3, "width");
  v9 = objc_msgSend(a3, "height") * v8;
  if (v7 > v9)
    return -1;
  if (v7 < v9)
    return 1;
  v11 = (void *)objc_msgSend(a2, "keySpec");
  v12 = (void *)objc_msgSend(a3, "keySpec");
  objc_msgSend(v11, "key");
  objc_msgSend(v12, "key");
  objc_msgSend(*(id *)(a1 + 32), "untrimmedRenditionKeyFormat");
  return CUICompareRenditionKey();
}

- (BOOL)_updateRenditionPackings:(id)a3 error:(id *)a4
{
  CoreThemeDocument *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id *v44;
  int v45;
  CoreThemeDocument *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v6 = self;
  v66 = *MEMORY[0x24BDAC8D0];
  if (!self->_packableRenditions)
    self->_packableRenditions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v44 = a4;
  -[CoreThemeDocument untrimmedRenditionKeyFormat](v6, "untrimmedRenditionKeyFormat");
  v50 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!CUIRenditionKeyHasIdentifier())
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CoreThemeDocument.m"), 9903, CFSTR("We need to have Dimension1 in the renditionKeyFormat for the document"));
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v7)
  {
    v8 = v7;
    v45 = 0;
    v9 = *(_QWORD *)v62;
    v10 = &OBJC_IVAR___TDRenditionKeySpec__stackScratchKey;
    v49 = *(_QWORD *)v62;
    v46 = v6;
    while (2)
    {
      v11 = 0;
      v51 = v8;
      do
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v11);
        v13 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&v6->super.super.isa + v10[40]), "objectForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "production"), "name"), "identifier")), "intValue");
        v14 = (void *)MEMORY[0x2276A576C]();
        if ((_DWORD)v13)
          objc_msgSend(v12, "setAlphaCrop:", 1);
        if ((objc_msgSend(v12, "updatePackingPropertiesWithDocument:", v6) & 1) == 0)
        {
          if (v44)
          {
            v39 = (void *)MEMORY[0x24BDD1540];
            v40 = *MEMORY[0x24BDD0B88];
            v41 = (void *)MEMORY[0x24BDBCE70];
            v42 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to generate packing info for %@"), objc_msgSend((id)objc_msgSend(v12, "production"), "relativePath"));
            *v44 = (id)objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 0, objc_msgSend(v41, "dictionaryWithObject:forKey:", v42, *MEMORY[0x24BDD0FC8]));
          }

          objc_autoreleasePoolPop(v14);
          return 0;
        }
        if (objc_msgSend(v12, "canBePackedWithDocument:", v6))
        {
          v59 = v14;
          v58 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "scaleFactor");
          v15 = objc_msgSend(v12, "opaque");
          v16 = objc_msgSend(v12, "monochrome");
          v57 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "gamut"), "identifier");
          v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "target"), "identifier");
          v55 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "appearance"), "identifier");
          v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "localization"), "identifier");
          v54 = objc_msgSend(v12, "preserveForArchiveOnly");
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v18 = objc_msgSend((id)objc_msgSend(v12, "compressionType"), "identifier");
            if (v18 == 2)
              v19 = 0;
            else
              v19 = v18;
            v53 = v19;
          }
          else
          {
            v53 = 0;
          }
          if ((_DWORD)v13)
            v20 = 0;
          else
            v20 = v16;
          if ((_DWORD)v13)
            v21 = 0;
          else
            v21 = v15;
          v22 = -[CoreThemeDocument renditionKeySemantics](v6, "renditionKeySemantics");
          v23 = (void *)objc_msgSend(v12, "keySpec");
          if (v22 == 1)
          {
            v24 = (void *)objc_msgSend(v23, "presentationState");
            v25 = (void *)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "size");
            v26 = objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d"), v58, v21, v20, objc_msgSend(v24, "identifier"), objc_msgSend(v25, "identifier"), 0, 0, v13, 0, 0, v57, v53, v56, v55, v17, v54);
          }
          else
          {
            v48 = objc_msgSend(v23, "subtype");
            v27 = (void *)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "idiom");
            v28 = (void *)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "sizeClassHorizontal");
            v29 = (void *)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "sizeClassVertical");
            v47 = v21;
            v30 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "memoryClass");
            v31 = v20;
            v32 = (void *)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "graphicsFeatureSetClass");
            v43 = v31;
            v6 = v46;
            v26 = objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d"), v58, v47, v43, v48, objc_msgSend(v27, "identifier"), objc_msgSend(v28, "identifier"), objc_msgSend(v29, "identifier"), v13, v30, objc_msgSend(v32, "identifier"), v57, v53, v56, v55, v17, v54);
          }
          v33 = (void *)v26;
          v34 = (void *)objc_msgSend((id)objc_msgSend(v12, "production"), "tags");
          v10 = &OBJC_IVAR___TDRenditionKeySpec__stackScratchKey;
          v14 = v59;
          if (objc_msgSend(v34, "count"))
          {
            v35 = objc_alloc_init(MEMORY[0x24BDD16A8]);
            v60[0] = MEMORY[0x24BDAC760];
            v60[1] = 3221225472;
            v60[2] = __52__CoreThemeDocument__updateRenditionPackings_error___block_invoke;
            v60[3] = &unk_24EF2BF20;
            v60[4] = v35;
            objc_msgSend(v34, "enumerateObjectsUsingBlock:", v60);
            v36 = objc_msgSend(v50, "objectForKey:", v35);
            if (v36)
            {
              v37 = (void *)v36;
            }
            else
            {
              v37 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (unsigned __int16)v45);
              objc_msgSend(v50, "setObject:forKey:", v37, v35);
              ++v45;
            }
            objc_msgSend(v33, "appendFormat:", CFSTR(".tag%d"), objc_msgSend(v37, "intValue"));

          }
          -[CoreThemeDocument _insertRendition:forKey:](v6, "_insertRendition:forKey:", v12, v33);
          v9 = v49;
          v8 = v51;
        }
        objc_autoreleasePoolPop(v14);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v8)
        continue;
      break;
    }
  }

  return 1;
}

void __52__CoreThemeDocument__updateRenditionPackings_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_msgSend((id)objc_msgSend(a2, "identifier"), "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("|"), CFSTR("||"), 2, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("."), CFSTR("|"), 2, 0, objc_msgSend(v3, "length"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v3);

}

- (void)_groupPackableRenditions
{
  CoreThemeDocument *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  void *v22;
  int v23;
  void *v24;
  TDPacker *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  TDPacker *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  TDPacker *v39;
  uint64_t i;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t j;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  uint64_t v82;
  void *v83;
  int v84;
  int v85;
  uint64_t v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  int v95;
  int v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t m;
  void *v103;
  int v104;
  float v105;
  float v106;
  double v107;
  float v108;
  float v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  void *v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  id v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  id obj;
  id obja;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  id v146;
  id v147;
  void *v148;
  int v149;
  id v150;
  void *v151;
  int v152;
  void *v153;
  uint64_t v154;
  unint64_t v155;
  void *v156;
  CoreThemeDocument *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _QWORD v177[3];
  _QWORD v178[4];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  v132 = -[CoreThemeDocument displayGamuts](self, "displayGamuts");
  v125 = -[CoreThemeDocument featureSetClasses](self, "featureSetClasses");
  v124 = -[CoreThemeDocument idioms](self, "idioms");
  v178[0] = -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", 0);
  v178[1] = -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", 1);
  v178[2] = -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", 2);
  v178[3] = -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", 3);
  v123 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v178, 4);
  v122 = -[CoreThemeDocument sizeClasses](self, "sizeClasses");
  v177[0] = -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", 0);
  v177[1] = -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", 1);
  v177[2] = -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", 2);
  v121 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v177, 3);
  v131 = -[CoreThemeDocument compressionTypes](self, "compressionTypes");
  v130 = -[CoreThemeDocument deploymentTargets](self, "deploymentTargets");
  v129 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 181);
  v128 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1004);
  v133 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 9);
  v120 = -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 127);
  v147 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = self;
  v146 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v150 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  obj = (id)objc_msgSend((id)-[NSMutableDictionary allKeys](self->_packableRenditions, "allKeys"), "sortedArrayUsingSelector:");
  v157 = self;
  v142 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v176, 16);
  if (v142)
  {
    v140 = *(_QWORD *)v167;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v167 != v140)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v4);
        v6 = (void *)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
        v153 = v5;
        v7 = (void *)-[NSMutableDictionary objectForKey:](v3->_packableRenditions, "objectForKey:", v5);
        v8 = objc_msgSend(v7, "count");
        v9 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 7), "intValue");
        v10 = v9;
        v144 = v4;
        if (v8 == 1)
        {
          if (!v9)
            objc_msgSend(v150, "addObject:", v153);
        }
        else
        {
          v11 = objc_msgSend((id)objc_msgSend(v6, "firstObject"), "intValue");
          if (v10)
          {
            v12 = 0x366666uLL / v11;
            if (!v8)
              goto LABEL_31;
          }
          else
          {
            LODWORD(v12) = __packing_max_area;
            if (!v8)
              goto LABEL_31;
          }
          v13 = 0;
          v14 = 0;
          v15 = (double)(unint64_t)((int)v12 * (uint64_t)v11);
          v155 = v8;
          do
          {
            v16 = objc_msgSend(v7, "count");
            if (v16 <= v13)
            {
              v17 = v13;
            }
            else
            {
              v17 = v16;
              v18 = 0;
              v19 = v13 - v16;
              v20 = 0.0;
              while (1)
              {
                v21 = v13 + v18;
                v22 = (void *)objc_msgSend(v7, "objectAtIndex:", v13 + v18);
                v23 = objc_msgSend(v22, "width");
                v20 = v20 + (double)(int)(objc_msgSend(v22, "height") * v23);
                if (v20 >= v15)
                  break;
                ++v18;
                if (!(v19 + v18))
                  goto LABEL_23;
              }
              v24 = (void *)objc_msgSend(v7, "array");
              v25 = objc_alloc_init(TDPacker);
              -[TDPacker setSizeHandler:](v25, "setSizeHandler:", &__block_literal_global_1298);
              -[TDPacker setObjectsToPack:](v25, "setObjectsToPack:", objc_msgSend(v24, "subarrayWithRange:", v13, v18));
              -[TDPacker pack](v25, "pack");
              -[TDPacker enclosingSize](v25, "enclosingSize");
              v27 = v26;
              v29 = v28;
              v30 = -[TDPacker countOfEmptyNodes](v25, "countOfEmptyNodes");

              if (v21 + v30 >= v17)
                goto LABEL_22;
              v31 = objc_alloc_init(TDPacker);
              -[TDPacker setSizeHandler:](v31, "setSizeHandler:", &__block_literal_global_1298);
              -[TDPacker setObjectsToPack:](v31, "setObjectsToPack:", objc_msgSend(v24, "subarrayWithRange:", v13, v30 + v18));
              -[TDPacker pack](v31, "pack");
              -[TDPacker enclosingSize](v31, "enclosingSize");
              v33 = v32;
              v35 = v34;

              v17 = v21 + v30;
              if (v35 * v33 != v29 * v27)
LABEL_22:
                v17 = v13 + v18;
LABEL_23:
              if (v17 <= v13)
              {
                v8 = v155;
              }
              else
              {
                v8 = v155;
                if (v17 <= v155)
                {
                  if (v17 == v155)
                    v36 = v155 - v13;
                  else
                    v36 = v17 - v13 + 1;
                  v37 = objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithOrderedSet:range:copyItems:", v7, v13, v36, 0);
                  objc_msgSend(v150, "addObject:", v153);
                  v38 = (void *)objc_msgSend(v153, "mutableCopy");
                  objc_msgSend(v38, "appendFormat:", CFSTR(".%d"), v14);
                  objc_msgSend(v147, "setObject:forKey:", v37, v38);

                }
              }
            }
            v13 = v17 + 1;
            v14 = (v14 + 1);
          }
          while (v17 + 1 < v8);
        }
LABEL_31:
        v4 = v144 + 1;
        v3 = v157;
      }
      while (v144 + 1 != v142);
      v142 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v176, 16);
    }
    while (v142);
  }
  -[NSMutableDictionary removeObjectsForKeys:](v3->_packableRenditions, "removeObjectsForKeys:", v150);
  -[NSMutableDictionary addEntriesFromDictionary:](v3->_packableRenditions, "addEntriesFromDictionary:", v147);

  v39 = objc_alloc_init(TDPacker);
  -[TDPacker setSizeHandler:](v39, "setSizeHandler:", &__block_literal_global_813);
  v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableDictionary count](v3->_packableRenditions, "count"));
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v127 = (id)objc_msgSend((id)-[NSMutableDictionary allKeys](v3->_packableRenditions, "allKeys"), "sortedArrayUsingSelector:", sel_localizedCompare_);
  v137 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v162, v175, 16);
  if (!v137)
    goto LABEL_93;
  v134 = 0;
  v135 = 0;
  v136 = *(_QWORD *)v163;
  do
  {
    for (i = 0; i != v137; i = v75 + 1)
    {
      if (*(_QWORD *)v163 != v136)
        objc_enumerationMutation(v127);
      v41 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i);
      v42 = (void *)-[NSMutableDictionary objectForKey:](v3->_packableRenditions, "objectForKey:", v41);
      v43 = objc_msgSend(v42, "count");
      -[TDPacker setObjectsToPack:](v39, "setObjectsToPack:", objc_msgSend(v42, "array"));
      -[TDPacker pack](v39, "pack");
      v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (v43)
      {
        for (j = 0; j != v43; ++j)
        {
          if (-[TDPacker objectAtIndexFit:](v39, "objectAtIndexFit:", j))
          {
            -[TDPacker fitPositionOfObjectAtIndex:](v39, "fitPositionOfObjectAtIndex:", j);
            objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", j), "setPackedPoint:", v46 + 2.0, v47 + 2.0);
            objc_msgSend(v44, "addObject:", objc_msgSend(v42, "objectAtIndex:", j));
          }
        }
      }
      v154 = i;
      v156 = v44;
      v48 = (void *)objc_msgSend(v41, "componentsSeparatedByString:", CFSTR("."));
      v49 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 0), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 3), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 4), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 5), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 6), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 7), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 8), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 9), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 10), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 12), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 15), "intValue"));
      v50 = (void *)objc_msgSend(v146, "objectForKey:", v49);
      if (v50)
        v51 = objc_msgSend(v50, "intValue") + 1;
      else
        v51 = 0;
      v52 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v51);
      objc_msgSend(v146, "setObject:forKey:", v52, v49);
      if (!objc_msgSend(v44, "count"))
      {
        v75 = v154;
        v3 = v157;
        goto LABEL_91;
      }
      v3 = v157;
      v53 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("PackedRenditionSpec"));
      objc_msgSend(v53, "setPackedRenditions:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v44));
      objc_msgSend(v53, "setCompressionType:", objc_msgSend(v131, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 11), "intValue")));
      v54 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
      v55 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 7), "intValue");
      v151 = (void *)v52;
      if (!(_DWORD)v55)
      {
        objc_msgSend(v54, "setElement:", v133);
        v76 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("ElementProduction"));
        objc_msgSend(v76, "setTags:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "firstObject"), "production"), "tags"));
        v77 = v76;
        v73 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v73, "setNameIdentifier:", 0);
        objc_msgSend(v73, "setElement:", objc_msgSend(v54, "element"));
        v145 = v54;
        objc_msgSend(v73, "setPart:", objc_msgSend(v54, "part"));
        v148 = v76;
        objc_msgSend(v76, "setBaseKeySpec:", v73);
LABEL_59:

        v54 = v145;
        v59 = v148;
        v3 = v157;
        goto LABEL_60;
      }
      v56 = v55;
      objc_msgSend(v53, "setAlphaCrop:", 1);
      objc_msgSend(v54, "setElement:", v133);
      objc_msgSend(v54, "setNameIdentifier:", v56);
      v57 = (int)v56;
      v58 = -[NSMutableDictionary objectForKey:](v157->_explicitlyPackedPackings, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)v56));
      v59 = -[CoreThemeDocument namedArtworkProductionWithName:](v157, "namedArtworkProductionWithName:", v58);
      if (!v59)
      {
        v143 = v53;
        v60 = v56;
        v61 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("NamedArtworkProduction"));
        objc_msgSend(v61, "setTags:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v156, "firstObject"), "production"), "tags"));
        v62 = -[CoreThemeDocument _createNamedElementWithIdentifier:](v157, "_createNamedElementWithIdentifier:", v57);
        objc_msgSend(v62, "setDateOfLastChange:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));
        objc_msgSend(v62, "setName:", v58);
        objc_msgSend(v61, "setName:", v62);
        v63 = v61;
        v64 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        v141 = v60;
        objc_msgSend(v64, "setNameIdentifier:", v60);
        objc_msgSend(v64, "setElement:", objc_msgSend(v54, "element"));
        v145 = v54;
        objc_msgSend(v64, "setPart:", objc_msgSend(v54, "part"));
        v148 = v61;
        objc_msgSend(v61, "setBaseKeySpec:", v64);

        obja = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("ContentsRenditionSpec"));
        v65 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v66 = (void *)-[NSMutableDictionary objectForKey:](v157->_explicitlyPackedContents, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v57));
        v158 = 0u;
        v159 = 0u;
        v160 = 0u;
        v161 = 0u;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v159;
          do
          {
            for (k = 0; k != v68; ++k)
            {
              if (*(_QWORD *)v159 != v69)
                objc_enumerationMutation(v66);
              v71 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * k);
              v72 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("ContentsName"));
              objc_msgSend(v72, "setName:", v71);
              objc_msgSend(v65, "addObject:", v72);

            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
          }
          while (v68);
        }
        v73 = obja;
        objc_msgSend(obja, "setContains:", v65);

        v74 = -[CoreThemeDocument newObjectForEntity:](v157, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
        objc_msgSend(v74, "setNameIdentifier:", v141);
        objc_msgSend(v74, "setElement:", v133);
        objc_msgSend(v74, "setPart:", v120);
        objc_msgSend(v74, "setScaleFactor:", 1);
        objc_msgSend(obja, "setKeySpec:", v74);

        objc_msgSend(obja, "setProduction:", v148);
        v53 = v143;
        goto LABEL_59;
      }
LABEL_60:
      objc_msgSend(v59, "setBaseKeySpec:", objc_msgSend(v59, "baseKeySpec"));
      objc_msgSend(v53, "setKeySpec:", v54);
      objc_msgSend(v53, "resetToBaseKeySpec");
      objc_msgSend(v54, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 0), "intValue"));
      objc_msgSend(v54, "setPart:", v129);
      v78 = -[CoreThemeDocument renditionKeySemantics](v3, "renditionKeySemantics");
      v79 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 3), "intValue");
      if (v78 == 1)
      {
        objc_msgSend(v54, "setPresentationState:", objc_msgSend(v121, "objectAtIndexedSubscript:", (int)v79));
        objc_msgSend(v54, "setSize:", objc_msgSend(v123, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 4), "intValue")));
      }
      else
      {
        objc_msgSend(v54, "setSubtype:", v79);
        objc_msgSend(v54, "setIdiom:", objc_msgSend(v124, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 4), "intValue")));
        objc_msgSend(v54, "setSizeClassHorizontal:", objc_msgSend(v122, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 5), "intValue")));
        objc_msgSend(v54, "setSizeClassVertical:", objc_msgSend(v122, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 6), "intValue")));
        objc_msgSend(v54, "setMemoryClass:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 8), "intValue"));
        objc_msgSend(v54, "setGraphicsFeatureSetClass:", objc_msgSend(v125, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 9), "intValue")));
      }
      v44 = v156;
      objc_msgSend(v54, "setGamut:", objc_msgSend(v132, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 10), "intValue")));
      objc_msgSend(v54, "setDimension1:", objc_msgSend(v151, "intValue"));
      objc_msgSend(v54, "setTarget:", objc_msgSend(v130, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 12), "intValue")));
      if (objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"))
      {
        if (v134
          && (v80 = objc_msgSend(v134, "identifier"),
              v81 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"),
              v82 = (uint64_t)v134,
              v81 == v80))
        {
          v83 = v54;
        }
        else
        {
          v82 = -[CoreThemeDocument appearanceWithIdentifier:](v3, "appearanceWithIdentifier:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"));
          v83 = v54;
          v134 = (void *)v82;
        }
      }
      else
      {
        v83 = v54;
        v82 = 0;
      }
      objc_msgSend(v83, "setAppearance:", v82);
      if (objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"))
      {
        if (v135
          && (v84 = objc_msgSend(v135, "identifier"),
              v85 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"),
              v86 = (uint64_t)v135,
              v85 == v84))
        {
          v87 = v54;
        }
        else
        {
          v86 = -[CoreThemeDocument localizationWithIdentifier:](v3, "localizationWithIdentifier:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"));
          v87 = v54;
          v135 = (void *)v86;
        }
      }
      else
      {
        v87 = v54;
        v86 = 0;
      }
      objc_msgSend(v87, "setLocalization:", v86);
      objc_msgSend(v53, "setProduction:", v59);

      objc_msgSend(v59, "setRenditionType:", v128);
      objc_msgSend(v53, "setRenditionType:", v128);
      -[TDPacker enclosingSize](v39, "enclosingSize");
      v89 = v88 + 1.0;
      v91 = v90 + 1.0;
      v92 = fmod(v90 + 1.0, 2.0);
      if (v92 == 0.0)
        v92 = -0.0;
      v93 = v91 + v92;
      v94 = fmod(v89, 2.0);
      if (v94 == 0.0)
        v94 = -0.0;
      objc_msgSend(v53, "setWidth:", (int)(v89 + v94));
      objc_msgSend(v53, "setHeight:", (int)v93);
      objc_msgSend(v53, "setOpaque:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 1), "BOOLValue"));
      objc_msgSend(v53, "setMonochrome:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 2), "BOOLValue"));
      objc_msgSend(v53, "setPreserveForArchiveOnly:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 15), "intValue") != 0);
      if (__coreThemeLoggingEnabled)
      {
        v95 = objc_msgSend(v53, "width");
        v96 = objc_msgSend(v53, "height");
        v170 = 0u;
        v171 = 0u;
        v172 = 0u;
        v173 = 0u;
        v97 = (void *)objc_msgSend(v53, "packedRenditions");
        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
        if (v98)
        {
          v99 = v98;
          v149 = v96;
          v152 = v95;
          v100 = 0;
          v101 = *(_QWORD *)v171;
          do
          {
            for (m = 0; m != v99; ++m)
            {
              if (*(_QWORD *)v171 != v101)
                objc_enumerationMutation(v97);
              v103 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * m);
              v104 = objc_msgSend(v103, "width");
              v100 += objc_msgSend(v103, "height") * v104;
            }
            v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
          }
          while (v99);
          v105 = (float)v100;
          v44 = v156;
          v3 = v157;
          v95 = v152;
          v96 = v149;
        }
        else
        {
          v105 = 0.0;
        }
        v106 = v105 / (float)(v96 * v95);
        NSLog(CFSTR("Packed rendition %@ space utilization: %.3f%%."), objc_msgSend(v53, "renditionPackName"), (float)(v106 * 100.0));
        *(float *)&v107 = v106;
        objc_msgSend(v126, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v107));
      }

      v75 = v154;
LABEL_91:

    }
    v137 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v162, v175, 16);
  }
  while (v137);
LABEL_93:

  if (__coreThemeLoggingEnabled)
  {
    objc_msgSend((id)objc_msgSend(v126, "valueForKeyPath:", CFSTR("@avg.self")), "floatValue");
    v109 = v108;
    v110 = (void *)objc_msgSend(v126, "sortedArrayUsingSelector:", sel_compare_);
    if (objc_msgSend(v110, "count") == 1)
    {
      v111 = (void *)objc_msgSend(v110, "objectAtIndex:", 1);
      goto LABEL_98;
    }
    v112 = objc_msgSend(v110, "count");
    v111 = (void *)objc_msgSend(v110, "objectAtIndex:", (unint64_t)objc_msgSend(v110, "count") >> 1);
    v113 = v111;
    if ((v112 & 1) != 0)
    {
LABEL_98:
      objc_msgSend(v111, "floatValue");
      v118 = v119;
    }
    else
    {
      v114 = (void *)objc_msgSend(v110, "objectAtIndex:", ((unint64_t)objc_msgSend(v110, "count") >> 1) + 1);
      objc_msgSend(v113, "floatValue");
      v116 = v115;
      objc_msgSend(v114, "floatValue");
      v118 = (float)(v116 + v117) * 0.5;
    }
    NSLog(CFSTR("Mean space utilization: %.3f%%."), (float)(v109 * 100.0));
    NSLog(CFSTR("Median space utilization: %.3f%%."), (float)(v118 * 100.0));
  }

}

double __45__CoreThemeDocument__groupPackableRenditions__block_invoke(uint64_t a1, void *a2)
{
  double v3;

  v3 = (double)(int)(objc_msgSend(a2, "width") + 2);
  objc_msgSend(a2, "height");
  return v3;
}

- (void)packRenditionsError:(id *)a3
{
  id v5;

  if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 2))
  {
    v5 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("PackedRenditionSpec"), 0);
    if (objc_msgSend(v5, "count"))
      -[CoreThemeDocument deleteObjects:](self, "deleteObjects:", v5);
    -[CoreThemeDocument _updateRenditionPackings:error:](self, "_updateRenditionPackings:error:", -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("RenditionSpec"), 0), a3);
    -[CoreThemeDocument _groupPackableRenditions](self, "_groupPackableRenditions");
  }
}

- (void)incrementallyPackRenditionsSinceDate:(id)a3 error:(id *)a4
{
  id v7;

  if (a3)
  {
    if (-[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 2))
    {
      v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", CFSTR("RenditionSpec"), objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("production.dateOfLastChange > %@"), a3), 0);
      NSLog(CFSTR("found %lu changed renditions since %@: %@"), objc_msgSend(v7, "count"), a3, v7);
      -[CoreThemeDocument _updateRenditionPackings:error:](self, "_updateRenditionPackings:error:", v7, a4);
      -[CoreThemeDocument _groupPackableRenditions](self, "_groupPackableRenditions");
    }
  }
}

- (void)_optimizeForDeviceTraits
{
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  void *v68;
  uint64_t jj;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t kk;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t mm;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t nn;
  void *v89;
  id v90;
  char *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i1;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i2;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i3;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  id obj;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  id v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  void *v122;
  id v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  id v128;
  id v129;
  id v130;
  CoreThemeDocument *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  id v137;
  char *v138;
  id v139;
  char *v140;
  id v141;
  id v142;
  uint64_t v143;
  void *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  uint64_t v233;

  v233 = *MEMORY[0x24BDAC8D0];
  if (!-[CoreThemeDocument deviceTraitsUsedForOptimization](self, "deviceTraitsUsedForOptimization"))
    return;
  v116 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = -[TDDeviceTraits hostedIdiomValues](-[CoreThemeDocument optimizeForDeviceTraits](self, "optimizeForDeviceTraits"), "hostedIdiomValues");
  v121 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v118 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v117 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v131 = self;
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  obj = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("ElementProduction"), 0);
  v122 = v4;
  v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v208, v231, 16);
  if (!v114)
    goto LABEL_37;
  v112 = *(_QWORD *)v209;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v209 != v112)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * v7);
      if (objc_msgSend((id)objc_msgSend(v8, "renditionType"), "identifier") == 1006)
        objc_msgSend(v118, "addObject:", v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v117, "addObject:", v8);
      v119 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "optOutOfThinning"))
      {
        objc_msgSend(v5, "unionSet:", objc_msgSend(v8, "renditions"));
        goto LABEL_35;
      }
      v207 = 0u;
      v206 = 0u;
      v205 = 0u;
      v204 = 0u;
      v127 = (id)objc_msgSend(v8, "renditions");
      v143 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v204, v230, 16);
      if (v143)
      {
        v9 = *(_QWORD *)v205;
        v125 = *(_QWORD *)v205;
        do
        {
          for (i = 0; i != v143; ++i)
          {
            if (*(_QWORD *)v205 != v9)
              objc_enumerationMutation(v127);
            v11 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * i);
            v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "idiom"), "identifier");
            v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "element"), "identifier");
            v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "part"), "identifier");
            if (v3
              && -[NSArray containsObject:](v3, "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12))|| v13 == 127|| v14 == 218)
            {
              v26 = v5;
            }
            else if (v13 == 9
                   && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "production"), "name"), "identifier"))
            {
              v26 = v121;
            }
            else
            {
              v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "part"), "identifier");
              v139 = (id)MEMORY[0x24BDD17C8];
              v136 = (id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "nameIdentifier");
              v132 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "element"), "identifier");
              v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "part"), "identifier");
              v17 = objc_msgSend((id)objc_msgSend(v11, "keySpec"), "dimension1");
              v18 = (void *)objc_msgSend(v11, "keySpec");
              if (v15 == 220)
              {
                v123 = (id)objc_msgSend(v18, "dimension2");
                v19 = v16;
                v20 = v3;
                v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "appearance"), "identifier");
                v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "localization"), "identifier");
                v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphWeight"), "identifier");
                v110 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphSize"), "identifier");
                v24 = v21;
                v3 = v20;
                v25 = objc_msgSend(v139, "stringWithFormat:", CFSTR("%d.%d.%d.%d.%d.%d.%d.%d.%d"), v136, v132, v19, v17, v123, v24, v22, v23, v110);
              }
              else
              {
                v25 = objc_msgSend(v139, "stringWithFormat:", CFSTR("%d.%d.%d.%d.%d.%d.%d.%d"), v136, v132, v16, v17, objc_msgSend((id)objc_msgSend(v18, "appearance"), "identifier"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "localization"), "identifier"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphSize"), "identifier"), v109);
              }
              v27 = v25;
              v4 = v122;
              v26 = (void *)objc_msgSend(v122, "objectForKey:", v25);
              v9 = v125;
              if (!v26)
              {
                v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v28, "addObject:", v11);
                objc_msgSend(v122, "setObject:forKey:", v28, v27);

                continue;
              }
            }
            objc_msgSend(v26, "addObject:", v11);
          }
          v143 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v204, v230, 16);
        }
        while (v143);
      }
LABEL_35:
      v7 = v119 + 1;
    }
    while (v119 + 1 != v114);
    v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v208, v231, 16);
  }
  while (v114);
LABEL_37:
  v203 = 0u;
  v202 = 0u;
  v201 = 0u;
  v200 = 0u;
  v115 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v200, v229, 16);
  if (v115)
  {
    v113 = *(_QWORD *)v201;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v201 != v113)
          objc_enumerationMutation(v4);
        v120 = v29;
        v30 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * v29);
        v137 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v128 = (id)objc_msgSend(v4, "objectForKey:", v30);
        v196 = 0u;
        v197 = 0u;
        v198 = 0u;
        v199 = 0u;
        v124 = -[CoreThemeDocument deviceTraitsUsedForOptimization](v131, "deviceTraitsUsedForOptimization");
        v133 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v196, v228, 16);
        if (v133)
        {
          v126 = *(_QWORD *)v197;
          do
          {
            for (j = 0; j != v133; ++j)
            {
              if (*(_QWORD *)v197 != v126)
                objc_enumerationMutation(v124);
              v32 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * j);
              v144 = (void *)MEMORY[0x24BE28C28];
              objc_msgSend(v32, "scale");
              v34 = objc_msgSend(v144, "bestMatchUsingObjects:getAttributeValueUsing:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:deploymentTarget:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsFeatureSetClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:platform:", v128, &__block_literal_global_830, objc_msgSend(v32, "idiomValue"), objc_msgSend(v32, "subtype"), objc_msgSend(v32, "displayGamutValue"), objc_msgSend(v32, "deploymentTargetValue"), (double)(uint64_t)v33, 5, 0, 0, objc_msgSend(v32, "memoryPerformanceClass"), objc_msgSend(v32, "graphicsFeatureSetClassValue"), objc_msgSend(v32, "graphicsFeatureSetFallbackValues"), objc_msgSend(v32, "subtypeFallbackValues"), -[CoreThemeDocument targetPlatform](v131, "targetPlatform"));
              if (v34)
              {
                v35 = v34;
                objc_msgSend(v5, "addObject:", v34);
                objc_msgSend(v137, "addObject:", v35);
              }
            }
            v133 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v196, v228, 16);
          }
          while (v133);
        }
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v128);
        objc_msgSend(v36, "minusSet:", v5);
        v194 = 0u;
        v195 = 0u;
        v192 = 0u;
        v193 = 0u;
        v134 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v192, v227, 16);
        if (v134)
        {
          v129 = *(id *)v193;
          do
          {
            v37 = 0;
            do
            {
              if (*(id *)v193 != v129)
                objc_enumerationMutation(v137);
              v140 = v37;
              v38 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)v37);
              v188 = 0u;
              v189 = 0u;
              v190 = 0u;
              v191 = 0u;
              v39 = (void *)objc_msgSend(v36, "allObjects");
              v145 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v212 = 0u;
              v213 = 0u;
              v214 = 0u;
              v215 = 0u;
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v212, v232, 16);
              if (v40)
              {
                v41 = v40;
                v42 = *(_QWORD *)v213;
                do
                {
                  for (k = 0; k != v41; ++k)
                  {
                    if (*(_QWORD *)v213 != v42)
                      objc_enumerationMutation(v39);
                    v44 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * k);
                    v45 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "nameIdentifier");
                    if (v45 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "nameIdentifier"))
                    {
                      v46 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "scaleFactor");
                      if (v46 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "scaleFactor"))
                      {
                        v47 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "idiom"), "identifier");
                        if (v47 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "idiom"), "identifier"))
                        {
                          v48 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "subtype");
                          if (v48 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "subtype"))
                          {
                            v49 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "gamut"), "identifier");
                            if (v49 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "gamut"), "identifier"))
                            {
                              v50 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "target"), "identifier");
                              if (v50 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "target"), "identifier"))
                              {
                                v51 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "memoryClass");
                                if (v51 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "memoryClass"))
                                {
                                  v52 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "appearance"), "identifier");
                                  if (v52 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "appearance"), "identifier"))
                                  {
                                    v53 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "graphicsFeatureSetClass"), "identifier");
                                    if (v53 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "graphicsFeatureSetClass"), "identifier"))objc_msgSend(v145, "addObject:", v44);
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v212, v232, 16);
                }
                while (v41);
              }
              v54 = v145;
              if (!objc_msgSend(v145, "count"))
                v54 = 0;
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v188, v226, 16);
              if (v55)
              {
                v56 = v55;
                v57 = *(_QWORD *)v189;
                do
                {
                  for (m = 0; m != v56; ++m)
                  {
                    if (*(_QWORD *)v189 != v57)
                      objc_enumerationMutation(v54);
                    v59 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * m);
                    objc_msgSend(v36, "removeObject:", v59);
                    objc_msgSend(v5, "addObject:", v59);
                  }
                  v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v188, v226, 16);
                }
                while (v56);
              }
              v37 = v140 + 1;
            }
            while (v140 + 1 != (char *)v134);
            v134 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v192, v227, 16);
          }
          while (v134);
        }
        v186 = 0u;
        v187 = 0u;
        v184 = 0u;
        v185 = 0u;
        v60 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v184, v225, 16);
        v4 = v122;
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v185;
          do
          {
            for (n = 0; n != v61; ++n)
            {
              if (*(_QWORD *)v185 != v62)
                objc_enumerationMutation(v36);
              objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * n), "production"), "removeRenditionsObject:", *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * n));
            }
            v61 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v184, v225, 16);
          }
          while (v61);
        }
        -[CoreThemeDocument deleteObjects:](v131, "deleteObjects:", objc_msgSend(v36, "allObjects"));
        objc_msgSend(v6, "unionSet:", v36);

        v29 = v120 + 1;
      }
      while (v120 + 1 != v115);
      v115 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v200, v229, 16);
    }
    while (v115);
  }
  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  v64 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v180, v224, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v181;
    do
    {
      for (ii = 0; ii != v65; ++ii)
      {
        if (*(_QWORD *)v181 != v66)
          objc_enumerationMutation(v118);
        v68 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * ii);
        -[CoreThemeDocument deleteObjects:](v131, "deleteObjects:", objc_msgSend((id)objc_msgSend(v68, "renditions"), "allObjects"));
        objc_msgSend(v68, "setRenditions:", objc_msgSend(MEMORY[0x24BDBCF20], "set"));
      }
      v65 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v180, v224, 16);
    }
    while (v65);
  }
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  v146 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v176, v223, 16);
  if (v146)
  {
    v141 = *(id *)v177;
    do
    {
      for (jj = 0; jj != v146; ++jj)
      {
        if (*(id *)v177 != v141)
          objc_enumerationMutation(v121);
        v70 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * jj);
        v71 = (void *)objc_msgSend((id)objc_msgSend(v70, "packedRenditions"), "mutableCopy");
        v172 = 0u;
        v173 = 0u;
        v174 = 0u;
        v175 = 0u;
        v72 = (void *)objc_msgSend(v70, "packedRenditions");
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v172, v222, 16);
        if (v73)
        {
          v74 = v73;
          v75 = *(_QWORD *)v173;
          do
          {
            for (kk = 0; kk != v74; ++kk)
            {
              if (*(_QWORD *)v173 != v75)
                objc_enumerationMutation(v72);
              v77 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * kk);
              if (objc_msgSend(v6, "containsObject:", v77))
                objc_msgSend(v71, "removeObject:", v77);
            }
            v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v172, v222, 16);
          }
          while (v74);
        }
        if (objc_msgSend(v71, "count"))
        {
          objc_msgSend(v70, "setPackedRenditions:", v71);
        }
        else
        {
          objc_msgSend(v116, "addObject:", v70);
          objc_msgSend((id)objc_msgSend(v70, "production"), "removeRenditionsObject:", v70);
        }

      }
      v146 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v176, v223, 16);
    }
    while (v146);
  }
  objc_opt_class();
  objc_opt_class();
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v78 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](v131, "allObjectsForEntity:withSortDescriptors:", CFSTR("Asset"), 0);
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v168, v221, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v169;
    do
    {
      for (mm = 0; mm != v80; ++mm)
      {
        if (*(_QWORD *)v169 != v81)
          objc_enumerationMutation(v78);
        v83 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * mm);
        if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
          && !objc_msgSend((id)objc_msgSend(v83, "renditions"), "count"))
        {
          objc_msgSend(v116, "addObject:", v83);
        }
      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v168, v221, 16);
    }
    while (v80);
  }
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v84 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](v131, "allObjectsForEntity:withSortDescriptors:", CFSTR("ElementProduction"), 0);
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v164, v220, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v165;
    do
    {
      for (nn = 0; nn != v86; ++nn)
      {
        if (*(_QWORD *)v165 != v87)
          objc_enumerationMutation(v84);
        v89 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * nn);
        if (!objc_msgSend((id)objc_msgSend(v89, "renditions"), "count"))
          objc_msgSend(v116, "addObject:", v89);
      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v164, v220, 16);
    }
    while (v86);
  }
  -[CoreThemeDocument deleteObjects:](v131, "deleteObjects:", v116);

  v90 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v135 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v160, v219, 16);
  if (v135)
  {
    v130 = *(id *)v161;
    do
    {
      v91 = 0;
      do
      {
        if (*(id *)v161 != v130)
          objc_enumerationMutation(v117);
        v138 = v91;
        v92 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)v91), "flattenedImageProduction");
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        v142 = (id)objc_msgSend(v92, "renditions");
        v93 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v156, v218, 16);
        if (v93)
        {
          v94 = v93;
          v147 = *(_QWORD *)v157;
          do
          {
            for (i1 = 0; i1 != v94; ++i1)
            {
              if (*(_QWORD *)v157 != v147)
                objc_enumerationMutation(v142);
              v96 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * i1), "layerReferences");
              v152 = 0u;
              v153 = 0u;
              v154 = 0u;
              v155 = 0u;
              v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v152, v217, 16);
              if (v97)
              {
                v98 = v97;
                v99 = *(_QWORD *)v153;
                do
                {
                  for (i2 = 0; i2 != v98; ++i2)
                  {
                    if (*(_QWORD *)v153 != v99)
                      objc_enumerationMutation(v96);
                    v101 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * i2);
                    if (objc_msgSend(v6, "containsObject:", objc_msgSend(v101, "reference")))
                      objc_msgSend(v90, "addObject:", v101);
                  }
                  v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v152, v217, 16);
                }
                while (v98);
              }
            }
            v94 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v156, v218, 16);
          }
          while (v94);
        }
        v91 = v138 + 1;
      }
      while (v138 + 1 != (char *)v135);
      v135 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v160, v219, 16);
    }
    while (v135);
  }
  -[CoreThemeDocument deleteObjects:](v131, "deleteObjects:", v90);

  v102 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v103 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](v131, "allObjectsForEntity:withSortDescriptors:", CFSTR("MultisizeImageSetRenditionSpec"), 0);
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v148, v216, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v149;
    do
    {
      for (i3 = 0; i3 != v105; ++i3)
      {
        if (*(_QWORD *)v149 != v106)
          objc_enumerationMutation(v103);
        v108 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i3);
        if (!objc_msgSend((id)objc_msgSend(v108, "multisizeImageRenditions"), "count"))
          objc_msgSend(v102, "addObject:", v108);
      }
      v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v148, v216, 16);
    }
    while (v105);
  }
  -[CoreThemeDocument deleteObjects:](v131, "deleteObjects:", v102);

}

uint64_t __45__CoreThemeDocument__optimizeForDeviceTraits__block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  return __valueForAttributeNamed(a2, a3);
}

- (BOOL)_matchesAllExceptGamut:(id)a3 andKeySpec:(id)a4
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;

  v6 = objc_msgSend(a3, "nameIdentifier");
  if (v6 != objc_msgSend(a4, "nameIdentifier"))
    return 0;
  v7 = objc_msgSend(a3, "dimension1");
  if (v7 != objc_msgSend(a4, "dimension1"))
    return 0;
  v8 = objc_msgSend(a3, "dimension2");
  if (v8 != objc_msgSend(a4, "dimension2"))
    return 0;
  v9 = objc_msgSend(a3, "scaleFactor");
  if (v9 != objc_msgSend(a4, "scaleFactor"))
    return 0;
  v10 = objc_msgSend(a3, "subtype");
  if (v10 != objc_msgSend(a4, "subtype"))
    return 0;
  v11 = objc_msgSend(a3, "memoryClass");
  if (v11 != objc_msgSend(a4, "memoryClass"))
    return 0;
  v12 = objc_msgSend((id)objc_msgSend(a3, "state"), "identifier");
  if (v12 != objc_msgSend((id)objc_msgSend(a4, "state"), "identifier"))
    return 0;
  v13 = objc_msgSend((id)objc_msgSend(a3, "presentationState"), "identifier");
  if (v13 != objc_msgSend((id)objc_msgSend(a4, "presentationState"), "identifier"))
    return 0;
  v14 = objc_msgSend((id)objc_msgSend(a3, "value"), "identifier");
  if (v14 != objc_msgSend((id)objc_msgSend(a4, "value"), "identifier"))
    return 0;
  v15 = objc_msgSend((id)objc_msgSend(a3, "size"), "identifier");
  if (v15 != objc_msgSend((id)objc_msgSend(a4, "size"), "identifier"))
    return 0;
  v16 = objc_msgSend((id)objc_msgSend(a3, "direction"), "identifier");
  if (v16 != objc_msgSend((id)objc_msgSend(a4, "direction"), "identifier"))
    return 0;
  v17 = objc_msgSend((id)objc_msgSend(a3, "part"), "identifier");
  if (v17 != objc_msgSend((id)objc_msgSend(a4, "part"), "identifier"))
    return 0;
  v18 = objc_msgSend((id)objc_msgSend(a3, "element"), "identifier");
  if (v18 != objc_msgSend((id)objc_msgSend(a4, "element"), "identifier"))
    return 0;
  v19 = objc_msgSend((id)objc_msgSend(a3, "layer"), "identifier");
  if (v19 != objc_msgSend((id)objc_msgSend(a4, "layer"), "identifier"))
    return 0;
  v20 = objc_msgSend((id)objc_msgSend(a3, "previousState"), "identifier");
  if (v20 != objc_msgSend((id)objc_msgSend(a4, "previousState"), "identifier"))
    return 0;
  v21 = objc_msgSend((id)objc_msgSend(a3, "previousValue"), "identifier");
  if (v21 == objc_msgSend((id)objc_msgSend(a4, "previousValue"), "identifier")
    && (v22 = objc_msgSend((id)objc_msgSend(a3, "idiom"), "identifier"),
        v22 == objc_msgSend((id)objc_msgSend(a4, "idiom"), "identifier"))
    && (v23 = objc_msgSend((id)objc_msgSend(a3, "target"), "identifier"),
        v23 == objc_msgSend((id)objc_msgSend(a4, "target"), "identifier"))
    && (v24 = objc_msgSend((id)objc_msgSend(a3, "sizeClassHorizontal"), "identifier"),
        v24 == objc_msgSend((id)objc_msgSend(a4, "sizeClassHorizontal"), "identifier"))
    && (v25 = objc_msgSend((id)objc_msgSend(a3, "sizeClassVertical"), "identifier"),
        v25 == objc_msgSend((id)objc_msgSend(a4, "sizeClassVertical"), "identifier"))
    && (v26 = objc_msgSend((id)objc_msgSend(a3, "appearance"), "identifier"),
        v26 == objc_msgSend((id)objc_msgSend(a4, "appearance"), "identifier"))
    && (v27 = objc_msgSend((id)objc_msgSend(a3, "graphicsFeatureSetClass"), "identifier"),
        v27 == objc_msgSend((id)objc_msgSend(a4, "graphicsFeatureSetClass"), "identifier")))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldGenerateDisplayGamut:(unsigned int)a3
{
  NSMutableArray *deviceTraits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  deviceTraits = self->_deviceTraits;
  if (!deviceTraits)
  {
LABEL_11:
    LOBYTE(v5) = 1;
    return v5;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deviceTraits, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(deviceTraits);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "displayGamutValue") == a3)
        goto LABEL_11;
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deviceTraits, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        LOBYTE(v5) = 0;
        if (v6)
          goto LABEL_4;
        return v5;
      }
    }
  }
  return v5;
}

- (void)_automaticSRGBGenerationFromP3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[7];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[6];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (-[CoreThemeDocument shouldGenerateDisplayGamut:](self, "shouldGenerateDisplayGamut:", 0))
  {
    v30 = -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", 0);
    v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("NamedArtworkProduction"), 0);
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v49 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "renditions"), "allObjects"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v5);
    }
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v10 = MEMORY[0x24BDAC760];
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke;
    v47[3] = &unk_24EF2C4A0;
    v47[4] = v8;
    v47[5] = v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v47);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v44;
      v28 = v8;
      v29 = v4;
      v27 = v9;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          v39 = 0;
          v40 = &v39;
          v41 = 0x2020000000;
          v42 = 0;
          v38[0] = v10;
          v38[1] = 3221225472;
          v38[2] = __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke_2;
          v38[3] = &unk_24EF2C4C8;
          v38[5] = v12;
          v38[6] = &v39;
          v38[4] = self;
          objc_msgSend(v9, "enumerateObjectsUsingBlock:", v38);
          if (!*((_BYTE *)v40 + 24))
          {
            v33 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend((id)objc_msgSend(v12, "entity"), "name"));
            v13 = (void *)objc_msgSend(v12, "slices");
            if (objc_msgSend(v13, "count"))
            {
              v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v13, "count"));
              v36 = 0u;
              v37 = 0u;
              v34 = 0u;
              v35 = 0u;
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
              if (v15)
              {
                v16 = *(_QWORD *)v35;
                do
                {
                  for (k = 0; k != v15; ++k)
                  {
                    if (*(_QWORD *)v35 != v16)
                      objc_enumerationMutation(v13);
                    objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "sliceRect");
                    v19 = v18;
                    v21 = v20;
                    v23 = v22;
                    v25 = v24;
                    v26 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                    objc_msgSend(v26, "setSliceRect:", v19, v21, v23, v25);
                    objc_msgSend(v14, "addObject:", v26);
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
                }
                while (v15);
              }
              objc_msgSend(v33, "setSlices:", v14);
              v8 = v28;
              v4 = v29;
              v9 = v27;
              v10 = MEMORY[0x24BDAC760];
            }
            objc_msgSend(v33, "setAsset:", objc_msgSend(v12, "asset"));
            objc_msgSend(v33, "setProduction:", objc_msgSend(v12, "production"));
            objc_msgSend((id)objc_msgSend(v12, "production"), "processRendition:withBackstop:", v12, v33);
            objc_msgSend(v12, "copyAttributesInto:", v33);
            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", objc_msgSend(v33, "keySpec"));
            objc_msgSend((id)objc_msgSend(v33, "keySpec"), "setGamut:", v30);
            objc_msgSend(v9, "addObject:", v33);

          }
          _Block_object_dispose(&v39, 8);
        }
        v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v32);
    }

  }
}

uint64_t __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "gamut"), "identifier");
    v6 = 40;
    if (v5 == 1)
      v6 = 32;
    return objc_msgSend(*(id *)(a1 + v6), "addObject:", a2);
  }
  return result;
}

uint64_t __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke_2(uint64_t result, void *a2, _BYTE *a3)
{
  uint64_t v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v4 = result;
    result = objc_msgSend(*(id *)(result + 32), "_matchesAllExceptGamut:andKeySpec:", objc_msgSend(*(id *)(result + 40), "keySpec"), objc_msgSend(a2, "keySpec"));
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  return result;
}

- (void)_automaticP3GenerationFromSRGB
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t j;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  id obj;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (-[CoreThemeDocument shouldGenerateDisplayGamut:](self, "shouldGenerateDisplayGamut:", 1))
  {
    v31 = -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", 1);
    v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("NamedArtworkProduction"), 0);
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v44 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "renditions"), "allObjects"));
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v6);
    }
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke;
    v42[3] = &unk_24EF2C4A0;
    v42[4] = self;
    v42[5] = v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v42);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v9;
    v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v32)
    {
      v30 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v39 != v30)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          v12 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend((id)objc_msgSend(v11, "entity"), "name"));
          v13 = (void *)objc_msgSend(v11, "slices");
          if (objc_msgSend(v13, "count"))
          {
            v33 = j;
            v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v13, "count"));
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v35;
              do
              {
                for (k = 0; k != v16; ++k)
                {
                  if (*(_QWORD *)v35 != v17)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "sliceRect");
                  v20 = v19;
                  v22 = v21;
                  v24 = v23;
                  v26 = v25;
                  v27 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", CFSTR("Slice"));
                  objc_msgSend(v27, "setSliceRect:", v20, v22, v24, v26);
                  objc_msgSend(v14, "addObject:", v27);
                }
                v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
              }
              while (v16);
            }
            objc_msgSend(v12, "setSlices:", v14);
            j = v33;
          }
          objc_msgSend(v12, "setAsset:", objc_msgSend(v11, "asset"));
          objc_msgSend(v12, "setProduction:", objc_msgSend(v11, "production"));
          objc_msgSend((id)objc_msgSend(v11, "production"), "processRendition:withBackstop:", v11, v12);
          objc_msgSend(v11, "copyAttributesInto:", v12);
          objc_msgSend((id)objc_msgSend(v11, "keySpec"), "copyAttributesInto:", objc_msgSend(v12, "keySpec"));
          objc_msgSend((id)objc_msgSend(v12, "keySpec"), "setGamut:", v31);
          v28 = (void *)objc_msgSend(v11, "compressionType");
          if (v28 == -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 3))
          {
            objc_msgSend(v12, "setAllowsHevcCompression:", 0);
            objc_msgSend(v12, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 2));
          }

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v32);
    }

  }
}

void __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  CGImage *v5;
  char v6;
  int v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend((id)objc_msgSend(a2, "asset"), "rawData") & 1) == 0
    && objc_msgSend((id)objc_msgSend(a2, "renditionType"), "identifier") != 1006
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "gamut"), "identifier")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "glyphWeight"), "identifier")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "glyphSize"), "identifier"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "production"), "renditions");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke_2;
    v8[3] = &unk_24EF2C4F0;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
    if (!*((_BYTE *)v10 + 24))
    {
      v7 = 0;
      v6 = 0;
      v5 = (CGImage *)objc_msgSend(a2, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)objc_msgSend(a2, "asset"), "fileURLWithDocument:", *(_QWORD *)(a1 + 32)), *(_QWORD *)(a1 + 32), &v7, &v6);
      if (v5
        && v7 != 1246774599
        && v7 != 1212500294
        && ((CUIImageIsWideGamut() & 1) != 0
         || CGImageGetBitsPerComponent(v5) >= 9 && CUIImageIsMonochrome()))
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
      }
      CGImageRelease(v5);
    }
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "gamut"), "identifier");
    if ((_DWORD)result == 1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 0;
    }
  }
  return result;
}

- (void)_processModelProductions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", CFSTR("ModelIOProduction"), 0);
  -[NSMutableArray removeAllObjects](self->_cachedModelAssets, "removeAllObjects");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "renditions"), "copy");
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "processModelObjectsInDocument:", self);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
}

- (id)_cachedModelAssets
{
  return self->_cachedModelAssets;
}

- (BOOL)_clampMetrics
{
  return -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 15);
}

- (NSString)minimumDeploymentVersion
{
  return self->_minimumDeploymentVersion;
}

- (NSString)pathToRepresentedDocument
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPathToRepresentedDocument:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (TDAssetManagementDelegate)assetManagementDelegate
{
  return self->_assetManagementDelegate;
}

- (void)setAssetManagementDelegate:(id)a3
{
  self->_assetManagementDelegate = (TDAssetManagementDelegate *)a3;
}

- (TDCustomAssetProvider)customAssetProvider
{
  return self->_customAssetProvider;
}

- (void)setCustomAssetProvider:(id)a3
{
  self->_customAssetProvider = (TDCustomAssetProvider *)a3;
}

- (BOOL)featureEnabled:(int)a3
{
  uint64_t v3;
  int64_t v6;
  _BOOL4 v7;
  int majorVersion;
  int minorVersion;
  int64_t v10;
  int v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  char v15;

  v3 = *(_QWORD *)&a3;
  v6 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
  if ((v6 | 2) == 2)
  {
    LOBYTE(v7) = 1;
    switch((int)v3)
    {
      case 1:
      case 3:
        majorVersion = self->_majorVersion;
        if (v6)
          goto LABEL_64;
        if (majorVersion == 10)
        {
          minorVersion = self->_minorVersion;
          if (minorVersion > 10 || minorVersion == 10 && self->_patchVersion > 1)
            return v7;
        }
        goto LABEL_82;
      case 2:
        majorVersion = self->_majorVersion;
        if (v6)
        {
LABEL_64:
          v14 = majorVersion <= 8;
          goto LABEL_85;
        }
        if (majorVersion >= 10 && self->_minorVersion > 10)
          return v7;
        goto LABEL_82;
      case 4:
        majorVersion = self->_majorVersion;
        if (!v6)
          goto LABEL_53;
        goto LABEL_84;
      case 5:
      case 9:
        majorVersion = self->_majorVersion;
        LOBYTE(v7) = majorVersion > 9;
        if (v6)
          return v7;
        if (majorVersion >= 10 && self->_minorVersion > 11)
          goto LABEL_26;
        goto LABEL_82;
      case 8:
        return v7;
      case 10:
        majorVersion = self->_majorVersion;
        if (!v6)
          goto LABEL_48;
        goto LABEL_82;
      case 11:
      case 13:
        majorVersion = self->_majorVersion;
        if (v6)
          goto LABEL_68;
        if (majorVersion >= 10 && self->_minorVersion > 13)
          return v7;
        goto LABEL_82;
      case 12:
        majorVersion = self->_majorVersion;
        if (!v6)
          goto LABEL_48;
LABEL_68:
        v14 = majorVersion <= 11;
        goto LABEL_85;
      case 14:
        v10 = -[CoreThemeDocument targetPlatform](self, "targetPlatform");
        majorVersion = self->_majorVersion;
        if (v10)
        {
LABEL_84:
          v14 = majorVersion <= 12;
        }
        else
        {
          if (majorVersion >= 10 && self->_minorVersion > 14)
          {
LABEL_26:
            LOBYTE(v7) = 1;
            return v7;
          }
LABEL_82:
          v14 = majorVersion <= 10;
        }
LABEL_85:
        LOBYTE(v7) = !v14;
        break;
      case 15:
        v11 = self->_majorVersion;
        if (v6)
          v12 = v11 < 11;
        else
          v12 = 0;
        LOBYTE(v7) = v12;
        if (v6 || v11 > 10)
          return v7;
        v13 = self->_minorVersion < 13;
LABEL_72:
        LOBYTE(v7) = v13;
        return v7;
      case 16:
        if (!v6)
          goto LABEL_80;
LABEL_65:
        v13 = self->_majorVersion < 11;
        goto LABEL_72;
      case 17:
        if (v6)
          return v7;
        majorVersion = self->_majorVersion;
LABEL_48:
        if (majorVersion >= 10 && self->_minorVersion > 12)
          return v7;
        goto LABEL_82;
      case 18:
        if (v6)
          return v7;
        majorVersion = self->_majorVersion;
LABEL_53:
        if (majorVersion >= 10 && self->_minorVersion > 14)
          return v7;
        goto LABEL_82;
      case 19:
      case 20:
        goto LABEL_80;
      default:
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument_FeatureEnabledment.m"), 59, CFSTR("%s Called targetPlatform %d with unknown feature %d"), "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
        goto LABEL_24;
    }
  }
  else
  {
LABEL_24:
    if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 4)
    {
      LOBYTE(v7) = 0;
      switch((int)v3)
      {
        case 1:
        case 2:
        case 3:
          v14 = self->_majorVersion <= 1;
          goto LABEL_85;
        case 4:
        case 12:
        case 16:
        case 18:
          return v7;
        case 5:
        case 9:
          v14 = self->_majorVersion <= 2;
          goto LABEL_85;
        case 8:
        case 17:
        case 19:
        case 20:
          goto LABEL_26;
        case 10:
          v14 = self->_majorVersion <= 3;
          goto LABEL_85;
        case 11:
        case 13:
          v14 = self->_majorVersion <= 4;
          goto LABEL_85;
        case 14:
          v14 = self->_majorVersion <= 5;
          goto LABEL_85;
        case 15:
          v13 = self->_majorVersion < 4;
          goto LABEL_72;
        default:
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument_FeatureEnabledment.m"), 102, CFSTR("%s Called targetPlatform %d with unknown feature %d"), "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
          goto LABEL_60;
      }
    }
    else
    {
LABEL_60:
      if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 1
        || -[CoreThemeDocument targetPlatform](self, "targetPlatform") == 3)
      {
        LOBYTE(v7) = 1;
        switch((int)v3)
        {
          case 1:
          case 2:
          case 3:
            majorVersion = self->_majorVersion;
            goto LABEL_64;
          case 4:
          case 5:
          case 9:
            v14 = self->_majorVersion <= 9;
            goto LABEL_85;
          case 8:
          case 17:
            return v7;
          case 10:
            majorVersion = self->_majorVersion;
            goto LABEL_82;
          case 11:
          case 12:
          case 13:
            majorVersion = self->_majorVersion;
            goto LABEL_68;
          case 14:
            majorVersion = self->_majorVersion;
            goto LABEL_84;
          case 15:
          case 16:
            goto LABEL_65;
          case 18:
          case 19:
          case 20:
            goto LABEL_80;
          default:
            objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument_FeatureEnabledment.m"), 145, CFSTR("%s Called targetPlatform %d with unknown feature %d"), "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
            goto LABEL_76;
        }
      }
      else
      {
LABEL_76:
        if (-[CoreThemeDocument targetPlatform](self, "targetPlatform") == 5)
        {
          v15 = v3 - 1;
          if ((v3 - 1) < 0x14 && ((0xFFF9Fu >> v15) & 1) != 0)
            return (0x13FFFu >> v15) & 1;
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreThemeDocument_FeatureEnabledment.m"), 189, CFSTR("%s Called targetPlatform %d with unknown feature %d"), "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
        }
LABEL_80:
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

- (void)createNamedGlyphVectorForCustomInfos:referenceFiles:bitSource:error:.cold.1()
{
  __assert_rtn("-[CoreThemeDocument createNamedGlyphVectorForCustomInfos:referenceFiles:bitSource:error:]", "CoreThemeDocument.m", 5500, "fileURL");
}

@end
