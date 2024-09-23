@implementation WKCNContactPickerSingleSelectDelegate

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  objc_msgSend(objc_loadWeak(&self->super._contactPickerDelegate.m_weakReference), "contactPicker:didSelectContact:", a3, a4);
}

@end
