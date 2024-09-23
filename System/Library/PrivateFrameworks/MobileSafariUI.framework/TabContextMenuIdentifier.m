@implementation TabContextMenuIdentifier

- (TabContextMenuIdentifier)initWithTabUUID:(id)a3 sourceItem:(id)a4
{
  id v7;
  id v8;
  TabContextMenuIdentifier *v9;
  TabContextMenuIdentifier *v10;
  TabContextMenuIdentifier *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TabContextMenuIdentifier;
  v9 = -[TabContextMenuIdentifier init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabUUID, a3);
    objc_storeWeak((id *)&v10->_sourceItem, v8);
    v11 = v10;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSUUID *tabUUID;
  id WeakRetained;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  tabUUID = self->_tabUUID;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceItem);
  v7 = (void *)objc_msgSend(v4, "initWithTabUUID:sourceItem:", tabUUID, WeakRetained);

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_tabUUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TabContextMenuIdentifier *v4;
  char v5;

  v4 = (TabContextMenuIdentifier *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSUUID isEqual:](self->_tabUUID, "isEqual:", v4->_tabUUID);
    else
      v5 = 0;
  }

  return v5;
}

- (NSUUID)tabUUID
{
  return self->_tabUUID;
}

- (TabCollectionItem)sourceItem
{
  return (TabCollectionItem *)objc_loadWeakRetained((id *)&self->_sourceItem);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceItem);
  objc_storeStrong((id *)&self->_tabUUID, 0);
}

@end
