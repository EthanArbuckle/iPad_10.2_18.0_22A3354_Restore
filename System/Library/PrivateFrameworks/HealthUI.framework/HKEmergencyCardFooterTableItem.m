@implementation HKEmergencyCardFooterTableItem

- (id)initInEditMode:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardFooterTableItem;
  return -[HKEmergencyCardTableItem initInEditMode:](&v4, sel_initInEditMode_, a3);
}

- (BOOL)hasPresentableData
{
  return -[NSAttributedString length](self->_attributedTitleForFooter, "length") != 0;
}

- (UIEdgeInsets)separatorInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setAttributedTitleForFooter:(id)a3
{
  NSAttributedString **p_attributedTitleForFooter;
  id v6;
  NSAttributedString *v7;
  id v8;

  p_attributedTitleForFooter = &self->_attributedTitleForFooter;
  objc_storeStrong((id *)&self->_attributedTitleForFooter, a3);
  v6 = a3;
  v7 = *p_attributedTitleForFooter;
  -[HKEmergencyCardFooterCell textLabel](self->_cell, "textLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v7);

}

- (id)_cell
{
  HKEmergencyCardFooterCell *cell;
  HKEmergencyCardFooterCell *v4;
  HKEmergencyCardFooterCell *v5;

  cell = self->_cell;
  if (!cell)
  {
    v4 = -[HKEmergencyCardFooterCell initWithStyle:reuseIdentifier:]([HKEmergencyCardFooterCell alloc], "initWithStyle:reuseIdentifier:", 0, 0x1E9C5DD88);
    v5 = self->_cell;
    self->_cell = v4;

    -[HKEmergencyCardFooterCell setFooterText:](self->_cell, "setFooterText:", self->_attributedTitleForFooter);
    -[HKEmergencyCardFooterCell setTextViewDelegate:](self->_cell, "setTextViewDelegate:", self);
    cell = self->_cell;
  }
  return cell;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t (**shouldInteractWithURLBlock)(id, id);

  shouldInteractWithURLBlock = (uint64_t (**)(id, id))self->_shouldInteractWithURLBlock;
  if (shouldInteractWithURLBlock)
    return shouldInteractWithURLBlock[2](shouldInteractWithURLBlock, a4);
  else
    return 1;
}

- (NSAttributedString)attributedTitleForFooter
{
  return self->_attributedTitleForFooter;
}

- (id)shouldInteractWithURLBlock
{
  return self->_shouldInteractWithURLBlock;
}

- (void)setShouldInteractWithURLBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldInteractWithURLBlock, 0);
  objc_storeStrong((id *)&self->_attributedTitleForFooter, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
