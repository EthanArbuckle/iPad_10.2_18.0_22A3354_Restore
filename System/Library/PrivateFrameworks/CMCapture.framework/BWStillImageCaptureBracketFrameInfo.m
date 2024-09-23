@implementation BWStillImageCaptureBracketFrameInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureBracketFrameInfo)initWithBracketedCaptureSequenceNumber:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5
{
  BWStillImageCaptureBracketFrameInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  result = -[BWStillImageCaptureFrameInfo initWithMainFlags:sifrFlags:](&v7, sel_initWithMainFlags_sifrFlags_, a4, a5);
  if (result)
    result->_bracketedCaptureSequenceNumber = a3;
  return result;
}

+ (id)infoWithBracketedCaptureSequenceNumber:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBracketedCaptureSequenceNumber:mainFlags:sifrFlags:", *(_QWORD *)&a3, a4, a5);
}

- (BWStillImageCaptureBracketFrameInfo)initWithCoder:(id)a3
{
  BWStillImageCaptureBracketFrameInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  v4 = -[BWStillImageCaptureFrameInfo initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_bracketedCaptureSequenceNumber = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bracketedCaptureSequenceNumber"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  -[BWStillImageCaptureFrameInfo encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_bracketedCaptureSequenceNumber, CFSTR("bracketedCaptureSequenceNumber"));
}

- (id)description
{
  uint64_t bracketedCaptureSequenceNumber;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  bracketedCaptureSequenceNumber = self->_bracketedCaptureSequenceNumber;
  if ((int)bracketedCaptureSequenceNumber < 1)
    v4 = CFSTR("PB");
  else
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("B%.2d"), bracketedCaptureSequenceNumber);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v7 = BWStillImageCaptureFrameFlagsToShortString(-[BWStillImageCaptureFrameInfo mainFlags](self, "mainFlags"));
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p>: %@ main:%@ sifr:%@"), v6, self, v4, v7, BWStillImageCaptureFrameFlagsToShortString(-[BWStillImageCaptureFrameInfo sifrFlags](self, "sifrFlags")));
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  return -[BWStillImageCaptureFrameInfo hash](&v3, sel_hash) ^ self->_bracketedCaptureSequenceNumber;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v7;
  int bracketedCaptureSequenceNumber;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v11 = v3;
    v12 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
      v7 = -[BWStillImageCaptureFrameInfo isEqual:](&v10, sel_isEqual_, a3);
      if (v7)
      {
        bracketedCaptureSequenceNumber = self->_bracketedCaptureSequenceNumber;
        LOBYTE(v7) = bracketedCaptureSequenceNumber == objc_msgSend(a3, "bracketedCaptureSequenceNumber");
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (int)bracketedCaptureSequenceNumber
{
  return self->_bracketedCaptureSequenceNumber;
}

@end
