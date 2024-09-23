@implementation FaceCoreImage

- (FaceCoreImage)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 bytesPerRow:(unint64_t)a5 buffer:(void *)a6 freeWhenDone:(BOOL)a7
{
  FaceCoreImage *v12;
  objc_super v14;

  if (a6
    && (v14.receiver = self,
        v14.super_class = (Class)FaceCoreImage,
        (self = -[FaceCoreImage init](&v14, sel_init)) != 0))
  {
    self->_width = a3;
    self->_height = a4;
    self->_bytesPerRow = a5;
    self->_freeWhenDone = a7;
    self->_rawDataBuffer = (char *)a6;
    self->_alignedDataBuffer = 0;
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (FaceCoreImage)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  vImagePixelCount width;
  vImagePixelCount height;
  void *data;
  vImagePixelCount v8;
  vImagePixelCount v9;
  FaceCoreImage *v10;
  vImage_Buffer dest;
  __CVBuffer *v13;
  vImage_Buffer src;
  __CVBuffer *v15;
  CVPixelBufferRef v16;

  if (CVPixelBufferGetPixelFormatType(a3) == 1111970369)
  {
    v13 = a3;
    if (a3)
      CVPixelBufferRetain(a3);
    apple::vision::LockedPixelImageBuffer<unsigned char const[4],1ull>::LockedPixelImageBuffer(&src.data, &v13);
    apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v13);
    height = src.height;
    width = src.width;
    dest.data = malloc_type_malloc(src.height * src.width, 0x45F04A5AuLL);
    dest.height = height;
    dest.width = width;
    dest.rowBytes = width;
    vImageMatrixMultiply_ARGB8888ToPlanar8(&src, &dest, convert32BGRAToGrayscale(__CVBuffer *)::coefficients, 256, convert32BGRAToGrayscale(__CVBuffer *)::prebias, 0, 0);
    data = dest.data;
    v8 = dest.height;
    v9 = dest.width;
    apple::vision::CVPixelBufferWrapper::BaseAddressLock<1ull>::~BaseAddressLock(&v16);
    apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v15);
    self = -[FaceCoreImage initWithWidth:height:bytesPerRow:buffer:freeWhenDone:](self, "initWithWidth:height:bytesPerRow:buffer:freeWhenDone:", v9, v8, v9, data, 1);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (FaceCoreImage)initWithCGImage:(CGImage *)a3
{
  int Width;
  int Height;
  void *v7;
  FaceCoreImage *v8;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FaceCoreImage initWithWidth:height:bytesPerRow:buffer:freeWhenDone:](self, "initWithWidth:height:bytesPerRow:buffer:freeWhenDone:", Width, Height, Width, apple::vision::libraries::facecore::utils::aev::AEVConversionUtils::convertCGImageToGrayscale(a3, v7), 1);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_alignedDataBuffer);
  if (self->_freeWhenDone)
    free(self->_rawDataBuffer);
  v3.receiver = self;
  v3.super_class = (Class)FaceCoreImage;
  -[FaceCoreImage dealloc](&v3, sel_dealloc);
}

- (char)alignedImageData
{
  unint64_t width;
  char **p_rawDataBuffer;
  int v5;
  unint64_t v6;
  int v7;
  size_t v8;

  width = self->_width;
  if (width == self->_bytesPerRow)
  {
    p_rawDataBuffer = &self->_rawDataBuffer;
  }
  else
  {
    p_rawDataBuffer = &self->_alignedDataBuffer;
    if (!self->_alignedDataBuffer)
    {
      self->_alignedDataBuffer = (char *)malloc_type_malloc(self->_height * width, 0xE559FE3CuLL);
      if (SLODWORD(self->_height) >= 1)
      {
        v5 = 0;
        LODWORD(v6) = 0;
        v7 = 0;
        v8 = self->_width;
        do
        {
          memcpy(&self->_alignedDataBuffer[v7], &self->_rawDataBuffer[(int)v6], v8);
          v8 = self->_width;
          v7 += v8;
          v6 = self->_bytesPerRow + (int)v6;
          ++v5;
        }
        while (v5 < SLODWORD(self->_height));
      }
    }
  }
  return *p_rawDataBuffer;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

@end
