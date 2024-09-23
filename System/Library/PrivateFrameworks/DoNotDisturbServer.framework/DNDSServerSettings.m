@implementation DNDSServerSettings

- (void)setDefaultValues
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DNDSServerSettings;
  -[PTSettings setDefaultValues](&v2, sel_setDefaultValues);
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Intelligent Breakthrough"), CFSTR("forcedIntelligentBreakthrough"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = &unk_1E86DE4A8;
  v22[1] = &unk_1E86DE4C0;
  v23[0] = CFSTR("None");
  v23[1] = CFSTR("Yes");
  v22[2] = &unk_1E86DE4D8;
  v23[2] = CFSTR("No");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPossibleValues:", v4);

  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPossibleTitles:", v5);

  v6 = (void *)MEMORY[0x1E0D83078];
  v21 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Force Intelligent Breakthrough"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Restore Defaults"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v20 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  v19[0] = v8;
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("Focus"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)forcedIntelligentBreakthrough
{
  return self->_forcedIntelligentBreakthrough;
}

- (void)setForcedIntelligentBreakthrough:(int64_t)a3
{
  self->_forcedIntelligentBreakthrough = a3;
}

@end
