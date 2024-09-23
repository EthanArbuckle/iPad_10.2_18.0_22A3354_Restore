@implementation ISSegmentTintEffect

- (ISSegmentTintEffect)initWithColor:(id)a3
{
  id v5;
  ISSegmentTintEffect *v6;
  ISSegmentTintEffect *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISSegmentTintEffect;
  v6 = -[ISSegmentTintEffect init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (void)prepareSegmentedImageFromImage:(id)a3
{
  ISIconSegmentation *v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v4 = (ISIconSegmentation *)objc_claimAutoreleasedReturnValue();
  if ((-[ISIconSegmentation disableLegacyIconSegmentation](v4, "disableLegacyIconSegmentation") & 1) != 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  -[ISSegmentTintEffect segmentedImage](self, "segmentedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v4 = objc_alloc_init(ISIconSegmentation);
    v6 = -[ISIconSegmentation createTintableImageWithCGImage:](v4, "createTintableImageWithCGImage:", objc_msgSend(v9, "CGImage"));
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", v6);
      CFRelease(v7);
      -[ISSegmentTintEffect setSegmentedImage:](self, "setSegmentedImage:", v8);

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
  void *v9;
  ISTemplateTintEffect *v10;
  void *v11;
  ISTemplateTintEffect *v12;
  ISGreyscaleEffect *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF423108]();
  -[ISSegmentTintEffect prepareSegmentedImageFromImage:](self, "prepareSegmentedImageFromImage:", v7);
  -[ISSegmentTintEffect segmentedImage](self, "segmentedImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [ISTemplateTintEffect alloc];
    -[ISSegmentTintEffect color](self, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ISTemplateTintEffect initWithColor:](v10, "initWithColor:", v11);

    -[ISSegmentTintEffect segmentedImage](self, "segmentedImage");
    v13 = (ISGreyscaleEffect *)objc_claimAutoreleasedReturnValue();
    -[ISTemplateTintEffect filterWithBackgroundImage:inputImage:](v12, "filterWithBackgroundImage:inputImage:", v6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_alloc_init(ISGreyscaleEffect);
    -[ISGreyscaleEffect filterWithBackgroundImage:inputImage:](v13, "filterWithBackgroundImage:inputImage:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISSegmentTintEffect color](self, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ciColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v18, *MEMORY[0x1E0C9E1C0]);

    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIMultiplyCompositing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "outputImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forKey:", v20, *MEMORY[0x1E0C9E1F8]);

    objc_msgSend(v15, "outputImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forKey:", v21, *MEMORY[0x1E0C9E190]);

    v12 = v19;
    v14 = v12;
  }

  objc_autoreleasePoolPop(v8);
  return v14;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CIImage)segmentedImage
{
  return (CIImage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegmentedImage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedImage, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
