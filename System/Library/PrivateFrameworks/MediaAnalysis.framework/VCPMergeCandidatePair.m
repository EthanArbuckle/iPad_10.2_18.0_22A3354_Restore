@implementation VCPMergeCandidatePair

+ (id)mergeCandidatePairWithPerson:(id)a3 andPerson:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  id v9;
  VCPMergeCandidatePair *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[VCPMergeCandidatePair initWithPerson:andPerson:reason:]([VCPMergeCandidatePair alloc], "initWithPerson:andPerson:reason:", v7, v8, v9);

  return v10;
}

- (VCPMergeCandidatePair)initWithPerson:(id)a3 andPerson:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMergeCandidatePair *v12;
  VCPMergeCandidatePair *v13;
  uint64_t v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VCPMergeCandidatePair;
  v12 = -[VCPMergeCandidatePair init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_person1LocalIdentifier, a3);
    objc_storeStrong((id *)&v13->_person2LocalIdentifier, a4);
    objc_storeStrong((id *)&v13->_reason, a5);
    v14 = -[NSString hash](v13->_person1LocalIdentifier, "hash");
    v13->_hash = -[NSString hash](v13->_person2LocalIdentifier, "hash") ^ v14;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  VCPMergeCandidatePair *v5;
  uint64_t v6;
  BOOL v7;
  VCPMergeCandidatePair *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v5 = (VCPMergeCandidatePair *)a3;
  if (v5 == self)
    goto LABEL_11;
  v6 = objc_opt_class();
  if (v6 != objc_opt_class())
    goto LABEL_3;
  v8 = v5;
  -[VCPMergeCandidatePair person1LocalIdentifier](v8, "person1LocalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", self->_person1LocalIdentifier);
  if (v10)
  {
    -[VCPMergeCandidatePair person2LocalIdentifier](v8, "person2LocalIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", self->_person2LocalIdentifier))
    {

      goto LABEL_11;
    }
  }
  -[VCPMergeCandidatePair person1LocalIdentifier](v8, "person1LocalIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", self->_person2LocalIdentifier))
  {

    if (v10)
    goto LABEL_3;
  }
  -[VCPMergeCandidatePair person2LocalIdentifier](v8, "person2LocalIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", self->_person1LocalIdentifier);

  if ((v10 & 1) != 0)
  if ((v13 & 1) != 0)
  {
LABEL_11:
    v7 = 1;
    goto LABEL_12;
  }
LABEL_3:
  v7 = 0;
LABEL_12:

  return v7;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n%@ <%p>:\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  person1LocalIdentifier  : %@\n"), self->_person1LocalIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("  person2LocalIdentifier  : %@\n"), self->_person2LocalIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("  reason                  : %@\n"), self->_reason);
  return v3;
}

- (NSString)person1LocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)person2LocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_person2LocalIdentifier, 0);
  objc_storeStrong((id *)&self->_person1LocalIdentifier, 0);
}

@end
