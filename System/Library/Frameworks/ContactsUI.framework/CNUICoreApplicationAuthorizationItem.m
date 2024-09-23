@implementation CNUICoreApplicationAuthorizationItem

- (CNUICoreApplicationAuthorizationItem)init
{
  CNUICoreApplicationAuthorizationItem *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreApplicationAuthorizationItem)initWithIcon:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 deviceType:(int64_t)a6 authorization:(int64_t)a7
{
  return -[CNUICoreApplicationAuthorizationItem initWithIcon:name:bundleIdentifier:deviceType:authorization:shouldTakeSnapshot:](self, "initWithIcon:name:bundleIdentifier:deviceType:authorization:shouldTakeSnapshot:", a3, a4, a5, a6, a7, 1);
}

- (CNUICoreApplicationAuthorizationItem)initWithIcon:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 deviceType:(int64_t)a6 authorization:(int64_t)a7 shouldTakeSnapshot:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  CNUICoreApplicationAuthorizationItem *v18;
  uint64_t v19;
  NSData *icon;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSString *bundleIdentifier;
  uint64_t v25;
  CNUICoreApplicationAuthorizationItem *snapshot;
  CNUICoreApplicationAuthorizationItem *v27;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  objc_super v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (!v15)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = CFSTR("parameter ‘name’ must be nonnull");
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = CFSTR("parameter ‘bundleIdentifier’ must be nonnull");
LABEL_11:
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, v31, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v33.receiver = self;
  v33.super_class = (Class)CNUICoreApplicationAuthorizationItem;
  v18 = -[CNUICoreApplicationAuthorizationItem init](&v33, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    icon = v18->_icon;
    v18->_icon = (NSData *)v19;

    v21 = objc_msgSend(v15, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v21;

    v23 = objc_msgSend(v17, "copy");
    bundleIdentifier = v18->_bundleIdentifier;
    v18->_bundleIdentifier = (NSString *)v23;

    v18->_deviceType = a6;
    v18->_authorization = a7;
    if (a8)
    {
      v25 = -[CNUICoreApplicationAuthorizationItem copy](v18, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    snapshot = v18->_snapshot;
    v18->_snapshot = (CNUICoreApplicationAuthorizationItem *)v25;

    v27 = v18;
  }

  return v18;
}

- (CNUICoreApplicationAuthorizationItem)initWithCoder:(id)a3
{
  id v4;
  CNUICoreApplicationAuthorizationItem *v5;
  void *v6;
  uint64_t v7;
  NSData *icon;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *bundleIdentifier;
  void *v15;
  uint64_t v16;
  CNUICoreApplicationAuthorizationItem *snapshot;
  CNUICoreApplicationAuthorizationItem *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNUICoreApplicationAuthorizationItem;
  v5 = -[CNUICoreApplicationAuthorizationItem init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_icon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    icon = v5->_icon;
    v5->_icon = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v13;

    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_deviceType"));
    v5->_authorization = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_authorization"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_snapshot"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    snapshot = v5->_snapshot;
    v5->_snapshot = (CNUICoreApplicationAuthorizationItem *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *icon;
  id v5;

  icon = self->_icon;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", icon, CFSTR("_icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("_deviceType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_authorization, CFSTR("_authorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snapshot, CFSTR("_snapshot"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CNUICoreApplicationAuthorizationItem icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreApplicationAuthorizationItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreApplicationAuthorizationItem bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)objc_msgSend(v4, "initWithIcon:name:bundleIdentifier:deviceType:authorization:shouldTakeSnapshot:", v5, v6, v7, -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType"), -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization"), 0);

  -[CNUICoreApplicationAuthorizationItem snapshot](self, "snapshot");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v8[6];
  v8[6] = v9;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CNUICoreApplicationAuthorizationItem *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  BOOL v13;

  v4 = (CNUICoreApplicationAuthorizationItem *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((v5 = (unint64_t)-[CNUICoreApplicationAuthorizationItem icon](self, "icon"),
           v6 = (unint64_t)-[CNUICoreApplicationAuthorizationItem icon](v4, "icon"),
           !(v5 | v6))
       || objc_msgSend((id)v5, "isEqual:", v6))
      && ((v7 = (unint64_t)-[CNUICoreApplicationAuthorizationItem name](self, "name"),
           v8 = (unint64_t)-[CNUICoreApplicationAuthorizationItem name](v4, "name"),
           !(v7 | v8))
       || objc_msgSend((id)v7, "isEqual:", v8))
      && ((v9 = (unint64_t)-[CNUICoreApplicationAuthorizationItem bundleIdentifier](self, "bundleIdentifier"),
           v10 = (unint64_t)-[CNUICoreApplicationAuthorizationItem bundleIdentifier](v4, "bundleIdentifier"),
           !(v9 | v10))
       || objc_msgSend((id)v9, "isEqual:", v10))
      && (v11 = -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType"),
          v11 == -[CNUICoreApplicationAuthorizationItem deviceType](v4, "deviceType")))
    {
      v12 = -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization");
      v13 = v12 == -[CNUICoreApplicationAuthorizationItem authorization](v4, "authorization");
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreApplicationAuthorizationItem icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreApplicationAuthorizationItem name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5;

  v9 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreApplicationAuthorizationItem bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "objectHash:", v10) - v8 + 32 * v8;

  v12 = -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType");
  if (v12 >= 0)
    v13 = v12;
  else
    v13 = -v12;
  v14 = v13 - v11 + 32 * v11;
  v15 = -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization");
  if (v15 >= 0)
    v16 = v15;
  else
    v16 = -v15;
  return v16 - v14 + 32 * v14 + 486695567;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreApplicationAuthorizationItem icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("icon"), v4 != 0);

  -[CNUICoreApplicationAuthorizationItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("name"), v6);

  -[CNUICoreApplicationAuthorizationItem bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("bundleIdentifier"), v8);

  v10 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("deviceType"), -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType"));
  v11 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("authorizationLevel"), -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization"));
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)itemBySettingIcon:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[CNUICoreApplicationAuthorizationItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreApplicationAuthorizationItem bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIcon:name:bundleIdentifier:deviceType:authorization:", v4, v6, v7, -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType"), -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization"));

  return v8;
}

- (BOOL)hasChanges
{
  CNUICoreApplicationAuthorizationItem *v2;
  void *v3;

  v2 = self;
  -[CNUICoreApplicationAuthorizationItem snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = !-[CNUICoreApplicationAuthorizationItem isEqual:](v2, "isEqual:", v3);

  return (char)v2;
}

- (NSData)icon
{
  return self->_icon;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(int64_t)a3
{
  self->_authorization = a3;
}

- (CNUICoreApplicationAuthorizationItem)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
