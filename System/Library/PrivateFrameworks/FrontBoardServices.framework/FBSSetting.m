@implementation FBSSetting

- (uint64_t)name
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (void)setSpecialCollection:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(_QWORD *)(a1 + 88) = a2;
    os_unfair_lock_unlock(v4);
  }
}

- (os_unfair_lock_s)specialCollection
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[22]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

+ (id)settingWithName:(uint64_t)a3 settingsClass:(void *)a4 extension:(char)a5 local:(char)a6 type:(uint64_t)a7 legacySetting:(void *)a8 expectedClass:
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;

  v14 = a2;
  objc_opt_self();
  if ((objc_msgSend(a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a valid FBSSettingsExtension"), a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:].cold.3();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A703A5CLL);
  }
  v15 = v14;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A703AC0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:].cold.1();
    goto LABEL_15;
  }

  NSStringFromClass((Class)a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a4, "isSubclassOfClass:", objc_opt_class()))
  {

    v16 = 0;
  }
  v17 = objc_opt_new();
  *(_QWORD *)(v17 + 16) = a3;
  *(_DWORD *)(v17 + 8) = 0;
  v18 = objc_msgSend(v15, "copy");
  v19 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v18;

  v20 = MEMORY[0x19AEC9C88](v15);
  *(_BYTE *)(v17 + 26) = a7 != 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(v17 + 48) = v20;
  *(_QWORD *)(v17 + 56) = a7;
  objc_storeStrong((id *)(v17 + 64), a4);
  v21 = objc_msgSend(v16, "copy");
  v22 = *(void **)(v17 + 72);
  *(_QWORD *)(v17 + 72) = v21;

  *(_BYTE *)(v17 + 25) = a5;
  *(_BYTE *)(v17 + 27) = a6;
  objc_storeStrong((id *)(v17 + 80), a8);
  *(_QWORD *)(v17 + 88) = 0x7FFFFFFFFFFFFFFFLL;
  *(_BYTE *)(v17 + 28) = objc_msgSend(a8, "isSubclassOfClass:", objc_opt_class());

  return (id)v17;
}

- (_BYTE)isRedacted
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "_finishInitializing");
    return (_BYTE *)(v1[29] != 0);
  }
  return result;
}

- (_QWORD)descriptionProvider
{
  _QWORD *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "_finishInitializing");
    a1 = (_QWORD *)MEMORY[0x19AECA324](v1[13]);
  }
  return a1;
}

- (_QWORD)defaultValue
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "_finishInitializing");
    v2 = (void *)v1[12];
    if (v2 == (void *)*MEMORY[0x1E0C9B0D0])
      v2 = 0;
    a1 = v2;
  }
  return a1;
}

- (_BYTE)isNullPreserving
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "_finishInitializing");
    return (_BYTE *)(v1[32] != 0);
  }
  return result;
}

- (_BYTE)isVolatile
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "_finishInitializing");
    return (_BYTE *)(v1[30] != 0);
  }
  return result;
}

- (BOOL)indirect_isLegacy
{
  return self->_legacy;
}

- (BOOL)indirect_isPropagating
{
  FBSSetting *v2;

  if (self)
  {
    v2 = self;
    -[FBSSetting _finishInitializing](self, "_finishInitializing");
    LOBYTE(self) = v2->_propagating;
  }
  return (char)self;
}

- (unint64_t)indirect_legacySetting
{
  return self->_legacySetting;
}

- (id)indirect_name
{
  return self->_name;
}

- (void)_finishInitializing
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_initialized)
  {
    -[objc_class configureSetting:](self->_extension, "configureSetting:", self);
    self->_lock_initialized = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  FBSSetting *v4;
  FBSSetting *v5;
  char v6;

  v4 = (FBSSetting *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_14;
  }
  if (self->_type == v4->_type
    && self->_setting == v4->_setting
    && self->_legacySetting == v4->_legacySetting
    && self->_expectedClass == v4->_expectedClass
    && self->_settingsClass == v4->_settingsClass
    && BSEqualBools()
    && BSEqualBools()
    && BSEqualStrings())
  {
    v6 = BSEqualStrings();
  }
  else
  {
LABEL_12:
    v6 = 0;
  }
LABEL_14:

  return v6;
}

- (NSString)description
{
  objc_class *expectedClass;
  void *v4;
  const __CFString *extensionID;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  expectedClass = self->_expectedClass;
  if (expectedClass)
    NSStringFromClass(expectedClass);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  extensionID = (const __CFString *)self->_extensionID;
  if (!extensionID)
    extensionID = CFSTR("<FBSCore>");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<FBSSetting: %p; \"%@\" (%@) %@"),
    self,
    self->_name,
    v4,
    extensionID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_local)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("; local"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (self->_legacy)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("; legacy (%lu)"), self->_legacySetting);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(">"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)matchesProperty:(SEL)a3
{
  FBSSetting *v3;
  FBSSetting *v4;

  v3 = self;
  FBSSettingForSelector(self->_settingsClass, a3);
  v4 = (FBSSetting *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v4 == v3;

  return (char)v3;
}

- (BOOL)matchesPropertyName:(id)a3
{
  return -[NSString isEqualToString:](self->_name, "isEqualToString:", a3);
}

- (void)setPrivacySensitive:(BOOL)a3
{
  void *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_initialized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSetting setPrivacySensitive:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_redacted = a3;
  }
}

- (void)setDescriptionProvider:(id)a3
{
  void *v4;
  id descriptionProvider;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_initialized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSetting setDescriptionProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v4 = (void *)objc_msgSend(v7, "copy");
    descriptionProvider = self->_descriptionProvider;
    self->_descriptionProvider = v4;

  }
}

- (void)setDefaultValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_initialized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSetting setDefaultValue:].cold.2();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A70413CLL);
  }
  if ((id)*MEMORY[0x1E0C9B0D0] == v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSNull as a default value is reserved"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSetting setDefaultValue:].cold.1();
    goto LABEL_12;
  }
  if (v6)
    v4 = v6;
  else
    v4 = (void *)*MEMORY[0x1E0C9B0D0];
  objc_storeStrong(&self->_defaultValue, v4);

}

- (void)setPropagating:(BOOL)a3
{
  void *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_initialized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSetting setPropagating:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_propagating = a3;
  }
}

- (void)setNullPreserving:(BOOL)a3
{
  void *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_initialized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSetting setNullPreserving:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_nullPreserving = a3;
  }
}

- (void)setVolatile:(BOOL)a3
{
  void *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_initialized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSetting setVolatile:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_volatile = a3;
  }
}

- (uint64_t)setting
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)legacySetting
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)extension
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)extensionID
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (BOOL)isLocal
{
  if (result)
    return *(_BYTE *)(result + 25) != 0;
  return result;
}

- (BOOL)isLegacy
{
  if (result)
    return *(_BYTE *)(result + 26) != 0;
  return result;
}

- (uint64_t)type
{
  if (a1)
    return *(char *)(a1 + 27);
  else
    return 0;
}

- (uint64_t)expectedClass
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (BOOL)isBSSettings
{
  if (result)
    return *(_BYTE *)(result + 28) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptionProvider, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_expectedClass, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:.cold.1()
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

+ (void)settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:.cold.3()
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

- (void)setPrivacySensitive:.cold.1()
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

- (void)setDescriptionProvider:.cold.1()
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

- (void)setDefaultValue:.cold.1()
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

- (void)setDefaultValue:.cold.2()
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

- (void)setPropagating:.cold.1()
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

- (void)setNullPreserving:.cold.1()
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

- (void)setVolatile:.cold.1()
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
