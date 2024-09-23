@implementation ASDSystemAppRequest

- (ASDSystemAppRequest)initWithBundleID:(id)a3
{
  id v4;
  ASDSystemAppRequest *v5;
  uint64_t v6;
  NSString *bundleID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSystemAppRequest;
  v5 = -[ASDRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDSystemAppRequest)initWithCoder:(id)a3
{
  id v4;
  ASDSystemAppRequest *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSNumber *storeItemID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDSystemAppRequest;
  v5 = -[ASDRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeItemID"));
    v8 = objc_claimAutoreleasedReturnValue();
    storeItemID = v5->_storeItemID;
    v5->_storeItemID = (NSNumber *)v8;

    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;
  objc_super v6;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeItemID, CFSTR("storeItemID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userInitiated, CFSTR("userInitiated"));
  v6.receiver = self;
  v6.super_class = (Class)ASDSystemAppRequest;
  -[ASDRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  NSNumber *storeItemID;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)ASDSystemAppRequest;
  -[ASDRequest description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDSystemAppRequest bundleID](self, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_userInitiated)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  storeItemID = self->_storeItemID;
  if (storeItemID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", storeItemID = %@"), storeItemID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {bundleID = %@, userInitiated = %@%@}"), v4, v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {bundleID = %@, userInitiated = %@%@}"), v4, v5, v7, &stru_1E37C1320);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
