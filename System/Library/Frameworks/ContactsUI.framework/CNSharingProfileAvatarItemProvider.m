@implementation CNSharingProfileAvatarItemProvider

- (CNSharingProfileAvatarItemProvider)initWithContact:(id)a3 avatarRecord:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNSharingProfileAvatarItemProvider *v12;
  CNSharingProfileAvatarItemProvider *v13;
  void *v14;
  CNAvatarImageRenderer *v15;
  CNAvatarImageRenderer *renderer;
  CNSharingProfileAvatarItemProviderConfiguration *v17;
  CNSharingProfileAvatarItemProviderConfiguration *configuration;
  CNSharingProfileAvatarItemProvider *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CNSharingProfileAvatarItemProvider;
  v12 = -[CNSharingProfileAvatarItemProvider init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_avatarRecord, a4);
    objc_storeStrong((id *)&v13->_logger, a5);
    +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v14);
    renderer = v13->_renderer;
    v13->_renderer = v15;

    *(_WORD *)&v13->_shouldIncludeAnimoji = 257;
    v13->_shouldIncludeMonogram = 1;
    v17 = objc_alloc_init(CNSharingProfileAvatarItemProviderConfiguration);
    configuration = v13->_configuration;
    v13->_configuration = v17;

    v13->_useRTL = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1;
    -[CNSharingProfileAvatarItemProvider pickRandomColors](v13, "pickRandomColors");
    v19 = v13;

  }
  return v13;
}

- (void)pickRandomColors
{
  CNPhotoPickerVariantsManager *variantsManager;
  CNPhotoPickerVariantsManager *v4;
  CNPhotoPickerVariantsManager *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  variantsManager = self->_variantsManager;
  if (!variantsManager)
  {
    v4 = objc_alloc_init(CNPhotoPickerVariantsManager);
    v5 = self->_variantsManager;
    self->_variantsManager = v4;

    variantsManager = self->_variantsManager;
  }
  -[CNPhotoPickerVariantsManager avatarBackgrounds](variantsManager, "avatarBackgrounds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = arc4random_uniform(v7 - 1);
  -[CNPhotoPickerVariantsManager avatarBackgrounds](self->_variantsManager, "avatarBackgrounds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileAvatarItemProviderConfiguration setAnimojiColor:](self->_configuration, "setAnimojiColor:", v10);

  objc_msgSend(MEMORY[0x1E0D70A78], "availableColors");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v12, "count") - 1) + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileAvatarItemProviderConfiguration setMonogramColor:](self->_configuration, "setMonogramColor:", v11);

}

- (void)setConfiguration:(id)a3
{
  CNSharingProfileAvatarItemProviderConfiguration *v5;
  CNSharingProfileAvatarItemProviderConfiguration **p_configuration;
  CNSharingProfileAvatarItemProviderConfiguration *configuration;
  CNSharingProfileAvatarItemProviderConfiguration *v8;

  v5 = (CNSharingProfileAvatarItemProviderConfiguration *)a3;
  if (v5)
  {
    configuration = self->_configuration;
    p_configuration = &self->_configuration;
    if (configuration != v5)
    {
      v8 = v5;
      objc_storeStrong((id *)p_configuration, a3);
      v5 = v8;
    }
  }

}

- (NSArray)avatarItems
{
  -[CNSharingProfileAvatarItemProvider buildItems](self, "buildItems");
  return self->_items;
}

- (BOOL)contactHasImageOfPhotoType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "imageDataAvailable"))
    v4 = objc_msgSend(v3, "rawImageType") == 1 || objc_msgSend(v3, "rawImageType") == 0;
  else
    v4 = 0;

  return v4;
}

- (void)buildItems
{
  CNSharingProfileAvatarItem *v3;
  CNSharingProfileAvatarItem *silhouetteItem;
  void *v5;
  CNContact *contact;
  CNAvatarImageRenderer *renderer;
  void *v8;
  CNSharingProfileAvatarItem *v9;
  void *v10;
  CNSharingProfileAvatarItem *previousAnimojiItem;
  CNSharingProfileAvatarItem *v12;
  void *v13;
  AVTAvatarRecord *avatarRecord;
  void *v15;
  void *v16;
  CNSharingProfileAvatarItem *v17;
  void *v18;
  void *v19;
  CNSharingProfileAvatarItem *v20;
  void *v21;
  CNSharingProfileAvatarItem *animojiItem;
  uint64_t v23;
  CNContact *v24;
  CNAvatarImageRenderer *v25;
  void *v26;
  void *v27;
  CNContact *v28;
  CNAvatarImageRenderer *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  CNContact *v33;
  CNAvatarImageRenderer *v34;
  CNSharingProfileAvatarItem *v35;
  CNSharingProfileAvatarItem *photoItem;
  CNSharingProfileAvatarItem *v37;
  CNSharingProfileAvatarItem *monogramItem;
  void *v39;
  CNContact *v40;
  void *v41;
  CNSharingProfileAvatarItem *v42;
  _BOOL8 v43;
  CNSharingProfileAvatarItem *previousPhotoItem;
  void *v45;
  void *v46;
  CNSharingProfileAvatarItem *v47;
  NSArray *v48;
  NSArray *items;
  id v50;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_shouldIncludeSilhouette)
  {
    if (self->_silhouetteItem
      || (objc_msgSend((id)objc_opt_class(), "silhouetteImageItemWithRenderer:", self->_renderer),
          v3 = (CNSharingProfileAvatarItem *)objc_claimAutoreleasedReturnValue(),
          silhouetteItem = self->_silhouetteItem,
          self->_silhouetteItem = v3,
          silhouetteItem,
          self->_silhouetteItem))
    {
      objc_msgSend(v50, "addObject:");
    }
  }
  if (self->_shouldIncludeAnimoji)
  {
    if (self->_animojiItem)
    {
LABEL_16:
      -[CNSharingProfileAvatarItemProviderConfiguration memojiMetadata](self->_configuration, "memojiMetadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfileAvatarItem setMemojiMetadata:](self->_animojiItem, "setMemojiMetadata:", v21);

      objc_msgSend(v50, "addObject:", self->_animojiItem);
      animojiItem = self->_animojiItem;
      if (self->_previousAnimojiItem != animojiItem)
        objc_storeStrong((id *)&self->_previousAnimojiItem, animojiItem);
      goto LABEL_18;
    }
    if (-[CNContact imageDataAvailable](self->_contact, "imageDataAvailable")
      && -[CNContact hasImageOfType:](self->_contact, "hasImageOfType:", 3))
    {
      v5 = (void *)objc_opt_class();
      contact = self->_contact;
      renderer = self->_renderer;
      -[CNSharingProfileAvatarItemProvider logger](self, "logger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactImageItemWithContact:renderer:logger:type:", contact, renderer, v8, 3);
      v9 = (CNSharingProfileAvatarItem *)objc_claimAutoreleasedReturnValue();

      -[CNSharingProfileAvatarItem setWasSetFromFullPhotoPicker:](v9, "setWasSetFromFullPhotoPicker:", self->_contactIsFromFullPhotoPicker);
      v10 = self->_animojiItem;
      self->_animojiItem = v9;
    }
    else
    {
      previousAnimojiItem = self->_previousAnimojiItem;
      if (previousAnimojiItem)
      {
        v12 = previousAnimojiItem;
        v10 = self->_animojiItem;
        self->_animojiItem = v12;
      }
      else
      {
        if (!self->_avatarRecord)
          goto LABEL_15;
        +[CNPhotoPickerVariantsManager sharingProfileAvatarPoseConfigurationForAvatarRecord:](CNPhotoPickerVariantsManager, "sharingProfileAvatarPoseConfigurationForAvatarRecord:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        avatarRecord = self->_avatarRecord;
        -[CNSharingProfileAvatarItemProviderConfiguration animojiColor](self->_configuration, "animojiColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "color");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "animojiItemWithRecord:stickerConfiguration:backgroundColor:", avatarRecord, v10, v16);
        v17 = (CNSharingProfileAvatarItem *)objc_claimAutoreleasedReturnValue();

        -[CNSharingProfileAvatarItemProviderConfiguration animojiColor](self->_configuration, "animojiColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "colorName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNSharingProfileAvatarItem setVariantIdentifier:](v17, "setVariantIdentifier:", v19);

        v20 = self->_animojiItem;
        self->_animojiItem = v17;

      }
    }

LABEL_15:
    if (!self->_animojiItem)
      goto LABEL_18;
    goto LABEL_16;
  }
LABEL_18:
  if (!self->_shouldIncludePhoto)
    goto LABEL_29;
  if (!self->_photoItem)
  {
    if (-[CNSharingProfileAvatarItemProvider contactHasImageOfPhotoType:](self, "contactHasImageOfPhotoType:", self->_contact))
    {
      v23 = objc_opt_class();
      v24 = self->_contact;
      v25 = self->_renderer;
      -[CNSharingProfileAvatarItemProvider logger](self, "logger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)v23;
      v28 = v24;
      v29 = v25;
      v30 = v26;
      v31 = 4;
    }
    else
    {
      if (-[CNContact rawImageType](self->_contact, "rawImageType") != 4)
      {
        previousPhotoItem = self->_previousPhotoItem;
        if (!previousPhotoItem)
        {
LABEL_26:
          if (!self->_photoItem)
            goto LABEL_29;
          goto LABEL_27;
        }
        v35 = previousPhotoItem;
LABEL_25:
        photoItem = self->_photoItem;
        self->_photoItem = v35;

        goto LABEL_26;
      }
      v32 = objc_opt_class();
      v33 = self->_contact;
      v34 = self->_renderer;
      -[CNSharingProfileAvatarItemProvider logger](self, "logger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)v32;
      v28 = v33;
      v29 = v34;
      v30 = v26;
      v31 = 5;
    }
    objc_msgSend(v27, "contactImageItemWithContact:renderer:logger:type:", v28, v29, v30, v31);
    v35 = (CNSharingProfileAvatarItem *)objc_claimAutoreleasedReturnValue();

    -[CNSharingProfileAvatarItem setWasSetFromFullPhotoPicker:](v35, "setWasSetFromFullPhotoPicker:", self->_contactIsFromFullPhotoPicker);
    goto LABEL_25;
  }
LABEL_27:
  objc_msgSend(v50, "addObject:");
  v37 = self->_photoItem;
  if (self->_previousPhotoItem != v37)
    objc_storeStrong((id *)&self->_previousPhotoItem, v37);
LABEL_29:
  if (self->_shouldIncludeMonogram)
  {
    monogramItem = self->_monogramItem;
    if (!monogramItem)
    {
      v39 = (void *)objc_opt_class();
      v40 = self->_contact;
      -[CNSharingProfileAvatarItemProviderConfiguration monogramColor](self->_configuration, "monogramColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "monogramImageItemWithContact:monogramColor:renderer:RTL:", v40, v41, self->_renderer, 0);
      v42 = (CNSharingProfileAvatarItem *)objc_claimAutoreleasedReturnValue();

      if (-[CNContact rawImageType](self->_contact, "rawImageType") == 2)
      {
        v43 = -[CNSharingProfileAvatarItem wasSetFromFullPhotoPicker](v42, "wasSetFromFullPhotoPicker")
           || self->_contactIsFromFullPhotoPicker;
        -[CNSharingProfileAvatarItem setWasSetFromFullPhotoPicker:](v42, "setWasSetFromFullPhotoPicker:", v43);
      }
      -[CNSharingProfileAvatarItemProviderConfiguration monogramColor](self->_configuration, "monogramColor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "colorName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfileAvatarItem setVariantIdentifier:](v42, "setVariantIdentifier:", v46);

      v47 = self->_monogramItem;
      self->_monogramItem = v42;

      monogramItem = self->_monogramItem;
    }
    objc_msgSend(v50, "addObject:", monogramItem);
  }
  v48 = (NSArray *)objc_msgSend(v50, "copy");
  items = self->_items;
  self->_items = v48;

}

- (void)updateWithContact:(id)a3 fromFullPhotoPicker:(BOOL)a4
{
  CNContact *v7;
  CNContact *contact;
  CNContact *v9;

  v7 = (CNContact *)a3;
  contact = self->_contact;
  self->_contactIsFromFullPhotoPicker = a4;
  if (contact != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNSharingProfileAvatarItemProvider clearCachedItems](self, "clearCachedItems");
    v7 = v9;
  }

}

- (void)setMonogramColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNSharingProfileAvatarItemProviderConfiguration monogramColor](self->_configuration, "monogramColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[CNSharingProfileAvatarItemProviderConfiguration setMonogramColor:](self->_configuration, "setMonogramColor:", v6);
    v5 = v6;
  }

}

- (PRMonogramColor)monogramColor
{
  return -[CNSharingProfileAvatarItemProviderConfiguration monogramColor](self->_configuration, "monogramColor");
}

- (void)setAnimojiColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNSharingProfileAvatarItemProviderConfiguration animojiColor](self->_configuration, "animojiColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[CNSharingProfileAvatarItemProviderConfiguration setAnimojiColor:](self->_configuration, "setAnimojiColor:", v6);
    v5 = v6;
  }

}

- (id)animojColor
{
  return -[CNSharingProfileAvatarItemProviderConfiguration animojiColor](self->_configuration, "animojiColor");
}

- (void)setMemojiMetadata:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CNSharingProfileAvatarItemProviderConfiguration memojiMetadata](self->_configuration, "memojiMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
    -[CNSharingProfileAvatarItemProviderConfiguration setMemojiMetadata:](self->_configuration, "setMemojiMetadata:", v6);

}

- (NSData)memojiMetadata
{
  return -[CNSharingProfileAvatarItemProviderConfiguration memojiMetadata](self->_configuration, "memojiMetadata");
}

- (CNSharingProfileAvatarItem)silhouetteItem
{
  CNSharingProfileAvatarItem *silhouetteItem;

  silhouetteItem = self->_silhouetteItem;
  if (!silhouetteItem)
  {
    if (self->_shouldIncludeSilhouette)
    {
      -[CNSharingProfileAvatarItemProvider buildItems](self, "buildItems");
      silhouetteItem = self->_silhouetteItem;
    }
    else
    {
      silhouetteItem = 0;
    }
  }
  return silhouetteItem;
}

- (CNSharingProfileAvatarItem)animojiItem
{
  CNSharingProfileAvatarItem *animojiItem;

  animojiItem = self->_animojiItem;
  if (!animojiItem)
  {
    if (self->_shouldIncludeAnimoji)
    {
      -[CNSharingProfileAvatarItemProvider buildItems](self, "buildItems");
      animojiItem = self->_animojiItem;
    }
    else
    {
      animojiItem = 0;
    }
  }
  return animojiItem;
}

- (CNSharingProfileAvatarItem)photoItem
{
  CNSharingProfileAvatarItem *photoItem;

  photoItem = self->_photoItem;
  if (!photoItem)
  {
    if (self->_shouldIncludePhoto)
    {
      -[CNSharingProfileAvatarItemProvider buildItems](self, "buildItems");
      photoItem = self->_photoItem;
    }
    else
    {
      photoItem = 0;
    }
  }
  return photoItem;
}

- (CNSharingProfileAvatarItem)monogramItem
{
  CNSharingProfileAvatarItem *monogramItem;

  monogramItem = self->_monogramItem;
  if (!monogramItem)
  {
    if (self->_shouldIncludeMonogram)
    {
      -[CNSharingProfileAvatarItemProvider buildItems](self, "buildItems");
      monogramItem = self->_monogramItem;
    }
    else
    {
      monogramItem = 0;
    }
  }
  return monogramItem;
}

- (void)clearCachedItems
{
  CNSharingProfileAvatarItem *silhouetteItem;
  CNSharingProfileAvatarItem *animojiItem;
  CNSharingProfileAvatarItem *photoItem;
  CNSharingProfileAvatarItem *monogramItem;
  NSArray *items;

  silhouetteItem = self->_silhouetteItem;
  self->_silhouetteItem = 0;

  animojiItem = self->_animojiItem;
  self->_animojiItem = 0;

  photoItem = self->_photoItem;
  self->_photoItem = 0;

  monogramItem = self->_monogramItem;
  self->_monogramItem = 0;

  items = self->_items;
  self->_items = 0;

}

- (BOOL)shouldIncludeSilhouette
{
  return self->_shouldIncludeSilhouette;
}

- (void)setShouldIncludeSilhouette:(BOOL)a3
{
  self->_shouldIncludeSilhouette = a3;
}

- (BOOL)shouldIncludeAnimoji
{
  return self->_shouldIncludeAnimoji;
}

- (void)setShouldIncludeAnimoji:(BOOL)a3
{
  self->_shouldIncludeAnimoji = a3;
}

- (BOOL)shouldIncludePhoto
{
  return self->_shouldIncludePhoto;
}

- (void)setShouldIncludePhoto:(BOOL)a3
{
  self->_shouldIncludePhoto = a3;
}

- (BOOL)shouldIncludeMonogram
{
  return self->_shouldIncludeMonogram;
}

- (void)setShouldIncludeMonogram:(BOOL)a3
{
  self->_shouldIncludeMonogram = a3;
}

- (void)setSilhouetteItem:(id)a3
{
  objc_storeStrong((id *)&self->_silhouetteItem, a3);
}

- (void)setAnimojiItem:(id)a3
{
  objc_storeStrong((id *)&self->_animojiItem, a3);
}

- (void)setPhotoItem:(id)a3
{
  objc_storeStrong((id *)&self->_photoItem, a3);
}

- (void)setMonogramItem:(id)a3
{
  objc_storeStrong((id *)&self->_monogramItem, a3);
}

- (CNSharingProfileAvatarItemProviderConfiguration)configuration
{
  return self->_configuration;
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (BOOL)contactIsFromFullPhotoPicker
{
  return self->_contactIsFromFullPhotoPicker;
}

- (void)setContactIsFromFullPhotoPicker:(BOOL)a3
{
  self->_contactIsFromFullPhotoPicker = a3;
}

- (CNSharingProfileAvatarItem)previousAnimojiItem
{
  return self->_previousAnimojiItem;
}

- (void)setPreviousAnimojiItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousAnimojiItem, a3);
}

- (CNSharingProfileAvatarItem)previousPhotoItem
{
  return self->_previousPhotoItem;
}

- (void)setPreviousPhotoItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousPhotoItem, a3);
}

- (BOOL)useRTL
{
  return self->_useRTL;
}

- (void)setUseRTL:(BOOL)a3
{
  self->_useRTL = a3;
}

- (CNPhotoPickerColorVariant)animojiColor
{
  return self->_animojiColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiColor, 0);
  objc_storeStrong((id *)&self->_previousPhotoItem, 0);
  objc_storeStrong((id *)&self->_previousAnimojiItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_monogramItem, 0);
  objc_storeStrong((id *)&self->_photoItem, 0);
  objc_storeStrong((id *)&self->_animojiItem, 0);
  objc_storeStrong((id *)&self->_silhouetteItem, 0);
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_31184 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_31184, &__block_literal_global_31185);
  return (id)descriptorForRequiredKeys_cn_once_object_1_31186;
}

+ (id)silhouetteImageItemWithRenderer:(id)a3
{
  id v3;
  CNSharingProfileAvatarItem *v4;
  id v5;
  CNSharingProfileAvatarItem *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [CNSharingProfileAvatarItem alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__CNSharingProfileAvatarItemProvider_silhouetteImageItemWithRenderer___block_invoke;
  v8[3] = &unk_1E204BDF0;
  v9 = v3;
  v5 = v3;
  v6 = -[CNSharingProfileAvatarItem initWithImageProvider:type:](v4, "initWithImageProvider:type:", v8, 0);

  return v6;
}

+ (id)contactImageItemWithContact:(id)a3 renderer:(id)a4 logger:(id)a5 type:(int64_t)a6
{
  id v8;
  id v9;
  CNSharingProfileAvatarItem *v10;
  id v11;
  id v12;
  CNSharingProfileAvatarItem *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = [CNSharingProfileAvatarItem alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__CNSharingProfileAvatarItemProvider_contactImageItemWithContact_renderer_logger_type___block_invoke;
  v15[3] = &unk_1E204BE18;
  v16 = v9;
  v17 = v8;
  v11 = v8;
  v12 = v9;
  v13 = -[CNSharingProfileAvatarItem initWithImageProvider:type:](v10, "initWithImageProvider:type:", v15, a6);

  return v13;
}

+ (id)monogramImageItemWithContact:(id)a3 monogramColor:(id)a4 renderer:(id)a5 RTL:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  CNSharingProfileAvatarItem *v16;
  id v17;
  id v18;
  id v19;
  CNSharingProfileAvatarItem *v20;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, double, double);
  void *v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  char v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  if (objc_msgSend(v12, "imageDataAvailable"))
  {
    if ((objc_msgSend(v12, "hasImageOfType:", 2) & 1) == 0)
    {
      v15 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v15, "removePhoto");
      v13 = v10;

      v14 = 0;
      goto LABEL_7;
    }
    v13 = 0;
    v14 = 1;
  }
  else
  {
    v13 = v10;
    v14 = 0;
  }
  v15 = v12;
LABEL_7:
  v16 = [CNSharingProfileAvatarItem alloc];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __94__CNSharingProfileAvatarItemProvider_monogramImageItemWithContact_monogramColor_renderer_RTL___block_invoke;
  v25 = &unk_1E204BE40;
  v29 = a6;
  v30 = v14;
  v26 = v13;
  v27 = v11;
  v28 = v15;
  v17 = v15;
  v18 = v11;
  v19 = v13;
  v20 = -[CNSharingProfileAvatarItem initWithImageProvider:type:](v16, "initWithImageProvider:type:", &v22, 1);
  -[CNSharingProfileAvatarItem setWasSetFromFullPhotoPicker:](v20, "setWasSetFromFullPhotoPicker:", v14, v22, v23, v24, v25);

  return v20;
}

+ (id)originalAnimojiImageForRecord:(id)a3 stickerConfiguration:(id)a4 size:(CGSize)a5
{
  double width;
  id v8;
  id v9;
  void *v10;
  CNAvatarStickerGeneratorProvider *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  double v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  width = a5.width;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "loadIfNeeded");
    v11 = -[CNAvatarStickerGeneratorProvider initWithAvatarRecord:]([CNAvatarStickerGeneratorProvider alloc], "initWithAvatarRecord:", v8);
    -[CNAvatarStickerGeneratorProvider generator](v11, "generator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAsync:", 0);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v13 = (void *)getAVTStickerGeneratorOptionsClass_softClass;
    v30 = getAVTStickerGeneratorOptionsClass_softClass;
    v14 = MEMORY[0x1E0C809B0];
    if (!getAVTStickerGeneratorOptionsClass_softClass)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = (uint64_t)__getAVTStickerGeneratorOptionsClass_block_invoke;
      v24 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E204EBC0;
      v25 = (void (*)(uint64_t))&v27;
      __getAVTStickerGeneratorOptionsClass_block_invoke((uint64_t)&v21);
      v13 = (void *)v28[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v27, 8);
    v16 = objc_alloc_init(v15);
    objc_msgSend(v10, "size");
    objc_msgSend(v16, "setSizeMultiplier:", width / v17);
    v21 = 0;
    v22 = (uint64_t)&v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__31172;
    v25 = __Block_byref_object_dispose__31173;
    v26 = 0;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __94__CNSharingProfileAvatarItemProvider_originalAnimojiImageForRecord_stickerConfiguration_size___block_invoke;
    v20[3] = &unk_1E204BE68;
    v20[4] = &v21;
    objc_msgSend(v12, "stickerImageWithConfiguration:options:completionHandler:", v10, v16, v20);
    v18 = *(id *)(v22 + 40);
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    objc_msgSend(a1, "unposedImageForAvatarRecord:", v8);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)animojiItemWithRecord:(id)a3 stickerConfiguration:(id)a4 backgroundColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNSharingProfileAvatarItem *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  CNSharingProfileAvatarItem *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [CNSharingProfileAvatarItem alloc];
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke;
  v22[3] = &unk_1E204BE90;
  v26 = a1;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke_2;
  v18[3] = &unk_1E204BEB8;
  v20 = v24;
  v21 = a1;
  v19 = v23;
  v13 = v24;
  v14 = v23;
  v15 = v10;
  v16 = -[CNSharingProfileAvatarItem initWithImageProvider:originalImageProvider:type:](v11, "initWithImageProvider:originalImageProvider:type:", v22, v18, 2);

  return v16;
}

+ (id)unposedImageForAvatarRecord:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v4 = (void *)getAVTAvatarRecordImageProviderClass_softClass_31150;
  v20 = getAVTAvatarRecordImageProviderClass_softClass_31150;
  if (!getAVTAvatarRecordImageProviderClass_softClass_31150)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getAVTAvatarRecordImageProviderClass_block_invoke_31151;
    v15 = &unk_1E204EBC0;
    v16 = &v17;
    __getAVTAvatarRecordImageProviderClass_block_invoke_31151((uint64_t)&v12);
    v4 = (void *)v18[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v17, 8);
  v6 = objc_alloc_init(v5);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)getAVTRenderingScopeClass_softClass_31152;
  v20 = getAVTRenderingScopeClass_softClass_31152;
  if (!getAVTRenderingScopeClass_softClass_31152)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getAVTRenderingScopeClass_block_invoke_31153;
    v15 = &unk_1E204EBC0;
    v16 = &v17;
    __getAVTRenderingScopeClass_block_invoke_31153((uint64_t)&v12);
    v7 = (void *)v18[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v8, "largeThumbnailScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForRecord:scope:", v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)compositeImageForImage:(id)a3 backgroundImage:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  id v13;
  void *v14;
  CGSize v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  v8 = v7;
  objc_msgSend(v6, "size");
  v10 = v9;
  objc_msgSend(v6, "scale");
  v12 = v11;
  v16.width = v8;
  v16.height = v10;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v12);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v8, v10);

  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v8, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

id __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 56), "originalAnimojiImageForRecord:stickerConfiguration:size:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerVariantsManager colorGradientBackground:](CNPhotoPickerVariantsManager, "colorGradientBackground:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "compositeImageForImage:backgroundImage:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __97__CNSharingProfileAvatarItemProvider_animojiItemWithRecord_stickerConfiguration_backgroundColor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "originalAnimojiImageForRecord:stickerConfiguration:size:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __94__CNSharingProfileAvatarItemProvider_originalAnimojiImageForRecord_stickerConfiguration_size___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:widthMultiplier:](CNAvatarImageUtilities, "croppedAndCenteredAvatarImageForImage:widthMultiplier:", a2, 1.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __94__CNSharingProfileAvatarItemProvider_monogramImageItemWithContact_monogramColor_renderer_RTL___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", *(unsigned __int8 *)(a1 + 56), 0, *(_QWORD *)(a1 + 32), a2, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 57))
  {
    v13[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarImageForContacts:scope:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "renderMonogramForContact:color:scope:prohibitedSources:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __87__CNSharingProfileAvatarItemProvider_contactImageItemWithContact_renderer_logger_type___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, a2, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  v13[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "avatarImageForContacts:scope:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __70__CNSharingProfileAvatarItemProvider_silhouetteImageItemWithRenderer___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  void *v6;
  double v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "placeholderImageProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v5, "imageForSize:scale:", a2, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __63__CNSharingProfileAvatarItemProvider_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  +[CNVisualIdentityPickerViewController descriptorForRequiredKeys](CNPhotoPickerViewController, "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96708];
  v8[0] = v0;
  v8[1] = v1;
  v2 = *MEMORY[0x1E0C966C8];
  v8[2] = *MEMORY[0x1E0C96890];
  v8[3] = v2;
  v8[4] = *MEMORY[0x1E0C96700];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSharingProfileAvatarItemProvider descriptorForRequiredKeys]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorWithKeyDescriptors:description:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)descriptorForRequiredKeys_cn_once_object_1_31186;
  descriptorForRequiredKeys_cn_once_object_1_31186 = v6;

}

@end
