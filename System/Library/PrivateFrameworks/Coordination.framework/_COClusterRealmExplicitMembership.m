@implementation _COClusterRealmExplicitMembership

- (id)_initWithClusterIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)_COClusterRealmExplicitMembership;
  v6 = -[COClusterRealm _initWithPredicate:](&v10, sel__initWithPredicate_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    v8 = (void *)v6[6];
    v6[6] = v7;

  }
  return v6;
}

+ (id)realmWithClusterIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithClusterIdentifier:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_COClusterRealmExplicitMembership clusterIdentifier](self, "clusterIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  v9.super_class = (Class)_COClusterRealmExplicitMembership;
  if (-[COClusterRealm isEqual:](&v9, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "clusterIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_COClusterRealmExplicitMembership clusterIdentifier](self, "clusterIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)activate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  _COClusterRealmExplicitMembership *v11;
  id v12;
  uint8_t buf[4];
  _COClusterRealmExplicitMembership *v14;
  __int16 v15;
  _COClusterRealmExplicitMembership *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
  {
    COLogForCategory(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[_COClusterRealmExplicitMembership clusterIdentifier](self, "clusterIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v14 = self;
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p COClusterRealmExplicitMembership %@ activate called with cluster identifier %@", buf, 0x20u);

    }
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __46___COClusterRealmExplicitMembership_activate___block_invoke;
    v10 = &unk_24CD3ED38;
    v11 = self;
    v12 = v4;
    -[COClusterRealm _withLock:](self, "_withLock:", &v7);
    -[COClusterRealm _invokeUpdateHandler](self, "_invokeUpdateHandler", v7, v8, v9, v10, v11);

  }
}

- (_COClusterRealmExplicitMembership)initWithCoder:(id)a3
{
  id v4;
  _COClusterRealmExplicitMembership *v5;
  void *v6;
  uint64_t v7;
  NSString *clusterIdentifier;
  _COClusterRealmExplicitMembership *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_COClusterRealmExplicitMembership;
  v5 = -[COClusterRealm initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusteridentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {

      v9 = 0;
      goto LABEL_6;
    }
    v7 = objc_msgSend(v6, "copy");
    clusterIdentifier = v5->_clusterIdentifier;
    v5->_clusterIdentifier = (NSString *)v7;

  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_COClusterRealmExplicitMembership;
  v4 = a3;
  -[COClusterRealm encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_COClusterRealmExplicitMembership clusterIdentifier](self, "clusterIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clusteridentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
}

@end
