@implementation NTKDynamicFacesGalleryCollection

- (NTKDynamicFacesGalleryCollection)initWithDevice:(id)a3 title:(id)a4 bundleIdentifier:(id)a5
{
  id v9;
  id v10;
  NTKDynamicFacesGalleryCollection *v11;
  NTKDynamicFacesGalleryCollection *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NTKDynamicFacesGalleryCollection;
  v11 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:](&v14, sel_initWithDevice_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    objc_storeStrong((id *)&v12->_bundleIdentifier, a5);
    -[NTKGalleryCollection setCalloutName:](v12, "setCalloutName:", &__block_literal_global_66);
  }

  return v12;
}

uint64_t __74__NTKDynamicFacesGalleryCollection_initWithDevice_title_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_dynamicCollectionFaceGalleryCalloutName");
}

- (id)title
{
  return self->_title;
}

- (BOOL)bundleWantsDynamicCollection
{
  void *v3;
  NSString *bundleIdentifier;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  -[NTKDeviceSpecificFacesArrayGalleryCollection device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceBundleForBundleIdentifier:onDevice:", bundleIdentifier, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NTKDeviceSpecificFacesArrayGalleryCollection device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "useDynamicCollectionForDevice:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)facesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[NTKDynamicFacesGalleryCollection bundleWantsDynamicCollection](self, "bundleWantsDynamicCollection"))
  {
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceBundleForBundleIdentifier:onDevice:", self->_bundleIdentifier, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "galleryFacesInDynamicCollectionForDevice:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
