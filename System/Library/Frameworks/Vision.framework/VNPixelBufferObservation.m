@implementation VNPixelBufferObservation

- (VNPixelBufferObservation)initWithOriginatingRequestSpecifier:(id)a3 featureName:(id)a4 CVPixelBuffer:(__CVBuffer *)a5
{
  id v8;
  id v9;
  VNPixelBufferObservation *v10;
  uint64_t v11;
  NSString *featureName;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNPixelBufferObservation;
  v10 = -[VNObservation initWithOriginatingRequestSpecifier:](&v14, sel_initWithOriginatingRequestSpecifier_, v8);
  if (v10)
  {
    v10->_pixelBuffer = CVPixelBufferRetain(a5);
    v11 = objc_msgSend(v9, "copy");
    featureName = v10->_featureName;
    v10->_featureName = (NSString *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VNPixelBufferObservation;
  -[VNPixelBufferObservation dealloc](&v3, sel_dealloc);
}

- (VNPixelBufferObservation)initWithCoder:(id)a3
{
  id v4;
  VNPixelBufferObservation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *featureName;
  VNPixelBufferObservation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNPixelBufferObservation;
  v5 = -[VNObservation initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5
    && (v6 = objc_msgSend(v4, "vn_decodePixelBufferForKey:", CFSTR("vnpbo_pbdict")),
        (v5->_pixelBuffer = (__CVBuffer *)v6) != 0))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v8;

    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNPixelBufferObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodePixelBuffer:forKey:", self->_pixelBuffer, CFSTR("vnpbo_pbdict"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureName, CFSTR("featureName"));

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNPixelBufferObservation;
  -[VNObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v3[12] = CVPixelBufferRetain(self->_pixelBuffer);
    v4 = -[NSString copy](self->_featureName, "copy");
    v5 = (void *)v3[13];
    v3[13] = v4;

  }
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)VNPixelBufferObservation;
  -[VNObservation description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[VNPixelBufferObservation featureName](self, "featureName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(v3, "appendFormat:", CFSTR(" \"%@\"), v5);
  v7 = (__CFString *)CFCopyDescription(self->_pixelBuffer);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v7);

  return v3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNPixelBufferObservation;
  return +[VNCVPixelBufferConversionHelpers computeHashForCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "computeHashForCVPixelBuffer:", self->_pixelBuffer) ^ __ROR8__(-[VNObservation hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNPixelBufferObservation;
  v5 = -[VNObservation isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[VNCVPixelBufferConversionHelpers isCVPixelBuffer:equalToCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "isCVPixelBuffer:equalToCVPixelBuffer:", self->_pixelBuffer, v4[12]);

  return v5;
}

- (id)debugQuickLookObject
{
  OSType PixelFormatType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGImage *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  if (PixelFormatType - 1278226488 > 0x30
    || ((1 << (PixelFormatType - 56)) & 0x1400000000001) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", self->_pixelBuffer);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVImageBuffer:", self->_pixelBuffer);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("inputBVector");
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extent");
    v10 = (CGImage *)objc_msgSend(v9, "createCGImage:fromRect:", v8);
    VNDebugImageFromCGImage((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v10);

    return v11;
  }
}

- (CVPixelBufferRef)pixelBuffer
{
  return self->_pixelBuffer;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (CGRect)croppedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_croppedBoundingBox.origin.x;
  y = self->_croppedBoundingBox.origin.y;
  width = self->_croppedBoundingBox.size.width;
  height = self->_croppedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCoreMLRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__CVBuffer)createPixelBufferInOrientation:(unsigned int)a3 error:(id *)a4
{
  __CVBuffer *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t PixelFormatType;
  __CVBuffer *v14;
  id v15;
  void *v16;
  _BYTE v18[48];

  v6 = -[VNPixelBufferObservation pixelBuffer](self, "pixelBuffer");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", v6);
  objc_msgSend(v7, "imageByApplyingTransform:", v18, VNAffineTransformForVisionToTopLeftOriginOrientation(0, a3, (uint64_t)v18));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "extent");
  v10 = v9;
  v12 = v11;
  PixelFormatType = CVPixelBufferGetPixelFormatType(v6);
  v14 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)v10, (unint64_t)v12, PixelFormatType, a4);
  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0C9DD90]);
    v16 = (void *)objc_msgSend(v15, "initWithOptions:", MEMORY[0x1E0C9AA70]);
    objc_msgSend(v16, "render:toCVPixelBuffer:", v8, v14);

  }
  return v14;
}

@end
