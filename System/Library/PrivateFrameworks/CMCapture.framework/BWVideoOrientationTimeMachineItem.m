@implementation BWVideoOrientationTimeMachineItem

- (BWVideoOrientationTimeMachineItem)initWithPTSSeconds:(double)a3 exifOrientation:(signed __int16)a4
{
  BWVideoOrientationTimeMachineItem *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWVideoOrientationTimeMachineItem;
  result = -[BWVideoOrientationTimeMachineItem init](&v7, sel_init);
  if (result)
  {
    result->_ptsSeconds = a3;
    result->_exifOrientation = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> ptsSeconds: %.4f, exifOrientation: %d"), NSStringFromClass(v4), self, *(_QWORD *)&self->_ptsSeconds, self->_exifOrientation);
}

- (double)ptsSeconds
{
  return self->_ptsSeconds;
}

- (void)setPtsSeconds:(double)a3
{
  self->_ptsSeconds = a3;
}

- (signed)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(signed __int16)a3
{
  self->_exifOrientation = a3;
}

@end
