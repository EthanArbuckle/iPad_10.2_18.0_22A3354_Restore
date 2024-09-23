@implementation BWInferenceFinalRectCropDescriptor

- (char)identifier
{
  return 1;
}

+ (id)finalCropRectDescriptorWithName:(id)a3
{
  return -[BWInferenceFinalRectCropDescriptor initWithName:]([BWInferenceFinalRectCropDescriptor alloc], a3);
}

- (_QWORD)initWithName:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)BWInferenceFinalRectCropDescriptor;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = a2;
  return v3;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  return a3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceFinalRectCropDescriptor;
  -[BWInferenceFinalRectCropDescriptor dealloc](&v3, sel_dealloc);
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  CGRect result;

  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  FigCFDictionaryGetCGRectIfPresent();
  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  return 1;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: name: %@"), objc_opt_class(), self, self->_name);
}

@end
