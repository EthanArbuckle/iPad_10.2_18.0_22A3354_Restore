@implementation _HDAssociationInsertionContext

- (BOOL)enforceSameSource
{
  return self->_enforceSameSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
}

- (_HDAssociationInsertionContext)initWithParentUUID:(id)a3 enforceSameSource:(BOOL)a4 permitPendingAssociations:(BOOL)a5 profile:(id)a6 transaction:(id)a7
{
  id v12;
  id v13;
  id v14;
  _HDAssociationInsertionContext *v15;
  uint64_t v16;
  NSUUID *parentUUID;
  objc_super v19;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_HDAssociationInsertionContext;
  v15 = -[_HDAssociationInsertionContext init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    parentUUID = v15->_parentUUID;
    v15->_parentUUID = (NSUUID *)v16;

    v15->_enforceSameSource = a4;
    v15->_permitPendingAssociations = a5;
    objc_storeStrong((id *)&v15->_profile, a6);
    objc_storeStrong((id *)&v15->_transaction, a7);
  }

  return v15;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (BOOL)permitPendingAssociations
{
  return self->_permitPendingAssociations;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDDatabaseTransaction)transaction
{
  return self->_transaction;
}

@end
