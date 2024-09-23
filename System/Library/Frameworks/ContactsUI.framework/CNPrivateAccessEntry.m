@implementation CNPrivateAccessEntry

- (CNPrivateAccessEntry)initWithBundleIdentifier:(id)a3 privateAccessTipDismissedByUser:(BOOL)a4
{
  id v7;
  CNPrivateAccessEntry *v8;
  CNPrivateAccessEntry *v9;
  void *v10;
  void *v11;
  double v12;
  CNPrivateAccessEntry *v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPrivateAccessEntry;
  v8 = -[CNPrivateAccessEntry init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timestamp");
    v9->_lastAccessTimestamp = v12;

    v9->_isPrivateAccessTipDismissedByUser = a4;
    v13 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CNPrivateAccessEntry bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kPrivateAccessEntryBundleIdentifier"));

  -[CNPrivateAccessEntry lastAccessTimestamp](self, "lastAccessTimestamp");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kPrivateAccessEntryTimeStamp"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CNPrivateAccessEntry isPrivateAccessTipDismissedByUser](self, "isPrivateAccessTipDismissedByUser"), CFSTR("kPrivateAccessEntryPrivateAccessTipDismissedByUser"));

}

- (CNPrivateAccessEntry)initWithCoder:(id)a3
{
  id v4;
  CNPrivateAccessEntry *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  double v8;
  CNPrivateAccessEntry *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNPrivateAccessEntry;
  v5 = -[CNPrivateAccessEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("kPrivateAccessEntryBundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kPrivateAccessEntryTimeStamp"));
    v5->_lastAccessTimestamp = v8;
    v5->_isPrivateAccessTipDismissedByUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPrivateAccessEntryPrivateAccessTipDismissedByUser"));
    v9 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNPrivateAccessEntry bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CNPrivateAccessEntry *v4;
  CNPrivateAccessEntry *v5;
  CNPrivateAccessEntry *v6;
  CNPrivateAccessEntry *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CNPrivateAccessEntry *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      -[CNPrivateAccessEntry bundleIdentifier](self, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPrivateAccessEntry bundleIdentifier](v7, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (BOOL)isForClientWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CNPrivateAccessEntry bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (void)setLastAccessTimeToNow
{
  void *v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  self->_lastAccessTimestamp = v4;

}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  LOBYTE(self) = v5 - self->_lastAccessTimestamp > 2592000.0;

  return (char)self;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)lastAccessTimestamp
{
  return self->_lastAccessTimestamp;
}

- (BOOL)isPrivateAccessTipDismissedByUser
{
  return self->_isPrivateAccessTipDismissedByUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)log
{
  if (log_cn_once_token_1_21129 != -1)
    dispatch_once(&log_cn_once_token_1_21129, &__block_literal_global_21130);
  return (id)log_cn_once_object_1_21131;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __27__CNPrivateAccessEntry_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "PrivateAccess");
  v1 = (void *)log_cn_once_object_1_21131;
  log_cn_once_object_1_21131 = (uint64_t)v0;

}

@end
