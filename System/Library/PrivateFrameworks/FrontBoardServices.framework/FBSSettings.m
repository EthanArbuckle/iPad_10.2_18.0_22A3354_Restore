@implementation FBSSettings

- (id)_legacyOtherSettings
{
  if (a1)
  {
    -[FBSSettings _legacyOtherSettings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)_legacyOtherSettings:(id *)a1
{
  id *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;

  if (a1)
  {
    v2 = a1;
    if (*((_BYTE *)a1 + 64))
      v3 = a2 == 0;
    else
      v3 = 1;
    if (v3)
      goto LABEL_12;
    if (a1[5])
    {
      if (!*((_BYTE *)a1 + 65))
        goto LABEL_12;
      v4 = objc_opt_class();
      if (v4 != objc_opt_class())
        goto LABEL_12;
      v5 = objc_msgSend(v2[5], "mutableCopy");
    }
    else
    {
      v5 = objc_opt_new();
    }
    v6 = v2[5];
    v2[5] = (id)v5;

    v7 = v2[5];
    objc_msgSend((id)objc_opt_class(), "_legacyDescriptionProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDescriptionProvider:", v8);

LABEL_12:
    a1 = (id *)v2[5];
  }
  return a1;
}

- (id)valueForProperty:(SEL)a3 expectedClass:(Class)a4
{
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id result;
  void *v16;

  if (a4)
  {
    FBSSettingForExtensionSelector(self->_baseClass, a3);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[FBSSettings _valueForSetting:]((uint64_t)self, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        -[FBSSetting defaultValue](v6);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v9;

    }
    else
    {
      FBLogSceneExtension();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FBSSettings(FBSSceneExtension) valueForProperty:expectedClass:].cold.2(a3);

      v11 = 0;
    }
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("clazz != ((void *)0)"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings(FBSSceneExtension) valueForProperty:expectedClass:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_rootSettingsForLocal:(int)a3 createIfNeeded:
{
  if (a1)
  {
    if ((a2 & 1) != 0)
      -[FBSSettings _localSettings:](a1, a3);
    else
      -[FBSSettings _settings:](a1, a3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_settings:(id *)a1
{
  id *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  if (a1)
  {
    v2 = a1;
    if (*((_BYTE *)a1 + 64))
      v3 = a2 == 0;
    else
      v3 = 1;
    if (v3)
      goto LABEL_12;
    if (a1[2])
    {
      if (!*((_BYTE *)a1 + 65))
        goto LABEL_12;
      v4 = objc_opt_class();
      if (v4 != objc_opt_class())
        goto LABEL_12;
      v5 = objc_msgSend(v2[2], "mutableCopy");
      v6 = v2[2];
      v2[2] = (id)v5;
    }
    else
    {
      v7 = objc_opt_new();
      v8 = v2[2];
      v2[2] = (id)v7;

      v9 = v2[2];
      objc_msgSend((id)objc_opt_class(), "_descriptionProvider");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDescriptionProvider:", v6);
    }

LABEL_12:
    a1 = (id *)v2[2];
  }
  return a1;
}

- (id)_valueForSetting:(uint64_t)a1
{
  void *v2;

  if (!a1)
    goto LABEL_4;
  -[FBSSettings _underlyingValueForSetting:](a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("<explicitly nil>"), "isEqual:", v2))
  {

LABEL_4:
    v2 = 0;
  }
  return v2;
}

- (void)setValue:(id)a3 forProperty:(SEL)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  FBSSettingForExtensionSelector(self->_baseClass, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FBSSettings _setValue:forSetting:]((uint64_t)self, v6, v7);
  }
  else
  {
    FBLogSceneExtension();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBSSettings(FBSSceneExtension) valueForProperty:expectedClass:].cold.2(a4);

  }
}

- (void)_setValue:(void *)a3 forSetting:
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (!a1)
    goto LABEL_10;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("setting != ((void *)0)"), v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _setValue:forSetting:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6D6A30);
  }
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this class is not mutable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _setValue:forSetting:].cold.2();
    goto LABEL_16;
  }
  v7 = -[FBSSetting isLocal]((_BOOL8)v5);
  -[FBSSetting extensionID]((uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _rootSettingsForLocal:createIfNeeded:]((id *)a1, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[FBSSettings _subSettingsForKey:local:createIfNeeded:](a1, v8, v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSettings _setValue:forSetting:inSettings:](a1, v12, v6, v10);
    if (BSSettingsIsEmpty())
      objc_msgSend(v9, "setObject:forKey:", 0, v8);

  }
  else
  {
    -[FBSSettings _setValue:forSetting:inSettings:](a1, v12, v6, v9);
  }

LABEL_10:
}

- (void)_setValue:(void *)a3 forSetting:(void *)a4 inSettings:
{
  id v7;
  _QWORD *v8;
  void *v9;
  __CFString *v10;
  unsigned __int8 v11;
  int v12;
  const __CFString *v13;
  void *v14;
  uint64_t v16;
  __CFString *v17;

  v17 = a2;
  v7 = a4;
  if (a1)
  {
    v8 = a3;
    objc_msgSend(v7, "setDescriptionProvider:", -[FBSSetting extension]((uint64_t)v8));
    -[FBSSetting name]((uint64_t)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSetting defaultValue](v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v11 = -[FBSSetting isNullPreserving](v8);

    if (v17 && (v12 = -[__CFString isEqual:](v17, "isEqual:", v10), v13 = v17, !v12))
    {
      if ((__CFString *)*MEMORY[0x1E0C9AE50] == v17 || *MEMORY[0x1E0C9AE40] == (_QWORD)v17)
      {
        if ((v11 & 1) != 0)
        {
          v16 = BSSettingFlagForBool();
        }
        else if ((__CFString *)*MEMORY[0x1E0C9AE50] == v17)
        {
          v16 = 1;
        }
        else
        {
          v16 = 0x7FFFFFFFFFFFFFFFLL;
        }
        objc_msgSend(v7, "setFlag:forKey:", v16, v9);
        objc_msgSend(v7, "setObject:forKey:", 0, v9);
        goto LABEL_18;
      }
    }
    else
    {
      if ((v11 & 1) == 0)
      {
        v14 = v7;
        v13 = 0;
LABEL_17:
        objc_msgSend(v14, "setObject:forKey:", v13, v9);
        objc_msgSend(v7, "setFlag:forKey:", 0x7FFFFFFFFFFFFFFFLL, v9);
LABEL_18:

        goto LABEL_19;
      }
      if (v10)
        v13 = v10;
      else
        v13 = CFSTR("<explicitly nil>");
    }
    v14 = v7;
    goto LABEL_17;
  }
LABEL_19:

}

- (FBSSettings)initWithSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  FBSSettings *v9;
  FBSSettings *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BSKeyedSettings *settings;
  uint64_t v16;
  BSKeyedSettings *localSettings;
  uint64_t v18;
  BSSettings *legacyOtherSettings;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BSKeyedSettings *v23;
  void *v24;
  uint64_t v25;
  BSKeyedSettings *v26;
  void *v27;
  uint64_t v28;
  BSSettings *v29;
  void *v30;
  BSSettings *legacyLocalSettings;
  BSSettings *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "_baseClass");
  if (v5 == (void *)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("abstract superclass should not be instantiated"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings initWithSettings:].cold.1();
LABEL_36:
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6D8F40);
  }
  v8 = (objc_class *)v7;
  if (v4 && v7 != *((_QWORD *)v4 + 1))
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass((Class)v5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%@ cannot init with %@"), v37, v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings initWithSettings:].cold.2();
    goto LABEL_36;
  }
  v38.receiver = self;
  v38.super_class = (Class)FBSSettings;
  v9 = -[FBSSettings init](&v38, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_baseClass = v8;
    objc_msgSend(v5, "_mutableClass");
    v10->_mutable = objc_opt_isKindOfClass() & 1;
    objc_msgSend(v4, "_progenitor");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v4;
    objc_storeWeak((id *)&v10->_progenitor, v13);

    if (v4)
    {
      if (v10->_mutable && *((_BYTE *)v4 + 64))
      {
        v14 = objc_msgSend(*((id *)v4 + 2), "mutableCopy");
        settings = v10->_settings;
        v10->_settings = (BSKeyedSettings *)v14;

        v16 = objc_msgSend(*((id *)v4 + 3), "mutableCopy");
        localSettings = v10->_localSettings;
        v10->_localSettings = (BSKeyedSettings *)v16;

        v18 = objc_msgSend(*((id *)v4 + 5), "mutableCopy");
        legacyOtherSettings = v10->_legacyOtherSettings;
        v10->_legacyOtherSettings = (BSSettings *)v18;

        v20 = objc_msgSend(*((id *)v4 + 4), "mutableCopy");
      }
      else
      {
        v10->_needsCoW = v10->_mutable;
        if ((BSSettingsIsEmpty() & 1) != 0)
          v21 = 0;
        else
          v21 = (void *)*((_QWORD *)v4 + 2);
        v22 = objc_msgSend(v21, "copy");
        v23 = v10->_settings;
        v10->_settings = (BSKeyedSettings *)v22;

        if ((BSSettingsIsEmpty() & 1) != 0)
          v24 = 0;
        else
          v24 = (void *)*((_QWORD *)v4 + 3);
        v25 = objc_msgSend(v24, "copy");
        v26 = v10->_localSettings;
        v10->_localSettings = (BSKeyedSettings *)v25;

        if ((BSSettingsIsEmpty() & 1) != 0)
          v27 = 0;
        else
          v27 = (void *)*((_QWORD *)v4 + 5);
        v28 = objc_msgSend(v27, "copy");
        v29 = v10->_legacyOtherSettings;
        v10->_legacyOtherSettings = (BSSettings *)v28;

        if ((BSSettingsIsEmpty() & 1) != 0)
          v30 = 0;
        else
          v30 = (void *)*((_QWORD *)v4 + 4);
        v20 = objc_msgSend(v30, "copy");
      }
      legacyLocalSettings = v10->_legacyLocalSettings;
      v10->_legacyLocalSettings = (BSSettings *)v20;

      if ((BSEqualBools() & 1) == 0 && !objc_msgSend(v5, "_counterpartClass"))
        objc_msgSend(v5, "_setCounterpartClass:", objc_opt_class());
      v32 = v10->_legacyOtherSettings;
      objc_msgSend(v5, "_legacyDescriptionProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSSettings setDescriptionProvider:](v32, "setDescriptionProvider:", v33);

    }
    FBSRealizeSubclassExtension((objc_class *)v5);
  }

  return v10;
}

+ (id)_legacyDescriptionProvider
{
  return objc_getAssociatedObject(a1, (const void *)_FBSLegacyDescriptionProviderKey);
}

- (id)_progenitor
{
  return objc_loadWeakRetained((id *)&self->_progenitor);
}

- (id)_localSettings:(id *)a1
{
  id *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  if (a1)
  {
    v2 = a1;
    if (*((_BYTE *)a1 + 64))
      v3 = a2 == 0;
    else
      v3 = 1;
    if (v3)
      goto LABEL_12;
    if (a1[3])
    {
      if (!*((_BYTE *)a1 + 65))
        goto LABEL_12;
      v4 = objc_opt_class();
      if (v4 != objc_opt_class())
        goto LABEL_12;
      v5 = objc_msgSend(v2[3], "mutableCopy");
      v6 = v2[3];
      v2[3] = (id)v5;
    }
    else
    {
      v7 = objc_opt_new();
      v8 = v2[3];
      v2[3] = (id)v7;

      v9 = v2[3];
      objc_msgSend((id)objc_opt_class(), "_descriptionProvider");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDescriptionProvider:", v6);
    }

LABEL_12:
    a1 = (id *)v2[3];
  }
  return a1;
}

+ (Class)_counterpartClass
{
  return (Class)objc_getAssociatedObject(a1, (const void *)_FBSCounterpartKey);
}

- (id)_legacyLocalSettings:(id *)a1
{
  id *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (a1)
  {
    v2 = a1;
    if (*((_BYTE *)a1 + 64))
      v3 = a2 == 0;
    else
      v3 = 1;
    if (v3)
      goto LABEL_12;
    if (a1[4])
    {
      if (!*((_BYTE *)a1 + 65))
        goto LABEL_12;
      v4 = objc_opt_class();
      if (v4 != objc_opt_class())
        goto LABEL_12;
      v5 = objc_msgSend(v2[4], "mutableCopy");
    }
    else
    {
      v5 = objc_opt_new();
    }
    v6 = v2[4];
    v2[4] = (id)v5;

LABEL_12:
    a1 = (id *)v2[4];
  }
  return a1;
}

+ (id)_descriptionProvider
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_baseClass"), "subclassExtension");
}

+ (void)_setCounterpartClass:(Class)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[6];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("counterpart"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSettings _setCounterpartClass:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6D9C74);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FBSSettings__setCounterpartClass___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (_setCounterpartClass__onceToken != -1)
    dispatch_once(&_setCounterpartClass__onceToken, block);
  os_unfair_lock_lock((os_unfair_lock_t)&_setCounterpartClass__lock);
  objc_getAssociatedObject(a1, (const void *)_FBSCounterpartKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
      || objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()))
    {
      class_getMethodImplementation((Class)a1, sel_copyWithZone_);
      v6 = dyld_image_header_containing_address();
      v7 = a3;
    }
    else
    {
      class_getMethodImplementation(a3, sel_copyWithZone_);
      v6 = dyld_image_header_containing_address();
      v7 = (objc_class *)a1;
    }
    class_getMethodImplementation(v7, sel_mutableCopyWithZone_);
    v8 = dyld_image_header_containing_address();
    v9 = v8;
    if (v8 && v8 != _setCounterpartClass__fbsAddress && v8 == v6)
    {
      FBLogSceneExtension();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass((Class)a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v11;
        v24 = 2114;
        v25 = v12;
        _os_log_impl(&dword_19A6D4000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ setting counterpart class: %{public}@", buf, 0x16u);

      }
      objc_setAssociatedObject(a1, (const void *)_FBSCounterpartKey, a3, 0);
      objc_setAssociatedObject(a3, (const void *)_FBSCounterpartKey, a1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", dyld_image_path_containing_address());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", dyld_image_path_containing_address());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      FBLogSceneExtension();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass((Class)a1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v23 = v18;
        v24 = 2114;
        v25 = v19;
        v26 = 2114;
        v27 = v14;
        v28 = 2048;
        v29 = v9;
        v30 = 2114;
        v31 = v16;
        v32 = 2048;
        v33 = v6;
        v34 = 2048;
        v35 = _setCounterpartClass__fbsAddress;
        _os_log_impl(&dword_19A6D4000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring counterpart %{public}@ that is not from the same executable (%{public}@:%p/%{public}@:%p/%p)!", buf, 0x48u);

      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_setCounterpartClass__lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedExtensions, 0);
  objc_destroyWeak((id *)&self->_progenitor);
  objc_storeStrong((id *)&self->_legacyOtherSettings, 0);
  objc_storeStrong((id *)&self->_legacyLocalSettings, 0);
  objc_storeStrong((id *)&self->_localSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (id)_copyClearingProgenitor:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id WeakRetained;
  FBSSettings *v8;
  FBSSettings *v9;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    v6 = self->_mutable;
    if (v4)
    {
LABEL_8:
      v8 = -[FBSSettings copy:](self, "copy:", v4);
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
    if (v4)
      goto LABEL_8;
  }
  if (v6)
    goto LABEL_8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_progenitor);

  if (WeakRetained)
    v8 = (FBSSettings *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:", self);
  else
    v8 = self;
LABEL_9:
  v9 = v8;
  objc_storeWeak((id *)&v8->_progenitor, 0);

  return v9;
}

- (id)copy:(id)a3
{
  id v3;
  void *v4;

  if (!a3)
    return (id)-[FBSSettings copy](self, "copy");
  v3 = -[FBSSettings mutableCopy:](self, "mutableCopy:");
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (FBSSettings)initWithBSXPCCoder:(id)a3
{
  id v4;
  FBSSettings *v5;
  uint64_t v6;
  BSKeyedSettings *settings;
  BSKeyedSettings *v8;
  void *v9;
  uint64_t v10;
  BSSettings *legacyOtherSettings;
  BSSettings *v12;
  void *v13;

  v4 = a3;
  v5 = -[FBSSettings init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_settings"));
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (BSKeyedSettings *)v6;

    v8 = v5->_settings;
    objc_msgSend((id)objc_opt_class(), "_descriptionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSKeyedSettings setDescriptionProvider:](v8, "setDescriptionProvider:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_legacyOtherSettings"));
    v10 = objc_claimAutoreleasedReturnValue();
    legacyOtherSettings = v5->_legacyOtherSettings;
    v5->_legacyOtherSettings = (BSSettings *)v10;

    v12 = v5->_legacyOtherSettings;
    objc_msgSend((id)objc_opt_class(), "_legacyDescriptionProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSSettings setDescriptionProvider:](v12, "setDescriptionProvider:", v13);

  }
  return v5;
}

- (FBSSettings)init
{
  return -[FBSSettings initWithSettings:](self, "initWithSettings:", 0);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((BSSettingsIsEmpty() & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_settings, CFSTR("_settings"));
  if ((BSSettingsIsEmpty() & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_legacyOtherSettings, CFSTR("_legacyOtherSettings"));

}

- (BOOL)_isEmptyForCoding:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  int IsEmpty;

  if ((BSSettingsIsEmpty() & 1) != 0
    || (-[BSKeyedSettings allKeys](self->_settings, "allKeys"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (void *)objc_msgSend(v5, "mutableCopy"),
        v5,
        objc_msgSend(v6, "removeObject:", CFSTR("FBSSceneExtensions")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v7))
  {
    IsEmpty = BSSettingsIsEmpty();
    if (IsEmpty)
    {
      if (!a3)
      {
        IsEmpty = BSSettingsIsEmpty();
        if (IsEmpty)
          LOBYTE(IsEmpty) = BSSettingsIsEmpty();
      }
    }
  }
  else
  {
    LOBYTE(IsEmpty) = 0;
  }
  return IsEmpty;
}

- (id)_legacyLocalSettings
{
  if (a1)
  {
    -[FBSSettings _legacyLocalSettings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)_settings
{
  if (a1)
  {
    -[FBSSettings _settings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)_localSettings
{
  if (a1)
  {
    -[FBSSettings _localSettings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)mutableCopy:(id)a3
{
  void (**v4)(id, void *);
  void *v5;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[FBSSettings mutableCopy](self, "mutableCopy");
  if (v4)
    v4[2](v4, v5);

  return v5;
}

- (void)_removeVolatileSettings
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

- (void)_clearVolatileSettingsFromSettings:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  void *v11;
  SEL v12;
  _BYTE *v13;
  SEL v14;
  _BYTE *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v6)
      goto LABEL_27;
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(NSString **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = NSSelectorFromString(v10);
          if (v12)
          {
            FBSSettingForExtensionSelector(*(void **)(a1 + 8), v12);
            v13 = (_BYTE *)objc_claimAutoreleasedReturnValue();
            if ((-[FBSSetting isVolatile](v13) & 1) == 0)
            {
              if (!v13)
              {
LABEL_14:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  -[FBSSettings _clearVolatileSettingsFromSettings:](a1, v11);
                v13 = 0;
              }
LABEL_17:

              goto LABEL_18;
            }
          }
          else
          {
            v13 = 0;
            if (!-[FBSSetting isVolatile](0))
              goto LABEL_14;
          }
          -[FBSSettings _setValue:forSetting:](a1, 0, v13);
          goto LABEL_17;
        }
LABEL_18:
        if (objc_msgSend(v4, "flagForKey:", v10) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = NSSelectorFromString(v10);
          if (v14)
          {
            FBSSettingForExtensionSelector(*(void **)(a1 + 8), v14);
            v15 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }
          if (-[FBSSetting isVolatile](v15))
            -[FBSSettings _setValue:forSetting:](a1, 0, v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v7)
      {
LABEL_27:

        break;
      }
    }
  }

}

- (id)_sceneExtensionNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _sceneExtensionsCreatingIfNeeded:](self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_69);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v3;
}

- (void)_addSceneExtension:(Class)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSOrderedSet *orderedExtensions;
  NSOrderedSet *v15;
  NSOrderedSet *v16;
  NSOrderedSet *v17;
  NSOrderedSet *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension != ((void *)0)"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _addSceneExtension:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DFA0CLL);
  }
  if (!self || !self->_mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this class is not mutable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _addSceneExtension:].cold.2();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DF9A8);
  }
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a FBSSceneExtension"), a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _addSceneExtension:].cold.3();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DFA68);
  }
  FBSRealizeSceneExtension(a3);
  -[FBSSettings _allSceneExtensions](self, "_allSceneExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", a3);

  if ((v6 & 1) == 0)
  {
    -[FBSSettings _sceneExtensionsCreatingIfNeeded:](self, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v9, "count") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromClass(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x19AEC9EB0]("-[FBSSettings _addSceneExtension:]")
      && -[objc_class softLinkExtensionFrameworkInClient](a3, "softLinkExtensionFrameworkInClient"))
    {
      -[objc_class _frameworkNameLoadingIfNeeded:](a3, "_frameworkNameLoadingIfNeeded:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("|%@"), v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    objc_msgSend(v7, "setObject:forKey:", v11, v10);
    orderedExtensions = self->_orderedExtensions;
    if (orderedExtensions)
    {
      v15 = (NSOrderedSet *)-[NSOrderedSet mutableCopy](orderedExtensions, "mutableCopy");
      -[NSOrderedSet addObject:](v15, "addObject:", a3);
      v16 = (NSOrderedSet *)-[NSOrderedSet copy](v15, "copy");
      v17 = self->_orderedExtensions;
      self->_orderedExtensions = v16;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", a3);
      v18 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
      v15 = self->_orderedExtensions;
      self->_orderedExtensions = v18;
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend((id)objc_opt_class(), "_settingsExtensionsForSceneExtension:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v23);
          v25 = objc_opt_class();
          FBSRealizeSettingsExtension(v25, v24);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v21);
    }

  }
}

- (id)_allSceneExtensions
{
  NSOrderedSet *orderedExtensions;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *v11;
  Class v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  void *v23;
  Class v24;
  Class v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  char *v30;
  uint64_t v31;
  NSOrderedSet *v32;
  NSOrderedSet *v33;
  FBSSettings *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  NSString *v46;
  __int16 v47;
  char *v48;
  _QWORD v49[2];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  orderedExtensions = self->_orderedExtensions;
  if (orderedExtensions)
    return orderedExtensions;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = self;
  -[FBSSettings _sceneExtensionNames](self, "_sceneExtensionNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    v35 = v6;
    v36 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(NSString **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v12 = NSClassFromString(v11);
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else if (MEMORY[0x19AEC9EB0]("-[FBSSettings _allSceneExtensions]")
               && -[NSString rangeOfString:](v11, "rangeOfString:", CFSTR("|")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSString substringFromIndex:](v11, "substringFromIndex:", -[NSString rangeOfString:](v11, "rangeOfString:", CFSTR("|")) + 1);
          v13 = (char *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(CFSTR("/System/Library/Frameworks/"), "stringByAppendingFormat:", CFSTR("%@.framework/%@"), v13, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v49[0] = v14;
            objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/"), "stringByAppendingFormat:", CFSTR("%@.framework/%@"), v13, v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v49[1] = v15;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v38;
              while (2)
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v38 != v19)
                    objc_enumerationMutation(v16);
                  v21 = dlopen((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j)), "fileSystemRepresentation"), 257);
                  if (v21)
                  {
                    v23 = v21;

                    v24 = NSClassFromString(v11);
                    if (v24
                      && (v25 = v24,
                          -[objc_class isSubclassOfClass:](v24, "isSubclassOfClass:", objc_opt_class()))
                      && -[objc_class softLinkExtensionFrameworkInClient](v25, "softLinkExtensionFrameworkInClient"))
                    {
                      FBLogCommon();
                      v26 = objc_claimAutoreleasedReturnValue();
                      v6 = v35;
                      v5 = v36;
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v46 = v11;
                        v47 = 2114;
                        v48 = v13;
                        _os_log_error_impl(&dword_19A6D4000, v26, OS_LOG_TYPE_ERROR, "Found \"%{public}@\" after loading \"%{public}@\", buf, 0x16u);
                      }

                      v27 = (void *)objc_opt_class();
                      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v23);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_setAssociatedObject(v27, v25, v28, 0);

                      FBSRealizeSceneExtension(v25);
                      objc_msgSend(v36, "addObject:", v25);
                    }
                    else
                    {
                      FBLogCommon();
                      v29 = objc_claimAutoreleasedReturnValue();
                      v6 = v35;
                      v5 = v36;
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v46 = v11;
                        v47 = 2114;
                        v48 = v13;
                        _os_log_error_impl(&dword_19A6D4000, v29, OS_LOG_TYPE_ERROR, "Failed to find scene extension \"%{public}@\" after loading \"%{public}@\")", buf, 0x16u);
                      }

                      dlclose(v23);
                    }
                    goto LABEL_33;
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
                if (v18)
                  continue;
                break;
              }
            }

            FBLogCommon();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v30 = dlerror();
              *(_DWORD *)buf = 138543618;
              v46 = (NSString *)v13;
              v47 = 2082;
              v48 = v30;
              _os_log_error_impl(&dword_19A6D4000, v22, OS_LOG_TYPE_ERROR, "Unable to dlopen(%{public}@): %{public}s", buf, 0x16u);
            }

            v6 = v35;
            v5 = v36;
          }
LABEL_33:

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v8);
  }
  v31 = objc_msgSend(v5, "copy");
  v32 = v34->_orderedExtensions;
  v34->_orderedExtensions = (NSOrderedSet *)v31;

  v33 = v34->_orderedExtensions;
  return v33;
}

- (id)_sceneExtensionsCreatingIfNeeded:(void *)a1
{
  if (a1)
  {
    -[FBSSettings _subSettingsForKey:local:createIfNeeded:]((uint64_t)a1, CFSTR("FBSSceneExtensions"), 0, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_subSettingsForKey:(char)a3 local:(int)a4 createIfNeeded:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("key != ((void *)0)"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSSettings _subSettingsForKey:local:createIfNeeded:].cold.1();
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6E14C0);
    }
    -[FBSSettings _rootSettingsForLocal:createIfNeeded:]((id *)a1, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 && a4)
    {
      if (!*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this class is not mutable"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBSSettings _subSettingsForKey:local:createIfNeeded:].cold.2();
        objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A6E1518);
      }
      v10 = (void *)objc_opt_new();
      objc_msgSend(v9, "setObject:forKey:", v10, v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)initialize
{
  id v3;
  id v4;
  _BYTE *value;

  if ((id)objc_opt_class() != a1)
  {
    v3 = (id)objc_msgSend(a1, "_baseClass");
    v4 = (id)objc_msgSend(a1, "_mutableClass");
    if (v3 != a1)
    {
      if (v4 != a1)
      {
        value = objc_alloc((Class)a1);
        value[64] = objc_msgSend(a1, "isSubclassOfClass:", objc_msgSend(a1, "_mutableClass"));
        *((_QWORD *)value + 1) = objc_msgSend(a1, "_baseClass");
        objc_setAssociatedObject(a1, (const void *)_FBSLegacyDescriptionProviderKey, value, (void *)1);

        return;
      }
      v4 = (id)objc_msgSend(a1, "_baseClass");
    }
    objc_setAssociatedObject(a1, (const void *)_FBSCounterpartKey, v4, 0);
    objc_setAssociatedObject(v4, (const void *)_FBSCounterpartKey, a1, 0);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self && self->_mutable)
    return -[objc_class initWithSettings:](-[objc_class allocWithZone:](self->_baseClass, "allocWithZone:", a3), "initWithSettings:", self);
  else
    return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;

  if (self && self->_mutable)
    v5 = (void *)objc_opt_class();
  else
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "_mutableClass");
  return (id)objc_msgSend((id)objc_msgSend(v5, "allocWithZone:", a3), "initWithSettings:", self);
}

- (BOOL)_isMutable
{
  if (result)
    return *(_BYTE *)(result + 64) != 0;
  return result;
}

+ (Class)_diffClass
{
  return (Class)objc_opt_class();
}

uint64_t __36__FBSSettings__setCounterpartClass___block_invoke(uint64_t a1)
{
  objc_class *v2;
  uint64_t result;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  class_getMethodImplementation(v2, sel_initWithSettings_);
  result = dyld_image_header_containing_address();
  _setCounterpartClass__fbsAddress = result;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count not find executable name for FrontBoardServices"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __36__FBSSettings__setCounterpartClass___block_invoke_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return 0;
}

- (id)_underlyingValueForSetting:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int IsYes;
  id *v15;
  void *v16;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_13;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("setting != ((void *)0)"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _underlyingValueForSetting:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7401E0);
  }
  if (*(_BYTE *)(a1 + 64))
    v5 = -[FBSSetting isBSSettings]((_BOOL8)v3);
  else
    v5 = 0;
  -[FBSSetting extensionID]((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FBSSetting isLocal]((_BOOL8)v4);
  -[FBSSettings _rootSettingsForLocal:createIfNeeded:]((id *)a1, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "objectForKey:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (!v9)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v11 = -[FBSSetting setting]((uint64_t)v4);
  objc_msgSend(v9, "objectForSetting:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (objc_msgSend(v9, "flagForSetting:", v11) != 0x7FFFFFFFFFFFFFFFLL)
    {
      IsYes = BSSettingFlagIsYes();
      v15 = (id *)MEMORY[0x1E0C9AE50];
      if (!IsYes)
        v15 = (id *)MEMORY[0x1E0C9AE40];
      v12 = *v15;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  return v12;
}

- (void)_addSceneExtension:(Class)a3 applyingSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("fromSettings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _addSceneExtension:applyingSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A740430);
  }
  v7 = v6;
  if (self->_baseClass != (Class)*((_QWORD *)v6 + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("class mismatch"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _addSceneExtension:applyingSettings:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A740488);
  }
  -[FBSSettings _addSceneExtension:](self, "_addSceneExtension:", a3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend((id)objc_opt_class(), "_settingsExtensionsForSceneExtension:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        NSStringFromClass(*(Class *)(*((_QWORD *)&v20 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSSettings _subSettingsForKey:local:createIfNeeded:]((uint64_t)v7, v13, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((BSSettingsIsEmpty() & 1) == 0)
        {
          -[FBSSettings _subSettingsForKey:local:createIfNeeded:]((uint64_t)self, v13, 0, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "applySettings:", v14);

        }
        -[FBSSettings _subSettingsForKey:local:createIfNeeded:]((uint64_t)v7, v13, 1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((BSSettingsIsEmpty() & 1) == 0)
        {
          -[FBSSettings _subSettingsForKey:local:createIfNeeded:]((uint64_t)self, v13, 1, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "applySettings:", v16);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (void)_removeSceneExtension:(Class)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  Class v18;
  BOOL v19;
  NSOrderedSet *orderedExtensions;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extensionToRemove != ((void *)0)"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _removeSceneExtension:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7407C8);
  }
  if (!self || !self->_mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this class is not mutable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _removeSceneExtension:].cold.2();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A740764);
  }
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a FBSSceneExtension"), a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettings _removeSceneExtension:].cold.3();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A740824);
  }
  -[FBSSettings _allSceneExtensions](self, "_allSceneExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", a3);

  if (v6)
  {
    -[FBSSettings _sceneExtensionsCreatingIfNeeded:](self, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16));
          v17 = (NSString *)objc_claimAutoreleasedReturnValue();
          v18 = NSClassFromString(v17);

          if (v18)
            v19 = v18 == a3;
          else
            v19 = 1;
          if (!v19)
            objc_msgSend(v11, "addObject:", v18);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v14);
    }

    objc_msgSend(v7, "removeAllSettings");
    orderedExtensions = self->_orderedExtensions;
    self->_orderedExtensions = 0;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = v11;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          -[FBSSettings _addSceneExtension:](self, "_addSceneExtension:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25++));
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v23);
    }

  }
}

uint64_t __37__FBSSettings__removeSceneExtension___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (void)_removeAllSceneExtensions
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

- (BOOL)_hasAnySceneExtension
{
  void *v2;
  char v3;

  -[FBSSettings _sceneExtensionsCreatingIfNeeded:](self, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSSettingsIsEmpty() ^ 1;

  return v3;
}

uint64_t __35__FBSSettings__sceneExtensionNames__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (BOOL)_hasAdditionalDescription
{
  return 0;
}

- (BOOL)_isEqualToSettings:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (BSSettingsIsEmpty() && (BSSettingsIsEmpty() & 1) != 0 || BSSettingsEqualToSettings())
    && (BSSettingsIsEmpty() && (BSSettingsIsEmpty() & 1) != 0 || BSSettingsEqualToSettings())
    && (BSSettingsIsEmpty() && (BSSettingsIsEmpty() & 1) != 0 || BSSettingsEqualToSettings())
    && (BSSettingsIsEmpty() && (BSSettingsIsEmpty() & 1) != 0 || BSSettingsEqualToSettings());

  return v4;
}

- (void)_isEmpty
{
  if (a1)
    return (void *)objc_msgSend(a1, "_isEmptyForCoding:", 0);
  return a1;
}

- (BOOL)_indirect_isEmpty
{
  if (self)
    LOBYTE(self) = -[FBSSettings _isEmptyForCoding:](self, "_isEmptyForCoding:", 0);
  return (char)self;
}

- (void)_applySettings:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;

  v3 = a2;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      if (*(id *)(a1 + 8) == v3[1])
      {
        v13 = v3;
        -[FBSSettings _settings:]((id *)a1, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSSettings _settings:](v13, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "applySettings:", v5);

        -[FBSSettings _localSettings:]((id *)a1, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSSettings _localSettings:](v13, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "applySettings:", v7);

        -[FBSSettings _legacyOtherSettings:]((id *)a1, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSSettings _legacyOtherSettings:](v13, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "applySettings:", v9);

        -[FBSSettings _legacyLocalSettings:]((id *)a1, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSSettings _legacyLocalSettings:](v13, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "applySettings:", v11);

        v3 = v13;
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("class mismatch"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSSettings _applySettings:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this class is not mutable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSSettings _applySettings:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A740C18);
  }
LABEL_5:

}

- (BOOL)conformsToExtension:(Class)a3
{
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[FBSSettings _allSceneExtensions](self, "_allSceneExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", a3);

  if ((v6 & 1) != 0)
    return 1;
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend((id)objc_opt_class(), "_settingsExtensionsForSceneExtension:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        if (!FBSSettingsExtensionIsRealized((uint64_t)self->_baseClass, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)))
        {
          v7 = 0;
          goto LABEL_16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_16:

  return v7;
}

+ (id)settingForProperty:(SEL)a3
{
  id result;
  void *v6;

  if ((id)objc_opt_class() != a1)
    return FBSSettingForSelector(a1, a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call on a concrete subclass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[FBSSettings settingForProperty:].cold.1();
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)settingForSubclassProperty:(SEL)a3
{
  id result;
  void *v6;

  if ((id)objc_opt_class() != a1)
    return FBSSettingForLegacySelector((objc_class *)a1, a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call on a concrete subclass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[FBSSettings settingForSubclassProperty:].cold.1();
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)allSettings
{
  id result;
  void *v4;

  if ((id)objc_opt_class() != a1)
    return FBSAllSettings(a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call on a concrete subclass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[FBSSettings allSettings].cold.1();
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)allSettingsFromProtocol:(id)a3
{
  id v4;
  void *v5;
  id result;
  void *v7;

  v4 = a3;
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call on a concrete subclass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSettings allSettingsFromProtocol:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    FBSAllSettingsFromProtocol(a1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  return result;
}

+ (id)allSettingsFromExtension:(Class)a3
{
  void *v5;
  void *v6;
  id result;
  void *v8;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    -[objc_class protocol](a3, "protocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "allSettingsFromProtocol:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[extension isSubclassOfClass:[FBSSettingsExtension class]]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSettings allSettingsFromExtension:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)containsSetting:(id)a3
{
  void *v3;

  if (!a3)
    return 0;
  -[FBSSettings _underlyingValueForSetting:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (id)valueForSetting:(id)a3
{
  os_unfair_lock_s *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  objc_class *v19;
  uint64_t v20;
  unsigned int IsYes;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSString *v30;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (os_unfair_lock_s *)a3;
  if (v4)
  {
    -[FBSSettings _valueForSetting:]((uint64_t)self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[FBSSetting defaultValue](v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_59:

      goto LABEL_60;
    }
    v6 = -[FBSSetting type]((uint64_t)v4);
    if (v6 != 64)
    {
      if ((v6 & 0xFFFFFFEF) != 0x2A && v6 != 123 && v6 == 35)
      {
        v12 = objc_opt_class();
        v13 = v5;
        if (v12)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v30 = v14;

        NSClassFromString(v30);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17)
          goto LABEL_52;
        goto LABEL_57;
      }
      v15 = objc_opt_class();
      v7 = v5;
      if (v15)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v7;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v17 = v16;
LABEL_51:

      if (v17)
      {
LABEL_52:
        v29 = v17;
LABEL_58:
        v11 = v29;

        goto LABEL_59;
      }
LABEL_57:
      -[FBSSetting defaultValue](v4);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_58;
    }
    v7 = v5;
    if (_NSIsNSValue())
    {
      v7 = objc_retainAutorelease(v7);
      if (*(_BYTE *)objc_msgSend(v7, "objCType") == 64)
      {
        v8 = objc_opt_class();
        v9 = v7;
        if (v8)
          v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
        else
          v10 = 0;
        v18 = v10;

        objc_msgSend(v18, "weakObjectValue");
        v7 = (id)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
LABEL_50:
          v17 = 0;
          goto LABEL_51;
        }
      }
    }
    v19 = (objc_class *)-[FBSSetting expectedClass]((uint64_t)v4);
    if (-[FBSSetting specialCollection](v4) == (os_unfair_lock_s *)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = 1;
      }
      else
      {
        if (!objc_msgSend(v7, "count"))
          goto LABEL_35;
        v20 = 0;
      }
      IsYes = BSSettingFlagIsYes();
      -[FBSSetting setSpecialCollection:]((uint64_t)v4, IsYes);
      FBLogSceneExtension();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[FBSSettings valueForSetting:].cold.1((uint64_t)v4, v20, v22);

    }
LABEL_35:
    if ((BSSettingFlagIsYes() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [v19 alloc];
        objc_msgSend(v7, "array");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v23, "initWithArray:", v17);
LABEL_45:
        v27 = v24;

        if (v27)
        {
          v17 = v27;
          goto LABEL_51;
        }
        FBLogSceneExtension();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          -[FBSSetting name]((uint64_t)v4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(v19);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138412802;
          v37 = v32;
          v38 = 2112;
          v39 = v33;
          v40 = 2112;
          v41 = v35;
          _os_log_error_impl(&dword_19A6D4000, v28, OS_LOG_TYPE_ERROR, "Property \"%@\" is expected to be of type \"%@\", but we found \"%@\". Returning nil.", (uint8_t *)&v36, 0x20u);

        }
        goto LABEL_50;
      }
      v17 = v7;
      if (!v19)
      {
        v26 = 0;
LABEL_44:
        v24 = v26;
        goto LABEL_45;
      }
    }
    else
    {
      v25 = v7;
      v17 = v25;
      if (!v19)
      {
        v7 = v25;
        goto LABEL_51;
      }
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v17;
    else
      v26 = 0;
    goto LABEL_44;
  }
  v11 = 0;
LABEL_60:

  return v11;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  if (!self || !self->_mutable)
  {
    v6 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
    v7 = -[BSKeyedSettings hash](self->_settings, "hash");
    v8 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
    return v6 ^ ((v8 ^ v6) >> 31) ^ v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FBSSettings *v4;
  Class *p_isa;
  BOOL v6;

  v4 = (FBSSettings *)a3;
  p_isa = &v4->super.isa;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_baseClass == p_isa[1]
      && -[FBSSettings _isEqualToSettings:](self, "_isEqualToSettings:", p_isa);

  return v6;
}

- (NSString)description
{
  return (NSString *)-[FBSSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[FBSSettings debugDescriptionWithMultilinePrefix:](self, 0);
}

- (id)debugDescriptionWithMultilinePrefix:(void *)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    -[FBSSettings _descriptionBuilderWithMultilinePrefix:debug:](a1, a2, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "build");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[FBSSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[FBSSettings _descriptionBuilderWithMultilinePrefix:debug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 debug:
{
  id v5;
  id v6;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "succinctDescriptionBuilder");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    if (BSSettingsIsEmpty()
      && BSSettingsIsEmpty()
      && BSSettingsIsEmpty()
      && BSSettingsIsEmpty()
      && !objc_msgSend(a1, "_hasAdditionalDescription"))
    {
      v8 = (id)objc_msgSend(v6, "appendObject:withName:", CFSTR("(empty)"), 0);
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__FBSSettings__descriptionBuilderWithMultilinePrefix_debug___block_invoke;
      v9[3] = &unk_1E38EAE08;
      v9[4] = a1;
      v6 = v6;
      v10 = v6;
      objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __60__FBSSettings__descriptionBuilderWithMultilinePrefix_debug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  if ((BSSettingsIsEmpty() & 1) == 0)
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("settings"));
  if ((BSSettingsIsEmpty() & 1) == 0)
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("localSettings"));
  if ((BSSettingsIsEmpty() & 1) == 0)
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("subclassSettings"));
  if ((BSSettingsIsEmpty() & 1) == 0)
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("legacyLocalSettings"));
  return objc_msgSend(*(id *)(a1 + 32), "_appendToDescriptionBuilder:", *(_QWORD *)(a1 + 40));
}

- (FBSSettings)initWithXPCDictionary:(id)a3
{
  void *v4;
  FBSSettings *v5;

  objc_msgSend(off_1E38E9EA8, "coderWithMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBSSettings initWithBSXPCCoder:](self, "initWithBSXPCCoder:", v4);

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  objc_msgSend(off_1E38E9EA8, "coderWithMessage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSSettings encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:", v4);

}

- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7
{
  return 0;
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  return -[FBSSettings keyDescriptionForSetting:](self, "keyDescriptionForSetting:", a4);
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  return -[FBSSettings valueDescriptionForFlag:object:ofSetting:](self, "valueDescriptionForFlag:object:ofSetting:", a4, a5, a6);
}

- (BOOL)appendDescriptionToBuilder:(id)a3 forFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  return 0;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

+ (Class)_baseClass
{
  Class result;

  OUTLINED_FUNCTION_9_2();
  objc_opt_class();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9();
  return result;
}

+ (Class)_mutableClass
{
  Class result;

  OUTLINED_FUNCTION_9_2();
  objc_opt_class();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9();
  return result;
}

+ (Class)subclassExtension
{
  Class result;

  OUTLINED_FUNCTION_9_2();
  objc_opt_class();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9();
  return result;
}

+ (id)subclassExtensions
{
  id result;

  OUTLINED_FUNCTION_9_2();
  objc_opt_class();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9();
  return result;
}

+ (Class)mutableSubclass
{
  Class result;

  OUTLINED_FUNCTION_9_2();
  objc_opt_class();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9();
  return result;
}

+ (Class)immutableSubclass
{
  Class result;

  OUTLINED_FUNCTION_9_2();
  objc_opt_class();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9();
  return result;
}

- (void)initWithSettings:.cold.1()
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

- (void)initWithSettings:.cold.2()
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

+ (void)_setCounterpartClass:.cold.1()
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

void __36__FBSSettings__setCounterpartClass___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(*(SEL *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_underlyingValueForSetting:.cold.1()
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

- (void)_setValue:forSetting:.cold.1()
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

- (void)_setValue:forSetting:.cold.2()
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

- (void)_subSettingsForKey:local:createIfNeeded:.cold.1()
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

- (void)_subSettingsForKey:local:createIfNeeded:.cold.2()
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

- (void)_addSceneExtension:.cold.1()
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

- (void)_addSceneExtension:.cold.2()
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

- (void)_addSceneExtension:.cold.3()
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

- (void)_addSceneExtension:applyingSettings:.cold.1()
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

- (void)_addSceneExtension:applyingSettings:.cold.2()
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

- (void)_removeSceneExtension:.cold.1()
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

- (void)_removeSceneExtension:.cold.2()
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

- (void)_removeSceneExtension:.cold.3()
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

- (void)_applySettings:.cold.1()
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

- (void)_applySettings:.cold.2()
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

+ (void)settingForProperty:.cold.1()
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

+ (void)settingForSubclassProperty:.cold.1()
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

+ (void)allSettings
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

+ (void)allSettingsFromProtocol:.cold.1()
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

+ (void)allSettingsFromExtension:.cold.1()
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

- (void)valueForSetting:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int IsYes;
  const char *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[FBSSetting name](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsYes = BSSettingFlagIsYes();
  v6 = "is not";
  if (IsYes)
    v6 = "is";
  v7 = 138412546;
  v8 = v4;
  v9 = 2080;
  v10 = v6;
  _os_log_debug_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_DEBUG, "Determined \"%@\" %s a special collection.", (uint8_t *)&v7, 0x16u);

}

@end
