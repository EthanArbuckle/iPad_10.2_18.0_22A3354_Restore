@implementation DDSAssetPolicy

+ (id)assetPolicy
{
  objc_opt_class();
  return (id)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "init");
}

- (DDSAssetPolicy)init
{
  DDSAssetPolicy *v2;
  DDSAssetPolicy *v3;
  NSSet *v4;
  NSSet *notificationDownloadTriggers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DDSAssetPolicy;
  v2 = -[DDSAssetPolicy init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_preferredDownloadFrequency = 0;
    *(_WORD *)&v2->_downloadOverCellular = 256;
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    notificationDownloadTriggers = v3->_notificationDownloadTriggers;
    v3->_notificationDownloadTriggers = v4;

  }
  return v3;
}

- (DDSAssetPolicy)initWithCoder:(id)a3
{
  id v4;
  DDSAssetPolicy *v5;
  DDSAssetPolicy *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *downloadCompletionNotification;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDateComponents *idleUsageEvictionPeriod;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSSet *notificationDownloadTriggers;
  NSObject *v31;
  DDSAssetPolicy *v32;
  id v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DDSAssetPolicy;
  v5 = -[DDSAssetPolicy init](&v35, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_opt_class();
    NSStringFromSelector(sel_preferredDownloadFrequency);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preferredDownloadFrequency = objc_msgSend(v9, "integerValue");

    v10 = objc_opt_class();
    NSStringFromSelector(sel_downloadOverCellular);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_downloadOverCellular = objc_msgSend(v12, "BOOLValue");

    v13 = objc_opt_class();
    NSStringFromSelector(sel_downloadWithoutPower);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_downloadWithoutPower = objc_msgSend(v15, "BOOLValue");

    v16 = objc_opt_class();
    NSStringFromSelector(sel_downloadCompletionNotification);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    downloadCompletionNotification = v5->_downloadCompletionNotification;
    v5->_downloadCompletionNotification = (NSString *)v18;

    v20 = objc_opt_class();
    NSStringFromSelector(sel_idleUsageEvictionPeriod);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    idleUsageEvictionPeriod = v5->_idleUsageEvictionPeriod;
    v5->_idleUsageEvictionPeriod = (NSDateComponents *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_notificationDownloadTriggers);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v26, v27, &v34);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v34;
    notificationDownloadTriggers = v5->_notificationDownloadTriggers;
    v5->_notificationDownloadTriggers = (NSSet *)v28;

    v6 = v5;
    if (v29)
    {
      DefaultLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[DDSAssetPolicy initWithCoder:].cold.1((uint64_t)v5, (uint64_t)v29, v31);

      v6 = 0;
    }
  }
  v32 = v6;

  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[DDSAssetPolicy preferredDownloadFrequency](self, "preferredDownloadFrequency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_preferredDownloadFrequency);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DDSAssetPolicy downloadOverCellular](self, "downloadOverCellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_downloadOverCellular);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DDSAssetPolicy downloadWithoutPower](self, "downloadWithoutPower"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_downloadWithoutPower);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, v11);

  -[DDSAssetPolicy notificationDownloadTriggers](self, "notificationDownloadTriggers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_notificationDownloadTriggers);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, v13);

  -[DDSAssetPolicy downloadCompletionNotification](self, "downloadCompletionNotification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_downloadCompletionNotification);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, v15);

  -[DDSAssetPolicy idleUsageEvictionPeriod](self, "idleUsageEvictionPeriod");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_idleUsageEvictionPeriod);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, v16);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, pdf: %ld, doc: %d, dwp: %d>"), objc_opt_class(), self, -[DDSAssetPolicy preferredDownloadFrequency](self, "preferredDownloadFrequency"), -[DDSAssetPolicy downloadOverCellular](self, "downloadOverCellular"), -[DDSAssetPolicy downloadWithoutPower](self, "downloadWithoutPower"));
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_opt_new();
  if (DDS_IS_INTERNAL_INSTALL())
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[DDSAssetPolicy stringForAssetDownloadFrequency:](self, "stringForAssetDownloadFrequency:", -[DDSAssetPolicy preferredDownloadFrequency](self, "preferredDownloadFrequency"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Frequency: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = -[DDSAssetPolicy downloadOverCellular](self, "downloadOverCellular");
    v9 = CFSTR("5G+Inexpensive");
    if (v8)
      v9 = CFSTR("all");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Cellular: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = -[DDSAssetPolicy downloadWithoutPower](self, "downloadWithoutPower");
    v13 = CFSTR("required");
    if (v12)
      v13 = CFSTR("not required");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Power: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@, %@"), v6, v10, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v3;
  }

  return v15;
}

- (id)stringForAssetDownloadFrequency:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Immediate");
  if (a3 == 1)
    v3 = CFSTR("Daily");
  if (a3 == 2)
    return CFSTR("Weekly");
  else
    return (id)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[DDSAssetPolicy isEqualToAssetPolicy:](self, "isEqualToAssetPolicy:", v4);

  return v5;
}

- (BOOL)isEqualToAssetPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int v12;
  int v13;
  _BOOL4 v15;

  v4 = a3;
  -[DDSAssetPolicy notificationDownloadTriggers](self, "notificationDownloadTriggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationDownloadTriggers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[DDSAssetPolicy downloadCompletionNotification](self, "downloadCompletionNotification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "downloadCompletionNotification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[DDSAssetPolicy idleUsageEvictionPeriod](self, "idleUsageEvictionPeriod");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idleUsageEvictionPeriod");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (DDSObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10)
        && (v11 = -[DDSAssetPolicy preferredDownloadFrequency](self, "preferredDownloadFrequency"),
            v11 == objc_msgSend(v4, "preferredDownloadFrequency"))
        && (v12 = -[DDSAssetPolicy downloadWithoutPower](self, "downloadWithoutPower"),
            v12 == objc_msgSend(v4, "downloadWithoutPower")))
      {
        v15 = -[DDSAssetPolicy downloadOverCellular](self, "downloadOverCellular");
        v13 = v15 ^ objc_msgSend(v4, "downloadOverCellular") ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  -[DDSAssetPolicy notificationDownloadTriggers](self, "notificationDownloadTriggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DDSAssetPolicy downloadCompletionNotification](self, "downloadCompletionNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DDSAssetPolicy idleUsageEvictionPeriod](self, "idleUsageEvictionPeriod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  if (-[DDSAssetPolicy downloadOverCellular](self, "downloadOverCellular"))
    v9 = 1231;
  else
    v9 = 1237;
  if (-[DDSAssetPolicy downloadWithoutPower](self, "downloadWithoutPower"))
    v10 = 1231;
  else
    v10 = 1237;
  v11 = v8 ^ v9 ^ v10 ^ -[DDSAssetPolicy preferredDownloadFrequency](self, "preferredDownloadFrequency");

  return v11;
}

- (int64_t)preferredDownloadFrequency
{
  return self->_preferredDownloadFrequency;
}

- (void)setPreferredDownloadFrequency:(int64_t)a3
{
  self->_preferredDownloadFrequency = a3;
}

- (BOOL)downloadOverCellular
{
  return self->_downloadOverCellular;
}

- (void)setDownloadOverCellular:(BOOL)a3
{
  self->_downloadOverCellular = a3;
}

- (BOOL)downloadWithoutPower
{
  return self->_downloadWithoutPower;
}

- (void)setDownloadWithoutPower:(BOOL)a3
{
  self->_downloadWithoutPower = a3;
}

- (NSSet)notificationDownloadTriggers
{
  return self->_notificationDownloadTriggers;
}

- (void)setNotificationDownloadTriggers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)downloadCompletionNotification
{
  return self->_downloadCompletionNotification;
}

- (void)setDownloadCompletionNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDateComponents)idleUsageEvictionPeriod
{
  return self->_idleUsageEvictionPeriod;
}

- (void)setIdleUsageEvictionPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_idleUsageEvictionPeriod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleUsageEvictionPeriod, 0);
  objc_storeStrong((id *)&self->_downloadCompletionNotification, 0);
  objc_storeStrong((id *)&self->_notificationDownloadTriggers, 0);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138543618;
  v6 = objc_opt_class();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_1DA990000, a3, OS_LOG_TYPE_ERROR, "Error decoding %{public}@ (%{public}@)", (uint8_t *)&v5, 0x16u);
}

@end
