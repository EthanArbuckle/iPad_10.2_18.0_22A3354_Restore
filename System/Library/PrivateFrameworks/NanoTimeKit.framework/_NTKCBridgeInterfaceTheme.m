@implementation _NTKCBridgeInterfaceTheme

- (int)photoCollectionViewBackgroundColorValue
{
  return 0;
}

- (void)configureAlbumListTitleTextField:(id)a3 asOpaque:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_NTKCBridgeInterfaceTheme;
  v5 = a3;
  -[PUFlatWhiteInterfaceTheme configureAlbumListTitleTextField:asOpaque:](&v8, sel_configureAlbumListTitleTextField_asOpaque_, v5, v4);
  BPSTextColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6, v8.receiver, v8.super_class);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

}

- (void)configureAlbumListTitleLabel:(id)a3 asOpaque:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_NTKCBridgeInterfaceTheme;
  v5 = a3;
  -[PUFlatWhiteInterfaceTheme configureAlbumListTitleLabel:asOpaque:](&v8, sel_configureAlbumListTitleLabel_asOpaque_, v5, v4);
  BPSTextColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6, v8.receiver, v8.super_class);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

}

- (void)configureAlbumListSubtitleLabel:(id)a3 asOpaque:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_NTKCBridgeInterfaceTheme;
  v5 = a3;
  -[PUFlatWhiteInterfaceTheme configureAlbumListSubtitleLabel:asOpaque:](&v8, sel_configureAlbumListSubtitleLabel_asOpaque_, v5, v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  BPSDetailTextColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

}

- (void)configureAlbumListStackViewPhonePhotoDecoration:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NTKCBridgeInterfaceTheme;
  v3 = a3;
  -[PUFlatWhiteInterfaceTheme configureAlbumListStackViewPhonePhotoDecoration:](&v5, sel_configureAlbumListStackViewPhonePhotoDecoration_, v3);
  BPSSeparatorColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBorderColor:", v4, v5.receiver, v5.super_class);

}

@end
