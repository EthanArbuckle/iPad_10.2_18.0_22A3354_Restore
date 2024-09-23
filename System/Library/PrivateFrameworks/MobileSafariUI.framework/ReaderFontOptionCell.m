@implementation ReaderFontOptionCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ReaderFontOptionCell setAutomaticallyUpdatesBackgroundConfiguration:](self, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  v7 = (id)objc_msgSend(v4, "copy");

  objc_msgSend(v7, "setHighlighted:", 0);
  objc_msgSend(v7, "setSelected:", 0);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatedConfigurationForState:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ReaderFontOptionCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v6);
}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ReaderFontOptionCell _listContentConfiguration](self, "_listContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setAttributedText:", v4);
  -[ReaderFontOptionCell setContentConfiguration:](self, "setContentConfiguration:", v6);

}

- (id)attributedText
{
  void *v2;
  void *v3;

  -[ReaderFontOptionCell _listContentConfiguration](self, "_listContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_listContentConfiguration
{
  void *v2;
  id v3;

  -[ReaderFontOptionCell contentConfiguration](self, "contentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[ReaderFontOptionCell _updateAccessories](self, "_updateAccessories");
    v5 = v6;
  }

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ReaderFontOptionCell;
  -[ReaderFontOptionCell setSelected:](&v4, sel_setSelected_, a3);
  -[ReaderFontOptionCell _updateAccessories](self, "_updateAccessories");
}

- (void)_updateAccessories
{
  id v3;
  void *v4;
  UIView *accessoryView;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[ReaderFontOptionCell isSelected](self, "isSelected"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTintColor:", v4);

    objc_msgSend(v7, "addObject:", v3);
  }
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", self->_accessoryView, 1);
    objc_msgSend(v7, "addObject:", v6);

  }
  -[ReaderFontOptionCell setAccessories:](self, "setAccessories:", v7);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
