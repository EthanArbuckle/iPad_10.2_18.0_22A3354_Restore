@implementation VNMPImageData

- (VNMPImageData)initWithVImage:(vImage_Buffer *)a3 externalImageId:(id)a4 andExifTimestampString:(id)a5 error:(id *)a6
{
  id v10;
  VNMPImageData *v11;

  v10 = a4;
  v11 = -[VNMPImageData initWithVImage:externalImageId:andExifTimestampValue:error:](self, "initWithVImage:externalImageId:andExifTimestampValue:error:", a3, v10, +[VNMPUtils parseExifTimestamp:](VNMPUtils, "parseExifTimestamp:", a5), a6);

  return v11;
}

- (VNMPImageData)initWithVImage:(vImage_Buffer *)a3 externalImageId:(id)a4 andExifTimestampValue:(int64_t)a5 error:(id *)a6
{
  id v11;
  void *v12;
  VNMPImageData *v13;
  VNMPImageData *v14;
  VNMPImageData *v15;
  objc_super v17;

  v11 = a4;
  if (!a6)
    __assert_rtn("-[VNMPImageData initWithVImage:externalImageId:andExifTimestampValue:error:]", "MPImageData.m", 29, "error != nil");
  v12 = v11;
  v17.receiver = self;
  v17.super_class = (Class)VNMPImageData;
  v13 = -[VNMPImageData init](&v17, sel_init);
  v14 = v13;
  if (v13
    && (v13->_freeImageInDealloc = 1,
        v13->_image = a3,
        v13->_imageCVPixelBuffer = 0,
        objc_storeStrong((id *)&v13->_externalImageId, a4),
        v14->_exifTimestamp = a5,
        a3->width > a3->rowBytes >> 2))
  {
    +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3196, CFSTR("ERROR: The input image does not seem to be 8888"));
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v14;
  }

  return v15;
}

- (VNMPImageData)initWithCVPixelBufferImage:(__CVBuffer *)a3 externalImageId:(id)a4 andExifTimestampString:(id)a5 error:(id *)a6
{
  id v10;
  VNMPImageData *v11;

  v10 = a4;
  v11 = -[VNMPImageData initWithCVPixelBufferImage:externalImageId:andExifTimestampValue:error:](self, "initWithCVPixelBufferImage:externalImageId:andExifTimestampValue:error:", a3, v10, +[VNMPUtils parseExifTimestamp:](VNMPUtils, "parseExifTimestamp:", a5), a6);

  return v11;
}

- (VNMPImageData)initWithCVPixelBufferImage:(__CVBuffer *)a3 externalImageId:(id)a4 andExifTimestampValue:(int64_t)a5 error:(id *)a6
{
  id v11;
  void *v12;
  VNMPImageData *v13;
  VNMPImageData *v14;
  objc_super v16;

  v11 = a4;
  if (!a6)
    __assert_rtn("-[VNMPImageData initWithCVPixelBufferImage:externalImageId:andExifTimestampValue:error:]", "MPImageData.m", 62, "error != nil");
  v12 = v11;
  v16.receiver = self;
  v16.super_class = (Class)VNMPImageData;
  v13 = -[VNMPImageData init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_freeImageInDealloc = 1;
    v13->_image = 0;
    v13->_imageCVPixelBuffer = a3;
    CVPixelBufferRetain(a3);
    objc_storeStrong((id *)&v14->_externalImageId, a4);
    v14->_exifTimestamp = a5;
  }

  return v14;
}

- (void)dealloc
{
  __CVBuffer *imageCVPixelBuffer;
  objc_super v4;

  if (self->_freeImageInDealloc)
  {
    +[VNMPUtils freeVImageBuffer:](VNMPUtils, "freeVImageBuffer:", self->_image);
    self->_image = 0;
  }
  imageCVPixelBuffer = self->_imageCVPixelBuffer;
  if (imageCVPixelBuffer)
  {
    CVPixelBufferRelease(imageCVPixelBuffer);
    self->_imageCVPixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNMPImageData;
  -[VNMPImageData dealloc](&v4, sel_dealloc);
}

- (vImage_Buffer)image
{
  return self->_image;
}

- (__CVBuffer)imageCVPixelBuffer
{
  return self->_imageCVPixelBuffer;
}

- (NSString)imageFilePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImageFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)freeImageInDealloc
{
  return self->_freeImageInDealloc;
}

- (void)setFreeImageInDealloc:(BOOL)a3
{
  self->_freeImageInDealloc = a3;
}

- (NSString)externalImageId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)exifTimestamp
{
  return self->_exifTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalImageId, 0);
  objc_storeStrong((id *)&self->_imageFilePath, 0);
}

@end
