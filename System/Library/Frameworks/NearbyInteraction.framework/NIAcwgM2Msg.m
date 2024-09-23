@implementation NIAcwgM2Msg

- (NIAcwgM2Msg)initWithSelectedUwbConfigId:(unsigned __int16)a3 selectedPulseShapeCombo:(unsigned __int8)a4 selectedChannelBitmask:(unsigned __int8)a5 supportedSyncCodeIndexBitmask:(unsigned int)a6 minRanMultiplier:(unsigned __int8)a7 supportedSlotBitmask:(unsigned __int8)a8 supportedHoppingConfigBitmask:(unsigned __int8)a9
{
  NIAcwgM2Msg *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NIAcwgM2Msg;
  result = -[NIAcwgM2Msg init](&v16, sel_init);
  if (result)
  {
    result->_selectedUwbConfigId = a3;
    result->_selectedPulseShapeCombo = a4;
    result->_selectedChannelBitmask = a5;
    result->_supportedSyncCodeIndexBitmask = a6;
    result->_minRanMultiplier = a7;
    result->_supportedSlotBitmask = a8;
    result->_supportedHoppingConfigBitmask = a9;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("selectedUwbConfigId:%u\n"), self->_selectedUwbConfigId);
  objc_msgSend(v6, "appendFormat:", CFSTR("selectedPulseShapeCombo:%u\n"), self->_selectedPulseShapeCombo);
  objc_msgSend(v6, "appendFormat:", CFSTR("selectedChannelBitmask:0x%02x\n"), self->_selectedChannelBitmask);
  objc_msgSend(v6, "appendFormat:", CFSTR("supportedSyncCodeIndexBitmask:0x%08x\n"), self->_supportedSyncCodeIndexBitmask);
  objc_msgSend(v6, "appendFormat:", CFSTR("minRanMultiplier:%u\n"), self->_minRanMultiplier);
  objc_msgSend(v6, "appendFormat:", CFSTR("supportedSlotBitmask:0x%02x\n"), self->_supportedSlotBitmask);
  objc_msgSend(v6, "appendFormat:", CFSTR("supportedHoppingConfigBitmask:0x%02x>"), self->_supportedHoppingConfigBitmask);
  return v6;
}

- (AcwgM2MsgStruct)toStruct
{
  int v2;
  unint64_t v3;
  AcwgM2MsgStruct result;

  v2 = *(unsigned __int16 *)&self->_minRanMultiplier | (self->_supportedHoppingConfigBitmask << 16);
  v3 = self->_selectedUwbConfigId | ((unint64_t)self->_selectedPulseShapeCombo << 16) | ((unint64_t)self->_selectedChannelBitmask << 24) | ((unint64_t)self->_supportedSyncCodeIndexBitmask << 32);
  result.var0 = v3;
  result.var1 = BYTE2(v3);
  result.var2 = BYTE3(v3);
  result.var3 = HIDWORD(v3);
  result.var4 = v2;
  result.var5 = BYTE1(v2);
  result.var6 = BYTE2(v2);
  return result;
}

+ (id)fromStruct:(AcwgM2MsgStruct)a3
{
  uint64_t v4;

  LOBYTE(v4) = a3.var6;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSelectedUwbConfigId:selectedPulseShapeCombo:selectedChannelBitmask:supportedSyncCodeIndexBitmask:minRanMultiplier:supportedSlotBitmask:supportedHoppingConfigBitmask:", a3.var0, a3.var1, a3.var2, a3.var3, a3.var4, a3.var5, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v6) = self->_supportedHoppingConfigBitmask;
  return (id)objc_msgSend(v4, "initWithSelectedUwbConfigId:selectedPulseShapeCombo:selectedChannelBitmask:supportedSyncCodeIndexBitmask:minRanMultiplier:supportedSlotBitmask:supportedHoppingConfigBitmask:", self->_selectedUwbConfigId, self->_selectedPulseShapeCombo, self->_selectedChannelBitmask, self->_supportedSyncCodeIndexBitmask, self->_minRanMultiplier, self->_supportedSlotBitmask, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_selectedUwbConfigId, CFSTR("selectedUwbConfigId"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_selectedPulseShapeCombo, CFSTR("selectedPulseShapeCombo"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_selectedChannelBitmask, CFSTR("selectedChannelBitmask"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_supportedSyncCodeIndexBitmask, CFSTR("supportedSyncCodeIndexBitmask"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_minRanMultiplier, CFSTR("minRanMultiplier"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_supportedSlotBitmask, CFSTR("supportedSlotBitmask"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_supportedHoppingConfigBitmask, CFSTR("supportedHoppingConfigBitmask"));

}

- (NIAcwgM2Msg)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_selectedUwbConfigId = objc_msgSend(v4, "decodeIntForKey:", CFSTR("selectedUwbConfigId"));
    self->_selectedPulseShapeCombo = objc_msgSend(v5, "decodeIntForKey:", CFSTR("selectedPulseShapeCombo"));
    self->_selectedChannelBitmask = objc_msgSend(v5, "decodeIntForKey:", CFSTR("selectedChannelBitmask"));
    self->_supportedSyncCodeIndexBitmask = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("supportedSyncCodeIndexBitmask"));
    self->_minRanMultiplier = objc_msgSend(v5, "decodeIntForKey:", CFSTR("minRanMultiplier"));
    self->_supportedSlotBitmask = objc_msgSend(v5, "decodeIntForKey:", CFSTR("supportedSlotBitmask"));
    self->_supportedHoppingConfigBitmask = objc_msgSend(v5, "decodeIntForKey:", CFSTR("supportedHoppingConfigBitmask"));
  }

  return self;
}

- (unsigned)selectedUwbConfigId
{
  return self->_selectedUwbConfigId;
}

- (unsigned)selectedPulseShapeCombo
{
  return self->_selectedPulseShapeCombo;
}

- (unsigned)selectedChannelBitmask
{
  return self->_selectedChannelBitmask;
}

- (unsigned)supportedSyncCodeIndexBitmask
{
  return self->_supportedSyncCodeIndexBitmask;
}

- (unsigned)minRanMultiplier
{
  return self->_minRanMultiplier;
}

- (unsigned)supportedSlotBitmask
{
  return self->_supportedSlotBitmask;
}

- (unsigned)supportedHoppingConfigBitmask
{
  return self->_supportedHoppingConfigBitmask;
}

@end
