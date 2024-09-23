@implementation AXSSInterDeviceSwitchEvent

- (AXSSInterDeviceSwitchEvent)initWithSwitchIdentifier:(id)a3 switchDisplayName:(id)a4 deviceIdentifier:(id)a5 actions:(id)a6 isDown:(BOOL)a7
{
  return -[AXSSInterDeviceSwitchEvent initWithSwitchIdentifier:switchDisplayName:deviceIdentifier:actions:longPressActions:isDown:](self, "initWithSwitchIdentifier:switchDisplayName:deviceIdentifier:actions:longPressActions:isDown:", a3, a4, a5, a6, 0, a7);
}

- (AXSSInterDeviceSwitchEvent)initWithSwitchIdentifier:(id)a3 switchDisplayName:(id)a4 deviceIdentifier:(id)a5 actions:(id)a6 longPressActions:(id)a7 isDown:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  AXSSInterDeviceSwitchEvent *v18;
  AXSSInterDeviceSwitchEvent *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AXSSInterDeviceSwitchEvent;
  v18 = -[AXSSInterDeviceSwitchEvent init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_switchIdentifier, a3);
    objc_storeStrong((id *)&v19->_switchDisplayName, a4);
    objc_storeStrong((id *)&v19->_deviceIdentifier, a5);
    objc_storeStrong((id *)&v19->_actions, a6);
    objc_storeStrong((id *)&v19->_longPressActions, a7);
    v19->_isDown = a8;
  }

  return v19;
}

- (AXSSInterDeviceSwitchEvent)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AXSSInterDeviceSwitchEvent *v5;
  uint64_t v6;
  NSString *switchIdentifier;
  uint64_t v8;
  NSString *switchDisplayName;
  uint64_t v10;
  NSString *deviceIdentifier;
  uint64_t v12;
  NSArray *actions;
  uint64_t v14;
  NSArray *longPressActions;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  objc_super v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AXSSInterDeviceSwitchEvent;
  v5 = -[AXSSInterDeviceSwitchEvent init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "axssDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    switchIdentifier = v5->_switchIdentifier;
    v5->_switchIdentifier = (NSString *)v6;

    objc_msgSend(v4, "axssDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    switchDisplayName = v5->_switchDisplayName;
    v5->_switchDisplayName = (NSString *)v8;

    objc_msgSend(v4, "axssDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v10;

    objc_msgSend(v4, "axssDecodeArrayOfClass:forKey:", objc_opt_class(), CFSTR("Actions"));
    v12 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v12;

    objc_msgSend(v4, "axssDecodeArrayOfClass:forKey:", objc_opt_class(), CFSTR("LongPressActions"));
    v14 = objc_claimAutoreleasedReturnValue();
    longPressActions = v5->_longPressActions;
    v5->_longPressActions = (NSArray *)v14;

    v5->_isDown = objc_msgSend(v4, "axssDecodeBoolForKey:", CFSTR("IsDown"));
    -[AXSSInterDeviceSwitchEvent switchDisplayName](v5, "switchDisplayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (!v17)
    {
      AXSSLogForCategory(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:].cold.4();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("UNTITLED_SWITCH"), &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSInterDeviceSwitchEvent setSwitchDisplayName:](v5, "setSwitchDisplayName:", v20);

    }
    -[AXSSInterDeviceSwitchEvent switchIdentifier](v5, "switchIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (!v22)
    {
      AXSSLogForCategory(1);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:].cold.3();

      -[AXSSInterDeviceSwitchEvent setSwitchIdentifier:](v5, "setSwitchIdentifier:", CFSTR("missing-switch-identifier"));
    }
    -[AXSSInterDeviceSwitchEvent deviceIdentifier](v5, "deviceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (!v25)
    {
      AXSSLogForCategory(1);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:].cold.2();

      -[AXSSInterDeviceSwitchEvent setDeviceIdentifier:](v5, "setDeviceIdentifier:", CFSTR("missing-device-identifier"));
    }
    -[AXSSInterDeviceSwitchEvent actions](v5, "actions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (!v28)
    {
      AXSSLogForCategory(1);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:].cold.1();

      v33[0] = AXSSSwitchActionSelect;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSInterDeviceSwitchEvent setActions:](v5, "setActions:", v30);

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceSwitchEvent switchIdentifier](self, "switchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SwitchIdentifier"));

  -[AXSSInterDeviceSwitchEvent switchDisplayName](self, "switchDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SwitchDisplayName"));

  -[AXSSInterDeviceSwitchEvent deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("DeviceIdentifier"));

  -[AXSSInterDeviceSwitchEvent actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Actions"));

  -[AXSSInterDeviceSwitchEvent longPressActions](self, "longPressActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("LongPressActions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSInterDeviceSwitchEvent isDown](self, "isDown"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("IsDown"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXSSInterDeviceSwitchEvent;
  -[AXSSInterDeviceSwitchEvent description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceSwitchEvent switchIdentifier](self, "switchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceSwitchEvent switchDisplayName](self, "switchDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceSwitchEvent deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceSwitchEvent actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceSwitchEvent longPressActions](self, "longPressActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - switch identifier: %@, switch display name: %@, device identifier: %@, actions: %@, long press actions: %@, is down: %i"), v4, v5, v6, v7, v8, -[AXSSInterDeviceSwitchEvent isDown](self, "isDown"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)switchIdentifier
{
  return self->_switchIdentifier;
}

- (void)setSwitchIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)switchDisplayName
{
  return self->_switchDisplayName;
}

- (void)setSwitchDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSArray)longPressActions
{
  return self->_longPressActions;
}

- (void)setLongPressActions:(id)a3
{
  objc_storeStrong((id *)&self->_longPressActions, a3);
}

- (BOOL)isDown
{
  return self->_isDown;
}

- (void)setIsDown:(BOOL)a3
{
  self->_isDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_switchDisplayName, 0);
  objc_storeStrong((id *)&self->_switchIdentifier, 0);
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Missing actions for switch event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDictionaryRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Missing device identifier for switch event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDictionaryRepresentation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Missing switch identifier for switch event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDictionaryRepresentation:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Missing switch display name for switch event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
