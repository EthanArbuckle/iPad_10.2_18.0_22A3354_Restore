@implementation MADPersonIdentificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonIdentificationRequest)init
{
  MADPersonIdentificationRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADPersonIdentificationRequest;
  result = -[MADPersonIdentificationRequest init](&v3, sel_init);
  if (result)
  {
    result->_faceDetectorVisionRevision = 3;
    result->_allowOnDemand = 1;
    result->_allowUnverifiedIdentity = 0;
    result->_useLowResolutionPicture = 0;
    result->_maximumFaceCount = 0;
  }
  return result;
}

- (MADPersonIdentificationRequest)initWithCoder:(id)a3
{
  id v4;
  MADPersonIdentificationRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADPersonIdentificationRequest;
  v5 = -[MADRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_faceDetectorVisionRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FaceDetectorVisionRevision"));
    v5->_allowOnDemand = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AllowOnDemand")) != 0;
    v5->_allowUnverifiedIdentity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AllowUnverifiedIdentity")) != 0;
    v5->_useLowResolutionPicture = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UseLowResolutionPicture")) != 0;
    v5->_maximumFaceCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaximumFaceCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADPersonIdentificationRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_faceDetectorVisionRevision, CFSTR("FaceDetectorVisionRevision"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_allowOnDemand, CFSTR("AllowOnDemand"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_allowUnverifiedIdentity, CFSTR("AllowUnverifiedIdentity"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_useLowResolutionPicture, CFSTR("UseLowResolutionPicture"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumFaceCount, CFSTR("MaximumFaceCount"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("faceDetectorVisionRevision: %lu, "), self->_faceDetectorVisionRevision);
  if (self->_allowOnDemand)
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("allowOnDemand: %@, "), v6);
  if (self->_allowUnverifiedIdentity)
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("allowUnverifiedIdentity: %@, "), v7);
  if (self->_useLowResolutionPicture)
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("useLowResolutionPicture: %@, "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumFaceCount: %lu, "), self->_maximumFaceCount);
  -[MADRequest results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v9);

  -[MADRequest error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v10);

  return v3;
}

- (unint64_t)faceDetectorVisionRevision
{
  return self->_faceDetectorVisionRevision;
}

- (void)setFaceDetectorVisionRevision:(unint64_t)a3
{
  self->_faceDetectorVisionRevision = a3;
}

- (BOOL)allowOnDemand
{
  return self->_allowOnDemand;
}

- (void)setAllowOnDemand:(BOOL)a3
{
  self->_allowOnDemand = a3;
}

- (BOOL)allowUnverifiedIdentity
{
  return self->_allowUnverifiedIdentity;
}

- (void)setAllowUnverifiedIdentity:(BOOL)a3
{
  self->_allowUnverifiedIdentity = a3;
}

- (BOOL)useLowResolutionPicture
{
  return self->_useLowResolutionPicture;
}

- (void)setUseLowResolutionPicture:(BOOL)a3
{
  self->_useLowResolutionPicture = a3;
}

- (unint64_t)maximumFaceCount
{
  return self->_maximumFaceCount;
}

- (void)setMaximumFaceCount:(unint64_t)a3
{
  self->_maximumFaceCount = a3;
}

@end
