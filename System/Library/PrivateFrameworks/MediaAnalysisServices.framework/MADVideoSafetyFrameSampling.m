@implementation MADVideoSafetyFrameSampling

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoSafetyFrameSampling)initWithFramesPerSync:(unint64_t)a3 frameLimit:(unint64_t)a4 uniformSampling:(BOOL)a5
{
  MADVideoSafetyFrameSampling *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MADVideoSafetyFrameSampling;
  result = -[MADVideoSafetyFrameSampling init](&v9, sel_init);
  if (result)
  {
    result->_framesPerSync = a3;
    result->_frameLimit = a4;
    result->_uniformSampling = a5;
  }
  return result;
}

- (MADVideoSafetyFrameSampling)initWithFrameLimit:(unint64_t)a3 uniformSampling:(BOOL)a4
{
  return -[MADVideoSafetyFrameSampling initWithFramesPerSync:frameLimit:uniformSampling:](self, "initWithFramesPerSync:frameLimit:uniformSampling:", 0, a3, a4);
}

- (MADVideoSafetyFrameSampling)initWithCoder:(id)a3
{
  id v4;
  MADVideoSafetyFrameSampling *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADVideoSafetyFrameSampling;
  v5 = -[MADVideoSafetyFrameSampling init](&v7, sel_init);
  if (v5)
  {
    v5->_framesPerSync = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FramesPerSync"));
    v5->_frameLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FrameLimit"));
    v5->_uniformSampling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UniformSampling"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t framesPerSync;
  id v5;

  framesPerSync = self->_framesPerSync;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", framesPerSync, CFSTR("FramesPerSync"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_frameLimit, CFSTR("FrameLimit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_uniformSampling, CFSTR("UniformSampling"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR(", framesPerSync: %lu"), self->_framesPerSync);
  objc_msgSend(v3, "appendFormat:", CFSTR(", frameLimit: %lu"), self->_frameLimit);
  if (self->_uniformSampling)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(", uniformSampling: %@"), v6);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFramesPerSync:frameLimit:uniformSampling:", self->_framesPerSync, self->_frameLimit, self->_uniformSampling);
}

- (unint64_t)framesPerSync
{
  return self->_framesPerSync;
}

- (unint64_t)frameLimit
{
  return self->_frameLimit;
}

- (BOOL)uniformSampling
{
  return self->_uniformSampling;
}

@end
