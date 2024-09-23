@implementation FMDEraseOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 useObliteration;
  id v5;

  useObliteration = self->_useObliteration;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", useObliteration, CFSTR("useObliteration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_brickDevice, CFSTR("brickDevice"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("customDelay"), self->_customDelay);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maxDelayInterval"), self->_maxDelayInterval);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasBridgeCoProcessor, CFSTR("hasBridgeCoProcessor"));

}

- (FMDEraseOptions)initWithCoder:(id)a3
{
  id v4;
  FMDEraseOptions *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDEraseOptions;
  v5 = -[FMDEraseOptions init](&v9, sel_init);
  if (v5)
  {
    v5->_useObliteration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useObliteration"));
    v5->_brickDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("brickDevice"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("customDelay"));
    v5->_customDelay = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxDelayInterval"));
    v5->_maxDelayInterval = v7;
    v5->_hasBridgeCoProcessor = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBridgeCoProcessor"));
  }

  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[FMDEraseOptions useObliteration](self, "useObliteration");
  v6 = -[FMDEraseOptions brickDevice](self, "brickDevice");
  -[FMDEraseOptions maxDelayInterval](self, "maxDelayInterval");
  v8 = v7;
  -[FMDEraseOptions customDelay](self, "customDelay");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> useObliteration: %i, brickDevice - %i, maxDelay - %f, customDelay - %f, hasBridgeCoProcessor - %i"), v4, self, v5, v6, v8, v9, -[FMDEraseOptions hasBridgeCoProcessor](self, "hasBridgeCoProcessor"));
}

- (BOOL)useObliteration
{
  return self->_useObliteration;
}

- (void)setUseObliteration:(BOOL)a3
{
  self->_useObliteration = a3;
}

- (BOOL)brickDevice
{
  return self->_brickDevice;
}

- (void)setBrickDevice:(BOOL)a3
{
  self->_brickDevice = a3;
}

- (double)customDelay
{
  return self->_customDelay;
}

- (void)setCustomDelay:(double)a3
{
  self->_customDelay = a3;
}

- (double)maxDelayInterval
{
  return self->_maxDelayInterval;
}

- (void)setMaxDelayInterval:(double)a3
{
  self->_maxDelayInterval = a3;
}

- (BOOL)hasBridgeCoProcessor
{
  return self->_hasBridgeCoProcessor;
}

- (void)setHasBridgeCoProcessor:(BOOL)a3
{
  self->_hasBridgeCoProcessor = a3;
}

@end
