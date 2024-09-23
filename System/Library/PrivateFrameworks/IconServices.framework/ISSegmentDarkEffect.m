@implementation ISSegmentDarkEffect

- (ISSegmentDarkEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISSegmentDarkEffect;
  return -[ISSegmentDarkEffect init](&v3, sel_init);
}

- (void)prepareSegmentedImageFromImage:(id)a3
{
  ISIconSegmentation *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v4 = (ISIconSegmentation *)objc_claimAutoreleasedReturnValue();
  if (!-[ISIconSegmentation isDarkIconSegmentationEnabled](v4, "isDarkIconSegmentationEnabled"))
  {
LABEL_5:

    goto LABEL_6;
  }
  -[ISSegmentDarkEffect segmentedImage](self, "segmentedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v4 = objc_alloc_init(ISIconSegmentation);
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISIconSegmentation setEnableColorEnhancementInDarkImage:](v4, "setEnableColorEnhancementInDarkImage:", objc_msgSend(v6, "isDarkIconColorEnhancementEnabled"));

    -[ISIconSegmentation setEnableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage:](v4, "setEnableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage:", 1);
    v7 = -[ISIconSegmentation createDarkImageWithCGImage:](v4, "createDarkImageWithCGImage:", objc_msgSend(v10, "CGImage"));
    if (v7)
    {
      v8 = (const void *)v7;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", v7);
      CFRelease(v8);
      -[ISSegmentDarkEffect setSegmentedImage:](self, "setSegmentedImage:", v9);

    }
    goto LABEL_5;
  }
LABEL_6:

}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  ISIntelligentDimEffect *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF423108]();
  v9 = v7;
  -[ISSegmentDarkEffect prepareSegmentedImageFromImage:](self, "prepareSegmentedImageFromImage:", v9);
  -[ISSegmentDarkEffect segmentedImage](self, "segmentedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v9;
  if (v10)
  {
    -[ISSegmentDarkEffect segmentedImage](self, "segmentedImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = objc_alloc_init(ISIntelligentDimEffect);
  -[ISIntelligentDimEffect setFlagDimming:](v12, "setFlagDimming:", 0);
  -[ISIntelligentDimEffect filterWithBackgroundImage:inputImage:](v12, "filterWithBackgroundImage:inputImage:", v6, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v13;
}

- (CIImage)segmentedImage
{
  return (CIImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSegmentedImage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedImage, 0);
}

@end
