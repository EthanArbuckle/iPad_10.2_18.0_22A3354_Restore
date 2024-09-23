@implementation ASDRepairApplicationRequestOptions

- (ASDRepairApplicationRequestOptions)initWithBundleID:(id)a3
{
  id v5;
  ASDRepairApplicationRequestOptions *v6;
  ASDRepairApplicationRequestOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRepairApplicationRequestOptions;
  v6 = -[ASDRepairApplicationRequestOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleID, a3);

  return v7;
}

- (ASDRepairApplicationRequestOptions)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5
{
  id v9;
  id v10;
  ASDRepairApplicationRequestOptions *v11;
  ASDRepairApplicationRequestOptions *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDRepairApplicationRequestOptions;
  v11 = -[ASDRepairApplicationRequestOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountDSID, a4);
    objc_storeStrong((id *)&v12->_bundleID, a3);
    v12->_claimStyle = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDRepairApplicationRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountDSID;
  uint64_t v8;
  NSString *bundleID;

  v5 = -[ASDRepairApplicationRequestOptions init](+[ASDRepairApplicationRequestOptions allocWithZone:](ASDRepairApplicationRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountDSID, "copyWithZone:", a3);
  accountDSID = v5->_accountDSID;
  v5->_accountDSID = (NSNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v8;

  v5->_claimStyle = self->_claimStyle;
  v5->_exitReason = self->_exitReason;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRepairApplicationRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDRepairApplicationRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountDSID;
  uint64_t v8;
  NSString *bundleID;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDRepairApplicationRequestOptions;
  v5 = -[ASDRepairApplicationRequestOptions init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountDSIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountDSID = v5->_accountDSID;
    v5->_accountDSID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIDKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimStyleKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_claimStyle = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exitReasonKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_exitReason = objc_msgSend(v11, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ASDRepairApplicationRequestOptions accountDSID](self, "accountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountDSIDKey"));

  -[ASDRepairApplicationRequestOptions bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIDKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ASDRepairApplicationRequestOptions claimStyle](self, "claimStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("claimStyleKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ASDRepairApplicationRequestOptions exitReason](self, "exitReason"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("exitReasonKey"));

}

- (NSString)bundleID
{
  return self->_bundleID;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
