@implementation CNPhotoPickerViewController

- (CNPhotoPickerViewController)initWithContact:(id)a3 style:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNContactViewCache *v11;
  CNVisualIdentity *v12;
  CNPhotoPickerDataSource *v13;
  uint64_t v14;
  CNPhotoPickerViewController *v15;
  void *v16;
  objc_super v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(CNContactViewCache);
  v12 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v10);
  v13 = -[CNPhotoPickerDataSource initWithVisualIdentity:contactViewCache:photoPickerConfiguration:]([CNPhotoPickerDataSource alloc], "initWithVisualIdentity:contactViewCache:photoPickerConfiguration:", v12, v11, v8);
  v14 = objc_msgSend(v8, "allowRotation");

  v18.receiver = self;
  v18.super_class = (Class)CNPhotoPickerViewController;
  v15 = -[CNVisualIdentityPickerViewController initWithPhotosDataSource:style:allowRotation:](&v18, sel_initWithPhotosDataSource_style_allowRotation_, v13, v9, v14);

  v16 = (void *)objc_msgSend(v10, "mutableCopy");
  -[CNPhotoPickerViewController setPendingEditContact:](v15, "setPendingEditContact:", v16);

  return v15;
}

- (void)updateHeaderViewAvatar
{
  objc_super v3;

  -[CNPhotoPickerViewController updatePendingEditContact](self, "updatePendingEditContact");
  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerViewController;
  -[CNVisualIdentityPickerViewController updateHeaderViewAvatar](&v3, sel_updateHeaderViewAvatar);
}

- (void)updatePendingEditContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageData:", v4);

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_md5Hash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImageHash:", v8);

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cropRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCropRect:", v12, v14, v16, v18);

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "thumbnailImageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setThumbnailImageData:", v21);

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fullscreenImageData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFullscreenImageData:", v24);

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "imageType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setImageType:", v27);

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "memojiMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMemojiMetadata:", v30);

  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "wallpaper");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWallpaper:", v32);

}

- (void)cancel:(id)a3
{
  id v4;

  -[CNPhotoPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoPickerDidCancel:", self);

}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNPhotoPickerViewController updatePendingEditContact](self, "updatePendingEditContact", a3);
  -[CNVisualIdentityPickerViewController contactImageForCurrentActiveItem](self, "contactImageForCurrentActiveItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController pendingEditContact](self, "pendingEditContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoPicker:didUpdatePhotoForContact:withContactImage:", self, v5, v6);

}

- (id)contactViewCache
{
  void *v2;
  void *v3;

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactViewCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNPhotoPickerViewControllerDelegate)delegate
{
  return (CNPhotoPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (CNMutableContact)pendingEditContact
{
  return self->_pendingEditContact;
}

- (void)setPendingEditContact:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEditContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEditContact, 0);
  objc_destroyWeak((id *)&self->delegate);
}

+ (id)log
{
  if (log_cn_once_token_1_48719 != -1)
    dispatch_once(&log_cn_once_token_1_48719, &__block_literal_global_48720);
  return (id)log_cn_once_object_1_48721;
}

+ (id)photoPickerForGameCenterWithContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerConfiguration gameCenterConfiguration](CNPhotoPickerConfiguration, "gameCenterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithContact:style:configuration:", v6, v7, v8);

  return v9;
}

+ (id)navigationControllerForPicker:(id)a3
{
  return +[CNVisualIdentityPickerViewController navigationControllerForPicker:](CNVisualIdentityPickerViewController, "navigationControllerForPicker:", a3);
}

+ (BOOL)canShowAvatarEditor
{
  return +[CNPhotoPickerCapabilities allowsAvatarUI](CNPhotoPickerCapabilities, "allowsAvatarUI");
}

void __34__CNPhotoPickerViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNPhotoPicker");
  v1 = (void *)log_cn_once_object_1_48721;
  log_cn_once_object_1_48721 = (uint64_t)v0;

}

@end
