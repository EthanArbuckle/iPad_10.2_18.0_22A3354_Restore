@implementation CNProviderMetadata

+ (id)log
{
  if (log_cn_once_token_0_3 != -1)
    dispatch_once(&log_cn_once_token_0_3, &__block_literal_global_55);
  return (id)log_cn_once_object_0_3;
}

void __25__CNProviderMetadata_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNProviderMetadata");
  v1 = (void *)log_cn_once_object_0_3;
  log_cn_once_object_0_3 = (uint64_t)v0;

}

- (CNProviderMetadata)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return -[CNProviderMetadata initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:](self, "initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:", 1, 0, 0, 0, 0, 0, 0, v3);
}

- (CNProviderMetadata)initWithDataRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CNProviderMetadata *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  id v24;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = a3;
    v24 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v24;
    if (v6)
    {
      v8 = objc_msgSend(v6, "version");
      objc_msgSend(v6, "displayName");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "isResetRequested");
      v12 = objc_msgSend(v6, "isContentEnumerated");
      objc_msgSend(v6, "itemAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "itemOffset");
      LOBYTE(v23) = objc_msgSend(v6, "isMoreComing");
      self = -[CNProviderMetadata initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:](self, "initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:", v8, v9, v10, v11, v12, v13, v14, v23);

      v15 = self;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CNProviderMetadata initWithDataRepresentation:].cold.1((uint64_t)v7, v9, v16, v17, v18, v19, v20, v21);
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CNProviderMetadata)initWithVersion:(int64_t)a3 displayName:(id)a4 userInfo:(id)a5 isResetRequested:(BOOL)a6 isContentEnumerated:(BOOL)a7 itemAnchor:(id)a8 itemOffset:(int64_t)a9 isMoreComing:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  CNProviderMetadata *v20;
  CNProviderMetadata *v21;
  CNProviderMetadata *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;

  v17 = a4;
  v18 = a5;
  v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)CNProviderMetadata;
  v20 = -[CNProviderMetadata init](&v31, sel_init);
  v21 = v20;
  if (!v20)
  {
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  if (a3 >= 2)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CNProviderMetadata initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:].cold.1(a3, v23, v24, v25, v26, v27, v28, v29);

    goto LABEL_7;
  }
  v20->_version = a3;
  objc_storeStrong((id *)&v20->_displayName, a4);
  objc_storeStrong((id *)&v21->_userInfo, a5);
  v21->_isResetRequested = a6;
  v21->_isContentEnumerated = a7;
  objc_storeStrong((id *)&v21->_itemAnchor, a8);
  v21->_itemOffset = a9;
  v21->_isMoreComing = a10;
  v22 = v21;
LABEL_8:

  return v22;
}

- (NSData)dataRepresentation
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNProviderMetadata dataRepresentation].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
  return (NSData *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNProviderMetadata)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CNProviderMetadata *v15;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;

  v3 = a3;
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("version"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isResetRequested"));
  v18 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isContentEnumerated"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("itemOffset"));
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isMoreComing"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v8, v13, CFSTR("userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v17) = v7;
  v15 = -[CNProviderMetadata initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:](self, "initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:", v20, v4, v14, v19, v18, v5, v6, v17);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isResetRequested, CFSTR("isResetRequested"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContentEnumerated, CFSTR("isContentEnumerated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemAnchor, CFSTR("itemAnchor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemOffset, CFSTR("itemOffset"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMoreComing, CFSTR("isMoreComing"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNProviderMetadata *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(CNProviderMetadata);
  -[CNProviderMetadata setVersion:](v4, "setVersion:", -[CNProviderMetadata version](self, "version"));
  -[CNProviderMetadata displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNProviderMetadata setDisplayName:](v4, "setDisplayName:", v5);

  -[CNProviderMetadata userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNProviderMetadata setUserInfo:](v4, "setUserInfo:", v6);

  -[CNProviderMetadata setIsResetRequested:](v4, "setIsResetRequested:", -[CNProviderMetadata isResetRequested](self, "isResetRequested"));
  -[CNProviderMetadata setIsContentEnumerated:](v4, "setIsContentEnumerated:", -[CNProviderMetadata isContentEnumerated](self, "isContentEnumerated"));
  -[CNProviderMetadata itemAnchor](self, "itemAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNProviderMetadata setItemAnchor:](v4, "setItemAnchor:", v7);

  -[CNProviderMetadata setItemOffset:](v4, "setItemOffset:", -[CNProviderMetadata itemOffset](self, "itemOffset"));
  -[CNProviderMetadata setIsMoreComing:](v4, "setIsMoreComing:", -[CNProviderMetadata isMoreComing](self, "isMoreComing"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CNProviderMetadata *v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;

  v4 = (CNProviderMetadata *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    v5 = -[CNProviderMetadata version](self, "version");
    if (v5 != -[CNProviderMetadata version](v4, "version"))
      goto LABEL_14;
    v6 = (unint64_t)-[CNProviderMetadata displayName](self, "displayName");
    v7 = (unint64_t)-[CNProviderMetadata displayName](v4, "displayName");
    if (v6 | v7)
    {
      if (!objc_msgSend((id)v6, "isEqual:", v7))
        goto LABEL_14;
    }
    if (((v8 = (unint64_t)-[CNProviderMetadata userInfo](self, "userInfo"),
           v9 = (unint64_t)-[CNProviderMetadata userInfo](v4, "userInfo"),
           !(v8 | v9))
       || objc_msgSend((id)v8, "isEqual:", v9))
      && (v10 = -[CNProviderMetadata isResetRequested](self, "isResetRequested"),
          v10 == -[CNProviderMetadata isResetRequested](v4, "isResetRequested"))
      && (v11 = -[CNProviderMetadata isContentEnumerated](self, "isContentEnumerated"),
          v11 == -[CNProviderMetadata isContentEnumerated](v4, "isContentEnumerated"))
      && ((v12 = (unint64_t)-[CNProviderMetadata itemAnchor](self, "itemAnchor"),
           v13 = (unint64_t)-[CNProviderMetadata itemAnchor](v4, "itemAnchor"),
           !(v12 | v13))
       || objc_msgSend((id)v12, "isEqual:", v13))
      && (v14 = -[CNProviderMetadata itemOffset](self, "itemOffset"),
          v14 == -[CNProviderMetadata itemOffset](v4, "itemOffset")))
    {
      v15 = -[CNProviderMetadata isMoreComing](self, "isMoreComing");
      v16 = v15 ^ -[CNProviderMetadata isMoreComing](v4, "isMoreComing") ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (BOOL)isResetRequested
{
  return self->_isResetRequested;
}

- (void)setIsResetRequested:(BOOL)a3
{
  self->_isResetRequested = a3;
}

- (BOOL)isContentEnumerated
{
  return self->_isContentEnumerated;
}

- (void)setIsContentEnumerated:(BOOL)a3
{
  self->_isContentEnumerated = a3;
}

- (NSData)itemAnchor
{
  return self->_itemAnchor;
}

- (void)setItemAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_itemAnchor, a3);
}

- (int64_t)itemOffset
{
  return self->_itemOffset;
}

- (void)setItemOffset:(int64_t)a3
{
  self->_itemOffset = a3;
}

- (BOOL)isMoreComing
{
  return self->_isMoreComing;
}

- (void)setIsMoreComing:(BOOL)a3
{
  self->_isMoreComing = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAnchor, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithDataRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Error unarchiving Core Data value into CNProviderMetadata: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithVersion:(uint64_t)a1 displayName:(NSObject *)a2 userInfo:(uint64_t)a3 isResetRequested:(uint64_t)a4 isContentEnumerated:(uint64_t)a5 itemAnchor:(uint64_t)a6 itemOffset:(uint64_t)a7 isMoreComing:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Provider metadata has a higher version number than we know how to handle: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)dataRepresentation
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Error archiving CNProviderMetadata: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
