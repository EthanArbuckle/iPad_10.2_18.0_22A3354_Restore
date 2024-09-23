@implementation HKOAuth2TokenSession

- (HKOAuth2TokenSession)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKOAuth2TokenSession)initWithCode:(id)a3 query:(id)a4 requestedScope:(id)a5 state:(id)a6
{
  return -[HKOAuth2TokenSession initWithCode:query:requestedScope:state:pkceVerifier:](self, "initWithCode:query:requestedScope:state:pkceVerifier:", a3, a4, a5, a6, 0);
}

- (HKOAuth2TokenSession)initWithCode:(id)a3 query:(id)a4 requestedScope:(id)a5 state:(id)a6 pkceVerifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKOAuth2TokenSession *v17;
  uint64_t v18;
  NSString *code;
  uint64_t v20;
  NSString *query;
  uint64_t v22;
  NSString *requestedScope;
  uint64_t v24;
  NSUUID *state;
  uint64_t v26;
  NSString *pkceVerifier;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKOAuth2TokenSession;
  v17 = -[HKOAuth2TokenSession init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    code = v17->_code;
    v17->_code = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    query = v17->_query;
    v17->_query = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    requestedScope = v17->_requestedScope;
    v17->_requestedScope = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    state = v17->_state;
    v17->_state = (NSUUID *)v24;

    v26 = objc_msgSend(v16, "copy");
    pkceVerifier = v17->_pkceVerifier;
    v17->_pkceVerifier = (NSString *)v26;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HKOAuth2TokenSession *v7;
  HKOAuth2TokenSession *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v7 = (HKOAuth2TokenSession *)a3;
  if (v7 == self)
  {
    v14 = 1;
  }
  else
  {
    if (-[HKOAuth2TokenSession isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class()))
    {
      v8 = v7;
      -[HKOAuth2TokenSession code](v8, "code");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOAuth2TokenSession code](self, "code");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[HKOAuth2TokenSession code](self, "code");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
          goto LABEL_61;
        }
        v3 = (void *)v11;
        -[HKOAuth2TokenSession code](v8, "code");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOAuth2TokenSession code](self, "code");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v12;
        if (!objc_msgSend(v12, "isEqualToString:", v13))
        {
          v14 = 0;
LABEL_60:

          goto LABEL_61;
        }
        v59 = v13;
      }
      -[HKOAuth2TokenSession query](v8, "query");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOAuth2TokenSession query](self, "query");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 == (void *)v16)
      {
        v56 = (void *)v16;
      }
      else
      {
        -[HKOAuth2TokenSession query](self, "query");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {

          goto LABEL_48;
        }
        v4 = v15;
        v55 = (void *)v18;
        -[HKOAuth2TokenSession query](v8, "query");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOAuth2TokenSession query](self, "query");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "isEqualToString:", v19) & 1) == 0)
        {

          v14 = 0;
          v13 = v59;
          if (v9 == v10)
            goto LABEL_61;
          goto LABEL_60;
        }
        v56 = v17;
        v52 = v19;
        v15 = v4;
      }
      -[HKOAuth2TokenSession requestedScope](v8, "requestedScope");
      v20 = objc_claimAutoreleasedReturnValue();
      -[HKOAuth2TokenSession requestedScope](self, "requestedScope");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)v20;
      if ((void *)v20 == v58)
        goto LABEL_21;
      -[HKOAuth2TokenSession requestedScope](self, "requestedScope");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v54 = v5;
        v14 = 0;
        v28 = v52;
LABEL_54:

LABEL_55:
        v41 = v56;
        if (v15 != v56)
        {

          goto LABEL_57;
        }
        goto LABEL_58;
      }
      v22 = v15;
      v50 = (void *)v21;
      -[HKOAuth2TokenSession requestedScope](v8, "requestedScope");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOAuth2TokenSession requestedScope](self, "requestedScope");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqualToString:", v4) & 1) != 0)
      {
        v47 = v23;
        v15 = v22;
LABEL_21:
        -[HKOAuth2TokenSession state](v8, "state");
        v24 = objc_claimAutoreleasedReturnValue();
        -[HKOAuth2TokenSession state](self, "state");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)v24;
        v54 = v5;
        if ((void *)v24 == v51)
        {
          v48 = v15;
          v49 = v4;
          v57 = v3;
          -[HKOAuth2TokenSession pkceVerifier](v8, "pkceVerifier", v43);
        }
        else
        {
          -[HKOAuth2TokenSession state](self, "state");
          v25 = objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            v14 = 0;
            v36 = v51;
            goto LABEL_42;
          }
          v49 = v4;
          v46 = (void *)v25;
          -[HKOAuth2TokenSession state](v8, "state");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKOAuth2TokenSession state](self, "state");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "isEqual:", v27) & 1) == 0)
          {

            v14 = 0;
            v37 = v60;
            v38 = v58;
            v28 = v52;
            v39 = v4;
            if (v60 != v58)
            {
LABEL_53:

              goto LABEL_54;
            }
LABEL_38:

            goto LABEL_55;
          }
          v45 = v27;
          v48 = v15;
          v57 = v3;
          -[HKOAuth2TokenSession pkceVerifier](v8, "pkceVerifier", v26);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOAuth2TokenSession pkceVerifier](self, "pkceVerifier");
        v30 = objc_claimAutoreleasedReturnValue();
        v14 = v29 == (void *)v30;
        if (v29 == (void *)v30)
        {

        }
        else
        {
          v31 = (void *)v30;
          -[HKOAuth2TokenSession pkceVerifier](self, "pkceVerifier");
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = (void *)v32;
            -[HKOAuth2TokenSession pkceVerifier](v8, "pkceVerifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKOAuth2TokenSession pkceVerifier](self, "pkceVerifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v34, "isEqual:", v35);

            if (v53 == v51)
            {

            }
            else
            {

            }
            v37 = v60;
            v3 = v57;
            v38 = v58;
            v28 = v52;
            v15 = v48;
            v39 = v49;
            if (v60 != v58)
              goto LABEL_53;
            goto LABEL_38;
          }

        }
        v36 = v51;
        if (v53 == v51)
        {

          v3 = v57;
          v40 = v58;
          v15 = v48;
          v4 = v49;
          if (v60 == v58)
          {
LABEL_44:

            v41 = v56;
            if (v15 != v56)
            {

LABEL_57:
            }
LABEL_58:

LABEL_59:
            v13 = v59;
            if (v9 != v10)
              goto LABEL_60;
LABEL_61:

            goto LABEL_62;
          }
LABEL_43:

          goto LABEL_44;
        }

        v3 = v57;
        v15 = v48;
        v4 = v49;
LABEL_42:

        v40 = v58;
        if (v60 == v58)
          goto LABEL_44;
        goto LABEL_43;
      }

      if (v22 == v56)
      {

      }
      else
      {

      }
LABEL_48:
      v14 = 0;
      goto LABEL_59;
    }
    v14 = 0;
  }
LABEL_62:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[HKOAuth2TokenSession code](self, "code");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKOAuth2TokenSession query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HKOAuth2TokenSession requestedScope](self, "requestedScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HKOAuth2TokenSession state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[HKOAuth2TokenSession pkceVerifier](self, "pkceVerifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HKOAuth2TokenSession code](self, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("code"));

  -[HKOAuth2TokenSession query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("query"));

  -[HKOAuth2TokenSession requestedScope](self, "requestedScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("requestedScope"));

  -[HKOAuth2TokenSession state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("state"));

  -[HKOAuth2TokenSession pkceVerifier](self, "pkceVerifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("pkceVerifier"));

}

- (HKOAuth2TokenSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKOAuth2TokenSession *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedScope"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pkceVerifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v6 && v7 && v8)
  {
    self = -[HKOAuth2TokenSession initWithCode:query:requestedScope:state:pkceVerifier:](self, "initWithCode:query:requestedScope:state:pkceVerifier:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)query
{
  return self->_query;
}

- (NSString)requestedScope
{
  return self->_requestedScope;
}

- (NSUUID)state
{
  return self->_state;
}

- (NSString)pkceVerifier
{
  return self->_pkceVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pkceVerifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_requestedScope, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
