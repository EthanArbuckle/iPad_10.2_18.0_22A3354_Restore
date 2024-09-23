@implementation FBSMutableSceneClientSettings

- (void)addLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  NSClassFromString(CFSTR("FBSSceneLayer"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneClientSettings addLayer:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DBD84);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneLayerClass]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneClientSettings addLayer:].cold.1();
    goto LABEL_11;
  }

  -[FBSSettings valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", sel_layers, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    -[FBSSettings setValue:forProperty:](self, "setValue:forProperty:", v4, sel_layers);
  }
  objc_msgSend(v8, "capture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

- (void)_applySafeValuesFromUntrustedSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "preferredLevel");
  -[FBSMutableSceneClientSettings setPreferredLevel:](self, "setPreferredLevel:");
  -[FBSMutableSceneClientSettings setPreferredInterfaceOrientation:](self, "setPreferredInterfaceOrientation:", objc_msgSend(v4, "preferredInterfaceOrientation"));
  objc_msgSend(v4, "preferredSceneHostIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSMutableSceneClientSettings setPreferredSceneHostIdentifier:](self, "setPreferredSceneHostIdentifier:", v5);

  objc_msgSend(v4, "preferredSceneHostIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSMutableSceneClientSettings setPreferredSceneHostIdentity:](self, "setPreferredSceneHostIdentity:", v6);

  -[FBSSettings _legacyOtherSettings]((uint64_t)self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllSettings");
  -[FBSSettings _legacyOtherSettings]((uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applySettings:", v7);

  -[FBSSettings _legacyLocalSettings]((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllSettings");
  -[FBSSettings _legacyLocalSettings]((uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "applySettings:", v9);
}

- (void)removeLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  NSClassFromString(CFSTR("FBSSceneLayer"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneClientSettings removeLayer:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F99ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneLayerClass]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneClientSettings removeLayer:].cold.1();
    goto LABEL_11;
  }

  -[FBSSettings valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", sel_layers, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", 0, v5);

  }
}

- (void)removeAllLayers
{
  -[FBSSettings setValue:forProperty:](self, "setValue:forProperty:", 0, sel_layers);
}

- (void)addLayer:.cold.1()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)removeLayer:.cold.1()
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
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
