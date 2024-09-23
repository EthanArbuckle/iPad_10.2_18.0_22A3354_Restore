@implementation VCImageRotationConverterBase

- (VCImageRotationConverterBase)initWithRotationAngle:(unsigned int)a3 formatType:(unsigned int)a4
{
  VCImageRotationConverterBase *v5;
  VCImageRotationConverterBase *v6;
  _QWORD *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCImageRotationConverterBase;
  v5 = -[VCImageConverterBase initWithFormatType:](&v9, sel_initWithFormatType_, *(_QWORD *)&a4);
  v6 = v5;
  if (v5)
  {
    v5->_rotationAngle = a3;
    VTImageRotationSessionCreate();
    v7 = (_QWORD *)MEMORY[0x1E0CED6D8];
    if (!a3)
      v7 = (_QWORD *)MEMORY[0x1E0CED6E0];
    MEMORY[0x1DF087BF4](v6->_rotationSession, *v7, *MEMORY[0x1E0C9AE50]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087BDC](self->_rotationSession, a2);
  VTImageRotationSessionRelease();
  v3.receiver = self;
  v3.super_class = (Class)VCImageRotationConverterBase;
  -[VCImageConverterBase dealloc](&v3, sel_dealloc);
}

@end
