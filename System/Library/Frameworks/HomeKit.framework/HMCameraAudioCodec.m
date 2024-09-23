@implementation HMCameraAudioCodec

- (HMCameraAudioCodec)initWithAudioCodecType:(unint64_t)a3
{
  HMCameraAudioCodec *v5;
  HMCameraAudioCodec *v6;
  objc_super v8;

  if (+[HMCameraAudioCodec isValid:](HMCameraAudioCodec, "isValid:"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HMCameraAudioCodec;
    v5 = -[HMCameraAudioCodec init](&v8, sel_init);
    if (v5)
      v5->_audioCodec = a3;
    self = v5;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HMCameraAudioCodec)initWithCoder:(id)a3
{
  id v4;
  HMCameraAudioCodec *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMCameraAudioCodec;
  v5 = -[HMCameraAudioCodec init](&v7, sel_init);
  if (v5)
    v5->_audioCodec = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("a"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraAudioCodec audioCodec](self, "audioCodec"), CFSTR("a"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = -[HMCameraAudioCodec audioCodec](self, "audioCodec");
  v6 = objc_msgSend(v4, "audioCodec");

  return v5 == v6;
}

- (unint64_t)audioCodec
{
  return self->_audioCodec;
}

+ (BOOL)isValid:(unint64_t)a3
{
  return a3 - 1 < 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
