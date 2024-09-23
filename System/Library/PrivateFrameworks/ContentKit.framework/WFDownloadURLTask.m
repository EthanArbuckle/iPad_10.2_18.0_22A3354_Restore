@implementation WFDownloadURLTask

- (WFDownloadURLTask)initWithRequest:(id)a3
{
  id v5;
  WFDownloadURLTask *v6;
  uint64_t v7;
  NSURLRequest *request;
  WFDownloadURLTask *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDownloadURLTask.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFDownloadURLTask;
  v6 = -[WFDownloadURLTask init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    request = v6->_request;
    v6->_request = (NSURLRequest *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD1850];
  objc_msgSend(MEMORY[0x24BDD1858], "wf_defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionWithConfiguration:delegate:delegateQueue:", v4, self, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "downloadTaskWithRequest:", self->_request);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  void (**v8)(id, id);
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = (void (**)(id, id))a7;
  v9 = a6;
  v12 = (id)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v12, "_setNonAppInitiated:", 1);
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WFAppTransportSecuredURL(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setURL:", v11);

  v8[2](v8, v12);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;

  v16 = a3;
  v11 = a4;
  if (*MEMORY[0x24BDD1360] != a7)
  {
    -[WFDownloadURLTask expectedByteCountHandler](self, "expectedByteCountHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[WFDownloadURLTask expectedByteCountHandler](self, "expectedByteCountHandler");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, a7);

      -[WFDownloadURLTask setExpectedByteCountHandler:](self, "setExpectedByteCountHandler:", 0);
    }
    -[WFDownloadURLTask writtenByteCountHandler](self, "writtenByteCountHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[WFDownloadURLTask writtenByteCountHandler](self, "writtenByteCountHandler");
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v15[2](v15, a5);

    }
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[WFDownloadURLTask completionHandler](self, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFDownloadURLTask completionHandler](self, "completionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, void *))v9)[2](v9, v7, v10, v11);

    -[WFDownloadURLTask setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = a3;
  -[WFDownloadURLTask completionHandler](self, "completionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v10)
  {
    -[WFDownloadURLTask completionHandler](self, "completionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, id))v11)[2](v11, 0, v12, v8);

    -[WFDownloadURLTask setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[WFDownloadURLTask setWrittenByteCountHandler:](self, "setWrittenByteCountHandler:", 0);
  objc_msgSend(v9, "finishTasksAndInvalidate");

}

- (NSURLRequest)request
{
  return self->_request;
}

- (id)expectedByteCountHandler
{
  return self->_expectedByteCountHandler;
}

- (void)setExpectedByteCountHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)writtenByteCountHandler
{
  return self->_writtenByteCountHandler;
}

- (void)setWrittenByteCountHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_writtenByteCountHandler, 0);
  objc_storeStrong(&self->_expectedByteCountHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
