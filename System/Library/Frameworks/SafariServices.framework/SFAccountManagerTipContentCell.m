@implementation SFAccountManagerTipContentCell

- (SFAccountManagerTipContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFAccountManagerTipContentCell *v4;
  SFAccountManagerTipContentCell *v5;
  SFAccountManagerTipContentCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAccountManagerTipContentCell;
  v4 = -[SFAccountManagerPlatterWithDeclineButtonCell initWithStyle:reuseIdentifier:iconSize:iconLeadingSpace:iconTrailingSpace:](&v8, sel_initWithStyle_reuseIdentifier_iconSize_iconLeadingSpace_iconTrailingSpace_, a3, a4, 13, 11, 45.0, 50.0);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (void)configureForTip:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_tipType = a3;
  -[SFAccountManagerPlatterWithDeclineButtonCell setShowingActivityIndicator:](self, "setShowingActivityIndicator:", 0);
  objc_msgSend(MEMORY[0x1E0C92600], "contentForTipType:", self->_tipType);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerPlatterWithDeclineButtonCell setTitle:subtitle:icon:shouldShowDeclineButton:](self, "setTitle:subtitle:icon:shouldShowDeclineButton:", v4, v5, v6, 1);

}

+ (unint64_t)contentInset
{
  return 69;
}

- (int64_t)tipType
{
  return self->_tipType;
}

@end
