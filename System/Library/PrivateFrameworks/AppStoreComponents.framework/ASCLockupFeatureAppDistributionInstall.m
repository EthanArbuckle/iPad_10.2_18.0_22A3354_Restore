@implementation ASCLockupFeatureAppDistributionInstall

- (ASCLockupFeatureAppDistributionInstall)initWithDeveloperId:(id)a3 webDistributionDomains:(id)a4 supportUrl:(id)a5 contentRatingsBySystem:(id)a6 isDistributor:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ASCLockupFeatureAppDistributionInstall *v16;
  uint64_t v17;
  NSString *developerId;
  uint64_t v19;
  NSArray *webDistributionDomains;
  uint64_t v21;
  NSString *supportUrl;
  uint64_t v23;
  NSDictionary *contentRatingsBySystem;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ASCLockupFeatureAppDistributionInstall;
  v16 = -[ASCLockupFeatureAppDistributionInstall init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    developerId = v16->_developerId;
    v16->_developerId = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    webDistributionDomains = v16->_webDistributionDomains;
    v16->_webDistributionDomains = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    supportUrl = v16->_supportUrl;
    v16->_supportUrl = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    contentRatingsBySystem = v16->_contentRatingsBySystem;
    v16->_contentRatingsBySystem = (NSDictionary *)v23;

    v16->_isDistributor = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureAppDistributionInstall)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  ASCLockupFeatureAppDistributionInstall *v15;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("developerId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("webDistributionDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportUrl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("contentRatingsBySystem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isDistributor"));

  v15 = -[ASCLockupFeatureAppDistributionInstall initWithDeveloperId:webDistributionDomains:supportUrl:contentRatingsBySystem:isDistributor:](self, "initWithDeveloperId:webDistributionDomains:supportUrl:contentRatingsBySystem:isDistributor:", v4, v5, v6, v13, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASCLockupFeatureAppDistributionInstall developerId](self, "developerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("developerId"));

  -[ASCLockupFeatureAppDistributionInstall webDistributionDomains](self, "webDistributionDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("webDistributionDomains"));

  -[ASCLockupFeatureAppDistributionInstall supportUrl](self, "supportUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("supportUrl"));

  -[ASCLockupFeatureAppDistributionInstall contentRatingsBySystem](self, "contentRatingsBySystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("contentRatingsBySystem"));

  objc_msgSend(v8, "encodeBool:forKey:", -[ASCLockupFeatureAppDistributionInstall isDistributor](self, "isDistributor"), CFSTR("isDistributor"));
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
  -[ASCLockupFeatureAppDistributionInstall developerId](self, "developerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLockupFeatureAppDistributionInstall webDistributionDomains](self, "webDistributionDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCLockupFeatureAppDistributionInstall supportUrl](self, "supportUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCLockupFeatureAppDistributionInstall contentRatingsBySystem](self, "contentRatingsBySystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCLockupFeatureAppDistributionInstall isDistributor](self, "isDistributor"));
  v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureAppDistributionInstall *v4;
  ASCLockupFeatureAppDistributionInstall *v5;
  ASCLockupFeatureAppDistributionInstall *v6;
  char v7;
  ASCLockupFeatureAppDistributionInstall *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  BOOL v24;
  BOOL v25;
  void *v27;

  v4 = (ASCLockupFeatureAppDistributionInstall *)a3;
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
    -[ASCLockupFeatureAppDistributionInstall developerId](self, "developerId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupFeatureAppDistributionInstall developerId](v8, "developerId");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
      {
LABEL_12:
        -[ASCLockupFeatureAppDistributionInstall webDistributionDomains](self, "webDistributionDomains");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLockupFeatureAppDistributionInstall webDistributionDomains](v8, "webDistributionDomains");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          if (objc_msgSend(v12, "isEqual:", v13))
          {
LABEL_15:
            -[ASCLockupFeatureAppDistributionInstall supportUrl](self, "supportUrl");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASCLockupFeatureAppDistributionInstall supportUrl](v8, "supportUrl");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if (objc_msgSend(v15, "isEqual:", v16))
              {
LABEL_18:
                -[ASCLockupFeatureAppDistributionInstall contentRatingsBySystem](self, "contentRatingsBySystem");
                v18 = objc_claimAutoreleasedReturnValue();
                -[ASCLockupFeatureAppDistributionInstall contentRatingsBySystem](v8, "contentRatingsBySystem");
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                v27 = (void *)v18;
                if (v18 && v19)
                {
                  v21 = (void *)v19;
                  v22 = objc_msgSend(v27, "isEqual:", v19);
                  v20 = v21;
                  if (v22)
                  {
LABEL_21:
                    v23 = v20;
                    v24 = -[ASCLockupFeatureAppDistributionInstall isDistributor](self, "isDistributor");
                    v25 = -[ASCLockupFeatureAppDistributionInstall isDistributor](v8, "isDistributor");
                    v20 = v23;
                    v7 = v24 ^ v25 ^ 1;
LABEL_31:

                    goto LABEL_32;
                  }
                }
                else if (v18 == v19)
                {
                  goto LABEL_21;
                }
                v7 = 0;
                goto LABEL_31;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_18;
            }
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

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupFeatureAppDistributionInstall developerId](self, "developerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("developerId"));

  -[ASCLockupFeatureAppDistributionInstall webDistributionDomains](self, "webDistributionDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("webDistributionDomains"));

  -[ASCLockupFeatureAppDistributionInstall supportUrl](self, "supportUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("supportUrl"));

  -[ASCLockupFeatureAppDistributionInstall contentRatingsBySystem](self, "contentRatingsBySystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("contentRatingsBySystem"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCLockupFeatureAppDistributionInstall isDistributor](self, "isDistributor"), CFSTR("isDistributor"));
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)developerId
{
  return self->_developerId;
}

- (NSArray)webDistributionDomains
{
  return self->_webDistributionDomains;
}

- (NSString)supportUrl
{
  return self->_supportUrl;
}

- (NSDictionary)contentRatingsBySystem
{
  return self->_contentRatingsBySystem;
}

- (BOOL)isDistributor
{
  return self->_isDistributor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRatingsBySystem, 0);
  objc_storeStrong((id *)&self->_supportUrl, 0);
  objc_storeStrong((id *)&self->_webDistributionDomains, 0);
  objc_storeStrong((id *)&self->_developerId, 0);
}

@end
