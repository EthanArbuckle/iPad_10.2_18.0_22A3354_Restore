@implementation ASCLockupBatchRequest

+ (id)lockupBatchRequestsFromRequests:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  ASCPair *v23;
  void *v24;
  void *v25;
  ASCPair *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  unsigned int v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v6, "enableAppDistribution");

  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaQueryParams");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platformOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v54 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          objc_msgSend(v15, "mediaQueryParams");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v41 = objc_alloc(MEMORY[0x1E0C99DA0]);
            v42 = *MEMORY[0x1E0C99778];
            v43 = CFSTR("Request specifying custom media query parameters cannot be included in batch request with more than one request");
LABEL_28:
            objc_exception_throw((id)objc_msgSend(v41, "initWithName:reason:userInfo:", v42, v43, 0));
          }
        }
        objc_msgSend(v15, "clientID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v5 && v17)
        {
          v19 = objc_msgSend(v17, "isEqual:", v5);

          if ((v19 & 1) == 0)
            goto LABEL_24;
        }
        else
        {

          if (v18 != v5)
          {
LABEL_24:
            v36 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v15, "clientID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringWithFormat:", CFSTR("Requests with different clientID cannot be included in batch request: %@ != %@"), v37, v5);
            v38 = objc_claimAutoreleasedReturnValue();

LABEL_27:
            v41 = objc_alloc(MEMORY[0x1E0C99DA0]);
            v42 = *MEMORY[0x1E0C99778];
            v43 = (const __CFString *)v38;
            goto LABEL_28;
          }
        }
        if (v45 != objc_msgSend(v15, "enableAppDistribution"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requests with different AppDistribution options cannot be included in batch request: %d != %d"), objc_msgSend(v15, "enableAppDistribution"), v45);
          v38 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        objc_msgSend(v15, "platformOverride");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v9 && v20)
        {
          v22 = objc_msgSend(v20, "isEqual:", v9);

          if ((v22 & 1) == 0)
            goto LABEL_26;
        }
        else
        {

          if (v21 != v9)
          {
LABEL_26:
            v39 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v15, "platformOverride");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringWithFormat:", CFSTR("Requests with different platformOverride options cannot be included in batch request: %@ != %@"), v40, v9);
            v38 = objc_claimAutoreleasedReturnValue();

            goto LABEL_27;
          }
        }
        v23 = [ASCPair alloc];
        objc_msgSend(v15, "kind");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "context");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[ASCPair initWithFirst:second:](v23, "initWithFirst:second:", v24, v25);

        objc_msgSend(v46, "objectForKeyedSubscript:", v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v27, v26);
        }
        objc_msgSend(v15, "id");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v28);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v12);
  }

  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __57__ASCLockupBatchRequest_lockupBatchRequestsFromRequests___block_invoke;
  v47[3] = &unk_1E75608E0;
  v52 = v45;
  v48 = v5;
  v49 = v44;
  v50 = v9;
  v51 = v29;
  v30 = v29;
  v31 = v9;
  v32 = v44;
  v33 = v5;
  objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v47);
  v34 = (void *)objc_msgSend(v30, "copy");

  return v34;
}

void __57__ASCLockupBatchRequest_lockupBatchRequestsFromRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ASCLockupBatchRequest *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = [ASCLockupBatchRequest alloc];
  objc_msgSend(v6, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASCLockupBatchRequest _initWithIDs:kind:context:clientID:enableAppDistribution:mediaQueryParams:platformOverride:](v7, "_initWithIDs:kind:context:clientID:enableAppDistribution:mediaQueryParams:platformOverride:", v5, v8, v9, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);

}

- (ASCLockupBatchRequest)initWithIDs:(id)a3 kind:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASCLockupBatchRequest *v11;
  uint64_t v12;
  NSSet *ids;
  uint64_t v14;
  NSString *kind;
  uint64_t v16;
  NSString *context;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupBatchRequest;
  v11 = -[ASCLockupBatchRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    ids = v11->_ids;
    v11->_ids = (NSSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    kind = v11->_kind;
    v11->_kind = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    context = v11->_context;
    v11->_context = (NSString *)v16;

  }
  return v11;
}

- (id)_initWithIDs:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7 mediaQueryParams:(id)a8 platformOverride:(id)a9
{
  id v15;
  id v16;
  id v17;
  ASCLockupBatchRequest *v18;
  ASCLockupBatchRequest *v19;

  v15 = a6;
  v16 = a8;
  v17 = a9;
  v18 = -[ASCLockupBatchRequest initWithIDs:kind:context:](self, "initWithIDs:kind:context:", a3, a4, a5);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientID, a6);
    v19->_enableAppDistribution = a7;
    objc_storeStrong((id *)&v19->_mediaQueryParams, a8);
    objc_storeStrong((id *)&v19->_platformOverride, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupBatchRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ASCLockupBatchRequest *v11;
  uint64_t v12;
  NSString *clientID;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *mediaQueryParams;
  uint64_t v19;
  NSString *platformOverride;
  ASCLockupBatchRequest *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("ids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = -[ASCLockupBatchRequest initWithIDs:kind:context:](self, "initWithIDs:kind:context:", v8, v9, v10);
        if (v11)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
          v12 = objc_claimAutoreleasedReturnValue();
          clientID = v11->_clientID;
          v11->_clientID = (NSString *)v12;

          v11->_enableAppDistribution = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableAppDistribution"));
          v14 = objc_alloc(MEMORY[0x1E0C99E60]);
          v15 = objc_opt_class();
          v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("mediaQueryParams"));
          v17 = objc_claimAutoreleasedReturnValue();
          mediaQueryParams = v11->_mediaQueryParams;
          v11->_mediaQueryParams = (NSDictionary *)v17;

          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformOverride"));
          v19 = objc_claimAutoreleasedReturnValue();
          platformOverride = v11->_platformOverride;
          v11->_platformOverride = (NSString *)v19;

        }
        self = v11;
        v21 = self;
      }
      else
      {
        v38 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v38)
          -[ASCLockupBatchRequest initWithCoder:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);
        v21 = 0;
      }

    }
    else
    {
      v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v30)
        -[ASCLockupBatchRequest initWithCoder:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
      v21 = 0;
    }

  }
  else
  {
    v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v22)
      -[ASCLockupBatchRequest initWithCoder:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    v21 = 0;
  }

  return v21;
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
  -[ASCLockupBatchRequest ids](self, "ids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ids"));

  -[ASCLockupBatchRequest kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kind"));

  -[ASCLockupBatchRequest context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("context"));

  -[ASCLockupBatchRequest clientID](self, "clientID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("clientID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"), CFSTR("enableAppDistribution"));
  -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("mediaQueryParams"));

  -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
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
  -[ASCLockupBatchRequest ids](self, "ids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLockupBatchRequest kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCLockupBatchRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCLockupBatchRequest clientID](self, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"));
  -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  v10 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupBatchRequest *v4;
  ASCLockupBatchRequest *v5;
  ASCLockupBatchRequest *v6;
  BOOL v7;
  ASCLockupBatchRequest *v8;
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
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = (ASCLockupBatchRequest *)a3;
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
    -[ASCLockupBatchRequest ids](self, "ids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupBatchRequest ids](v8, "ids");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
      {
LABEL_12:
        -[ASCLockupBatchRequest kind](self, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLockupBatchRequest kind](v8, "kind");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          if (objc_msgSend(v12, "isEqual:", v13))
          {
LABEL_15:
            -[ASCLockupBatchRequest context](self, "context");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASCLockupBatchRequest context](v8, "context");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if (objc_msgSend(v15, "isEqual:", v16))
              {
LABEL_18:
                v37 = v17;
                -[ASCLockupBatchRequest clientID](self, "clientID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ASCLockupBatchRequest clientID](v8, "clientID");
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                if (v18 && v19)
                {
                  if (objc_msgSend(v18, "isEqual:", v19))
                    goto LABEL_21;
                }
                else if (v18 == (void *)v19)
                {
LABEL_21:
                  v34 = v18;
                  v36 = v20;
                  v21 = -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution");
                  if (v21 != -[ASCLockupBatchRequest enableAppDistribution](v8, "enableAppDistribution"))
                  {
                    v7 = 0;
LABEL_43:
                    v20 = v36;
                    goto LABEL_44;
                  }
                  -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ASCLockupBatchRequest mediaQueryParams](v8, "mediaQueryParams");
                  v23 = objc_claimAutoreleasedReturnValue();
                  v24 = (void *)v23;
                  if (v22 && v23)
                  {
                    v25 = (void *)v23;
                    v26 = objc_msgSend(v22, "isEqual:", v23);
                    v24 = v25;
                    v18 = v34;
                    if (v26)
                      goto LABEL_35;
                  }
                  else if (v22 == (void *)v23)
                  {
LABEL_35:
                    v33 = v24;
                    -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ASCLockupBatchRequest platformOverride](v8, "platformOverride");
                    v28 = objc_claimAutoreleasedReturnValue();
                    v29 = (void *)v28;
                    v35 = v27;
                    if (v27 && v28)
                    {
                      v32 = (void *)v28;
                      v30 = objc_msgSend(v27, "isEqual:", v28);
                      v29 = v32;
                      v7 = v30;
                    }
                    else
                    {
                      v7 = v27 == (void *)v28;
                    }

                    v24 = v33;
                    goto LABEL_42;
                  }
                  v7 = 0;
LABEL_42:

                  goto LABEL_43;
                }
                v7 = 0;
LABEL_44:

                v17 = v37;
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

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupBatchRequest ids](self, "ids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("ids"));

  -[ASCLockupBatchRequest kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("kind"));

  -[ASCLockupBatchRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("context"));

  -[ASCLockupBatchRequest clientID](self, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("clientID"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"), CFSTR("enableAppDistribution"));
  -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, CFSTR("mediaQueryParams"));

  }
  -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("platformOverride"));

  }
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSArray)requests
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ASCLockupRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ASCLockupBatchRequest ids](self, "ids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ASCLockupBatchRequest ids](self, "ids");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v11 = [ASCLockupRequest alloc];
        -[ASCLockupBatchRequest kind](self, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLockupBatchRequest context](self, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLockupBatchRequest clientID](self, "clientID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[ASCLockupRequest _initWithID:kind:context:clientID:enableAppDistribution:](v11, "_initWithID:kind:context:clientID:enableAppDistribution:", v10, v12, v13, v14, -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"));

        -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lockupRequestWithMediaQueryParams:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v18;
        }
        -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_lockupRequestWithPlatformOverride:", v20);
          v21 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v21;
        }
        objc_msgSend(v5, "addObject:", v15);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  v22 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v22;
}

- (ASCLockupBatchRequest)lockupBatchRequestWithIDs:(id)a3
{
  id v4;
  ASCLockupBatchRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = [ASCLockupBatchRequest alloc];
  -[ASCLockupBatchRequest kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupBatchRequest context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupBatchRequest clientID](self, "clientID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution");
  -[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupBatchRequest platformOverride](self, "platformOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ASCLockupBatchRequest _initWithIDs:kind:context:clientID:enableAppDistribution:mediaQueryParams:platformOverride:](v5, "_initWithIDs:kind:context:clientID:enableAppDistribution:mediaQueryParams:platformOverride:", v4, v6, v7, v8, v9, v10, v11);

  return (ASCLockupBatchRequest *)v12;
}

- (NSSet)ids
{
  return self->_ids;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (BOOL)enableAppDistribution
{
  return self->_enableAppDistribution;
}

- (NSDictionary)mediaQueryParams
{
  return self->_mediaQueryParams;
}

- (NSString)platformOverride
{
  return self->_platformOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformOverride, 0);
  objc_storeStrong((id *)&self->_mediaQueryParams, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_ids, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCLockupRequest because ids was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCLockupRequest because kind was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCLockupRequest because context was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
