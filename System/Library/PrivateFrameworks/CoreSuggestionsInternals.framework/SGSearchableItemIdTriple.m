@implementation SGSearchableItemIdTriple

- (SGSearchableItemIdTriple)initWithBundleId:(id)a3 domainId:(id)a4 uniqueId:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SGSearchableItemIdTriple *v14;
  SGSearchableItemIdTriple *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSearchableItemIdTriple.m"), 11, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSearchableItemIdTriple.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SGSearchableItemIdTriple;
  v14 = -[SGSearchableItemIdTriple init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleId, a3);
    objc_storeStrong((id *)&v15->_domainId, a4);
    objc_storeStrong((id *)&v15->_uniqueId, a5);
  }

  return v15;
}

- (BOOL)isEqualToSearchableItemIdTriple:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *bundleId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *domainId;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *uniqueId;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_bundleId != 0;
  objc_msgSend(v4, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  bundleId = self->_bundleId;
  if (bundleId)
  {
    objc_msgSend(v5, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](bundleId, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_domainId != 0;
  objc_msgSend(v5, "domainId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  domainId = self->_domainId;
  if (domainId)
  {
    objc_msgSend(v5, "domainId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](domainId, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_uniqueId != 0;
  objc_msgSend(v5, "uniqueId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    uniqueId = self->_uniqueId;
    if (uniqueId)
    {
      objc_msgSend(v5, "uniqueId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSString isEqual:](uniqueId, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  SGSearchableItemIdTriple *v4;
  SGSearchableItemIdTriple *v5;
  BOOL v6;

  v4 = (SGSearchableItemIdTriple *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSearchableItemIdTriple isEqualToSearchableItemIdTriple:](self, "isEqualToSearchableItemIdTriple:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_domainId, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_uniqueId, "hash") - v4 + 32 * v4;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

+ (SGSearchableItemIdTriple)searchableItemIdTripleWithBundleId:(id)a3 domainId:(id)a4 uniqueId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleId:domainId:uniqueId:", v10, v9, v8);

  return (SGSearchableItemIdTriple *)v11;
}

@end
