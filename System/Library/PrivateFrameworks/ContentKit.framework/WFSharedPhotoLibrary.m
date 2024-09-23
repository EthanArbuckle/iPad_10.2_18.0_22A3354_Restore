@implementation WFSharedPhotoLibrary

- (WFSharedPhotoLibrary)init
{
  WFSharedPhotoLibrary *v2;
  WFSharedPhotoLibrary *v3;
  WFSharedPhotoLibrary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSharedPhotoLibrary;
  v2 = -[WFSharedPhotoLibrary init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)systemPhotoLibraryWithError:(id *)a3
{
  void (**v5)(_QWORD);
  PHPhotoLibrary *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  PHPhotoLibrary *v11;
  NSObject *v13;
  id v14;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFSharedPhotoLibrary_systemPhotoLibraryWithError___block_invoke;
  aBlock[3] = &unk_24C4E2198;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  v6 = self->_lock_systemPhotoLibrary;
  if (v6)
    goto LABEL_4;
  v7 = objc_alloc((Class)getPHPhotoLibraryClass());
  objc_msgSend(getPHPhotoLibraryClass(), "systemPhotoLibraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (PHPhotoLibrary *)objc_msgSend(v7, "initWithPhotoLibraryURL:", v8);

  v14 = 0;
  v9 = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](v6, "openAndWaitWithUpgrade:error:", 0, &v14);
  v10 = v14;
  if ((v9 & 1) != 0)
  {
    -[PHPhotoLibrary registerAvailabilityObserver:](v6, "registerAvailabilityObserver:", self);
    objc_storeStrong((id *)&self->_lock_systemPhotoLibrary, v6);

LABEL_4:
    v6 = v6;
    v11 = v6;
    goto LABEL_5;
  }
  getWFGeneralLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[WFSharedPhotoLibrary systemPhotoLibraryWithError:]";
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Unable to open system photo library: %@", buf, 0x16u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v10);

  v11 = 0;
LABEL_5:

  v5[2](v5);
  return v11;
}

- (id)fetchOptionsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[WFSharedPhotoLibrary systemPhotoLibraryWithError:](self, "systemPhotoLibraryWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  PHPhotoLibrary *v4;
  os_unfair_lock_s *p_lock;
  const __CFString *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (PHPhotoLibrary *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_systemPhotoLibrary == v4)
  {
    self->_lock_systemPhotoLibrary = 0;

    v6 = CFSTR("System");
  }
  else
  {
    v6 = CFSTR("Unknown");
  }
  getWFGeneralLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[WFSharedPhotoLibrary photoLibraryDidBecomeUnavailable:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s %@ photo library became unavailable", (uint8_t *)&v8, 0x16u);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_systemPhotoLibrary, 0);
}

void __52__WFSharedPhotoLibrary_systemPhotoLibraryWithError___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

+ (id)sharedLibrary
{
  if (sharedLibrary_onceToken != -1)
    dispatch_once(&sharedLibrary_onceToken, &__block_literal_global_6296);
  return (id)sharedLibrary_library;
}

uint64_t __37__WFSharedPhotoLibrary_sharedLibrary__block_invoke()
{
  WFSharedPhotoLibrary *v0;
  void *v1;

  v0 = objc_alloc_init(WFSharedPhotoLibrary);
  v1 = (void *)sharedLibrary_library;
  sharedLibrary_library = (uint64_t)v0;

  return objc_msgSend(getPHPhotoLibraryClass(), "enableMultiLibraryMode");
}

@end
