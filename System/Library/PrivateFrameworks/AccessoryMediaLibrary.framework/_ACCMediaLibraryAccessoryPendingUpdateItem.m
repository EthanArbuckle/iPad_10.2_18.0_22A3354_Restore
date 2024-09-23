@implementation _ACCMediaLibraryAccessoryPendingUpdateItem

- (_ACCMediaLibraryAccessoryPendingUpdateItem)initWithLibrary:(id)a3 revision:(id)a4 type:(int)a5 item:(id)a6
{
  id v11;
  id v12;
  id v13;
  _ACCMediaLibraryAccessoryPendingUpdateItem *v14;
  _ACCMediaLibraryAccessoryPendingUpdateItem *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_ACCMediaLibraryAccessoryPendingUpdateItem;
  v14 = -[_ACCMediaLibraryAccessoryPendingUpdateItem init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_libraryUID, a3);
    objc_storeStrong((id *)&v15->_revision, a4);
    v15->_type = a5;
    objc_storeStrong(&v15->_item, a6);
  }

  return v15;
}

- (void)dealloc
{
  NSString *libraryUID;
  NSString *revision;
  id item;
  objc_super v6;

  libraryUID = self->_libraryUID;
  self->_libraryUID = 0;

  revision = self->_revision;
  self->_revision = 0;

  item = self->_item;
  self->_item = 0;

  v6.receiver = self;
  v6.super_class = (Class)_ACCMediaLibraryAccessoryPendingUpdateItem;
  -[_ACCMediaLibraryAccessoryPendingUpdateItem dealloc](&v6, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<_ACCMediaLibraryAccessoryPendingUpdateItem>[libraryUID=%@ revision=%@ type=%u]"), self->_libraryUID, self->_revision, self->_type);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "libraryUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", self->_libraryUID))
    {
      objc_msgSend(v5, "revision");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", self->_revision))
        v8 = objc_msgSend(v5, "type") == self->_type;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSString)libraryUID
{
  return self->_libraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (int)type
{
  return self->_type;
}

- (id)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_libraryUID, 0);
}

@end
