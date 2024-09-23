@implementation BWStillImageCaptureTimeMachineFrameInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureTimeMachineFrameInfo)initWithTimeMachineIndex:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5
{
  BWStillImageCaptureTimeMachineFrameInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWStillImageCaptureTimeMachineFrameInfo;
  result = -[BWStillImageCaptureFrameInfo initWithMainFlags:sifrFlags:](&v7, sel_initWithMainFlags_sifrFlags_, a4, a5);
  if (result)
    result->_timeMachineIndex = a3;
  return result;
}

+ (id)infoWithTimeMachineIndex:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithTimeMachineIndex:mainFlags:sifrFlags:", *(_QWORD *)&a3, a4, a5);
}

- (BWStillImageCaptureTimeMachineFrameInfo)initWithCoder:(id)a3
{
  BWStillImageCaptureTimeMachineFrameInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWStillImageCaptureTimeMachineFrameInfo;
  v4 = -[BWStillImageCaptureFrameInfo initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_timeMachineIndex = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("timeMachineIndex"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageCaptureTimeMachineFrameInfo;
  -[BWStillImageCaptureFrameInfo encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_timeMachineIndex, CFSTR("timeMachineIndex"));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t timeMachineIndex;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  timeMachineIndex = self->_timeMachineIndex;
  v6 = BWStillImageCaptureFrameFlagsToShortString(-[BWStillImageCaptureFrameInfo mainFlags](self, "mainFlags"));
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: TM%.2d main:%@ sifr:%@"), v4, self, timeMachineIndex, v6, BWStillImageCaptureFrameFlagsToShortString(-[BWStillImageCaptureFrameInfo sifrFlags](self, "sifrFlags")));
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureTimeMachineFrameInfo;
  return -[BWStillImageCaptureFrameInfo hash](&v3, sel_hash) ^ self->_timeMachineIndex;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v7;
  int timeMachineIndex;
  int isNoLongErrorRecoveryFrame;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v12 = v3;
    v13 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    v11.receiver = self;
    v11.super_class = (Class)BWStillImageCaptureTimeMachineFrameInfo;
    v7 = -[BWStillImageCaptureFrameInfo isEqual:](&v11, sel_isEqual_, a3);
    if (!v7)
      return v7;
    timeMachineIndex = self->_timeMachineIndex;
    if (timeMachineIndex != objc_msgSend(a3, "timeMachineIndex"))
    {
LABEL_6:
      LOBYTE(v7) = 0;
      return v7;
    }
    isNoLongErrorRecoveryFrame = self->_isNoLongErrorRecoveryFrame;
    LOBYTE(v7) = isNoLongErrorRecoveryFrame == objc_msgSend(a3, "isNoLongErrorRecoveryFrame");
  }
  return v7;
}

- (int)timeMachineIndex
{
  return self->_timeMachineIndex;
}

- (BOOL)isNoLongErrorRecoveryFrame
{
  return self->_isNoLongErrorRecoveryFrame;
}

- (void)setIsNoLongErrorRecoveryFrame:(BOOL)a3
{
  self->_isNoLongErrorRecoveryFrame = a3;
}

@end
