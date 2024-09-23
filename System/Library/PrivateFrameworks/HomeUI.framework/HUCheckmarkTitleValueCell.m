@implementation HUCheckmarkTitleValueCell

- (HUCheckmarkTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUCheckmarkTitleValueCell *v4;
  HUCheckmarkTitleValueCell *v5;
  UIImageView *v6;
  UIImageView *checkmarkImageView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUCheckmarkTitleValueCell;
  v4 = -[HUTitleValueCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_checked = 0;
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    checkmarkImageView = v5->_checkmarkImageView;
    v5->_checkmarkImageView = v6;

    -[HUCheckmarkTitleValueCell _updateCheckmark](v5, "_updateCheckmark");
    -[HUTitleValueCell labelsStackView](v5, "labelsStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertArrangedSubview:atIndex:", v5->_checkmarkImageView, 0);

  }
  return v5;
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    -[HUCheckmarkTitleValueCell _updateCheckmark](self, "_updateCheckmark");
  }
}

- (void)_updateCheckmark
{
  id v3;

  -[HUCheckmarkTitleValueCell checkmarkImageView](self, "checkmarkImageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell hu_configureCheckmarkForImageView:checked:](self, "hu_configureCheckmarkForImageView:checked:", v3, -[HUCheckmarkTitleValueCell isChecked](self, "isChecked"));

}

- (BOOL)isChecked
{
  return self->_checked;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end
