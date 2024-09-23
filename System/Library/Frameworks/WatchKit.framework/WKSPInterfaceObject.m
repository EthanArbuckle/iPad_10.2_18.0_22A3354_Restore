@implementation WKSPInterfaceObject

- (WKSPInterfaceObject)init
{

  return 0;
}

- (id)_initWithInterfaceProperty:(id)a3 viewControllerID:(id)a4 propertyIndex:(int64_t)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7
{
  int v9;
  id v11;
  id v12;
  WKSPInterfaceObject *v13;
  void *v14;
  objc_super v16;

  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WKSPInterfaceObject;
  v11 = a4;
  v12 = a3;
  v13 = -[WKSPInterfaceObject init](&v16, sel_init);
  -[WKSPInterfaceObject setInterfaceProperty:](v13, "setInterfaceProperty:", v12);

  -[WKSPInterfaceObject setViewControllerID:](v13, "setViewControllerID:", v11);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), (v9 + 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKSPInterfaceObject setPropertyIndex:](v13, "setPropertyIndex:", v14);

  -[WKSPInterfaceObject setTableIndex:](v13, "setTableIndex:", a6);
  -[WKSPInterfaceObject setRowIndex:](v13, "setRowIndex:", a7);
  return v13;
}

- (void)_sendValueChanged:(id)a3
{
  -[WKSPInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, &stru_24D3BD200);
}

- (void)_sendValueChanged:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[WKSPInterfaceObject propertyIndex](self, "propertyIndex");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[WKSPInterfaceObject tableIndex](self, "tableIndex") >= 1
    && -[WKSPInterfaceObject tableIndex](self, "tableIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WKSPInterfaceObject tableIndex](self, "tableIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v10;
  }
  if (-[WKSPInterfaceObject rowIndex](self, "rowIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WKSPInterfaceObject rowIndex](self, "rowIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v13;
  }
  -[WKSPInterfaceObject viewControllerID](self, "viewControllerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v14, v15, v6, v7);

}

- (NSString)interfaceProperty
{
  return self->_interfaceProperty;
}

- (void)setInterfaceProperty:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)viewControllerID
{
  return self->_viewControllerID;
}

- (void)setViewControllerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)propertyIndex
{
  return self->_propertyIndex;
}

- (void)setPropertyIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)tableIndex
{
  return self->_tableIndex;
}

- (void)setTableIndex:(int64_t)a3
{
  self->_tableIndex = a3;
}

- (int64_t)rowIndex
{
  return self->_rowIndex;
}

- (void)setRowIndex:(int64_t)a3
{
  self->_rowIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyIndex, 0);
  objc_storeStrong((id *)&self->_viewControllerID, 0);
  objc_storeStrong((id *)&self->_interfaceProperty, 0);
}

@end
