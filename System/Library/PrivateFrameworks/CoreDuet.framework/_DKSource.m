@implementation _DKSource

- (void)encodeWithCoder:(id)a3
{
  NSString *sourceID;
  id v5;

  sourceID = self->_sourceID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceID, CFSTR("_sourceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("_itemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupID, CFSTR("_groupID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceID, CFSTR("_deviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userID, CFSTR("_userID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentID, CFSTR("_intentID"));

}

+ (id)intentsSourceID
{
  return CFSTR("intents");
}

+ (id)spotlightSourceID
{
  return CFSTR("spotlight");
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sourceID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)itemID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)userID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)intentID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

+ (id)entityName
{
  return CFSTR("Source");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
}

- (_DKSource)initWithCoder:(id)a3
{
  id v4;
  _DKSource *v5;
  uint64_t v6;
  NSString *sourceID;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *itemID;
  uint64_t v12;
  NSString *groupID;
  uint64_t v14;
  NSString *deviceID;
  uint64_t v16;
  NSNumber *userID;
  uint64_t v18;
  NSString *intentID;
  _DKSource *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_DKSource;
  v5 = -[_DKSource init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceID = v5->_sourceID;
    v5->_sourceID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemID"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupID"));
    v12 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceID"));
    v14 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userID"));
    v16 = objc_claimAutoreleasedReturnValue();
    userID = v5->_userID;
    v5->_userID = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intentID"));
    v18 = objc_claimAutoreleasedReturnValue();
    intentID = v5->_intentID;
    v5->_intentID = (NSString *)v18;

    v20 = v5;
  }

  return v5;
}

- (_DKSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5 groupIdentifier:(id)a6 deviceIdentifier:(id)a7 userIdentifier:(id)a8
{
  return -[_DKSource initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:intentIdentifier:](self, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:intentIdentifier:", a3, a4, a5, a6, a7, a8, 0);
}

- (_DKSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5 groupIdentifier:(id)a6 deviceIdentifier:(id)a7 userIdentifier:(id)a8 intentIdentifier:(id)a9
{
  id v16;
  id v17;
  _DKSource *v18;
  _DKSource *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_DKSource;
  v18 = -[_DKSource init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceID, a3);
    objc_storeStrong((id *)&v19->_bundleID, a4);
    objc_storeStrong((id *)&v19->_itemID, a5);
    objc_storeStrong((id *)&v19->_groupID, a6);
    objc_storeStrong((id *)&v19->_deviceID, a7);
    objc_storeStrong((id *)&v19->_userID, a8);
    objc_storeStrong((id *)&v19->_intentID, a9);
  }

  return v19;
}

+ (id)sourceForInteraction:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _DKSource *v10;
  void *v11;
  void *v12;
  void *v13;
  _DKSource *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [_DKSource alloc];
  objc_msgSend(a1, "intentsSourceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_DKSource initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:intentIdentifier:](v10, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:intentIdentifier:", v11, v6, v8, v9, 0, 0, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultSourceID
{
  return CFSTR("default");
}

- (NSString)syncDeviceID
{
  void *v2;
  void *v3;

  -[_DKSource deviceID](self, "deviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKKnowledgeStorage sourceDeviceIdentityFromDeviceID:]((uint64_t)_DKKnowledgeStorage, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_DKSource sourceID](self, "sourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSource bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSource itemID](self, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSource groupID](self, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSource deviceID](self, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSource userID](self, "userID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSource intentID](self, "intentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@, %@, %@, %@, %@, %@, %@}"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  _DKSource *v5;
  _DKSource *v6;
  _DKSource *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v5 = (_DKSource *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[_DKSource sourceID](self, "sourceID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSource sourceID](v7, "sourceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 != v9)
        {
          -[_DKSource sourceID](self, "sourceID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSource sourceID](v7, "sourceID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v10;
          if (!objc_msgSend(v10, "isEqualToString:"))
          {
            v11 = 0;
            goto LABEL_37;
          }
        }
        -[_DKSource bundleID](self, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSource bundleID](v7, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v13)
        {
          -[_DKSource bundleID](self, "bundleID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSource bundleID](v7, "bundleID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqualToString:"))
          {
            v11 = 0;
LABEL_35:

LABEL_36:
            if (v8 == v9)
            {
LABEL_38:

              goto LABEL_39;
            }
LABEL_37:

            goto LABEL_38;
          }
        }
        -[_DKSource itemID](self, "itemID");
        v14 = objc_claimAutoreleasedReturnValue();
        -[_DKSource itemID](v7, "itemID");
        v15 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v14;
        v16 = v14 == v15;
        v17 = (void *)v15;
        if (!v16)
        {
          -[_DKSource itemID](self, "itemID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSource itemID](v7, "itemID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v18;
          if (!objc_msgSend(v18, "isEqualToString:"))
          {
            v11 = 0;
            v19 = v47;
LABEL_33:

LABEL_34:
            if (v12 == v13)
              goto LABEL_36;
            goto LABEL_35;
          }
        }
        -[_DKSource groupID](self, "groupID");
        v20 = objc_claimAutoreleasedReturnValue();
        -[_DKSource groupID](v7, "groupID");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v20;
        v44 = v17;
        if (v20 == v45)
        {
          v38 = v13;
        }
        else
        {
          v21 = v3;
          -[_DKSource groupID](self, "groupID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSource groupID](v7, "groupID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v22;
          if (!objc_msgSend(v22, "isEqualToString:"))
          {
            v11 = 0;
            v25 = (void *)v45;
            v3 = v21;
LABEL_31:

LABEL_32:
            v17 = v44;
            v19 = v47;
            if (v47 == v44)
              goto LABEL_34;
            goto LABEL_33;
          }
          v38 = v13;
          v3 = v21;
        }
        -[_DKSource deviceID](self, "deviceID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSource deviceID](v7, "deviceID");
        v39 = objc_claimAutoreleasedReturnValue();
        if (v23 == (void *)v39)
        {
          v34 = v3;
          v35 = v12;
        }
        else
        {
          -[_DKSource deviceID](self, "deviceID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSource deviceID](v7, "deviceID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v24;
          if (!objc_msgSend(v24, "isEqualToString:"))
          {
            v11 = 0;
            v13 = v38;
            v31 = (void *)v39;
            goto LABEL_29;
          }
          v34 = v3;
          v35 = v12;
        }
        -[_DKSource userID](self, "userID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSource userID](v7, "userID");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v26 == (void *)v27)
        {

          v11 = 1;
        }
        else
        {
          v28 = (void *)v27;
          -[_DKSource userID](self, "userID");
          v33 = v23;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSource userID](v7, "userID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v29, "isEqualToNumber:", v30);

          v23 = v33;
        }
        v13 = v38;
        v31 = (void *)v39;
        v3 = v34;
        v12 = v35;
        if (v23 == (void *)v39)
        {
LABEL_30:

          v25 = (void *)v45;
          if (v46 == (void *)v45)
            goto LABEL_32;
          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_39:

  return v11;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setUserID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setIntentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)toPBCodable
{
  _DKPRSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(_DKPRSource);
  -[_DKSource sourceID](self, "sourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRSource setSourceID:]((uint64_t)v3, v4);

  -[_DKSource bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRSource setBundleID:]((uint64_t)v3, v5);

  -[_DKSource itemID](self, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRSource setItemID:]((uint64_t)v3, v6);

  -[_DKSource groupID](self, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRSource setGroupID:]((uint64_t)v3, v7);

  -[_DKSource deviceID](self, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRSource setDeviceID:]((uint64_t)v3, v8);

  -[_DKSource userID](self, "userID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRSource setUserID:]((uint64_t)v3, objc_msgSend(v9, "intValue"));

  return v3;
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  _DKSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _DKSource *v14;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = [_DKSource alloc];
    -[_DKPRSource sourceID]((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPRSource bundleID]((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPRSource itemID]((uint64_t)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPRSource groupID]((uint64_t)v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPRSource deviceID]((uint64_t)v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = -[_DKPRSource userID]((uint64_t)v4);

    objc_msgSend(v11, "numberWithInt:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_DKSource initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:](v5, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", v6, v7, v8, v9, v10, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)sourceForSearchableItem:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _DKSource *v10;
  void *v11;
  _DKSource *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domainIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [_DKSource alloc];
  objc_msgSend(a1, "spotlightSourceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_DKSource initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:](v10, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", v11, v6, v8, v9, 0, 0);

  return v12;
}

@end
