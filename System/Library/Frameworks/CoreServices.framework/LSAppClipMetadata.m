@implementation LSAppClipMetadata

+ (LSAppClipMetadata)new
{
  abort();
}

- (LSAppClipMetadata)init
{
  abort();
}

- (id)_initWithApplicationRecord:(id)a3 parentApplicationIdentifiers:(id)a4 appClipPlist:(id)a5
{
  LSAppClipMetadata *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LSAppClipMetadata;
  v7 = -[LSAppClipMetadata init](&v15, sel_init, a3);
  if (v7)
  {
    v8 = objc_msgSend(a4, "copy");
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v7->_parentApplicationIdentifiers, v10);

    v11 = objc_msgSend(a5, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v7->_appClipPlist, v13);

  }
  return v7;
}

- (BOOL)wantsEphemeralNotifications
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_appClipPlist, "objectForKeyedSubscript:", CFSTR("NSAppClipRequestEphemeralUserNotification"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)wantsLocationConfirmation
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_appClipPlist, "objectForKeyedSubscript:", CFSTR("NSAppClipRequestLocationConfirmation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_parentApplicationIdentifiers, CFSTR("parentApplicationIdentifiers"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_appClipPlist, CFSTR("appClipPlist"));
}

- (LSAppClipMetadata)initWithCoder:(id)a3
{
  LSAppClipMetadata *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LSAppClipMetadata;
  v4 = -[LSAppClipMetadata init](&v14, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), CFSTR("parentApplicationIdentifiers"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v4->_parentApplicationIdentifiers, v7);

    v8 = objc_opt_class();
    XNSGetPropertyListClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, CFSTR("appClipPlist"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v4->_appClipPlist, v12);

  }
  return v4;
}

- (NSArray)parentApplicationIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_appClipPlist, 0);
}

@end
