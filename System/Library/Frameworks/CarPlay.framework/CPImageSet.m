@implementation CPImageSet

- (CPImageSet)initWithLightContentImage:(UIImage *)lightImage darkContentImage:(UIImage *)darkImage
{
  UIImage *v6;
  UIImage *v7;
  CPImageSet *v8;
  objc_class *v9;
  uint64_t v10;
  UIImage *lightContentImage;
  objc_class *v12;
  uint64_t v13;
  UIImage *darkContentImage;
  objc_super v16;

  v6 = lightImage;
  v7 = darkImage;
  v16.receiver = self;
  v16.super_class = (Class)CPImageSet;
  v8 = -[CPImageSet init](&v16, sel_init);
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v6, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    lightContentImage = v8->_lightContentImage;
    v8->_lightContentImage = (UIImage *)v10;

    v12 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v7, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    darkContentImage = v8->_darkContentImage;
    v8->_darkContentImage = (UIImage *)v13;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CPImageSet;
  -[CPImageSet description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {lightContentImage: %@, darkContentImage: %@}"), v4, self->_lightContentImage, self->_darkContentImage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPImageSet)initWithCoder:(id)a3
{
  id v4;
  CPImageSet *v5;
  uint64_t v6;
  UIImage *lightContentImage;
  uint64_t v8;
  UIImage *darkContentImage;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPImageSet;
  v5 = -[CPImageSet init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPLightContentImageKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    lightContentImage = v5->_lightContentImage;
    v5->_lightContentImage = (UIImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPDarkContentImageKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    darkContentImage = v5->_darkContentImage;
    v5->_darkContentImage = (UIImage *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CPImageSet lightContentImage](self, "lightContentImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPLightContentImageKey"));

  -[CPImageSet darkContentImage](self, "darkContentImage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPDarkContentImageKey"));

}

- (CPImageSet)initWithImage:(id)a3 treatmentBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  CPImageSet *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  UIImage *lightContentImage;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  UIImage *darkContentImage;
  uint64_t v30;
  UIImage *v31;
  uint64_t v32;
  UIImage *v33;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v35.receiver = self;
  v35.super_class = (Class)CPImageSet;
  v8 = -[CPImageSet init](&v35, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v12 = (void *)MEMORY[0x24BDF6F30];
      v37[0] = v9;
      v37[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "traitCollectionWithTraitsFromCollections:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x24BDF6F30];
      v36[0] = v9;
      v36[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "traitCollectionWithTraitsFromCollections:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v17;
      v10 = (void *)v14;
    }
    objc_msgSend(v6, "imageAsset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithTraitCollection:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "imageAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageWithTraitCollection:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (objc_class *)objc_opt_class();
    if (v19)
      v23 = v19;
    else
      v23 = v6;
    CPSanitizeImage(v23, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    lightContentImage = v8->_lightContentImage;
    v8->_lightContentImage = (UIImage *)v24;

    v26 = (objc_class *)objc_opt_class();
    if (v21)
      v27 = v21;
    else
      v27 = v6;
    CPSanitizeImage(v27, v26);
    v28 = objc_claimAutoreleasedReturnValue();
    darkContentImage = v8->_darkContentImage;
    v8->_darkContentImage = (UIImage *)v28;

    if (v7)
    {
      ((void (**)(id, UIImage *))v7)[2](v7, v8->_darkContentImage);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v8->_darkContentImage;
      v8->_darkContentImage = (UIImage *)v30;

      ((void (**)(id, UIImage *))v7)[2](v7, v8->_lightContentImage);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v8->_lightContentImage;
      v8->_lightContentImage = (UIImage *)v32;

    }
  }

  return v8;
}

- (CPImageSet)initWithImage:(id)a3
{
  return -[CPImageSet initWithImage:treatmentBlock:](self, "initWithImage:treatmentBlock:", a3, 0);
}

- (id)image
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  CPImageSetAssetRegistration *v9;
  void *v10;
  void *v11;
  CPImageSetAssetRegistration *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDF6F30], "_currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPImageSet currentAssetRegistration](self, "currentAssetRegistration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  -[CPImageSet currentAssetRegistration](self, "currentAssetRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v3);

  if ((v8 & 1) == 0)
  {
LABEL_3:
    v9 = [CPImageSetAssetRegistration alloc];
    -[CPImageSet lightContentImage](self, "lightContentImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPImageSet darkContentImage](self, "darkContentImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CPImageSetAssetRegistration initWithLightImage:darkImage:baseTraitCollection:](v9, "initWithLightImage:darkImage:baseTraitCollection:", v10, v11, v3);
    -[CPImageSet setCurrentAssetRegistration:](self, "setCurrentAssetRegistration:", v12);

  }
  -[CPImageSet currentAssetRegistration](self, "currentAssetRegistration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "combinedImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)swapStyles
{
  void *v3;
  id v4;

  -[CPImageSet lightContentImage](self, "lightContentImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CPImageSet darkContentImage](self, "darkContentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPImageSet setDarkContentImage:](self, "setDarkContentImage:", v4);
  -[CPImageSet setLightContentImage:](self, "setLightContentImage:", v3);

}

- (void)resizeImagesToSize:(CGSize)a3
{
  double height;
  double width;
  UIImage *lightContentImage;
  UIImage *v7;
  UIImage *v8;
  UIImage *darkContentImage;
  UIImage *v10;
  UIImage *v11;

  height = a3.height;
  width = a3.width;
  lightContentImage = self->_lightContentImage;
  if (lightContentImage)
  {
    CPImageByScalingImageToSize(lightContentImage, a3.width, a3.height);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lightContentImage;
    self->_lightContentImage = v7;

  }
  darkContentImage = self->_darkContentImage;
  if (darkContentImage)
  {
    CPImageByScalingImageToSize(darkContentImage, width, height);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v11 = self->_darkContentImage;
    self->_darkContentImage = v10;

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  UIImage *v6;
  void *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  UIImage *v11;
  void *v12;
  char v13;
  UIImage *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CPImageSet darkContentImage](self, "darkContentImage");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "darkContentImage");
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToData:", v9))
    {
      -[CPImageSet lightContentImage](self, "lightContentImage");
      v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lightContentImage");
      v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToData:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (UIImage)lightContentImage
{
  return self->_lightContentImage;
}

- (void)setLightContentImage:(id)a3
{
  objc_storeStrong((id *)&self->_lightContentImage, a3);
}

- (UIImage)darkContentImage
{
  return self->_darkContentImage;
}

- (void)setDarkContentImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkContentImage, a3);
}

- (CPImageSetAssetRegistration)currentAssetRegistration
{
  return self->_currentAssetRegistration;
}

- (void)setCurrentAssetRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_currentAssetRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetRegistration, 0);
  objc_storeStrong((id *)&self->_darkContentImage, 0);
  objc_storeStrong((id *)&self->_lightContentImage, 0);
}

@end
