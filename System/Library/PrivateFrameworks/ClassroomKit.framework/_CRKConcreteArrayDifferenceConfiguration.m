@implementation _CRKConcreteArrayDifferenceConfiguration

- (id)publishedItemsComparator
{
  return self->_publishedItemsComparator;
}

- (void)setPublishedItemsComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)incomingItemsIdentifierFunction
{
  return self->_incomingItemsIdentifierFunction;
}

- (void)setIncomingItemsIdentifierFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)publishedItemsIdentifierFunction
{
  return self->_publishedItemsIdentifierFunction;
}

- (void)setPublishedItemsIdentifierFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)liftingFunction
{
  return self->_liftingFunction;
}

- (void)setLiftingFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong(&self->_liftingFunction, 0);
  objc_storeStrong(&self->_publishedItemsIdentifierFunction, 0);
  objc_storeStrong(&self->_incomingItemsIdentifierFunction, 0);
  objc_storeStrong(&self->_publishedItemsComparator, 0);
}

@end
