@implementation ASDVPPRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("Account"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_archiveType, CFSTR("ArchiveType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("Bundle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVersionIdentifier, CFSTR("ExternalVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("Item"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("Request"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestType, CFSTR("RequestType"));

}

- (ASDVPPRequest)initWithCoder:(id)a3
{
  id v4;
  ASDVPPRequest *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSNumber *externalVersionIdentifier;
  uint64_t v12;
  NSNumber *itemIdentifier;
  uint64_t v14;
  NSUUID *requestIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDVPPRequest;
  v5 = -[ASDVPPRequest init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Account"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    v5->_archiveType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ArchiveType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Bundle"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExternalVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Item"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Request"));
    v14 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v14;

    v5->_requestType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("RequestType"));
  }

  return v5;
}

- (id)description
{
  int64_t archiveType;
  __CFString *v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  int64_t requestType;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  archiveType = self->_archiveType;
  v4 = &stru_1E37C1320;
  v5 = CFSTR(":iOS");
  if (archiveType != 1)
    v5 = &stru_1E37C1320;
  if (archiveType == 2)
    v6 = CFSTR(":macOS");
  else
    v6 = (__CFString *)v5;
  v7 = v6;
  requestType = self->_requestType;
  v9 = CFSTR(":Device");
  if (requestType != 2)
    v9 = &stru_1E37C1320;
  if (requestType == 1)
    v10 = CFSTR(":User");
  else
    v10 = (__CFString *)v9;
  v11 = v10;
  if (self->_accountIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":acct %@"), self->_accountIdentifier);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_externalVersionIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":evid %@"), self->_externalVersionIdentifier);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1E37C1320;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@/%@%@%@%@%@:%@]"), self->_bundleIdentifier, self->_itemIdentifier, v12, v7, v11, v4, self->_requestIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (int64_t)archiveType
{
  return self->_archiveType;
}

- (void)setArchiveType:(int64_t)a3
{
  self->_archiveType = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)externalVersionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)itemIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
