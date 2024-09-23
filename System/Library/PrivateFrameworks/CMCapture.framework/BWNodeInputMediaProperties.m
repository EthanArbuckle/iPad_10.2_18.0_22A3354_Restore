@implementation BWNodeInputMediaProperties

- (void)setResolvedFormat:(id)a3
{
  BWFormat *resolvedFormat;

  resolvedFormat = self->_resolvedFormat;
  if (resolvedFormat != a3)
  {

    self->_resolvedFormat = (BWFormat *)a3;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](-[BWNodeInput node](self->_owningNodeInput, "node"), "didSelectFormat:forInput:forAttachedMediaKey:", a3, self->_owningNodeInput, self->_associatedAttachedMediaKey);
  }
}

- (void)_setOwningNodeInput:(id)a3 associatedAttachedMediaKey:(id)a4
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  if (!a3)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99750];
    v6 = CFSTR("Owning BWNodeInput must not be nil");
    goto LABEL_8;
  }
  if (self->_owningNodeInput)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99750];
    v6 = CFSTR("Can only be owned by one BWNodeInput");
    goto LABEL_8;
  }
  if (!a4)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("Associated attached media key must not be nil");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0));
  }
  self->_owningNodeInput = (BWNodeInput *)a3;
  self->_associatedAttachedMediaKey = (NSString *)objc_msgSend(a4, "copy");
}

- (BWVideoFormat)resolvedVideoFormat
{
  if (-[BWNodeInput mediaTypeIsVideo](self->_owningNodeInput, "mediaTypeIsVideo"))
    return (BWVideoFormat *)self->_resolvedFormat;
  else
    return 0;
}

- (BWFormat)liveFormat
{
  return self->_liveFormat;
}

- (BWFormat)resolvedFormat
{
  return self->_resolvedFormat;
}

- (void)setLiveFormat:(id)a3
{
  BWFormat *liveFormat;

  liveFormat = self->_liveFormat;
  if (liveFormat != a3)
  {

    self->_liveFormat = (BWFormat *)a3;
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeInputMediaProperties;
  -[BWNodeInputMediaProperties dealloc](&v3, sel_dealloc);
}

- (BWVideoFormat)liveVideoFormat
{
  if (-[BWNodeInput mediaTypeIsVideo](self->_owningNodeInput, "mediaTypeIsVideo"))
    return (BWVideoFormat *)self->_liveFormat;
  else
    return 0;
}

@end
