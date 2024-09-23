@implementation AXSwitch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXSwitch action](self, "action"), CFSTR("SwitchActionKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXSwitch longPressAction](self, "longPressAction"), CFSTR("SwitchLongPressAction"));
  -[AXSwitch name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SwitchNameKey"));

  -[AXSwitch source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SwitchSourceKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSwitch isEnabled](self, "isEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SwitchIsEnabledKey"));

  -[AXSwitch type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("SwitchTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[AXSwitch keyCode](self, "keyCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("SwitchKeyCodeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXSwitch buttonNumber](self, "buttonNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("SwitchButtonNumberKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXSwitch headSwitch](self, "headSwitch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("SwitchHeadSwitch"));

  -[AXSwitch uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("SwitchUUID"));

  -[AXSwitch productName](self, "productName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("SwithProductName"));

  -[AXSwitch manufacturerName](self, "manufacturerName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("SwithManufacturerName"));

  -[AXSwitch remoteSwitchIdentifier](self, "remoteSwitchIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("SwitchRemoteSwitchIdentifier"));

  -[AXSwitch remoteDeviceName](self, "remoteDeviceName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("SwitchRemoteDeviceName"));

  -[AXSwitch remoteDeviceIdentifier](self, "remoteDeviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("SwitchRemoteDeviceIdentifier"));

  -[AXSwitch midiEvent](self, "midiEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("SwitchMidiEvent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXSwitch cameraSwitch](self, "cameraSwitch"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("SwitchCameraSwitch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXSwitch expressionSensitivity](self, "expressionSensitivity"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("SwitchExpressionSensitivity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[AXSwitch accessibilityEventUsagePage](self, "accessibilityEventUsagePage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("SwitchAccessibilityEventUsagePage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[AXSwitch accessibilityEventUsage](self, "accessibilityEventUsage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("SwitchAccessibilityEventUsage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXSwitch accessibilityEventModifierFlags](self, "accessibilityEventModifierFlags"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("SwitchAccessibilityEventModifierFlags"));

  -[AXSwitch shortcutIdentifier](self, "shortcutIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("shortcutIdentifier"));

  -[AXSwitch longPressShortcutIdentifier](self, "longPressShortcutIdentifier");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("longPressShortcutIdentifier"));

}

- (AXSwitch)initWithCoder:(id)a3
{
  id v4;
  AXSwitch *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSString *source;
  uint64_t v11;
  NSString *type;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSUUID *uuid;
  uint64_t v18;
  NSString *productName;
  uint64_t v20;
  NSString *manufacturerName;
  void *v22;
  uint64_t v23;
  NSString *remoteSwitchIdentifier;
  void *v25;
  uint64_t v26;
  NSString *remoteDeviceName;
  void *v28;
  uint64_t v29;
  NSString *remoteDeviceIdentifier;
  uint64_t v31;
  AXMIDIEvent *midiEvent;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)AXSwitch;
  v5 = -[AXSwitch init](&v49, sel_init);
  if (v5)
  {
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SwitchActionKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchSourceKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchTypeKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchKeyCodeKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_keyCode = objc_msgSend(v13, "unsignedShortValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchButtonNumberKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_buttonNumber = objc_msgSend(v14, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchHeadSwitch"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_headSwitch = objc_msgSend(v15, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchUUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwithProductName"));
    v18 = objc_claimAutoreleasedReturnValue();
    productName = v5->_productName;
    v5->_productName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwithManufacturerName"));
    v20 = objc_claimAutoreleasedReturnValue();
    manufacturerName = v5->_manufacturerName;
    v5->_manufacturerName = (NSString *)v20;

    v5->_longPressAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SwitchLongPressAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchRemoteSwitchIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    remoteSwitchIdentifier = v5->_remoteSwitchIdentifier;
    v5->_remoteSwitchIdentifier = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchRemoteDeviceName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    remoteDeviceName = v5->_remoteDeviceName;
    v5->_remoteDeviceName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchRemoteDeviceIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    remoteDeviceIdentifier = v5->_remoteDeviceIdentifier;
    v5->_remoteDeviceIdentifier = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchMidiEvent"));
    v31 = objc_claimAutoreleasedReturnValue();
    midiEvent = v5->_midiEvent;
    v5->_midiEvent = (AXMIDIEvent *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchCameraSwitch"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cameraSwitch = objc_msgSend(v33, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchExpressionSensitivity"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSwitch setShortcutIdentifier:](v5, "setShortcutIdentifier:", v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longPressShortcutIdentifier"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSwitch setLongPressShortcutIdentifier:](v5, "setLongPressShortcutIdentifier:", v36);

    if (v34)
      v37 = objc_msgSend(v34, "unsignedIntegerValue");
    else
      v37 = 2;
    v5->_expressionSensitivity = v37;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchAccessibilityEventUsagePage"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accessibilityEventUsagePage = objc_msgSend(v38, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchAccessibilityEventUsage"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accessibilityEventUsage = objc_msgSend(v39, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchAccessibilityEventModifierFlags"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accessibilityEventModifierFlags = objc_msgSend(v40, "integerValue");

    if (-[NSString isEqualToString:](v5->_source, "isEqualToString:", CFSTR("SCATSwitchSourceBackTap"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SwitchBackTapType")))
    {
      v5->_accessibilityEventUsagePage = 1;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchBackTapType"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_accessibilityEventUsage = objc_msgSend(v41, "unsignedIntegerValue");

    }
    if (-[NSString isEqualToString:](v5->_source, "isEqualToString:", CFSTR("SCATSwitchSourceSound"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SwitchSoundType")))
    {
      v5->_accessibilityEventUsagePage = 3;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchSoundType"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_accessibilityEventUsage = objc_msgSend(v42, "unsignedIntegerValue");

    }
    if (-[NSString isEqualToString:](v5->_source, "isEqualToString:", CFSTR("SCATSwitchSourceHeadGesture"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SwitchHeadGestureType")))
    {
      v5->_accessibilityEventUsagePage = 7;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchHeadGestureType"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_accessibilityEventUsage = objc_msgSend(v43, "unsignedIntegerValue");

    }
    if (-[NSString isEqualToString:](v5->_source, "isEqualToString:", CFSTR("SCATSwitchSourceCameraHandGesture"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SwitchCameraHandGestureType")))
    {
      v5->_accessibilityEventUsagePage = 8;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchCameraHandGestureType"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_accessibilityEventUsage = objc_msgSend(v44, "unsignedIntegerValue");

    }
    if (-[NSString isEqualToString:](v5->_source, "isEqualToString:", CFSTR("SCATSwitchSourceHandGestures"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SwitchHandGesturesType")))
    {
      v5->_accessibilityEventUsagePage = 2;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchHandGesturesType"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_accessibilityEventUsage = objc_msgSend(v45, "unsignedIntegerValue");

    }
    if (-[NSString isEqualToString:](v5->_source, "isEqualToString:", CFSTR("SCATSwitchSourceAutomation"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SwitchAutomationType")))
    {
      v5->_accessibilityEventUsagePage = 5;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchAutomationType"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_accessibilityEventUsage = objc_msgSend(v46, "unsignedIntegerValue");

    }
    v5->_isEnabled = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SwitchIsEnabledKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SwitchIsEnabledKey"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isEnabled = objc_msgSend(v47, "BOOLValue");

    }
  }

  return v5;
}

+ (AXSwitch)switchWithAction:(int64_t)a3 name:(id)a4 source:(id)a5 type:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAction:name:source:type:", a3, v12, v11, v10);

  return (AXSwitch *)v13;
}

- (AXSwitch)initWithAction:(int64_t)a3 name:(id)a4 source:(id)a5 type:(id)a6
{
  id v10;
  id v11;
  id v12;
  AXSwitch *v13;
  AXSwitch *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSUUID *uuid;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AXSwitch;
  v13 = -[AXSwitch init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_action = a3;
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_source, a5);
    objc_storeStrong((id *)&v14->_type, a6);
    v14->_isEnabled = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = objc_claimAutoreleasedReturnValue();
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v17;

  }
  return v14;
}

- (NSString)name
{
  void *v3;
  int v4;
  NSString *v5;

  -[AXSwitch source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchSourceScreen"));

  if (v4)
  {
    AXLocalizedString(CFSTR("SCREEN_SWITCH_NAME"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_name;
  }
  return v5;
}

- (BOOL)hasLongPressAction
{
  return -[AXSwitch longPressAction](self, "longPressAction") != 0;
}

- (BOOL)supportsLongPress
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[AXSwitch source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchSourceScreen")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[AXSwitch source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SwitchSourceKeyboard")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[AXSwitch source](self, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SwitchSourceMFI")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[AXSwitch source](self, "source");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SwitchSourceATVRemote")) & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          -[AXSwitch source](self, "source");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SwitchSourceMIDI")) & 1) != 0)
          {
            v4 = 1;
          }
          else
          {
            -[AXSwitch source](self, "source");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SwitchSourceRemote")) & 1) != 0)
            {
              v4 = 1;
            }
            else
            {
              -[AXSwitch source](self, "source");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SwitchSourceGamepad")) & 1) != 0)
              {
                v4 = 1;
              }
              else
              {
                -[AXSwitch source](self, "source");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SCATSwitchSourceCameraHandGesture")) & 1) != 0)
                {
                  v4 = 1;
                }
                else
                {
                  -[AXSwitch source](self, "source");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v4 = objc_msgSend(v12, "isEqualToString:", CFSTR("SCATSwitchSourceAccessibility"));

                }
              }

            }
          }

        }
      }

    }
  }

  return v4;
}

- (NSString)localizedSourceDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v12;

  -[AXSwitch source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceCamera")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceKeyboard")) & 1) != 0)
  {
    v9 = CFSTR("SWITCH_SOURCE_EXTERNAL_LABEL");
    goto LABEL_30;
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceMFI")) & 1) != 0)
  {
    v9 = CFSTR("SWITCH_SOURCE_MFI_LABEL");
    goto LABEL_30;
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceScreen")) & 1) != 0)
  {
    v9 = CFSTR("SWITCH_SOURCE_SCREEN_LABEL");
    goto LABEL_30;
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceATVRemote")) & 1) == 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceRemote")) & 1) != 0)
    {
      v9 = CFSTR("SWITCH_SOURCE_REMOTE_LABEL");
      goto LABEL_30;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceMIDI")) & 1) != 0)
    {
      v9 = CFSTR("SWITCH_SOURCE_MIDI_LABEL");
      goto LABEL_30;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceMotionTracker")) & 1) == 0)
    {
      if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceBackTap")) & 1) != 0)
      {
        v9 = CFSTR("SWITCH_SOURCE_BACK_TAP");
      }
      else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceAccessibility")) & 1) != 0)
      {
        v9 = CFSTR("SWITCH_SOURCE_ACCESSIBILITY");
      }
      else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SwitchSourceGamepad")) & 1) != 0)
      {
        v9 = CFSTR("SWITCH_SOURCE_GAMEPAD");
      }
      else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceAutomation")) & 1) != 0)
      {
        v9 = CFSTR("SWITCH_SOURCE_AUTOMATION");
      }
      else
      {
        if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceHandGestures")) & 1) == 0)
        {
          if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceSound")) & 1) != 0)
          {
            v9 = CFSTR("SWITCH_SOURCE_SOUND");
            goto LABEL_30;
          }
          if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceHeadGesture")) & 1) != 0)
          {
            v9 = CFSTR("SWITCH_SOURCE_HEAD_GESTURES");
            goto LABEL_30;
          }
          if (!objc_msgSend(v2, "isEqualToString:", CFSTR("SCATSwitchSourceCameraHandGesture")))
          {
            v10 = &stru_1E24CAB08;
            goto LABEL_31;
          }
        }
        v9 = CFSTR("SWITCH_SOURCE_HAND_GESTURES");
      }
LABEL_30:
      AXParameterizedLocalizedString(2, v9, v3, v4, v5, v6, v7, v8, v12);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_2:
    v9 = CFSTR("SWITCH_SOURCE_CAMERA_LABEL");
    goto LABEL_30;
  }
  v10 = CFSTR("Apple TV Remote");
LABEL_31:

  return (NSString *)v10;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v19 = objc_opt_class();
  SCATActionDescription(-[AXSwitch action](self, "action"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[AXSwitch name](self, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch source](self, "source");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSwitch isEnabled](self, "isEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AXSwitch hasLongPressAction](self, "hasLongPressAction");
  v22 = (void *)v3;
  if (v20)
  {
    SCATActionDescription(-[AXSwitch longPressAction](self, "longPressAction"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("None");
  }
  -[AXSwitch type](self, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AXSwitch keyCode](self, "keyCode");
  v16 = -[AXSwitch buttonNumber](self, "buttonNumber");
  v15 = -[AXSwitch headSwitch](self, "headSwitch");
  -[AXSwitch productName](self, "productName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch manufacturerName](self, "manufacturerName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch remoteDeviceIdentifier](self, "remoteDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch remoteDeviceName](self, "remoteDeviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch remoteSwitchIdentifier](self, "remoteSwitchIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch midiEvent](self, "midiEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch shortcutIdentifier](self, "shortcutIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitch longPressShortcutIdentifier](self, "longPressShortcutIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("[%@ (%p)]\nAction: %@ \nName: %@ \nSource: %@ \nIs Enabled: %@ \nLong Press action: %@ \nType: %@ \nKey code: %hu\nButton Number: %d\nHead Switch: %d\nProduct Name: %@\nManufacturer: %@\nUUID: %@\nRemote device identifier: %@\nRemote device name: %@\nRemote switch identifier: %@\nMIDI Event: %@\nShortcut %@ / Long press shortcut: %@\n"), v19, self, v22, v26, v25, v24, v23, v18, v17, v16, v15, v14, v13, v4, v5, v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSwitch uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AXSwitch *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  AXSwitch *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  AXSwitch *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  char v33;
  char v34;
  int64_t v35;
  int v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  int v41;
  int64_t v42;
  int64_t v43;
  _BOOL4 v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;

  v4 = (AXSwitch *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_52;
    }
    -[AXSwitch uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSwitch uuid](v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v9 = v4;
      -[AXSwitch remoteDeviceIdentifier](self, "remoteDeviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[AXSwitch remoteDeviceIdentifier](v9, "remoteDeviceIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSwitch remoteDeviceIdentifier](self, "remoteDeviceIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqualToString:", v7))
          goto LABEL_47;
        v52 = v11;
      }
      -[AXSwitch remoteSwitchIdentifier](self, "remoteSwitchIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[AXSwitch remoteSwitchIdentifier](v9, "remoteSwitchIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSwitch remoteSwitchIdentifier](self, "remoteSwitchIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", v14))
        {
          v22 = 1;
          goto LABEL_17;
        }
        v49 = v14;
        v50 = v13;
      }
      -[AXSwitch remoteDeviceName](self, "remoteDeviceName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[AXSwitch remoteDeviceName](v9, "remoteDeviceName");
        v17 = v7;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSwitch remoteDeviceName](self, "remoteDeviceName");
        v19 = v9;
        v20 = v10;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v18, "isEqualToString:", v21) ^ 1;

        v10 = v20;
        v9 = v19;

        v7 = v17;
      }
      else
      {
        v22 = 0;
      }
      v14 = v49;
      v13 = v50;
      if (!v12)
      {
LABEL_18:
        if (v10)
        {

        }
        if ((v22 & 1) != 0)
        {
          v8 = 0;
LABEL_51:

          goto LABEL_52;
        }
        -[AXSwitch source](self, "source");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = -[AXSwitch cameraSwitch](self, "cameraSwitch");
        if (v24 == -[AXSwitch cameraSwitch](v9, "cameraSwitch"))
        {
          v25 = -[AXSwitch expressionSensitivity](self, "expressionSensitivity");
          v26 = v25 == -[AXSwitch expressionSensitivity](v9, "expressionSensitivity");
        }
        else
        {
          v26 = 0;
        }
        v53 = (void *)v23;
        -[AXSwitch shortcutIdentifier](self, "shortcutIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[AXSwitch shortcutIdentifier](self, "shortcutIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSwitch shortcutIdentifier](v9, "shortcutIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v28, "isEqualToString:", v13))
          {
            v34 = 0;
            goto LABEL_33;
          }
          v50 = v28;
        }
        -[AXSwitch longPressShortcutIdentifier](self, "longPressShortcutIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          -[AXSwitch longPressShortcutIdentifier](self, "longPressShortcutIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSwitch longPressShortcutIdentifier](v9, "longPressShortcutIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v26;
          v33 = objc_msgSend(v30, "isEqualToString:", v31);

          v34 = v33;
          v26 = v32;
        }
        else
        {
          v34 = 1;
        }

        v28 = v50;
        if (!v27)
        {
LABEL_34:

          v35 = -[AXSwitch action](self, "action");
          if (v35 != -[AXSwitch action](v9, "action"))
          {
            v8 = 0;
            v10 = v53;
            goto LABEL_50;
          }
          -[AXSwitch name](self, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSwitch name](v9, "name");
          v7 = objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v11, "isEqualToString:", v7) | v26;
          v10 = v53;
          if (v36 == 1)
          {
            -[AXSwitch source](v9, "source");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v53, "isEqual:", v37))
            {
              v38 = v34;
              -[AXSwitch type](self, "type");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXSwitch type](v9, "type");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v39, "isEqual:", v40))
              {
                v51 = v7;
                v41 = -[AXSwitch keyCode](self, "keyCode");
                if (v41 == -[AXSwitch keyCode](v9, "keyCode")
                  && (v42 = -[AXSwitch buttonNumber](self, "buttonNumber"),
                      v42 == -[AXSwitch buttonNumber](v9, "buttonNumber"))
                  && (v43 = -[AXSwitch headSwitch](self, "headSwitch"), v43 == -[AXSwitch headSwitch](v9, "headSwitch"))
                  && (v44 = -[AXSwitch hasLongPressAction](self, "hasLongPressAction"),
                      v44 == -[AXSwitch hasLongPressAction](v9, "hasLongPressAction"))
                  && (v45 = -[AXSwitch accessibilityEventUsagePage](self, "accessibilityEventUsagePage"),
                      v45 == -[AXSwitch accessibilityEventUsagePage](v9, "accessibilityEventUsagePage"))
                  && (v46 = -[AXSwitch accessibilityEventUsage](self, "accessibilityEventUsage"),
                      v46 == -[AXSwitch accessibilityEventUsage](v9, "accessibilityEventUsage")))
                {
                  v47 = -[AXSwitch accessibilityEventModifierFlags](self, "accessibilityEventModifierFlags");
                  if (v47 == -[AXSwitch accessibilityEventModifierFlags](v9, "accessibilityEventModifierFlags"))
                    v8 = v38;
                  else
                    v8 = 0;
                }
                else
                {
                  v8 = 0;
                }
                v7 = v51;
              }
              else
              {
                v8 = 0;
              }

            }
            else
            {
              v8 = 0;
            }

            goto LABEL_48;
          }
LABEL_47:
          v8 = 0;
LABEL_48:

LABEL_50:
          goto LABEL_51;
        }
LABEL_33:

        goto LABEL_34;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  v8 = 1;
LABEL_52:

  return v8;
}

+ (NSDictionary)expressionToSwitchTypeMapping
{
  if (expressionToSwitchTypeMapping_onceToken != -1)
    dispatch_once(&expressionToSwitchTypeMapping_onceToken, &__block_literal_global_41);
  return (NSDictionary *)(id)expressionToSwitchTypeMapping_expressionToSwitchTypeMapping;
}

void __41__AXSwitch_expressionToSwitchTypeMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E24F8180;
  v2[1] = &unk_1E24F81B0;
  v3[0] = &unk_1E24F8198;
  v3[1] = &unk_1E24F81C8;
  v2[2] = &unk_1E24F81E0;
  v2[3] = &unk_1E24F81C8;
  v3[2] = &unk_1E24F81B0;
  v3[3] = &unk_1E24F8180;
  v2[4] = &unk_1E24F81F8;
  v2[5] = &unk_1E24F8210;
  v3[4] = &unk_1E24F81E0;
  v3[5] = &unk_1E24F81F8;
  v2[6] = &unk_1E24F8228;
  v2[7] = &unk_1E24F8258;
  v3[6] = &unk_1E24F8240;
  v3[7] = &unk_1E24F8258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)expressionToSwitchTypeMapping_expressionToSwitchTypeMapping;
  expressionToSwitchTypeMapping_expressionToSwitchTypeMapping = v0;

}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (int64_t)longPressAction
{
  return self->_longPressAction;
}

- (void)setLongPressAction:(int64_t)a3
{
  self->_longPressAction = a3;
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, a3);
}

- (NSString)longPressShortcutIdentifier
{
  return self->_longPressShortcutIdentifier;
}

- (void)setLongPressShortcutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_longPressShortcutIdentifier, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unsigned __int16)a3
{
  self->_keyCode = a3;
}

- (int64_t)buttonNumber
{
  return self->_buttonNumber;
}

- (void)setButtonNumber:(int64_t)a3
{
  self->_buttonNumber = a3;
}

- (int64_t)headSwitch
{
  return self->_headSwitch;
}

- (void)setHeadSwitch:(int64_t)a3
{
  self->_headSwitch = a3;
}

- (AXMIDIEvent)midiEvent
{
  return self->_midiEvent;
}

- (void)setMidiEvent:(id)a3
{
  objc_storeStrong((id *)&self->_midiEvent, a3);
}

- (unint64_t)cameraSwitch
{
  return self->_cameraSwitch;
}

- (void)setCameraSwitch:(unint64_t)a3
{
  self->_cameraSwitch = a3;
}

- (unint64_t)expressionSensitivity
{
  return self->_expressionSensitivity;
}

- (void)setExpressionSensitivity:(unint64_t)a3
{
  self->_expressionSensitivity = a3;
}

- (int64_t)accessibilityEventUsagePage
{
  return self->_accessibilityEventUsagePage;
}

- (void)setAccessibilityEventUsagePage:(int64_t)a3
{
  self->_accessibilityEventUsagePage = a3;
}

- (int64_t)accessibilityEventUsage
{
  return self->_accessibilityEventUsage;
}

- (void)setAccessibilityEventUsage:(int64_t)a3
{
  self->_accessibilityEventUsage = a3;
}

- (int64_t)accessibilityEventModifierFlags
{
  return self->_accessibilityEventModifierFlags;
}

- (void)setAccessibilityEventModifierFlags:(int64_t)a3
{
  self->_accessibilityEventModifierFlags = a3;
}

- (NSString)remoteSwitchIdentifier
{
  return self->_remoteSwitchIdentifier;
}

- (void)setRemoteSwitchIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)remoteDeviceName
{
  return self->_remoteDeviceName;
}

- (void)setRemoteDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteDeviceName, 0);
  objc_storeStrong((id *)&self->_remoteSwitchIdentifier, 0);
  objc_storeStrong((id *)&self->_midiEvent, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_longPressShortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
}

@end
