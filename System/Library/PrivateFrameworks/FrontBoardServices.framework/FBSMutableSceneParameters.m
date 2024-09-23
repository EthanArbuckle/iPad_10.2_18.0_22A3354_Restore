@implementation FBSMutableSceneParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSceneParameters initWithParameters:](+[FBSSceneParameters allocWithZone:](FBSSceneParameters, "allocWithZone:", a3), "initWithParameters:", self);
}

- (void)updateSettingsWithBlock:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBSMutableSceneParameters;
  -[FBSSceneParameters updateSettingsWithBlock:](&v3, sel_updateSettingsWithBlock_, a3);
}

- (void)setSettings:(id)a3
{
  void *v4;
  void *v5;
  FBSDisplayConfiguration *displayConfiguration;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBSMutableSceneParameters;
  -[FBSSceneParameters setSettings:](&v8, sel_setSettings_, a3);
  -[FBSSceneParameters settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    displayConfiguration = self->_displayConfiguration;

    if (displayConfiguration)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __41__FBSMutableSceneParameters_setSettings___block_invoke;
      v7[3] = &unk_1E38EC188;
      v7[4] = self;
      -[FBSMutableSceneParameters updateSettingsWithBlock:](self, "updateSettingsWithBlock:", v7);
    }
  }
}

uint64_t __41__FBSMutableSceneParameters_setSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_setSpecification:(id)a3
{
  objc_storeStrong((id *)&self->super._specification, a3);
}

- (void)updateClientSettingsWithBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    -[FBSSceneParameters clientSettings](self, "clientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    v4[2](v4, v6);
    -[FBSSceneParameters setClientSettings:](self, "setClientSettings:", v6);

  }
}

- (void)applySettings:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (!v5)
    goto LABEL_4;
  NSClassFromString(CFSTR("FBSSceneSettings"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__FBSMutableSceneParameters_applySettings___block_invoke;
    v6[3] = &unk_1E38EC188;
    v7 = v5;
    -[FBSMutableSceneParameters updateSettingsWithBlock:](self, "updateSettingsWithBlock:", v6);

LABEL_4:
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSMutableSceneParameters applySettings:].cold.1();
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __43__FBSMutableSceneParameters_applySettings___block_invoke(uint64_t a1, uint64_t a2)
{
  -[FBSSettings _applySettings:](a2, *(void **)(a1 + 32));
}

- (void)applyClientSettings:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (!v5)
    goto LABEL_4;
  NSClassFromString(CFSTR("FBSSceneClientSettings"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__FBSMutableSceneParameters_applyClientSettings___block_invoke;
    v6[3] = &unk_1E38EB318;
    v7 = v5;
    -[FBSMutableSceneParameters updateClientSettingsWithBlock:](self, "updateClientSettingsWithBlock:", v6);

LABEL_4:
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSMutableSceneParameters applyClientSettings:].cold.1();
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __49__FBSMutableSceneParameters_applyClientSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  -[FBSSettings _applySettings:](a2, *(void **)(a1 + 32));
}

- (void)applyParameters:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(v8, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSMutableSceneParameters applySettings:](self, "applySettings:", v5);

    objc_msgSend(v8, "clientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSMutableSceneParameters applyClientSettings:](self, "applyClientSettings:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mismatched specifications"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneParameters applyParameters:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setDisplay:(id)a3
{
  FBSDisplayConfiguration *v4;
  FBSDisplayConfiguration *displayConfiguration;
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (FBSDisplayConfiguration *)objc_msgSend(v6, "copy");
    displayConfiguration = self->_displayConfiguration;
    self->_displayConfiguration = v4;

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__FBSMutableSceneParameters_setDisplay___block_invoke;
  v8[3] = &unk_1E38EC188;
  v8[4] = self;
  -[FBSMutableSceneParameters updateSettingsWithBlock:](self, "updateSettingsWithBlock:", v8, v6);

}

uint64_t __40__FBSMutableSceneParameters_setDisplay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)applySettings:.cold.1()
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

- (void)applyClientSettings:.cold.1()
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

- (void)applyParameters:.cold.1()
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
