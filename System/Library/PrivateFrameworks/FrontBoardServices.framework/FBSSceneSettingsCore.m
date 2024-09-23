@implementation FBSSceneSettingsCore

- (FBSDisplayConfiguration)displayConfiguration
{
  return (FBSDisplayConfiguration *)-[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (CGRect)frame
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  CGRect result;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v9 = 0u;
  v10 = 0u;
  if (v2)
  {
    v4 = objc_retainAutorelease(v2);
    if (!strcmp((const char *)objc_msgSend(v4, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
      objc_msgSend(v4, "getValue:size:", &v9, 32);
  }

  v6 = *((double *)&v9 + 1);
  v5 = *(double *)&v9;
  v8 = *((double *)&v10 + 1);
  v7 = *(double *)&v10;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)interfaceOrientation
{
  void *v2;
  int64_t v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)isForeground
{
  void *v2;
  char v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)protocol
{
  return &unk_1EE3B4F80;
}

- (void)frame:(CGRect)a3
{
  void *v5;
  CGRect v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v6, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

}

- (void)setDisplayConfiguration:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("displayConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneSettingsCore setDisplayConfiguration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

  }
  else
  {
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  }
}

- (BOOL)isOccluded
{
  void *v2;
  char v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (char)activityMode
{
  void *v2;
  char v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (char)jetsamMode
{
  void *v2;
  char v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)interruptionPolicy
{
  void *v2;
  int64_t v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)prefersProcessTaskSuspensionWhileSceneForeground
{
  void *v2;
  char v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (double)level
{
  void *v2;
  double v3;
  double v4;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_CGFloatValue");
  v4 = v3;

  return v4;
}

- (void)setLevel:(double)a3
{
  id v6;

  if (BSFloatIsZero())
  {
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v6, a2);

  }
}

- (void)setForeground:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = *MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v3, a2);
}

- (void)setJetsamMode:(char)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

  }
  else
  {
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  }
}

- (BOOL)isClientFuture
{
  void *v2;
  char v3;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setInterruptionPolicy:(int64_t)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

  }
  else
  {
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  }
}

+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "matchesProperty:", sel_activityMode))
  {
    v8 = objc_msgSend(v6, "integerValue");
    v9 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromFBSSceneActivityMode(v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "matchesProperty:", sel_jetsamMode))
    {
      if (objc_msgSend(v7, "matchesProperty:", sel_interfaceOrientation))
      {
        objc_msgSend(v6, "integerValue");
        BSInterfaceOrientationDescription();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v7, "matchesProperty:", sel_interruptionPolicy))
        {
          v15 = objc_msgSend(v6, "integerValue");
          v16 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromFBSSceneInterruptionPolicy(v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ (%ld)"), v11, v15);
          goto LABEL_6;
        }
        if (objc_msgSend(v7, "matchesProperty:", sel_propagatedSettings))
        {
          v17 = objc_opt_class();
          v18 = v6;
          if (v17)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
          }
          else
          {
            v19 = 0;
          }
          v20 = v19;

          objc_msgSend(v20, "allKeys");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "allObjects");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_7;
        }
        v22.receiver = a1;
        v22.super_class = (Class)&OBJC_METACLASS___FBSSceneSettingsCore;
        objc_msgSendSuper2(&v22, sel_descriptionOfValue_forSetting_, v6, v7);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v14;
      goto LABEL_8;
    }
    v8 = objc_msgSend(v6, "integerValue");
    v9 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromFBSSceneJetsamMode(v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (%d)"), v10, v8);
LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
  return v12;
}

- (BSKeyedSettings)propagatedSettings
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FBSSceneSettingsCore_propagatedSettings__block_invoke;
  v6[3] = &unk_1E38EC0B8;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeyedObjectsWithBlock:", v6);

  return (BSKeyedSettings *)v4;
}

uint64_t __42__FBSSceneSettingsCore_propagatedSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)setPropagatedSettings:(id)a3
{
  id v5;
  _QWORD v6[5];

  v5 = a3;
  -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__FBSSceneSettingsCore_setPropagatedSettings___block_invoke;
  v6[3] = &unk_1E38EC0E0;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeyedObjectsWithBlock:", v6);

}

uint64_t __46__FBSSceneSettingsCore_setPropagatedSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addPropagatedSetting:");
}

- (void)setOccluded:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = *MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v3, a2);
}

- (void)setClientFuture:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = *MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v3, a2);
}

- (void)setActivityMode:(char)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

  }
  else
  {
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  }
}

- (void)setPrefersProcessTaskSuspensionWhileSceneForeground:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = *MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v3, a2);
}

- (FBSceneClientProcess)clientProcess
{
  return (FBSceneClientProcess *)-[FBSSceneSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (void)setClientProcess:(id)a3
{
  -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setDisplayConfiguration:.cold.1()
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
