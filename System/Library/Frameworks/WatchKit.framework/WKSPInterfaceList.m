@implementation WKSPInterfaceList

- (void)_setupWithDescription:(id)a3 forController:(id)a4
{
  id v6;

  v6 = a4;
  -[WKSPInterfaceList setRowDescriptions:](self, "setRowDescriptions:", a3);
  -[WKSPInterfaceList setController:](self, "setController:", v6);

}

- (void)setNumberOfRows:(int64_t)a3 withRowType:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    v7 = 0;
    do
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v8, v7++);
    while (a3 != v7);
  }
  -[WKSPInterfaceList setRowTypes:](self, "setRowTypes:", v6);

}

- (void)setRowTypes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  -[WKSPInterfaceObject _sendValueChanged:](self, "_sendValueChanged:", v4);
  v21 = v5;
  if (v5 >= 1)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKSPInterfaceList rowDescriptions](self, "rowDescriptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("controllerClass"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(NSClassFromString(v10));
      if (v11)
      {
        v24 = v10;
        -[WKSPInterfaceList rowDescriptions](self, "rowDescriptions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("rows"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WKSPInterfaceObject viewControllerID](self, "viewControllerID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WKSPInterfaceList rowDescriptions](self, "rowDescriptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("index"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:](SPRemoteInterface, "controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:", v11, v13, v14, objc_msgSend(v16, "integerValue"), v6, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObjectsFromArray:", v17);

        v10 = v24;
        objc_msgSend(v20, "setObject:atIndexedSubscript:", v11, v6);
      }
      else
      {
        NSLog(CFSTR("Error unable to instantiate row controller class %@ for row %ld"), v10, v6);
        wk_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v26 = "-[WKSPInterfaceList setRowTypes:]";
          v27 = 1024;
          v28 = 263;
          v29 = 2114;
          v30 = v10;
          v31 = 2048;
          v32 = v6;
          _os_log_error_impl(&dword_215918000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error unable to instantiate row controller class %{public}@ for row %ld", buf, 0x26u);
        }

      }
      ++v6;
    }
    while (v21 != v6);
  }
  -[WKSPInterfaceList setRowControllers:](self, "setRowControllers:", v20);
  -[WKSPInterfaceList setRowControllerProperties:](self, "setRowControllerProperties:", v19);

}

- (int64_t)numberOfRows
{
  void *v2;
  int64_t v3;

  -[WKSPInterfaceList rowControllers](self, "rowControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)rowControllerAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (a3 < 0)
  {
    v7 = 0;
  }
  else
  {
    -[WKSPInterfaceList rowControllers](self, "rowControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") <= (unint64_t)a3)
    {
      v7 = 0;
    }
    else
    {
      -[WKSPInterfaceList rowControllers](self, "rowControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v7;
}

- (NSArray)rowControllers
{
  return self->_rowControllers;
}

- (void)setRowControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)rowDescriptions
{
  return self->_rowDescriptions;
}

- (void)setRowDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (WKInterfaceController)controller
{
  return (WKInterfaceController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (NSArray)rowControllerProperties
{
  return self->_rowControllerProperties;
}

- (void)setRowControllerProperties:(id)a3
{
  objc_storeStrong((id *)&self->_rowControllerProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowControllerProperties, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_rowDescriptions, 0);
  objc_storeStrong((id *)&self->_rowControllers, 0);
}

@end
