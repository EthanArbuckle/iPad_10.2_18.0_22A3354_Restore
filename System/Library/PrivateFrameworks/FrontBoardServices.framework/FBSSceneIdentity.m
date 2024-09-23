@implementation FBSSceneIdentity

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (id)identityForIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "identityForIdentifier:workspaceIdentifier:internalWorkspaceIdentifier:", a3, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  FBSSceneIdentity *v4;
  char v5;

  v4 = (FBSSceneIdentity *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (BSEqualStrings())
  {
    v5 = BSEqualStrings();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWorkspaceIdentifier, 0);
  objc_storeStrong((id *)&self->_workspaceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (FBSSceneIdentity)initWithBSXPCCoder:(id)a3
{
  id v4;
  FBSSceneIdentity *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *workspaceIdentifier;
  uint64_t v10;
  NSString *internalWorkspaceIdentifier;

  v4 = a3;
  v5 = -[FBSSceneIdentity init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("w"));
    v8 = objc_claimAutoreleasedReturnValue();
    workspaceIdentifier = v5->_workspaceIdentifier;
    v5->_workspaceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("iw"));
    v10 = objc_claimAutoreleasedReturnValue();
    internalWorkspaceIdentifier = v5->_internalWorkspaceIdentifier;
    v5->_internalWorkspaceIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workspaceIdentifier, CFSTR("w"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_internalWorkspaceIdentifier, CFSTR("iw"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  +[FBSSceneIdentity identityForIdentifier:workspaceIdentifier:internalWorkspaceIdentifier:](FBSMutableSceneIdentity, "identityForIdentifier:workspaceIdentifier:internalWorkspaceIdentifier:", self->_identifier, self->_workspaceIdentifier, self->_internalWorkspaceIdentifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identityForIdentifier:(id)a3 workspaceIdentifier:(id)a4 internalWorkspaceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  if (a3)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    v11 = objc_alloc_init((Class)a1);
    v12 = objc_msgSend(v10, "copy");

    v13 = (void *)v11[1];
    v11[1] = v12;

    v14 = objc_msgSend(v9, "copy");
    v15 = (void *)v11[2];
    v11[2] = v14;

    v16 = objc_msgSend(v8, "copy");
    v17 = (void *)v11[3];
    v11[3] = v16;

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)identityForIdentifier:(id)a3 workspaceIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "identityForIdentifier:workspaceIdentifier:internalWorkspaceIdentifier:", a3, a4, 0);
}

- (NSString)description
{
  NSString *workspaceIdentifier;
  NSString *internalWorkspaceIdentifier;
  NSString *identifier;
  NSString *v5;
  uint64_t v7;

  workspaceIdentifier = self->_workspaceIdentifier;
  internalWorkspaceIdentifier = self->_internalWorkspaceIdentifier;
  if (internalWorkspaceIdentifier)
  {
    identifier = self->_identifier;
    if (workspaceIdentifier)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@):%@"), workspaceIdentifier, internalWorkspaceIdentifier, identifier);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@):%@"), internalWorkspaceIdentifier, identifier, v7);
  }
  else
  {
    if (!workspaceIdentifier)
    {
      v5 = self->_identifier;
      return v5;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), workspaceIdentifier, self->_identifier, v7);
  }
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)workspaceIdentifier
{
  return self->_workspaceIdentifier;
}

- (BOOL)isValid
{
  return self->_identifier != 0;
}

- (NSString)internalWorkspaceIdentifier
{
  NSString *internalWorkspaceIdentifier;

  internalWorkspaceIdentifier = self->_internalWorkspaceIdentifier;
  if (!internalWorkspaceIdentifier)
    internalWorkspaceIdentifier = self->_workspaceIdentifier;
  return internalWorkspaceIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workspaceIdentifier, CFSTR("w"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_internalWorkspaceIdentifier, CFSTR("iw"));

}

- (FBSSceneIdentity)initWithCoder:(id)a3
{
  id v4;
  FBSSceneIdentity *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *workspaceIdentifier;
  uint64_t v10;
  NSString *internalWorkspaceIdentifier;

  v4 = a3;
  v5 = -[FBSSceneIdentity init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("w"));
    v8 = objc_claimAutoreleasedReturnValue();
    workspaceIdentifier = v5->_workspaceIdentifier;
    v5->_workspaceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iw"));
    v10 = objc_claimAutoreleasedReturnValue();
    internalWorkspaceIdentifier = v5->_internalWorkspaceIdentifier;
    v5->_internalWorkspaceIdentifier = (NSString *)v10;

  }
  return v5;
}

@end
