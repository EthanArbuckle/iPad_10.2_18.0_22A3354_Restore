@implementation BKSKeyboardDefaults

- (BKSKeyboardDefaults)init
{
  return (BKSKeyboardDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.keyboard.preferences"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "oldModifierKeyRemapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("com.apple.keyboard.modifierKeysRemapping"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "modifierKeyRemapping");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("ModifierKeysRemapping"), 0, 1);

}

- (void)migrateIfNeeded
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[BKSKeyboardDefaults oldModifierKeyRemapping](self, "oldModifierKeyRemapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BKLogKeyboard();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEFAULT, "migrating key modifiers %{public}@", (uint8_t *)&v8, 0xCu);

    }
    v7 = (void *)objc_msgSend(v3, "copy");
    -[BKSKeyboardDefaults setModifierKeyRemapping:](self, "setModifierKeyRemapping:", v7);

    -[BKSKeyboardDefaults setOldModifierKeyRemapping:](self, "setOldModifierKeyRemapping:", 0);
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEFAULT, "nothing to migrate", (uint8_t *)&v8, 2u);
    }

  }
}

@end
