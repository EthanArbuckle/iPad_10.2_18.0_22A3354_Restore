@implementation HUTitleControlCell

- (HUTitleControlCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTitleControlCell *v4;
  HUTitleControlCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTitleControlCell;
  v4 = -[HUTitleControlCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
    -[HUTitleControlCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  return v5;
}

- (id)allControlViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUTitleControlCell controlView](self, "controlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HUControlView)controlView
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HUTitleControlCell accessoryView](self, "accessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &unk_1EF279010;
  v4 = v2;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (objc_msgSend(v4, "conformsToProtocol:", v3))
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v10);

LABEL_7:
    v7 = 0;
  }

  return (HUControlView *)v7;
}

- (void)setControlView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "sizeToFit");
  -[HUTitleControlCell setAccessoryView:](self, "setAccessoryView:", v4);

}

- (NSString)controlTitle
{
  void *v2;
  void *v3;

  -[HUTitleControlCell textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setControlTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUTitleControlCell textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUTitleControlCell setControlView:](self, "setControlView:", 0);
  -[HUTitleControlCell setControlTitle:](self, "setControlTitle:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUTitleControlCell;
  -[HUTitleControlCell prepareForReuse](&v3, sel_prepareForReuse);
}

@end
