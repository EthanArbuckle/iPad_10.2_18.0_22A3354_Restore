@implementation AEAssessmentApplicationDescriptor

- (AEAssessmentApplicationDescriptor)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 requiresSignatureValidation:(BOOL)a5
{
  id v8;
  id v9;
  AEAssessmentApplicationDescriptor *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSString *teamIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AEAssessmentApplicationDescriptor;
  v10 = -[AEAssessmentApplicationDescriptor init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    teamIdentifier = v10->_teamIdentifier;
    v10->_teamIdentifier = (NSString *)v13;

    v10->_requiresSignatureValidation = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEAssessmentApplicationDescriptor)initWithCoder:(id)a3
{
  id v4;
  AEAssessmentApplicationDescriptor *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *teamIdentifier;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AEAssessmentApplicationDescriptor;
  v5 = -[AEAssessmentApplicationDescriptor init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresSignatureValidation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresSignatureValidation = objc_msgSend(v10, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AEAssessmentApplicationDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[AEAssessmentApplicationDescriptor teamIdentifier](self, "teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("teamIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentApplicationDescriptor requiresSignatureValidation](self, "requiresSignatureValidation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("requiresSignatureValidation"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[AEAssessmentApplicationDescriptor bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AEAssessmentApplicationDescriptor teamIdentifier](self, "teamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentApplicationDescriptor requiresSignatureValidation](self, "requiresSignatureValidation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AEAssessmentApplicationDescriptor *v4;
  AEAssessmentApplicationDescriptor *v5;
  unsigned __int8 v6;

  v4 = (AEAssessmentApplicationDescriptor *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[AEAssessmentApplicationDescriptor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v6 = -[AEAssessmentApplicationDescriptor isEqualToDescriptor:](self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (void)isEqualToDescriptor:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v16;
  void *v17;
  int v18;

  v8 = a2;
  if (!a1)
    goto LABEL_24;
  objc_msgSend(a1, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "bundleIdentifier"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(a1, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "isEqual:", v3))
    {

      a1 = 0;
      goto LABEL_21;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(a1, "teamIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v8, "teamIdentifier"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(a1, "teamIdentifier", v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "teamIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
    {

      a1 = 0;
      if (v11)
        goto LABEL_19;
LABEL_13:

      if ((v10 & 1) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
    v18 = v10;
    v12 = v4;
    v13 = 1;
  }
  else
  {
    v18 = v10;
    v12 = v4;
    v17 = 0;
    v13 = 0;
  }
  v14 = objc_msgSend(a1, "requiresSignatureValidation", v17);
  a1 = (void *)(v14 ^ objc_msgSend(v8, "requiresSignatureValidation") ^ 1);
  if (v13)
  {

  }
  v4 = v12;
  v10 = v18;
  if (!v11)
    goto LABEL_13;
LABEL_19:

  if (v10)
  {
LABEL_20:

  }
LABEL_21:
  if (!v9)

LABEL_24:
  return a1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AEAssessmentApplicationDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssessmentApplicationDescriptor teamIdentifier](self, "teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AEAssessmentApplicationDescriptor requiresSignatureValidation](self, "requiresSignatureValidation");
  v8 = CFSTR("No");
  if (v7)
    v8 = CFSTR("Yes");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { bundleIdentifier = %@, teamIdentifier = %@, requiresSignatureValidation = %@ }>"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (BOOL)requiresSignatureValidation
{
  return self->_requiresSignatureValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
