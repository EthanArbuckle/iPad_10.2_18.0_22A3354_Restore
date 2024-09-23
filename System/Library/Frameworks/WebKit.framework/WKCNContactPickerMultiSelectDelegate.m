@implementation WKCNContactPickerMultiSelectDelegate

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  objc_msgSend(objc_loadWeak(&self->super._contactPickerDelegate.m_weakReference), "contactPicker:didSelectContacts:", a3, a4);
}

@end
