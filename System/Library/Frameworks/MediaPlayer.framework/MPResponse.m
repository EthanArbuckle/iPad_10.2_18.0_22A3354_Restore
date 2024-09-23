@implementation MPResponse

- (id)builder
{
  return self->_builder;
}

- (MPResponse)initWithRequest:(id)a3 middleware:(id)a4
{
  id v7;
  id v8;
  MPResponse *v9;
  MPResponse *v10;
  void *v11;
  uint64_t v12;
  id builder;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MPResponse;
  v9 = -[MPResponse init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_request, a3);
    objc_storeStrong((id *)&v10->_middleware, a4);
    v10->_valid = 1;
    objc_msgSend((id)objc_opt_class(), "builderProtocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMiddlewareChain builderProxyForProtocol:](MPMiddlewareChain, "builderProxyForProtocol:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    builder = v10->_builder;
    v10->_builder = (id)v12;

  }
  return v10;
}

- (id)chain
{
  MPMiddlewareChain *v3;
  void *v4;
  void *v5;
  MPMiddlewareChain *v6;

  v3 = [MPMiddlewareChain alloc];
  -[MPResponse middleware](self, "middleware");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "builderProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMiddlewareChain initWithMiddleware:protocol:](v3, "initWithMiddleware:protocol:", v4, v5);

  return v6;
}

- (NSArray)middleware
{
  return self->_middleware;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_valid)
  {
    -[MPResponse willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("valid"));
    self->_valid = 0;
    -[MPResponse didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("valid"));
    v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[MPResponse request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_INFO, "INVALIDATE: Notifying invalidation for request: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", MPResponseDidInvalidateNotification, self);

  }
}

- (id)request
{
  return self->_request;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p request=%p>"), objc_opt_class(), self, self->_request);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_builder, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong(&self->_request, 0);
}

- (id)_stateDumpObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSArray *middleware;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("valid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_valid);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v9[2] = CFSTR("_middleware");
  middleware = self->_middleware;
  if (!middleware)
    middleware = (NSArray *)MEMORY[0x1E0C9AA60];
  v10[1] = v4;
  v10[2] = middleware;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setMiddleware:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)builderProtocol
{
  uint64_t v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPRequest.m"), 281, CFSTR("Subclass %@ must implement -%@ defined in %@."), v8, v9, CFSTR("[MPResponse class]"));

  }
  return &unk_1EE2D3AE8;
}

@end
