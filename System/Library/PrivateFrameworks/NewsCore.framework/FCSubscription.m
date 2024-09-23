@implementation FCSubscription

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (id)asReorderableTagSubscription
{
  FCSubscription *v3;

  if (-[FCSubscription subscriptionType](self, "subscriptionType"))
    v3 = 0;
  else
    v3 = self;
  return v3;
}

- (BOOL)isTypePending
{
  return -[FCSubscription subscriptionType](self, "subscriptionType") == 1;
}

- (BOOL)isTypeTag
{
  return -[FCSubscription subscriptionType](self, "subscriptionType") == 0;
}

- (unint64_t)subscriptionType
{
  return self->_subscriptionType;
}

- (unint64_t)subscriptionOrigin
{
  return self->_subscriptionOrigin;
}

- (NSString)tagID
{
  return self->_tagID;
}

+ (id)subscriptionWithSubscriptionID:(id)a3 dictionaryRepresentation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subscriptionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subscriptionOrder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subscriptionOrigin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zone"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 2)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = 0;
    +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v5, v17, 2, v9, v11, v18, v14, v25, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationsEnabled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = v16;
      +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v5, v17, 0, v9, v11, 0, v14, v25, v13);
LABEL_7:
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if ((unint64_t)(v8 - 3) <= 2)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = 0;
      +[FCSubscription subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:](FCSubscription, "subscriptionWithSubscriptionID:tagID:type:order:origin:groupID:dateAdded:notificationsEnabled:zone:", v5, v17, v8, v9, v11, 0, v14, v25, v13);
      goto LABEL_7;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pollingURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length") && objc_msgSend(v20, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCSubscription pendingSubscriptionWithSubscriptionID:url:title:pollingURL:dateAdded:](FCSubscription, "pendingSubscriptionWithSubscriptionID:url:title:pollingURL:dateAdded:", v5, v22, v23, v21, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

  }
LABEL_13:

  return v19;
}

+ (id)subscriptionWithSubscriptionID:(id)a3 tagID:(id)a4 type:(unint64_t)a5 order:(id)a6 origin:(unint64_t)a7 groupID:(id)a8 dateAdded:(id)a9 notificationsEnabled:(BOOL)a10 zone:(unint64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;

  v18 = a9;
  v19 = a8;
  v20 = a6;
  v21 = a4;
  v22 = a3;
  LOBYTE(v25) = a10;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:", v22, v21, v19, v18, a5, v20, a7, v25, a11);

  return v23;
}

- (FCSubscription)initWithSubscriptionID:(id)a3 tagID:(id)a4 groupID:(id)a5 dateAdded:(id)a6 subscriptionType:(unint64_t)a7 order:(id)a8 origin:(unint64_t)a9 notificationsEnabled:(BOOL)a10 zone:(unint64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  FCSubscription *v23;
  FCSubscription *v24;
  uint64_t v25;
  NSNumber *order;
  uint64_t v27;
  NSDate *dateAdded;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  obj = a4;
  v19 = a4;
  v34 = a5;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptionID != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCSubscription initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:]";
    v38 = 2080;
    v39 = "FCSubscription.m";
    v40 = 1024;
    v41 = 89;
    v42 = 2114;
    v43 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19)
      goto LABEL_6;
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCSubscription initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:]";
    v38 = 2080;
    v39 = "FCSubscription.m";
    v40 = 1024;
    v41 = 90;
    v42 = 2114;
    v43 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dateAdded != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCSubscription initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:]";
    v38 = 2080;
    v39 = "FCSubscription.m";
    v40 = 1024;
    v41 = 91;
    v42 = 2114;
    v43 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v35.receiver = self;
  v35.super_class = (Class)FCSubscription;
  v23 = -[FCSubscription init](&v35, sel_init);
  v24 = v23;
  if (v23)
  {
    if (v19)
    {
      objc_storeStrong((id *)&v23->_tagID, obj);
      v24->_subscriptionType = a7;
      v25 = objc_msgSend(v22, "copy");
      order = v24->_order;
      v24->_order = (NSNumber *)v25;

      v24->_subscriptionOrigin = a9;
      objc_storeStrong((id *)&v24->_subscriptionID, a3);
      v27 = objc_msgSend(v21, "copy");
      dateAdded = v24->_dateAdded;
      v24->_dateAdded = (NSDate *)v27;

      v24->_notificationsEnabled = a10;
      objc_storeStrong((id *)&v24->_groupID, v34);
      v24->_zone = a11;
    }
    else
    {

      v24 = 0;
    }
  }

  return v24;
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

+ (id)pendingSubscriptionWithSubscriptionID:(id)a3 url:(id)a4 title:(id)a5 pollingURL:(id)a6 dateAdded:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  FCSubscription *v16;

  if (a4)
  {
    v11 = a7;
    v12 = a6;
    v13 = a5;
    v14 = a4;
    v15 = a3;
    v16 = -[FCSubscription initWithSubscriptionID:url:title:pollingURL:dateAdded:]([FCSubscription alloc], "initWithSubscriptionID:url:title:pollingURL:dateAdded:", v15, v14, v13, v12, v11);

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (FCSubscription)initWithSubscriptionID:(id)a3 url:(id)a4 title:(id)a5 pollingURL:(id)a6 dateAdded:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  FCSubscription *v18;
  FCSubscription *v19;
  uint64_t v20;
  void *dateAdded;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptionID != nil");
    *(_DWORD *)buf = 136315906;
    v27 = "-[FCSubscription initWithSubscriptionID:url:title:pollingURL:dateAdded:]";
    v28 = 2080;
    v29 = "FCSubscription.m";
    v30 = 1024;
    v31 = 117;
    v32 = 2114;
    v33 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dateAdded != nil");
    *(_DWORD *)buf = 136315906;
    v27 = "-[FCSubscription initWithSubscriptionID:url:title:pollingURL:dateAdded:]";
    v28 = 2080;
    v29 = "FCSubscription.m";
    v30 = 1024;
    v31 = 118;
    v32 = 2114;
    v33 = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)FCSubscription;
  v18 = -[FCSubscription init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    if (v14 && v16)
    {
      objc_storeStrong((id *)&v18->_url, a4);
      objc_storeStrong((id *)&v19->_title, a5);
      objc_storeStrong((id *)&v19->_pollingURL, a6);
      v19->_subscriptionType = 1;
      objc_storeStrong((id *)&v19->_subscriptionID, a3);
      v20 = objc_msgSend(v17, "copy");
      dateAdded = v19->_dateAdded;
      v19->_dateAdded = (NSDate *)v20;
    }
    else
    {
      dateAdded = v18;
      v19 = 0;
    }

  }
  return v19;
}

- (BOOL)isTypeMutedTag
{
  return -[FCSubscription subscriptionType](self, "subscriptionType") == 2;
}

- (BOOL)isTypeAutoFavoriteTag
{
  return -[FCSubscription subscriptionType](self, "subscriptionType") == 3;
}

- (BOOL)isTypeGroupableTag
{
  return -[FCSubscription subscriptionType](self, "subscriptionType") == 4;
}

- (BOOL)isTypeIgnoredTag
{
  return -[FCSubscription subscriptionType](self, "subscriptionType") == 5;
}

- (unint64_t)priority
{
  unint64_t v2;

  v2 = -[FCSubscription subscriptionType](self, "subscriptionType");
  if (v2 > 5)
    return 0;
  else
    return qword_1A1E82318[v2];
}

- (int64_t)comparePriority:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCSubscription priority](self, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    objc_msgSend(v4, "dateAdded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscription dateAdded](self, "dateAdded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

    if (!v7)
    {
      if (-[FCSubscription subscriptionType](self, "subscriptionType"))
        v7 = 1;
      else
        v7 = -1;
    }
  }

  return v7;
}

- (id)asCKRecord
{
  unint64_t v4;
  uint64_t *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString **v16;
  void *v17;
  void *v18;
  __CFString **v19;
  int v20;
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[FCSubscription isDeprecated](self, "isDeprecated"))
    return 0;
  if (qword_1ED0F7F08 != -1)
    dispatch_once(&qword_1ED0F7F08, &__block_literal_global_37);
  v4 = -[FCSubscription zone](self, "zone");
  v5 = &_MergedGlobals_150;
  if (v4 == 1)
    v5 = &qword_1ED0F7F00;
  v6 = (id)*v5;
  v7 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCSubscription subscriptionID](self, "subscriptionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithRecordName:zoneID:", v8, v6);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("Subscription"), v9);
  -[FCSubscription dateAdded](self, "dateAdded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("dateAdded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", FCCKSubscriptionOriginFromFCSubscriptionOrigin(-[FCSubscription subscriptionOrigin](self, "subscriptionOrigin")));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("subscriptionOrigin"));

  if (!-[FCSubscription subscriptionType](self, "subscriptionType"))
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("tag"), CFSTR("subscriptionType"));
    -[FCSubscription tagID](self, "tagID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("tagID"));

    -[FCSubscription order](self, "order");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("subscriptionOrder"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCSubscription notificationsEnabled](self, "notificationsEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = FCCKSubscriptionNotificationsEnabledKey;
    goto LABEL_19;
  }
  if (-[FCSubscription subscriptionType](self, "subscriptionType") != 2)
  {
    if (-[FCSubscription subscriptionType](self, "subscriptionType") == 3)
    {
      v19 = FCCKSubscriptionTypeAutoFavoriteTag;
    }
    else if (-[FCSubscription subscriptionType](self, "subscriptionType") == 4)
    {
      v19 = FCCKSubscriptionTypeGroupableTag;
    }
    else
    {
      if (-[FCSubscription subscriptionType](self, "subscriptionType") != 5)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unrecognized subscription type"));
        v20 = 136315906;
        v21 = "-[FCSubscription asCKRecord]";
        v22 = 2080;
        v23 = "FCSubscription.m";
        v24 = 1024;
        v25 = 275;
        v26 = 2114;
        v27 = v15;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v20, 0x26u);
        goto LABEL_20;
      }
      v19 = FCCKSubscriptionTypeIgnoredTag;
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *v19, CFSTR("subscriptionType"));
    -[FCSubscription tagID](self, "tagID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = FCCKSubscriptionTagIDKey;
LABEL_19:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *v16);
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("mutedTag"), CFSTR("subscriptionType"));
  -[FCSubscription tagID](self, "tagID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("tagID"));

  -[FCSubscription groupID](self, "groupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FCSubscription groupID](self, "groupID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = FCCKSubscriptionGroupIDKey;
    goto LABEL_19;
  }
LABEL_21:

  return v10;
}

void __28__FCSubscription_asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = *MEMORY[0x1E0C94730];
  v2 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("Subscriptions"), *MEMORY[0x1E0C94730]);
  v3 = (void *)_MergedGlobals_150;
  _MergedGlobals_150 = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("SensitiveSubscriptions"), v1);
  v5 = (void *)qword_1ED0F7F00;
  qword_1ED0F7F00 = v4;

}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FCSubscription subscriptionID](self, "subscriptionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCSubscription subscriptionType](self, "subscriptionType") - 1;
  if (v5 > 4)
    v6 = CFSTR("tag");
  else
    v6 = off_1E463F740[v5];
  -[FCSubscription order](self, "order");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscription dateAdded](self, "dateAdded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{id: %@ type: %@ order: %@ dateAdded: %@ notifications: %d}"), v4, v6, v7, v8, -[FCSubscription notificationsEnabled](self, "notificationsEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithOrder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FCSubscription subscriptionType](self, "subscriptionType")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected equality between %s and %s"), "self.subscriptionType", "FCSubscriptionTypeTag");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCSubscription copyWithOrder:]";
    v18 = 2080;
    v19 = "FCSubscription.m";
    v20 = 1024;
    v21 = 303;
    v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = objc_alloc((Class)objc_opt_class());
  -[FCSubscription subscriptionID](self, "subscriptionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscription tagID](self, "tagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscription groupID](self, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscription dateAdded](self, "dateAdded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCSubscription subscriptionType](self, "subscriptionType");
  v11 = -[FCSubscription subscriptionOrigin](self, "subscriptionOrigin");
  LOBYTE(v15) = -[FCSubscription notificationsEnabled](self, "notificationsEnabled");
  v12 = (void *)objc_msgSend(v5, "initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:", v6, v7, v8, v9, v10, v4, v11, v15, -[FCSubscription zone](self, "zone"));

  return v12;
}

- (NSNumber)order
{
  return self->_order;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (unint64_t)zone
{
  return self->_zone;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)pollingURL
{
  return self->_pollingURL;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (BOOL)canRetry
{
  return self->_canRetry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_pollingURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

- (id)dictionaryRepresentation
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
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCSubscription isTypeTag](self, "isTypeTag")
    || -[FCSubscription isTypeMutedTag](self, "isTypeMutedTag")
    || -[FCSubscription isTypeAutoFavoriteTag](self, "isTypeAutoFavoriteTag")
    || -[FCSubscription isTypeGroupableTag](self, "isTypeGroupableTag")
    || -[FCSubscription isTypeIgnoredTag](self, "isTypeIgnoredTag"))
  {
    -[FCSubscription tagID](self, "tagID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[FCSubscription tagID](self, "tagID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tagID"));

      -[FCSubscription order](self, "order");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("subscriptionOrder"));

      -[FCSubscription dateAdded](self, "dateAdded");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dateAdded"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", FCCKSubscriptionOriginFromFCSubscriptionOrigin(-[FCSubscription subscriptionOrigin](self, "subscriptionOrigin")));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subscriptionOrigin"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCSubscription subscriptionType](self, "subscriptionType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("subscriptionType"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCSubscription notificationsEnabled](self, "notificationsEnabled"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("notificationsEnabled"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCSubscription zone](self, "zone"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("zone"));

      -[FCSubscription groupID](self, "groupID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[FCSubscription groupID](self, "groupID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("groupID"));
LABEL_9:

      }
    }
  }
  else
  {
    if (!-[FCSubscription isTypePending](self, "isTypePending"))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
      v25 = 136315906;
      v26 = "-[FCSubscription(SubscriptionList) dictionaryRepresentation]";
      v27 = 2080;
      v28 = "FCSubscriptionList.m";
      v29 = 1024;
      v30 = 1508;
      v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v25, 0x26u);
      goto LABEL_9;
    }
    -[FCSubscription url](self, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[FCSubscription url](self, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "absoluteString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("url"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCSubscription subscriptionType](self, "subscriptionType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("subscriptionType"));

      -[FCSubscription dateAdded](self, "dateAdded");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("dateAdded"));

      -[FCSubscription title](self, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[FCSubscription title](self, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("title"));

      }
      -[FCSubscription pollingURL](self, "pollingURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[FCSubscription pollingURL](self, "pollingURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "absoluteString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("pollingURL"));

        goto LABEL_9;
      }
    }
  }
LABEL_10:
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

@end
