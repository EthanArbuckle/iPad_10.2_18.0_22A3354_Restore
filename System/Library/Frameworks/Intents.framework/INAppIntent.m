@implementation INAppIntent

- (INAppIntent)initWithJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  INAppIntent *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_launchId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_extensionBundleId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appIntentIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serializedParameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[INAppIntent initWithAppBundleIdentifier:extensionBundleIdentifier:appIntentIdentifier:serializedParameters:](self, "initWithAppBundleIdentifier:extensionBundleIdentifier:appIntentIdentifier:serializedParameters:", v5, v6, v7, v8);
  return v9;
}

- (INAppIntent)initWithAppBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 appIntentIdentifier:(id)a5 serializedParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  INAppIntent *v16;
  uint64_t v17;
  NSString *appIntentIdentifier;
  uint64_t v19;
  NSDictionary *serializedParameters;
  INAppIntent *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)INAppIntent;
  v16 = -[INIntent initWithIdentifier:backingStore:](&v23, sel_initWithIdentifier_backingStore_, v15, 0);

  if (v16)
  {
    -[INAppIntent _setLaunchId:](v16, "_setLaunchId:", v10);
    -[INAppIntent _setExtensionBundleId:](v16, "_setExtensionBundleId:", v11);
    v17 = objc_msgSend(v12, "copy");
    appIntentIdentifier = v16->_appIntentIdentifier;
    v16->_appIntentIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    serializedParameters = v16->_serializedParameters;
    v16->_serializedParameters = (NSDictionary *)v19;

    v21 = v16;
  }

  return v16;
}

- (INAppIntent)initWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameters:(id)a5
{
  return -[INAppIntent initWithAppBundleIdentifier:extensionBundleIdentifier:appIntentIdentifier:serializedParameters:](self, "initWithAppBundleIdentifier:extensionBundleIdentifier:appIntentIdentifier:serializedParameters:", a3, 0, a4, a5);
}

- (INAppIntent)initWithAppBundleIdentifier:(id)a3 linkAction:(id)a4 linkActionMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  INAppIntent *v17;
  INAppIntent *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "valueForKey:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  -[INAppIntent voiceShortcutClient](self, "voiceShortcutClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v19 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 136315138;
    v27 = "-[INAppIntent initWithAppBundleIdentifier:linkAction:linkActionMetadata:]";
    v20 = "%s No VoiceShortcutClient; completing with nil";
LABEL_21:
    _os_log_error_impl(&dword_18BEBC000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25 = 0;
    objc_msgSend(v14, "serializedParametersForLinkAction:actionMetadata:error:", v9, v10, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;
    if (v15)
    {
      v17 = -[INAppIntent initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:](self, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v8, v13, v15);
      self = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_linkAction, a4);
        self = self;
        v18 = self;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v21 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v23 = v21;
        objc_msgSend(v9, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v27 = "-[INAppIntent initWithAppBundleIdentifier:linkAction:linkActionMetadata:]";
        v28 = 2114;
        v29 = v24;
        v30 = 2114;
        v31 = v16;
        _os_log_error_impl(&dword_18BEBC000, v23, OS_LOG_TYPE_ERROR, "%s Unable to get serialized parameters for %{public}@; returning nil. Error: %{public}@",
          buf,
          0x20u);

      }
    }
    v18 = 0;
    goto LABEL_18;
  }
  v19 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[INAppIntent initWithAppBundleIdentifier:linkAction:linkActionMetadata:]";
    v20 = "%s VoiceShortcutClient didn't implement serializedParametersForLinkAction:actionMetadata:error: yet.";
    goto LABEL_21;
  }
LABEL_14:
  v18 = 0;
LABEL_19:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  LNAction *linkAction;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[INAppIntent launchId](self, "launchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppIntent appIntentIdentifier](self, "appIntentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppIntent serializedParameters](self, "serializedParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)objc_msgSend(v4, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v5, v6, v7);

  if (v8)
  {
    linkAction = self->_linkAction;
    if (linkAction)
      objc_storeStrong(v8 + 19, linkAction);
  }
  -[INAppIntent extensionBundleId](self, "extensionBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setExtensionBundleId:", v10);

  return v8;
}

- (int64_t)_indexingHash
{
  int64_t result;
  id v4;
  void *v5;
  id v6;

  result = self->_indexingHash;
  if (!result)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D3E558]);
    -[INAppIntent _dictionaryRepresentation](self, "_dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "combineContentsOfPropertyListObject:", v5);

    self->_indexingHash = objc_msgSend(v4, "finalize");
    return self->_indexingHash;
  }
  return result;
}

- (id)launchId
{
  return self->_launchId;
}

- (void)_setLaunchId:(id)a3
{
  NSString *v4;
  NSString *launchId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  launchId = self->_launchId;
  self->_launchId = v4;

}

- (id)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)_setExtensionBundleId:(id)a3
{
  NSString *v4;
  NSString *extensionBundleId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  extensionBundleId = self->_extensionBundleId;
  self->_extensionBundleId = v4;

}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[INAppIntent launchId](self, "launchId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v4, CFSTR("_launchId"));

  -[INAppIntent extensionBundleId](self, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, CFSTR("_extensionBundleId"));

  -[INAppIntent appIntentIdentifier](self, "appIntentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, CFSTR("appIntentIdentifier"));

  -[INAppIntent serializedParameters](self, "serializedParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, CFSTR("serializedParameters"));

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[INAppIntent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (LNAction)linkAction
{
  LNAction *linkAction;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LNAction *v9;
  id v10;
  LNAction *v11;
  LNAction *v12;
  NSObject *v13;
  LNAction *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  linkAction = self->_linkAction;
  if (linkAction)
    return linkAction;
  -[INAppIntent voiceShortcutClient](self, "voiceShortcutClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v15 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136315138;
    v19 = "-[INAppIntent linkAction]";
    v16 = "%s No VoiceShortcutClient; completing with nil";
LABEL_16:
    _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[INAppIntent launchId](self, "launchId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppIntent appIntentIdentifier](self, "appIntentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppIntent serializedParameters](self, "serializedParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v5, "linkActionWithAppBundleIdentifier:appIntentIdentifier:serializedParameterStates:error:", v6, v7, v8, &v17);
    v9 = (LNAction *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    v11 = self->_linkAction;
    self->_linkAction = v9;

    v12 = self->_linkAction;
    if (!v12)
    {
      v13 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[INAppIntent linkAction]";
        v20 = 2114;
        v21 = v10;
        _os_log_error_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_ERROR, "%s No LinkAction; returning nil. Error: %{public}@",
          buf,
          0x16u);
        v12 = self->_linkAction;
      }
      else
      {
        v12 = 0;
      }
    }
    v14 = v12;

    goto LABEL_13;
  }
  v15 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[INAppIntent linkAction]";
    v16 = "%s VoiceShortcutClient didn't implement linkActionWithAppBundleIdentifier yet.";
    goto LABEL_16;
  }
LABEL_12:
  v14 = 0;
LABEL_13:

  return v14;
}

- (INVCVoiceShortcutClient)voiceShortcutClient
{
  INVCVoiceShortcutClient *voiceShortcutClient;
  INVCVoiceShortcutClient *v4;
  INVCVoiceShortcutClient *v5;

  voiceShortcutClient = self->_voiceShortcutClient;
  if (!voiceShortcutClient)
  {
    _INVCVoiceShortcutClient();
    v4 = (INVCVoiceShortcutClient *)objc_claimAutoreleasedReturnValue();
    v5 = self->_voiceShortcutClient;
    self->_voiceShortcutClient = v4;

    voiceShortcutClient = self->_voiceShortcutClient;
  }
  return voiceShortcutClient;
}

- (id)_nonNilParameters
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INAppIntent serializedParameters](self, "serializedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__INAppIntent__nonNilParameters__block_invoke;
  v7[3] = &unk_1E2295398;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[INAppIntent serializedParameters](self, "serializedParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_className
{
  return self->_appIntentIdentifier;
}

- (id)widgetPlistableRepresentation:(id *)a3
{
  return -[INAppIntent widgetPlistableRepresentationWithParameters:error:](self, "widgetPlistableRepresentationWithParameters:error:", 0, a3);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppIntent launchId](self, "launchId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", v6, CFSTR("launchId"));

  -[INAppIntent extensionBundleId](self, "extensionBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", v7, CFSTR("extensionBundleId"));

  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_appIntentIdentifier, CFSTR("appIntentIdentifier"));
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_serializedParameters, CFSTR("serializedParameters"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[INAppIntent launchId](self, "launchId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("launchId"));

  -[INAppIntent extensionBundleId](self, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("extensionBundleId"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_appIntentIdentifier, CFSTR("appIntentIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serializedParameters, CFSTR("serializedParameters"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_linkAction, CFSTR("linkAction"));

}

- (INAppIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INAppIntent *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  INAppIntent *v20;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleId"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIntentIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("serializedParameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v5)
  {
    v16 = (void *)v22;
    if (v6 && v14)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v17 = (void *)getLNActionClass_softClass;
      v27 = getLNActionClass_softClass;
      if (!getLNActionClass_softClass)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __getLNActionClass_block_invoke;
        v23[3] = &unk_1E22953C0;
        v23[4] = &v24;
        __getLNActionClass_block_invoke((uint64_t)v23);
        v17 = (void *)v25[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v24, 8);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("linkAction"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[INAppIntent initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:](self, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v5, v6, v14);
      self = v20;
      if (v20)
        objc_storeStrong((id *)&v20->_linkAction, v19);
      -[INAppIntent _setExtensionBundleId:](self, "_setExtensionBundleId:", v22);

      v15 = self;
    }
  }
  else
  {
    v16 = (void *)v22;
  }

  return v15;
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
  unint64_t v10;

  -[INAppIntent launchId](self, "launchId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INAppIntent extensionBundleId](self, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[INAppIntent appIntentIdentifier](self, "appIntentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[INAppIntent serializedParameters](self, "serializedParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  INAppIntent *v4;
  INAppIntent *v5;
  INAppIntent *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  void *v32;

  v4 = (INAppIntent *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    -[INAppIntent launchId](self, "launchId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppIntent launchId](v6, "launchId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_33;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[INAppIntent extensionBundleId](self, "extensionBundleId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppIntent extensionBundleId](v6, "extensionBundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_32;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    -[INAppIntent appIntentIdentifier](self, "appIntentIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppIntent appIntentIdentifier](v6, "appIntentIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          v12 = objc_msgSend(v20, "isEqualToString:", v24);

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    -[INAppIntent serializedParameters](self, "serializedParameters", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppIntent serializedParameters](v6, "serializedParameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29)
        LOBYTE(v12) = objc_msgSend(v28, "isEqualToDictionary:", v29);
    }

    v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (void)setVoiceShortcutClient:(id)a3
{
  objc_storeStrong((id *)&self->_voiceShortcutClient, a3);
}

- (NSString)appIntentIdentifier
{
  return self->_appIntentIdentifier;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_appIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_voiceShortcutClient, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_launchId, 0);
}

void __32__INAppIntent__nonNilParameters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  INAppIntent *v9;

  v4 = a3;
  objc_msgSend(v4, "intents_stringForKey:", CFSTR("launchId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_stringForKey:", CFSTR("extensionBundleId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_stringForKey:", CFSTR("appIntentIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_safeObjectForKey:ofType:", CFSTR("serializedParameters"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 && v7 && v8)
  {
    v9 = -[INAppIntent initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:]([INAppIntent alloc], "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v5, v7, v8);
    -[INAppIntent _setExtensionBundleId:](v9, "_setExtensionBundleId:", v6);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
