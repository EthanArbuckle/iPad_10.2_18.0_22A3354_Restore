@implementation BMDSLStreamPublisher

- (id)bpsPublisher
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v3 = +[BMDSLStreamPublisher streamTypeForDSLType:](BMDSLStreamPublisher, "streamTypeForDSLType:", -[BMDSLStreamPublisher streamType](self, "streamType"));
  objc_msgSend(MEMORY[0x1E0D01BA0], "currentProcessValidator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "passthrough") & 1) != 0)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BMDSLStreamPublisher bpsPublisher].cold.1(self, v5);

LABEL_6:
    -[BMDSLStreamPublisher storeStream](self, "storeStream");
    v8 = objc_claimAutoreleasedReturnValue();
    -[BMDSLStreamPublisher backingEvents](self, "backingEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[BMDSLStreamPublisher backingEvents](self, "backingEvents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bpsPublisher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BMDSLStreamPublisher bookmarkingTime](self, "bookmarkingTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[NSObject publisherFromStartTime:](v8, "publisherFromStartTime:", 0.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      -[BMDSLStreamPublisher bookmarkingTime](self, "bookmarkingTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMDSLStreamPublisher bookmarkingTime](self, "bookmarkingTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject publisherWithStartTime:endTime:maxEvents:lastN:reversed:](v8, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v10, v13, 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:
    v14 = BPSPipelineSupportsPullBasedPublishers();
    -[BMDSLStreamPublisher bookmark](self, "bookmark");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "applyBookmarkNode:", v15);

      v16 = v11;
    }
    else
    {
      objc_msgSend(v11, "withBookmark:", v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D01BA0], "currentProcessValidator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStreamTypeAllowed:", v3);

  if ((v7 & 1) != 0)
    goto LABEL_6;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[BMDSLStreamPublisher bpsPublisher].cold.2(self, v3, v8);
  v16 = 0;
LABEL_18:

  return v16;
}

- (NSNumber)bookmarkingTime
{
  return self->_bookmarkingTime;
}

- (BMBookmark)bookmark
{
  return self->_bookmark;
}

- (NSArray)backingEvents
{
  return self->_backingEvents;
}

- (id)storeStream
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSString *useCase;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  BMStoreStream *v23;
  void *v24;
  BMStoreStream *v25;
  BMStoreStream *v26;
  void *v27;
  void *v28;
  BMStoreStream *v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  NSString *v34;
  void *v35;
  int v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSString *v40;
  Class v41;
  void *v42;
  NSObject *v43;
  BMStoreStream *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t v48[16];
  uint8_t buf[16];

  v3 = (void *)objc_opt_class();
  -[BMDSLStreamPublisher identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLStreamPublisher basePath](self, "basePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isStreamInfoValidForIdentifier:basePath:streamType:", v4, v5, -[BMDSLStreamPublisher streamType](self, "streamType"));

  if (!(_DWORD)v3)
  {
LABEL_39:
    v25 = 0;
    return v25;
  }
  if (-[BMDSLStreamPublisher streamType](self, "streamType") == 2)
  {
    -[BMDSLStreamPublisher identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    BiomeLibraryAndInternalLibraryNode();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "streamWithIdentifier:error:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[BMDSLStreamPublisher identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasSuffix:", CFSTR(":subscriptions"));

      if (v12)
      {
        __biome_log_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18D810000, v13, OS_LOG_TYPE_DEFAULT, "Returning subscriptionStoreStreamForUseCase", buf, 2u);
        }

        if (self->_useCase)
          useCase = self->_useCase;
        else
          useCase = (NSString *)*MEMORY[0x1E0D01C98];
        objc_msgSend(v10, "subscriptionStoreStreamForUseCase:", useCase);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[BMDSLStreamPublisher identifier](self, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "hasSuffix:", CFSTR(":tombstones"));

        if (v32)
        {
          __biome_log_for_category();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v48 = 0;
            _os_log_impl(&dword_18D810000, v33, OS_LOG_TYPE_DEFAULT, "Returning tombstoneStoreStreamForUseCase", v48, 2u);
          }

          if (self->_useCase)
            v34 = self->_useCase;
          else
            v34 = (NSString *)*MEMORY[0x1E0D01C98];
          objc_msgSend(v10, "tombstoneStoreStreamForUseCase:", v34);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "configuration");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend((id)objc_msgSend(v35, "eventClass"), "isEqual:", -[BMDSLStreamPublisher eventDataClass](self, "eventDataClass"));

          if ((v36 & 1) == 0)
          {
            v38 = (void *)MEMORY[0x1E0D01D40];
            -[BMDSLStreamPublisher identifier](self, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "legacyClassNameForLibraryStream:", v39);
            v40 = (NSString *)objc_claimAutoreleasedReturnValue();

            if (!v40 || (v41 = NSClassFromString(v40)) == 0)
            {
              objc_msgSend(v10, "configuration");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (Class)objc_msgSend(v42, "eventClass");

              if (!v41)
              {
                __biome_log_for_category();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
                  -[BMDSLStreamPublisher storeStream].cold.3(self, v10, v43);

                v41 = 0;
              }
            }
            v44 = [BMStoreStream alloc];
            -[BMDSLStreamPublisher identifier](self, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "configuration");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "storeConfig");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[BMStoreStream initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:](v44, "initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:", v45, v47, v41);

            goto LABEL_34;
          }
          if (self->_useCase)
            v37 = self->_useCase;
          else
            v37 = (NSString *)*MEMORY[0x1E0D01C98];
          objc_msgSend(v10, "_storeStreamForUseCase:", v37);
          v15 = objc_claimAutoreleasedReturnValue();
        }
      }
      v25 = (BMStoreStream *)v15;
LABEL_34:

      goto LABEL_35;
    }

  }
  v16 = -[BMDSLStreamPublisher streamType](self, "streamType");
  if (v16 != 3)
  {
    if (v16 == 2)
    {
      v26 = [BMStoreStream alloc];
      -[BMDSLStreamPublisher identifier](self, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newRestrictedStreamDefaultConfigurationWithProtectionClass:", 3);
      v29 = -[BMStoreStream initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:](v26, "initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:", v27, v28, -[BMDSLStreamPublisher eventDataClass](self, "eventDataClass"));

      return v29;
    }
    if (v16 == 1)
    {
      v17 = (void *)MEMORY[0x1E0D01D20];
      -[BMDSLStreamPublisher identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "streamForStreamIdentifier:", v18);

      if (v19)
        return -[BMStoreStream initWithPublicStream:]([BMStoreStream alloc], "initWithPublicStream:", v19);
      __biome_log_for_category();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[BMDSLStreamPublisher storeStream].cold.2(self, v30);
    }
    else
    {
      __biome_log_for_category();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[BMDSLStreamPublisher storeStream].cold.1(self, v30);
    }

    goto LABEL_39;
  }
  v21 = (void *)MEMORY[0x1E0D024C0];
  -[BMDSLStreamPublisher basePath](self, "basePath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v21, "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v22);

  v23 = [BMStoreStream alloc];
  -[BMDSLStreamPublisher identifier](self, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[BMStoreStream initWithPrivateStreamIdentifier:storeConfig:eventDataClass:](v23, "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", v24, v8, -[BMDSLStreamPublisher eventDataClass](self, "eventDataClass"));

LABEL_35:
  return v25;
}

- (unint64_t)streamType
{
  return self->_streamType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (Class)eventDataClass
{
  return self->_eventDataClass;
}

- (NSString)basePath
{
  return self->_basePath;
}

+ (unint64_t)streamTypeForDSLType:(unint64_t)a3
{
  if (a3 >= 4)
    return 0;
  else
    return a3;
}

+ (BOOL)isStreamInfoValidForIdentifier:(id)a3 basePath:(id)a4 streamType:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isStreamTypeInValidRange:", a5) & 1) != 0)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isStreamIdentifierValid:", v7) & 1) != 0)
    {
      if (!v8 || a5 == 3)
      {
        if (!v8
          || (v12 = objc_msgSend(MEMORY[0x1E0D024C0], "streamTypeFromStorePath:", v8),
              v12 == objc_msgSend((id)objc_opt_class(), "streamTypeForDSLType:", a5)))
        {
          v10 = 1;
          goto LABEL_12;
        }
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:].cold.2();
      }
      else
      {
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:].cold.1();
      }
    }
    else
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:].cold.3();
    }
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:].cold.4();
  }

  v10 = 0;
LABEL_12:

  return v10;
}

+ (BOOL)isStreamTypeInValidRange:(unint64_t)a3
{
  return (a3 < 4) & (0xEu >> (a3 & 0xF));
}

+ (BOOL)isStreamIdentifierValid:(id)a3
{
  return BMIdentifierIsPathSafe();
}

+ (id)name
{
  return CFSTR("streamPublisher");
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4
{
  return -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](self, "initWithIdentifier:streamType:eventDataClass:", a3, a4, 0);
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 eventDataClass:(Class)a5
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](self, "initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:", 0, a3, CFSTR("streamPublisher"), 1, a4, 0, a5, *MEMORY[0x1E0D01C98]);
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 useCase:(id)a5
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](self, "initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:", 0, a3, CFSTR("streamPublisher"), 1, a4, 0, 0, a5);
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 useCase:(id)a5 eventDataClass:(Class)a6
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](self, "initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:", 0, a3, CFSTR("streamPublisher"), 1, a4, 0, a6, a5);
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 streamType:(unint64_t)a5
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](self, "initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:", a3, a4, CFSTR("streamPublisher"), 1, a5, 0, 0, *MEMORY[0x1E0D01C98]);
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 privateStreamBasePath:(id)a5
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:privateStreamBasePath:eventDataClass:](self, "initWithBookmark:identifier:privateStreamBasePath:eventDataClass:", a3, a4, a5, 0);
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 privateStreamBasePath:(id)a5 eventDataClass:(Class)a6
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](self, "initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:", a3, a4, CFSTR("streamPublisher"), 1, 3, a5, a6, *MEMORY[0x1E0D01C98]);
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6 streamType:(unint64_t)a7 basePath:(id)a8
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](self, "initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, 0, *MEMORY[0x1E0D01C98]);
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6 streamType:(unint64_t)a7 basePath:(id)a8 eventDataClass:(Class)a9 useCase:(id)a10
{
  id v17;
  id v18;
  BMDSLStreamPublisher *v19;
  BMDSLStreamPublisher *v20;
  NSObject *v21;
  id v23;
  id v24;
  objc_super v25;

  v23 = a3;
  v24 = a4;
  v17 = a8;
  v18 = a10;
  if (a6 != 1)
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:].cold.1(a6, v21);

    goto LABEL_8;
  }
  v25.receiver = self;
  v25.super_class = (Class)BMDSLStreamPublisher;
  v19 = -[BMDSLBaseCodable initWithName:version:](&v25, sel_initWithName_version_, a5, 1);
  self = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_bookmark, a3);
    objc_storeStrong((id *)&self->_identifier, a4);
    self->_streamType = a7;
    objc_storeStrong((id *)&self->_basePath, a8);
    objc_storeStrong((id *)&self->_eventDataClass, a9);
    objc_storeStrong((id *)&self->_useCase, a10);
    if (!objc_msgSend((id)objc_opt_class(), "isStreamInfoValidForIdentifier:basePath:streamType:", v24, v17, a7))
    {
LABEL_8:
      v20 = 0;
      goto LABEL_9;
    }
  }
  self = self;
  v20 = self;
LABEL_9:

  return v20;
}

- (BMDSLStreamPublisher)initWithPublisher:(id)a3 identifier:(id)a4 streamType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  BMDSLStreamPublisher *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__BMDSLStreamPublisher_initWithPublisher_identifier_streamType___block_invoke;
  v13[3] = &unk_1E2648228;
  v13[4] = &v14;
  v10 = (id)objc_msgSend(v8, "sinkWithBookmark:completion:receiveInput:", 0, v13, &__block_literal_global_18);
  v11 = -[BMDSLStreamPublisher initWithBookmark:identifier:streamType:](self, "initWithBookmark:identifier:streamType:", v15[5], v9, a5);
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __64__BMDSLStreamPublisher_initWithPublisher_identifier_streamType___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BMDSLStreamPublisher)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BMDSLStreamPublisher *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  uint64_t v18;
  NSString *v19;
  Class v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = CFSTR("streamIdentifier");
  v25[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMDSLValidateDictionary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("streamIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D20], "libraryPublicStreamMigrationPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("streamType"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13
      && (v14 = (void *)v13,
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("streamType")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v15,
          v14,
          (isKindOfClass & 1) != 0))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("streamType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");
    }
    else
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0D01D40], "legacyClassNameForLibraryStream:", v12);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v17 = v19;
        if (v19)
          v20 = NSClassFromString(v19);
        else
          v20 = 0;
        v18 = 1;
        goto LABEL_17;
      }
      BiomeLibraryAndInternalLibraryNode();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "streamWithIdentifier:error:", v10, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (Class)objc_msgSend(v22, "eventClass");

        v18 = 2;
LABEL_17:

        self = -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](self, "initWithIdentifier:streamType:eventDataClass:", v10, v18, v20);
        v9 = self;
        goto LABEL_18;
      }
      v18 = 0;
    }
    v20 = 0;
    goto LABEL_17;
  }
  v9 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v8);
LABEL_18:

  return v9;
}

- (id)initRestrictedStreamWithBookmark:(id)a3 identifier:(id)a4
{
  return -[BMDSLStreamPublisher initWithBookmark:identifier:streamType:](self, "initWithBookmark:identifier:streamType:", a3, a4, 2);
}

- (id)initRestrictedStreamWithPublisher:(id)a3 identifier:(id)a4
{
  return -[BMDSLStreamPublisher initWithPublisher:identifier:streamType:](self, "initWithPublisher:identifier:streamType:", a3, a4, 2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)upstreams
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMDSLStreamPublisher;
  -[BMDSLBaseCodable encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  -[BMDSLStreamPublisher bookmark](self, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BMDSLStreamPublisher bookmark](self, "bookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bookmark"));

  }
  -[BMDSLStreamPublisher identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("streamIdentifier"));

  -[BMDSLStreamPublisher basePath](self, "basePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMDSLStreamPublisher basePath](self, "basePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("basePath"));

  }
  if (-[BMDSLStreamPublisher eventDataClass](self, "eventDataClass"))
  {
    NSStringFromClass(-[BMDSLStreamPublisher eventDataClass](self, "eventDataClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("eventDataClass"));

  }
  -[BMDSLStreamPublisher useCase](self, "useCase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[BMDSLStreamPublisher useCase](self, "useCase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("useCase"));

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", -[BMDSLStreamPublisher streamType](self, "streamType"));
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("streamType"));

}

- (BMDSLStreamPublisher)initWithCoder:(id)a3
{
  id v4;
  BMDSLStreamPublisher *v5;
  BMDSLStreamPublisher *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BMDSLStreamPublisher *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMDSLStreamPublisher;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmark"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("basePath"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDataClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D01BA0], "currentProcessValidator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "eventClassForString:", v10);

    }
    else if (objc_msgSend(v8, "hasSuffix:", CFSTR(":subscriptions"))
           || objc_msgSend(v8, "hasSuffix:", CFSTR(":tombstones")))
    {
      v12 = objc_opt_class();
    }
    else
    {
      v14 = v9;
      BiomeLibraryAndInternalLibraryNode();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "streamWithIdentifier:error:", v8, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v17, "eventClass");

      if (!v12)
      {
        __biome_log_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[BMDSLStreamPublisher initWithCoder:].cold.1();

      }
      v9 = v14;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useCase"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    v21 = objc_msgSend(v9, "integerValue");
    v22 = (void *)v25;
    if (objc_msgSend((id)objc_opt_class(), "isStreamInfoValidForIdentifier:basePath:streamType:", v8, v25, v21))
    {
      -[BMDSLBaseCodable name](v6, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](v6, "initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:", v7, v8, v23, -[BMDSLBaseCodable version](v6, "version"), v21, v25, v12, v19);

      v22 = (void *)v25;
      v13 = v6;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setBackingEvents:(id)a3
{
  objc_storeStrong((id *)&self->_backingEvents, a3);
}

- (void)setBookmarkingTime:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkingTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkingTime, 0);
  objc_storeStrong((id *)&self->_backingEvents, 0);
  objc_storeStrong((id *)&self->_eventDataClass, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

- (void)initWithBookmark:(int)a1 identifier:(NSObject *)a2 name:version:streamType:basePath:eventDataClass:useCase:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLStreamPublisher", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_18D810000, v0, OS_LOG_TYPE_ERROR, "BMDSLStreamPublisher: Unable to determine data class for stream identifier: %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)storeStream
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)objc_msgSend(v7, "eventClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)objc_msgSend(a1, "eventDataClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_fault_impl(&dword_18D810000, a3, OS_LOG_TYPE_FAULT, "Failed to determine class in BMDSLStreamPublisher for restricted stream %@, stream.configuration.eventClass: %@, self.eventClass: %@", (uint8_t *)&v10, 0x20u);

}

- (void)bpsPublisher
{
  void *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  _os_log_error_impl(&dword_18D810000, a3, OS_LOG_TYPE_ERROR, "BMDSLStreamPublisher could not create a BPSPublisher for stream %@ because the stream type %@ is not allowed", v7, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_8(&dword_18D810000, v0, v1, "Base path not supported for non-private stream: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_0_9(&dword_18D810000, v1, (uint64_t)v1, "Path: %@ does not match stream type: %ld", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_8(&dword_18D810000, v0, v1, "Invalid stream identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_8(&dword_18D810000, v0, v1, "Invalid stream type: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
