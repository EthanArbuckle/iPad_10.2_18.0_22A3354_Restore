@implementation VCImageMirroringConverter

- (VCImageMirroringConverter)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 formatType:(unsigned int)a5
{
  VCImageMirroringConverter *v7;
  VCImageMirroringConverter *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCImageMirroringConverter;
  v7 = -[VCImageRotationConverterBase initWithRotationAngle:formatType:](&v10, sel_initWithRotationAngle_formatType_, 0, *(_QWORD *)&a5);
  v8 = v7;
  if (v7
    && !-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:](v7, "setUpBufferPoolForOutputWidth:outputHeight:", a3, a4))
  {

    return 0;
  }
  return v8;
}

@end
