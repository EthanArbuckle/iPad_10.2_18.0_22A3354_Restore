@implementation INUIImageLoader

- (void)registerWithIntents
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CBD968], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerImageService:", self);

}

- (void)deregisterWithIntents
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CBD968], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterImageService:", self);

}

- (void)dealloc
{
  objc_super v3;

  -[INUIImageLoader deregisterWithIntents](self, "deregisterWithIntents");
  -[INUIImageLoader deregisterWithSearchFoundation](self, "deregisterWithSearchFoundation");
  v3.receiver = self;
  v3.super_class = (Class)INUIImageLoader;
  -[INUIImageLoader dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  INUIImageLoaderDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  LOBYTE(self) = -[INUIImageLoader loadImage:withContext:completionHandler:](self, "loadImage:withContext:completionHandler:", v7, v8, v6);

  return (char)self;
}

- (BOOL)loadImage:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v23[4];
  void (**v24)(id, void *, _QWORD);
  _QWORD v25[4];
  void (**v26)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "intentsImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "_imageData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_uri");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0D8C418], "imageWithData:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v14, 0);
      }
      else
      {
        if (!v12 || !objc_msgSend(v12, "isFileURL"))
        {
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke_2;
          v23[3] = &unk_1EA43A488;
          v24 = v7;
          objc_msgSend(v10, "_retrieveImageDataWithReply:", v23);

          goto LABEL_15;
        }
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C8A0]), "initWithFacade:", v8);
        objc_msgSend(v14, "setType:", 52);
        v16 = objc_alloc_init(MEMORY[0x1E0D8C8B0]);
        v17 = objc_alloc_init(MEMORY[0x1E0D8C8A8]);
        objc_msgSend(v13, "absoluteString");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = &stru_1EA43AE30;
        objc_msgSend(v17, "setAddress:", v20);

        objc_msgSend(v16, "setUrlValue:", v17);
        objc_msgSend(v14, "setUrlImage:", v16);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C418]), "initWithProtobuf:", v14);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke;
        v25[3] = &unk_1EA43A460;
        v26 = v7;
        objc_msgSend(v21, "loadImageDataWithCompletionAndErrorHandler:", v25);

      }
LABEL_15:

      v15 = 1;
      goto LABEL_16;
    }
    v15 = 0;
  }
  else
  {
    v15 = 0;
    v10 = 0;
    v8 = 0;
  }
LABEL_16:

  return v15;
}

- (NSString)serviceIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__INUIImageLoader_serviceIdentifier__block_invoke;
  block[3] = &unk_1EA43A918;
  block[4] = self;
  if (serviceIdentifier_onceToken != -1)
    dispatch_once(&serviceIdentifier_onceToken, block);
  return (NSString *)(id)serviceIdentifier_sServiceIdentifier;
}

- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_t *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t *p_align;
  uint64_t v26;
  uint32_t *v27;
  INUIImageLoader *v28;
  INUIImageLoader *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  id v41;
  _QWORD v42[4];
  id v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  const __CFString *v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  INUIImageLoader *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  var1 = a5.var1;
  var0 = a5.var0;
  v62 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v13)
    goto LABEL_27;
  if (!v12)
    v12 = objc_alloc_init(MEMORY[0x1E0CBDA88]);
  objc_msgSend(v12, "helper");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (os_log_t *)MEMORY[0x1E0CBD670];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[INUIImageLoader delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "traitCollectionForImageLoader:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setTraitCollection:](v14, "setTraitCollection:", v17);

  }
  else
  {

    v18 = *v15;
    if (!os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v14 = v18;
    objc_msgSend(v12, "helper");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v52 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]";
    v53 = 2112;
    v54 = (id)objc_opt_class();
    v39 = v54;
    _os_log_error_impl(&dword_1DC055000, v14, OS_LOG_TYPE_ERROR, "%s The helper on INPortableImageLoader was of an expected class (expected INUIPortableImageLoaderHelper, got %@)", buf, 0x16u);

  }
LABEL_9:
  v41 = v12;
  objc_msgSend(MEMORY[0x1E0CBD968], "sharedInstance", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageLoaders");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    p_align = &stru_1EA43DFE8.align;
LABEL_11:
    v26 = 0;
    v27 = p_align;
    while (1)
    {
      if (*(_QWORD *)v46 != v24)
        objc_enumerationMutation(v21);
      v28 = *(INUIImageLoader **)(*((_QWORD *)&v45 + 1) + 8 * v26);
      if (((objc_opt_respondsToSelector() & 1) == 0
         || -[INUIImageLoader canLoadImageDataForImage:](v28, "canLoadImageDataForImage:", v11))
        && (objc_opt_respondsToSelector() & 1) != 0
        && v28 != self)
      {
        break;
      }
      if (v23 == ++v26)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
        p_align = v27;
        if (v23)
          goto LABEL_11;
        goto LABEL_20;
      }
    }
    v29 = v28;

    if (!v29)
      goto LABEL_25;
    v30 = (void *)*MEMORY[0x1E0CBD670];
    v13 = v40;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      v32 = v30;
      objc_msgSend(v31, "numberWithDouble:", var0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v52 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]";
      v53 = 2112;
      v54 = v29;
      v55 = 2112;
      v56 = self;
      v57 = 2112;
      v58 = v33;
      v59 = 2112;
      v60 = v34;
      _os_log_impl(&dword_1DC055000, v32, OS_LOG_TYPE_INFO, "%s Found preferred image loader %@ for image %@, attempting load at size {%@, %@}", buf, 0x34u);

    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __89__INUIImageLoader_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke;
    v42[3] = &unk_1EA43A4B0;
    v44 = v40;
    v43 = v11;
    v12 = v41;
    -[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:](v29, "loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:", v43, v41, v42, var0, var1);

    v35 = v44;
  }
  else
  {
LABEL_20:

LABEL_25:
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CBD458];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("No preferred image loader available for image: %@");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v29 = (INUIImageLoader *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 6001, v29);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v40;
    ((void (**)(_QWORD, _QWORD, void *))v40)[2](v40, 0, v35);
    v12 = v41;
  }

LABEL_27:
}

- (BOOL)canLoadImageDataForImage:(id)a3
{
  return a3 != 0;
}

- (unint64_t)servicePriority
{
  return 76;
}

- (INUIImageLoaderDelegate)delegate
{
  return (INUIImageLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __89__INUIImageLoader_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "_imageSize");
      v9 = v8;
      v11 = v10;
      v12 = (void *)*MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        v13 = (void *)MEMORY[0x1E0CB37E8];
        v14 = v12;
        objc_msgSend(v13, "numberWithDouble:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        v20 = 136316162;
        v21 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]_block_invoke";
        v22 = 2112;
        v23 = v5;
        v24 = 2112;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        v28 = 2112;
        v29 = v17;
        _os_log_impl(&dword_1DC055000, v14, OS_LOG_TYPE_INFO, "%s Loaded data image %@ of size {%@, %@} from input image %@", (uint8_t *)&v20, 0x34u);

      }
    }
    else
    {
      v18 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v19 = *(void **)(a1 + 32);
        v20 = 136315394;
        v21 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]_block_invoke";
        v22 = 2112;
        v23 = v19;
        _os_log_error_impl(&dword_1DC055000, v18, OS_LOG_TYPE_ERROR, "%s No image was loaded for input image %@", (uint8_t *)&v20, 0x16u);
      }
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

void __36__INUIImageLoader_serviceIdentifier__block_invoke()
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
  v5 = (void *)serviceIdentifier_sServiceIdentifier;
  serviceIdentifier_sServiceIdentifier = v4;

}

void __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D8C418];
    v6 = a3;
    objc_msgSend(v5, "imageWithData:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

void __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D8C418];
    v6 = a3;
    objc_msgSend(a2, "_imageData");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithData:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v7, v6);

  }
}

+ (id)registeredImageLoaderWithScreenDelegate
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "registerWithIntents");
  objc_msgSend(v2, "registerWithSearchFoundation");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", v3);

  return v2;
}

@end
