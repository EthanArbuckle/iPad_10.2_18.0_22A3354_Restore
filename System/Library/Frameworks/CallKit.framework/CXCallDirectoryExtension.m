@implementation CXCallDirectoryExtension

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXCallDirectoryExtension identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CXCallDirectoryExtension state](self, "state");
  v7 = -[CXCallDirectoryExtension priority](self, "priority");
  -[CXCallDirectoryExtension localizedName](self, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: identifier=%@ state=%ld priority=%lld localizedName=%@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryExtension)initWithCoder:(id)a3
{
  id v4;
  CXCallDirectoryExtension *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *localizedName;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *localizedContainingAppName;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  LSPlugInKitProxy *plugInKitProxy;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CXCallDirectoryExtension;
  v5 = -[CXCallDirectoryExtension init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    NSStringFromSelector(sel_state);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", v10);

    NSStringFromSelector(sel_priority);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_priority = objc_msgSend(v4, "decodeInt64ForKey:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_localizedName);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_localizedContainingAppName);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    localizedContainingAppName = v5->_localizedContainingAppName;
    v5->_localizedContainingAppName = (NSString *)v18;

    v20 = objc_opt_class();
    NSStringFromSelector(sel_plugInKitProxy);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    plugInKitProxy = v5->_plugInKitProxy;
    v5->_plugInKitProxy = (LSPlugInKitProxy *)v22;

    NSStringFromSelector(sel_isOnlyExtensionInContainingApp);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onlyExtensionInContainingApp = objc_msgSend(v4, "decodeBoolForKey:", v24);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;

  v4 = a3;
  -[CXCallDirectoryExtension identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[CXCallDirectoryExtension state](self, "state");
  NSStringFromSelector(sel_state);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[CXCallDirectoryExtension priority](self, "priority");
  NSStringFromSelector(sel_priority);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v9, v10);

  -[CXCallDirectoryExtension localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[CXCallDirectoryExtension localizedContainingAppName](self, "localizedContainingAppName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedContainingAppName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[CXCallDirectoryExtension plugInKitProxy](self, "plugInKitProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_plugInKitProxy);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  v17 = -[CXCallDirectoryExtension isOnlyExtensionInContainingApp](self, "isOnlyExtensionInContainingApp");
  NSStringFromSelector(sel_isOnlyExtensionInContainingApp);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedContainingAppName
{
  return self->_localizedContainingAppName;
}

- (void)setLocalizedContainingAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (LSPlugInKitProxy)plugInKitProxy
{
  return self->_plugInKitProxy;
}

- (void)setPlugInKitProxy:(id)a3
{
  objc_storeStrong((id *)&self->_plugInKitProxy, a3);
}

- (BOOL)isOnlyExtensionInContainingApp
{
  return self->_onlyExtensionInContainingApp;
}

- (void)setOnlyExtensionInContainingApp:(BOOL)a3
{
  self->_onlyExtensionInContainingApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugInKitProxy, 0);
  objc_storeStrong((id *)&self->_localizedContainingAppName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
