@implementation BWStillImageCaptureFrameInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureFrameInfo)initWithMainFlags:(unint64_t)a3 sifrFlags:(unint64_t)a4
{
  BWStillImageCaptureFrameInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWStillImageCaptureFrameInfo;
  result = -[BWStillImageCaptureFrameInfo init](&v7, sel_init);
  if (result)
  {
    result->_mainFlags = a3;
    result->_sifrFlags = a4;
  }
  return result;
}

- (BWStillImageCaptureFrameInfo)initWithCoder:(id)a3
{
  BWStillImageCaptureFrameInfo *v4;

  v4 = -[BWStillImageCaptureFrameInfo init](self, "init");
  if (v4)
  {
    v4->_mainFlags = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("mainFlags"));
    v4->_sifrFlags = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("sifrFlags"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_mainFlags, CFSTR("mainFlags"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_sifrFlags, CFSTR("sifrFlags"));
}

- (unint64_t)hash
{
  return self->_sifrFlags ^ self->_mainFlags;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t mainFlags;
  unint64_t sifrFlags;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  mainFlags = self->_mainFlags;
  if (mainFlags != objc_msgSend(a3, "mainFlags"))
    return 0;
  sifrFlags = self->_sifrFlags;
  return sifrFlags == objc_msgSend(a3, "sifrFlags");
}

- (unint64_t)mainFlags
{
  return self->_mainFlags;
}

- (unint64_t)sifrFlags
{
  return self->_sifrFlags;
}

@end
