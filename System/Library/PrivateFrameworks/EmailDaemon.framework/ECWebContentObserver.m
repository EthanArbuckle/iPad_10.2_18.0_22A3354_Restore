@implementation ECWebContentObserver

- (ECWebContentObserver)initWithParser:(id)a3
{
  id v4;
  ECWebContentObserver *v5;
  ECWebContentObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ECWebContentObserver;
  v5 = -[ECWebContentObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parser, v4);

  return v6;
}

- (void)baseURL:(id)a3 didRequestRemoteContentURLs:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[ECWebContentObserver parser](self, "parser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseURL:didRequestRemoteContentURLs:", v8, v6);

}

- (void)requestDataDetectionResultsWithBaseURL:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ECWebContentObserver parser](self, "parser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDataDetectionResultsWithBaseURL:", v5);

}

- (void)receiveDataDetectionResults:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ECWebContentObserver parser](self, "parser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "receiveDataDetectionResults:", v5);

}

- (void)logWebBundleMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ECWebContentObserver parser](self, "parser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logWebBundleMessage:", v5);

}

- (EDWebContentParser)parser
{
  return (EDWebContentParser *)objc_loadWeakRetained((id *)&self->_parser);
}

- (void)setParser:(id)a3
{
  objc_storeWeak((id *)&self->_parser, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parser);
}

@end
