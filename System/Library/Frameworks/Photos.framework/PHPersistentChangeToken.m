@implementation PHPersistentChangeToken

- (PHPersistentChangeToken)initWithPersistentHistoryToken:(id)a3 version:(int)a4
{
  id v6;
  PHPersistentChangeToken *v7;
  uint64_t v8;
  NSPersistentHistoryToken *persistentHistoryToken;
  PHPersistentChangeToken *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PHPersistentChangeToken;
  v7 = -[PHPersistentChangeToken init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    persistentHistoryToken = v7->_persistentHistoryToken;
    v7->_persistentHistoryToken = (NSPersistentHistoryToken *)v8;

    v7->_version = a4;
    v10 = v7;
  }

  return v7;
}

- (PHPersistentChangeToken)initWithPersistentHistoryToken:(id)a3
{
  return -[PHPersistentChangeToken initWithPersistentHistoryToken:version:](self, "initWithPersistentHistoryToken:version:", a3, 1);
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D716C0], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("persistentHistoryToken"), "@", &self->_persistentHistoryToken);
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("version"), "i", &self->_version);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToPersistentChangeToken:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "version");
  if (v5 == -[PHPersistentChangeToken version](self, "version"))
  {
    objc_msgSend(v4, "persistentHistoryToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPersistentChangeToken persistentHistoryToken](self, "persistentHistoryToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PHPersistentChangeToken *v4;
  BOOL v5;

  v4 = (PHPersistentChangeToken *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PHPersistentChangeToken isEqualToPersistentChangeToken:](self, "isEqualToPersistentChangeToken:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v9;

  -[PHPersistentChangeToken persistentHistoryToken](self, "persistentHistoryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersistentChangeToken.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.persistentHistoryToken"));

  }
  -[PHPersistentChangeToken persistentHistoryToken](self, "persistentHistoryToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v6 ^ -[PHPersistentChangeToken version](self, "version");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSPersistentHistoryToken *persistentHistoryToken;
  id v5;

  persistentHistoryToken = self->_persistentHistoryToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", persistentHistoryToken, CFSTR("PersistentHistoryToken"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_version, CFSTR("Version"));

}

- (PHPersistentChangeToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PHPersistentChangeToken *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersistentHistoryToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("Version"));

  v7 = -[PHPersistentChangeToken initWithPersistentHistoryToken:version:](self, "initWithPersistentHistoryToken:version:", v5, v6);
  return v7;
}

- (NSPersistentHistoryToken)persistentHistoryToken
{
  return self->_persistentHistoryToken;
}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentHistoryToken, 0);
}

+ (int)currentVersion
{
  return 1;
}

+ (id)currentTokenForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersistentHistoryTokenFromStores:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tokenWithPersistentHistoryToken:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (PHPersistentChangeToken)tokenWithPersistentHistoryToken:(id)a3
{
  id v3;
  PHPersistentChangeToken *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[PHPersistentChangeToken initWithPersistentHistoryToken:]([PHPersistentChangeToken alloc], "initWithPersistentHistoryToken:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
