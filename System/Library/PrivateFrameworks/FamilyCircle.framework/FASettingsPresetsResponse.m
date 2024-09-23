@implementation FASettingsPresetsResponse

- (FASettingsPresetsResponse)initWithAvailablePresets:(id)a3 expectedPreset:(id)a4 currentPreset:(id)a5
{
  id v8;
  id v9;
  id v10;
  FASettingsPresetsResponse *v11;
  FASettingsPresetsResponse *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FASettingsPresetsResponse;
  v11 = -[FASettingsPresetsResponse init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v8)
      v13 = v8;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v11->_availablePresets, v13);
    objc_storeStrong((id *)&v12->_expectedPreset, a4);
    objc_storeStrong((id *)&v12->_currentPreset, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *availablePresets;
  id v5;
  void *v6;
  FASettingsPreset *expectedPreset;
  void *v8;
  FASettingsPreset *currentPreset;
  id v10;

  availablePresets = self->_availablePresets;
  v5 = a3;
  NSStringFromSelector(sel_availablePresets);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", availablePresets, v6);

  expectedPreset = self->_expectedPreset;
  NSStringFromSelector(sel_expectedPreset);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", expectedPreset, v8);

  currentPreset = self->_currentPreset;
  NSStringFromSelector(sel_currentPreset);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", currentPreset, v10);

}

- (FASettingsPresetsResponse)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  FASettingsPresetsResponse *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_availablePresets);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  NSStringFromSelector(sel_expectedPreset);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  NSStringFromSelector(sel_currentPreset);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[FASettingsPresetsResponse initWithAvailablePresets:expectedPreset:currentPreset:](self, "initWithAvailablePresets:expectedPreset:currentPreset:", v9, v12, v15);
  return v16;
}

- (NSArray)availablePresets
{
  return self->_availablePresets;
}

- (FASettingsPreset)expectedPreset
{
  return self->_expectedPreset;
}

- (FASettingsPreset)currentPreset
{
  return self->_currentPreset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_expectedPreset, 0);
  objc_storeStrong((id *)&self->_availablePresets, 0);
}

@end
