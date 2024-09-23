@implementation AEAssessmentApplication

- (id)initWithBundleIdentifier:(void *)a3 teamIdentifier:(char)a4 requiresSignatureValidation:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)AEAssessmentApplication;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v9;

      v11 = objc_msgSend(v8, "copy");
      v12 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v11;

      *((_BYTE *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (AEAssessmentApplication)initWithBundleIdentifier:(NSString *)bundleIdentifier teamIdentifier:(NSString *)teamIdentifier
{
  return (AEAssessmentApplication *)-[AEAssessmentApplication initWithBundleIdentifier:teamIdentifier:requiresSignatureValidation:](self, bundleIdentifier, teamIdentifier, 1);
}

- (AEAssessmentApplication)initWithBundleIdentifier:(NSString *)bundleIdentifier
{
  return -[AEAssessmentApplication initWithBundleIdentifier:teamIdentifier:](self, "initWithBundleIdentifier:teamIdentifier:", bundleIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AEAssessmentApplication initWithBundleIdentifier:teamIdentifier:requiresSignatureValidation:](+[AEAssessmentApplication allocWithZone:](AEAssessmentApplication, "allocWithZone:", a3), self->_bundleIdentifier, self->_teamIdentifier, self->_requiresSignatureValidation);
}

- (id)applicationDescriptor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFC678]), "initWithBundleIdentifier:teamIdentifier:requiresSignatureValidation:", self->_bundleIdentifier, self->_teamIdentifier, self->_requiresSignatureValidation);
}

+ (id)instanceFromApplicationDescriptor:(id)a3
{
  id v3;
  AEAssessmentApplication *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  if (a3)
  {
    v3 = a3;
    v4 = [AEAssessmentApplication alloc];
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "teamIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "requiresSignatureValidation");

    v8 = -[AEAssessmentApplication initWithBundleIdentifier:teamIdentifier:requiresSignatureValidation:](v4, v5, v6, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[NSString hash](self->_teamIdentifier, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_requiresSignatureValidation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AEAssessmentApplication *v4;
  AEAssessmentApplication *v5;
  char v6;

  v4 = (AEAssessmentApplication *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[AEAssessmentApplication isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v6 = -[AEAssessmentApplication isEqualToApplication:]((uint64_t)self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToApplication:(uint64_t)a1
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 16);
    a1 = (!(v4 | v3[2]) || objc_msgSend((id)v4, "isEqual:"))
      && ((v5 = *(_QWORD *)(a1 + 24), !(v5 | v3[3])) || objc_msgSend((id)v5, "isEqual:"))
      && *(unsigned __int8 *)(a1 + 8) == *((unsigned __int8 *)v3 + 8);
  }

  return a1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self->_requiresSignatureValidation)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { bundleIdentifier = %@, teamIdentifier = %@, requiresSignatureChecks = %@ }>"), v4, self, self->_bundleIdentifier, self->_teamIdentifier, v5);
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

- (void)setRequiresSignatureValidation:(BOOL)requiresSignatureValidation
{
  self->_requiresSignatureValidation = requiresSignatureValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
