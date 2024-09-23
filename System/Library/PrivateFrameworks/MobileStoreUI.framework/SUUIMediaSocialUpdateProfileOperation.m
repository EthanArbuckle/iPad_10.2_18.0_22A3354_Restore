@implementation SUUIMediaSocialUpdateProfileOperation

- (SUUIMediaSocialUpdateProfileOperation)initWithClientContext:(id)a3
{
  id v5;
  SUUIMediaSocialUpdateProfileOperation *v6;
  SUUIMediaSocialUpdateProfileOperation *v7;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaSocialUpdateProfileOperation;
  v6 = -[SSVOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v7->_lock;
    v7->_lock = v8;

    -[NSLock setName:](v7->_lock, "setName:", CFSTR("com.apple.MediaSocial.updateProfile"));
  }

  return v7;
}

- (NSString)entityType
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_entityType, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSNumber)identifier
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSNumber copy](self->_identifier, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSNumber *)v3;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setEntityType:(id)a3
{
  NSLock *lock;
  id v5;
  NSString *v6;
  NSString *entityType;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  v6 = (NSString *)objc_msgSend(v5, "copy");

  entityType = self->_entityType;
  self->_entityType = v6;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setIdentifier:(id)a3
{
  NSLock *lock;
  id v5;
  NSNumber *v6;
  NSNumber *identifier;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  v6 = (NSNumber *)objc_msgSend(v5, "copy");

  identifier = self->_identifier;
  self->_identifier = v6;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setValue:(id)a3 forProfileField:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *parameters;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_parameters)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parameters = self->_parameters;
    self->_parameters = v7;

  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("backgroundImage"))
    && !objc_msgSend(v6, "isEqualToString:", CFSTR("profileImage")))
  {
    v11 = self->_parameters;
    v9 = (void *)objc_msgSend(v12, "copy");
    v10 = v11;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUIMediaSocialUpdateProfileOperation _imageDictionaryFromPhotoUpload:](self, "_imageDictionaryFromPhotoUpload:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_parameters;
LABEL_8:
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v6);

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)main
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id obj;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__34;
  v30 = __Block_byref_object_dispose__34;
  v31 = 0;
  obj = 0;
  -[SUUIMediaSocialUpdateProfileOperation _requestWithError:](self, "_requestWithError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v31, obj);
  if (!v3)
  {
    v10 = 0;
    goto LABEL_19;
  }
  v4 = -[SUUIClientContext newLoadStoreURLOperationWithURLRequest:](self->_clientContext, "newLoadStoreURLOperationWithURLRequest:", v3);
  objc_msgSend(MEMORY[0x24BEB20B8], "consumer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataConsumer:", v5);

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__34;
  v23 = __Block_byref_object_dispose__34;
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __45__SUUIMediaSocialUpdateProfileOperation_main__block_invoke;
  v18[3] = &unk_2511F6F18;
  v18[4] = &v19;
  v18[5] = &v26;
  objc_msgSend(v4, "setOutputBlock:", v18);
  -[SSVOperation runChildOperation:](self, "runChildOperation:", v4);
  v6 = (void *)v20[5];
  if (!v6)
  {
    v9 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("success")) & 1) != 0)
    {
      v9 = 1;
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("handleAlreadyExists"))
      || objc_msgSend(v8, "isEqualToString:", CFSTR("ResourceAlreadyExists")))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 5, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v27[5];
      v27[5] = v11;

    }
  }
  v9 = 0;
LABEL_12:

  if (!v9)
  {
LABEL_13:
    if (!v27[5])
    {
      objc_msgSend(v4, "URLResponse");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "statusCode") == 403)
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 3, 0);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v27[5];
      v27[5] = v14;

    }
  }
  _Block_object_dispose(&v19, 8);

  v10 = v9 != 0;
LABEL_19:
  -[SUUIMediaSocialUpdateProfileOperation outputBlock](self, "outputBlock");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    (*(void (**)(uint64_t, _BOOL8, uint64_t))(v16 + 16))(v16, v10, v27[5]);

  _Block_object_dispose(&v26, 8);
}

void __45__SUUIMediaSocialUpdateProfileOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v11;
  }
  else
  {
    if (!v5)
    {
      SSError();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;
      goto LABEL_7;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v5;
  }
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;
LABEL_7:

}

- (id)_imageDictionaryFromPhotoUpload:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDBCE70];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("contentToken"), v7, CFSTR("contentTokenType"), 0);
  return v8;
}

- (id)_requestWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:error:", *MEMORY[0x24BEB2BA8], a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("updateProfile"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUIMediaSocialUpdateProfileOperation _requestBodyWithError:](self, "_requestBodyWithError:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x24BDB7458]);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithURL:", v10);

      objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      objc_msgSend(v11, "setHTTPBody:", v8);
      SSVAddMediaSocialHeadersToURLRequest();
    }
    else
    {
      v11 = 0;
    }

  }
  else if (a3)
  {
    SSError();
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_requestBodyWithError:(id *)a3
{
  NSMutableDictionary *parameters;
  void *v6;
  void *v7;
  void *v8;

  if (self->_entityType && self->_identifier && (parameters = self->_parameters) != 0)
  {
    v6 = (void *)-[NSMutableDictionary mutableCopy](parameters, "mutableCopy");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", self->_entityType, CFSTR("type"), self->_identifier, CFSTR("id"), 0);
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("owner"));
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
    if (a3)
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 4, 0);
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
