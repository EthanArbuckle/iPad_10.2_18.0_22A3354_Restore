@implementation ASDEphemeralRequest

void __58__ASDEphemeralRequest__callCompletionHandlerWithResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = objc_msgSend(*(id *)(a1 + 32), "success");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDRequestBroker markRequestAsComplete:](v6, *(void **)(a1 + 40));

}

- (void)_startWithCompletionHandler:(void *)result
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  if (result)
  {
    v2 = result;
    objc_setProperty_atomic_copy(result, newValue, newValue, 32);
    +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDRequestBroker markRequestAsActive:](v3, v2);

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__ASDEphemeralRequest__startWithCompletionHandler___block_invoke;
    v4[3] = &unk_1E37BDDB0;
    v4[4] = v2;
    return (void *)objc_msgSend(v2, "_startWithErrorHandler:", v4);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDEphemeralRequest;
  v4 = a3;
  -[ASDRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ASDEphemeralRequest options](self, "options", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("options"));

}

- (ASDRequestOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (_QWORD)_initWithOptions:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)ASDEphemeralRequest;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[5];
      a1[5] = v4;

    }
  }

  return a1;
}

- (ASDEphemeralRequest)initWithCoder:(id)a3
{
  id v4;
  ASDEphemeralRequest *v5;
  uint64_t v6;
  ASDRequestOptions *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDEphemeralRequest;
  v5 = -[ASDRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v6 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (ASDRequestOptions *)v6;

  }
  return v5;
}

uint64_t __51__ASDEphemeralRequest__startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  id v11;
  void *v12;
  id v13;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v5 = a2;
    if (v3)
    {
      v6 = objc_getProperty(v3, v4, 32, 1);
      if (v6)
      {
        dispatch_get_global_queue(21, 0);
        v7 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__ASDEphemeralRequest__failCompletionHandlerWithError___block_invoke;
        block[3] = &unk_1E37BDF10;
        v13 = v6;
        v11 = v5;
        v12 = v3;
        dispatch_async(v7, block);

      }
      else
      {
        +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDRequestBroker markRequestAsComplete:](v8, v3);

      }
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "setProxy:", 0);
}

- (void)receiveResponse:(id)a3
{
  const char *v4;
  id v5;
  id v6;
  NSObject *v7;
  SEL v8;
  void *v9;
  _QWORD block[4];
  id v11;
  ASDEphemeralRequest *v12;
  id v13;

  v5 = a3;
  if (self)
  {
    v6 = objc_getProperty(self, v4, 32, 1);
    if (v6)
    {
      dispatch_get_global_queue(21, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__ASDEphemeralRequest__callCompletionHandlerWithResponse___block_invoke;
      block[3] = &unk_1E37BDF10;
      v13 = v6;
      v11 = v5;
      v12 = self;
      dispatch_async(v7, block);

      objc_setProperty_atomic_copy(self, v8, 0, 32);
    }
    else
    {
      +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDRequestBroker markRequestAsComplete:](v9, self);

    }
  }

}

- (ASDEphemeralRequest)init
{
  return (ASDEphemeralRequest *)-[ASDEphemeralRequest _initWithOptions:](self, 0);
}

+ (int64_t)requestType
{
  return -1;
}

void __55__ASDEphemeralRequest__failCompletionHandlerWithError___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDRequestBroker markRequestAsComplete:](v2, *(void **)(a1 + 40));

}

@end
