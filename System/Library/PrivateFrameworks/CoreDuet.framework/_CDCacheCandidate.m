@implementation _CDCacheCandidate

- (_CDCacheCandidate)initWithDomainId:(id)a3 derivedIntentId:(id)a4 bundleId:(id)a5 recipientsId:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _CDCacheCandidate *v15;
  _CDCacheCandidate *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_CDCacheCandidate;
  v15 = -[_CDCacheCandidate init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_domainId, a3);
    objc_storeStrong((id *)&v16->_derivedIntentId, a4);
    objc_storeStrong((id *)&v16->_bundleId, a5);
    objc_storeStrong((id *)&v16->_recipientsId, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  NSString *domainId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *derivedIntentId;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  NSString *bundleId;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSString *v22;
  NSString *v23;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (id *)v4;
      domainId = self->_domainId;
      v7 = (NSString *)v5[1];
      if (domainId == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = domainId;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_14;
      }
      derivedIntentId = self->_derivedIntentId;
      v13 = (NSString *)v5[2];
      if (derivedIntentId == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = derivedIntentId;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_14;
      }
      bundleId = self->_bundleId;
      v18 = (NSString *)v5[3];
      if (bundleId == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = bundleId;
        v21 = -[NSString isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
        {
LABEL_14:
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      v22 = self->_recipientsId;
      v23 = v22;
      if (v22 == v5[4])
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v22, "isEqual:");

      goto LABEL_20;
    }
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_derivedIntentId, "hash");
  v4 = -[NSString hash](self->_domainId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_bundleId, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_recipientsId, "hash") - v5 + 32 * v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_%@_%@"), self->_domainId, self->_derivedIntentId, self->_bundleId, self->_recipientsId);
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
  objc_storeStrong((id *)&self->_domainId, a3);
}

- (NSString)derivedIntentId
{
  return self->_derivedIntentId;
}

- (void)setDerivedIntentId:(id)a3
{
  objc_storeStrong((id *)&self->_derivedIntentId, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)recipientsId
{
  return self->_recipientsId;
}

- (void)setRecipientsId:(id)a3
{
  objc_storeStrong((id *)&self->_recipientsId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientsId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_derivedIntentId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
}

@end
