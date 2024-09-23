@implementation _UIKeyboardArbiterSceneFocusChange

+ (id)focusNothingChange
{
  if (_MergedGlobals_1 != -1)
    dispatch_once(&_MergedGlobals_1, &__block_literal_global);
  return (id)qword_253E78FF0;
}

- (_UIKeyboardArbiterSceneFocusChange)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  _UIKeyboardArbiterSceneFocusChange *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _UIKeyboardArbiterSceneFocusChange *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot -init _UIKeyboardArbiterSceneFocusChange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
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
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("_UIKeyboardArbiterSceneFocusChangeRequest.m");
    v17 = 1024;
    v18 = 89;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_21955F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (_UIKeyboardArbiterSceneFocusChange *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot +new _UIKeyboardArbiterSceneFocusChange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
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
    v16 = CFSTR("_UIKeyboardArbiterSceneFocusChangeRequest.m");
    v17 = 1024;
    v18 = 93;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_21955F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterSceneFocusChange;
  return -[_UIKeyboardArbiterSceneFocusChange init](&v3, sel_init);
}

- (_UIKeyboardArbiterSceneFocusChange)initWithSceneIdentity:(id)a3 pid:(int)a4
{
  id v7;
  _UIKeyboardArbiterSceneFocusChange *v8;
  _UIKeyboardArbiterSceneFocusChange *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIKeyboardArbiterSceneFocusChange;
  v8 = -[_UIKeyboardArbiterSceneFocusChange init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sceneIdentity, a3);
    v9->_pid = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[FBSSceneIdentityToken hash](self->_sceneIdentity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _UIKeyboardArbiterSceneFocusChange *v8;
  char v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8 == self)
  {
    v9 = 1;
  }
  else if (v8->_pid == self->_pid)
  {
    v9 = -[FBSSceneIdentityToken isEqual:](v8->_sceneIdentity, "isEqual:", self->_sceneIdentity);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE38388], "descriptionForRootObject:", self);
}

- (BOOL)_isFocusNothing
{
  return self->_isFocusNothing;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64___UIKeyboardArbiterSceneFocusChange_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_24DAA00C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (FBSSceneIdentityToken)sceneIdentity
{
  return self->_sceneIdentity;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
}

@end
