@implementation BWNodeInputMediaConfiguration

- (BWFormatRequirements)formatRequirements
{
  return self->_formatRequirements;
}

- (int)passthroughMode
{
  return self->_passthroughMode;
}

- (int)retainedBufferCount
{
  return self->_retainedBufferCount;
}

- (int)delayedBufferCount
{
  return self->_delayedBufferCount;
}

- (int)indefinitelyHeldBufferCount
{
  return self->_indefinitelyHeldBufferCount;
}

- (BOOL)conversionToPassthroughModeNeverAllowed
{
  return self->_conversionToPassthroughModeNeverAllowed;
}

- (BWNodeInputMediaConfiguration)init
{
  BWNodeInputMediaConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeInputMediaConfiguration;
  result = -[BWNodeInputMediaConfiguration init](&v3, sel_init);
  if (result)
    result->_passthroughMode = 0;
  return result;
}

- (void)_setAssociatedAttachedMediaKey:(id)a3
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  if (!a3)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    v5 = CFSTR("Associated attached media key must not be nil");
    goto LABEL_6;
  }
  if (self->_associatedAttachedMediaKey)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    v5 = CFSTR("Associated attached media key can only be set once");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0));
  }
  self->_associatedAttachedMediaKey = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setDelayedBufferCount:(int)a3
{
  self->_delayedBufferCount = a3;
}

- (void)setRetainedBufferCount:(int)a3
{
  self->_retainedBufferCount = a3;
}

- (void)setPassthroughMode:(int)a3
{
  self->_passthroughMode = a3;
}

- (void)setFormatRequirements:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setConversionToPassthroughModeNeverAllowed:(BOOL)a3
{
  self->_conversionToPassthroughModeNeverAllowed = a3;
}

- (void)setIndefinitelyHeldBufferCount:(int)a3
{
  self->_indefinitelyHeldBufferCount = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeInputMediaConfiguration;
  -[BWNodeInputMediaConfiguration dealloc](&v3, sel_dealloc);
}

@end
