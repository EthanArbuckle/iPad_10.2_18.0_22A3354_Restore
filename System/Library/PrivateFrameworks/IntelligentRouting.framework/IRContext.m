@implementation IRContext

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableSet *internalCandidateResults;
  void *v5;
  id v6;

  internalCandidateResults = self->_internalCandidateResults;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", internalCandidateResults, CFSTR("internalCandidateResults"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contextIdentifier, CFSTR("contextIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBannerClassificationUnavailable);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("isBannerClassificationUnavailable"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_internalCandidateResults, 0);
}

- (IRContext)init
{
  IRContext *v2;
  NSMutableSet *v3;
  NSMutableSet *internalCandidateResults;
  void *v5;
  uint64_t v6;
  NSString *contextIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IRContext;
  v2 = -[IRContext init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    internalCandidateResults = v2->_internalCandidateResults;
    v2->_internalCandidateResults = v3;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    contextIdentifier = v2->_contextIdentifier;
    v2->_contextIdentifier = (NSString *)v6;

  }
  return v2;
}

- (IRContext)initWithCoder:(id)a3
{
  id v4;
  IRContext *v5;
  void *v6;
  void *v7;
  void *v8;
  IRContext *v9;
  uint64_t v10;
  NSMutableSet *internalCandidateResults;
  void *v12;
  uint64_t v13;
  NSString *contextIdentifier;
  IRContext *v15;
  char v16;
  void *v17;
  uint64_t v18;
  NSString *bundleIdentifier;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IRContext;
  v5 = -[IRContext init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("internalCandidateResults"));
    v9 = (IRContext *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_self();
      v10 = objc_claimAutoreleasedReturnValue();

      internalCandidateResults = v5->_internalCandidateResults;
      v5->_internalCandidateResults = (NSMutableSet *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v13 = objc_claimAutoreleasedReturnValue();

      contextIdentifier = v5->_contextIdentifier;
      v5->_contextIdentifier = (NSString *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBannerClassificationUnavailable"));
      v15 = (IRContext *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
      if (v15)
      {
        v16 = -[IRContext BOOLValue](v15, "BOOLValue");

        v5->_isBannerClassificationUnavailable = v16;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v18 = objc_claimAutoreleasedReturnValue();

        bundleIdentifier = v5->_bundleIdentifier;
        v5->_bundleIdentifier = (NSString *)v18;

        v9 = v5;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)candidateResults
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_internalCandidateResults, "copy");
}

+ (id)new
{
  return objc_alloc_init(IRContext);
}

- (void)addCandidateResult:(id)a3
{
  -[NSMutableSet addObject:](self->_internalCandidateResults, "addObject:", a3);
}

- (void)updateIsBannerClassificationUnavailable:(BOOL)a3
{
  self->_isBannerClassificationUnavailable = a3;
}

- (void)updateBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_contextIdentifier, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v6;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:copyItems:", self->_internalCandidateResults, 1);
  v9 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v8;

  *((_BYTE *)v5 + 16) = self->_isBannerClassificationUnavailable;
  objc_storeStrong((id *)v5 + 4, self->_bundleIdentifier);
  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", candidateResults: %@"), self->_internalCandidateResults);
  objc_msgSend(v6, "appendFormat:", CFSTR(", contextIdentifier: %@"), self->_contextIdentifier);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBannerClassificationUnavailable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isBannerClassificationUnavailable: %@"), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR(", bundleIdentifier: %@"), self->_bundleIdentifier);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IRContext candidateResults](self, "candidateResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[IRContext candidateResults](self, "candidateResults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidateResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
        goto LABEL_10;
    }
    -[IRContext contextIdentifier](self, "contextIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {

    }
    else
    {
      -[IRContext contextIdentifier](self, "contextIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_10;
    }
    v15 = -[IRContext isBannerClassificationUnavailable](self, "isBannerClassificationUnavailable");
    if (v15 == objc_msgSend(v5, "isBannerClassificationUnavailable"))
    {
      -[IRContext bundleIdentifier](self, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqual:", v18))
      {

        v8 = 1;
      }
      else
      {
        -[IRContext bundleIdentifier](self, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v19 != v20;

        v8 = !v21;
      }
      goto LABEL_11;
    }
LABEL_10:
    v8 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v8 = 0;
LABEL_12:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  _BOOL8 isBannerClassificationUnavailable;

  v3 = -[NSMutableSet hash](self->_internalCandidateResults, "hash");
  v4 = -[NSString hash](self->_contextIdentifier, "hash") ^ v3;
  isBannerClassificationUnavailable = self->_isBannerClassificationUnavailable;
  return v4 ^ isBannerClassificationUnavailable ^ -[NSString hash](self->_bundleIdentifier, "hash");
}

- (BOOL)isBannerClassificationUnavailable
{
  return self->_isBannerClassificationUnavailable;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end
