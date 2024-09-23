@implementation HMDSettingOnChangeAttachedUpdatesResult

- (HMDSettingOnChangeAttachedUpdatesResult)initWithSettingsToUpdate:(id)a3 models:(id)a4 onCommitCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDSettingOnChangeAttachedUpdatesResult *v11;
  void *v12;
  void *v13;
  void *v14;
  id onCommitCompletion;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDSettingOnChangeAttachedUpdatesResult;
  v11 = -[HMDSettingOnChangeAttachedUpdatesResult init](&v17, sel_init);
  if (v11)
  {
    v12 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_settingsToUpdate, v12);
    if (!v8)

    v13 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_modelsToUpdate, v13);
    if (!v9)

    v14 = _Block_copy(v10);
    onCommitCompletion = v11->_onCommitCompletion;
    v11->_onCommitCompletion = v14;

  }
  return v11;
}

- (NSArray)settingsToUpdate
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)modelsToUpdate
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (id)onCommitCompletion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onCommitCompletion, 0);
  objc_storeStrong((id *)&self->_modelsToUpdate, 0);
  objc_storeStrong((id *)&self->_settingsToUpdate, 0);
}

@end
