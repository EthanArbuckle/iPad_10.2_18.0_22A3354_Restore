@implementation HMCameraVideoResolution

- (HMCameraVideoResolution)initWithVideoResolutionType:(unint64_t)a3
{
  HMCameraVideoResolution *v5;
  HMCameraVideoResolution *v6;
  objc_super v8;

  if (+[HMCameraVideoResolution isValid:](HMCameraVideoResolution, "isValid:"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HMCameraVideoResolution;
    v5 = -[HMCameraVideoResolution init](&v8, sel_init);
    if (v5)
      v5->_videoResolution = a3;
    self = v5;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HMCameraVideoResolution)initWithCoder:(id)a3
{
  id v4;
  HMCameraVideoResolution *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMCameraVideoResolution;
  v5 = -[HMCameraVideoResolution init](&v7, sel_init);
  if (v5)
    v5->_videoResolution = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("a"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraVideoResolution videoResolution](self, "videoResolution"), CFSTR("a"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = -[HMCameraVideoResolution videoResolution](self, "videoResolution");
  v6 = objc_msgSend(v4, "videoResolution");

  return v5 == v6;
}

- (unint64_t)videoResolution
{
  return self->_videoResolution;
}

+ (BOOL)isValid:(unint64_t)a3
{
  return a3 - 1 < 0x1D;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
