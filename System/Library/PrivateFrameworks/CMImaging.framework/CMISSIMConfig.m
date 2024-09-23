@implementation CMISSIMConfig

- (CMISSIMConfig)init
{
  char *v2;
  CMISSIMConfig *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMISSIMConfig;
  v2 = -[CMISSIMConfig init](&v6, sel_init);
  v3 = (CMISSIMConfig *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 5) = 52428800;
    *((_WORD *)v2 + 4) = 5;
    *(_OWORD *)(v2 + 12) = xmmword_1D3304DC0;
    *(_QWORD *)(v2 + 28) = 0x3C23D70A3F800000;
    *((_DWORD *)v2 + 9) = 1022739087;
    v4 = v2;
  }
  else
  {
    FigDebugAssert3();
  }

  return v3;
}

+ (CMISSIMConfig)defaultConfig
{
  return objc_alloc_init(CMISSIMConfig);
}

+ (CMISSIMConfig)fastConfig
{
  CMISSIMConfig *v2;

  v2 = objc_alloc_init(CMISSIMConfig);
  -[CMISSIMConfig setWindowRadius:](v2, "setWindowRadius:", 3);
  return v2;
}

- (unint64_t)allocatorCapacity
{
  return self->_allocatorCapacity;
}

- (void)setAllocatorCapacity:(unint64_t)a3
{
  self->_allocatorCapacity = a3;
}

- (unsigned)windowRadius
{
  return self->_windowRadius;
}

- (void)setWindowRadius:(unsigned __int16)a3
{
  self->_windowRadius = a3;
}

- (float)sigma
{
  return self->_sigma;
}

- (void)setSigma:(float)a3
{
  self->_sigma = a3;
}

- (float)luminanceCoefficient
{
  return self->_luminanceCoefficient;
}

- (void)setLuminanceCoefficient:(float)a3
{
  self->_luminanceCoefficient = a3;
}

- (float)contractCoefficient
{
  return self->_contractCoefficient;
}

- (void)setContractCoefficient:(float)a3
{
  self->_contractCoefficient = a3;
}

- (float)structureCoefficient
{
  return self->_structureCoefficient;
}

- (void)setStructureCoefficient:(float)a3
{
  self->_structureCoefficient = a3;
}

- (float)dataRange
{
  return self->_dataRange;
}

- (void)setDataRange:(float)a3
{
  self->_dataRange = a3;
}

- (float)k1
{
  return self->_k1;
}

- (void)setK1:(float)a3
{
  self->_k1 = a3;
}

- (float)k2
{
  return self->_k2;
}

- (void)setK2:(float)a3
{
  self->_k2 = a3;
}

@end
