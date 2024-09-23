@implementation BSSettings

- (BOOL)BOOLForSetting:(unint64_t)a3
{
  void *settingToFlagMap;

  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap)
  {
    settingToFlagMap = BSIntegerMapObjectForKey(settingToFlagMap, a3);
    if (settingToFlagMap)
      LOBYTE(settingToFlagMap) = CFBooleanGetValue((CFBooleanRef)settingToFlagMap) != 0;
  }
  return (char)settingToFlagMap;
}

- (void)_setFlag:(uint64_t)a3 forSetting:
{
  void *v6;
  BSMutableIntegerMap *v7;
  void *v8;
  void **v9;
  void *v10;

  if (a1)
  {
    v6 = *(void **)(a1 + 8);
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6)
      {
        BSIntegerMapRemoveObjectForKey(v6, a3);
        if (!BSIntegerMapCount(*(void **)(a1 + 8)))
        {
          v10 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = 0;

        }
      }
    }
    else
    {
      if (!v6)
      {
        v7 = objc_alloc_init(BSMutableIntegerMap);
        v8 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v7;

        v6 = *(void **)(a1 + 8);
      }
      v9 = (void **)MEMORY[0x1E0C9AE40];
      if (a2)
        v9 = (void **)MEMORY[0x1E0C9AE50];
      BSIntegerMapSetObjectForKey(v6, *v9, a3);
    }
  }
}

- (void)_enumerateSettingsInMap:(void *)a3 withBlock:
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  v5 = a3;
  if (a1 && v6 && v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__BSSettings__enumerateSettingsInMap_withBlock___block_invoke;
    v7[3] = &unk_1E1EC00B0;
    v8 = v5;
    BSIntegerMapEnumerateKeysWithBlock(v6, v7);

  }
}

uint64_t __48__BSSettings__enumerateSettingsInMap_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__BSSettings_enumerateObjectsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForSetting:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);

}

- (void)_setObject:(uint64_t)a3 forSetting:
{
  void *v5;
  BSMutableIntegerMap *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    if (v9)
    {
      if (!v5)
      {
        v6 = objc_alloc_init(BSMutableIntegerMap);
        v7 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v6;

        v5 = *(void **)(a1 + 16);
      }
      BSIntegerMapSetObjectForKey(v5, v9, a3);
    }
    else if (v5)
    {
      BSIntegerMapRemoveObjectForKey(v5, a3);
      if (!BSIntegerMapCount(*(void **)(a1 + 16)))
      {
        v8 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;

      }
    }
  }

}

- (BSSettings)initWithSettings:(id)a3
{
  id v4;
  BSSettings *v5;
  BSSettings *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  BSMutableIntegerMap *settingToFlagMap;
  id v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  BSMutableIntegerMap *v15;
  BSMutableIntegerMap *v16;
  BSMutableIntegerMap *settingToObjectMap;
  id WeakRetained;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  BOOL v23;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BSSettings;
  v5 = -[BSSettings init](&v20, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[BSSettings _isMutable](v5, "_isMutable");
    v8 = (void *)*((_QWORD *)v4 + 1);
    if (v7)
      v9 = objc_msgSend(v8, "mutableCopy");
    else
      v9 = objc_msgSend(v8, "copy");
    settingToFlagMap = v6->_settingToFlagMap;
    v6->_settingToFlagMap = (BSMutableIntegerMap *)v9;

    v11 = *((id *)v4 + 2);
    v12 = -[BSSettings _isMutable](v6, "_isMutable");
    if (v11)
      v13 = (void *)objc_msgSend(v11, "mutableCopy");
    else
      v13 = (void *)objc_opt_new();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __27__BSSettings__deepCopyMap___block_invoke;
    v21[3] = &unk_1E1EC04F0;
    v23 = v12;
    v14 = v13;
    v22 = v14;
    objc_msgSend(v11, "enumerateWithBlock:", v21);
    if (v12)
      v15 = (BSMutableIntegerMap *)v14;
    else
      v15 = (BSMutableIntegerMap *)objc_msgSend(v14, "copy");
    v16 = v15;

    settingToObjectMap = v6->_settingToObjectMap;
    v6->_settingToObjectMap = v16;

    WeakRetained = objc_loadWeakRetained((id *)v4 + 3);
    objc_storeWeak((id *)&v6->_descriptionProvider, WeakRetained);

  }
  return v6;
}

- (BOOL)_isMutable
{
  return 0;
}

void __27__BSSettings__deepCopyMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 40))
      v5 = objc_msgSend(v7, "mutableCopy");
    else
      v5 = objc_msgSend(v7, "copy");
    v6 = (void *)v5;

    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, a2);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  if (-[BSSettings _isMutable](self, "_isMutable"))
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_baseClass"), "allocWithZone:", a3), "initWithSettings:", self);
  else
    return self;
}

uint64_t __38__BSSettings_enumerateFlagsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, objc_msgSend(*(id *)(a1 + 32), "flagForSetting:", a2), a3);
}

- (id)allSettings
{
  void *v3;
  void *v4;
  BSMutableIntegerSet *v5;

  -[BSIntegerMap allKeys](self->_settingToFlagMap, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSIntegerMap allKeys](self->_settingToObjectMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSIntegerSet initWithCapacity:]([BSMutableIntegerSet alloc], "initWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v3, "count"));
  -[BSMutableIntegerSet unionSet:](v5, "unionSet:", v3);
  -[BSMutableIntegerSet unionSet:](v5, "unionSet:", v4);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_mutableClass"), "allocWithZone:", a3), "initWithSettings:", self);
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

void __38__BSSettings_encodeWithXPCDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  BSIntegerMapObjectForKey(*(void **)(a1 + 40), a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSettingsEncodeAppendSettingArrayEntry(v4, a2, v5, *(void **)(a1 + 48));

}

- (int64_t)flagForSetting:(unint64_t)a3
{
  BSMutableIntegerMap *settingToFlagMap;
  const __CFBoolean *v4;

  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap && (v4 = (const __CFBoolean *)BSIntegerMapObjectForKey(settingToFlagMap, a3)) != 0)
    return CFBooleanGetValue(v4) != 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)objectForSetting:(unint64_t)a3
{
  void *settingToObjectMap;

  settingToObjectMap = self->_settingToObjectMap;
  if (settingToObjectMap)
  {
    BSIntegerMapObjectForKey(settingToObjectMap, a3);
    settingToObjectMap = (void *)objc_claimAutoreleasedReturnValue();
  }
  return settingToObjectMap;
}

void __31__BSSettings__applyToSettings___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  char isKindOfClass;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForSetting:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v10, "_isKeyed");
      v5 = (void *)objc_opt_new();
      -[BSSettings _setObject:forSetting:](*(_QWORD *)(a1 + 32), v5, a2);
    }
    objc_msgSend(v10, "applyToSettings:", v5);
    goto LABEL_11;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_msgSend(v7, "_isMutable");
    v9 = *(_QWORD *)(a1 + 32);
    if (v8)
      v5 = (void *)objc_msgSend(v10, "mutableCopy");
    else
      v5 = (void *)objc_msgSend(v10, "copy");
    -[BSSettings _setObject:forSetting:](v9, v5, a2);
LABEL_11:

    goto LABEL_12;
  }
  -[BSSettings _setObject:forSetting:]((uint64_t)v7, v10, a2);
LABEL_12:

}

id __38__BSSettings_encodeWithXPCDictionary___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  BSSettingsEncodeSettingObject(a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4 && !-[BSSettings isEmpty](self, "isEmpty"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__BSSettings_encodeWithXPCDictionary___block_invoke;
    v6[3] = &unk_1E1EC0398;
    v6[4] = self;
    v7 = v4;
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x18D769CFC](v6);
    ((void (**)(_QWORD, BSMutableIntegerMap *, const char *, void *))v5)[2](v5, self->_settingToFlagMap, "flags", &__block_literal_global_35);
    ((void (**)(_QWORD, BSMutableIntegerMap *, const char *, void *))v5)[2](v5, self->_settingToObjectMap, "objects", &__block_literal_global_16);

  }
}

void __38__BSSettings_encodeWithXPCDictionary___block_invoke(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v7;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v12 = a2;
  v7 = a4;
  if (v12)
  {
    v8 = BSIntegerMapCount(v12);
    if (v7)
    {
      if (v8)
      {
        v9 = xpc_array_create(0, 0);
        v10 = *(_QWORD *)(a1 + 32);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __38__BSSettings_encodeWithXPCDictionary___block_invoke_2;
        v13[3] = &unk_1E1EC0370;
        v11 = v9;
        v14 = v11;
        v15 = v12;
        v16 = v7;
        -[BSSettings _enumerateSettingsInMap:withBlock:](v10, v15, v13);
        xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), a3, v11);

      }
    }
  }

}

id __38__BSSettings_encodeWithXPCDictionary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  const __CFBoolean *v3;
  BOOL v4;
  xpc_object_t v5;

  v3 = a3;
  v4 = CFBooleanGetValue(v3) != 0;
  v5 = xpc_BOOL_create(v4);

  return v5;
}

void __31__BSSettings__applyToSettings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[BSSettings _setFlag:forSetting:](*(_QWORD *)(a1 + 32), a3, a2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionProvider);
  objc_storeStrong((id *)&self->_settingToObjectMap, 0);
  objc_storeStrong((id *)&self->_settingToFlagMap, 0);
}

- (void)setDescriptionProvider:(id)a3
{
  objc_storeWeak((id *)&self->_descriptionProvider, a3);
}

- (BOOL)isEmpty
{
  BSMutableIntegerMap *settingToFlagMap;
  _BOOL4 v4;
  BSMutableIntegerMap *settingToObjectMap;
  BOOL v6;

  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap)
    v4 = BSIntegerMapCount(settingToFlagMap) == 0;
  else
    v4 = 1;
  settingToObjectMap = self->_settingToObjectMap;
  if (settingToObjectMap)
    v6 = BSIntegerMapCount(settingToObjectMap) == 0;
  else
    v6 = 1;
  return v4 && v6;
}

- (void)_enumerateSettingsForFlagsWithBlock:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[BSSettings _enumerateSettingsInMap:withBlock:](a1, *(void **)(a1 + 8), v3);

}

- (void)enumerateObjectsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __40__BSSettings_enumerateObjectsWithBlock___block_invoke;
    v6[3] = &unk_1E1EC04A0;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[4] = self;
    v7 = v4;
    -[BSSettings _enumerateSettingsForObjectsWithBlock:]((uint64_t)self, v6);

    v4 = v5;
  }

}

- (void)_enumerateSettingsForObjectsWithBlock:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[BSSettings _enumerateSettingsInMap:withBlock:](a1, *(void **)(a1 + 16), v3);

}

- (BOOL)isKeyedSettings
{
  return 0;
}

- (void)enumerateFlagsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __38__BSSettings_enumerateFlagsWithBlock___block_invoke;
    v6[3] = &unk_1E1EC04A0;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[4] = self;
    v7 = v4;
    -[BSSettings _enumerateSettingsForFlagsWithBlock:]((uint64_t)self, v6);

    v4 = v5;
  }

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BSSettings *v4;
  void **p_isa;
  BSMutableIntegerMap *settingToFlagMap;
  BSMutableIntegerMap *v7;
  BOOL v8;
  BSMutableIntegerMap *settingToObjectMap;
  BSMutableIntegerMap *v10;

  v4 = (BSSettings *)a3;
  p_isa = (void **)&v4->super.isa;
  if (self == v4)
    goto LABEL_16;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if (BSIntegerMapCount(self->_settingToFlagMap) || BSIntegerMapCount(p_isa[1]))
  {
    settingToFlagMap = self->_settingToFlagMap;
    v7 = (BSMutableIntegerMap *)p_isa[1];
    if (settingToFlagMap != v7)
    {
      v8 = 0;
      if (!settingToFlagMap || !v7)
        goto LABEL_18;
      if (!-[BSIntegerMap isEqual:](settingToFlagMap, "isEqual:"))
        goto LABEL_17;
    }
  }
  if (!BSIntegerMapCount(self->_settingToObjectMap) && !BSIntegerMapCount(p_isa[2]))
    goto LABEL_16;
  settingToObjectMap = self->_settingToObjectMap;
  v10 = (BSMutableIntegerMap *)p_isa[2];
  if (settingToObjectMap == v10)
    goto LABEL_16;
  v8 = 0;
  if (settingToObjectMap && v10)
  {
    if (-[BSIntegerMap isEqual:](settingToObjectMap, "isEqual:"))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

- (BSSettings)initWithXPCDictionary:(id)a3
{
  id v4;
  BSSettings *v5;
  BSSettings *v6;
  void *v7;
  uint64_t v8;
  BSSettings *v9;
  void *v10;
  _QWORD v12[4];
  BSSettings *v13;
  _QWORD v14[4];
  BSSettings *v15;

  v4 = a3;
  v5 = -[BSSettings init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    xpc_dictionary_get_value(v4, "flags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__BSSettings_initWithXPCDictionary___block_invoke;
    v14[3] = &unk_1E1EC0348;
    v9 = v6;
    v15 = v9;
    BSSettingsDecodeSettingEntries(v7, v14);
    xpc_dictionary_get_value(v4, "objects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __36__BSSettings_initWithXPCDictionary___block_invoke_12;
    v12[3] = &unk_1E1EC0348;
    v13 = v9;
    BSSettingsDecodeSettingEntries(v10, v12);

  }
  return v6;
}

- (BSSettings)init
{
  return -[BSSettings initWithSettings:](self, "initWithSettings:", 0);
}

void __36__BSSettings_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 value;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (object_getClass(v5) == (Class)MEMORY[0x1E0C812D0])
  {
    v7 = *(_QWORD *)(a1 + 32);
    value = xpc_BOOL_get_value(v5);
    -[BSSettings _setFlag:forSetting:](v7, value, a2);
  }
  else
  {
    BSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315650;
      v10 = "-[BSSettings initWithXPCDictionary:]_block_invoke";
      v11 = 2048;
      v12 = a2;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_18A184000, v6, OS_LOG_TYPE_ERROR, "%s the encoded flag format for %llu is unknown -> %{public}@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (BOOL)_hasValueForSetting:(void *)a1
{
  void *v4;
  _BOOL8 v5;

  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForSetting:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "flagForSetting:", a2) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

void __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[BSSettings _appendDescriptionForSetting:toBuilder:](*(id **)(a1 + 32), a2, *(void **)(a1 + 40));
}

void __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_sortedSettingsForDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v9[3] = &unk_1E1EC0450;
    v2 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v2;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
    v3 = &v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "allSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v7[3] = &unk_1E1EC0478;
    v5 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v4, "enumerateSortedWithBlock:", v7);
    v3 = &v8;

  }
}

- (BSSettingDescriptionProvider)descriptionProvider
{
  return (BSSettingDescriptionProvider *)objc_loadWeakRetained((id *)&self->_descriptionProvider);
}

- (void)_applyToSettings:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__BSSettings__applyToSettings___block_invoke;
    v10[3] = &unk_1E1EC0400;
    v7 = v4;
    v6 = v4;
    v11 = v6;
    -[BSSettings enumerateFlagsWithBlock:](self, "enumerateFlagsWithBlock:", v10);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __31__BSSettings__applyToSettings___block_invoke_2;
    v8[3] = &unk_1E1EC04C8;
    v9 = v6;
    -[BSSettings enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v8);

    v4 = v7;
  }

}

- (id)_sortedSettingsForDescription
{
  return 0;
}

- (void)_appendDescriptionForSetting:(void *)a3 toBuilder:
{
  uint64_t v5;
  void *v6;
  id WeakRetained;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (a1)
  {
    v5 = objc_msgSend(a1, "flagForSetting:", a2);
    objc_msgSend(a1, "objectForSetting:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(a1 + 3);
    if (!WeakRetained)
      goto LABEL_13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = objc_msgSend(WeakRetained, "settings:appendDescriptionToBuilder:forFlag:object:ofSetting:", a1, v13, v5, v6, a2);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_8;
      v8 = objc_msgSend(WeakRetained, "appendDescriptionToBuilder:forFlag:object:ofSetting:", v13, v5, v6, a2);
    }
    if ((v8 & 1) != 0)
    {
LABEL_22:

      goto LABEL_23;
    }
LABEL_8:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "settings:keyDescriptionForSetting:", a1, a2);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_13;
      objc_msgSend(WeakRetained, "keyDescriptionForSetting:", a2);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    if (v9)
    {
LABEL_14:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "settings:valueDescriptionForFlag:object:ofSetting:", a1, v5, v6, a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_20;
        objc_msgSend(WeakRetained, "valueDescriptionForFlag:object:ofSetting:", v5, v6, a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      if (v11)
      {
        -[BSSettings _appendValueDescriptionForFlag:object:toBuilder:forName:](0x7FFFFFFFFFFFFFFFLL, v11, v13, v10);
LABEL_21:

        goto LABEL_22;
      }
LABEL_20:
      v12 = 0;
      -[BSSettings _appendValueDescriptionForFlag:object:toBuilder:forName:](v5, v6, v13, v10);
      goto LABEL_21;
    }
LABEL_13:
    objc_msgSend(a1, "_keyDescriptionForSetting:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!WeakRetained)
      goto LABEL_20;
    goto LABEL_14;
  }
LABEL_23:

}

- (void)_appendValueDescriptionForFlag:(uint64_t)a1 object:(void *)a2 toBuilder:(void *)a3 forName:(void *)a4
{
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v15;
  v10 = v8;
  if (a1 == 0x7FFFFFFFFFFFFFFFLL || !v15)
  {
    if (a1 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a1)
        v9 = CFSTR("Yes");
      else
        v9 = CFSTR("No");
    }
    +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v9, v7, v8);
  }
  else
  {
    v11 = CFSTR("Yes");
    if (!a1)
      v11 = CFSTR("No");
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [flag]"), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v12, v7, v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [obj]"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v15, v7, v14);

  }
}

+ (void)_appendObject:(id)a3 toBuilder:(id)a4 forName:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v20 = a3;
  v7 = a4;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_15;
  if (objc_msgSend(v20, "isNSArray"))
  {
    v9 = v20;
    goto LABEL_9;
  }
  if (objc_msgSend(v20, "isNSSet"))
  {
    objc_msgSend(v20, "allObjects");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((objc_msgSend(v20, "isNSOrderedSet") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v20, "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10 = v9;
    if (v9)
    {
      NSStringFromClass((Class)objc_msgSend(v20, "classForCoder"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" <%@; %p>"), v11, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v7, "activeMultilinePrefix");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __46__BSSettings__appendObject_toBuilder_forName___block_invoke;
        v24[3] = &unk_1E1EBE700;
        v25 = v10;
        v26 = v7;
        v10 = v10;
        objc_msgSend(v26, "appendBodySectionWithName:multilinePrefix:block:", v12, v13, v24);

      }
      else
      {
        v18 = (id)objc_msgSend(v7, "appendObject:withName:", CFSTR("(empty)"), v12);
      }
      goto LABEL_21;
    }
  }
  if (objc_msgSend(v20, "isNSDictionary"))
  {
    NSStringFromClass((Class)objc_msgSend(v20, "classForCoder"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" <%@; %p>"), v14, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v20, "count"))
    {
      v19 = (id)objc_msgSend(v7, "appendObject:withName:", CFSTR("(empty)"), v12);
      goto LABEL_22;
    }
    objc_msgSend(v7, "activeMultilinePrefix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __46__BSSettings__appendObject_toBuilder_forName___block_invoke_2;
    v21[3] = &unk_1E1EBE700;
    v22 = v20;
    v23 = v7;
    objc_msgSend(v23, "appendBodySectionWithName:multilinePrefix:block:", v12, v15, v21);

    v10 = v22;
    goto LABEL_21;
  }
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v20, "succinctDescription");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v7, "appendObject:withName:", v10, v8);
      v12 = v8;
LABEL_21:

      goto LABEL_22;
    }
  }
  v17 = (id)objc_msgSend(v7, "appendObject:withName:", v20, v8);
  v12 = v8;
LABEL_22:

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id *v3;
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  _QWORD *v9;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  -[BSSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BSSettings isEmpty](self, "isEmpty"))
  {
    v7 = (id)objc_msgSend(v6, "appendObject:withName:", CFSTR("(empty)"), 0);
  }
  else
  {
    v8 = -[BSSettings isEmpty](self, "isEmpty");
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
      v11[3] = &unk_1E1EBE700;
      v9 = v11;
      v11[4] = self;
      v3 = &v12;
      v12 = v6;
    }
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);
    if (!v8)

  }
  return v6;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (void)_removeAllSettings
{
  BSMutableIntegerMap *settingToFlagMap;
  BSMutableIntegerMap *settingToObjectMap;

  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap)
    BSIntegerMapRemoveAllObjects(settingToFlagMap);
  settingToObjectMap = self->_settingToObjectMap;
  if (settingToObjectMap)
    BSIntegerMapRemoveAllObjects(settingToObjectMap);
}

- (BSSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  BSSettings *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[BSSettings init](self, "init");
    if (!self)
      goto LABEL_17;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@"),
      v7,
      v9);

    if (!self)
      goto LABEL_17;
  }
  v10 = v4;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "containsValueForKey:", CFSTR("flags")))
  {
    objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v23, CFSTR("flags"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "unsignedIntegerValue");
          objc_msgSend(v13, "objectForKey:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSSettings _setFlag:forSetting:]((uint64_t)self, objc_msgSend(v20, "BOOLValue"), v19);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

  }
  if (objc_msgSend(v10, "containsValueForKey:", CFSTR("objects")))
  {
    objc_msgSend(v10, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812C8], CFSTR("objects"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __28__BSSettings_initWithCoder___block_invoke;
    v24[3] = &unk_1E1EC0348;
    v25 = self;
    BSSettingsDecodeSettingEntries(v21, v24);

  }
LABEL_17:

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  BSMutableIntegerMap *settingToFlagMap;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BSMutableIntegerMap *settingToObjectMap;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    settingToFlagMap = self->_settingToFlagMap;
    if (settingToFlagMap)
    {
      v7 = BSIntegerMapCount(settingToFlagMap);
      if (v7)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v7);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __30__BSSettings_encodeWithCoder___block_invoke;
        v23[3] = &unk_1E1EC0400;
        v9 = v8;
        v24 = v9;
        -[BSSettings enumerateFlagsWithBlock:](self, "enumerateFlagsWithBlock:", v23);
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("flags"));

      }
    }
    settingToObjectMap = self->_settingToObjectMap;
    if (settingToObjectMap && BSIntegerMapCount(settingToObjectMap))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__10;
      v21 = __Block_byref_object_dispose__10;
      v22 = xpc_array_create(0, 0);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __30__BSSettings_encodeWithCoder___block_invoke_29;
      v16[3] = &unk_1E1EC0428;
      v16[4] = &v17;
      -[BSSettings enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v16);
      objc_msgSend(v5, "encodeXPCObject:forKey:", v18[5], CFSTR("objects"));
      _Block_object_dispose(&v17, 8);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@"),
      v5,
      v15);

  }
}

void __36__BSSettings_initWithXPCDictionary___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BSSettingsDecodeSettingObject(a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BSSettings _setObject:forSetting:](*(_QWORD *)(a1 + 32), v6, a2);
  }
  else
  {
    BSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[BSSettings initWithXPCDictionary:]_block_invoke";
      v10 = 2048;
      v11 = a2;
      _os_log_error_impl(&dword_18A184000, v7, OS_LOG_TYPE_ERROR, "%s Could not decode object for setting %llu", (uint8_t *)&v8, 0x16u);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __28__BSSettings_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BSSettingsDecodeSettingObject(a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BSSettings _setObject:forSetting:](*(_QWORD *)(a1 + 32), v6, a2);
  }
  else
  {
    BSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[BSSettings initWithCoder:]_block_invoke";
      v10 = 2048;
      v11 = a2;
      _os_log_error_impl(&dword_18A184000, v7, OS_LOG_TYPE_ERROR, "%s Could not decode object for setting %llu", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __30__BSSettings_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = a3 != 0x7FFFFFFFFFFFFFFFLL && a3 != 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8);

}

void __30__BSSettings_encodeWithCoder___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v5)
  {
    v6 = xpc_array_create(0, 0);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  BSSettingsEncodeAppendSettingArrayEntry(v5, a2, v9, &__block_literal_global_30_0);

}

id __30__BSSettings_encodeWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  BSSettingsEncodeSettingObject(a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  -[BSSettings _appendDescriptionForSetting:toBuilder:](*(id **)(a1 + 32), objc_msgSend(v3, "integerValue"), *(void **)(a1 + 40));

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  +[BSHashBuilder builder](BSHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_settingToFlagMap);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_settingToObjectMap);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)-[BSSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%llu)"), a3);
}

void __46__BSSettings__appendObject_toBuilder_forName___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), *(_QWORD *)(a1 + 40), 0, (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __46__BSSettings__appendObject_toBuilder_forName___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v6, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v7, v8, v9);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (id)basicDescriptionWithPrefix:(id)a3
{
  -[BSSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
