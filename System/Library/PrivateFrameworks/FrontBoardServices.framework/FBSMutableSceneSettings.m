@implementation FBSMutableSceneSettings

- (id)ignoreOcclusionReasons
{
  NSSet *ignoreOcclusionReasons;
  NSSet *v4;
  NSSet *v5;

  ignoreOcclusionReasons = self->super._ignoreOcclusionReasons;
  if (!ignoreOcclusionReasons)
  {
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->super._ignoreOcclusionReasons;
    self->super._ignoreOcclusionReasons = v4;

    ignoreOcclusionReasons = self->super._ignoreOcclusionReasons;
  }
  return ignoreOcclusionReasons;
}

- (void)addPropagatedProperty:(SEL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)objc_opt_class();
  FBSSettingForSelector(v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = (id)v6;
    -[FBSMutableSceneSettings addPropagatedSetting:](self, "addPropagatedSetting:", v6);

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("no setting for %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings addPropagatedProperty:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)removePropagatedProperty:(SEL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)objc_opt_class();
  FBSSettingForSelector(v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = (id)v6;
    -[FBSMutableSceneSettings removePropagatedSetting:](self, "removePropagatedSetting:", v6);

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("no setting for %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings removePropagatedProperty:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)addPropagatedSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSMutableSceneSettings addPropagatedSettings:](self, "addPropagatedSettings:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("setting != ((void *)0)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings addPropagatedSetting:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)removePropagatedSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSMutableSceneSettings removePropagatedSettings:](self, "removePropagatedSettings:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("setting != ((void *)0)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings removePropagatedSetting:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)addPropagatedSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[FBSSettings valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", sel_propagatedSettings, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (void *)objc_opt_new();
      -[FBSSettings setValue:forProperty:](self, "setValue:forProperty:", v5, sel_propagatedSettings);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          NSClassFromString(CFSTR("FBSSetting"));
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSMutableSceneSettings addPropagatedSettings:].cold.1();
            objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7136F4);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSettingClass]"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSMutableSceneSettings addPropagatedSettings:].cold.1();
            objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A713758);
          }

          -[FBSSetting name]((uint64_t)v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

- (void)removePropagatedSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[FBSSettings valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", sel_propagatedSettings, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v10);
            NSClassFromString(CFSTR("FBSSetting"));
            if (!v11)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                -[FBSMutableSceneSettings removePropagatedSettings:].cold.1();
              objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A713950);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSettingClass]"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                -[FBSMutableSceneSettings removePropagatedSettings:].cold.1();
              objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7139B4);
            }

            -[FBSSetting name]((uint64_t)v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", 0, v12);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)addPropagatedProperty:.cold.1()
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

- (void)removePropagatedProperty:.cold.1()
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

- (void)addPropagatedSetting:.cold.1()
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

- (void)removePropagatedSetting:.cold.1()
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

- (void)addPropagatedSettings:.cold.1()
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

- (void)removePropagatedSettings:.cold.1()
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

@end
