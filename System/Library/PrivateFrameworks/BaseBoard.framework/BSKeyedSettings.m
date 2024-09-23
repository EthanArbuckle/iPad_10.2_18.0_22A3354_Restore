@implementation BSKeyedSettings

- (id)objectForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v5 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v4, 0);
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  -[BSSettings objectForSetting:](&v8, sel_objectForSetting_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_settingForKey:(int)a3 saveKey:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = objc_msgSend(v5, "hash");
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hash collision: '%@' and '%@' both hash to %lu"), v6, v8, v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            *(_DWORD *)buf = 138544642;
            v28 = v12;
            v29 = 2114;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v14;
            v31 = 2048;
            v32 = a1;
            v33 = 2114;
            v34 = CFSTR("BSKeyedSettings.m");
            v35 = 1024;
            v36 = 190;
            v37 = 2114;
            v38 = v11;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          __break(0);
          JUMPOUT(0x18A185BCCLL);
        }
        v9 = (uint64_t)v6;
      }
      else
      {
        if (!*(_QWORD *)(a1 + 32))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_keys != nil"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            *(_DWORD *)buf = 138544642;
            v28 = v16;
            v29 = 2114;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v18;
            v31 = 2048;
            v32 = a1;
            v33 = 2114;
            v34 = CFSTR("BSKeyedSettings.m");
            v35 = 1024;
            v36 = 183;
            v37 = 2114;
            v38 = v15;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
          __break(0);
          JUMPOUT(0x18A185CD0);
        }
        if (!*(_QWORD *)(a1 + 40))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_keyMap != nil"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            *(_DWORD *)buf = 138544642;
            v28 = v20;
            v29 = 2114;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v22;
            v31 = 2048;
            v32 = a1;
            v33 = 2114;
            v34 = CFSTR("BSKeyedSettings.m");
            v35 = 1024;
            v36 = 184;
            v37 = 2114;
            v38 = v19;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          __break(0);
          JUMPOUT(0x18A185DD4);
        }
        if (!objc_msgSend(v6, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[key length] > 0"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            *(_DWORD *)buf = 138544642;
            v28 = v24;
            v29 = 2114;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v26;
            v31 = 2048;
            v32 = a1;
            v33 = 2114;
            v34 = CFSTR("BSKeyedSettings.m");
            v35 = 1024;
            v36 = 185;
            v37 = 2114;
            v38 = v23;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
          __break(0);
          JUMPOUT(0x18A185ED8);
        }
        v9 = objc_msgSend(v6, "copy");

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v7);
      }

      v6 = (void *)v9;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __50__BSKeyedSettings_enumerateKeyedObjectsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[BSKeyedSettings _keyForSetting:](*(id **)(a1 + 32), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectForSetting:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, uint64_t))(v7 + 16))(v7, v9, v8, a3);

    v6 = v9;
  }

}

- (id)_keyForSetting:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[5], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BSKeyedSettings)initWithSettings:(id)a3
{
  id *v5;
  BSKeyedSettings *v6;
  uint64_t v7;
  NSMutableSet *keys;
  BSMutableIntegerMap *v9;
  BSMutableIntegerMap *keyMap;
  uint64_t v11;
  NSMutableSet *v12;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  BSKeyedSettings *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  if (v5)
  {
    NSClassFromString(CFSTR("BSKeyedSettings"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSKeyedSettingsClass]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v15;
        v21 = 2114;
        v22 = v17;
        v23 = 2048;
        v24 = self;
        v25 = 2114;
        v26 = CFSTR("BSKeyedSettings.m");
        v27 = 1024;
        v28 = 33;
        v29 = 2114;
        v30 = v14;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      __break(0);
      JUMPOUT(0x18A186D48);
    }
  }

  v18.receiver = self;
  v18.super_class = (Class)BSKeyedSettings;
  v6 = -[BSSettings initWithSettings:](&v18, sel_initWithSettings_, v5);
  if (v6)
  {
    if (v5)
    {
      v7 = objc_msgSend(v5[4], "mutableCopy");
      keys = v6->_keys;
      v6->_keys = (NSMutableSet *)v7;

      v9 = (BSMutableIntegerMap *)objc_msgSend(v5[5], "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v6->_keys;
      v6->_keys = (NSMutableSet *)v11;

      v9 = objc_alloc_init(BSMutableIntegerMap);
    }
    keyMap = v6->_keyMap;
    v6->_keyMap = v9;

  }
  return v6;
}

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)flagForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v5 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v4, 0);
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  v6 = -[BSSettings flagForSetting:](&v8, sel_flagForSetting_, v5);

  return (int64_t)v6;
}

- (id)allKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[BSIntegerMap allValues](self->_keyMap, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

void __48__BSKeyedSettings_enumerateKeyedFlagsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  -[BSKeyedSettings _keyForSetting:](*(id **)(a1 + 32), a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, objc_msgSend(*(id *)(a1 + 32), "flagForSetting:", a2), a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMap, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)enumerateKeyedObjectsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __50__BSKeyedSettings_enumerateKeyedObjectsWithBlock___block_invoke;
    v6[3] = &unk_1E1EBFFF0;
    v6[4] = self;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    -[BSSettings _enumerateSettingsForObjectsWithBlock:]((uint64_t)self, v6);

    v4 = v5;
  }

}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BSKeyedSettings;
  -[BSSettings encodeWithXPCDictionary:](&v6, sel_encodeWithXPCDictionary_, v4);
  -[NSMutableSet allObjects](self->_keys, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    BSSerializeCFValueToXPCDictionaryWithKey((uint64_t)v5, v4, "BSKeys");

}

- (BSKeyedSettings)initWithXPCDictionary:(id)a3
{
  id v4;
  BSKeyedSettings *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  v5 = -[BSSettings initWithXPCDictionary:](&v8, sel_initWithXPCDictionary_, v4);
  if (v5)
  {
    v6 = (void *)BSCreateDeserializedCFValueFromXPCDictionaryWithKey(v4, "BSKeys");
    -[BSKeyedSettings _addDecodedKeys:]((id *)&v5->super.super.isa, v6);

  }
  return v5;
}

- (void)_addDecodedKeys:(id *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  if (!a1[4] || !a1[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_keys && _keyMap"), v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__addDecodedKeys_);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v21 = v11;
      v22 = 2114;
      v23 = (uint64_t)v13;
      v24 = 2048;
      v25 = a1;
      v26 = 2114;
      v27 = CFSTR("BSKeyedSettings.m");
      v28 = 1024;
      v29 = 198;
      v30 = 2114;
      v31 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A19BA28);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v14;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "hash");
        if (-[BSSettings _hasValueForSetting:](a1, v8))
        {
          objc_msgSend(a1[4], "addObject:", v7);
          objc_msgSend(a1[5], "setObject:forKey:", v7, v8);
        }
        else
        {
          BSLogCommon();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v21 = v7;
            v22 = 2048;
            v23 = v8;
            _os_log_error_impl(&dword_18A184000, v9, OS_LOG_TYPE_ERROR, "No value decoded for key \"%@\" (%llu). Ignoring.", buf, 0x16u);
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (BOOL)isKeyedSettings
{
  return 1;
}

- (void)enumerateKeyedFlagsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __48__BSKeyedSettings_enumerateKeyedFlagsWithBlock___block_invoke;
    v6[3] = &unk_1E1EBFFF0;
    v6[4] = self;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    -[BSSettings _enumerateSettingsForFlagsWithBlock:]((uint64_t)self, v6);

    v4 = v5;
  }

}

- (void)_applyToSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)BSKeyedSettings;
    -[BSSettings _applyToSettings:](&v13, sel__applyToSettings_, v4);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[BSKeyedSettings allKeys](self, "allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)v4, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v7;

  v4 = a3;
  v5 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v4, 0);
  v7.receiver = self;
  v7.super_class = (Class)BSKeyedSettings;
  LOBYTE(self) = -[BSSettings BOOLForSetting:](&v7, sel_BOOLForSetting_, v5);

  return (char)self;
}

- (id)keyForSetting:(unint64_t)a3
{
  return -[BSKeyedSettings _keyForSetting:]((id *)&self->super.super.isa, a3);
}

- (void)_removeAllSettings
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSKeyedSettings;
  -[BSSettings _removeAllSettings](&v3, sel__removeAllSettings);
  -[BSMutableIntegerMap removeAllObjects](self->_keyMap, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_keys, "removeAllObjects");
}

- (id)_sortedSettingsForDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  -[BSIntegerMap allValues](self->_keyMap, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke;
  v9[3] = &unk_1E1EC0018;
  v9[4] = self;
  objc_msgSend(v4, "sortUsingComparator:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke_2;
  v8[3] = &unk_1E1EC0040;
  v8[4] = self;
  objc_msgSend(v4, "bs_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int isKindOfClass;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LODWORD(a1) = objc_opt_isKindOfClass();

  if (((isKindOfClass ^ a1) & 1) != 0)
  {
    if ((isKindOfClass & 1) != 0)
      v10 = 1;
    else
      v10 = -1;
  }
  else
  {
    v10 = objc_msgSend(v5, "compare:", v6);
  }

  return v10;
}

id __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BSKeyedSettings _settingForKey:saveKey:](*(_QWORD *)(a1 + 32), v3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  return -[BSKeyedSettings _keyForSetting:]((id *)&self->super.super.isa, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSKeyedSettings)initWithCoder:(id)a3
{
  id v4;
  BSKeyedSettings *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  v5 = -[BSSettings initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("BSKeys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSKeyedSettings _addDecodedKeys:]((id *)&v5->super.super.isa, v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BSKeyedSettings;
  -[BSSettings encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NSMutableSet allObjects](self->_keys, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("BSKeys"));

}

@end
