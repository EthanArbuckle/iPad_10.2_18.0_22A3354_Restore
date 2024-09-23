@implementation FBSSettingsExtension

+ (id)valueForUndefinedSetting:(id)a3
{
  return 0;
}

+ (Class)extensionForProtocol:(id)a3
{
  Protocol *v3;
  void *v4;
  Protocol *v5;
  void *v6;
  void *v7;
  Protocol *v8;
  void *v9;
  Protocol *v10;
  objc_class *v11;
  void *v13;

  v3 = (Protocol *)a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("protocol"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSettingsExtension extensionForProtocol:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F1A40);
  }
  v5 = v3;
  NSStringFromProtocol(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = v5;
  v9 = (void *)BSObjCClassCreate();
  objc_msgSend(v9, "protocol");
  v10 = (Protocol *)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("return value is incorrect"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSettingsExtension extensionForProtocol:].cold.2();
    goto LABEL_9;
  }
  v11 = v9;

  return v11;
}

void __45__FBSSettingsExtension_extensionForProtocol___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (*v4)(void);
  objc_class *Class;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__FBSSettingsExtension_extensionForProtocol___block_invoke_2;
  v6[3] = &unk_1E38EAEC8;
  v7 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x19AECA324](v6);
  v4 = imp_implementationWithBlock(v3);

  Class = object_getClass(a2);
  class_addMethod(Class, sel_protocol, v4, "@@:");

}

+ (id)alloc
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not intended to be instantiated"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("FBSSceneExtension.m");
    v19 = 1024;
    v20 = 63;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id __45__FBSSettingsExtension_extensionForProtocol___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (Class)extensionForBSObjCProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("protocol"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSettingsExtension extensionForBSObjCProtocol:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6FEBD4);
  }
  v6 = v4;
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@>"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((id)objc_opt_class() != a1)
    objc_opt_class();
  v9 = v6;
  v10 = (void *)BSObjCClassCreate();
  objc_msgSend(v10, "BSObjCProtocol");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("return value is incorrect"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSettingsExtension extensionForBSObjCProtocol:].cold.2();
    goto LABEL_11;
  }
  v12 = v10;

  return v12;
}

void __51__FBSSettingsExtension_extensionForBSObjCProtocol___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (*v4)(void);
  objc_class *Class;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__FBSSettingsExtension_extensionForBSObjCProtocol___block_invoke_2;
  v6[3] = &unk_1E38EAF18;
  v7 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x19AECA324](v6);
  v4 = imp_implementationWithBlock(v3);

  Class = object_getClass(a2);
  class_addMethod(Class, sel_BSObjCProtocol, v4, "@@:");

}

id __51__FBSSettingsExtension_extensionForBSObjCProtocol___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)protocol
{
  return 0;
}

+ (id)BSObjCProtocol
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "protocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(off_1E38E9E50, "protocolForProtocol:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)isPrivacySensitiveSetting:(id)a3
{
  return 0;
}

+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4
{
  return 0;
}

+ (BOOL)propagateSetting:(id)a3
{
  return 0;
}

+ (void)configureSetting:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setPrivacySensitive:", objc_msgSend(a1, "isPrivacySensitiveSetting:", v5));
  objc_msgSend(a1, "valueForUndefinedSetting:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultValue:", v4);

  objc_msgSend(v5, "setPropagating:", objc_msgSend(a1, "propagateSetting:", v5));
}

+ (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  id v10;
  NSString *v11;
  NSString *v12;
  SEL v13;
  SEL v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;

  v10 = a5;
  objc_msgSend(a3, "keyForSetting:", a6);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_8;
  v13 = NSSelectorFromString(v11);
  if (!v13)
    goto LABEL_8;
  v14 = v13;
  v15 = (void *)objc_opt_class();
  FBSSettingForExtensionSelector(v15, v14);
  v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v16
    || (v17 = (void *)objc_opt_class(),
        FBSSettingForExtensionSelector(v17, v14),
        (v16 = (_QWORD *)objc_claimAutoreleasedReturnValue()) != 0)
    || (v18 = (void *)objc_opt_class(),
        FBSSettingForExtensionSelector(v18, v14),
        (v16 = (_QWORD *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((-[FBSSetting isRedacted](v16) & 1) != 0)
    {
      v19 = CFSTR("<redacted>");
    }
    else
    {
      if (a4 != 0x7FFFFFFFFFFFFFFFLL && !v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BSSettingFlagIsYes());
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[FBSSetting descriptionProvider](v16);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (!v20
        || ((*(void (**)(uint64_t, id))(v20 + 16))(v20, v10),
            (v19 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(a1, "descriptionOfValue:forSetting:", v10, v16);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
LABEL_8:
    v19 = 0;
  }

  return v19;
}

+ (void)extensionForProtocol:.cold.1()
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

+ (void)extensionForProtocol:.cold.2()
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

+ (void)extensionForBSObjCProtocol:.cold.1()
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

+ (void)extensionForBSObjCProtocol:.cold.2()
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
