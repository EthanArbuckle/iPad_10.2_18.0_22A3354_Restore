@implementation AVCaptureManualExposureBracketedStillImageSettings

+ (void)initialize
{
  objc_opt_class();
}

+ (AVCaptureManualExposureBracketedStillImageSettings)manualExposureSettingsWithExposureDuration:(CMTime *)duration ISO:(float)ISO
{
  __int128 v5;

  return (AVCaptureManualExposureBracketedStillImageSettings *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initManualExposureSettingsWithExposureDuration:ISO:", &v5, COERCE_DOUBLE(__PAIR64__(HIDWORD(duration->value), LODWORD(ISO))));
}

- (id)_initManualExposureSettingsWithExposureDuration:(id *)a3 ISO:(float)a4
{
  id result;
  int64_t var3;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureManualExposureBracketedStillImageSettings;
  result = -[AVCaptureBracketedStillImageSettings initSubclass](&v8, sel_initSubclass);
  if (result)
  {
    var3 = a3->var3;
    *(_OWORD *)((char *)result + 8) = *(_OWORD *)&a3->var0;
    *((_QWORD *)result + 3) = var3;
    *((float *)result + 8) = a4;
  }
  return result;
}

- (id)debugDescription
{
  double ISO;
  CMTime time;

  ISO = self->_ISO;
  time = (CMTime)self->_exposureDuration;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ISO:%.2f dur:%.4f]"), *(_QWORD *)&ISO, CMTimeGetSeconds(&time));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureManualExposureBracketedStillImageSettings debugDescription](self, "debugDescription"));
}

- (CMTime)exposureDuration
{
  CMTime *result;

  objc_copyStruct(retstr, &self->_exposureDuration, 24, 1, 0);
  return result;
}

- (float)ISO
{
  return self->_ISO;
}

@end
