@implementation AMMotionDetectionSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMMotionDetectionSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[AMMotionDetectionSettings setEnabledTriggers:](self, "setEnabledTriggers:", 128);
}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  id v5;
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
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __53__AMMotionDetectionSettings_settingsControllerModule__block_invoke;
  v20 = &unk_25075F8D0;
  v21 = v3;
  v22 = a1;
  v5 = v3;
  objc_msgSend(v4, "_enumerateTriggerTypes:", &v17);
  objc_msgSend(MEMORY[0x24BE7B338], "sectionWithRows:title:", v5, CFSTR("Enabled Triggers"), v17, v18, v19, v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE7B300];
  objc_msgSend(MEMORY[0x24BE7B358], "actionWithSettingsKeyPath:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:action:", CFSTR("Restore Defaults"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE7B338];
  v24[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BE7B338];
  v23[0] = v6;
  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Motion Detection"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __53__AMMotionDetectionSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BE7B388];
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "_keyPathForTriggerTypeName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

+ (id)_keyPathForTriggerTypeName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", &stru_250760100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("triggerType%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)enabledTriggers
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__AMMotionDetectionSettings_enabledTriggers__block_invoke;
  v6[3] = &unk_25075F8F8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "_enumerateTriggerTypes:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __44__AMMotionDetectionSettings_enabledTriggers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend((id)objc_opt_class(), "_keyPathForTriggerTypeName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "BOOLValue");

  if ((_DWORD)v5)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v9, "unsignedIntegerValue");

}

- (void)setEnabledTriggers:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  v5 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__AMMotionDetectionSettings_setEnabledTriggers___block_invoke;
  v6[3] = &unk_25075F8D0;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "_enumerateTriggerTypes:", v6);
}

void __48__AMMotionDetectionSettings_setEnabledTriggers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (objc_msgSend(a3, "unsignedIntegerValue") & v5) != 0;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_keyPathForTriggerTypeName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:forKey:", v10, v9);
}

+ (void)_enumerateTriggerTypes:(id)a3
{
  void (**v3)(id, void *, void *);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, void *, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(&unk_2507626D8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(&unk_2507626D8);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v3[2](v3, v9, v10);

      }
      v5 = objc_msgSend(&unk_2507626D8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)triggerTypeThresholdLow
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setTriggerTypeThresholdLow:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)triggerTypeThresholdMedium
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setTriggerTypeThresholdMedium:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)triggerTypeThresholdHigh
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setTriggerTypeThresholdHigh:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (BOOL)triggerTypeFilteredThresholdLow
{
  return *(&self->super.__isObservingChildren + 4);
}

- (void)setTriggerTypeFilteredThresholdLow:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (BOOL)triggerTypeFilteredThresholdMedium
{
  return *(&self->super.__isObservingChildren + 5);
}

- (void)setTriggerTypeFilteredThresholdMedium:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

- (BOOL)triggerTypeFilteredThresholdHigh
{
  return self->_triggerTypeThresholdLow;
}

- (void)setTriggerTypeFilteredThresholdHigh:(BOOL)a3
{
  self->_triggerTypeThresholdLow = a3;
}

@end
