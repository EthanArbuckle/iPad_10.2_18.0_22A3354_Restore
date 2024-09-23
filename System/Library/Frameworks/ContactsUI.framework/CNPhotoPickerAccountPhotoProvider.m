@implementation CNPhotoPickerAccountPhotoProvider

- (CNPhotoPickerAccountPhotoProvider)initWithVisualIdentity:(id)a3 includeUnifiedContactImages:(BOOL)a4
{
  id v7;
  CNPhotoPickerAccountPhotoProvider *v8;
  CNPhotoPickerAccountPhotoProvider *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  CNPhotoPickerAccountPhotoProvider *v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerAccountPhotoProvider;
  v8 = -[CNPhotoPickerAccountPhotoProvider init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualIdentity, a3);
    v9->_includeUnifiedContactImages = a4;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v9->identifier;
    v9->identifier = (NSString *)v11;

    v13 = v9;
  }

  return v9;
}

- (CNPhotoPickerAccountPhotoProvider)initWithVisualIdentity:(id)a3
{
  return -[CNPhotoPickerAccountPhotoProvider initWithVisualIdentity:includeUnifiedContactImages:](self, "initWithVisualIdentity:includeUnifiedContactImages:", a3, 1);
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  _BOOL8 v10;
  double height;
  double width;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[3];

  v10 = a5;
  height = a3.height;
  width = a3.width;
  v42[1] = *MEMORY[0x1E0C80C00];
  v36 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CNPhotoPickerAccountPhotoProvider includeUnifiedContactImages](self, "includeUnifiedContactImages"))
  {
    -[CNPhotoPickerAccountPhotoProvider visualIdentity](self, "visualIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "hasLinkedContacts"))
    {
      -[CNPhotoPickerAccountPhotoProvider visualIdentity](self, "visualIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "linkedContacts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  v34 = v19;
  objc_msgSend(v19, "_cn_map:", &__block_literal_global_35264);
  v20 = objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerAccountPhotoProvider visualIdentity](self, "visualIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v20;
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v29, "imageData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          -[CNPhotoPickerAccountPhotoProvider providerItemForVisualIdentity:forSize:scale:RTL:renderingQueue:callbackQueue:itemDelegate:](self, "providerItemForVisualIdentity:forSize:scale:RTL:renderingQueue:callbackQueue:itemDelegate:", v29, v10, v36, v15, v16, width, height, a4);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v31);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v26);
  }

  return v35;
}

- (id)providerItemForVisualIdentity:(id)a3 forSize:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8 itemDelegate:(id)a9
{
  _BOOL8 v11;
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  CNAvatarImageRenderer *v21;
  void *v22;
  CNPhotoPickerMonogramProviderItem *v23;
  void *v24;
  void *v25;
  void *v26;
  CNPhotoPickerMonogramProviderItem *v27;
  CNPhotoPickerEmojiProviderItem *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __objc2_class *v33;
  id v34;
  char v35;
  void *v37;

  v11 = a6;
  height = a4.height;
  width = a4.width;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a3;
  v20 = objc_msgSend(v19, "contactImageType");
  if (v20 == 4)
  {
    v28 = [CNPhotoPickerEmojiProviderItem alloc];
    objc_msgSend(v19, "imageData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "thumbnailImageData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fullscreenImageData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cropRect");
    v32 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](v28, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v29, v30, v31);
  }
  else
  {
    if (v20 == 3)
    {
      v33 = CNPhotoPickerAnimojiProviderItem;
    }
    else
    {
      if (v20 == 2)
      {
        +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v37);
        +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v11, 0, 0, width, height, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = [CNPhotoPickerMonogramProviderItem alloc];
        objc_msgSend(v19, "imageData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "thumbnailImageData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fullscreenImageData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](v23, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v24, v25, v26, 0, v16, v17, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

        -[CNPhotoPickerMonogramProviderItem setHasUnknownColor:](v27, "setHasUnknownColor:", 1);
        -[CNPhotoPickerMonogramProviderItem setAvatarRenderer:](v27, "setAvatarRenderer:", v21);
        -[CNPhotoPickerMonogramProviderItem setRenderingScope:](v27, "setRenderingScope:", v22);
        -[CNPhotoPickerMonogramProviderItem setIsContactImage:](v27, "setIsContactImage:", 1);
        -[CNPhotoPickerMonogramProviderItem setVisualIdentity:](v27, "setVisualIdentity:", v19);

        goto LABEL_10;
      }
      v33 = CNPhotoPickerProviderItem;
    }
    v34 = [v33 alloc];
    objc_msgSend(v19, "imageData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "thumbnailImageData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fullscreenImageData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cropRect");
    v32 = objc_msgSend(v34, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v29, v30, v31, 0, v16, v17);
  }
  v27 = (CNPhotoPickerMonogramProviderItem *)v32;

  -[CNPhotoPickerProviderItem setDelegate:](v27, "setDelegate:", v18);
LABEL_10:
  v35 = objc_msgSend(v19, "imageAllowsEditing");

  if ((v35 & 1) == 0)
    -[CNPhotoPickerProviderItem setAllowsEditing:](v27, "setAllowsEditing:", 0);

  return v27;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (BOOL)includeUnifiedContactImages
{
  return self->_includeUnifiedContactImages;
}

- (void)setIncludeUnifiedContactImages:(BOOL)a3
{
  self->_includeUnifiedContactImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

CNVisualIdentity *__106__CNPhotoPickerAccountPhotoProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNVisualIdentity *v3;

  v2 = a2;
  v3 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v2);

  return v3;
}

@end
