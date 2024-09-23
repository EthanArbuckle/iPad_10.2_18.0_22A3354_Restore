@implementation CXInProcessProvider

- (CXInProcessProvider)initWithConfiguration:(id)a3
{

  return 0;
}

- (CXInProcessProvider)initWithConfiguration:(id)a3 callSource:(id)a4
{
  id v6;
  CXInProcessProvider *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  id v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CXInProcessProvider;
  v7 = -[CXProvider initWithConfiguration:](&v13, sel_initWithConfiguration_, a3);
  if (v7)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = objc_storeWeak((id *)&v7->_callSource, v6);
    objc_msgSend(v6, "setProvider:", v7);

    -[CXProvider registerCurrentConfiguration](v7, "registerCurrentConfiguration");
  }

  return v7;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXInProcessProvider;
  -[CXProvider setDelegate:queue:](&v6, sel_setDelegate_queue_, a3, a4);
  -[CXProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendDidBeginForProvider:", self);

}

- (CXInProcessCallSource)callSource
{
  return (CXInProcessCallSource *)objc_loadWeakRetained((id *)&self->_callSource);
}

- (void)setCallSource:(id)a3
{
  objc_storeWeak((id *)&self->_callSource, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_callSource);
}

@end
