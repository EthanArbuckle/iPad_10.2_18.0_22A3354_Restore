@implementation _CATCollectionControllerChangeDescriptor

- (CATCollectionController)collectionController
{
  return self->_collectionController;
}

- (void)setCollectionController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionController, a3);
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (unint64_t)oldIndex
{
  return self->_oldIndex;
}

- (void)setOldIndex:(unint64_t)a3
{
  self->_oldIndex = a3;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (unint64_t)newIndex
{
  return self->_newIndex;
}

- (void)setNewIndex:(unint64_t)a3
{
  self->_newIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_collectionController, 0);
}

@end
