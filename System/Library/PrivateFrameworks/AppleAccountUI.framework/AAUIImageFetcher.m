@implementation AAUIImageFetcher

+ (id)sharedImageFetcher
{
  if (sharedImageFetcher_onceToken != -1)
    dispatch_once(&sharedImageFetcher_onceToken, &__block_literal_global_13);
  return (id)sharedImageFetcher_s_instance;
}

void __38__AAUIImageFetcher_sharedImageFetcher__block_invoke()
{
  AAUIImageFetcher *v0;
  void *v1;

  v0 = objc_alloc_init(AAUIImageFetcher);
  v1 = (void *)sharedImageFetcher_s_instance;
  sharedImageFetcher_s_instance = (uint64_t)v0;

}

- (void)fetchImageAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  id v19;
  uint64_t v20;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3BF8];
  v8 = a3;
  objc_msgSend(v7, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  -[AAUIImageFetcher _urlSession](self, "_urlSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke;
  v18 = &unk_1EA2DC988;
  v20 = v11;
  v19 = v6;
  v13 = v6;
  objc_msgSend(v12, "dataTaskWithURL:completionHandler:", v8, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "resume", v15, v16, v17, v18);
}

void __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = 0;
  if (v7 && !v9)
  {
    if (objc_msgSend(v8, "statusCode") == 200)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:scale:", v7, *(double *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke_2;
    block[3] = &unk_1EA2DB500;
    v14 = *(id *)(a1 + 32);
    v12 = v10;
    v13 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_urlSession
{
  NSURLSession *urlSession;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSURLSession *v8;
  NSURLSession *v9;

  urlSession = self->_urlSession;
  if (!urlSession)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("com.apple.icloud"));
    objc_msgSend(v4, "set_appleIDContext:", v5);

    v6 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CFABD8], "sharedPinner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionWithConfiguration:delegate:delegateQueue:", v4, v7, 0);
    v8 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v9 = self->_urlSession;
    self->_urlSession = v8;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end
