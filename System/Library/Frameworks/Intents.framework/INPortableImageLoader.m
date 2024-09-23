@implementation INPortableImageLoader

- (NSString)serviceIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__INPortableImageLoader_serviceIdentifier__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  if (serviceIdentifier_onceToken_76882 != -1)
    dispatch_once(&serviceIdentifier_onceToken_76882, block);
  return (NSString *)(id)serviceIdentifier_sServiceIdentifier_76883;
}

- (unint64_t)servicePriority
{
  return 50;
}

void __42__INPortableImageLoader_serviceIdentifier__block_invoke()
{
  objc_class *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (objc_class *)objc_opt_class();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.%@"), v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)serviceIdentifier_sServiceIdentifier_76883;
  serviceIdentifier_sServiceIdentifier_76883 = v4;

}

- (INPortableImageLoaderHelping)helper
{
  INPortableImageLoaderHelping *helper;
  void *v4;
  objc_class *v5;
  INPortableImageLoaderHelping *v6;
  INPortableImageLoaderHelping *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  helper = self->_helper;
  if (!helper)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getINUIPortableImageLoaderHelperClass_softClass;
    v13 = getINUIPortableImageLoaderHelperClass_softClass;
    if (!getINUIPortableImageLoaderHelperClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getINUIPortableImageLoaderHelperClass_block_invoke;
      v9[3] = &unk_1E22953C0;
      v9[4] = &v10;
      __getINUIPortableImageLoaderHelperClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (INPortableImageLoaderHelping *)objc_alloc_init(v5);
    v7 = self->_helper;
    self->_helper = v6;

    helper = self->_helper;
  }
  return helper;
}

- (id)_helperClassName
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  -[INPortableImageLoader helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[INPortableImageLoader helper](self, "helper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)loadImageDataFromImage:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = INSiriLogContextIntents;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[INPortableImageLoader loadImageDataFromImage:accessSpecifier:completion:]";
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Attempting intrinsic loading strategy for image: %@", buf, 0x16u);
      }
      -[INPortableImageLoader helper](self, "helper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v9;
      if (!v9)
      {
        +[INHelperServiceAccessSpecifier accessSpecifierAppropriateForCurrentProcess](INHelperServiceAccessSpecifier, "accessSpecifierAppropriateForCurrentProcess");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __75__INPortableImageLoader_loadImageDataFromImage_accessSpecifier_completion___block_invoke;
      v17[3] = &unk_1E228FD70;
      v18 = v10;
      -[__CFString _loadImageDataAndSizeWithHelper:accessSpecifier:completion:](v8, "_loadImageDataAndSizeWithHelper:accessSpecifier:completion:", v12, v13, v17);
      if (!v9)

      v14 = v18;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[INPortableImageLoader loadImageDataFromImage:accessSpecifier:completion:]";
        v23 = 2112;
        v24 = CFSTR("The INImage provided to INPortableImageLoader:loadImageDataFromImage is nil");
        _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2938];
      v20 = CFSTR("The INImage provided to INPortableImageLoader:loadImageDataFromImage is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6000, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

    }
  }

}

- (void)filePathForImage:(id)a3 completion:(id)a4
{
  __CFString *v5;
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (v6)
  {
    v7 = INSiriLogContextIntents;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[INPortableImageLoader filePathForImage:completion:]";
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s Attempting to grab file path for image: %@", buf, 0x16u);
      }
      -[__CFString _retrieveFilePathWithCompletion:](v5, "_retrieveFilePathWithCompletion:", v6);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[INPortableImageLoader filePathForImage:completion:]";
        v15 = 2112;
        v16 = CFSTR("The INImage provided to INPortableImageLoader:filePathForImage is nil");
        _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2938];
      v12 = CFSTR("The INImage provided to INPortableImageLoader:filePathForImage is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6000, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v10);

    }
  }

}

- (BOOL)canLoadImageDataForImage:(id)a3
{
  return a3 != 0;
}

- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6
{
  if (a4)
    objc_msgSend(a4, "loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:", a3, 0, a6, a5.var0, a5.var1);
  else
    -[INPortableImageLoader loadImageDataFromImage:accessSpecifier:completion:](self, "loadImageDataFromImage:accessSpecifier:completion:", a3, 0, a6, a5.var0, a5.var1);
}

- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (v8)
  {
    objc_msgSend(v8, "filePathForImage:usingPortableImageLoader:completion:", v7, 0, v9);
  }
  else
  {
    v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[INPortableImageLoader filePathForImage:usingPortableImageLoader:completion:]";
      v18 = 2112;
      v19 = CFSTR("The INPortableImageLoader provided to filePathForImage:usingPortableImageLoader:completion: is nil");
      _os_log_error_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2938];
    v15 = CFSTR("The INPortableImageLoader provided to filePathForImage:usingPortableImageLoader:completion: is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6000, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);

  }
}

- (INPortableImageLoader)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INPortableImageLoader;
  return -[INPortableImageLoader init](&v4, sel_init, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
}

void __75__INPortableImageLoader_loadImageDataFromImage_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  id v10;

  if (!a2 || a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[INImage imageWithImageData:](INImage, "imageWithImageData:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setImageSize:", a5, a6);
    objc_msgSend(v10, "_setRenderingMode:", a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
