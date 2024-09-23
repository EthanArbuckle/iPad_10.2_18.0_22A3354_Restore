@implementation DOCHotFolderEvent

- (DOCHotFolderEvent)initWithAppBundleIdentifier:(id)a3 folderItem:(id)a4 type:(unint64_t)a5 lastUsedDate:(id)a6 frecency:(double)a7
{
  return -[DOCHotFolderEvent initWithRowId:appBundleIdentifier:folderItem:type:lastUsedDate:frecency:](self, "initWithRowId:appBundleIdentifier:folderItem:type:lastUsedDate:frecency:", 0, a3, a4, a5, a6, a7);
}

- (DOCHotFolderEvent)initWithRowId:(id)a3 appBundleIdentifier:(id)a4 folderItem:(id)a5 type:(unint64_t)a6 lastUsedDate:(id)a7 frecency:(double)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  DOCHotFolderEvent *v19;
  DOCHotFolderEvent *v20;
  objc_super v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)DOCHotFolderEvent;
  v19 = -[DOCHotFolderEvent init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_rowId, a3);
    objc_storeStrong((id *)&v20->_appBundleIdentifier, a4);
    objc_storeStrong((id *)&v20->_folderItem, a5);
    v20->_type = a6;
    -[DOCFrecencyBasedEvent setLastUsedDate:](v20, "setLastUsedDate:", v18);
    -[DOCFrecencyBasedEvent setFrecency:](v20, "setFrecency:", a8);
  }

  return v20;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FPItem)folderItem
{
  return self->_folderItem;
}

- (void)setFolderItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
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
  objc_storeStrong((id *)&self->_folderItem, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
