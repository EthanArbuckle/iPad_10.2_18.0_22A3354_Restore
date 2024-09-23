@implementation VNPixelBufferMLFeatureProvider

- (VNPixelBufferMLFeatureProvider)initWithPixelBuffer:(__CVBuffer *)a3 forKey:(id)a4 originalFeatureProvider:(id)a5
{
  id v8;
  id v9;
  VNPixelBufferMLFeatureProvider *v10;
  uint64_t v11;
  NSString *imageInputKey;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VNPixelBufferMLFeatureProvider;
  v10 = -[VNPixelBufferMLFeatureProvider init](&v14, sel_init);
  if (v10)
  {
    v10->_pixelBuffer = CVPixelBufferRetain(a3);
    v11 = objc_msgSend(v8, "copy");
    imageInputKey = v10->_imageInputKey;
    v10->_imageInputKey = (NSString *)v11;

    objc_storeStrong((id *)&v10->_originalFeatureProvider, a5);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  self->_pixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNPixelBufferMLFeatureProvider;
  -[VNPixelBufferMLFeatureProvider dealloc](&v3, sel_dealloc);
}

- (NSSet)featureNames
{
  void *v3;
  MLFeatureProvider *originalFeatureProvider;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", self->_imageInputKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  originalFeatureProvider = self->_originalFeatureProvider;
  if (originalFeatureProvider)
  {
    -[MLFeatureProvider featureNames](originalFeatureProvider, "featureNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v5);

  }
  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", self->_imageInputKey))
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", self->_pixelBuffer);
  else
    -[MLFeatureProvider featureValueForName:](self->_originalFeatureProvider, "featureValueForName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureProvider, 0);
  objc_storeStrong((id *)&self->_imageInputKey, 0);
}

@end
