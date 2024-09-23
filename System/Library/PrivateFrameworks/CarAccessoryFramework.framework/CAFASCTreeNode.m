@implementation CAFASCTreeNode

+ (id)nodeType:(unsigned __int8)a3 withType:(id)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setType:", v5);
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      +[CAFServiceTypes serviceNameByType](CAFServiceTypes, "serviceNameByType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
        goto LABEL_11;
      +[CAFAccessoryTypes accessoryNameByType](CAFAccessoryTypes, "accessoryNameByType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  +[CAFCharacteristicTypes characteristicNameByType](CAFCharacteristicTypes, "characteristicNameByType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_9:
    objc_msgSend(v6, "setName:", v9);
    goto LABEL_10;
  }
  +[CAFControlTypes controlNameByType](CAFControlTypes, "controlNameByType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v11);

LABEL_10:
LABEL_11:
  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("*")))
  {
    objc_msgSend(v6, "setName:", v5);
  }
  objc_msgSend(v6, "name");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
    v13 = v6;

  return v13;
}

+ (id)nodeType:(unsigned __int8)a3 withName:(id)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setName:", v5);
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      +[CAFServiceTypes serviceTypeByName](CAFServiceTypes, "serviceTypeByName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
        goto LABEL_11;
      +[CAFAccessoryTypes accessoryTypeByName](CAFAccessoryTypes, "accessoryTypeByName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  +[CAFCharacteristicTypes characteristicTypeByName](CAFCharacteristicTypes, "characteristicTypeByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_9:
    objc_msgSend(v6, "setType:", v9);
    goto LABEL_10;
  }
  +[CAFControlTypes controlTypeByName](CAFControlTypes, "controlTypeByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setType:", v11);

LABEL_10:
LABEL_11:
  objc_msgSend(v6, "type");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12 = v6;

  return v12;
}

+ (id)nodeType:(unsigned __int8)a3 withString:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  objc_msgSend(a1, "nodeType:withType:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(a1, "nodeType:withName:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFASCTreeNode name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFASCTreeNode type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFASCTreeNode children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name=%@ type=%@> %@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)treeLogLinesIndent:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("\t"));
      --v6;
    }
    while (v6);
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[CAFASCTreeNode name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFASCTreeNode type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@ %@"), v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CAFASCTreeNode children](self, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    v18 = a3 + 1;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "treeLogLinesIndent:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v20);

        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  return v12;
}

- (id)_childNodeMatchingType:(id)a3
{
  id v4;
  NSDictionary *children;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  children = self->_children;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__CAFASCTreeNode__childNodeMatchingType___block_invoke;
  v10[3] = &unk_2508FF2E0;
  v6 = v4;
  v11 = v6;
  v12 = &v14;
  v13 = &v20;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](children, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = (void *)v15[5];
  if (!v7)
    v7 = (void *)v21[5];
  v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __41__CAFASCTreeNode__childNodeMatchingType___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (objc_msgSend(v8, "isEqualToString:", a1[4]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("*")))
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSArray)registeredValues
{
  return self->_registeredValues;
}

- (void)setRegisteredValues:(id)a3
{
  objc_storeStrong((id *)&self->_registeredValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredValues, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
