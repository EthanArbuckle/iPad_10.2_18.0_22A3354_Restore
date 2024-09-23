@implementation CPImageSetAssetRegistration

- (CPImageSetAssetRegistration)initWithLightImage:(id)a3 darkImage:(id)a4 baseTraitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPImageSetAssetRegistration *v11;
  CPImageSetAssetRegistration *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UITraitCollection *lightTraitCollection;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UITraitCollection *darkTraitCollection;
  id v23;
  void *v24;
  uint64_t v25;
  UIImage *combinedImage;
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CPImageSetAssetRegistration;
  v11 = -[CPImageSetAssetRegistration init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_baseTraitCollection, a5);
    v13 = (void *)MEMORY[0x24BDF6F30];
    v30[0] = v10;
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollectionWithTraitsFromCollections:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    lightTraitCollection = v12->_lightTraitCollection;
    v12->_lightTraitCollection = (UITraitCollection *)v16;

    v18 = (void *)MEMORY[0x24BDF6F30];
    v29[0] = v10;
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "traitCollectionWithTraitsFromCollections:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    darkTraitCollection = v12->_darkTraitCollection;
    v12->_darkTraitCollection = (UITraitCollection *)v21;

    v23 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
    v24 = v23;
    if (v8)
      objc_msgSend(v23, "registerImage:withTraitCollection:", v8, v12->_lightTraitCollection);
    if (v9)
      objc_msgSend(v24, "registerImage:withTraitCollection:", v9, v12->_darkTraitCollection);
    objc_msgSend(v24, "imageWithTraitCollection:", v10);
    v25 = objc_claimAutoreleasedReturnValue();
    combinedImage = v12->_combinedImage;
    v12->_combinedImage = (UIImage *)v25;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[CPImageSetAssetRegistration combinedImage](self, "combinedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPImageSetAssetRegistration lightTraitCollection](self, "lightTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterImageWithTraitCollection:", v5);

  -[CPImageSetAssetRegistration combinedImage](self, "combinedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPImageSetAssetRegistration darkTraitCollection](self, "darkTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterImageWithTraitCollection:", v8);

  v9.receiver = self;
  v9.super_class = (Class)CPImageSetAssetRegistration;
  -[CPImageSetAssetRegistration dealloc](&v9, sel_dealloc);
}

- (UITraitCollection)baseTraitCollection
{
  return self->_baseTraitCollection;
}

- (UITraitCollection)lightTraitCollection
{
  return self->_lightTraitCollection;
}

- (UITraitCollection)darkTraitCollection
{
  return self->_darkTraitCollection;
}

- (UIImage)combinedImage
{
  return self->_combinedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedImage, 0);
  objc_storeStrong((id *)&self->_darkTraitCollection, 0);
  objc_storeStrong((id *)&self->_lightTraitCollection, 0);
  objc_storeStrong((id *)&self->_baseTraitCollection, 0);
}

@end
