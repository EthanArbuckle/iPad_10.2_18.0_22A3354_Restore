@implementation FBSSceneMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (id)_initWithPayload:(id)a3
{
  id v5;
  FBSSceneMessage *v6;
  BSMutableKeyedSettings *v7;
  BSMutableKeyedSettings *payload;
  id result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5 && (NSClassFromString(CFSTR("BSKeyedSettings")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSKeyedSettingsClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneMessage _initWithPayload:].cold.1(a2, (uint64_t)self, (uint64_t)v10);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v11.receiver = self;
    v11.super_class = (Class)FBSSceneMessage;
    v6 = -[FBSSceneMessage init](&v11, sel_init);
    if (v6)
    {
      if (v5)
        v7 = (BSMutableKeyedSettings *)objc_msgSend(v5, "mutableCopy");
      else
        v7 = (BSMutableKeyedSettings *)objc_alloc_init((Class)off_1E38E9E28);
      payload = v6->_payload;
      v6->_payload = v7;

    }
    return v6;
  }
  return result;
}

- (FBSSceneMessage)init
{
  return (FBSSceneMessage *)-[FBSSceneMessage _initWithPayload:](self, "_initWithPayload:", 0);
}

+ (id)message
{
  return objc_alloc_init((Class)a1);
}

- (NSString)description
{
  return (NSString *)-[FBSSceneMessage descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[FBSSceneMessage payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithPayload:", v5);

  return v6;
}

- (FBSSceneMessage)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSSceneMessage *v5;
  uint64_t v6;
  BSMutableKeyedSettings *payload;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSSceneMessage;
  v5 = -[FBSSceneMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    payload = v5->_payload;
    v5->_payload = (BSMutableKeyedSettings *)v6;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneMessage succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[FBSSceneMessage descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSSceneMessage *v11;

  v4 = a3;
  -[FBSSceneMessage succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__FBSSceneMessage_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __57__FBSSceneMessage_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "payload");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", v3, CFSTR("payload"), 0);

}

- (BSMutableKeyedSettings)payload
{
  return self->_payload;
}

- (void)_initWithPayload:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSSceneMessage.m");
  v16 = 1024;
  v17 = 26;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
