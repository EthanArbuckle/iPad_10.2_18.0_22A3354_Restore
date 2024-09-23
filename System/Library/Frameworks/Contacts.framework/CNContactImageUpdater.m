@implementation CNContactImageUpdater

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[12];

  v7[11] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("imageDataAvailable");
  v7[1] = CFSTR("thumbnailImageData");
  v7[2] = CFSTR("cropRect");
  v7[3] = CFSTR("fullscreenImageData");
  v7[4] = CFSTR("preferredLikenessSource");
  v7[5] = CFSTR("imageType");
  v7[6] = CFSTR("imageHash");
  v7[7] = CFSTR("memojiMetadata");
  v7[8] = CFSTR("imageBackgroundColorsData");
  v7[9] = CFSTR("wallpaper");
  v7[10] = CFSTR("watchWallpaperImageData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNContactImageUpdater)initWithContact:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  CNContactImageUpdater *v9;
  CNContactImageUpdater *v10;
  CNContactImageUpdater *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactImageUpdater;
  v9 = -[CNContactImageUpdater init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a4);
    objc_storeStrong((id *)&v10->_contact, a3);
    v11 = v10;
  }

  return v10;
}

+ (id)log
{
  if (log_cn_once_token_0_14 != -1)
    dispatch_once(&log_cn_once_token_0_14, &__block_literal_global_150);
  return (id)log_cn_once_object_0_14;
}

void __28__CNContactImageUpdater_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "contactimageupdater");
  v1 = (void *)log_cn_once_object_0_14;
  log_cn_once_object_0_14 = (uint64_t)v0;

}

- (BOOL)updateImageWithImageContact:(id)a3 setAsMe:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CNSaveRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(CNSaveRequest);
  v8 = (void *)objc_opt_class();
  -[CNContactImageUpdater contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateMutableContact:withImageAndWallpaperPropertiesFromContact:", v9, v6);

  -[CNContactImageUpdater contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasBeenPersisted");

  -[CNContactImageUpdater contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 & 1) != 0)
    -[CNSaveRequest updateContact:](v7, "updateContact:", v12);
  else
    -[CNSaveRequest addContact:toContainerWithIdentifier:](v7, "addContact:toContainerWithIdentifier:", v12, 0);

  objc_msgSend((id)objc_opt_class(), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[CNContactImageUpdater contact](self, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v15;
    _os_log_impl(&dword_18F8BD000, v13, OS_LOG_TYPE_DEFAULT, "Saving contact with identifier %{public}@", buf, 0xCu);

  }
  -[CNContactImageUpdater contactStore](self, "contactStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v17 = objc_msgSend(v16, "executeSaveRequest:error:", v7, &v28);
  v18 = v28;

  if ((v17 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CNContactImageUpdater updateImageWithImageContact:setAsMe:].cold.2(v18);
    goto LABEL_20;
  }
  if ((v4 & ~v11) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F8BD000, v19, OS_LOG_TYPE_DEFAULT, "Saving contact", buf, 2u);
    }

    -[CNContactImageUpdater contactStore](self, "contactStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactImageUpdater contact](self, "contact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v22 = objc_msgSend(v20, "setMeContact:error:", v21, &v27);
    v23 = v27;

    if ((v22 & 1) != 0)
    {

      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[CNContactImageUpdater updateImageWithImageContact:setAsMe:].cold.1(v23);

LABEL_20:
    v24 = 0;
    goto LABEL_21;
  }
LABEL_12:
  objc_msgSend((id)objc_opt_class(), "log");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F8BD000, v23, OS_LOG_TYPE_DEFAULT, "Saving contact succeeded", buf, 2u);
  }
  v24 = 1;
LABEL_21:

  return v24;
}

+ (void)updateMutableContact:(id)a3 withImageAndWallpaperPropertiesFromContact:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "updateMutableContact:withImagePropertiesFromContact:", v6, v5);
  objc_msgSend((id)objc_opt_class(), "updateMutableContact:withWallpaperPropertiesFromContact:", v6, v5);

}

+ (void)updateMutableContact:(id)a3 withImagePropertiesFromContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageData:", v7);

  objc_msgSend(v5, "cropRect");
  objc_msgSend(v6, "setCropRect:");
  objc_msgSend(v5, "thumbnailImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThumbnailImageData:", v8);

  objc_msgSend(v5, "fullscreenImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFullscreenImageData:", v9);

  objc_msgSend(v5, "preferredLikenessSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredLikenessSource:", v10);

  objc_msgSend(v5, "imageType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageType:", v11);

  objc_msgSend(v5, "imageHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageHash:", v12);

  objc_msgSend(v5, "memojiMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMemojiMetadata:", v13);

  objc_msgSend(v5, "imageBackgroundColorsData");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setImageBackgroundColorsData:", v14);
}

+ (void)updateMutableContact:(id)a3 withWallpaperPropertiesFromContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "isKeyAvailable:", CFSTR("wallpaper")))
  {
    objc_msgSend(v5, "wallpaper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWallpaper:", v6);

  }
  if (objc_msgSend(v5, "isKeyAvailable:", CFSTR("watchWallpaperImageData")))
  {
    objc_msgSend(v5, "watchWallpaperImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWatchWallpaperImageData:", v7);

  }
}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)updateImageWithImageContact:(void *)a1 setAsMe:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Error setting me contact: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)updateImageWithImageContact:(void *)a1 setAsMe:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Error saving contact: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
