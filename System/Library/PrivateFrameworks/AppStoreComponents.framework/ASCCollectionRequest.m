@implementation ASCCollectionRequest

- (ASCCollectionRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  ASCCollectionRequest *v13;
  uint64_t v14;
  NSString *id;
  uint64_t v16;
  NSString *kind;
  uint64_t v18;
  NSString *context;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v21.receiver = self;
  v21.super_class = (Class)ASCCollectionRequest;
  v13 = -[ASCCollectionRequest init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    id = v13->_id;
    v13->_id = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    kind = v13->_kind;
    v13->_kind = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    context = v13->_context;
    v13->_context = (NSString *)v18;

    v13->_limit = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCCollectionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ASCCollectionRequest *v8;
  uint64_t v9;
  NSString *clientID;
  ASCCollectionRequest *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

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
        v8 = -[ASCCollectionRequest initWithID:kind:context:limit:](self, "initWithID:kind:context:limit:", v5, v6, v7, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit")));
        if (v8)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
          v9 = objc_claimAutoreleasedReturnValue();
          clientID = v8->_clientID;
          v8->_clientID = (NSString *)v9;

        }
        self = v8;
        v11 = self;
      }
      else
      {
        v28 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v28)
          -[ASCCollectionRequest initWithCoder:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);
        v11 = 0;
      }

    }
    else
    {
      v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v20)
        -[ASCCollectionRequest initWithCoder:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
      v11 = 0;
    }

  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v12)
      -[ASCCollectionRequest initWithCoder:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ASCCollectionRequest id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCCollectionRequest kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kind"));

  -[ASCCollectionRequest context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("context"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCCollectionRequest limit](self, "limit"), CFSTR("limit"));
  -[ASCCollectionRequest clientID](self, "clientID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("clientID"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCCollectionRequest id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCCollectionRequest kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCCollectionRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCCollectionRequest limit](self, "limit"));
  -[ASCCollectionRequest clientID](self, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ASCCollectionRequest *v4;
  ASCCollectionRequest *v5;
  ASCCollectionRequest *v6;
  char v7;
  ASCCollectionRequest *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;

  v4 = (ASCCollectionRequest *)a3;
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
LABEL_35:

      goto LABEL_36;
    }
    -[ASCCollectionRequest id](self, "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCCollectionRequest id](v8, "id");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
      {
LABEL_12:
        -[ASCCollectionRequest kind](self, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCCollectionRequest kind](v8, "kind");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          if (objc_msgSend(v12, "isEqual:", v13))
          {
LABEL_15:
            -[ASCCollectionRequest context](self, "context");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASCCollectionRequest context](v8, "context");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if (!objc_msgSend(v15, "isEqual:", v16))
                goto LABEL_29;
            }
            else if (v15 != (void *)v16)
            {
              goto LABEL_29;
            }
            v18 = -[ASCCollectionRequest limit](self, "limit");
            if (v18 == -[ASCCollectionRequest limit](v8, "limit"))
            {
              -[ASCCollectionRequest clientID](self, "clientID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[ASCCollectionRequest clientID](v8, "clientID");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              v23 = v19;
              if (v19 && v20)
                v7 = objc_msgSend(v19, "isEqual:", v20);
              else
                v7 = v19 == (void *)v20;

              goto LABEL_32;
            }
LABEL_29:
            v7 = 0;
LABEL_32:

            goto LABEL_33;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_15;
        }
        v7 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    v7 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v7 = 1;
LABEL_36:

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

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCCollectionRequest id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCCollectionRequest kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("kind"));

  -[ASCCollectionRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("context"));

  -[ASCDescriber addInteger:withName:](v3, "addInteger:withName:", -[ASCCollectionRequest limit](self, "limit"), CFSTR("limit"));
  -[ASCCollectionRequest clientID](self, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("clientID"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_collectionRequestWithClientID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[ASCCollectionRequest id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCCollectionRequest kind](self, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCCollectionRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend(v5, "initWithID:kind:context:limit:", v6, v7, v8, -[ASCCollectionRequest limit](self, "limit"));

  v10 = (void *)v9[5];
  v9[5] = v4;

  return v9;
}

- (NSString)id
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

- (int64_t)limit
{
  return self->_limit;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6 clientID:(id)a7
{
  id v12;
  ASCCollectionRequest *v13;
  void *v14;

  v12 = a7;
  v13 = -[ASCCollectionRequest initWithID:kind:context:limit:](self, "initWithID:kind:context:limit:", a3, a4, a5, a6);
  -[ASCCollectionRequest collectionRequestWithClientID:](v13, "collectionRequestWithClientID:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6 clientID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[ASCCollectionRequest _initWithID:kind:context:limit:clientID:]([ASCCollectionRequest alloc], "_initWithID:kind:context:limit:clientID:", v14, v13, v12, a6, v11);

  return v15;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCCollectionRequest because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCCollectionRequest because kind was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCCollectionRequest because context was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
