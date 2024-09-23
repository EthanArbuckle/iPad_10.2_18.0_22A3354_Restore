@implementation BBContact

+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 cnContactIdentifier:(id)a7 cnContactFullname:(id)a8 cnContactIdentifierSuggested:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  LOBYTE(v21) = a9;
  v19 = -[BBContact _initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:]([BBContact alloc], "_initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v18, a4, v17, v16, 0, 0, v15, v14, v21);

  return (BBContact *)v19;
}

+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 customIdentifier:(id)a7 cnContactIdentifier:(id)a8 cnContactFullname:(id)a9 cnContactIdentifierSuggested:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  LOBYTE(v24) = a10;
  v22 = -[BBContact _initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:]([BBContact alloc], "_initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v21, a4, v20, v19, 0, v18, v17, v16, v24);

  return (BBContact *)v22;
}

+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11
{
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;

  v12 = a7;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  LOBYTE(v25) = a11;
  v23 = -[BBContact _initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:]([BBContact alloc], "_initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v22, a4, v21, v20, v12, v19, v18, v17, v25);

  return (BBContact *)v23;
}

- (id)_initWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BBContact *v23;
  uint64_t v24;
  NSString *handle;
  uint64_t v26;
  NSString *serviceName;
  uint64_t v28;
  NSString *displayName;
  uint64_t v30;
  NSString *customIdentifier;
  uint64_t v32;
  NSString *cnContactIdentifier;
  uint64_t v34;
  NSString *cnContactFullname;
  objc_super v37;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)BBContact;
  v23 = -[BBContact init](&v37, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    handle = v23->_handle;
    v23->_handle = (NSString *)v24;

    v23->_handleType = a4;
    v26 = objc_msgSend(v18, "copy");
    serviceName = v23->_serviceName;
    v23->_serviceName = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    displayName = v23->_displayName;
    v23->_displayName = (NSString *)v28;

    v23->_displayNameSuggested = a7;
    v30 = objc_msgSend(v20, "copy");
    customIdentifier = v23->_customIdentifier;
    v23->_customIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v21, "copy");
    cnContactIdentifier = v23->_cnContactIdentifier;
    v23->_cnContactIdentifier = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    cnContactFullname = v23->_cnContactFullname;
    v23->_cnContactFullname = (NSString *)v34;

    v23->_cnContactIdentifierSuggested = a11;
  }

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  _BOOL8 displayNameSuggested;
  NSUInteger v7;
  NSUInteger v8;

  v3 = self->_handleType ^ -[NSString hash](self->_handle, "hash");
  v4 = -[NSString hash](self->_serviceName, "hash");
  v5 = v3 ^ v4 ^ -[NSString hash](self->_displayName, "hash");
  displayNameSuggested = self->_displayNameSuggested;
  v7 = displayNameSuggested ^ -[NSString hash](self->_customIdentifier, "hash");
  v8 = v5 ^ v7 ^ -[NSString hash](self->_cnContactIdentifier, "hash");
  return v8 ^ -[NSString hash](self->_cnContactFullname, "hash") ^ self->_cnContactIdentifierSuggested;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int64_t handleType;
  void *v10;
  int v11;
  void *v12;
  int v13;
  int displayNameSuggested;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  int cnContactIdentifierSuggested;
  BOOL v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
LABEL_14:
      v22 = 0;
      goto LABEL_15;
    }
  }
  v5 = v4;
  v6 = v5;
  if (!v5)
    goto LABEL_14;
  objc_msgSend(v5, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BSEqualStrings();

  if (!v8)
    goto LABEL_14;
  handleType = self->_handleType;
  if (handleType != objc_msgSend(v6, "handleType"))
    goto LABEL_14;
  objc_msgSend(v6, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = BSEqualStrings();

  if (!v11)
    goto LABEL_14;
  objc_msgSend(v6, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BSEqualStrings();

  if (!v13)
    goto LABEL_14;
  displayNameSuggested = self->_displayNameSuggested;
  if (displayNameSuggested != objc_msgSend(v6, "isDisplayNameSuggested"))
    goto LABEL_14;
  objc_msgSend(v6, "customIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = BSEqualStrings();

  if (!v16)
    goto LABEL_14;
  objc_msgSend(v6, "cnContactIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = BSEqualStrings();

  if (!v18)
    goto LABEL_14;
  objc_msgSend(v6, "cnContactFullname");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = BSEqualStrings();

  if (!v20)
    goto LABEL_14;
  cnContactIdentifierSuggested = self->_cnContactIdentifierSuggested;
  v22 = cnContactIdentifierSuggested == objc_msgSend(v6, "isCNContactIdentifierSuggested");
LABEL_15:

  return v22;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; handle: %@, handleType: %li, serviceName: %@, displayName: %@, displayNameSuggested:%d, customIdentifier: %@, cnContactIdentifier: %@, cnContactFullname: %@, suggestedContactIdentifier: %d>"),
               objc_opt_class(),
               self,
               self->_handle,
               self->_handleType,
               self->_serviceName,
               self->_displayName,
               self->_displayNameSuggested,
               self->_customIdentifier,
               self->_cnContactIdentifier,
               self->_cnContactFullname,
               self->_cnContactIdentifierSuggested);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_handleType, CFSTR("handleType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_displayNameSuggested, CFSTR("displayNameSuggested"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customIdentifier, CFSTR("customIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cnContactIdentifier, CFSTR("cnContactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cnContactFullname, CFSTR("cnContactFullname"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cnContactIdentifierSuggested, CFSTR("suggestedContactIdentifier"));

}

- (BBContact)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BBContact *v13;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("handleType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("displayNameSuggested"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cnContactIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cnContactFullname"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("suggestedContactIdentifier"));

  LOBYTE(v15) = v12;
  v13 = -[BBContact _initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:](self, "_initWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v4, v5, v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (NSString)handle
{
  return self->_handle;
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isDisplayNameSuggested
{
  return self->_displayNameSuggested;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (BOOL)isCNContactIdentifierSuggested
{
  return self->_cnContactIdentifierSuggested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (BBContact)contactWithCustomHandle:(id)a3 customHandleType:(int64_t)a4 serviceName:(id)a5 customDisplayName:(id)a6 cnContactIdentifier:(id)a7 cnContactFullname:(id)a8 cnContactIdentifierSuggested:(BOOL)a9
{
  return 0;
}

- (NSString)customHandle
{
  return 0;
}

- (int64_t)customHandleType
{
  return 0;
}

- (NSString)customDisplayName
{
  return 0;
}

@end
