@implementation CNPhotoPickerRecentsProvider

- (CNPhotoPickerRecentsProvider)initWithVisualIdentity:(id)a3
{
  id v5;
  CNPhotoPickerRecentsProvider *v6;
  CNPhotoPickerRecentsProvider *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  CNPhotoPickerRecentsProvider *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerRecentsProvider;
  v6 = -[CNPhotoPickerRecentsProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->identifier;
    v7->identifier = (NSString *)v9;

    v11 = v7;
  }

  return v7;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  id (*v34)(uint64_t, void *);
  void *v35;
  CNPhotoPickerRecentsProvider *v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  BOOL v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  id v51;
  uint64_t v52;
  _QWORD v53[3];

  height = a3.height;
  width = a3.width;
  v53[1] = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  v17 = a8;
  -[CNPhotoPickerRecentsProvider visualIdentity](self, "visualIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CNPhotoPickerRecentsProvider setContainsContactImage:](self, "setContainsContactImage:", 0);
    -[CNPhotoPickerRecentsProvider setContainsMonogram:](self, "setContainsMonogram:", 0);
    v20 = objc_alloc_init(MEMORY[0x1E0C97238]);
    v21 = (void *)MEMORY[0x1E0C97228];
    -[CNPhotoPickerRecentsProvider visualIdentity](self, "visualIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recentImagesRequestForContactIdenfitiers:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0;
    objc_msgSend(v20, "performFetchRequest:error:", v25, &v51);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v51;
    v28 = (void *)MEMORY[0x1E0C9AA60];
    if (!v27 && v26)
    {
      v45 = 0;
      v46 = &v45;
      v47 = 0x3032000000;
      v48 = __Block_byref_object_copy__22917;
      v49 = __Block_byref_object_dispose__22918;
      v50 = 0;
      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = __101__CNPhotoPickerRecentsProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke;
      v35 = &unk_1E204A600;
      v36 = self;
      v41 = width;
      v42 = height;
      v43 = a4;
      v44 = a5;
      v37 = v15;
      v38 = v16;
      v40 = &v45;
      v39 = v17;
      objc_msgSend(v26, "_cn_compactMap:", &v32);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46[5])
      {
        v52 = v46[5];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1, v32, v33, v34, v35, v36, v37, v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v28);
        v30 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v30;
      }

      _Block_object_dispose(&v45, 8);
    }

  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v28;
}

- (id)providerItemForContactImage:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8
{
  return -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](self, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", a3, a6, a7, a8, 0, a4.width, a4.height, a5);
}

- (id)providerItemForContactImage:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 renderingQueue:(id)a7 callbackQueue:(id)a8 fallbackToDefaultItem:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v12;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  CNAvatarImageRenderer *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  CNPhotoPickerMonogramProviderItem *v28;
  void *v29;
  CNPhotoPickerEmojiProviderItem *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  CNPhotoPickerEmojiProviderItem *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CNPhotoPickerAnimojiProviderItem *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v9 = a9;
  v12 = a6;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v18 = a7;
  v19 = a8;
  v20 = objc_msgSend(v17, "source");
  switch(v20)
  {
    case 4:
      v35 = *MEMORY[0x1E0D13848];
      objc_msgSend(v17, "displayString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = (*(uint64_t (**)(uint64_t, void *))(v35 + 16))(v35, v36);

      if ((_DWORD)v35)
        v37 = !v9;
      else
        v37 = 1;
      if (!v37)
      {
LABEL_17:
        -[CNPhotoPickerRecentsProvider defaultProviderItemWithContactImage:renderingQueue:callbackQueue:](self, "defaultProviderItemWithContactImage:renderingQueue:callbackQueue:", v17, v18, v19);
        v30 = (CNPhotoPickerEmojiProviderItem *)objc_claimAutoreleasedReturnValue();
        break;
      }
      v38 = [CNPhotoPickerEmojiProviderItem alloc];
      objc_msgSend(v17, "displayString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "variant");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPhotoPickerVariantsManager colorVariantWithColorNamed:](CNPhotoPickerVariantsManager, "colorVariantWithColorNamed:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v38, "initWithStringRepresentation:backgroundColorVariant:size:", v39, v41, width, height);

      objc_msgSend(v17, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderItem setRecentsIdentifier:](v30, "setRecentsIdentifier:", v42);

      break;
    case 3:
      objc_msgSend(v17, "variant");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        if (!v9)
        {
          v30 = 0;
          break;
        }
        goto LABEL_17;
      }
      v44 = [CNPhotoPickerAnimojiProviderItem alloc];
      objc_msgSend(v17, "imageData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cropRect");
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v53 = v52;
      objc_msgSend(v17, "variant");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPhotoPickerVariantsManager colorVariantWithColorNamed:](CNPhotoPickerVariantsManager, "colorVariantWithColorNamed:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:](v44, "initWithOriginalImageData:cropRect:backgroundColorVariant:", v45, v55, v47, v49, v51, v53);

      objc_msgSend(v17, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderItem setRecentsIdentifier:](v30, "setRecentsIdentifier:", v56);

      objc_msgSend(v17, "poseConfigurationData");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        v58 = (void *)MEMORY[0x1E0C97350];
        objc_msgSend(v17, "sourceIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "avatarRecordForIdentifier:", v59);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[CNPhotoPickerEmojiProviderItem setAvatarRecord:](v30, "setAvatarRecord:", v21);
          objc_msgSend((id)objc_opt_class(), "poseConfigurationFromAvatarRecord:contactImage:", v21, v17);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPhotoPickerEmojiProviderItem setPoseConfiguration:](v30, "setPoseConfiguration:", v60);

        }
        goto LABEL_23;
      }
      break;
    case 1:
      +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v21);
      objc_msgSend(v17, "variant");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = objc_alloc(MEMORY[0x1E0D70A78]);
        objc_msgSend(v17, "variant");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithColorName:", v25);

        +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v12, 0, v26, width, height, a5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = [CNPhotoPickerMonogramProviderItem alloc];
        objc_msgSend(v17, "imageData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[CNPhotoPickerMonogramProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:](v28, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:", v29, 0, 0, v27, v22, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

        objc_msgSend(v17, "displayString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPhotoPickerEmojiProviderItem setMonogramText:](v30, "setMonogramText:", v31);

        -[CNPhotoPickerRecentsProvider visualIdentity](self, "visualIdentity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v32, "mutableCopy");
        -[CNPhotoPickerEmojiProviderItem setVisualIdentity:](v30, "setVisualIdentity:", v33);

        -[CNPhotoPickerEmojiProviderItem setAvatarRenderer:](v30, "setAvatarRenderer:", v22);
        -[CNPhotoPickerEmojiProviderItem setRenderingScope:](v30, "setRenderingScope:", v27);
        objc_msgSend(v17, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPhotoPickerProviderItem setRecentsIdentifier:](v30, "setRecentsIdentifier:", v34);

      }
      else if (v9)
      {
        -[CNPhotoPickerRecentsProvider defaultProviderItemWithContactImage:renderingQueue:callbackQueue:](self, "defaultProviderItemWithContactImage:renderingQueue:callbackQueue:", v17, v18, v19);
        v30 = (CNPhotoPickerEmojiProviderItem *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }

LABEL_23:
      break;
    default:
      goto LABEL_17;
  }

  return v30;
}

- (id)defaultProviderItemWithContactImage:(id)a3 renderingQueue:(id)a4 callbackQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNPhotoPickerRecentsProviderItem *v10;
  void *v11;
  void *v12;
  CNPhotoPickerRecentsProviderItem *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [CNPhotoPickerRecentsProviderItem alloc];
  objc_msgSend(v9, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "variant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cropRect");
  v13 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](v10, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v11, 0, 0, v12, v8, v7);

  objc_msgSend(v9, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerProviderItem setRecentsIdentifier:](v13, "setRecentsIdentifier:", v14);
  return v13;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (BOOL)containsContactImage
{
  return self->_containsContactImage;
}

- (void)setContainsContactImage:(BOOL)a3
{
  self->_containsContactImage = a3;
}

- (BOOL)containsMonogram
{
  return self->_containsMonogram;
}

- (void)setContainsMonogram:(BOOL)a3
{
  self->_containsMonogram = a3;
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

id __101__CNPhotoPickerRecentsProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _BOOL4 v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:", v3, *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  objc_msgSend(v4, "cropRect");
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "visualIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cropRect");
  if (v7 == v12 && v9 == v11)
  {
    objc_msgSend(v5, "cropRect");
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "visualIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cropRect");
    v14 = v16 == v18;

  }
  else
  {
    v14 = 0;
  }

  if (objc_msgSend(v5, "imageType") == 2 || (objc_msgSend(v5, "imageType") == 4 ? (v19 = 1) : (v19 = v14), v19 == 1))
  {
    objc_msgSend(v5, "imageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "visualIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqualToData:", v22);

    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 32), "setContainsContactImage:", 1);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);
LABEL_15:
      v24 = 0;
      goto LABEL_19;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setContainsMonogram:", 1);
  objc_msgSend(v3, "lastUsedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDate:", v25);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 56));
  v24 = v5;
LABEL_19:

  return v24;
}

+ (id)log
{
  if (log_cn_once_token_1_22928 != -1)
    dispatch_once(&log_cn_once_token_1_22928, &__block_literal_global_22929);
  return (id)log_cn_once_object_1_22930;
}

+ (id)poseConfigurationFromAvatarRecord:(id)a3 contactImage:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C97350];
  v6 = a3;
  objc_msgSend(a4, "poseConfigurationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "poseConfigurationForData:withAvatarRecord:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)poseConfigurationFromContactImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C97350];
  objc_msgSend(v3, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarRecordForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C97350];
    objc_msgSend(v3, "poseConfigurationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "poseConfigurationForData:withAvatarRecord:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __35__CNPhotoPickerRecentsProvider_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerRecentsProvider");
  v1 = (void *)log_cn_once_object_1_22930;
  log_cn_once_object_1_22930 = (uint64_t)v0;

}

@end
