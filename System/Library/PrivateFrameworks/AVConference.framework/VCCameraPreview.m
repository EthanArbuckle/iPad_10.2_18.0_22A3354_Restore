@implementation VCCameraPreview

- (void)setStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p)"), NSStringFromClass(v4), self);
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

@end
