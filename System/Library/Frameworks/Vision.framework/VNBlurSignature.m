@implementation VNBlurSignature

- (void)dealloc
{
  void **signatureData;
  objc_super v4;

  signatureData = (void **)self->_signatureData;
  if (signatureData)
  {
    free(signatureData[2]);
    free(signatureData);
  }
  v4.receiver = self;
  v4.super_class = (Class)VNBlurSignature;
  -[VNBlurSignature dealloc](&v4, sel_dealloc);
}

- (VNBlurSignature)initWithSignatureData:(void *)a3
{
  VNBlurSignature *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNBlurSignature;
  result = -[VNBlurSignature init](&v5, sel_init);
  if (result)
    result->_signatureData = a3;
  return result;
}

- (void)setSignatureData:(void *)a3
{
  self->_signatureData = a3;
}

- (void)getSignatureData
{
  return self->_signatureData;
}

+ (id)computeBlurSignatureForGrayscaleImage:(__CVBuffer *)a3 error:(id *)a4
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void **v9;
  unint64_t v10;
  VNBlurSignature *v11;
  void *v13;
  int v14;
  vision::mod::image_quality::BlurMeasure *v15;
  vImage_Buffer v16;

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v16.data = CVPixelBufferGetBaseAddress(a3);
  v16.height = Height;
  v16.width = Width;
  v16.rowBytes = BytesPerRow;
  v15 = 0;
  v14 = 0;
  v10 = vision::mod::image_quality::BlurMeasure::computeEdgeBasedBlurScoreForPlanar8Image((vision::mod::image_quality::BlurMeasure *)&v16, (vImage_Buffer *)&v14, 0, 0.0, 0, &v15, v9);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v10 == 2688)
  {
    v11 = [VNBlurSignature alloc];
    return -[VNBlurSignature initWithSignatureData:](v11, "initWithSignatureData:", v15);
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while computing blur score: %s"), CVML_getStatusDescription(v10));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

@end
