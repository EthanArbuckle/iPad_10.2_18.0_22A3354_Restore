@implementation _UNNotificationContact

- (NSString)preferredName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested")
    && (-[_UNNotificationContact displayName](self, "displayName"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4))
  {
    UNLocalizedFormatStringForKey((uint64_t)CFSTR("%@"), CFSTR("CONTACT_MAYBE_PREFIX_FORMAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[_UNNotificationContact displayName](self, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v5, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UNNotificationContact displayName](self, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v9)
    {
      v10 = v9;
      v5 = v10;
    }
    else
    {
      -[_UNNotificationContact handle](self, "handle");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v10;
  }

  return (NSString *)v8;
}

- (BOOL)isPreferredNameReal
{
  void *v2;
  BOOL v3;

  -[_UNNotificationContact displayName](self, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_initWithhandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _UNNotificationContact *v23;
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
  v37.super_class = (Class)_UNNotificationContact;
  v23 = -[_UNNotificationContact init](&v37, sel_init);
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

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  int v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_12:
      LOBYTE(v20) = 0;
      goto LABEL_13;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_12;
  if (!-[_UNNotificationContact isSimilar:](self, "isSimilar:", v5))
    goto LABEL_12;
  -[_UNNotificationContact serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNEqualStrings(v6, v7);

  if (!v8)
    goto LABEL_12;
  -[_UNNotificationContact displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = UNEqualStrings(v9, v10);

  if (!v11)
    goto LABEL_12;
  v12 = -[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested");
  if (v12 != objc_msgSend(v5, "isDisplayNameSuggested"))
    goto LABEL_12;
  -[_UNNotificationContact cnContactIdentifier](self, "cnContactIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cnContactIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = UNEqualStrings(v13, v14);

  if (!v15)
    goto LABEL_12;
  -[_UNNotificationContact cnContactFullname](self, "cnContactFullname");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cnContactFullname");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = UNEqualStrings(v16, v17);

  if (!v18)
    goto LABEL_12;
  v19 = -[_UNNotificationContact isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested");
  v20 = v19 ^ objc_msgSend(v5, "isCNContactIdentifierSuggested") ^ 1;
LABEL_13:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[_UNNotificationContact similarHash](self, "similarHash");
  v4 = -[NSString hash](self->_serviceName, "hash") + v3;
  v5 = -[NSString hash](self->_displayName, "hash");
  v6 = v4 + v5 + -[NSString hash](self->_cnContactIdentifier, "hash");
  return v6 + -[NSString hash](self->_cnContactFullname, "hash") + self->_cnContactIdentifierSuggested;
}

- (id)debugDescription
{
  return -[_UNNotificationContact descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _UNMutableNotificationContact *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v4 = +[_UNMutableNotificationContact allocWithZone:](_UNMutableNotificationContact, "allocWithZone:", a3);
  -[_UNNotificationContact handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UNNotificationContact handleType](self, "handleType");
  -[_UNNotificationContact serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContact displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested");
  -[_UNNotificationContact customIdentifier](self, "customIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContact cnContactIdentifier](self, "cnContactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContact cnContactFullname](self, "cnContactFullname");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = -[_UNNotificationContact isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested");
  v13 = -[_UNNotificationContact _initWithhandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:](v4, "_initWithhandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v5, v6, v7, v8, v9, v10, v11, v12, v15);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_UNNotificationContact handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("handle"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[_UNNotificationContact handleType](self, "handleType"), CFSTR("handleType"));
  -[_UNNotificationContact serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("serviceName"));

  -[_UNNotificationContact displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("displayName"));

  objc_msgSend(v10, "encodeBool:forKey:", -[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested"), CFSTR("displayNameSuggested"));
  -[_UNNotificationContact customIdentifier](self, "customIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("customIdentifier"));

  -[_UNNotificationContact cnContactIdentifier](self, "cnContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("cnContactIdentifier"));

  -[_UNNotificationContact cnContactFullname](self, "cnContactFullname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("cnContactFullname"));

  objc_msgSend(v10, "encodeBool:forKey:", -[_UNNotificationContact isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"), CFSTR("cnContactSuggested"));
}

- (_UNNotificationContact)initWithCoder:(id)a3
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
  _UNNotificationContact *v13;
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
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("cnContactSuggested"));

  LOBYTE(v15) = v12;
  v13 = -[_UNNotificationContact _initWithhandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:](self, "_initWithhandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v4, v5, v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UNNotificationContact descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UNNotificationContact *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64___UNNotificationContact_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E57EFBA8;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UNNotificationContact succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContact handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("handle"));

  -[_UNNotificationContact displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("displayName"));

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested"), CFSTR("isDisplayNameSuggested"));
  -[_UNNotificationContact serviceName](self, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "un_logDigest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("serviceName"));

  -[_UNNotificationContact customIdentifier](self, "customIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "un_logDigest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("customIdentifier"));

  -[_UNNotificationContact cnContactIdentifier](self, "cnContactIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", v17, CFSTR("cnContactIdentifier"));

  -[_UNNotificationContact cnContactFullname](self, "cnContactFullname");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "un_logDigest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "appendObject:withName:", v20, CFSTR("cnContactFullname"));

  v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationContact isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"), CFSTR("isCNContactIdentifierSuggested"));
  return v3;
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

- (unint64_t)similarHash
{
  NSUInteger v3;

  v3 = self->_handleType + -[NSString hash](self->_handle, "hash");
  return v3 + -[NSString hash](self->_customIdentifier, "hash");
}

- (BOOL)isSimilar:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_8;
  -[_UNNotificationContact handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNEqualStrings(v6, v7);

  if (!v8)
    goto LABEL_8;
  v9 = -[_UNNotificationContact handleType](self, "handleType");
  if (v9 != objc_msgSend(v5, "handleType"))
    goto LABEL_8;
  -[_UNNotificationContact customIdentifier](self, "customIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = UNEqualStrings(v10, v11);

LABEL_9:
  return v12;
}

+ (id)contactFromINPerson:(id)a3 serviceName:(id)a4
{
  id v5;
  id v6;
  _UNMutableNotificationContact *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isMe") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_alloc_init(_UNMutableNotificationContact);
    objc_msgSend(v5, "personHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UNMutableNotificationContact setHandle:](v7, "setHandle:", v9);
    -[_UNMutableNotificationContact setServiceName:](v7, "setServiceName:", v6);
    objc_msgSend(v5, "personHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    if (v11 == 2)
      v12 = 2;
    else
      v12 = v11 == 1;
    -[_UNMutableNotificationContact setHandleType:](v7, "setHandleType:", v12);
    objc_msgSend(v5, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", v9) & 1) == 0)
      -[_UNMutableNotificationContact setDisplayName:](v7, "setDisplayName:", v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = objc_msgSend(v5, "isContactSuggestion");
    else
      v14 = 0;
    -[_UNMutableNotificationContact setDisplayNameSuggested:](v7, "setDisplayNameSuggested:", v14);
    objc_msgSend(v5, "customIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNMutableNotificationContact setCustomIdentifier:](v7, "setCustomIdentifier:", v15);

    objc_msgSend(v5, "contactIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNMutableNotificationContact setCnContactIdentifier:](v7, "setCnContactIdentifier:", v16);

  }
  return v7;
}

@end
