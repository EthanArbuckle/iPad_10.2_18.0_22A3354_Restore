@implementation CNPhotoPickerActionButton

- (CNPhotoPickerActionButton)initWithFrame:(CGRect)a3
{
  CNPhotoPickerActionButton *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPhotoPickerActionButton;
  v3 = -[CNPhotoPickerActionButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CNUIColorRepository photoPickerActionButtonBackgroundColor](CNUIColorRepository, "photoPickerActionButtonBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerActionButton setBackgroundColor:](v3, "setBackgroundColor:", v4);

    +[CNPhotoPickerActionButton defaultActionButtonTextColor](CNPhotoPickerActionButton, "defaultActionButtonTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerActionButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 0);

    -[CNPhotoPickerActionButton _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 14.0);
  }
  return v3;
}

- (void)setIsDestructive:(BOOL)a3
{
  id v4;

  if (self->_isDestructive != a3)
  {
    self->_isDestructive = a3;
    if (a3)
      +[CNUIColorRepository photoPickerActionButtonDestructiveTextColor](CNUIColorRepository, "photoPickerActionButtonDestructiveTextColor");
    else
      +[CNPhotoPickerActionButton defaultActionButtonTextColor](CNPhotoPickerActionButton, "defaultActionButtonTextColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerActionButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0);

  }
}

- (void)performActionBlock
{
  void *v3;
  id v4;

  -[CNPhotoPickerActionButton blockHandler](self, "blockHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPhotoPickerActionButton blockHandler](self, "blockHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performAction");

  }
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (CNPhotoPickerActionButtonBlockHandler)blockHandler
{
  return self->_blockHandler;
}

- (void)setBlockHandler:(id)a3
{
  objc_storeStrong((id *)&self->_blockHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockHandler, 0);
}

+ (CNPhotoPickerActionButton)buttonWithTitle:(id)a3 actionBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  CNPhotoPickerActionButtonBlockHandler *v8;

  v5 = a4;
  v6 = a3;
  +[CNPhotoPickerActionButton buttonWithType:](CNPhotoPickerActionButton, "buttonWithType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v6, 0);

  if (v5)
  {
    v8 = -[CNPhotoPickerActionButtonBlockHandler initWithActionBlock:]([CNPhotoPickerActionButtonBlockHandler alloc], "initWithActionBlock:", v5);
    objc_msgSend(v7, "setBlockHandler:", v8);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, sel_performAction, 64);

  }
  return (CNPhotoPickerActionButton *)v7;
}

+ (id)defaultButtonWithTitle:(id)a3 actionBlock:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[CNPhotoPickerActionButton buttonWithTitle:actionBlock:](CNPhotoPickerActionButton, "buttonWithTitle:actionBlock:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFontRepository contactCardPhotoPickerActionButtonFont](CNUIFontRepository, "contactCardPhotoPickerActionButtonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  return v4;
}

+ (id)destructiveButtonWithTitle:(id)a3 actionBlock:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[CNPhotoPickerActionButton buttonWithTitle:actionBlock:](CNPhotoPickerActionButton, "buttonWithTitle:actionBlock:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFontRepository contactCardPhotoPickerActionButtonFont](CNUIFontRepository, "contactCardPhotoPickerActionButtonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(v4, "setIsDestructive:", 1);
  return v4;
}

+ (id)defaultActionButtonTextColor
{
  return +[CNUIColorRepository photoPickerActionButtonTextColor](CNUIColorRepository, "photoPickerActionButtonTextColor");
}

@end
