@implementation ASCArtworkFetcher

+ (ASCArtworkFetcher)sharedFetcher
{
  if (sharedFetcher_onceToken != -1)
    dispatch_once(&sharedFetcher_onceToken, &__block_literal_global_4);
  return (ASCArtworkFetcher *)(id)sharedFetcher_sharedFetcher;
}

void __34__ASCArtworkFetcher_sharedFetcher__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  ASCArtworkFetcher *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestCachePolicy:", 2);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  v3 = v2;

  v4 = -[ASCArtworkFetcher initWithURLSession:scale:]([ASCArtworkFetcher alloc], "initWithURLSession:scale:", v0, v3);
  v5 = (void *)sharedFetcher_sharedFetcher;
  sharedFetcher_sharedFetcher = (uint64_t)v4;

}

- (ASCArtworkFetcher)initWithURLSession:(id)a3 scale:(double)a4
{
  id v7;
  ASCArtworkFetcher *v8;
  ASCArtworkFetcher *v9;
  ASCTaskCoordinator *v10;
  ASCTaskCoordinator *fetchCoordinator;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASCArtworkFetcher;
  v8 = -[ASCArtworkFetcher init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_urlSession, a3);
    v9->_scale = a4;
    v10 = -[ASCTaskCoordinator initWithName:]([ASCTaskCoordinator alloc], "initWithName:", CFSTR("ASCArtworkFetcher"));
    fetchCoordinator = v9->_fetchCoordinator;
    v9->_fetchCoordinator = v10;

  }
  return v9;
}

- (id)URLWithContentsOfArtwork:(id)a3 preferredSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  _QWORD v29[5];

  height = a4.height;
  width = a4.width;
  v29[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "preferredCrop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "width");
  v10 = v9;
  objc_msgSend(v7, "height");
  v12 = ASCArtworkCropScaleSizeToFit(v8, width, height, v10, v11);
  v14 = v13;

  -[ASCArtworkFetcher scale](self, "scale");
  v16 = v12 * v15;
  -[ASCArtworkFetcher scale](self, "scale");
  v18 = v14 * v17;
  v28[0] = CFSTR("{w}");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  v28[1] = CFSTR("{h}");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v22;
  v28[2] = CFSTR("{c}");
  objc_msgSend(v7, "preferredCrop");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v23;
  v28[3] = CFSTR("{f}");
  objc_msgSend(v7, "preferredFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeURLWithSubstitutions:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)dataWithContentsOfURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0CFDBB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[ASCArtworkFetcher urlSession](self, "urlSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__ASCArtworkFetcher_dataWithContentsOfURL___block_invoke;
  v12[3] = &unk_1E7560740;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "dataTaskWithURL:completionHandler:", v5, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resume");
  v10 = v8;

  return v10;
}

void __43__ASCArtworkFetcher_dataWithContentsOfURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == -999)
      {
        objc_msgSend(*(id *)(a1 + 32), "cancel");
        goto LABEL_7;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v9, v6);
  }
LABEL_7:

}

- (id)imageWithContentsOfURL:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v4 = a3;
  -[ASCArtworkFetcher scale](self, "scale");
  v6 = v5;
  -[ASCArtworkFetcher dataWithContentsOfURL:](self, "dataWithContentsOfURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__ASCArtworkFetcher_imageWithContentsOfURL___block_invoke;
  v11[3] = &unk_1E7560768;
  v13 = v6;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __44__ASCArtworkFetcher_imageWithContentsOfURL___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DC3870];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:scale:", v4, *(double *)(a1 + 40));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Response for %@ could not be decoded"), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ASCArtworkErrorDomain"), 2, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithError:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)imageForContentsOfArtwork:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  height = a4.height;
  width = a4.width;
  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (width <= 2.22044605e-16 || height <= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid artwork size {%f, %f}"), *(_QWORD *)&width, *(_QWORD *)&height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ASCArtworkErrorDomain"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CFDBB8], "promiseWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v7, "embeddedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[ASCArtworkFetcher URLWithContentsOfArtwork:preferredSize:](self, "URLWithContentsOfArtwork:preferredSize:", v8, width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[ASCArtworkFetcher fetchCoordinator](self, "fetchCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __56__ASCArtworkFetcher_imageForContentsOfArtwork_withSize___block_invoke;
      v20[3] = &unk_1E7560790;
      v20[4] = self;
      v21 = v13;
      objc_msgSend(v15, "taskForKey:withCreatorBlock:", v21, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not derive URL for %@"), v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ASCArtworkErrorDomain"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CFDBB8], "promiseWithError:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CFDBB8], "promiseWithResult:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v14;
}

uint64_t __56__ASCArtworkFetcher_imageForContentsOfArtwork_withSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageWithContentsOfURL:", *(_QWORD *)(a1 + 40));
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (double)scale
{
  return self->_scale;
}

- (ASCTaskCoordinator)fetchCoordinator
{
  return self->_fetchCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchCoordinator, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end
