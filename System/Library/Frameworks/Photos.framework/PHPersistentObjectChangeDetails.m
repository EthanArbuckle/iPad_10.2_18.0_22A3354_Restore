@implementation PHPersistentObjectChangeDetails

- (PHPersistentObjectChangeDetails)initWithObjectType:(int64_t)a3 insertedIdentifiers:(id)a4 updatedIdentifiers:(id)a5 deletedIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  PHPersistentObjectChangeDetails *v13;
  PHPersistentObjectChangeDetails *v14;
  NSSet *v15;
  NSSet *insertedLocalIdentifiers;
  NSSet *v17;
  NSSet *updatedLocalIdentifiers;
  NSSet *v19;
  NSSet *deletedLocalIdentifiers;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PHPersistentObjectChangeDetails;
  v13 = -[PHPersistentObjectChangeDetails init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_objectType = a3;
    if (v10)
    {
      v15 = (NSSet *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    insertedLocalIdentifiers = v14->_insertedLocalIdentifiers;
    v14->_insertedLocalIdentifiers = v15;

    if (v11)
    {
      v17 = (NSSet *)v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    updatedLocalIdentifiers = v14->_updatedLocalIdentifiers;
    v14->_updatedLocalIdentifiers = v17;

    if (v12)
    {
      v19 = (NSSet *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    deletedLocalIdentifiers = v14->_deletedLocalIdentifiers;
    v14->_deletedLocalIdentifiers = v19;

  }
  return v14;
}

- (PHObjectType)objectType
{
  return self->_objectType;
}

- (NSSet)insertedLocalIdentifiers
{
  return self->_insertedLocalIdentifiers;
}

- (NSSet)updatedLocalIdentifiers
{
  return self->_updatedLocalIdentifiers;
}

- (NSSet)deletedLocalIdentifiers
{
  return self->_deletedLocalIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_insertedLocalIdentifiers, 0);
}

@end
