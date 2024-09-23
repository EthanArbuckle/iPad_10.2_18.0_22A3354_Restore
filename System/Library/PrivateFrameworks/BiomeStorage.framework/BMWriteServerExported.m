@implementation BMWriteServerExported

- (BMWriteServerExported)initWithProcess:(id)a3 accessControlPolicy:(id)a4
{
  id v7;
  id v8;
  BMWriteServerExported *v9;
  BMWriteServerExported *v10;
  uint64_t v11;
  NSMutableDictionary *writerCache;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMWriteServerExported;
  v9 = -[BMWriteServerExported init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_process, a3);
    objc_storeStrong((id *)&v10->_policy, a4);
    v11 = objc_opt_new();
    writerCache = v10->_writerCache;
    v10->_writerCache = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (id)checkEntitlementsAndReturnWriterForStreamIdentifier:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (*v14)(void);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BMStreamDatastoreWriter *v19;
  BMStreamDatastoreWriter *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v6 = *(_QWORD *)&a4;
  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMWriteServer.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("streamIdentifier"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMWriteServer.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError"));

LABEL_3:
  v10 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tupleWithFirst:second:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_writerCache, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if ((-[BMAccessControlPolicy allowsAccessToWriteServiceForStream:ofUser:](self->_policy, "allowsAccessToWriteServiceForStream:ofUser:", v9, v6) & 1) != 0)
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v14 = (void (*)(void))getBiomeLibraryNodeSymbolLoc_ptr;
      v32 = getBiomeLibraryNodeSymbolLoc_ptr;
      if (!getBiomeLibraryNodeSymbolLoc_ptr)
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __getBiomeLibraryNodeSymbolLoc_block_invoke;
        v28[3] = &unk_1E5565DA8;
        v28[4] = &v29;
        __getBiomeLibraryNodeSymbolLoc_block_invoke((uint64_t)v28);
        v14 = (void (*)(void))v30[3];
      }
      _Block_object_dispose(&v29, 8);
      if (!v14)
        -[BMWriteServerExported checkEntitlementsAndReturnWriterForStreamIdentifier:user:error:].cold.1();
      v14();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "streamWithIdentifier:error:", v9, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v13 = 0;
        goto LABEL_12;
      }
      v17 = (id)objc_msgSend(v16, "valueForKeyPath:", CFSTR("configuration.eventClass"));
      objc_msgSend(v16, "valueForKeyPath:", CFSTR("configuration.storeConfig"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BMStreamDatastoreWriter initWithStream:config:eventDataClass:]([BMStreamDatastoreWriter alloc], "initWithStream:config:eventDataClass:", v9, v18, v17);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_writerCache, "setObject:forKeyedSubscript:", v19, v12);
      v20 = v19;

      v13 = v20;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      -[BMAccessControlPolicy descriptionOfProcessAndUseCase](self->_policy, "descriptionOfProcessAndUseCase");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      BMAccessModePrintableDescription();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ is not entitled for '%@' access to '%@'"), v22, v23, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v20 = (BMStreamDatastoreWriter *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D01C60], 5, v20);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_12:
  }

  return v13;
}

- (void)writeData:(id)a3 version:(unsigned int)a4 timestamp:(double)a5 toStream:(id)a6 asUser:(unsigned int)a7 reply:(id)a8
{
  uint64_t v9;
  uint64_t v12;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t v26[16];
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v9 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = (void (**)(id, void *))a8;
  v17 = (void *)MEMORY[0x1AF4163D4]();
  v27 = 0;
  -[BMWriteServerExported checkEntitlementsAndReturnWriterForStreamIdentifier:user:error:](self, "checkEntitlementsAndReturnWriterForStreamIdentifier:user:error:", v15, v9, &v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v27;
  v20 = v19;
  if (v18)
  {
    if ((objc_msgSend(v18, "_writeEventData:dataVersion:timestamp:outBookmark:", v14, v12, 0, a5) & 1) != 0)
    {
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1A95BD000, v21, OS_LOG_TYPE_INFO, "BMWriteServer write succeeded", v26, 2u);
      }
      v22 = 0;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D01C60];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Write failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 0, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v22;
    }
    v23 = v20;

    v20 = (void *)v22;
  }
  else
  {
    v23 = v19;
  }
  v16[2](v16, v20);

  objc_autoreleasePoolPop(v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_writerCache, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (void)checkEntitlementsAndReturnWriterForStreamIdentifier:user:error:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<_BMLibraryBaseProtocol> _BiomeLibraryNode(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMWriteServer.m"), 23, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
