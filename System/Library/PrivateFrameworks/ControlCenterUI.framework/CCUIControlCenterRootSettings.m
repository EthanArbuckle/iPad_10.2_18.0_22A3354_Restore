@implementation CCUIControlCenterRootSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIControlCenterRootSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[CCUIControlCenterRootSettings editingSettings](self, "editingSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Editing"), CFSTR("editingSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:action:", CFSTR("Restore Defaults"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83078];
  v14[0] = v4;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "moduleWithTitle:contents:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CCUIEditingSettings)editingSettings
{
  return self->_editingSettings;
}

- (void)setEditingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_editingSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingSettings, 0);
}

@end
