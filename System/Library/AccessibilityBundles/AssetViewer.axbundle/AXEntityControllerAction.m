@implementation AXEntityControllerAction

- (id)entityController
{
  return objc_loadWeakRetained(&self->_entityController);
}

- (void)setEntityController:(id)a3
{
  objc_storeWeak(&self->_entityController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_entityController);
}

@end
