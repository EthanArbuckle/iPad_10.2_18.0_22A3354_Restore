@implementation AVTAvatarLibraryCollectionViewAddCell

+ (id)cellIdentifier
{
  return CFSTR("AVTAvatarLibraryCollectionViewAddCell");
}

- (AVTAvatarLibraryCollectionViewAddCell)initWithFrame:(CGRect)a3
{
  AVTAvatarLibraryCollectionViewAddCell *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarLibraryCollectionViewAddCell;
  v3 = -[AVTAvatarLibraryCollectionViewAddCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("silhouetteHead"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[AVTAvatarLibraryCollectionViewAddCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = (void *)objc_msgSend(v7, "initWithFrame:");

    objc_msgSend(v9, "setImage:", v6);
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    -[AVTAvatarLibraryCollectionViewAddCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v9);

    v11 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[AVTAvatarLibraryCollectionViewAddCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v13 = (void *)objc_msgSend(v11, "initWithFrame:");

    objc_msgSend(v13, "setText:", CFSTR("+"));
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 60.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v14);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.46, 1.0, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v15);

    objc_msgSend(v13, "setTextAlignment:", 1);
    objc_msgSend(v13, "setAutoresizingMask:", 18);
    -[AVTAvatarLibraryCollectionViewAddCell contentView](v3, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v13);

  }
  return v3;
}

@end
