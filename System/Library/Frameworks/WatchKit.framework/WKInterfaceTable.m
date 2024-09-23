@implementation WKInterfaceTable

- (void)_setupWithDescription:(id)a3 forController:(id)a4
{
  id v6;

  v6 = a4;
  -[WKInterfaceTable setRowDescriptions:](self, "setRowDescriptions:", a3);
  -[WKInterfaceTable setController:](self, "setController:", v6);

}

- (void)_getRowControllers:(id)a3 rowControllerProperties:(id)a4 forRowTypes:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v28 = a4;
  v31 = a5;
  -[WKInterfaceTable rowDescriptions](self, "rowDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("index"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = 0;
  }
  else
  {
    -[WKInterfaceTable rowDescriptions](self, "rowDescriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("index"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v11, "integerValue");

  }
  v30 = objc_msgSend(v31, "count");
  if (v30 >= 1)
  {
    v13 = 0;
    *(_QWORD *)&v12 = 136446978;
    v26 = v12;
    do
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", v13, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKInterfaceTable rowDescriptions](self, "rowDescriptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("controllerClass"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc_init(NSClassFromString(v17));
      if (v18)
      {
        -[WKInterfaceTable rowDescriptions](self, "rowDescriptions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("rows"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WKInterfaceObject viewControllerID](self, "viewControllerID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:](SPRemoteInterface, "controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:", v18, v21, v22, v27, v13, _WKInterfaceObjectClassWithType);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v23);

        objc_msgSend(v29, "setObject:atIndexedSubscript:", v18, v13);
      }
      else if (v17)
      {
        wk_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          v33 = "-[WKInterfaceTable _getRowControllers:rowControllerProperties:forRowTypes:]";
          v34 = 1024;
          v35 = 65;
          v36 = 2114;
          v37 = v17;
          v38 = 2048;
          v39 = v13;
          _os_log_error_impl(&dword_215918000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - unable to instantiate row controller class %{public}@ for row %ld", buf, 0x26u);
        }

      }
      else
      {
        v25 = (void *)objc_opt_new();
        objc_msgSend(v29, "setObject:atIndexedSubscript:", v25, v13);

      }
      ++v13;
    }
    while (v30 != v13);
  }

}

- (void)setNumberOfRows:(int64_t)a3 withRowType:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  wk_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446978;
    v12 = "-[WKInterfaceTable setNumberOfRows:withRowType:]";
    v13 = 1024;
    v14 = 74;
    v15 = 2048;
    v16 = a3;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_215918000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: numberOfRows=%ld rowType=%{public}@", (uint8_t *)&v11, 0x26u);
  }

  v8 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    v10 = 0;
    do
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v8, v10++);
    while (a3 != v10);
  }
  -[WKInterfaceTable setRowTypes:](self, "setRowTypes:", v9);

}

- (void)setRowTypes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446978;
    v10 = "-[WKInterfaceTable setRowTypes:]";
    v11 = 1024;
    v12 = 85;
    v13 = 2048;
    v14 = objc_msgSend(v4, "count");
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %lu rowTypes: %{public}@", (uint8_t *)&v9, 0x26u);
  }

  v6 = (void *)objc_msgSend(v4, "copy");
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v6, CFSTR("rowTypes"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceTable _getRowControllers:rowControllerProperties:forRowTypes:](self, "_getRowControllers:rowControllerProperties:forRowTypes:", v7, v8, v4);
  -[WKInterfaceTable setRowControllers:](self, "setRowControllers:", v7);
  -[WKInterfaceTable setRowControllerProperties:](self, "setRowControllerProperties:", v8);

}

- (int64_t)numberOfRows
{
  void *v2;
  int64_t v3;

  -[WKInterfaceTable rowControllers](self, "rowControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)rowControllerAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  if (a3 < 0
    || (-[WKInterfaceTable rowControllers](self, "rowControllers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceTable rowControllerAtIndex:].cold.1(self, a3, v11);

    v10 = 0;
  }
  else
  {
    -[WKInterfaceTable rowControllers](self, "rowControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = 0;
    else
      v9 = v8;
    v10 = v9;

  }
  return v10;
}

- (void)insertRowsAtIndexes:(id)a3 withRowType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wk_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v24 = "-[WKInterfaceTable insertRowsAtIndexes:withRowType:]";
    v25 = 1024;
    v26 = 123;
    v27 = 2114;
    v28 = v6;
    v29 = 2114;
    v30 = v7;
    _os_log_impl(&dword_215918000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: rows=%{public}@ rowType=%{public}@", buf, 0x26u);
  }

  v9 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= 1)
  {
    do
    {
      objc_msgSend(v10, "addObject:", v7);
      --v9;
    }
    while (v9);
  }
  v11 = (void *)objc_msgSend(v10, "copy");
  v12 = (void *)objc_msgSend(v6, "copy", v11);
  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v13, CFSTR(".insert"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceTable _getRowControllers:rowControllerProperties:forRowTypes:](self, "_getRowControllers:rowControllerProperties:forRowTypes:", v14, v15, v10);
  -[WKInterfaceTable rowControllers](self, "rowControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKInterfaceTable setRowControllers:](self, "setRowControllers:", v17);

  }
  -[WKInterfaceTable rowControllerProperties](self, "rowControllerProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKInterfaceTable setRowControllerProperties:](self, "setRowControllerProperties:", v19);

  }
  if (objc_msgSend(v14, "count"))
  {
    -[WKInterfaceTable rowControllers](self, "rowControllers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "insertObjects:atIndexes:", v14, v6);

  }
  if (objc_msgSend(v15, "count"))
  {
    -[WKInterfaceTable rowControllerProperties](self, "rowControllerProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "insertObjects:atIndexes:", v15, v6);

  }
  -[WKInterfaceTable resequenceRowControllerPropertyIndexes](self, "resequenceRowControllerPropertyIndexes");

}

- (void)removeRowsAtIndexes:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__WKInterfaceTable_removeRowsAtIndexes___block_invoke;
  v11[3] = &unk_24D3BCAA0;
  v11[4] = self;
  objc_msgSend(a3, "indexesPassingTest:", v11);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[WKInterfaceTable rowControllers](self, "rowControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[WKInterfaceTable rowControllers](self, "rowControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectsAtIndexes:", v10);

    }
    -[WKInterfaceTable rowControllerProperties](self, "rowControllerProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[WKInterfaceTable rowControllerProperties](self, "rowControllerProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectsAtIndexes:", v10);

    }
    -[WKInterfaceTable resequenceRowControllerPropertyIndexes](self, "resequenceRowControllerPropertyIndexes");
    -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v10, CFSTR(".remove"));
  }

}

BOOL __40__WKInterfaceTable_removeRowsAtIndexes___block_invoke(uint64_t a1, unint64_t a2, BOOL *a3)
{
  void *v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(*(id *)(a1 + 32), "rowControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend(v6, "count") <= a2;

  objc_msgSend(*(id *)(a1 + 32), "rowControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") > a2;

  return v8;
}

- (void)resequenceRowControllerPropertyIndexes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WKInterfaceTable rowControllerProperties](self, "rowControllerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setRowIndex:", v5);
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v11);
        }

        ++v5;
        ++v7;
      }
      while (v7 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

- (void)performSegueForRow:(int64_t)a3
{
  NSObject *v3;

  NSLog(CFSTR("WKInterfaceTable performSegueForRow: has no effect in a WatchKit extension that runs on iPhone."), a2, a3);
  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[WKInterfaceTable performSegueForRow:].cold.1(v3);

}

- (void)scrollToRowAtIndex:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR(".scroll"));

}

- (NSDictionary)rowDescriptions
{
  return self->_rowDescriptions;
}

- (void)setRowDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableArray)rowControllers
{
  return self->_rowControllers;
}

- (void)setRowControllers:(id)a3
{
  objc_storeStrong((id *)&self->_rowControllers, a3);
}

- (NSMutableArray)rowControllerProperties
{
  return self->_rowControllerProperties;
}

- (void)setRowControllerProperties:(id)a3
{
  objc_storeStrong((id *)&self->_rowControllerProperties, a3);
}

- (WKInterfaceController)controller
{
  return (WKInterfaceController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_rowControllerProperties, 0);
  objc_storeStrong((id *)&self->_rowControllers, 0);
  objc_storeStrong((id *)&self->_rowDescriptions, 0);
}

- (void)rowControllerAtIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "rowControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136446978;
  v7 = "-[WKInterfaceTable rowControllerAtIndex:]";
  v8 = 1024;
  v9 = 116;
  v10 = 2048;
  v11 = a2;
  v12 = 2048;
  v13 = objc_msgSend(v5, "count");
  _os_log_error_impl(&dword_215918000, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - attempt to ask for row %ld. Valid range is 0..%ld", (uint8_t *)&v6, 0x26u);

}

- (void)performSegueForRow:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136446466;
  v2 = "-[WKInterfaceTable performSegueForRow:]";
  v3 = 1024;
  v4 = 196;
  _os_log_error_impl(&dword_215918000, log, OS_LOG_TYPE_ERROR, "%{public}s:%d: WKInterfaceTable performSegueForRow: has no effect in a WatchKit extension that runs on iPhone.", (uint8_t *)&v1, 0x12u);
}

@end
