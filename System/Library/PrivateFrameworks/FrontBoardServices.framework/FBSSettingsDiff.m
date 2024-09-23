@implementation FBSSettingsDiff

- (FBSSettingsDiff)initWithChangesFromSettings:(id)a3 toSettings:(id)a4
{
  id *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FBSSettingsDiff *v20;
  void *v21;
  FBSSettingsDiff *result;
  void *v23;
  void *v24;
  void *v25;

  v6 = (id *)a3;
  v7 = (id *)a4;
  if (v6 == v7)
  {
    v20 = 0;
    goto LABEL_12;
  }
  -[FBSSettings _settings:](v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _settings:](v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E98, "diffFromSettings:toSettings:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBSSettings _legacyOtherSettings:](v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _legacyOtherSettings:](v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E98, "diffFromSettings:toSettings:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBSSettings _localSettings:](v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _localSettings:](v7, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E98, "diffFromSettings:toSettings:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBSSettings _legacyLocalSettings:](v6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _legacyLocalSettings:](v7, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E98, "diffFromSettings:toSettings:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (BSSettingsDiffIsEmpty()
    && BSSettingsDiffIsEmpty()
    && BSSettingsDiffIsEmpty()
    && (BSSettingsDiffIsEmpty() & 1) != 0)
  {
    v20 = 0;
LABEL_10:

LABEL_12:
    return v20;
  }
  v21 = (void *)objc_opt_class();
  if (!objc_msgSend(v21, "isSubclassOfClass:", objc_msgSend(v21, "_mutableClass"))
    || (v21 = (void *)objc_msgSend(v21, "_counterpartClass")) != 0)
  {
    self = -[FBSSettingsDiff _initWithSettingsDiff:localDiff:legacyDiff:legacyLocalDiff:settingsClass:]((id *)&self->super.isa, v10, v16, v13, v19, v21);
    v20 = self;
    goto LABEL_10;
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("no counterpart class set for %@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSSettingsDiff initWithChangesFromSettings:toSettings:].cold.1();
  objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
  result = (FBSSettingsDiff *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithSettingsDiff:(void *)a3 localDiff:(void *)a4 legacyDiff:(void *)a5 legacyLocalDiff:(void *)a6 settingsClass:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  objc_super v18;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)FBSSettingsDiff;
    v16 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 4, a5);
      a1[5] = a6;
    }
  }

  return a1;
}

- (void)evaluateWithInspector:(id)a3 context:(void *)a4
{
  objc_msgSend(a3, "inspectDiff:withContext:", self, a4);
}

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((id)objc_opt_class() == a1)
  {
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "_diffClass");
    if (!v9)
      v9 = (void *)objc_msgSend((id)objc_opt_class(), "_diffClass");
    objc_msgSend(v9, "diffFromSettings:toSettings:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)a1), "initWithChangesFromSettings:toSettings:", v6, v7);
  }
  v10 = (void *)v8;

  return v10;
}

- (FBSSettingsDiff)initWithXPCDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  Class v8;
  FBSSettingsDiff *v9;

  objc_msgSend(off_1E38E9EA8, "coderWithMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainDiff"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherDiff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsClass"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSClassFromString(v7);
  if (BSSettingsDiffIsEmpty() && (BSSettingsDiffIsEmpty() & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    self = -[FBSSettingsDiff _initWithSettingsDiff:localDiff:legacyDiff:legacyLocalDiff:settingsClass:]((id *)&self->super.isa, v5, 0, v6, 0, v8);
    v9 = self;
  }

  return v9;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(off_1E38E9EA8, "coderWithMessage:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_diff, CFSTR("mainDiff"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_legacyDiff, CFSTR("otherDiff"));
  NSStringFromClass(self->_settingsClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("settingsClass"));

}

- (id)settingsByApplyingToMutableCopyOfSettings:(id)a3
{
  id v4;
  objc_class *v5;
  Class settingsClass;
  id v7;
  void *v8;

  v4 = a3;
  if (!v4)
  {
    v5 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_settingsClass");
    settingsClass = self->_settingsClass;
    if (settingsClass && -[objc_class isSubclassOfClass:](settingsClass, "isSubclassOfClass:", v5))
      v7 = (id)objc_msgSend(objc_alloc(self->_settingsClass), "initWithSettings:", 0);
    else
      v7 = objc_alloc_init(v5);
    v4 = v7;
  }
  v8 = (void *)objc_msgSend(v4, "mutableCopy");
  -[FBSSettingsDiff applyToMutableSettings:](self, "applyToMutableSettings:", v8);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedLegacySettings, 0);
  objc_storeStrong((id *)&self->_changedSettings, 0);
  objc_storeStrong((id *)&self->_legacyLocalDiff, 0);
  objc_storeStrong((id *)&self->_localDiff, 0);
  objc_storeStrong((id *)&self->_legacyDiff, 0);
  objc_storeStrong((id *)&self->_diff, 0);
}

- (BOOL)containsProperty:(SEL)a3
{
  Class settingsClass;
  void *v6;
  BOOL v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;

  settingsClass = self->_settingsClass;
  if (!settingsClass)
    settingsClass = (Class)objc_msgSend((id)objc_opt_class(), "_settingsClass");
  FBSSettingForSelector(settingsClass, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (-[FBSSettingsDiff _containsSetting:](self, v6) & 1) == 0)
  {
    if ((Class)-[objc_class _baseClass](settingsClass, "_baseClass") == settingsClass
      || -[FBSSetting isLegacy]((_BOOL8)v6)
      || (FBSSubclassHasBeenIngested(settingsClass) & 1) == 0
      && ((v10 = -[objc_class instanceMethodForSelector:](settingsClass, "instanceMethodForSelector:", a3),
           v10 == MEMORY[0x1E0DE79B8])
       || v10 == objc_msgSend((id)-[objc_class _baseClass](settingsClass, "_baseClass"), "instanceMethodForSelector:", a3))|| (FBSSettingForLegacySelector(settingsClass, a3), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v6)
      {
        v7 = 0;
        goto LABEL_17;
      }
      NSStringFromSelector(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[FBSSettingsDiff _containsAnySettingNamed:]((uint64_t)self, v8);
    }
    else
    {
      v8 = v11;
      v9 = -[FBSSettingsDiff _containsSetting:](self, v11);
    }
    v7 = v9;

    goto LABEL_17;
  }
  v7 = 1;
LABEL_17:

  return v7;
}

- (uint64_t)_containsSetting:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("setting != ((void *)0)"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSSettingsDiff _containsSetting:].cold.1();
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6E07ECLL);
    }
    if (-[FBSSetting isLegacy]((_BOOL8)v3))
      -[FBSSettingsDiff _allLegacySettings](a1);
    else
      -[FBSSettingsDiff _allModernSettings](a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __42__FBSSettingsDiff__inspectDiff_withBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  v5 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[5] + 16))();
    -[FBSSettingsDiff _inspectDiff:withBlock:](a1[4], v5, a1[5]);
  }

}

- (void)_inspectDiff:(void *)a3 withBlock:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__FBSSettingsDiff__inspectDiff_withBlock___block_invoke;
    v8[3] = &unk_1E38EC328;
    v10 = v11;
    v8[4] = a1;
    v9 = v6;
    objc_msgSend(v5, "inspectKeyedChangesWithBlock:", v8);

    _Block_object_dispose(v11, 8);
  }

}

- (void)inspectChangesWithBlock:(id)a3
{
  BSSettingsDiff *diff;
  id v5;

  if (a3)
  {
    diff = self->_diff;
    v5 = a3;
    -[FBSSettingsDiff _inspectDiff:withBlock:]((uint64_t)self, diff, v5);
    -[FBSSettingsDiff _inspectDiff:withBlock:]((uint64_t)self, self->_localDiff, v5);

  }
}

- (void)inspectOtherChangesWithBlock:(id)a3
{
  BSSettingsDiff *legacyDiff;
  id v5;

  if (a3)
  {
    legacyDiff = self->_legacyDiff;
    v5 = a3;
    -[BSSettingsDiff inspectChangesWithBlock:](legacyDiff, "inspectChangesWithBlock:", v5);
    -[BSSettingsDiff inspectChangesWithBlock:](self->_legacyLocalDiff, "inspectChangesWithBlock:", v5);

  }
}

- (BOOL)_isSignifcant
{
  if (BSSettingsDiffIsEmpty())
    return BSSettingsDiffIsEmpty() ^ 1;
  else
    return 1;
}

- (FBSSettingsDiff)init
{
  return -[FBSSettingsDiff initWithChangesFromSettings:toSettings:](self, "initWithChangesFromSettings:toSettings:", 0, 0);
}

- (uint64_t)_containsAnySettingNamed:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
LABEL_9:

    return a1;
  }
  if (v3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v16 = -[FBSSettingsDiff _containsKey:](a1, v3);
    if (*((_BYTE *)v14 + 24))
    {
      a1 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_legacyDescriptionProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __44__FBSSettingsDiff__containsAnySettingNamed___block_invoke;
        v9[3] = &unk_1E38EC300;
        v12 = &v13;
        v10 = v5;
        v11 = v4;
        objc_msgSend((id)a1, "inspectOtherChangesWithBlock:", v9);

      }
      a1 = *((_BYTE *)v14 + 24) != 0;
    }
    _Block_object_dispose(&v13, 8);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingName != ((void *)0)"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSSettingsDiff _containsAnySettingNamed:].cold.1(sel__containsAnySettingNamed_);
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)containsSetting:(id)a3
{
  return -[FBSSettingsDiff _containsSetting:](self, a3);
}

- (BOOL)containsSettingNamed:(id)a3
{
  return -[FBSSettingsDiff _containsKey:]((uint64_t)self, a3);
}

- (uint64_t)_containsKey:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t result;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_6;
  if (v3)
  {
    if ((objc_msgSend(*(id *)(a1 + 8), "settingChangedForKey:", v3) & 1) != 0)
      a1 = 1;
    else
      a1 = objc_msgSend(*(id *)(a1 + 24), "settingChangedForKey:", v4);
LABEL_6:

    return a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("key != ((void *)0)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSSettingsDiff _containsKey:].cold.1();
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)containsPropertyFromExtension:(Class)a3
{
  Class settingsClass;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    settingsClass = self->_settingsClass;
    if (!settingsClass)
      settingsClass = (Class)objc_msgSend((id)objc_opt_class(), "_settingsClass");
    if (-[objc_class isSubclassOfClass:](settingsClass, "isSubclassOfClass:", objc_opt_class()))
      -[objc_class settingsExtensions](a3, "settingsExtensions");
    else
      -[objc_class clientSettingsExtensions](a3, "clientSettingsExtensions");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          NSStringFromClass(*(Class *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[FBSSettingsDiff _containsKey:]((uint64_t)self, v12);

          if ((v13 & 1) != 0)
          {
            v7 = 1;
            goto LABEL_18;
          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_18:

  }
  else
  {
    NSStringFromClass(a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[FBSSettingsDiff _containsKey:]((uint64_t)self, v6);
  }

  return v7;
}

- (BOOL)containsLegacySetting:(unint64_t)a3
{
  Class settingsClass;
  void *v6;
  char v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  settingsClass = self->_settingsClass;
  if (!settingsClass)
    settingsClass = (Class)objc_msgSend((id)objc_opt_class(), "_settingsClass");
  FBSSettingForLegacySetting(settingsClass, (const void *)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[FBSSettingsDiff _containsSetting:](self, v6);
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__FBSSettingsDiff_containsLegacySetting___block_invoke;
    v10[3] = &unk_1E38EC2D8;
    v10[4] = &v11;
    v10[5] = a3;
    v8 = (void *)MEMORY[0x19AECA324](v10);
    -[BSSettingsDiff inspectChangesWithBlock:](self->_legacyDiff, "inspectChangesWithBlock:", v8);
    -[BSSettingsDiff inspectChangesWithBlock:](self->_legacyLocalDiff, "inspectChangesWithBlock:", v8);
    v7 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

uint64_t __41__FBSSettingsDiff_containsLegacySetting___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 40) == a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)changedSettings
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettingsDiff _allModernSettings](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[FBSSettingsDiff _allLegacySettings](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  return v3;
}

- (id)_allModernSettings
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, NSString *);
  void *v12;
  id v13;
  uint64_t v14;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!*((_QWORD *)v1 + 6))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *((_QWORD *)v1 + 5);
      if (!v3)
        v3 = objc_msgSend((id)objc_opt_class(), "_settingsClass");
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __37__FBSSettingsDiff__allModernSettings__block_invoke;
      v12 = &unk_1E38EC350;
      v14 = v3;
      v4 = v2;
      v13 = v4;
      v5 = (void *)MEMORY[0x19AECA324](&v9);
      objc_msgSend(v1, "inspectChangesWithBlock:", v5, v9, v10, v11, v12);
      v6 = objc_msgSend(v4, "copy");
      v7 = (void *)*((_QWORD *)v1 + 6);
      *((_QWORD *)v1 + 6) = v6;

    }
    objc_sync_exit(v1);

    a1 = *((id *)v1 + 6);
  }
  return a1;
}

- (id)_allLegacySettings
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, const void *);
  void *v12;
  id v13;
  uint64_t v14;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!*((_QWORD *)v1 + 7))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *((_QWORD *)v1 + 5);
      if (!v3)
        v3 = objc_msgSend((id)objc_opt_class(), "_settingsClass");
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __37__FBSSettingsDiff__allLegacySettings__block_invoke;
      v12 = &unk_1E38EC378;
      v14 = v3;
      v4 = v2;
      v13 = v4;
      v5 = (void *)MEMORY[0x19AECA324](&v9);
      objc_msgSend(v1, "inspectOtherChangesWithBlock:", v5, v9, v10, v11, v12);
      v6 = objc_msgSend(v4, "copy");
      v7 = (void *)*((_QWORD *)v1 + 7);
      *((_QWORD *)v1 + 7) = v6;

    }
    objc_sync_exit(v1);

    a1 = *((id *)v1 + 7);
  }
  return a1;
}

- (NSString)description
{
  return (NSString *)-[FBSSettingsDiff descriptionWithMultilinePrefix:](&self->super.isa, 0);
}

- (id)descriptionWithMultilinePrefix:(Class *)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    -[FBSSettingsDiff descriptionBuilderWithMultilinePrefix:](a1, a2);
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

+ (Class)_settingsClass
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  Class result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requires concrete implementation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("FBSSettingsDiff.m");
    v17 = 1024;
    v18 = 170;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __44__FBSSettingsDiff__containsAnySettingNamed___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "keyDescriptionForSetting:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v4)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __37__FBSSettingsDiff__allModernSettings__block_invoke(uint64_t a1, NSString *aSelectorName)
{
  void *v3;
  SEL v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 40);
  v4 = NSSelectorFromString(aSelectorName);
  FBSSettingForExtensionSelector(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v5 = v6;
  }

}

void __37__FBSSettingsDiff__allLegacySettings__block_invoke(uint64_t a1, const void *a2)
{
  void *v3;
  void *v4;

  FBSSettingForLegacySetting(*(void **)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (void)applyToMutableSettings:(id)a3
{
  uint64_t v4;
  BSSettingsDiff *diff;
  void *v6;
  BSSettingsDiff *legacyDiff;
  void *v8;
  BSSettingsDiff *localDiff;
  void *v10;
  BSSettingsDiff *legacyLocalDiff;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "_settingsClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input %@ is not of expected class %@"), objc_opt_class(), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettingsDiff applyToMutableSettings:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7194B8);
  }
  if (!-[FBSSettings _isMutable]((_BOOL8)v14))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("settings must be mutable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSettingsDiff applyToMutableSettings:].cold.1();
    goto LABEL_9;
  }
  diff = self->_diff;
  -[FBSSettings _settings]((uint64_t)v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSSettingsDiff applyToSettings:](diff, "applyToSettings:", v6);

  legacyDiff = self->_legacyDiff;
  objc_msgSend(v14, "otherSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSSettingsDiff applyToSettings:](legacyDiff, "applyToSettings:", v8);

  localDiff = self->_localDiff;
  -[FBSSettings _localSettings]((uint64_t)v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSSettingsDiff applyToSettings:](localDiff, "applyToSettings:", v10);

  legacyLocalDiff = self->_legacyLocalDiff;
  -[FBSSettings _legacyLocalSettings]((uint64_t)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSSettingsDiff applyToSettings:](legacyLocalDiff, "applyToSettings:", v12);

}

- (Class)descriptionBuilderWithMultilinePrefix:(Class *)a1
{
  Class *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(off_1E38E9DF0, "builderWithObject:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v2[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, 0, 1);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__FBSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke;
    v10[3] = &unk_1E38EAE08;
    v10[4] = v2;
    v7 = v4;
    v11 = v7;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v10);

    v8 = v11;
    v2 = (Class *)v7;

  }
  return v2;
}

uint64_t __57__FBSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  void *v17;
  void *v18;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    v3 = objc_msgSend(*(id *)(v2 + 8), "isEmpty");
    v2 = *(_QWORD *)(a1 + 32);
    if ((v3 & 1) == 0)
    {
      v4 = *(void **)(v2 + 8);
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_settingsClass"), "_descriptionProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDescriptionProvider:", v5);

      v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("settings"));
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_QWORD *)(v2 + 16))
  {
    v7 = objc_msgSend(*(id *)(v2 + 16), "isEmpty");
    v2 = *(_QWORD *)(a1 + 32);
    if ((v7 & 1) == 0)
    {
      v8 = *(void **)(v2 + 16);
      objc_msgSend(*(id *)(v2 + 40), "_legacyDescriptionProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDescriptionProvider:", v9);

      v10 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("subclassSettings"));
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_QWORD *)(v2 + 24))
  {
    v11 = objc_msgSend(*(id *)(v2 + 24), "isEmpty");
    v2 = *(_QWORD *)(a1 + 32);
    if ((v11 & 1) == 0)
    {
      v12 = *(void **)(v2 + 24);
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_settingsClass"), "_descriptionProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDescriptionProvider:", v13);

      v14 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("localSettings"));
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  result = *(_QWORD *)(v2 + 32);
  if (result)
  {
    result = objc_msgSend((id)result, "isEmpty");
    if ((result & 1) == 0)
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 32);
      objc_msgSend(*(id *)(v16 + 40), "_legacyDescriptionProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDescriptionProvider:", v18);

      return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("subclassLocalSettings"));
    }
  }
  return result;
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  return 0;
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
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

- (void)initWithChangesFromSettings:toSettings:.cold.1()
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

- (void)_containsSetting:.cold.1()
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

- (void)_containsAnySettingNamed:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_containsKey:.cold.1()
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

- (void)applyToMutableSettings:.cold.1()
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

- (void)applyToMutableSettings:.cold.2()
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
