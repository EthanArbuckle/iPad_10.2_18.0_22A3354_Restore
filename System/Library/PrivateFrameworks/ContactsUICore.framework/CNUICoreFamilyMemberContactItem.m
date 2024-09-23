@implementation CNUICoreFamilyMemberContactItem

- (CNUICoreFamilyMemberContactItem)init
{
  CNUICoreFamilyMemberContactItem *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactItem)initWithContactIdentifier:(id)a3
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  return -[CNUICoreFamilyMemberContactItem initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:](self, "initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:", a3, &stru_1EA606688, 0, 0, 0, 0, 0, v4);
}

- (CNUICoreFamilyMemberContactItem)initWithContactIdentifier:(id)a3 formattedName:(id)a4 imageData:(id)a5 isUnreachable:(BOOL)a6 isProposed:(BOOL)a7 contactType:(int64_t)a8 whitelistStatus:(int64_t)a9 hasBeenPersisted:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CNUICoreFamilyMemberContactItem *v35;
  CNUICoreFamilyMemberContactItem *v36;
  CNUICoreFamilyMemberContactItem *v37;
  objc_super v40;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  if (v16)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_24 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_24, &__block_literal_global_79);
  v19 = CNGuardOSLog_cn_once_object_0_24;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_24, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberContactItem initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
    if (v17)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v17)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_24 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_24, &__block_literal_global_79);
  v27 = CNGuardOSLog_cn_once_object_0_24;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_24, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberContactItem initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
LABEL_10:
  v40.receiver = self;
  v40.super_class = (Class)CNUICoreFamilyMemberContactItem;
  v35 = -[CNUICoreFamilyMemberContactItem init](&v40, sel_init);
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_contactIdentifier, a3);
    objc_storeStrong((id *)&v36->_formattedName, a4);
    objc_storeStrong((id *)&v36->_imageData, a5);
    v36->_isUnreachable = a6;
    v36->_isProposed = a7;
    v36->_contactType = a8;
    v36->_whitelistStatus = a9;
    v36->_hasBeenPersisted = a10;
    v37 = v36;
  }

  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNUICoreFamilyMemberContactItem)initWithCoder:(id)a3
{
  id v4;
  CNUICoreFamilyMemberContactItem *v5;
  void *v6;
  uint64_t v7;
  NSString *contactIdentifier;
  void *v9;
  uint64_t v10;
  NSString *formattedName;
  void *v12;
  uint64_t v13;
  NSData *imageData;
  CNUICoreFamilyMemberContactItem *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNUICoreFamilyMemberContactItem;
  v5 = -[CNUICoreFamilyMemberContactItem init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_formattedName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    formattedName = v5->_formattedName;
    v5->_formattedName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v13;

    v5->_isUnreachable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isUnreachable"));
    v5->_isProposed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isProposed"));
    v5->_contactType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_contactType"));
    v5->_whitelistStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_whitelistStatus"));
    v5->_hasBeenPersisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasBeenPersisted"));
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("_contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedName, CFSTR("_formattedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("_imageData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUnreachable, CFSTR("_isUnreachable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isProposed, CFSTR("_isProposed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contactType, CFSTR("_contactType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_whitelistStatus, CFSTR("_whitelistStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasBeenPersisted, CFSTR("_hasBeenPersisted"));

}

- (BOOL)isEqual:(id)a3
{
  CNUICoreFamilyMemberContactItem *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int64_t v13;
  int64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;

  v4 = (CNUICoreFamilyMemberContactItem *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    v5 = (unint64_t)-[CNUICoreFamilyMemberContactItem contactIdentifier](self, "contactIdentifier");
    v6 = (unint64_t)-[CNUICoreFamilyMemberContactItem contactIdentifier](v4, "contactIdentifier");
    if (v5 | v6)
    {
      if (!objc_msgSend((id)v5, "isEqual:", v6))
        goto LABEL_14;
    }
    v7 = (unint64_t)-[CNUICoreFamilyMemberContactItem formattedName](self, "formattedName");
    v8 = (unint64_t)-[CNUICoreFamilyMemberContactItem formattedName](v4, "formattedName");
    if (v7 | v8)
    {
      if (!objc_msgSend((id)v7, "isEqual:", v8))
        goto LABEL_14;
    }
    if (((v9 = (unint64_t)-[CNUICoreFamilyMemberContactItem imageData](self, "imageData"),
           v10 = (unint64_t)-[CNUICoreFamilyMemberContactItem imageData](v4, "imageData"),
           !(v9 | v10))
       || objc_msgSend((id)v9, "isEqual:", v10))
      && (v11 = -[CNUICoreFamilyMemberContactItem isUnreachable](self, "isUnreachable"),
          v11 == -[CNUICoreFamilyMemberContactItem isUnreachable](v4, "isUnreachable"))
      && (v12 = -[CNUICoreFamilyMemberContactItem isProposed](self, "isProposed"),
          v12 == -[CNUICoreFamilyMemberContactItem isProposed](v4, "isProposed"))
      && (v13 = -[CNUICoreFamilyMemberContactItem contactType](self, "contactType"),
          v13 == -[CNUICoreFamilyMemberContactItem contactType](v4, "contactType"))
      && (v14 = -[CNUICoreFamilyMemberContactItem whitelistStatus](self, "whitelistStatus"),
          v14 == -[CNUICoreFamilyMemberContactItem whitelistStatus](v4, "whitelistStatus")))
    {
      v15 = -[CNUICoreFamilyMemberContactItem hasBeenPersisted](self, "hasBeenPersisted");
      v16 = v15 ^ -[CNUICoreFamilyMemberContactItem hasBeenPersisted](v4, "hasBeenPersisted") ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v16) = 0;
    }
  }

  return v16;
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
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreFamilyMemberContactItem contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreFamilyMemberContactItem formattedName](self, "formattedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5;

  v9 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreFamilyMemberContactItem imageData](self, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 31 * (objc_msgSend(v9, "objectHash:", v10) - v8 + 32 * v8);

  v12 = 31 * (v11 + -[CNUICoreFamilyMemberContactItem isUnreachable](self, "isUnreachable"));
  v13 = v12 + -[CNUICoreFamilyMemberContactItem isProposed](self, "isProposed");
  v14 = -[CNUICoreFamilyMemberContactItem contactType](self, "contactType");
  if (v14 >= 0)
    v15 = v14;
  else
    v15 = -v14;
  v16 = v15 - v13 + 32 * v13;
  v17 = -[CNUICoreFamilyMemberContactItem whitelistStatus](self, "whitelistStatus");
  if (v17 >= 0)
    v18 = v17;
  else
    v18 = -v17;
  return 31 * (v18 - v16 + 32 * v16)
       + -[CNUICoreFamilyMemberContactItem hasBeenPersisted](self, "hasBeenPersisted")
       + 0xD2FD88B5F11;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactItem contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactIdentifier"), v4);

  -[CNUICoreFamilyMemberContactItem formattedName](self, "formattedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("formattedName"), v6);

  v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("hasBeenPersisted"), -[CNUICoreFamilyMemberContactItem hasBeenPersisted](self, "hasBeenPersisted"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)formattedName
{
  return self->_formattedName;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (BOOL)isUnreachable
{
  return self->_isUnreachable;
}

- (BOOL)isProposed
{
  return self->_isProposed;
}

- (int64_t)contactType
{
  return self->_contactType;
}

- (int64_t)whitelistStatus
{
  return self->_whitelistStatus;
}

- (BOOL)hasBeenPersisted
{
  return self->_hasBeenPersisted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_formattedName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)initWithContactIdentifier:(NSObject *)a1 formattedName:(uint64_t)a2 imageData:(uint64_t)a3 isUnreachable:(uint64_t)a4 isProposed:(uint64_t)a5 contactType:(uint64_t)a6 whitelistStatus:(uint64_t)a7 hasBeenPersisted:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘formattedName’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithContactIdentifier:(NSObject *)a1 formattedName:(uint64_t)a2 imageData:(uint64_t)a3 isUnreachable:(uint64_t)a4 isProposed:(uint64_t)a5 contactType:(uint64_t)a6 whitelistStatus:(uint64_t)a7 hasBeenPersisted:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contactIdentifier’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
