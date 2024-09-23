@implementation CNStaticIdentityPlaceholderCell

- (void)performDefaultAction
{
  void *v3;
  id v4;

  -[CNStaticIdentityPlaceholderCell delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyCell:performActionForItem:withTransportType:", self, v3, 0);

}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
