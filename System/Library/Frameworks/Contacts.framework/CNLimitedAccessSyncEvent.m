@implementation CNLimitedAccessSyncEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactID, CFSTR("_contactID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sequenceNumber, CFSTR("_sequenceNumber"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isActive, CFSTR("_isActive"));

}

- (CNLimitedAccessSyncEvent)initWithCoder:(id)a3
{
  id v4;
  CNLimitedAccessSyncEvent *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleID;
  void *v9;
  uint64_t v10;
  NSString *contactID;
  CNLimitedAccessSyncEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNLimitedAccessSyncEvent;
  v5 = -[CNLimitedAccessSyncEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;

    v5->_sequenceNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sequenceNumber"));
    v5->_isActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isActive"));
    v12 = v5;
  }

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_storeStrong((id *)&self->_contactID, a3);
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
