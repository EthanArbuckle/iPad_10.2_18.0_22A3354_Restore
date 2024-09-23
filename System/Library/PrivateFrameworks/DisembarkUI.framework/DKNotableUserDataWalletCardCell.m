@implementation DKNotableUserDataWalletCardCell

- (DKNotableUserDataWalletCardCell)initWithTitle:(id)a3 subtitle:(id)a4 accessoryView:(id)a5
{
  id v8;
  DKNotableUserDataWalletCardCell *v9;
  void *v10;
  void *v11;
  objc_super v13;
  objc_super v14;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DKNotableUserDataWalletCardCell;
  v9 = -[DKNotableUserDataCardCell initWithTitle:subtitle:accessoryView:](&v15, sel_initWithTitle_subtitle_accessoryView_, a3, v8, a5);
  if (v9 && !objc_msgSend(v8, "length"))
  {
    v14.receiver = v9;
    v14.super_class = (Class)DKNotableUserDataWalletCardCell;
    -[DKNotableUserDataCardCell labelContainer](&v14, sel_labelContainer);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = v9;
    v13.super_class = (Class)DKNotableUserDataWalletCardCell;
    -[DKNotableUserDataCardCell subtitleLabel](&v13, sel_subtitleLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeArrangedSubview:", v11);

  }
  return v9;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
