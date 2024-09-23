@implementation AXElementNamesStyleProvider

- (id)itemBackgroundViewCreationHandler
{
  return self->_itemBackgroundViewCreationHandler;
}

- (void)setItemBackgroundViewCreationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemBackgroundViewCreationHandler, 0);
}

@end
