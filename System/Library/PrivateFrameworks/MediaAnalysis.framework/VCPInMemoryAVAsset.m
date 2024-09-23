@implementation VCPInMemoryAVAsset

- (VCPInMemoryAVAsset)initWithData:(id)a3
{
  id v5;
  void *v6;
  VCPInMemoryAVAsset *v7;
  dispatch_queue_t v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("mediaanalysis://in-memory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)VCPInMemoryAVAsset;
  v7 = -[VCPInMemoryAVAsset initWithURL:options:](&v11, sel_initWithURL_options_, v6, 0);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    v8 = dispatch_queue_create("com.apple.mediaanalysisd.VCPInMemoryAVAsset", 0);
    -[VCPInMemoryAVAsset resourceLoader](v7, "resourceLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:queue:", v7, v8);

  }
  return v7;
}

+ (id)assetWithData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v3);

  return v4;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  NSData **p_data;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[5];
  uint8_t v22[4];
  void *v23;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  NSData *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "contentInformationRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setContentType:", *MEMORY[0x1E0C8A2E0]);
    objc_msgSend(v9, "setContentLength:", -[NSData length](self->_data, "length"));
    objc_msgSend(v9, "setByteRangeAccessSupported:", 1);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  Fullfilled content request: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  objc_msgSend(v7, "dataRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_14;
  v11 = (void *)MEMORY[0x1BCCA1B2C]();
  if ((objc_msgSend(v10, "requestedOffset") & 0x8000000000000000) == 0
    && (objc_msgSend(v10, "requestedLength") & 0x8000000000000000) == 0)
  {
    v12 = objc_msgSend(v10, "requestedOffset");
    v13 = objc_msgSend(v10, "requestedLength");
    if (v13 + v12 <= -[NSData length](self->_data, "length"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__44;
      v27 = __Block_byref_object_dispose__44;
      p_data = &self->_data;
      v28 = self->_data;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__VCPInMemoryAVAsset_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
      aBlock[3] = &unk_1E6B1A5A8;
      aBlock[4] = &buf;
      v16 = _Block_copy(aBlock);
      v17 = -[NSData bytes](*p_data, "bytes");
      v18 = objc_msgSend(v10, "requestedOffset");
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v17 + v18, objc_msgSend(v10, "requestedLength"), v16);
      objc_msgSend(v10, "respondWithData:", v19);

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v22 = 138412290;
        v23 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  Fullfilled data request: %@", v22, 0xCu);
      }

      _Block_object_dispose(&buf, 8);
      objc_autoreleasePoolPop(v11);
LABEL_14:
      objc_msgSend(v7, "finishLoading");
      v14 = 1;
      goto LABEL_15;
    }
  }
  objc_autoreleasePoolPop(v11);
  v14 = 0;
LABEL_15:

  return v14;
}

void __77__VCPInMemoryAVAsset_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
