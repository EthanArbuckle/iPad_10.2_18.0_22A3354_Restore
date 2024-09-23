@implementation AXSwitchGameControlButtonPress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSwitchGameControlButtonPress)initWithCoder:(id)a3
{
  id v4;
  AXSwitchGameControlButtonPress *v5;
  void *v6;
  float v7;
  float v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXSwitchGameControlButtonPress;
  v5 = -[AXSwitchGameControlButtonPress init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXSwitchGameControlButtonPressButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_button = objc_msgSend(v6, "unsignedIntegerValue");

    v5->_toggle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AXSwitchGameControlButtonPressToggle"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("AXSwitchGameControlButtonPressXMagnitude"));
    v5->_xMagnitude = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("AXSwitchGameControlButtonPressYMagnitude"));
    v5->_yMagnitude = v8;
    v5->_joystickPress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AXSwitchGameControlButtonPressJoystickPress"));
  }

  return v5;
}

- (AXSwitchGameControlButtonPress)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AXSwitchGameControlButtonPress *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXSwitchGameControlButtonPress;
  v5 = -[AXSwitchGameControlButtonPress init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AXSwitchGameControlButtonPressButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_button = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AXSwitchGameControlButtonPressToggle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_toggle = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AXSwitchGameControlButtonPressXMagnitude"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_xMagnitude = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AXSwitchGameControlButtonPressYMagnitude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v5->_yMagnitude = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AXSwitchGameControlButtonPressJoystickPress"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_joystickPress = objc_msgSend(v12, "BOOLValue");

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("AXSwitchGameControlButtonPressButton");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXSwitchGameControlButtonPress button](self, "button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("AXSwitchGameControlButtonPressToggle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSwitchGameControlButtonPress isToggle](self, "isToggle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("AXSwitchGameControlButtonPressXMagnitude");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSwitchGameControlButtonPress xMagnitude](self, "xMagnitude");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("AXSwitchGameControlButtonPressYMagnitude");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSwitchGameControlButtonPress yMagnitude](self, "yMagnitude");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  v12[4] = CFSTR("AXSwitchGameControlButtonPressJoystickPress");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSwitchGameControlButtonPress isJoystickPress](self, "isJoystickPress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[AXSwitchGameControlButtonPress button](self, "button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AXSwitchGameControlButtonPressButton"));

  objc_msgSend(v6, "encodeBool:forKey:", -[AXSwitchGameControlButtonPress isToggle](self, "isToggle"), CFSTR("AXSwitchGameControlButtonPressToggle"));
  -[AXSwitchGameControlButtonPress xMagnitude](self, "xMagnitude");
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("AXSwitchGameControlButtonPressXMagnitude"));
  -[AXSwitchGameControlButtonPress yMagnitude](self, "yMagnitude");
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("AXSwitchGameControlButtonPressYMagnitude"));
  objc_msgSend(v6, "encodeBool:forKey:", -[AXSwitchGameControlButtonPress isJoystickPress](self, "isJoystickPress"), CFSTR("AXSwitchGameControlButtonPressJoystickPress"));

}

- (unint64_t)button
{
  return self->_button;
}

- (void)setButton:(unint64_t)a3
{
  self->_button = a3;
}

- (BOOL)isToggle
{
  return self->_toggle;
}

- (void)setToggle:(BOOL)a3
{
  self->_toggle = a3;
}

- (float)xMagnitude
{
  return self->_xMagnitude;
}

- (void)setXMagnitude:(float)a3
{
  self->_xMagnitude = a3;
}

- (float)yMagnitude
{
  return self->_yMagnitude;
}

- (void)setYMagnitude:(float)a3
{
  self->_yMagnitude = a3;
}

- (BOOL)isJoystickPress
{
  return self->_joystickPress;
}

- (void)setJoystickPress:(BOOL)a3
{
  self->_joystickPress = a3;
}

@end
