@implementation _CRKImageLoader

+ (id)sharedInstance
{
  return (id)objc_msgSend(a1, "sharedInstanceWithInitialDelegate:", 0);
}

+ (id)sharedInstanceWithInitialDelegate:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53___CRKImageLoader_sharedInstanceWithInitialDelegate___block_invoke;
  block[3] = &unk_24DA4CCA0;
  v9 = v3;
  v4 = sharedInstanceWithInitialDelegate__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedInstanceWithInitialDelegate__onceToken, block);
  v6 = (id)sharedInstanceWithInitialDelegate__sImageLoader;

  return v6;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[_CRKImageLoader _registerWithSearchFoundation](self, "_registerWithSearchFoundation");
    else
      -[_CRKImageLoader _unregisterWithSearchFoundaton](self, "_unregisterWithSearchFoundaton");
  }
}

- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  void *v10;
  UIImage *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  INUIImageLoader *v30;
  INUIImageLoader *imageLoader;
  void *v33;
  _QWORD v34[4];
  void (**v35)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_CRKImageLoader resourceIdentifierForLocalImageType:](self, "resourceIdentifierForLocalImageType:", objc_msgSend(v6, "localImageType"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v10, 0);
        v11 = (UIImage *)objc_claimAutoreleasedReturnValue();

        UIImagePNGRepresentation(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE84E60], "imageWithData:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v13, 0);

LABEL_9:
        v14 = 1;
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BE154D8], "errorWithCode:description:", 203, CFSTR("SFLocalImage missing resourceIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
        -[_CRKImageLoader loadImage:withCompletionHandler:].cold.1();
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v20);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v6;
        objc_msgSend(v8, "urlValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scheme");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("http"));

        objc_msgSend(v8, "urlValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x24BDD9DA8], "imageWithURL:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          v14 = v21 != 0;
          if (v21)
          {
            v23 = v21;
            objc_msgSend(v23, "_imageData");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(MEMORY[0x24BE84E60], "imageWithData:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v7[2](v7, v25, 0);

            }
            else
            {
              if (!self->_imageLoader)
              {
                objc_msgSend(MEMORY[0x24BDDA500], "registeredImageLoaderWithScreenDelegate");
                v30 = (INUIImageLoader *)objc_claimAutoreleasedReturnValue();
                imageLoader = self->_imageLoader;
                self->_imageLoader = v30;

              }
              v34[0] = MEMORY[0x24BDAC760];
              v34[1] = 3221225472;
              v34[2] = __51___CRKImageLoader_loadImage_withCompletionHandler___block_invoke;
              v34[3] = &unk_24DA4D2B8;
              v35 = v7;
              objc_msgSend(v23, "_retrieveImageDataWithReply:", v34);

            }
          }
          else
          {
            v33 = (void *)MEMORY[0x24BE154D8];
            v26 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v8, "urlValue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "scheme");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("_CRKImageLoader doesn't support loading this URL scheme: %@"), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "errorWithCode:description:", 202, v29);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
              -[_CRKImageLoader loadImage:withCompletionHandler:].cold.1();
            ((void (**)(id, void *, void *))v7)[2](v7, 0, v24);
          }

          goto LABEL_26;
        }
        -[_CRKImageLoader _loadSFImageForURL:completion:](self, "_loadSFImageForURL:completion:", v12, v7);
        goto LABEL_9;
      }
      v18 = (void *)MEMORY[0x24BE154D8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_CRKImageLoader doesn't support loading this class: %@"), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithCode:description:", 201, v19);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
        -[_CRKImageLoader loadImage:withCompletionHandler:].cold.1();
    }
    v14 = 0;
    goto LABEL_26;
  }
  v14 = 0;
LABEL_27:

  return v14;
}

- (void)_loadSFImageForURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimeoutInterval:", 4.0);
      objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __49___CRKImageLoader__loadSFImageForURL_completion___block_invoke;
      v13 = &unk_24DA4D2E0;
      v14 = v5;
      v15 = v6;
      objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v7, &v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "resume", v10, v11, v12, v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE154D8], "errorWithCode:description:", 204, CFSTR("Attempted to fetch SFImage using nil URL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
        -[_CRKImageLoader loadImage:withCompletionHandler:].cold.1();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v7);
    }

  }
}

- (id)resourceIdentifierForLocalImageType:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_24DA4D300[a3];
}

- (_CRKImageLoaderDelegate)delegate
{
  return (_CRKImageLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageLoader, 0);
}

- (void)loadImage:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218FCB000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
