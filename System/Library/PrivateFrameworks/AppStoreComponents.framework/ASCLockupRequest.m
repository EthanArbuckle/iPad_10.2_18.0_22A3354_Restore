@implementation ASCLockupRequest

- (ASCLockupRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASCLockupRequest *v11;
  uint64_t v12;
  ASCAdamID *id;
  uint64_t v14;
  NSString *kind;
  uint64_t v16;
  NSString *context;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupRequest;
  v11 = -[ASCLockupRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    id = v11->_id;
    v11->_id = (ASCAdamID *)v12;

    v14 = objc_msgSend(v9, "copy");
    kind = v11->_kind;
    v11->_kind = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    context = v11->_context;
    v11->_context = (NSString *)v16;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ASCLockupRequest *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *mediaQueryParams;
  uint64_t v14;
  NSString *clientID;
  uint64_t v16;
  NSString *platformOverride;
  ASCLockupRequest *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", v5, v6, v7);
        if (v8)
        {
          v9 = objc_alloc(MEMORY[0x1E0C99E60]);
          v10 = objc_opt_class();
          v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("mediaQueryParams"));
          v12 = objc_claimAutoreleasedReturnValue();
          mediaQueryParams = v8->_mediaQueryParams;
          v8->_mediaQueryParams = (NSDictionary *)v12;

          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
          v14 = objc_claimAutoreleasedReturnValue();
          clientID = v8->_clientID;
          v8->_clientID = (NSString *)v14;

          v8->_enableAppDistribution = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableAppDistribution"));
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformOverride"));
          v16 = objc_claimAutoreleasedReturnValue();
          platformOverride = v8->_platformOverride;
          v8->_platformOverride = (NSString *)v16;

        }
        self = v8;
        v18 = self;
      }
      else
      {
        v35 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v35)
          -[ASCLockupBatchRequest initWithCoder:].cold.3(v35, v36, v37, v38, v39, v40, v41, v42);
        v18 = 0;
      }

    }
    else
    {
      v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v27)
        -[ASCLockupBatchRequest initWithCoder:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
      v18 = 0;
    }

  }
  else
  {
    v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v19)
      -[ASCLockupRequest initWithCoder:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ASCLockupRequest id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCLockupRequest kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kind"));

  -[ASCLockupRequest context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("context"));

  -[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("mediaQueryParams"));

  -[ASCLockupRequest clientID](self, "clientID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("clientID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"), CFSTR("enableAppDistribution"));
  -[ASCLockupRequest platformOverride](self, "platformOverride");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("platformOverride"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupRequest id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLockupRequest kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCLockupRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCLockupRequest clientID](self, "clientID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"));
  -[ASCLockupRequest platformOverride](self, "platformOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  v10 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupRequest *v4;
  ASCLockupRequest *v5;
  ASCLockupRequest *v6;
  BOOL v7;
  ASCLockupRequest *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = (ASCLockupRequest *)a3;
  if (self != v4)
  {
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
    v8 = v6;

    if (!v8)
    {
      v7 = 0;
LABEL_48:

      goto LABEL_49;
    }
    -[ASCLockupRequest id](self, "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupRequest id](v8, "id");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
      {
LABEL_12:
        -[ASCLockupRequest kind](self, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLockupRequest kind](v8, "kind");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          if (objc_msgSend(v12, "isEqual:", v13))
          {
LABEL_15:
            -[ASCLockupRequest context](self, "context");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASCLockupRequest context](v8, "context");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if (objc_msgSend(v15, "isEqual:", v16))
              {
LABEL_18:
                -[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ASCLockupRequest mediaQueryParams](v8, "mediaQueryParams");
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                v40 = v18;
                if (v18 && v19)
                {
                  v21 = v18;
                  v22 = v20;
                  v23 = objc_msgSend(v21, "isEqual:", v20);
                  v20 = v22;
                  v18 = v40;
                  if (v23)
                  {
LABEL_21:
                    v38 = v20;
                    -[ASCLockupRequest clientID](self, "clientID");
                    v24 = objc_claimAutoreleasedReturnValue();
                    -[ASCLockupRequest clientID](v8, "clientID");
                    v25 = objc_claimAutoreleasedReturnValue();
                    v26 = (void *)v25;
                    v39 = (void *)v24;
                    if (v24 && v25)
                    {
                      v27 = (void *)v25;
                      v28 = objc_msgSend(v39, "isEqual:", v25);
                      v26 = v27;
                      if (v28)
                      {
LABEL_24:
                        v29 = -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution", v26);
                        if (v29 == -[ASCLockupRequest enableAppDistribution](v8, "enableAppDistribution"))
                        {
                          -[ASCLockupRequest platformOverride](self, "platformOverride");
                          v30 = (void *)objc_claimAutoreleasedReturnValue();
                          -[ASCLockupRequest platformOverride](v8, "platformOverride");
                          v31 = objc_claimAutoreleasedReturnValue();
                          v32 = (void *)v31;
                          if (v30 && v31)
                          {
                            v33 = (void *)v31;
                            v34 = objc_msgSend(v30, "isEqual:", v31);
                            v32 = v33;
                            v35 = v30;
                            v7 = v34;
                          }
                          else
                          {
                            v35 = v30;
                            v7 = v30 == (void *)v31;
                          }

                        }
                        else
                        {
                          v7 = 0;
                        }
                        v26 = v37;
                        goto LABEL_43;
                      }
                    }
                    else if (v24 == v25)
                    {
                      goto LABEL_24;
                    }
                    v7 = 0;
LABEL_43:

                    v20 = v38;
                    v18 = v40;
                    goto LABEL_44;
                  }
                }
                else if (v18 == (void *)v19)
                {
                  goto LABEL_21;
                }
                v7 = 0;
LABEL_44:

                goto LABEL_45;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_18;
            }
            v7 = 0;
LABEL_45:

            goto LABEL_46;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_15;
        }
        v7 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    v7 = 0;
LABEL_47:

    goto LABEL_48;
  }
  v7 = 1;
LABEL_49:

  return v7;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupRequest id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCLockupRequest kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("kind"));

  -[ASCLockupRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("context"));

  -[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("mediaQueryParams"));

  }
  -[ASCLockupRequest clientID](self, "clientID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ASCLockupRequest clientID](self, "clientID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("clientID"));

  }
  if (-[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"))
    -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"), CFSTR("enableAppDistribution"));
  -[ASCLockupRequest platformOverride](self, "platformOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ASCLockupRequest platformOverride](self, "platformOverride");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, CFSTR("platformOverride"));

  }
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)clone
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = objc_alloc((Class)objc_opt_class());
  -[ASCLockupRequest id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupRequest kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "initWithID:kind:context:", v4, v5, v6);

  -[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v8;

  -[ASCLockupRequest clientID](self, "clientID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v10;

  *(_BYTE *)(v7 + 8) = -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution");
  -[ASCLockupRequest platformOverride](self, "platformOverride");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v12;

  return (id)v7;
}

- (ASCLockupRequest)lockupRequestWithMediaQueryParams:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  -[ASCLockupRequest clone](self, "clone");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[5];
  v5[5] = v4;

  return (ASCLockupRequest *)v5;
}

- (id)lockupRequestByAddingMediaQueryParams:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[ASCLockupRequest clone](self, "clone");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[5];
  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "addEntriesFromDictionary:", v4);

  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v5[5];
  v5[5] = v9;

  return v5;
}

- (id)_lockupRequestWithClientID:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  -[ASCLockupRequest clone](self, "clone");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[6];
  v5[6] = v4;

  return v5;
}

- (id)_lockupRequestWithAppDistributionEnabled
{
  id result;

  result = -[ASCLockupRequest clone](self, "clone");
  *((_BYTE *)result + 8) = 1;
  return result;
}

- (id)_lockupRequestWithPlatformOverride:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  -[ASCLockupRequest clone](self, "clone");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[7];
  v5[7] = v4;

  return v5;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)context
{
  return self->_context;
}

- (NSDictionary)mediaQueryParams
{
  return self->_mediaQueryParams;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (BOOL)enableAppDistribution
{
  return self->_enableAppDistribution;
}

- (NSString)platformOverride
{
  return self->_platformOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformOverride, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_mediaQueryParams, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6
{
  _BOOL4 v6;
  ASCLockupRequest *v7;
  ASCLockupRequest *v8;
  void *v9;

  v6 = a6;
  v7 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  v8 = v7;
  v9 = v7;
  if (v6)
  {
    -[ASCLockupRequest lockupRequestWithAppDistributionEnabled](v7, "lockupRequestWithAppDistributionEnabled");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  ASCLockupRequest *v13;
  ASCLockupRequest *v14;
  void *v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  v14 = v13;
  v15 = v13;
  if (v7)
  {
    -[ASCLockupRequest lockupRequestWithAppDistributionEnabled](v13, "lockupRequestWithAppDistributionEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "_lockupRequestWithClientID:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  ASCLockupRequest *v16;
  ASCLockupRequest *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v23;
  _QWORD v24[2];

  v8 = a8;
  v24[1] = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a7;
  v16 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  v17 = v16;
  v18 = v16;
  if (v8)
  {
    -[ASCLockupRequest lockupRequestWithAppDistributionEnabled](v16, "lockupRequestWithAppDistributionEnabled");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v15)
  {
    v23 = CFSTR("ppid");
    v24[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lockupRequestWithMediaQueryParams:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v20;
  }
  objc_msgSend(v18, "_lockupRequestWithClientID:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[ASCLockupRequest _initWithID:kind:context:enableAppDistribution:]([ASCLockupRequest alloc], "_initWithID:kind:context:enableAppDistribution:", v11, v10, v9, v6);

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[ASCLockupRequest _initWithID:kind:context:clientID:enableAppDistribution:]([ASCLockupRequest alloc], "_initWithID:kind:context:clientID:enableAppDistribution:", v14, v13, v12, v11, v7);

  return v15;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a8;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = -[ASCLockupRequest _initWithID:kind:context:clientID:productVariantID:enableAppDistribution:]([ASCLockupRequest alloc], "_initWithID:kind:context:clientID:productVariantID:enableAppDistribution:", v17, v16, v15, v14, v13, v8);

  return v18;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 appVersionId:(id)a6 distributorId:(id)a7
{
  id v12;
  id v13;
  ASCLockupRequest *v14;
  void *v15;

  v12 = a7;
  v13 = a6;
  v14 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  -[ASCLockupRequest lockupRequestWithAppVersionId:distributorId:](v14, "lockupRequestWithAppVersionId:distributorId:", v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 appVersionId:(id)a6 distributorId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[ASCLockupRequest _initWithID:kind:context:appVersionId:distributorId:]([ASCLockupRequest alloc], "_initWithID:kind:context:appVersionId:distributorId:", v15, v14, v13, v12, v11);

  return v16;
}

- (ASCLockupRequest)lockupRequestWithAppVersionId:(id)a3 distributorId:(id)a4
{
  id v6;
  __CFString *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("native"), CFSTR("distributionChannel"));
    v10 = CFSTR("distributorId");
    v11 = v9;
    v12 = v7;
  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("web"), CFSTR("distributionChannel"));
    v12 = CFSTR("webDistributionDomains");
    v10 = CFSTR("extend");
    v11 = v9;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v10);
  if (v6)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("version"));
  -[ASCLockupRequest lockupRequestByAddingMediaQueryParams:](self, "lockupRequestByAddingMediaQueryParams:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockupRequest *)v13;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8
{
  id v14;
  id v15;
  id v16;
  ASCLockupRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v25;
  id v26;
  const __CFString *v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  v18 = v17;
  if (v14)
  {
    v29 = CFSTR("minExternalVersionId");
    v30[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupRequest lockupRequestByAddingMediaQueryParams:](v17, "lockupRequestByAddingMediaQueryParams:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v15)
  {
    v27 = CFSTR("latestReleaseId");
    v28 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lockupRequestByAddingMediaQueryParams:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
  if (v16)
  {
    v25 = CFSTR("ppid");
    v26 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lockupRequestByAddingMediaQueryParams:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v23;
  }

  return v18;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[ASCLockupRequest _initWithID:kind:context:minExternalVersionID:latestReleaseID:productVariantID:]([ASCLockupRequest alloc], "_initWithID:kind:context:minExternalVersionID:latestReleaseID:productVariantID:", v18, v17, v16, v15, v14, v13);

  return v19;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 productVariantID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  ASCLockupRequest *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v13 = -[ASCLockupRequest initWithID:kind:context:]([ASCLockupRequest alloc], "initWithID:kind:context:", v12, v11, v10);

  if (v9)
  {
    v17 = CFSTR("ppid");
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupRequest lockupRequestWithMediaQueryParams:](v13, "lockupRequestWithMediaQueryParams:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (ASCLockupRequest *)v15;
  }

  return v13;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6
{
  id v10;
  ASCLockupRequest *v11;
  void *v12;

  v10 = a6;
  v11 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  -[ASCLockupRequest lockupRequestWithClientID:](v11, "lockupRequestWithClientID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[ASCLockupRequest _initWithID:kind:context:clientID:]([ASCLockupRequest alloc], "_initWithID:kind:context:clientID:", v12, v11, v10, v9);

  return v13;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6
{
  id v10;
  ASCLockupRequest *v11;
  void *v12;

  v10 = a6;
  v11 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  -[ASCLockupRequest lockupRequestWithPlatformOverride:](v11, "lockupRequestWithPlatformOverride:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[ASCLockupRequest _initWithID:kind:context:platformOverride:]([ASCLockupRequest alloc], "_initWithID:kind:context:platformOverride:", v12, v11, v10, v9);

  return v13;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 includeUnlistedApps:(BOOL)a6
{
  _BOOL4 v6;
  ASCLockupRequest *v7;
  ASCLockupRequest *v8;
  ASCLockupRequest *v9;
  ASCLockupRequest *v10;

  v6 = a6;
  v7 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  v8 = v7;
  if (v6)
  {
    -[ASCLockupRequest lockupRequestWithUnlistedAppsIncluded](v7, "lockupRequestWithUnlistedAppsIncluded");
    v9 = (ASCLockupRequest *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 includeUnlistedApps:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[ASCLockupRequest _initWithID:kind:context:includeUnlistedApps:]([ASCLockupRequest alloc], "_initWithID:kind:context:includeUnlistedApps:", v11, v10, v9, v6);

  return v12;
}

- (ASCLockupRequest)lockupRequestWithUnlistedAppsIncluded
{
  return (ASCLockupRequest *)-[ASCLockupRequest lockupRequestByAddingMediaQueryParams:](self, "lockupRequestByAddingMediaQueryParams:", &unk_1E757A670);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCLockupRequest because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
