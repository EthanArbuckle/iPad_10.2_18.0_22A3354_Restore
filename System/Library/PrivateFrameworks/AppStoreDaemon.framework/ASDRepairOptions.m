@implementation ASDRepairOptions

- (ASDRepairOptions)initWithBundleID:(id)a3
{
  id v5;
  ASDRepairOptions *v6;
  ASDRepairOptions *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDRepairOptions;
  v6 = -[ASDRepairOptions init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    ASDLogHandleForCategory(12);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_INFO, "(RepairService) Created repair options with bundleID: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (ASDRepairOptions)initWithBundlePath:(id)a3
{
  id v5;
  ASDRepairOptions *v6;
  ASDRepairOptions *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDRepairOptions;
  v6 = -[ASDRepairOptions init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundlePath, a3);
    ASDLogHandleForCategory(12);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_INFO, "(RepairService) Created repair options with path: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (ASDRepairOptions)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5
{
  id v9;
  id v10;
  ASDRepairOptions *v11;
  ASDRepairOptions *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDRepairOptions;
  v11 = -[ASDRepairOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountDSID, a4);
    objc_storeStrong((id *)&v12->_bundleID, a3);
    v12->_claimStyle = a5;
  }

  return v12;
}

- (id)copyUserInfoDictionary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("bundleID"));

  objc_msgSend(a1, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("bundlePath"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "exitReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("exitReason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isBackground"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("isBackground"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "fairplayStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("status"));

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "forceRevoke"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("forceRevoke"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "forceUpsell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("forceUpsell"));

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDRepairOptions *v5;
  uint64_t v6;
  NSNumber *accountDSID;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *bundlePath;
  uint64_t v12;
  NSDictionary *relaunchOptions;

  v5 = -[ASDRepairOptions init](+[ASDRepairOptions allocWithZone:](ASDRepairOptions, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountDSID, "copyWithZone:", a3);
  accountDSID = v5->_accountDSID;
  v5->_accountDSID = (NSNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_bundlePath, "copyWithZone:", a3);
  bundlePath = v5->_bundlePath;
  v5->_bundlePath = (NSString *)v10;

  v5->_claimStyle = self->_claimStyle;
  v5->_exitReason = self->_exitReason;
  v5->_fairplayStatus = self->_fairplayStatus;
  v5->_isBackground = self->_isBackground;
  v12 = -[NSDictionary copyWithZone:](self->_relaunchOptions, "copyWithZone:", a3);
  relaunchOptions = v5->_relaunchOptions;
  v5->_relaunchOptions = (NSDictionary *)v12;

  if (os_variant_has_internal_content())
  {
    v5->_forceRevoke = self->_forceRevoke;
    v5->_forceUpsell = self->_forceUpsell;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRepairOptions)initWithCoder:(id)a3
{
  id v4;
  ASDRepairOptions *v5;
  uint64_t v6;
  NSNumber *accountDSID;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *bundlePath;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *relaunchOptions;
  objc_super v21;
  _QWORD v22[10];

  v22[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDRepairOptions;
  v5 = -[ASDRepairOptions init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountDSID = v5->_accountDSID;
    v5->_accountDSID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_claimStyle = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exitReason"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_exitReason = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fairplayStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fairplayStatus = objc_msgSend(v14, "unsignedIntValue");

    v5->_isBackground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBackground"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v22[4] = objc_opt_class();
    v22[5] = objc_opt_class();
    v22[6] = objc_opt_class();
    v22[7] = objc_opt_class();
    v22[8] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("relaunchOptions"));
    v18 = objc_claimAutoreleasedReturnValue();
    relaunchOptions = v5->_relaunchOptions;
    v5->_relaunchOptions = (NSDictionary *)v18;

    if (os_variant_has_internal_content())
    {
      v5->_forceRevoke = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceRevoke"));
      v5->_forceUpsell = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceUpsell"));
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[ASDRepairOptions accountDSID](self, "accountDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("accountDSID"));

  -[ASDRepairOptions bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  -[ASDRepairOptions bundlePath](self, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("bundlePath"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ASDRepairOptions claimStyle](self, "claimStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("claimStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ASDRepairOptions exitReason](self, "exitReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("exitReason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ASDRepairOptions fairplayStatus](self, "fairplayStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("fairplayStatus"));

  objc_msgSend(v11, "encodeBool:forKey:", -[ASDRepairOptions isBackground](self, "isBackground"), CFSTR("isBackground"));
  -[ASDRepairOptions relaunchOptions](self, "relaunchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("relaunchOptions"));

  if (os_variant_has_internal_content())
  {
    objc_msgSend(v11, "encodeBool:forKey:", -[ASDRepairOptions forceRevoke](self, "forceRevoke"), CFSTR("forceRevoke"));
    objc_msgSend(v11, "encodeBool:forKey:", -[ASDRepairOptions forceUpsell](self, "forceUpsell"), CFSTR("forceUpsell"));
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unint64_t)a3
{
  self->_exitReason = a3;
}

- (int)fairplayStatus
{
  return self->_fairplayStatus;
}

- (void)setFairplayStatus:(int)a3
{
  self->_fairplayStatus = a3;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->_isBackground = a3;
}

- (NSDictionary)relaunchOptions
{
  return self->_relaunchOptions;
}

- (void)setRelaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)forceRevoke
{
  return self->_forceRevoke;
}

- (void)setForceRevoke:(BOOL)a3
{
  self->_forceRevoke = a3;
}

- (BOOL)forceUpsell
{
  return self->_forceUpsell;
}

- (void)setForceUpsell:(BOOL)a3
{
  self->_forceUpsell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relaunchOptions, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
