@implementation BPSAppGlanceManager

- (id)glanceSpecifierForIdentifier:(id)a3
{
  return 0;
}

- (id)showsGlance:(id)a3
{
  return 0;
}

- (PSListController)listControllerDelegate
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listControllerDelegate);
}

- (void)setListControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listControllerDelegate);
}

@end
