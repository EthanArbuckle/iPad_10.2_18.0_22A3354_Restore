@implementation DNDAppAction

+ (BOOL)runtimeIsSupported:(id *)a3
{
  Class v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = NSClassFromString(CFSTR("LNAction"));
  if (!v4)
  {
    v5 = DNDLogAppConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
    {
      +[DNDAppAction runtimeIsSupported:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
      if (!a3)
        return v4 != 0;
      goto LABEL_4;
    }
    if (a3)
    {
LABEL_4:
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = CFSTR("Failed to encode/decode app action: LinkServices framework is not loaded.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1006, v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4 != 0;
}

+ (BOOL)archivingIsSupported:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (NSClassFromString(CFSTR("WFAppIntentArchiver"))
    && NSClassFromString(CFSTR("LNFullyQualifiedActionIdentifier")))
  {
    return 1;
  }
  v5 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
  {
    +[DNDAppAction archivingIsSupported:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    if (!a3)
      return 0;
    goto LABEL_6;
  }
  if (a3)
  {
LABEL_6:
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Failed to (un)archive action: VoiceShortcut or LinkServices framework is not loaded.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1006, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (DNDAppAction)initWithAction:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  DNDAppAction *v7;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "runtimeIsSupported:", 0))
  {
    self = (DNDAppAction *)-[DNDAppAction _initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:](self, "_initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:", v6, 0, 0, 0, v4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (DNDAppAction)initWithEncodedAction:(id)a3 actionIdentifier:(id)a4 bundleIdentifier:(id)a5 enabled:(BOOL)a6
{
  return (DNDAppAction *)-[DNDAppAction _initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:](self, "_initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:", 0, a5, a4, a3, a6);
}

- (id)_initWithAction:(id)a3 bundleIdentifier:(id)a4 actionIdentifier:(id)a5 encodedAction:(id)a6 enabled:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DNDAppAction *v16;
  uint64_t v17;
  LNAction *rawAction;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  NSString *v22;
  uint64_t v23;
  NSData *encodedAction;
  uint64_t v25;
  NSString *bundleIdentifier;
  DNDAppAction *v27;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if ((objc_msgSend((id)objc_opt_class(), "runtimeIsSupported:", 0) & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "archivingIsSupported:", 0))
  {
    v29.receiver = self;
    v29.super_class = (Class)DNDAppAction;
    v16 = -[DNDAppAction init](&v29, sel_init);
    if (v16)
    {
      v17 = objc_msgSend(v12, "copy");
      rawAction = v16->_rawAction;
      v16->_rawAction = (LNAction *)v17;

      objc_msgSend(v12, "identifier");
      v19 = objc_claimAutoreleasedReturnValue();
      identifier = v16->_identifier;
      v16->_identifier = (NSString *)v19;

      v21 = objc_msgSend(v14, "copy");
      v22 = v16->_identifier;
      v16->_identifier = (NSString *)v21;

      v23 = objc_msgSend(v15, "copy");
      encodedAction = v16->_encodedAction;
      v16->_encodedAction = (NSData *)v23;

      v25 = objc_msgSend(v13, "copy");
      bundleIdentifier = v16->_bundleIdentifier;
      v16->_bundleIdentifier = (NSString *)v25;

      v16->_enabled = a7;
    }
    self = v16;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSString)identifier
{
  NSString *identifier;

  identifier = self->_identifier;
  if (identifier)
    return identifier;
  -[LNAction identifier](self->_rawAction, "identifier");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (LNAction)action
{
  LNAction *rawAction;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSData *encodedAction;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  LNAction *v14;
  void *v15;
  Class v16;
  NSData *v17;
  NSObject *v18;
  LNAction *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  LNAction *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  rawAction = self->_rawAction;
  if (!rawAction)
  {
    if (objc_msgSend((id)objc_opt_class(), "archivingIsSupported:", 0))
    {
      -[DNDAppAction effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        v6 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("LNFullyQualifiedActionIdentifier"))), "initWithActionIdentifier:bundleIdentifier:", self->_identifier, v4);
        v7 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("WFAppIntentArchiver"))), "initWithIdentifier:actionMetadata:", v6, 0);
        encodedAction = self->_encodedAction;
        v22 = 0;
        objc_msgSend(v7, "unarchiveActionFromData:error:", encodedAction, &v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v22;
        v11 = v10;
        v12 = DNDLogAppConfiguration;
        if (!v9 || v10)
        {
          if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
            -[DNDAppAction action].cold.2();

          v15 = (void *)MEMORY[0x1E0CB3710];
          v16 = NSClassFromString(CFSTR("LNAction"));
          v17 = self->_encodedAction;
          v21 = 0;
          objc_msgSend(v15, "unarchivedObjectOfClass:fromData:error:", v16, v17, &v21);
          v14 = (LNAction *)objc_claimAutoreleasedReturnValue();
          v13 = v21;

          v18 = DNDLogAppConfiguration;
          if (!v14 || v13)
          {
            if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
              -[DNDAppAction action].cold.1();
          }
          else
          {
            if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v14;
              _os_log_impl(&dword_19ABEB000, v18, OS_LOG_TYPE_DEFAULT, "Unarchived settings using fallback. %@", buf, 0xCu);
            }
            v13 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = (LNAction *)v9;
            _os_log_impl(&dword_19ABEB000, v12, OS_LOG_TYPE_DEFAULT, "Unarchived settings. %@", buf, 0xCu);
          }
          v13 = 0;
          v14 = (LNAction *)v9;
        }
        v19 = self->_rawAction;
        self->_rawAction = v14;

      }
    }
    rawAction = self->_rawAction;
  }
  return rawAction;
}

- (NSData)encodedAction
{
  NSData *encodedAction;
  NSData *v3;
  int v5;
  NSData *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSData *v12;
  id v13;
  NSData *v14;
  id v16;

  encodedAction = self->_encodedAction;
  if (encodedAction)
  {
LABEL_2:
    v3 = encodedAction;
    return v3;
  }
  v5 = objc_msgSend((id)objc_opt_class(), "archivingIsSupported:", 0);
  v3 = 0;
  if (v5)
  {
    -[DNDAppAction effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      v7 = objc_alloc(NSClassFromString(CFSTR("LNFullyQualifiedActionIdentifier")));
      -[DNDAppAction identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithActionIdentifier:bundleIdentifier:", v8, v6);

      v10 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("WFAppIntentArchiver"))), "initWithIdentifier:actionMetadata:", v9, 0);
      -[DNDAppAction rawAction](self, "rawAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v10, "archiveAction:error:", v11, &v16);
      v12 = (NSData *)objc_claimAutoreleasedReturnValue();
      v13 = v16;

      if ((!v12 || v13) && os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
        -[DNDAppAction encodedAction].cold.1();
      v14 = self->_encodedAction;
      self->_encodedAction = v12;

      encodedAction = self->_encodedAction;
      goto LABEL_2;
    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDAppAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DNDAppAction *v11;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "runtimeIsSupported:", 0))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNDActionEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNDActionEncodedAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNDActionActionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNDActionBundleIdentifierKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", NSClassFromString(CFSTR("LNAction")), CFSTR("DNDActionAction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self = (DNDAppAction *)-[DNDAppAction _initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:](self, "_initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:", v10, v9, v8, v7, v6);

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 enabled;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  enabled = self->_enabled;
  v7 = a3;
  objc_msgSend(v4, "numberWithBool:", enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("DNDActionEnabled"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_rawAction, CFSTR("DNDActionAction"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_encodedAction, CFSTR("DNDActionEncodedAction"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("DNDActionBundleIdentifierKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("DNDActionActionIdentifier"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DNDActionEnabled"));

  -[DNDAppAction encodedAction](self, "encodedAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DNDActionEncodedAction"));

  -[DNDAppAction bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("DNDActionBundleIdentifierKey"));

  -[DNDAppAction identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("DNDActionActionIdentifier"));

  v8 = (void *)MEMORY[0x1E0CB36F8];
  -[DNDAppAction action](self, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;

  if (v11 && os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDAppAction encodedAction].cold.1();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("AppConfigurationActionPayload"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

+ (id)appActionFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  DNDAppAction *v6;
  void *v7;
  void *v8;
  void *v9;
  DNDAppAction *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DNDActionEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = [DNDAppAction alloc];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DNDActionEncodedAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DNDActionActionIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DNDActionBundleIdentifierKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[DNDAppAction initWithEncodedAction:actionIdentifier:bundleIdentifier:enabled:](v6, "initWithEncodedAction:actionIdentifier:bundleIdentifier:enabled:", v7, v8, v9, v5);
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  -[DNDAppAction rawAction](self, "rawAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDAppAction encodedAction](self, "encodedAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDAppAction bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDAppAction identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[DNDAppAction isEnabled](self, "isEnabled");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDAppAction *v5;
  DNDAppAction *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v5 = (DNDAppAction *)a3;
  if (self == v5)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDAppAction rawAction](self, "rawAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDAppAction rawAction](v6, "rawAction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDAppAction rawAction](self, "rawAction");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          LOBYTE(v13) = 0;
          goto LABEL_53;
        }
        v10 = (void *)v9;
        -[DNDAppAction rawAction](v6, "rawAction");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          LOBYTE(v13) = 0;
LABEL_52:

          goto LABEL_53;
        }
        -[DNDAppAction rawAction](self, "rawAction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDAppAction rawAction](v6, "rawAction");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          LOBYTE(v13) = 0;
LABEL_51:

          goto LABEL_52;
        }
        v49 = v3;
        v50 = v12;
        v51 = v11;
        v52 = v10;
      }
      -[DNDAppAction encodedAction](self, "encodedAction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDAppAction encodedAction](v6, "encodedAction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
        goto LABEL_16;
      -[DNDAppAction encodedAction](self, "encodedAction");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[DNDAppAction encodedAction](v6, "encodedAction");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          v47 = v14;
          -[DNDAppAction encodedAction](self, "encodedAction");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDAppAction encodedAction](v6, "encodedAction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "isEqual:", v20) & 1) != 0)
          {
            v42 = v19;
            v43 = v17;
            v41 = v20;
            v14 = v47;
LABEL_16:
            -[DNDAppAction bundleIdentifier](self, "bundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDAppAction bundleIdentifier](v6, "bundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21 == v22)
            {
              v46 = v3;
              v48 = v14;
              v45 = v21;
            }
            else
            {
              -[DNDAppAction bundleIdentifier](self, "bundleIdentifier");
              v23 = objc_claimAutoreleasedReturnValue();
              if (!v23)
              {

                LOBYTE(v13) = 0;
LABEL_47:
                if (v14 != v15)
                {

                }
LABEL_50:
                v11 = v51;
                v10 = v52;
                v12 = v50;
                v3 = v49;
                if (v7 != v8)
                  goto LABEL_51;
LABEL_53:

                goto LABEL_54;
              }
              v44 = (void *)v23;
              -[DNDAppAction bundleIdentifier](v6, "bundleIdentifier");
              v24 = objc_claimAutoreleasedReturnValue();
              if (!v24)
              {
                LOBYTE(v13) = 0;
LABEL_45:

                goto LABEL_46;
              }
              v48 = v14;
              v40 = (void *)v24;
              -[DNDAppAction bundleIdentifier](self, "bundleIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDAppAction bundleIdentifier](v6, "bundleIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v25;
              if (!objc_msgSend(v25, "isEqual:"))
              {
                LOBYTE(v13) = 0;
                v14 = v48;
LABEL_44:

                goto LABEL_45;
              }
              v45 = v21;
              v46 = v3;
            }
            -[DNDAppAction identifier](self, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDAppAction identifier](self, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 == v27)
              goto LABEL_34;
            -[DNDAppAction identifier](self, "identifier");
            v28 = objc_claimAutoreleasedReturnValue();
            if (!v28)
            {

              LOBYTE(v13) = 0;
              goto LABEL_43;
            }
            v3 = (void *)v28;
            -[DNDAppAction identifier](self, "identifier");
            v29 = objc_claimAutoreleasedReturnValue();
            if (!v29)
            {
              LOBYTE(v13) = 0;
              goto LABEL_41;
            }
            v37 = (void *)v29;
            -[DNDAppAction identifier](self, "identifier");
            v34 = v3;
            v30 = objc_claimAutoreleasedReturnValue();
            -[DNDAppAction identifier](self, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)v30;
            v31 = (void *)v30;
            v3 = v34;
            if (objc_msgSend(v31, "isEqual:"))
            {
LABEL_34:
              v32 = -[DNDAppAction isEnabled](self, "isEnabled");
              v13 = v32 ^ -[DNDAppAction isEnabled](v6, "isEnabled") ^ 1;
              if (v26 == v27)
              {

LABEL_42:
LABEL_43:
                v21 = v45;
                v3 = v46;
                v14 = v48;
                if (v45 == v22)
                {
LABEL_46:

                  goto LABEL_47;
                }
                goto LABEL_44;
              }
            }
            else
            {
              LOBYTE(v13) = 0;
            }

LABEL_41:
            goto LABEL_42;
          }

LABEL_32:
          LOBYTE(v13) = 0;
          goto LABEL_50;
        }

      }
      goto LABEL_32;
    }
    LOBYTE(v13) = 0;
  }
LABEL_54:

  return v13;
}

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
  -[DNDAppAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDAppAction isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDAppAction rawAction](self, "rawAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_encodedAction != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDAppAction bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@; enabled: %@; action: %@; hasEncoded: %@; bundleIdentifier: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:", self->_rawAction, self->_bundleIdentifier, self->_identifier, self->_encodedAction, self->_enabled);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDAppAction _initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:](+[DNDMutableAppAction allocWithZone:](DNDMutableAppAction, "allocWithZone:", a3), "_initWithAction:bundleIdentifier:actionIdentifier:encodedAction:enabled:", self->_rawAction, self->_bundleIdentifier, self->_identifier, self->_encodedAction, self->_enabled);
}

- (LNAction)rawAction
{
  return self->_rawAction;
}

- (void)setRawAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setEncodedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedAction, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawAction, 0);
}

+ (void)runtimeIsSupported:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19ABEB000, a1, a3, "Failed to encode/decode app action: LinkServices framework is not loaded.", a5, a6, a7, a8, 0);
}

+ (void)archivingIsSupported:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19ABEB000, a1, a3, "Failed to (un)archive action: VoiceShortcut or LinkServices framework is not loaded.", a5, a6, a7, a8, 0);
}

- (void)action
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19ABEB000, v0, v1, "Failed to unarchive settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encodedAction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19ABEB000, v0, v1, "Failed to archive settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
