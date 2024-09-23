@implementation CAFASCTree

- (CAFASCTree)initWithContentsOfFile:(id)a3
{
  void *v4;
  CAFASCTree *v5;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFASCTree initWithDictionary:](self, "initWithDictionary:", v4);

  return v5;
}

- (CAFASCTree)initWithDictionary:(id)a3
{
  id v4;
  CAFASCTree *v5;
  uint64_t v6;
  NSMutableSet *missingRegistrations;
  uint64_t v8;
  NSDictionary *accessories;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFASCTree;
  v5 = -[CAFASCTree init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    missingRegistrations = v5->_missingRegistrations;
    v5->_missingRegistrations = (NSMutableSet *)v6;

    +[CAFASCTree _nodesOfType:fromDict:](CAFASCTree, "_nodesOfType:fromDict:", 0, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    accessories = v5->_accessories;
    v5->_accessories = (NSDictionary *)v8;

  }
  return v5;
}

+ (id)_nodesOfType:(unsigned __int8)a3 fromDict:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  unsigned __int8 v11;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__CAFASCTree__nodesOfType_fromDict___block_invoke;
  v9[3] = &unk_2508FF308;
  v11 = a3;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __36__CAFASCTree__nodesOfType_fromDict___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[CAFASCTreeNode nodeType:withString:](CAFASCTreeNode, "nodeType:withString:", *(unsigned __int8 *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    v6 = v12;
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    +[CAFASCTree _nodesOfType:fromDict:](CAFASCTree, "_nodesOfType:fromDict:", (*(_BYTE *)(a1 + 40) + 1), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChildren:", v8);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RegisteredValues"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRegisteredValues:", v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, v11);

  }
}

- (BOOL)hasAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[CAFASCTree accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CAFASCTree accessories](self, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)hasAccessory:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  if (-[CAFASCTree hasAccessory:](self, "hasAccessory:", v6))
  {
    -[CAFASCTree accessories](self, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "children");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[CAFASCTree nodeForAccessory:serviceType:](self, "nodeForAccessory:serviceType:", v6, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 != 0;

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_hasAccessory:(id)a3 service:(id)a4 characteristicOrControl:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  BOOL v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CAFASCTree hasAccessory:](self, "hasAccessory:", v8)
    && -[CAFASCTree hasAccessory:service:](self, "hasAccessory:service:", v8, v9))
  {
    -[CAFASCTree accessories](self, "accessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      -[CAFASCTree accessories](self, "accessories");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v8);
      v27 = v11;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "children");
      v26 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "children");
      v18 = v14;
      v19 = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 != 0;

      v13 = v19;
      v14 = v18;

      v12 = v26;
      v11 = v27;

    }
    else
    {
      v22 = 1;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)nodeForAccessory:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[CAFASCTree accessories](self, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_childNodeMatchingType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)treeLogLines
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CAFASCTree accessories](self, "accessories", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "treeLogLinesIndent:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)validateRegisteredForAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[CAFASCTree hasAccessory:](self, "hasAccessory:"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFASCTree logErrorIfNeededForMissingRegistration:](self, "logErrorIfNeededForMissingRegistration:", v6);

  }
}

- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!-[CAFASCTree hasAccessory:service:](self, "hasAccessory:service:", v11, v6))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFASCTree logErrorIfNeededForMissingRegistration:](self, "logErrorIfNeededForMissingRegistration:", v10);

  }
}

- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4 characteristic:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[CAFASCTree hasAccessory:service:characteristic:](self, "hasAccessory:service:characteristic:", v15, v8, v9))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFCharacteristicTypes characteristicNameForType:](CAFCharacteristicTypes, "characteristicNameForType:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@.%@"), v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFASCTree logErrorIfNeededForMissingRegistration:](self, "logErrorIfNeededForMissingRegistration:", v14);

  }
}

- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4 control:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[CAFASCTree hasAccessory:service:control:](self, "hasAccessory:service:control:", v15, v8, v9))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFControlTypes controlNameForType:](CAFControlTypes, "controlNameForType:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@.%@"), v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFASCTree logErrorIfNeededForMissingRegistration:](self, "logErrorIfNeededForMissingRegistration:", v14);

  }
}

- (void)logErrorIfNeededForMissingRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[CAFASCTree missingRegistrations](self, "missingRegistrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[CAFASCTree missingRegistrations](self, "missingRegistrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    -[CAFASCTree missingRegistrations](self, "missingRegistrations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

    CAFRegistrationLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAFASCTree logErrorIfNeededForMissingRegistration:].cold.1((uint64_t)v4, v9);

  }
  objc_sync_exit(v5);

}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (NSMutableSet)missingRegistrations
{
  return self->_missingRegistrations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingRegistrations, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

- (void)logErrorIfNeededForMissingRegistration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237717000, a2, OS_LOG_TYPE_ERROR, "!! This app is not registered for %@ !!", (uint8_t *)&v2, 0xCu);
}

@end
