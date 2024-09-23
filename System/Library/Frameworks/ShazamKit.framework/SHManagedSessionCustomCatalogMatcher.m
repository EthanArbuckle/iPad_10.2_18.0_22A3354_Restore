@implementation SHManagedSessionCustomCatalogMatcher

- (SHManagedSessionCustomCatalogMatcher)initWithCustomCatalog:(id)a3
{
  id v4;
  SHManagedSessionCustomCatalogMatcher *v5;
  uint64_t v6;
  SHMatcher *customCatalogMatcher;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHManagedSessionCustomCatalogMatcher;
  v5 = -[SHManagedSessionCustomCatalogMatcher init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_createMatcher");
    v6 = objc_claimAutoreleasedReturnValue();
    customCatalogMatcher = v5->_customCatalogMatcher;
    v5->_customCatalogMatcher = (SHMatcher *)v6;

    -[SHMatcher setDelegate:](v5->_customCatalogMatcher, "setDelegate:", v5);
  }

  return v5;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *currentRequestID;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "requestID");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  currentRequestID = self->_currentRequestID;
  self->_currentRequestID = v5;

  -[SHManagedSessionCustomCatalogMatcher customCatalogMatcher](self, "customCatalogMatcher");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startRecognitionForRequest:", v4);

}

- (void)stopRecognition
{
  id v2;

  -[SHManagedSessionCustomCatalogMatcher customCatalogMatcher](self, "customCatalogMatcher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRecognition");

}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHManagedSessionCustomCatalogMatcher customCatalogMatcher](self, "customCatalogMatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopRecognitionForRequestID:", v4);

}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6;
  id v7;
  SHMatcherResponse *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SHMatcherResponse *v20;

  v6 = a4;
  v7 = a3;
  v8 = [SHMatcherResponse alloc];
  objc_msgSend(v6, "recordingIntermission");
  v10 = v9;
  objc_msgSend(v6, "recordingSignatureOffset");
  v12 = v11;
  objc_msgSend(v6, "retrySeconds");
  v14 = v13;
  objc_msgSend(v6, "match");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHManagedSessionCustomCatalogMatcher currentRequestID](self, "currentRequestID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:](v8, "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:", v15, v16, v17, v18, v10, v12, v14);
  -[SHManagedSessionCustomCatalogMatcher delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "matcher:didProduceResponse:", v7, v20);

}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHMatcher)customCatalogMatcher
{
  return self->_customCatalogMatcher;
}

- (NSUUID)currentRequestID
{
  return self->_currentRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequestID, 0);
  objc_storeStrong((id *)&self->_customCatalogMatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
