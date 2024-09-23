@implementation PushedMailboxTableCell

+ (int)_cacheIndexForType:(int64_t)a3
{
  unint64_t i;

  for (i = 0; _mailFolderImages[i] != a3; i += 3)
  {
    if (i >= 0x12)
      +[PushedMailboxTableCell _cacheIndexForType:].cold.1();
  }
  return i + 2;
}

+ (id)_iconForType:(int64_t)a3 nested:(BOOL)a4
{
  int v4;
  id result;
  id *v6;
  void *v7;

  v4 = +[PushedMailboxTableCell _cacheIndexForType:](PushedMailboxTableCell, "_cacheIndexForType:", a3, a4);
  result = (id)_mailFolderImages[v4];
  if (!result)
  {
    v6 = (id *)&_mailFolderImages[v4];
    v7 = (void *)objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", *(v6 - 1));
    result = (id)objc_msgSend(v7, "imageWithTintColor:", objc_msgSend(MEMORY[0x24BDF6950], "_systemInteractionTintColor"));
    *v6 = result;
  }
  return result;
}

- (PushedMailboxTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PushedMailboxTableCell *v4;
  UILabel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PushedMailboxTableCell;
  v4 = -[PushedMailboxTableCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    v4->_mailboxName = v5;
    -[UILabel setFont:](v5, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 18.0));
    objc_msgSend((id)-[PushedMailboxTableCell contentView](v4, "contentView"), "addSubview:", v4->_mailboxName);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PushedMailboxTableCell;
  -[PushedMailboxTableCell dealloc](&v3, sel_dealloc);
}

- (void)_setupMailFolderIconForImage:(id)a3
{
  UIImageView *mailboxIcon;

  mailboxIcon = self->_mailboxIcon;
  if (!mailboxIcon)
  {
    self->_mailboxIcon = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
    objc_msgSend((id)-[PushedMailboxTableCell contentView](self, "contentView"), "addSubview:", self->_mailboxIcon);
    mailboxIcon = self->_mailboxIcon;
  }
  -[UIImageView setImage:](mailboxIcon, "setImage:", a3);
  -[UIImageView sizeToFit](self->_mailboxIcon, "sizeToFit");
}

- (void)setType:(int64_t)a3
{
  -[PushedMailboxTableCell _setupMailFolderIconForImage:](self, "_setupMailFolderIconForImage:", +[PushedMailboxTableCell _iconForType:nested:](PushedMailboxTableCell, "_iconForType:nested:", a3, self->_level != 0));
}

- (void)setMailboxName:(id)a3
{
  -[UILabel setText:](self->_mailboxName, "setText:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *mailboxName;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PushedMailboxTableCell;
  -[PushedMailboxTableCell setEnabled:](&v7, sel_setEnabled_);
  mailboxName = self->_mailboxName;
  if (v3)
    v6 = objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  else
    v6 = objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  -[UILabel setTextColor:](mailboxName, "setTextColor:", v6);
}

- (BOOL)isChecked
{
  return -[PushedMailboxTableCell accessoryType](self, "accessoryType") == 3;
}

- (void)setChecked:(BOOL)a3
{
  PushedMailboxTableCell *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = self;
  if (!a3)
  {
    v4 = 0;
    goto LABEL_5;
  }
  if (-[PushedMailboxTableCell isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    self = v3;
    v4 = 3;
LABEL_5:
    -[PushedMailboxTableCell setAccessoryType:](self, "setAccessoryType:", v4);
    return;
  }
  v5 = objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v5);
  -[PushedMailboxTableCell setAccessoryView:](v3, "setAccessoryView:", v6);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PushedMailboxTableCell;
  -[PushedMailboxTableCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PushedMailboxTableCell setAccessoryView:](self, "setAccessoryView:", 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t level;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double width;
  double height;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)PushedMailboxTableCell;
  -[PushedMailboxTableCell layoutSubviews](&v21, sel_layoutSubviews);
  -[PushedMailboxTableCell frame](self, "frame");
  objc_msgSend((id)-[PushedMailboxTableCell contentView](self, "contentView"), "bounds");
  v4 = v3;
  -[UILabel sizeToFit](self->_mailboxName, "sizeToFit");
  -[UILabel frame](self->_mailboxName, "frame");
  v6 = v5;
  v8 = v7;
  level = self->_level;
  if ((_DWORD)level)
  {
    if ((_DWORD)level == 1)
      v10 = 86.0;
    else
      v10 = (float)((float)(level - 1) * 30.0) + 90.0 + -4.0;
  }
  else
  {
    v10 = 55.0;
  }
  UIRoundToViewScale();
  v12 = v11;
  objc_msgSend((id)-[PushedMailboxTableCell contentView](self, "contentView"), "frame");
  v14 = v4 - v10 - v13 + -5.0;
  if (v6 >= v14)
    v15 = v14;
  else
    v15 = v6;
  -[UILabel setFrame:](self->_mailboxName, "setFrame:", v10, v12, v15, v8);
  -[UIImageView frame](self->_mailboxIcon, "frame");
  width = v22.size.width;
  height = v22.size.height;
  CGRectGetWidth(v22);
  UIRoundToViewScale();
  v19 = v18;
  UIRoundToViewScale();
  -[UIImageView setFrame:](self->_mailboxIcon, "setFrame:", v19, v20, width, height);
  -[PushedMailboxTableCell _setMarginWidth:](self, "_setMarginWidth:", v10);
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

+ (void)_cacheIndexForType:.cold.1()
{
  __assert_rtn("+[PushedMailboxTableCell _cacheIndexForType:]", "PushedMailboxTableCell.m", 41, "0 && \"Should have found a cache index for our mailbox type\");
}

@end
