@implementation VCPTransforms

- (id)initImageTransform:(int)a3 transformedImageWidth:(int)a4 transformedImageHeight:(int)a5
{
  *((_DWORD *)self + 2) = a3;
  *((_DWORD *)self + 3) = a4;
  *((_DWORD *)self + 4) = a5;
  return self;
}

- (__CVBuffer)cropAndScale:(__CVBuffer *)a3 regionCrop:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v10;
  int v11;
  OSType PixelFormatType;
  __CVBuffer *result;
  int v14;
  int v15;
  CFTypeRef cf;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  cf = 0;
  v10 = CVPixelBufferGetWidth(a3);
  v11 = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  result = 0;
  if (v11 >= v10)
    v14 = v10;
  else
    v14 = v11;
  if (v14 >= self->_minSize)
  {
    if (PixelFormatType == 1111970369
      && self->_transformedImageWidth == v10
      && self->_transformedImageHeight == v11
      && (v17.origin.x = x, v17.origin.y = y, v17.size.width = width, v17.size.height = height, CGRectIsEmpty(v17)))
    {
      return (__CVBuffer *)CFRetain(a3);
    }
    else
    {
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v15 = Scaler::ScaleCropped(&self->_scaler, v18, a3, (__CVBuffer **)&cf, self->_transformedImageWidth, self->_transformedImageHeight, 1111970369);
      result = (__CVBuffer *)cf;
      if (v15)
      {
        if (cf)
        {
          CFRelease(cf);
          return 0;
        }
      }
    }
  }
  return result;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

@end
