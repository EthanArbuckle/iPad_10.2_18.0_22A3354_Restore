@implementation ASCSecurityKeyPublicKeyCredentialLoginChoice

- (id)initRegistrationChoiceWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "userName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice _initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:](self, "_initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:", 0, v5, v6, 0, 0);
  return v7;
}

- (ASCSecurityKeyPublicKeyCredentialLoginChoice)initWithName:(id)a3 displayName:(id)a4 identifier:(id)a5 publicKeyCredentialOperationUUID:(id)a6
{
  return (ASCSecurityKeyPublicKeyCredentialLoginChoice *)-[ASCSecurityKeyPublicKeyCredentialLoginChoice _initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:](self, "_initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:", 1, a3, a4, a5, a6);
}

- (id)initAssertionPlaceholderChoice
{
  return -[ASCSecurityKeyPublicKeyCredentialLoginChoice _initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:](self, "_initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:", 2, 0, 0, 0, 0);
}

- (id)_initWithKind:(int64_t)a3 name:(id)a4 displayName:(id)a5 identifier:(id)a6 publicKeyCredentialOperationUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ASCSecurityKeyPublicKeyCredentialLoginChoice *v16;
  ASCSecurityKeyPublicKeyCredentialLoginChoice *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *displayName;
  uint64_t v22;
  WBSPublicKeyCredentialIdentifier *identifier;
  ASCSecurityKeyPublicKeyCredentialLoginChoice *v24;
  objc_super v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ASCSecurityKeyPublicKeyCredentialLoginChoice;
  v16 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_credentialKind = a3;
    v18 = objc_msgSend(v12, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (WBSPublicKeyCredentialIdentifier *)v22;

    objc_storeStrong((id *)&v17->_publicKeyCredentialOperationUUID, a7);
    v24 = v17;
  }

  return v17;
}

- (unint64_t)loginChoiceKind
{
  return 3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  int64_t credentialKind;
  char v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    credentialKind = self->_credentialKind;
    if (credentialKind == v5[3])
    {
      if ((credentialKind | 2) == 2)
      {
        v8 = 1;
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v5, "publicKeyCredentialOperationUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = WBSIsEqual();

      if (v10
        && -[NSString isEqualToString:](self->_name, "isEqualToString:", v6[1])
        && -[NSString isEqualToString:](self->_displayName, "isEqualToString:", v6[2]))
      {
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = WBSIsEqual();

        goto LABEL_11;
      }
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  void *v5;
  id v6;

  name = self->_name;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_credentialKind);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("credentialKind"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_publicKeyCredentialOperationUUID, CFSTR("publicKeyCredentialOperationUUID"));
}

- (ASCSecurityKeyPublicKeyCredentialLoginChoice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ASCSecurityKeyPublicKeyCredentialLoginChoice *v11;
  ASCSecurityKeyPublicKeyCredentialLoginChoice *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialKind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyCredentialOperationUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == 2)
  {
    v11 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice initAssertionPlaceholderChoice](self, "initAssertionPlaceholderChoice");
  }
  else if (v9 == 1)
  {
    v11 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice initWithName:displayName:identifier:publicKeyCredentialOperationUUID:](self, "initWithName:displayName:identifier:publicKeyCredentialOperationUUID:", v5, v6, v7, v10);
  }
  else
  {
    if (v9)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v11 = -[ASCSecurityKeyPublicKeyCredentialLoginChoice _initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:](self, "_initWithKind:name:displayName:identifier:publicKeyCredentialOperationUUID:", 0, v5, v6, 0, 0);
  }
  self = v11;
  v12 = self;
LABEL_9:

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)credentialKind
{
  return self->_credentialKind;
}

- (WBSPublicKeyCredentialIdentifier)identifier
{
  return self->_identifier;
}

- (NSUUID)publicKeyCredentialOperationUUID
{
  return self->_publicKeyCredentialOperationUUID;
}

- (void)setPublicKeyCredentialOperationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyCredentialOperationUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
