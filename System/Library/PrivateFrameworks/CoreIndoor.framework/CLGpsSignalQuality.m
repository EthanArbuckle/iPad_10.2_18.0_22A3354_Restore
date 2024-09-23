@implementation CLGpsSignalQuality

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLGpsSignalQuality)init
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);

  return 0;
}

- (CLGpsSignalQuality)initWithSignalQuality:(int)a3
{
  CLGpsSignalQuality *v4;
  CLGpsSignalQuality *v5;
  CLGpsSignalQuality *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLGpsSignalQuality;
  v4 = -[CLGpsSignalQuality init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_quality = a3;
    v6 = v4;
  }

  return v5;
}

- (CLGpsSignalQuality)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CLGpsSignalQuality *v8;
  CLGpsSignalQuality *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLGpsSignalQuality;
  v8 = -[CLGpsSignalQuality init](&v11, sel_init);
  if (v8)
  {
    v8->_quality = objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("signalQuality"), v6, v7);
    v9 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;

  objc_msgSend_encodeInt_forKey_(a3, a2, self->_quality, (uint64_t)CFSTR("signalQuality"), v3);
}

- (int)quality
{
  return self->_quality;
}

- (void)setQuality:(int)a3
{
  self->_quality = a3;
}

@end
