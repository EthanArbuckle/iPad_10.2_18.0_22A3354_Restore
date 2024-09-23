@implementation BKSMousePointerDevicePreferences

- (BKSMousePointerDevicePreferences)init
{
  BKSMousePointerDevicePreferences *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSMousePointerDevicePreferences;
  result = -[BKSMousePointerDevicePreferences init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_pointerAccelerationFactor = 0x3EA000003F800000;
    result->_enableTwoFingerSecondaryClick = 1;
    *(_WORD *)&result->_enableNaturalScrolling = 1;
    result->_clickHapticStrength = 0;
    result->_doubleTapDragMode = 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  float pointerAccelerationFactor;
  id v5;
  double v6;
  double v7;

  pointerAccelerationFactor = self->_pointerAccelerationFactor;
  v5 = a3;
  *(float *)&v6 = pointerAccelerationFactor;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("t:1"), v6);
  *(float *)&v7 = self->_scrollAccelerationFactor;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("t:2"), v7);
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableTapToClick, CFSTR("t:3"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableTwoFingerSecondaryClick, CFSTR("t:4"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_doubleTapDragMode, CFSTR("t:8"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableNaturalScrolling, CFSTR("t:5"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_buttonConfigurationForVirtualButtonMice, CFSTR("t:6"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_buttonConfigurationForHardwareButtonMice, CFSTR("t:7"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_clickHapticStrength, CFSTR("t:9"));

  -[BKSMousePointerDevicePreferences _fixMissingButtonConfigurations](self, "_fixMissingButtonConfigurations");
}

- (BKSMousePointerDevicePreferences)initWithCoder:(id)a3
{
  id v4;
  BKSMousePointerDevicePreferences *v5;
  float v6;
  float v7;

  v4 = a3;
  v5 = -[BKSMousePointerDevicePreferences init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("t:1"));
    v5->_pointerAccelerationFactor = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("t:2"));
    v5->_scrollAccelerationFactor = v7;
    v5->_enableTapToClick = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t:3"));
    v5->_enableTwoFingerSecondaryClick = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t:4"));
    v5->_doubleTapDragMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t:8"));
    v5->_buttonConfigurationForVirtualButtonMice = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t:6"));
    v5->_buttonConfigurationForHardwareButtonMice = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t:7"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("t:5")))
      v5->_enableNaturalScrolling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t:5"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("t:9")))
      v5->_clickHapticStrength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t:9"));
  }

  return v5;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  -[BKSMousePointerDevicePreferences _fixMissingButtonConfigurations](self, "_fixMissingButtonConfigurations");
  return self;
}

- (unint64_t)hash
{
  double v2;
  void *v3;
  unint64_t v4;

  *(float *)&v2 = self->_pointerAccelerationFactor;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BKSMousePointerDevicePreferences *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BKSMousePointerDevicePreferences *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && self->_pointerAccelerationFactor == v4->_pointerAccelerationFactor
      && self->_scrollAccelerationFactor == v4->_scrollAccelerationFactor
      && self->_enableTapToClick == v4->_enableTapToClick
      && self->_enableTwoFingerSecondaryClick == v4->_enableTwoFingerSecondaryClick
      && self->_clickHapticStrength == v4->_clickHapticStrength
      && self->_enableNaturalScrolling == v4->_enableNaturalScrolling
      && self->_doubleTapDragMode == v4->_doubleTapDragMode
      && self->_buttonConfigurationForVirtualButtonMice == v4->_buttonConfigurationForVirtualButtonMice
      && self->_buttonConfigurationForHardwareButtonMice == v4->_buttonConfigurationForHardwareButtonMice;
  }

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)BKSMousePointerDevicePreferences;
  -[BKSMousePointerDevicePreferences description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR(" ptrAccel:%g scrollAceel:%g enableTapToClick:%d enableTwoFingerSecondaryClick:%d doubleTapDragMode:%d enableNaturalScrolling:%d virtualButtonConfig:%d, hardwareButtonConfig:%d"), self->_pointerAccelerationFactor, self->_scrollAccelerationFactor, self->_enableTapToClick, self->_enableTwoFingerSecondaryClick, self->_doubleTapDragMode, self->_enableNaturalScrolling, self->_buttonConfigurationForVirtualButtonMice, self->_buttonConfigurationForHardwareButtonMice);
  objc_msgSend(v5, "appendFormat:", CFSTR(" clickHapticStrength:%d"), self->_clickHapticStrength);
  return (NSString *)v5;
}

- (void)_fixMissingButtonConfigurations
{
  if (!self->_buttonConfigurationForVirtualButtonMice)
    self->_buttonConfigurationForVirtualButtonMice = 1;
  if (!self->_buttonConfigurationForHardwareButtonMice)
    self->_buttonConfigurationForHardwareButtonMice = 2;
}

- (float)pointerAccelerationFactor
{
  return self->_pointerAccelerationFactor;
}

- (void)setPointerAccelerationFactor:(float)a3
{
  self->_pointerAccelerationFactor = a3;
}

- (float)scrollAccelerationFactor
{
  return self->_scrollAccelerationFactor;
}

- (void)setScrollAccelerationFactor:(float)a3
{
  self->_scrollAccelerationFactor = a3;
}

- (BOOL)enableNaturalScrolling
{
  return self->_enableNaturalScrolling;
}

- (void)setEnableNaturalScrolling:(BOOL)a3
{
  self->_enableNaturalScrolling = a3;
}

- (BOOL)enableTapToClick
{
  return self->_enableTapToClick;
}

- (void)setEnableTapToClick:(BOOL)a3
{
  self->_enableTapToClick = a3;
}

- (BOOL)enableTwoFingerSecondaryClick
{
  return self->_enableTwoFingerSecondaryClick;
}

- (void)setEnableTwoFingerSecondaryClick:(BOOL)a3
{
  self->_enableTwoFingerSecondaryClick = a3;
}

- (int64_t)clickHapticStrength
{
  return self->_clickHapticStrength;
}

- (void)setClickHapticStrength:(int64_t)a3
{
  self->_clickHapticStrength = a3;
}

- (int64_t)doubleTapDragMode
{
  return self->_doubleTapDragMode;
}

- (void)setDoubleTapDragMode:(int64_t)a3
{
  self->_doubleTapDragMode = a3;
}

- (int64_t)buttonConfigurationForHardwareButtonMice
{
  return self->_buttonConfigurationForHardwareButtonMice;
}

- (void)setButtonConfigurationForHardwareButtonMice:(int64_t)a3
{
  self->_buttonConfigurationForHardwareButtonMice = a3;
}

- (int64_t)buttonConfigurationForVirtualButtonMice
{
  return self->_buttonConfigurationForVirtualButtonMice;
}

- (void)setButtonConfigurationForVirtualButtonMice:(int64_t)a3
{
  self->_buttonConfigurationForVirtualButtonMice = a3;
}

+ (id)defaultPreferencesForHardwareType:(int64_t)a3
{
  BKSMousePointerDevicePreferences *v4;
  double v5;
  double v6;

  v4 = objc_alloc_init(BKSMousePointerDevicePreferences);
  -[BKSMousePointerDevicePreferences setButtonConfigurationForVirtualButtonMice:](v4, "setButtonConfigurationForVirtualButtonMice:", 1);
  -[BKSMousePointerDevicePreferences setButtonConfigurationForHardwareButtonMice:](v4, "setButtonConfigurationForHardwareButtonMice:", 2);
  -[BKSMousePointerDevicePreferences setClickHapticStrength:](v4, "setClickHapticStrength:", 0);
  LODWORD(v5) = 1.0;
  -[BKSMousePointerDevicePreferences setPointerAccelerationFactor:](v4, "setPointerAccelerationFactor:", v5);
  LODWORD(v6) = 0.3125;
  -[BKSMousePointerDevicePreferences setScrollAccelerationFactor:](v4, "setScrollAccelerationFactor:", v6);
  -[BKSMousePointerDevicePreferences setEnableTapToClick:](v4, "setEnableTapToClick:", 0);
  -[BKSMousePointerDevicePreferences setEnableTwoFingerSecondaryClick:](v4, "setEnableTwoFingerSecondaryClick:", a3 == 9);
  -[BKSMousePointerDevicePreferences setDoubleTapDragMode:](v4, "setDoubleTapDragMode:", 0);
  -[BKSMousePointerDevicePreferences setEnableNaturalScrolling:](v4, "setEnableNaturalScrolling:", 1);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BKSMousePointerDevicePreferences_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_6011 != -1)
    dispatch_once(&protobufSchema_onceToken_6011, block);
  return (id)protobufSchema_schema_6012;
}

void __50__BKSMousePointerDevicePreferences_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_6014);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_6012;
  protobufSchema_schema_6012 = v1;

}

void __50__BKSMousePointerDevicePreferences_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:forTag:", "_pointerAccelerationFactor", 1);
  objc_msgSend(v2, "addField:forTag:", "_scrollAccelerationFactor", 2);
  objc_msgSend(v2, "addField:forTag:", "_enableTapToClick", 3);
  objc_msgSend(v2, "addField:forTag:", "_enableTwoFingerSecondaryClick", 4);
  objc_msgSend(v2, "addField:forTag:", "_enableNaturalScrolling", 5);
  objc_msgSend(v2, "addField:forTag:", "_buttonConfigurationForVirtualButtonMice", 6);
  objc_msgSend(v2, "addField:forTag:", "_buttonConfigurationForHardwareButtonMice", 7);
  objc_msgSend(v2, "addField:forTag:", "_doubleTapDragMode", 8);
  objc_msgSend(v2, "addField:forTag:", "_clickHapticStrength", 9);

}

@end
