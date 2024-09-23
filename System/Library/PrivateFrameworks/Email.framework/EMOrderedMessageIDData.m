@implementation EMOrderedMessageIDData

- (EMOrderedMessageIDData)initWithObjectIDs:(id)a3 objectIDByPersistentID:(id)a4
{
  id v6;
  id v7;
  EMOrderedMessageIDData *v8;
  uint64_t v9;
  NSArray *objectIDs;
  uint64_t v11;
  NSDictionary *objectIDByPersistentID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMOrderedMessageIDData;
  v8 = -[EMOrderedMessageIDData init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    objectIDs = v8->_objectIDs;
    v8->_objectIDs = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    objectIDByPersistentID = v8->_objectIDByPersistentID;
    v8->_objectIDByPersistentID = (NSDictionary *)v11;

  }
  return v8;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)objectIDByPersistentID
{
  return self->_objectIDByPersistentID;
}

- (void)setObjectIDByPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDByPersistentID, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end
