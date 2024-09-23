@implementation SHMediaTimelineCustomCatalogMatcher

- (void)dealloc
{
  objc_super v3;

  -[SHMediaTimelineCustomCatalogMatcher stopRecognition](self, "stopRecognition");
  v3.receiver = self;
  v3.super_class = (Class)SHMediaTimelineCustomCatalogMatcher;
  -[SHMediaTimelineCustomCatalogMatcher dealloc](&v3, sel_dealloc);
}

- (SHMediaTimelineCustomCatalogMatcher)initWithCustomCatalog:(id)a3
{
  id v4;
  SHMediaTimelineCustomCatalogMatcher *v5;
  SHCustomCatalogMatcher *v6;
  SHCustomCatalogMatcher *customCatalogMatcher;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaTimelineCustomCatalogMatcher;
  v5 = -[SHMediaTimelineCustomCatalogMatcher init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SHCustomCatalogMatcher initWithCustomCatalog:]([SHCustomCatalogMatcher alloc], "initWithCustomCatalog:", v4);
    customCatalogMatcher = v5->_customCatalogMatcher;
    v5->_customCatalogMatcher = v6;

    -[SHCustomCatalogMatcher setDelegate:](v5->_customCatalogMatcher, "setDelegate:", v5);
  }

  return v5;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaTimelineCustomCatalogMatcher setTimelineRequestID:](self, "setTimelineRequestID:", v5);

  -[SHMediaTimelineCustomCatalogMatcher customCatalogMatcher](self, "customCatalogMatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startRecognitionForRequest:", v4);

}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[SHMediaTimelineCustomCatalogMatcher timelineRequestID](self, "timelineRequestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
    -[SHMediaTimelineCustomCatalogMatcher stopRecognition](self, "stopRecognition");
}

- (void)stopRecognition
{
  void *v3;

  -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopGenerating");

  -[SHMediaTimelineCustomCatalogMatcher setContextTimeline:](self, "setContextTimeline:", 0);
  -[SHMediaTimelineCustomCatalogMatcher setTimelineRequestID:](self, "setTimelineRequestID:", 0);
}

- (void)mediaTimeline:(id)a3 hasUpdatedInScopeMediaItems:(id)a4
{
  id v6;
  id v7;
  SHMatch *v8;
  void *v9;
  SHMatcherResponse *v10;
  void *v11;
  SHMatch *v12;

  v6 = a4;
  v7 = a3;
  v8 = [SHMatch alloc];
  objc_msgSend(v7, "querySignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SHMatch initWithMediaItems:forSignature:](v8, "initWithMediaItems:forSignature:", v6, v9);
  v10 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:]([SHMatcherResponse alloc], "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:", v12, 0, 0, 0, 0.0, 0.0, 0.0);
  -[SHMediaTimelineCustomCatalogMatcher delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "matcher:didProduceResponse:", self, v10);

}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v5 = objc_msgSend(v18, "result");
  if (v5 == 1)
  {
    objc_msgSend(v18, "match");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMediaTimelineCustomCatalogMatcher restartTimelineWithMediaItems:](self, "restartTimelineWithMediaItems:", v9);

    goto LABEL_6;
  }
  if (v5 == 2)
  {
    -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_11:
      -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stopGenerating");

      -[SHMediaTimelineCustomCatalogMatcher setContextTimeline:](self, "setContextTimeline:", 0);
      -[SHMediaTimelineCustomCatalogMatcher delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "matcher:didProduceResponse:", self, v18);

      goto LABEL_12;
    }
    v11 = (void *)v10;
    -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isFinished"))
    {

      goto LABEL_11;
    }
    objc_msgSend(v18, "signature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    v15 = v14;

    if (v15 >= 12.0)
      goto LABEL_11;
LABEL_6:
    -[SHMediaTimelineCustomCatalogMatcher callDelegateWithSyntheticMatchForResponse:](self, "callDelegateWithSyntheticMatchForResponse:", v18);
    goto LABEL_12;
  }
  v6 = v18;
  if (v5 == 3)
  {
    -[SHMediaTimelineCustomCatalogMatcher delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "matcher:didProduceResponse:", self, v18);

    -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopGenerating");

LABEL_12:
    v6 = v18;
  }

}

- (void)callDelegateWithSyntheticMatchForResponse:(id)a3
{
  id v4;
  void *v5;
  SHMatch *v6;
  void *v7;
  SHMatch *v8;
  SHMatcherResponse *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  SHMatcherResponse *v18;
  void *v19;
  id v20;

  v4 = a3;
  -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inScopeMediaItems");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [SHMatch alloc];
  objc_msgSend(v4, "signature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SHMatch initWithMediaItems:forSignature:](v6, "initWithMediaItems:forSignature:", v20, v7);

  v9 = [SHMatcherResponse alloc];
  objc_msgSend(v4, "recordingIntermission");
  v11 = v10;
  objc_msgSend(v4, "recordingSignatureOffset");
  v13 = v12;
  objc_msgSend(v4, "retrySeconds");
  v15 = v14;
  objc_msgSend(v4, "runningAssociatedRequestID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:](v9, "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:", v8, 0, v16, v17, v11, v13, v15);
  -[SHMediaTimelineCustomCatalogMatcher delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "matcher:didProduceResponse:", self, v18);

}

- (void)restartTimelineWithMediaItems:(id)a3
{
  id v4;
  void *v5;
  SHMediaTimeline *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopGenerating");

  v6 = -[SHMediaTimeline initWithMatch:]([SHMediaTimeline alloc], "initWithMatch:", v4);
  -[SHMediaTimelineCustomCatalogMatcher setContextTimeline:](self, "setContextTimeline:", v6);

  -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[SHMediaTimelineCustomCatalogMatcher contextTimeline](self, "contextTimeline");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startGenerating");

}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHMediaTimeline)contextTimeline
{
  return self->_contextTimeline;
}

- (void)setContextTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_contextTimeline, a3);
}

- (SHCustomCatalogMatcher)customCatalogMatcher
{
  return self->_customCatalogMatcher;
}

- (void)setCustomCatalogMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_customCatalogMatcher, a3);
}

- (NSUUID)timelineRequestID
{
  return self->_timelineRequestID;
}

- (void)setTimelineRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_timelineRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineRequestID, 0);
  objc_storeStrong((id *)&self->_customCatalogMatcher, 0);
  objc_storeStrong((id *)&self->_contextTimeline, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
