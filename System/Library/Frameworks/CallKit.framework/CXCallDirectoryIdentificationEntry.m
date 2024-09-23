@implementation CXCallDirectoryIdentificationEntry

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXCallDirectoryIdentificationEntry extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryIdentificationEntry localizedExtensionName](self, "localizedExtensionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryIdentificationEntry localizedExtensionContainingAppName](self, "localizedExtensionContainingAppName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryIdentificationEntry localizedLabel](self, "localizedLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryIdentificationEntry iconURL](self, "iconURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p extensionIdentifier=%@ localizedExtensionName=%@ localizedExtensionContainingAppName=%@ localizedLabel=%@ iconURL=%@ type=%ld>"), v4, self, v5, v6, v7, v8, v9, -[CXCallDirectoryIdentificationEntry type](self, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryIdentificationEntry)initWithCoder:(id)a3
{
  id v4;
  CXCallDirectoryIdentificationEntry *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *extensionIdentifier;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *localizedExtensionName;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *localizedExtensionContainingAppName;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *localizedLabel;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSURL *iconURL;
  void *v31;
  void *v32;

  v4 = a3;
  v5 = -[CXCallDirectoryIdentificationEntry init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_extensionIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_localizedExtensionName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    localizedExtensionName = v5->_localizedExtensionName;
    v5->_localizedExtensionName = (NSString *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_localizedExtensionContainingAppName);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    localizedExtensionContainingAppName = v5->_localizedExtensionContainingAppName;
    v5->_localizedExtensionContainingAppName = (NSString *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_localizedLabel);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    localizedLabel = v5->_localizedLabel;
    v5->_localizedLabel = (NSString *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_iconURL);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v29;

    NSStringFromSelector(sel_type);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = (int)objc_msgSend(v4, "decodeIntForKey:", v31);

    NSStringFromSelector(sel_fromCache);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fromCache = objc_msgSend(v4, "decodeBoolForKey:", v32);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  int64_t v15;
  void *v16;
  _BOOL8 v17;
  id v18;

  v4 = a3;
  -[CXCallDirectoryIdentificationEntry extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXCallDirectoryIdentificationEntry localizedExtensionName](self, "localizedExtensionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedExtensionName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXCallDirectoryIdentificationEntry localizedExtensionContainingAppName](self, "localizedExtensionContainingAppName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedExtensionContainingAppName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[CXCallDirectoryIdentificationEntry localizedLabel](self, "localizedLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedLabel);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[CXCallDirectoryIdentificationEntry iconURL](self, "iconURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  v15 = -[CXCallDirectoryIdentificationEntry type](self, "type");
  NSStringFromSelector(sel_type);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", v15, v16);

  v17 = -[CXCallDirectoryIdentificationEntry fromCache](self, "fromCache");
  NSStringFromSelector(sel_fromCache);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedExtensionName
{
  return self->_localizedExtensionName;
}

- (void)setLocalizedExtensionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedExtensionContainingAppName
{
  return self->_localizedExtensionContainingAppName;
}

- (void)setLocalizedExtensionContainingAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (void)setLocalizedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)fromCache
{
  return self->_fromCache;
}

- (void)setFromCache:(BOOL)a3
{
  self->_fromCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_localizedExtensionContainingAppName, 0);
  objc_storeStrong((id *)&self->_localizedExtensionName, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end
