@implementation AARemoteServerConfigurationCache

+ (id)cacheWithConfiguration:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:response:", v7, v6);

  return v8;
}

- (AARemoteServerConfigurationCache)init
{
  -[AARemoteServerConfigurationCache doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AARemoteServerConfigurationCache)initWithConfiguration:(id)a3 response:(id)a4
{
  id v8;
  id v9;
  void *v10;
  AARemoteServerConfigurationCache *v11;
  uint64_t v12;
  NSDate *creationDate;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServerConfigurationCache.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServerConfigurationCache.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)AARemoteServerConfigurationCache;
  v11 = -[AARemoteServerConfigurationCache init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_configuration, a3);
    objc_storeStrong((id *)&v11->_response, a4);
  }

  return v11;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (AAURLConfiguration)configuration
{
  return self->_configuration;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
