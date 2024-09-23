@implementation LNFocusConfigurationAppContext

- (LNFocusConfigurationAppContext)initWithNotificationFilterPredicate:(id)a3 targetContentIdentifierPrefix:(id)a4
{
  id v7;
  id v8;
  LNFocusConfigurationAppContext *v9;
  LNFocusConfigurationAppContext *v10;
  uint64_t v11;
  NSString *targetContentIdentifierPrefix;
  LNFocusConfigurationAppContext *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LNFocusConfigurationAppContext;
  v9 = -[LNFocusConfigurationAppContext init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationFilterPredicate, a3);
    v11 = objc_msgSend(v8, "copy");
    targetContentIdentifierPrefix = v10->_targetContentIdentifierPrefix;
    v10->_targetContentIdentifierPrefix = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[LNFocusConfigurationAppContext notificationFilterPredicate](self, "notificationFilterPredicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationFilterPredicate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
        {
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }
        v10 = objc_msgSend(v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_17;
      }
      -[LNFocusConfigurationAppContext targetContentIdentifierPrefix](self, "targetContentIdentifierPrefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetContentIdentifierPrefix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      v15 = v14;
      v11 = v15;
      if (v12 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v12 && v15)
          LOBYTE(v10) = objc_msgSend(v12, "isEqual:", v15);
      }

      goto LABEL_16;
    }
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNFocusConfigurationAppContext notificationFilterPredicate](self, "notificationFilterPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNFocusConfigurationAppContext targetContentIdentifierPrefix](self, "targetContentIdentifierPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNFocusConfigurationAppContext notificationFilterPredicate](self, "notificationFilterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("notificationFilterPredicate"));

  -[LNFocusConfigurationAppContext targetContentIdentifierPrefix](self, "targetContentIdentifierPrefix");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("targetContentIdentifierPrefix"));

}

- (LNFocusConfigurationAppContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNFocusConfigurationAppContext *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationFilterPredicate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetContentIdentifierPrefix"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNFocusConfigurationAppContext initWithNotificationFilterPredicate:targetContentIdentifierPrefix:](self, "initWithNotificationFilterPredicate:targetContentIdentifierPrefix:", v5, v6);
  return v7;
}

- (NSPredicate)notificationFilterPredicate
{
  return self->_notificationFilterPredicate;
}

- (NSString)targetContentIdentifierPrefix
{
  return self->_targetContentIdentifierPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentIdentifierPrefix, 0);
  objc_storeStrong((id *)&self->_notificationFilterPredicate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
