@implementation MKFObjectDatabaseID

- (MKFObjectDatabaseID)initWithMKFObject:(id)a3
{
  id v4;
  MKFObjectDatabaseID *v5;
  uint64_t v6;
  NSManagedObjectID *objectID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKFObjectDatabaseID;
  v5 = -[MKFObjectDatabaseID init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectID");
    v6 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (NSManagedObjectID *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MKFObjectDatabaseID *v4;
  MKFObjectDatabaseID *v5;
  MKFObjectDatabaseID *v6;
  char v7;

  v4 = (MKFObjectDatabaseID *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
      v7 = -[NSManagedObjectID isEqual:](self->_objectID, "isEqual:", v6->_objectID);
    else
      v7 = 0;

  }
  return v7;
}

- (id)description
{
  return (id)-[NSManagedObjectID description](self->_objectID, "description");
}

- (NSManagedObjectID)objectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
