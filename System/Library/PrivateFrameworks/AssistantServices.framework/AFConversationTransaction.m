@implementation AFConversationTransaction

- (AFConversationTransaction)initWithUpdatedItemIndexPaths:(id)a3 insertedItemIndexPaths:(id)a4 presentationStateChangedItemIndexPaths:(id)a5
{
  id v9;
  id v10;
  id v11;
  AFConversationTransaction *v12;
  AFConversationTransaction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AFConversationTransaction;
  v12 = -[AFConversationTransaction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_updatedItemIndexPaths, a3);
    objc_storeStrong((id *)&v13->_insertedItemIndexPaths, a4);
    objc_storeStrong((id *)&v13->_presentationStateChangedItemIndexPaths, a5);
  }

  return v13;
}

- (NSArray)updatedItemIndexPaths
{
  return self->_updatedItemIndexPaths;
}

- (NSArray)insertedItemIndexPaths
{
  return self->_insertedItemIndexPaths;
}

- (NSArray)presentationStateChangedItemIndexPaths
{
  return self->_presentationStateChangedItemIndexPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationStateChangedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_updatedItemIndexPaths, 0);
}

@end
