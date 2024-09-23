@implementation VCDuplicationHandler

- (VCDuplicationHandler)init
{
  VCDuplicationHandler *v2;
  VCDuplicationHandler *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCDuplicationHandler;
  v2 = -[VCDuplicationHandler init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowDuplication = 1;
    v2->_forceDisableDuplication = VCDefaults_GetBoolValueForKey(CFSTR("forceDisableDuplication"), 0);
  }
  return v3;
}

- (BOOL)isDuplicationPending
{
  return self->_duplicationState == 1;
}

- (BOOL)isRemotePreAzul
{
  return self->_isRemotePreAzul;
}

- (void)setIsRemotePreAzul:(BOOL)a3
{
  self->_isRemotePreAzul = a3;
}

- (BOOL)iRATDuplicationEnabled
{
  return self->_iRATDuplicationEnabled;
}

- (void)setIRATDuplicationEnabled:(BOOL)a3
{
  self->_iRATDuplicationEnabled = a3;
}

- (BOOL)allowDuplication
{
  return self->_allowDuplication;
}

- (void)setAllowDuplication:(BOOL)a3
{
  self->_allowDuplication = a3;
}

- (BOOL)isUserMoving
{
  return self->_isUserMoving;
}

- (void)setIsUserMoving:(BOOL)a3
{
  self->_isUserMoving = a3;
}

@end
