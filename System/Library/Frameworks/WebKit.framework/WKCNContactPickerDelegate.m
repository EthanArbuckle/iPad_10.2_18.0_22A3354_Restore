@implementation WKCNContactPickerDelegate

- (WKCNContactPickerDelegate)initWithContactPickerDelegate:(id)a3
{
  WKCNContactPickerDelegate *v4;
  WKCNContactPickerDelegate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKCNContactPickerDelegate;
  v4 = -[WKCNContactPickerDelegate init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak(&v4->_contactPickerDelegate.m_weakReference, a3);
  return v5;
}

- (void)contactPickerDidCancel:(id)a3
{
  objc_msgSend(objc_loadWeak(&self->_contactPickerDelegate.m_weakReference), "contactPickerDidCancel:", a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_contactPickerDelegate.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
