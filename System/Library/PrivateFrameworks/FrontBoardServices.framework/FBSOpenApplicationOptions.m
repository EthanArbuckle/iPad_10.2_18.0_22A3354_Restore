@implementation FBSOpenApplicationOptions

- (NSDictionary)dictionary
{
  return &self->_payload->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return (NSURL *)-[NSMutableDictionary bs_safeObjectForKey:ofType:](self->_payload, "bs_safeObjectForKey:ofType:", CFSTR("__PayloadURL"), objc_opt_class());
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  -[FBSOpenApplicationOptions encodeWithXPCDictionary:](self, "encodeWithXPCDictionary:", v5);
  objc_msgSend(v4, "encodeXPCObject:forKey:", v5, CFSTR("bsxpccoded"));

}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  v5 = (void *)-[NSMutableDictionary mutableCopy](self->_payload, "mutableCopy");
  objc_msgSend(v5, "objectForKey:", CFSTR("__Actions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("__Actions"));
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "bs_array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("__AppLink4LS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("__AppLink4LS"));
  if (v8)
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  objc_msgSend(v5, "objectForKey:", CFSTR("__ClickAttribution"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("__ClickAttribution"));
    objc_msgSend(CFSTR("__ClickAttribution"), "UTF8String");
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("__PasteSharingToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("__PasteSharingToken"));
    objc_msgSend(CFSTR("__PasteSharingToken"), "UTF8String");
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  }
  if (objc_msgSend(v5, "count"))
  {
    BSSerializeCFValueToXPCDictionaryWithKey();
    xpc_dictionary_get_value(v4, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      FBLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FBSOpenApplicationOptions encodeWithXPCDictionary:].cold.1(v5, v12);

    }
  }

}

- (FBSOpenApplicationOptions)initWithBSXPCCoder:(id)a3
{
  void *v4;
  FBSOpenApplicationOptions *v5;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("bsxpccoded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBSOpenApplicationOptions initWithXPCDictionary:](self, "initWithXPCDictionary:", v4);

  return v5;
}

+ (id)optionsWithDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setDictionary:", v4);

  return v5;
}

- (void)_sanitizeAndValidatePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKey:](self->_payload, "objectForKey:", CFSTR("__ActivateForEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("__BGContentFetching"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("__ActivateSuspended"));
  }
  if ((MEMORY[0x19AEC9EB0]("-[FBSOpenApplicationOptions _sanitizeAndValidatePayload]") & 1) == 0)
    -[NSMutableDictionary removeObjectForKey:](self->_payload, "removeObjectForKey:", CFSTR("__FromLaunchApp"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](self->_payload, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          -[NSMutableDictionary removeObjectForKey:](self->_payload, "removeObjectForKey:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (FBSOpenApplicationOptions)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSOpenApplicationOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[FBSOpenApplicationOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeCFValueFromXPCDictionaryWithKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);

    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("__Actions"));
    NSClassFromString(CFSTR("LSAppLink"));
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("__AppLink4LS"));
    NSClassFromString(CFSTR("UISClickAttribution"));
    objc_msgSend(CFSTR("__ClickAttribution"), "UTF8String");
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("__ClickAttribution"));
    NSClassFromString(CFSTR("UISPasteSharingToken"));
    objc_msgSend(CFSTR("__PasteSharingToken"), "UTF8String");
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("__PasteSharingToken"));
    -[FBSOpenApplicationOptions setDictionary:](v5, "setDictionary:", v6);

  }
  return v5;
}

- (void)setDictionary:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *payload;

  if (self->_payload != a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    payload = self->_payload;
    self->_payload = v4;

    -[FBSOpenApplicationOptions _sanitizeAndValidatePayload](self, "_sanitizeAndValidatePayload");
  }
}

- (NSSet)actions
{
  void *v2;
  void *v3;

  -[NSMutableDictionary bs_safeObjectForKey:ofType:](self->_payload, "bs_safeObjectForKey:ofType:", CFSTR("__Actions"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSString)description
{
  return (NSString *)-[FBSOpenApplicationOptions descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSOpenApplicationOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSOpenApplicationOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FBSOpenApplicationOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_payload, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__FBSOpenApplicationOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
    v7[3] = &unk_1E38EAE08;
    v7[4] = self;
    v8 = v5;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  }
  return v5;
}

void __67__FBSOpenApplicationOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__FBSOpenApplicationOptions_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E38EC068;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __67__FBSOpenApplicationOptions_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isNSDictionary"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "activeMultilinePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v5, v11, v7, 0);
  }
  else
  {
    v8 = objc_msgSend(v5, "isNSArray");
    v9 = *(void **)(a1 + 32);
    if (!v8)
    {
      v10 = (id)objc_msgSend(v9, "appendObject:withName:", v5, v11);
      goto LABEL_7;
    }
    objc_msgSend(v9, "activeMultilinePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v5, v11, v7, 1);
  }

LABEL_7:
}

- (void)_updateOption:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *payload;

  payload = self->_payload;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](payload, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](payload, "removeObjectForKey:", a4);
}

- (void)encodeWithXPCDictionary:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "Error encoding options dictionary; one or more of these keys failed to encode: %{public}@",
    (uint8_t *)&v4,
    0xCu);

}

@end
