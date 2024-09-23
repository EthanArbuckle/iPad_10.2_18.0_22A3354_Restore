@implementation MSVSegmentedCodingPackage

- (NSMutableDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

void __47__MSVSegmentedCodingPackage_decodersWithError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _BYTE *v23;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("coder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v7, "stringByAppendingPathExtension:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    MSVGzipDecompressData();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v16 + 40);
      v17 = (id *)(v16 + 40);
      v23 = a4;
      obj = v18;
      v19 = v9;
      v14 = v15;
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("MSVOPACKCoder")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCoder<MSVSegmentedSubDecoder> * _Nonnull _MSVSegmentedCodingPackageDecoderForCoderType(NSString * _Nonnull __strong, NSData * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("MSVSegmentedCodingPackage.m"), 25, CFSTR("Unsupported coder type %@"), v19);

        abort();
      }
      v20 = -[MSVOPACKDecoder initForReadingFromData:error:]([MSVOPACKDecoder alloc], "initForReadingFromData:error:", v14, &obj);

      objc_storeStrong(v17, obj);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        *v23 = 1;
        objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
      }

    }
    else
    {
      v14 = v15;
    }
  }

}

- (MSVSegmentedCodingPackage)initWithURL:(id)a3
{
  id v4;
  MSVSegmentedCodingPackage *v5;
  uint64_t v6;
  NSURL *packageURL;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *infoDictionary;
  void *v12;
  void *v13;
  int v14;
  NSMutableDictionary *v15;
  NSString *v16;
  uint64_t v17;
  Class archivedClass;
  uint64_t v19;
  NSMutableDictionary *segmentEncoderMap;
  MSVSegmentedCodingPackage *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MSVSegmentedCodingPackage;
  v5 = -[MSVSegmentedCodingPackage init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    packageURL = v5->_packageURL;
    v5->_packageURL = (NSURL *)v6;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v5->_packageURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 2, 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      infoDictionary = v5->_infoDictionary;
      v5->_infoDictionary = (NSMutableDictionary *)v10;

      -[NSMutableDictionary objectForKeyedSubscript:](v5->_infoDictionary, "objectForKeyedSubscript:", CFSTR("packageType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "packageTypeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v14)
      {

        v21 = 0;
        goto LABEL_9;
      }
    }
    v15 = v5->_infoDictionary;
    if (!v15)
    {
      -[MSVSegmentedCodingPackage reset](v5, "reset");
      v15 = v5->_infoDictionary;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("archivedClass"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    archivedClass = v5->_archivedClass;
    v5->_archivedClass = (Class)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    segmentEncoderMap = v5->_segmentEncoderMap;
    v5->_segmentEncoderMap = (NSMutableDictionary *)v19;

  }
  v21 = v5;
LABEL_9:

  return v21;
}

void __40__MSVSegmentedCodingPackage_allVersions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_segmentEncoderMap, 0);
  objc_storeStrong((id *)&self->_archivedClass, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
}

- (NSDictionary)allVersions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_infoDictionary, "objectForKeyedSubscript:", CFSTR("segments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MSVSegmentedCodingPackage_allVersions__block_invoke;
  v7[3] = &unk_1E43E8790;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v5;
}

- (id)decodersWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_infoDictionary, "objectForKeyedSubscript:", CFSTR("segments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MSVSegmentedCodingPackage_decodersWithError___block_invoke;
  v11[3] = &unk_1E43E8768;
  v11[4] = self;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v8 = v12;
  v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (Class)archivedClass
{
  return self->_archivedClass;
}

- (void)setArchivedClass:(Class)a3
{
  Class *p_archivedClass;
  objc_class *archivedClass;
  void *v6;

  archivedClass = self->_archivedClass;
  p_archivedClass = &self->_archivedClass;
  if (archivedClass != a3)
  {
    objc_storeStrong((id *)p_archivedClass, a3);
    NSStringFromClass(self->_archivedClass);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_infoDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("archivedClass"));

    self->_needsInfoDictionaryUpdate = 1;
  }
}

- (id)coderTypeForSegment:(id)a3
{
  return CFSTR("MSVOPACKCoder");
}

- (void)reset
{
  NSMutableDictionary *v3;
  NSMutableDictionary *infoDictionary;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  infoDictionary = self->_infoDictionary;
  self->_infoDictionary = v3;

  objc_msgSend((id)objc_opt_class(), "packageTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_infoDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("packageType"));

  -[NSMutableDictionary objectForKeyedSubscript:](self->_infoDictionary, "objectForKeyedSubscript:", CFSTR("segments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_infoDictionary, "setObject:forKeyedSubscript:", v7, CFSTR("segments"));

  }
  self->_needsInfoDictionaryUpdate = 1;
  -[NSMutableDictionary removeAllObjects](self->_segmentEncoderMap, "removeAllObjects");
}

- (void)setNeedsInfoDictionaryUpdate
{
  self->_needsInfoDictionaryUpdate = 1;
}

- (BOOL)writeWithError:(id *)a3
{
  NSMutableDictionary *segmentEncoderMap;
  void *v6;
  BOOL v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  segmentEncoderMap = self->_segmentEncoderMap;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__MSVSegmentedCodingPackage_writeWithError___block_invoke;
  v10[3] = &unk_1E43E8740;
  v10[4] = self;
  v10[5] = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](segmentEncoderMap, "enumerateKeysAndObjectsUsingBlock:", v10);
  -[NSMutableDictionary removeAllObjects](self->_segmentEncoderMap, "removeAllObjects");
  v6 = (void *)v12[5];
  if (a3)
    v7 = v6 == 0;
  else
    v7 = 1;
  v8 = v7;
  if (!v7)
    *a3 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)encoderForSegment:(id)a3 version:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  MSVOPACKEncoder *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_infoDictionary, "objectForKeyedSubscript:", CFSTR("segments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v9 && objc_msgSend(v9, "integerValue") >= a4)
  {
    v11 = 0;
  }
  else
  {
    -[MSVSegmentedCodingPackage coderTypeForSegment:](self, "coderTypeForSegment:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("MSVOPACKCoder")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCoder<MSVSegmentedSubEncoder> * _Nonnull _MSVSegmentedCodingPackageEncoderForCoderType(NSString * _Nonnull __strong)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MSVSegmentedCodingPackage.m"), 36, CFSTR("Unsupported coder type %@"), v10);

      abort();
    }
    v11 = objc_alloc_init(MSVOPACKEncoder);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_segmentEncoderMap, "setObject:forKeyedSubscript:", v11, v6);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_infoDictionary, "objectForKeyedSubscript:", CFSTR("segments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v6);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("version"));

    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, CFSTR("coder"));

    self->_needsInfoDictionaryUpdate = 1;
  }

  return v11;
}

- (BOOL)saveWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSMutableDictionary *infoDictionary;
  void *v14;
  id v15;
  id v16;
  char v17;
  id v19;
  id v20;
  id v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_packageURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v22);
  v8 = v22;

  if ((v7 & 1) != 0)
  {
    v21 = 0;
    -[MSVSegmentedCodingPackage writeWithError:](self, "writeWithError:", &v21);
    v9 = v21;
    v10 = v9;
    if (a3 && v9)
    {
      v11 = 0;
      *a3 = objc_retainAutorelease(v9);
LABEL_17:

      goto LABEL_18;
    }
    if (self->_needsInfoDictionaryUpdate)
    {
      -[NSURL URLByAppendingPathComponent:isDirectory:](self->_packageURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      infoDictionary = self->_infoDictionary;
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", infoDictionary, 200, 0, &v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v20;
      if (v15)
      {
        v16 = v15;
LABEL_14:
        if (a3)
        {
          v16 = objc_retainAutorelease(v16);
          *a3 = v16;
        }

        v11 = 0;
        goto LABEL_17;
      }
      v19 = 0;
      v17 = objc_msgSend(v14, "writeToURL:options:error:", v12, 0, &v19);
      v16 = v19;
      if ((v17 & 1) == 0)
        goto LABEL_14;

    }
    self->_needsInfoDictionaryUpdate = 0;
    v11 = 1;
    goto LABEL_17;
  }
  v11 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v8);
LABEL_18:

  return v11;
}

- (BOOL)deleteWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "removeItemAtURL:error:", self->_packageURL, a3);

  return (char)a3;
}

- (void)setPackageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)segmentEncoderMap
{
  return self->_segmentEncoderMap;
}

- (void)setSegmentEncoderMap:(id)a3
{
  objc_storeStrong((id *)&self->_segmentEncoderMap, a3);
}

- (void)setInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_infoDictionary, a3);
}

void __44__MSVSegmentedCodingPackage_writeWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", CFSTR("segments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("coder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v5, "stringByAppendingPathExtension:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasTopLevelData"))
  {
    objc_msgSend(v6, "encodedData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MSVGzipCompressData();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v16 + 40);
      objc_msgSend(v15, "writeToURL:options:error:", v13, 0, &obj);
      objc_storeStrong((id *)(v16 + 40), obj);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", CFSTR("segments"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", CFSTR("segments"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, v5);

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeItemAtURL:error:", v13, 0);

  }
}

+ (NSString)packageTypeIdentifier
{
  return (NSString *)CFSTR("com.apple.mediaservices.segmentedCoding");
}

@end
