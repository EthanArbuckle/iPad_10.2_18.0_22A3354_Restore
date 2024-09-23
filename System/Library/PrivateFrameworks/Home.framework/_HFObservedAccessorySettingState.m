@implementation _HFObservedAccessorySettingState

+ (id)stateWithSettings:(id)a3 forSetting:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:setting:", v6, v5);

  return v7;
}

- (_HFObservedAccessorySettingState)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSettings_setting_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingAdapter.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[_HFObservedAccessorySettingState init]",
    v5);

  return 0;
}

- (_HFObservedAccessorySettingState)initWithSettings:(id)a3 setting:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _HFObservedAccessorySettingState *v11;
  _HFObservedAccessorySettingState *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSSet *v21;
  NSSet *selectionOptions;
  void *v24;
  void *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingAdapter.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingAdapter.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setting"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_HFObservedAccessorySettingState;
  v11 = -[_HFObservedAccessorySettingState init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_settings, a3);
    objc_storeStrong((id *)&v12->_setting, a4);
    objc_opt_class();
    v13 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v15, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_map:", &__block_literal_global_35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v21 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    selectionOptions = v12->_selectionOptions;
    v12->_selectionOptions = v21;

  }
  return v12;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_229 != -1)
    dispatch_once(&_MergedGlobals_229, &__block_literal_global_17_1);
  return (NAIdentity *)(id)qword_1ED378E30;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (HMSettings)settings
{
  return self->_settings;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (NSSet)selectionOptions
{
  return self->_selectionOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionOptions, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
