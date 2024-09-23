@implementation VCCannedAVSync

- (VCCannedAVSync)init
{
  VCCannedAVSync *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCannedAVSync;
  result = -[VCCannedAVSync init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_base = xmmword_1D910F850;
  return result;
}

- (void)clear
{
  self->_modulo = 86400.0;
}

- (void)addStreamWithCount:(int)a3 rate:(double)a4
{
  double modulo;

  modulo = (double)a3 / a4;
  if (self->_modulo < modulo)
    modulo = self->_modulo;
  self->_modulo = modulo;
}

+ (id)sharedCannedAVSync
{
  if (sharedCannedAVSync_sDispatchOnceToken != -1)
    dispatch_once(&sharedCannedAVSync_sDispatchOnceToken, &__block_literal_global_83);
  return (id)sharedCannedAVSync_sSharedCannedAVSync;
}

VCCannedAVSync *__36__VCCannedAVSync_sharedCannedAVSync__block_invoke()
{
  VCCannedAVSync *result;

  result = objc_alloc_init(VCCannedAVSync);
  sharedCannedAVSync_sSharedCannedAVSync = (uint64_t)result;
  return result;
}

- (double)base
{
  return self->_base;
}

- (void)setBase:(double)a3
{
  self->_base = a3;
}

- (double)modulo
{
  return self->_modulo;
}

- (void)setModulo:(double)a3
{
  self->_modulo = a3;
}

@end
