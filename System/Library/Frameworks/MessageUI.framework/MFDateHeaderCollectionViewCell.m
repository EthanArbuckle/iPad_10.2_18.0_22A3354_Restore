@implementation MFDateHeaderCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFDateHeaderCollectionViewCellIdentifier");
}

- (MFDateHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  MFDateHeaderCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFDateHeaderCollectionViewCell;
  v3 = -[MFDateHeaderCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDateHeaderCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[MFDateHeaderCollectionViewCell defaultContentConfiguration](v3, "defaultContentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "datePickerHeaderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondaryTextProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v9);

    -[MFDateHeaderCollectionViewCell setContentConfiguration:](v3, "setContentConfiguration:", v6);
  }
  return v3;
}

- (void)updateSecondaryTextWithDate:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3578], "ef_formatDate:style:", a3, 3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFDateHeaderCollectionViewCell contentConfiguration](self, "contentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryText:", v5);
  -[MFDateHeaderCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v4);

}

@end
