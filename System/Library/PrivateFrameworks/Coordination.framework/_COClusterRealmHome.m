@implementation _COClusterRealmHome

+ (id)realmForCurrent
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE64BB0], "predicateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[COClusterRealm _initWithPredicate:]([_COClusterRealmHome alloc], "_initWithPredicate:", v2);

  return v3;
}

- (id)_initWithPredicate:(id)a3 forHome:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_COClusterRealmHome;
  v8 = -[COClusterRealm _initWithPredicate:](&v11, sel__initWithPredicate_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(v8 + 6, a4);

  return v9;
}

+ (id)realmWithHomeKitHomeIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1758];
  v5 = a3;
  objc_msgSend(v4, "predicateWithValue:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPredicate:forHome:", v6, v5);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_COClusterRealmHome;
  -[COClusterRealm description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ sh: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_COClusterRealmHome;
    return -[COClusterRealm hash](&v7, sel_hash);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_COClusterRealmHome;
  if (-[COClusterRealm isEqual:](&v9, sel_isEqual_, v4))
  {
    -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specificHomeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_identifierForGroupResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HomeKitHomeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)activate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  _COClusterRealmHome *v12;
  __int16 v13;
  _COClusterRealmHome *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
  {
    COLogForCategory(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v12 = self;
      v13 = 2112;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p COClusterRealmHome %@ activate called with specificHomeUUID %@", buf, 0x20u);

    }
    -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __32___COClusterRealmHome_activate___block_invoke;
      v9[3] = &unk_24CD3ED38;
      v9[4] = self;
      v10 = v4;
      -[COClusterRealm _withLock:](self, "_withLock:", v9);
      -[COClusterRealm _invokeUpdateHandler](self, "_invokeUpdateHandler");

    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)_COClusterRealmHome;
      -[COClusterRealm activate:](&v8, sel_activate_, v4);
    }
  }

}

- (_COClusterRealmHome)initWithCoder:(id)a3
{
  id v4;
  _COClusterRealmHome *v5;
  uint64_t v6;
  NSUUID *specificHomeUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_COClusterRealmHome;
  v5 = -[COClusterRealm initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeidentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    specificHomeUUID = v5->_specificHomeUUID;
    v5->_specificHomeUUID = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_COClusterRealmHome;
  v4 = a3;
  -[COClusterRealm encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("homeidentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[COClusterRealm predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_COClusterRealmHome specificHomeUUID](self, "specificHomeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "_initWithPredicate:forHome:", v5, v6);

  return v7;
}

- (NSUUID)specificHomeUUID
{
  return self->_specificHomeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificHomeUUID, 0);
}

@end
