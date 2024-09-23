@implementation BWAutoFocusROIAnalyticsPayload

- (BWAutoFocusROIAnalyticsPayload)init
{
  BWAutoFocusROIAnalyticsPayload *v2;
  BWAutoFocusROIAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWAutoFocusROIAnalyticsPayload;
  v2 = -[BWAutoFocusROIAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWAutoFocusROIAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAutoFocusROIAnalyticsPayload;
  -[BWAutoFocusROIAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  self->_portType = 0;
  self->_focusRegion = 0;

  self->_clientApplicationID = 0;
  *(_QWORD *)&self->_focusRegionType = 0x7FFFFFFF00000000;
  self->_subjectDistance = 3.4028e38;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.AutoFocusROI");
}

- (id)eventDictionary
{
  void *v3;
  void *v4;
  NSString *portType;
  NSDictionary *focusRegion;
  CGSize v7;
  uint64_t v8;
  uint64_t v9;
  CGRect v11;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  portType = self->_portType;
  if (portType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", portType, CFSTR("portType"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_focusRegionType), CFSTR("focusRegionType"));
  focusRegion = self->_focusRegion;
  if (focusRegion)
  {
    v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v11.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v11.size = v7;
    if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)focusRegion, &v11)
      && !CGRectIsNull(v11)
      && !CGRectIsEmpty(v11))
    {
      LODWORD(v8) = vcvtd_n_u64_f64(v11.origin.x, 4uLL);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8), CFSTR("focusRegionX"));
      LODWORD(v9) = vcvtd_n_u64_f64(v11.origin.y, 4uLL);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9), CFSTR("focusRegionY"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v11.size.width * 16.0 + 1.0)), CFSTR("focusRegionWidth"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v11.size.height * 16.0 + 1.0)), CFSTR("focusRegionHeight"));
    }
  }
  if (self->_luxLevel != 0x7FFFFFFF)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("luxLevel"));
  if (self->_subjectDistance != 3.4028e38)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("subjectDistance"));
  if (self->_clientApplicationID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:")), CFSTR("clientIDType"));
  return v4;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)focusRegionType
{
  return self->_focusRegionType;
}

- (void)setFocusRegionType:(int)a3
{
  self->_focusRegionType = a3;
}

- (NSDictionary)focusRegion
{
  return self->_focusRegion;
}

- (void)setFocusRegion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)luxLevel
{
  return self->_luxLevel;
}

- (void)setLuxLevel:(int)a3
{
  self->_luxLevel = a3;
}

- (float)subjectDistance
{
  return self->_subjectDistance;
}

- (void)setSubjectDistance:(float)a3
{
  self->_subjectDistance = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
