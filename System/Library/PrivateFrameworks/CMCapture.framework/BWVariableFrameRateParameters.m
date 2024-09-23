@implementation BWVariableFrameRateParameters

- (BWVariableFrameRateParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4
{
  uint64_t v6;
  void *v7;
  BWVariableFrameRateParameters *v8;
  objc_super v10;

  if (a3 && (v6 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("VariableFrameRateVideoParameters"))) != 0)
  {
    v7 = (void *)v6;
    v10.receiver = self;
    v10.super_class = (Class)BWVariableFrameRateParameters;
    v8 = -[BWVariableFrameRateParameters init](&v10, sel_init);
    if (v8)
    {
      v8->_portType = (NSString *)a3;
      v8->_motionThreshold = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MotionThreshold")), "intValue");
      v8->_aeMaxGain = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AEMaxGainForFrameRate")), "copy");
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVariableFrameRateParameters;
  -[BWVariableFrameRateParameters dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PortType : %@ Motion Threshold: %d\n AEMaxGain : %@"), self->_portType, self->_motionThreshold, self->_aeMaxGain);
}

- (NSString)portType
{
  return self->_portType;
}

- (int)motionThreshold
{
  return self->_motionThreshold;
}

- (NSDictionary)aeMaxGain
{
  return &self->_aeMaxGain->super;
}

@end
