@implementation CNPropertyStaticIdentityAction

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyStaticIdentityAction;
  -[CNPropertyStaticIdentityAction dealloc](&v3, sel_dealloc);
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  objc_msgSend(a4, "copy:", a3);
}

- (CNContactContentViewControllerDelegate)contactDelegate
{
  return (CNContactContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactDelegate);
}

@end
