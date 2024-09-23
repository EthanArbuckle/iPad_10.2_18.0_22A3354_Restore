@implementation DOCDocBrowserVC_UIActivityViewController

- (DOCServicePopoverTrackerProtocol)popoverTracker
{
  return (DOCServicePopoverTrackerProtocol *)objc_getProperty(self, a2, 1328, 1);
}

- (void)setPopoverTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1328);
}

- (UIBarButtonItem)barButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_barButtonItem);
}

- (void)setBarButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_barButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_barButtonItem);
  objc_storeStrong((id *)&self->_popoverTracker, 0);
}

@end
