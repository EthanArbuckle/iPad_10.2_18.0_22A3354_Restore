@implementation ASDPurgeableApp

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<id: %@ itemID: %@ storage usage: %lld reason: %@ type: %ld>"), self->_bundleID, self->_storeItemID, self->_staticDiskUsage, self->_purgeableReason, self->_purgeableType);
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  int64_t purgeableType;
  NSString *purgeableReason;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v11[0] = self->_storeItemID;
  v10[0] = CFSTR("itemID");
  v10[1] = CFSTR("bundleID");
  -[ASDPurgeableApp bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("Disk Usage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_staticDiskUsage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  purgeableReason = self->_purgeableReason;
  purgeableType = self->_purgeableType;
  v11[2] = v4;
  v11[3] = purgeableReason;
  v10[3] = CFSTR("Reason");
  v10[4] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", purgeableType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_opt_new();
  v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_purgeableReason, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[3] = self->_purgeableType;
  v5[4] = self->_staticDiskUsage;
  v10 = -[NSNumber copyWithZone:](self->_storeItemID, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeableApp)initWithCoder:(id)a3
{
  id v4;
  ASDPurgeableApp *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *purgeableReason;
  uint64_t v10;
  NSNumber *storeItemID;

  v4 = a3;
  v5 = -[ASDPurgeableApp init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purgeableReason"));
    v8 = objc_claimAutoreleasedReturnValue();
    purgeableReason = v5->_purgeableReason;
    v5->_purgeableReason = (NSString *)v8;

    v5->_purgeableType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("purgeableType"));
    v5->_staticDiskUsage = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("staticDiskUsage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeItemID"));
    v10 = objc_claimAutoreleasedReturnValue();
    storeItemID = v5->_storeItemID;
    v5->_storeItemID = (NSNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ASDPurgeableApp bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  -[ASDPurgeableApp purgeableReason](self, "purgeableReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("purgeableReason"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPurgeableApp purgeableType](self, "purgeableType"), CFSTR("purgeableType"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[ASDPurgeableApp staticDiskUsage](self, "staticDiskUsage"), CFSTR("staticDiskUsage"));
  -[ASDPurgeableApp storeItemID](self, "storeItemID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("storeItemID"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)purgeableReason
{
  return self->_purgeableReason;
}

- (void)setPurgeableReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)purgeableType
{
  return self->_purgeableType;
}

- (void)setPurgeableType:(int64_t)a3
{
  self->_purgeableType = a3;
}

- (int64_t)staticDiskUsage
{
  return self->_staticDiskUsage;
}

- (void)setStaticDiskUsage:(int64_t)a3
{
  self->_staticDiskUsage = a3;
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_purgeableReason, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
