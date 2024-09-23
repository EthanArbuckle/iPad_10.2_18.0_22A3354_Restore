@implementation _BRContainerItem

- (_BRContainerItem)initWithQueryItem:(id)a3 container:(id)a4 zoneRowID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BRContainerItem *v11;
  uint64_t v12;
  NSSet *containerClientIDs;
  uint64_t v14;
  NSString *containerID;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *localizedName;
  int v22;
  _BRContainerItem *v23;
  void *v24;
  NSObject *v25;
  int v26;
  int v27;
  unint64_t v28;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v30.receiver = self;
    v30.super_class = (Class)_BRContainerItem;
    v11 = -[BRQueryItem initWithQueryItem:](&v30, sel_initWithQueryItem_, v8);
    if (v11)
    {
      objc_msgSend(v9, "bundleIdentifiers");
      v12 = objc_claimAutoreleasedReturnValue();
      containerClientIDs = v11->_containerClientIDs;
      v11->_containerClientIDs = (NSSet *)v12;

      objc_msgSend(v9, "identifier");
      v14 = objc_claimAutoreleasedReturnValue();
      containerID = v11->_containerID;
      v11->_containerID = (NSString *)v14;

      objc_msgSend(v9, "localizedName");
      v16 = objc_claimAutoreleasedReturnValue();
      displayName = v11->_displayName;
      v11->_displayName = (NSString *)v16;

      if (BRIsFPFSEnabled(v18, v19))
      {
        objc_msgSend(v8, "filename");
        v20 = objc_claimAutoreleasedReturnValue();
        localizedName = v11->_localizedName;
        v11->_localizedName = (NSString *)v20;

        if ((objc_msgSend(v9, "isInInitialState") & 1) != 0)
          LOBYTE(v22) = 1;
        else
          v22 = objc_msgSend(v9, "isDocumentScopePublic") ^ 1;
        v11->_isPristine = v22;
        v26 = objc_msgSend(v9, "isDocumentScopePublic");
        v27 = 0x4000000;
        if (v26)
          v27 = 0;
        v28 = *(_DWORD *)&v11->super._flags.var0 & 0xFBFFFFFF | ((unint64_t)BYTE4(v11->super._flags.value) << 32);
        *(_DWORD *)&v11->super._flags.var0 = *(_DWORD *)&v11->super._flags.var0 & 0xFBFFFFFF | v27;
        BYTE4(v11->super._flags.value) = BYTE4(v28);
      }
      else
      {
        objc_storeStrong((id *)&v11->_localizedName, v11->_displayName);
        v11->_isPristine = objc_msgSend(v9, "isInInitialState");
        if (!v11->super._zoneRowID)
        {
          objc_storeStrong((id *)&v11->super._zoneRowID, a5);
          if (!v10)
          {
            brc_bread_crumbs((uint64_t)"-[_BRContainerItem initWithQueryItem:container:zoneRowID:]", 2619);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              -[_BRContainerItem initWithQueryItem:container:zoneRowID:].cold.1();

          }
        }
      }
    }
    self = v11;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_BRContainerItem;
  v4 = a3;
  -[BRQueryItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerID, CFSTR("cContainerID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerClientIDs, CFSTR("cContainerClientIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedName, CFSTR("cLocalizedName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isPristine, CFSTR("cPristine"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("cDisplayName"));

}

- (_BRContainerItem)initWithCoder:(id)a3
{
  id v4;
  _BRContainerItem *v5;
  uint64_t v6;
  NSString *containerID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *containerClientIDs;
  uint64_t v13;
  NSString *localizedName;
  uint64_t v15;
  NSString *displayName;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BRContainerItem;
  v5 = -[BRQueryItem initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cContainerID"));
    v6 = objc_claimAutoreleasedReturnValue();
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("cContainerClientIDs"));
    v11 = objc_claimAutoreleasedReturnValue();
    containerClientIDs = v5->_containerClientIDs;
    v5->_containerClientIDs = (NSSet *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cLocalizedName"));
    v13 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v13;

    v5->_isPristine = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cPristine"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cDisplayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithQueryItem:", self);
  objc_storeStrong((id *)(v4 + 280), self->_containerID);
  objc_storeStrong((id *)(v4 + 288), self->_containerClientIDs);
  objc_storeStrong((id *)(v4 + 296), self->_localizedName);
  *(_BYTE *)(v4 + 304) = self->_isPristine;
  objc_storeStrong((id *)(v4 + 312), self->_displayName);
  return (id)v4;
}

- (id)itemIdentifier
{
  objc_super v4;

  if ((BRIsFPFSEnabled(self, a2) & 1) == 0
    && -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.CloudDocs")))
  {
    return (id)*MEMORY[0x1E0CAABA8];
  }
  v4.receiver = self;
  v4.super_class = (Class)_BRContainerItem;
  -[BRQueryItem itemIdentifier](&v4, sel_itemIdentifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filename
{
  return self->_localizedName;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)fp_cloudContainerIdentifier
{
  return self->_containerID;
}

- (id)fp_cloudContainerClientBundleIdentifiers
{
  return self->_containerClientIDs;
}

- (BOOL)fp_isContainer
{
  return 1;
}

- (BOOL)fp_isContainerPristine
{
  return self->_isPristine;
}

- (BOOL)isHidden
{
  return self->_isPristine;
}

- (id)parentItemIdentifier
{
  return (id)*MEMORY[0x1E0CAABA8];
}

- (id)typeIdentifier
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
}

- (id)containerDisplayName
{
  return self->_displayName;
}

- (unint64_t)capabilities
{
  return 35;
}

- (id)subclassDescription
{
  if (self->_isPristine)
    return CFSTR(" pristine");
  else
    return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v4;

  if (BRIsFPFSEnabled(self, a2)
    && (sel_contentModificationDate != a3 ? (v4 = sel_creationDate == a3) : (v4 = 1), v4))
  {
    return 0;
  }
  else
  {
    return objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_containerClientIDs, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

- (void)initWithQueryItem:container:zoneRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: zoneRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
