@implementation LNOpenURLRequest

- (LNOpenURLRequest)initWithIdentifier:(id)a3 url:(id)a4
{
  id v8;
  id v9;
  LNOpenURLRequest *v10;
  LNOpenURLRequest *v11;
  uint64_t v12;
  NSURL *url;
  LNOpenURLRequest *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNOpenURLRequest.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNOpenURLRequest;
  v10 = -[LNOpenURLRequest init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    v12 = objc_msgSend(v9, "copy");
    url = v11->_url;
    v11->_url = (NSURL *)v12;

    v14 = v11;
  }

  return v11;
}

- (void)respondWithSuccess
{
  LNOpenURLResponse *v3;
  void *v4;
  id completionHandler;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  LNOpenURLResponse *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_completionHandler)
  {
    v3 = [LNOpenURLResponse alloc];
    -[LNOpenURLRequest identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LNOpenURLResponse initWithIdentifier:](v3, "initWithIdentifier:", v4);

    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_opt_class();
      -[LNOpenURLRequest identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;

    }
  }
}

- (void)respondWithError:(id)a3
{
  void (**completionHandler)(id, _QWORD, id);
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    v5 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_opt_class();
      -[LNOpenURLRequest identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;

    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNOpenURLRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNOpenURLRequest url](self, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

}

- (LNOpenURLRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  LNOpenURLRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[LNOpenURLRequest initWithIdentifier:url:](self, "initWithIdentifier:url:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSURL)url
{
  return self->_url;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
