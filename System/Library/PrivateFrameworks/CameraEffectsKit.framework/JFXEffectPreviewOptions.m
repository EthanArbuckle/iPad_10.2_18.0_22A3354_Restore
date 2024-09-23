@implementation JFXEffectPreviewOptions

- (id)initPreviewOptions
{
  JFXEffectPreviewOptions *v2;
  JFXEffectPreviewOptions *v3;
  uint64_t v4;
  PVColorSpace *outputColorSpace;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXEffectPreviewOptions;
  v2 = -[JFXEffectPreviewOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_quality = 0;
    objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v4 = objc_claimAutoreleasedReturnValue();
    outputColorSpace = v3->_outputColorSpace;
    v3->_outputColorSpace = (PVColorSpace *)v4;

    v3->_parentCode = -1;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initPreviewOptions");
  *(_DWORD *)(v4 + 8) = self->_parentCode;
  objc_storeStrong((id *)(v4 + 24), self->_outputColorSpace);
  *(_QWORD *)(v4 + 16) = self->_quality;
  return (id)v4;
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_quality = a3;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (void)setOutputColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_outputColorSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputColorSpace, 0);
}

@end
