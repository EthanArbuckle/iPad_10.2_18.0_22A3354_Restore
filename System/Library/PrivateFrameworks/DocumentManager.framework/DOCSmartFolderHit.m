@implementation DOCSmartFolderHit

- (DOCSmartFolderHit)initWithFolder:(id)a3 type:(unint64_t)a4 value:(id)a5 lastUsedDate:(id)a6 frecency:(double)a7
{
  return -[DOCSmartFolderHit initWithRowId:folder:type:value:lastUsedDate:frecency:](self, "initWithRowId:folder:type:value:lastUsedDate:frecency:", 0, a3, a4, a5, a6, a7);
}

- (DOCSmartFolderHit)initWithRowId:(id)a3 folder:(id)a4 type:(unint64_t)a5 value:(id)a6 lastUsedDate:(id)a7 frecency:(double)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  DOCSmartFolderHit *v19;
  DOCSmartFolderHit *v20;
  objc_super v22;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)DOCSmartFolderHit;
  v19 = -[DOCSmartFolderHit init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_rowId, a3);
    objc_storeStrong((id *)&v20->_folderItem, a4);
    v20->_type = a5;
    objc_storeStrong((id *)&v20->_value, a6);
    -[DOCFrecencyBasedEvent setLastUsedDate:](v20, "setLastUsedDate:", v18);
    -[DOCFrecencyBasedEvent setFrecency:](v20, "setFrecency:", a8);
  }

  return v20;
}

- (FPItem)folderItem
{
  return self->_folderItem;
}

- (void)setFolderItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)rowId
{
  return self->_rowId;
}

- (void)setRowId:(id)a3
{
  objc_storeStrong((id *)&self->_rowId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowId, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_folderItem, 0);
}

@end
