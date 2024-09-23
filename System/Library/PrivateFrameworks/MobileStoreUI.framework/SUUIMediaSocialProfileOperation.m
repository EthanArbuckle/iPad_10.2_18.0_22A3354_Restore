@implementation SUUIMediaSocialProfileOperation

- (SUUIMediaSocialProfileOperation)init
{
  SUUIMediaSocialProfileOperation *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIMediaSocialProfileOperation;
  v2 = -[SSVOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

    -[NSLock setName:](v2->_lock, "setName:", CFSTR("com.apple.MediaSocial.profile"));
  }
  return v2;
}

- (SUUIMediaSocialProfileOperation)initWithClientContext:(id)a3
{
  id v4;
  SUUIMediaSocialProfileOperation *v5;
  void *v6;

  v4 = a3;
  v5 = -[SUUIMediaSocialProfileOperation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "URLBag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVComplexOperation configureWithURLBag:](v5, "configureWithURLBag:", v6);

  }
  return v5;
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

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__106;
  v40 = __Block_byref_object_dispose__106;
  v41 = 0;
  -[SSVComplexOperation URLBagDictionary](self, "URLBagDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEB2BA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("userProfile"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1808]);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithURL:resolvingAgainstBaseURL:", v7, 0);

    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(v10, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("user"), v13);
    v28 = v10;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v14, 0);
    objc_msgSend(v8, "setQueryItems:", v15);
    v16 = objc_alloc(MEMORY[0x24BDB7458]);
    objc_msgSend(v8, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithURL:", v17);

    SSVAddMediaSocialHeadersToURLRequest();
    v19 = -[SSVComplexOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v18);
    objc_msgSend(MEMORY[0x24BEB20B8], "consumer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDataConsumer:", v20);

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__106;
    v34 = __Block_byref_object_dispose__106;
    v35 = 0;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __39__SUUIMediaSocialProfileOperation_main__block_invoke;
    v29[3] = &unk_2511F6F18;
    v29[4] = &v30;
    v29[5] = &v36;
    objc_msgSend(v19, "setOutputBlock:", v29);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v19);
    if (v31[5])
    {
      -[SUUIMediaSocialProfileOperation _profileWithResponseDictionary:](self, "_profileWithResponseDictionary:");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    if (!(v37[5] | v21))
    {
      objc_msgSend(v19, "URLResponse");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "statusCode") == 403)
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 3, 0);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 2, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v37[5];
      v37[5] = v24;

    }
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    SSError();
    v22 = objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v8 = (void *)v37[5];
    v37[5] = v22;
  }

  -[SUUIMediaSocialProfileOperation outputBlock](self, "outputBlock");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v26, v21, v37[5]);

  _Block_object_dispose(&v36, 8);
}

void __39__SUUIMediaSocialProfileOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_profileWithResponseDictionary:(id)a3
{
  void *v3;
  SUUIMediaSocialProfile *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "objectForKey:", CFSTR("profile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SUUIMediaSocialProfile initWithProfileDictionary:]([SUUIMediaSocialProfile alloc], "initWithProfileDictionary:", v3);
    objc_msgSend(v3, "objectForKey:", CFSTR("backgroundImage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1EA8]), "initWithLookupDictionary:", v5);
      objc_msgSend(v6, "URLWithHeight:width:", objc_msgSend(v6, "height"), objc_msgSend(v6, "width"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIMediaSocialProfile setBackgroundImageURL:](v4, "setBackgroundImageURL:", v7);

    }
    objc_msgSend(v3, "objectForKey:", CFSTR("profileImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1EA8]), "initWithLookupDictionary:", v8);
      objc_msgSend(v9, "URLWithHeight:width:", objc_msgSend(v9, "height"), objc_msgSend(v9, "width"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIMediaSocialProfile setProfileImageURL:](v4, "setProfileImageURL:", v10);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
