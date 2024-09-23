@implementation BKSHIDEventDigitizerAttributes

- (BOOL)systemGestureStateChange
{
  return self->_systemGestureStateChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathAttributes, 0);
}

- (BOOL)systemGesturesPossible
{
  return self->_systemGesturesPossible;
}

- (int64_t)sceneTouchBehavior
{
  return self->_sceneTouchBehavior;
}

- (int64_t)activeModifiers
{
  return self->_activeModifiers;
}

- (void)setMaximumPositionZ:(double)a3
{
  self->_maximumPositionZ = a3;
}

- (void)setMaximumForce:(float)a3
{
  self->_maximumForce = a3;
}

- (void)setActiveModifiers:(int64_t)a3
{
  self->_activeModifiers = a3;
}

- (void)setInitialTouchTimestamp:(double)a3
{
  self->_initialTouchTimestamp = a3;
}

- (float)maximumForce
{
  return self->_maximumForce;
}

- (void)setSystemGesturesPossible:(BOOL)a3
{
  self->_systemGesturesPossible = a3;
}

- (void)setPathAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_pathAttributes, a3);
}

- (double)initialTouchTimestamp
{
  return self->_initialTouchTimestamp;
}

- (NSArray)pathAttributes
{
  return self->_pathAttributes;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BKSHIDEventDigitizerAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_334 != -1)
    dispatch_once(&protobufSchema_onceToken_334, block);
  return (id)protobufSchema_schema_333;
}

- (void)setTouchStreamIdentifier:(unsigned __int8)a3
{
  self->_touchStreamIdentifier = a3;
}

- (void)setSystemGestureStateChange:(BOOL)a3
{
  self->_systemGestureStateChange = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDigitizerAttributes;
  v4 = -[BKSHIDEventBaseAttributes copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[13] = LODWORD(self->_maximumForce);
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_maximumPositionZ;
  *((_OWORD *)v4 + 6) = self->_digitizerSurfaceSize;
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_initialTouchTimestamp;
  *((_QWORD *)v4 + 10) = self->_activeModifiers;
  *((_BYTE *)v4 + 49) = self->_systemGesturesPossible;
  *((_BYTE *)v4 + 50) = self->_systemGestureStateChange;
  *((_QWORD *)v4 + 11) = self->_sceneTouchBehavior;
  *((_BYTE *)v4 + 48) = self->_touchStreamIdentifier;
  v5 = -[NSArray copy](self->_pathAttributes, "copy");
  v6 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  char v6;
  float *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventDigitizerAttributes;
  if (-[BKSHIDEventBaseAttributes isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (float *)v4;
    if (self->_maximumForce == v5[13]
      && self->_maximumPositionZ == *((double *)v5 + 7)
      && self->_digitizerSurfaceSize.height == *((double *)v5 + 13)
      && self->_digitizerSurfaceSize.width == *((double *)v5 + 12)
      && self->_initialTouchTimestamp == *((double *)v5 + 9)
      && self->_activeModifiers == *((_QWORD *)v5 + 10)
      && self->_systemGesturesPossible == *((unsigned __int8 *)v5 + 49)
      && self->_systemGestureStateChange == *((unsigned __int8 *)v5 + 50)
      && self->_sceneTouchBehavior == *((_QWORD *)v5 + 11)
      && self->_touchStreamIdentifier == *((unsigned __int8 *)v5 + 48))
    {
      v8 = v5;
      v6 = BSEqualObjects();
      v5 = v8;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)digitizerSurfaceWidth
{
  return self->_digitizerSurfaceSize.width;
}

- (double)digitizerSurfaceHeight
{
  return self->_digitizerSurfaceSize.height;
}

- (void)setDigitizerSurfaceWidth:(double)a3
{
  self->_digitizerSurfaceSize.width = a3;
}

- (void)setDigitizerSurfaceHeight:(double)a3
{
  self->_digitizerSurfaceSize.height = a3;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  float maximumForce;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t sceneTouchBehavior;
  void *v12;
  void *v13;
  id v14;
  int64_t activeModifiers;
  void *v16;
  id v17;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BKSHIDEventDigitizerAttributes;
  -[BKSHIDEventBaseAttributes appendDescriptionToFormatter:](&v19, sel_appendDescriptionToFormatter_, v4);
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_pathAttributes, CFSTR("pathAttributes"), 1);
  maximumForce = self->_maximumForce;
  if (maximumForce != 0.0)
    v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("maximumForce"), maximumForce);
  if (self->_maximumPositionZ != 0.0)
    v8 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("maximumPositionZ"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_systemGesturesPossible, CFSTR("systemGesturesPossible"), 1);
  v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_systemGestureStateChange, CFSTR("systemGestureStateChange"), 1);
  sceneTouchBehavior = self->_sceneTouchBehavior;
  if (sceneTouchBehavior)
  {
    NSStringFromBKSSceneHostTouchBehavior(sceneTouchBehavior);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v12, CFSTR("sceneTouchBehavior"));

  }
  if (self->_touchStreamIdentifier)
  {
    NSStringFromBKSTouchStreamIdentifier(self->_touchStreamIdentifier);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v13, CFSTR("touchStreamIdentifier"));

  }
  if (self->_initialTouchTimestamp != 0.0)
    v14 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("initialTouchTimestamp"), 0);
  activeModifiers = self->_activeModifiers;
  if (activeModifiers)
  {
    NSStringFromBKSKeyModifierFlags(activeModifiers);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v4, "appendObject:withName:", v16, CFSTR("activeModifiers"));

  }
  if (self->_digitizerSurfaceSize.width != 0.0 || self->_digitizerSurfaceSize.height != 0.0)
    v18 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("surfaceDimensions"));

}

- (double)maximumPositionZ
{
  return self->_maximumPositionZ;
}

- (CGSize)digitizerSurfaceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_digitizerSurfaceSize.width;
  height = self->_digitizerSurfaceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDigitizerSurfaceSize:(CGSize)a3
{
  self->_digitizerSurfaceSize = a3;
}

- (unsigned)touchStreamIdentifier
{
  return self->_touchStreamIdentifier;
}

- (void)setSceneTouchBehavior:(int64_t)a3
{
  self->_sceneTouchBehavior = a3;
}

void __48__BKSHIDEventDigitizerAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_335);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_333;
  protobufSchema_schema_333 = v1;

}

void __48__BKSHIDEventDigitizerAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_maximumForce");
  objc_msgSend(v2, "addField:", "_maximumPositionZ");
  objc_msgSend(v2, "addField:", "_digitizerSurfaceSize");
  objc_msgSend(v2, "addField:", "_initialTouchTimestamp");
  objc_msgSend(v2, "addField:", "_activeModifiers");
  objc_msgSend(v2, "addField:", "_systemGesturesPossible");
  objc_msgSend(v2, "addField:", "_systemGestureStateChange");
  objc_msgSend(v2, "addField:", "_sceneTouchBehavior");
  objc_msgSend(v2, "addField:", "_touchStreamIdentifier");
  objc_msgSend(v2, "addRepeatingField:containsClass:", "_pathAttributes", objc_opt_class());

}

@end
