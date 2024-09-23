@implementation FBSSceneParameters

+ (id)parametersForSpecification:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecification:", v4);

  return v5;
}

- (FBSSceneParameters)initWithSpecification:(id)a3
{
  id v5;
  FBSSceneParameters *v6;
  FBSSceneParameters *v7;
  FBSSceneSettings *v8;
  FBSSceneSettings *settings;
  FBSSceneClientSettings *v10;
  FBSSceneClientSettings *clientSettings;
  void *v13;
  objc_super v14;

  v5 = a3;
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithSpecification:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DD37CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithSpecification:].cold.1();
    goto LABEL_11;
  }

  v14.receiver = self;
  v14.super_class = (Class)FBSSceneParameters;
  v6 = -[FBSSceneParameters init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_specification, a3);
    v8 = (FBSSceneSettings *)objc_alloc_init((Class)objc_msgSend(v5, "settingsClass"));
    settings = v7->_settings;
    v7->_settings = v8;

    v10 = (FBSSceneClientSettings *)objc_alloc_init((Class)objc_msgSend(v5, "clientSettingsClass"));
    clientSettings = v7->_clientSettings;
    v7->_clientSettings = v10;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_clientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeStringToXPCDictionaryWithKey();

  -[FBSSceneParameters settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneSettingsDiff diffFromSettings:toSettings:](FBSSceneSettingsDiff, "diffFromSettings:toSettings:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

  -[FBSSceneParameters clientSettings](self, "clientSettings");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[FBSSceneClientSettingsDiff diffFromSettings:toSettings:](FBSSceneClientSettingsDiff, "diffFromSettings:toSettings:", 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (void)updateSettingsWithBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    -[FBSSceneParameters settings](self, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    v4[2](v4, v6);
    -[FBSSceneParameters setSettings:](self, "setSettings:", v6);

  }
}

- (FBSSceneParameters)initWithXPCDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  Class v7;
  Class v8;
  uint64_t v9;
  void *v10;
  FBSSceneParameters *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot decode parameters without a defined specification class"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithXPCDictionary:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EB930);
  }
  v6 = v5;
  v7 = NSClassFromString(v5);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot decode parameters due to unrealized specification class with name '%@'"), v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithXPCDictionary:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EB98CLL);
  }
  v8 = v7;
  if ((-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot decode parameters due to an invalid specification (does not inherit from FBSSceneSpecification) : %@"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithXPCDictionary:].cold.4();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EB9E8);
  }
  -[objc_class specification](v8, "specification");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot decode parameters without specification instance of '%@'"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithXPCDictionary:].cold.3();
    goto LABEL_19;
  }
  v10 = (void *)v9;
  v11 = -[FBSSceneParameters initWithSpecification:](self, "initWithSpecification:", v9);
  if (v11)
  {
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settingsByApplyingToMutableCopyOfSettings:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneParameters setSettings:](v11, "setSettings:", v14);

    objc_msgSend(v13, "settingsByApplyingToMutableCopyOfSettings:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneParameters setClientSettings:](v11, "setClientSettings:", v15);

  }
  return v11;
}

- (void)setClientSettings:(id)a3
{
  FBSSceneClientSettings *v4;
  FBSSceneClientSettings *v5;
  FBSSceneClientSettings *clientSettings;
  FBSSceneClientSettings *v7;

  v4 = (FBSSceneClientSettings *)a3;
  if (self->_clientSettings != v4)
  {
    v7 = v4;
    if (v4)
      v5 = (FBSSceneClientSettings *)-[FBSSceneClientSettings copy](v4, "copy");
    else
      v5 = (FBSSceneClientSettings *)objc_alloc_init(-[FBSSceneSpecification clientSettingsClass](self->_specification, "clientSettingsClass"));
    clientSettings = self->_clientSettings;
    self->_clientSettings = v5;

    v4 = v7;
  }

}

- (FBSSceneParameters)initWithParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  FBSSceneParameters *v7;
  FBSSceneParameters *v8;
  void *v9;
  uint64_t v10;
  FBSSceneSettings *settings;
  void *v12;
  uint64_t v13;
  FBSSceneClientSettings *clientSettings;
  void *v16;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "specification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithParameters:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EBC18);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneParameters initWithParameters:].cold.1();
    goto LABEL_11;
  }

  v17.receiver = self;
  v17.super_class = (Class)FBSSceneParameters;
  v7 = -[FBSSceneParameters init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_specification, v5);
    objc_msgSend(v4, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    settings = v8->_settings;
    v8->_settings = (FBSSceneSettings *)v10;

    objc_msgSend(v4, "clientSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    clientSettings = v8->_clientSettings;
    v8->_clientSettings = (FBSSceneClientSettings *)v13;

  }
  return v8;
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (FBSSceneClientSettings)clientSettings
{
  return self->_clientSettings;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  FBSSceneSettings *v4;
  FBSSceneSettings *v5;
  FBSSceneSettings *settings;
  FBSSceneSettings *v7;

  v4 = (FBSSceneSettings *)a3;
  if (self->_settings != v4)
  {
    v7 = v4;
    if (v4)
      v5 = (FBSSceneSettings *)-[FBSSceneSettings copy](v4, "copy");
    else
      v5 = (FBSSceneSettings *)objc_alloc_init(-[FBSSceneSpecification settingsClass](self->_specification, "settingsClass"));
    settings = self->_settings;
    self->_settings = v5;

    v4 = v7;
  }

}

- (FBSSceneParameters)init
{
  void *v3;
  FBSSceneParameters *v4;

  +[FBSSceneSpecification specification](FBSSceneSpecification, "specification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FBSSceneParameters initWithSpecification:](self, "initWithSpecification:", v3);

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSceneParameters initWithParameters:](+[FBSMutableSceneParameters allocWithZone:](FBSMutableSceneParameters, "allocWithZone:", a3), "initWithParameters:", self);
}

- (NSString)description
{
  return (NSString *)-[FBSSceneParameters descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  FBSSceneParameters *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FBSSceneParameters *v8;
  id v9;
  void *v10;
  FBSSceneParameters *v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[4];
  FBSSceneParameters *v18;
  _QWORD v19[4];
  FBSSceneParameters *v20;
  _QWORD v21[4];
  FBSSceneParameters *v22;

  v4 = (FBSSceneParameters *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneParameters specification](self, "specification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __30__FBSSceneParameters_isEqual___block_invoke;
    v21[3] = &unk_1E38EBB48;
    v8 = v4;
    v22 = v8;
    v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v21);

    -[FBSSceneParameters settings](self, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __30__FBSSceneParameters_isEqual___block_invoke_2;
    v19[3] = &unk_1E38EBB48;
    v11 = v8;
    v20 = v11;
    v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v19);

    -[FBSSceneParameters clientSettings](self, "clientSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __30__FBSSceneParameters_isEqual___block_invoke_3;
    v17[3] = &unk_1E38EBB48;
    v18 = v11;
    v14 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v17);

    v15 = objc_msgSend(v5, "isEqual");
  }

  return v15;
}

uint64_t __30__FBSSceneParameters_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "specification");
}

uint64_t __30__FBSSceneParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "settings");
}

uint64_t __30__FBSSceneParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientSettings");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(off_1E38E9E08, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneParameters specification](self, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneParameters succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[FBSSceneParameters descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  FBSSceneParameters *v11;

  v4 = a3;
  -[FBSSceneParameters succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FBSSceneParameters_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __60__FBSSceneParameters_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("settings"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("clientSettings"), 1);
}

- (void)initWithSpecification:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithParameters:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
