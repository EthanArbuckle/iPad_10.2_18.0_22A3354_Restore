@implementation _ASCLockupResponse

- (_ASCLockupResponse)initWithRequest:(id)a3 lockup:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ASCLockupResponse *v11;
  uint64_t v12;
  ASCLockupRequest *request;
  uint64_t v14;
  ASCLockup *lockup;
  uint64_t v16;
  NSError *error;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_ASCLockupResponse;
  v11 = -[_ASCLockupResponse init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    request = v11->_request;
    v11->_request = (ASCLockupRequest *)v12;

    v14 = objc_msgSend(v9, "copy");
    lockup = v11->_lockup;
    v11->_lockup = (ASCLockup *)v14;

    v16 = objc_msgSend(v10, "copy");
    error = v11->_error;
    v11->_error = (NSError *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = objc_alloc_init(ASCHasher);
  -[_ASCLockupResponse request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[_ASCLockupResponse lockup](self, "lockup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[_ASCLockupResponse error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  v7 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[_ASCLockupResponse request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[_ASCLockupResponse lockup](self, "lockup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lockup");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
            goto LABEL_13;
        }
        else if (v11 == (void *)v12)
        {
LABEL_13:
          -[_ASCLockupResponse error](self, "error");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "error");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v14 && v15)
            v17 = objc_msgSend(v14, "isEqual:", v15);
          else
            v17 = v14 == (void *)v15;

          goto LABEL_23;
        }
        v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v17 = 0;
LABEL_25:

  return v17;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[_ASCLockupResponse request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("request"));

  -[_ASCLockupResponse lockup](self, "lockup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("lockup"));

  -[_ASCLockupResponse error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("error"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ASCLockupRequest)request
{
  return self->_request;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
