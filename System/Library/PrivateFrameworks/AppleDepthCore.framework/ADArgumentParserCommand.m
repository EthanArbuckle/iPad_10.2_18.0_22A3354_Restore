@implementation ADArgumentParserCommand

- (ADArgumentParserCommand)init
{
  ADArgumentParserCommand *v2;
  ADArgumentParserCommand *v3;
  NSString *name;
  NSString *descriptionString;
  ADArgumentParserCommandHandler *handler;
  uint64_t v7;
  NSMutableArray *positionalArguments;
  uint64_t v9;
  NSMutableArray *optionalArguments;
  uint64_t v11;
  NSMutableArray *subCommands;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ADArgumentParserCommand;
  v2 = -[ADArgumentParserCommand init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    descriptionString = v3->_descriptionString;
    v3->_descriptionString = 0;

    handler = v3->_handler;
    v3->_handler = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    positionalArguments = v3->_positionalArguments;
    v3->_positionalArguments = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    optionalArguments = v3->_optionalArguments;
    v3->_optionalArguments = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    subCommands = v3->_subCommands;
    v3->_subCommands = (NSMutableArray *)v11;

  }
  return v3;
}

- (void)addDescription:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionString, a3);
}

- (void)addPositionalArgument:(id)a3
{
  -[NSMutableArray addObject:](self->_positionalArguments, "addObject:", a3);
}

- (void)addOptionalArgument:(id)a3
{
  -[NSMutableArray addObject:](self->_optionalArguments, "addObject:", a3);
}

- (void)addSubCommand:(id)a3 withName:(SEL)a4 description:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  -[NSMutableArray addObject:](self->_subCommands, "addObject:", v10);
  NSStringFromSelector(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", v9);

  objc_msgSend(v10, "setDescriptionString:", v8);
}

- (void)addSubCommand:(id)a3 withName:(id)a4 description:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[NSMutableArray addObject:](self->_subCommands, "addObject:", v13);
  objc_msgSend(v13, "setName:", v10);
  objc_msgSend(v13, "setDescriptionString:", v11);
  objc_msgSend(v13, "setHandler:", v12);

}

- (BOOL)verifyInputs
{
  return 1;
}

- (id)subCommandsUsageWithPrefix:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@\n"), self->_name, self->_descriptionString);
  objc_msgSend(v4, "appendString:", CFSTR("Usage:\n"));
  if (-[NSMutableArray count](self->_subCommands, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = self->_subCommands;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v8, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v23, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortUsageWithPrefix:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("\t%@\n"), v12);

        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v5);
    }

    objc_msgSend(v4, "appendString:", CFSTR("Commands:\n"));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = self->_subCommands;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "rightPaddToLength:", 45);
          objc_msgSend(v17, "descriptionString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("\t%@%@\n"), v19, v20);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v14);
    }

  }
  return v4;
}

- (id)shortUsageWithPrefix:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@ "), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_positionalArguments;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v8), "shortUsage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ "), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_optionalArguments;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "shortUsage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ "), v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v11);
  }

  if (-[NSMutableArray count](self->_subCommands, "count"))
  {
    objc_msgSend(v4, "appendString:", CFSTR(" ("));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_subCommands;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("%@|"), v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    objc_msgSend(v4, "appendString:", CFSTR(")"));
  }
  return v4;
}

- (id)fullUsageWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *optionalArguments;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *positionalArguments;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@: %@\n"), self->_name, self->_descriptionString);
  objc_msgSend(v5, "appendString:", CFSTR("Usage:\n"));
  -[ADArgumentParserCommand shortUsageWithPrefix:](self, "shortUsageWithPrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@\n"), v6);

  optionalArguments = self->_optionalArguments;
  if (optionalArguments && -[NSMutableArray count](optionalArguments, "count"))
  {
    objc_msgSend(v5, "appendString:", CFSTR("Options:\n"));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = self->_optionalArguments;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "fullUsage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("\t%@\n"), v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

  }
  positionalArguments = self->_positionalArguments;
  if (positionalArguments && -[NSMutableArray count](positionalArguments, "count"))
  {
    objc_msgSend(v5, "appendString:", CFSTR("Positional Arguments:\n"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_positionalArguments;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "fullUsage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("\t%@\n"), v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

  }
  return v5;
}

- (id)usage
{
  void *v3;

  if (-[NSMutableArray count](self->_optionalArguments, "count")
    || -[NSMutableArray count](self->_positionalArguments, "count"))
  {
    -[ADArgumentParserCommand fullUsageWithPrefix:](self, "fullUsageWithPrefix:", self->_preParsedPrefix);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ADArgumentParserCommand subCommandsUsageWithPrefix:](self, "subCommandsUsageWithPrefix:", self->_preParsedPrefix);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)checkIfName:(id)a3 notInList:(id)a4
{
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "containsObject:", v5);
  if (v7)
    printf("ADArgumentParser Error: argument name %s added more than once. unable to resolve\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  else
    objc_msgSend(v6, "addObject:", v5);

  return v7 ^ 1;
}

- (BOOL)verifySingleArgName:(id)a3 ofType:(unint64_t)a4
{
  id v5;
  objc_class *v6;
  id v7;
  objc_property *Property;
  objc_property *v9;
  objc_class *v10;
  BOOL v11;
  uint64_t v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = objc_retainAutorelease(v5);
  Property = class_getProperty(v6, (const char *)objc_msgSend(v7, "UTF8String"));
  v9 = Property;
  if (!Property)
  {
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    printf("ADArgumentParser Error: argument name %s does not match any declared class property\n");
    goto LABEL_6;
  }
  if (a4 != 8)
  {
    v12 = propertyOptionType(Property);
    if (v12 != a4)
    {
      if ((v12 & 0xD) != 0)
      {
        if ((unint64_t)(v12 - 5) > 2 || a4 - 5 >= 3)
          goto LABEL_4;
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
        goto LABEL_4;
      }
    }
LABEL_13:
    v11 = 1;
    goto LABEL_14;
  }
  v10 = (objc_class *)objc_opt_class();
  if (isPropertyDerivedFromClass(v9, v10))
    goto LABEL_13;
LABEL_4:
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  printf("ADArgumentParser Error: argument name %s declared type does not match property type\n");
LABEL_6:
  v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)verifyArgumentsForClass
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = self->_optionalArguments;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v35;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = -[ADArgumentParserCommand verifySingleArgName:ofType:](self, "verifySingleArgName:ofType:", v9, objc_msgSend(v8, "type"));

        v6 &= v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = self->_positionalArguments;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = -[ADArgumentParserCommand verifySingleArgName:ofType:](self, "verifySingleArgName:ofType:", v15, objc_msgSend(v14, "type"));

        v6 &= v14;
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v11);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = self->_subCommands;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
        objc_msgSend(v20, "handler", (_QWORD)v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (v22)
        {
          objc_msgSend(v20, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[ADArgumentParserCommand verifySingleArgName:ofType:](self, "verifySingleArgName:ofType:", v23, 8);

          v6 &= v24;
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v17);
  }

  return v6 & 1;
}

- (BOOL)verifyNoArgumentDuplications
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  BOOL v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = self->_optionalArguments;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v36;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[ADArgumentParserCommand checkIfName:notInList:](self, "checkIfName:notInList:", v10, v3);

        v7 &= v11;
        if (objc_msgSend(v9, "shortName"))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), (int)objc_msgSend(v9, "shortName"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[ADArgumentParserCommand checkIfName:notInList:](self, "checkIfName:notInList:", v12, v3);

          v7 &= v13;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = self->_positionalArguments;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ADArgumentParserCommand checkIfName:notInList:](self, "checkIfName:notInList:", v18, v3);

        LOBYTE(v7) = v7 & v19;
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v15);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_subCommands;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * k), "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[ADArgumentParserCommand checkIfName:notInList:](self, "checkIfName:notInList:", v24, v3);

        LOBYTE(v7) = v7 & v25;
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v21);
  }

  return v7;
}

- (BOOL)verifyCommandStructure
{
  uint64_t v3;
  int v4;
  objc_class *v5;
  const char *v6;
  objc_class *v7;
  const char *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_class *v13;
  const char *Name;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_subCommands, "count")
    && (v3 = -[NSMutableArray count](self->_optionalArguments, "count"),
        v3 + -[NSMutableArray count](self->_positionalArguments, "count")))
  {
    v13 = (objc_class *)objc_opt_class();
    Name = class_getName(v13);
    printf("ADArgumentParser Error: a command %s cannot have both subcommands and positional/optional arguments\n", Name);
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = -[ADArgumentParserCommand verifyArgumentsForClass](self, "verifyArgumentsForClass");
    if ((v4 & 1) == 0)
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = class_getName(v5);
      printf("ADArgumentParser Error: missmatch between declared arguments and class properties for command %s\n", v6);
    }
    if (!-[ADArgumentParserCommand verifyNoArgumentDuplications](self, "verifyNoArgumentDuplications"))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = class_getName(v7);
      printf("ADArgumentParser Error: some arguemnts in command %s were added more than once\n", v8);
      v4 = 0;
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_subCommands;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v4 &= objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "verifyCommandStructure");
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  return v4;
}

- (BOOL)parseSubCommand:(id)a3 commandIndex:(unsigned int)a4
{
  unint64_t v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  NSString *v21;
  char v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v6 = a4 + 1;
  if (objc_msgSend(v25, "count") <= v6)
  {
    objc_msgSend(v25, "lastObject");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("ADArgumentParser Error: expecting subcommand after %s\n", (const char *)objc_msgSend(v11, "UTF8String"));

    -[ADArgumentParserCommand usage](self, "usage");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    puts((const char *)objc_msgSend(v12, "UTF8String"));

    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v25, "objectAtIndexedSubscript:", a4 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("-h")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("--help")))
  {
    -[ADArgumentParserCommand usage](self, "usage");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    puts((const char *)objc_msgSend(v8, "UTF8String"));

  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = self->_subCommands;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v27;
LABEL_11:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v17);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v7);

        if ((v20 & 1) != 0)
          break;
        if (v15 == ++v17)
        {
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v15)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      v9 = v18;

      if (!v9)
        goto LABEL_22;
      objc_msgSend(v9, "name");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSSelectorFromString(v21);
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        objc_msgSend(v9, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADArgumentParserCommand setValue:forKey:](self, "setValue:forKey:", v9, v23);

      }
      v10 = objc_msgSend(v9, "commandParse:commandIndex:", v25, v6);
      goto LABEL_6;
    }
LABEL_17:

LABEL_22:
    printf("unknown command %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    -[ADArgumentParserCommand usage](self, "usage");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    puts((const char *)objc_msgSend(v24, "UTF8String"));

  }
  v9 = 0;
  v10 = 0;
LABEL_6:

LABEL_8:
  return v10;
}

- (BOOL)parseUsingDocopt:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  char **v14;
  _QWORD *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t j;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t *v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t *v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *__p;
  char v39;
  char v40;
  _QWORD *v41;
  _QWORD *v42;
  char *v43;
  void **v44;
  _QWORD *v45;
  _QWORD *v46;
  void **v47;
  _QWORD *v48;
  _QWORD *v49;
  char v50;
  _QWORD *v51;
  _QWORD *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v45 = 0;
  v46 = 0;
  v44 = (void **)&v45;
  -[ADArgumentParserCommand usage](self, "usage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  v7 = operator new[]();
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_QWORD *)(v7 + 8 * i) = objc_msgSend(v9, "UTF8String");

    }
  }
  v41 = 0;
  v42 = 0;
  v43 = 0;
  __p = &v41;
  v39 = 0;
  v10 = 8 * v6 - 8;
  if (8 * v6 != 8)
  {
    if ((unint64_t)v10 >= 0x5555555555555551)
      std::vector<Element *>::__throw_length_error[abi:ne180100]();
    v11 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v10 >> 3);
    v41 = v11;
    v42 = v11;
    v43 = (char *)&v11[3 * v12];
    v51 = v11;
    v52 = v11;
    v47 = (void **)&v43;
    v48 = &v51;
    v49 = &v52;
    v50 = 0;
    v13 = v11;
    if (v6 != 1)
    {
      v14 = (char **)(v7 + 8);
      v13 = v11;
      do
      {
        std::string::basic_string[abi:ne180100]<0>(v13, *v14++);
        v13 = v52 + 3;
        v52 += 3;
        v10 -= 8;
      }
      while (v10);
    }
    v50 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&v47);
    v42 = v13;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  -[NSString UTF8String](self->_programName, "UTF8String");
  docopt::docopt_parse();
  std::__tree<std::__value_type<std::string,docopt::value>,std::__map_value_compare<std::string,std::__value_type<std::string,docopt::value>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,docopt::value>>>::destroy(v45);
  v15 = v48;
  v44 = v47;
  v45 = v48;
  v46 = v49;
  if (v49)
  {
    v48[2] = &v45;
    v47 = (void **)&v48;
    v48 = 0;
    v49 = 0;
    v15 = 0;
  }
  else
  {
    v44 = (void **)&v45;
  }
  std::__tree<std::__value_type<std::string,docopt::value>,std::__map_value_compare<std::string,std::__value_type<std::string,docopt::value>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,docopt::value>>>::destroy(v15);
  if (v40 < 0)
    operator delete(__p);
  v47 = (void **)&v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v47);
  MEMORY[0x23B7F1D4C](v7, 0x50C80EE9192B6);
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v34 = 0u;
  v16 = self->_optionalArguments;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v35;
    v19 = 1;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        std::map<std::string,docopt::value>::map[abi:ne180100](v33, &v44);
        v19 &= objc_msgSend(v21, "setPropertyFromMap:toCommand:", v33, self);
        std::__tree<std::__value_type<std::string,docopt::value>,std::__map_value_compare<std::string,std::__value_type<std::string,docopt::value>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,docopt::value>>>::destroy(v33[1]);
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 1;
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = self->_positionalArguments;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v53, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
        std::map<std::string,docopt::value>::map[abi:ne180100](v28, &v44);
        v19 &= objc_msgSend(v26, "setPropertyFromMap:toCommand:", v28, self);
        std::__tree<std::__value_type<std::string,docopt::value>,std::__map_value_compare<std::string,std::__value_type<std::string,docopt::value>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,docopt::value>>>::destroy(v28[1]);
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v53, 16);
    }
    while (v23);
  }

  std::__tree<std::__value_type<std::string,docopt::value>,std::__map_value_compare<std::string,std::__value_type<std::string,docopt::value>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,docopt::value>>>::destroy(v45);
  return v19;
}

- (BOOL)commandParse:(id)a3 commandIndex:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSString *v8;
  NSString *programName;
  NSString **p_preParsedPrefix;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSString *v16;
  char v17;
  BOOL v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  programName = self->_programName;
  self->_programName = v8;

  p_preParsedPrefix = &self->_preParsedPrefix;
  objc_storeStrong((id *)&self->_preParsedPrefix, self->_programName);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "subarrayWithRange:", 1, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v11);
        -[NSString stringByAppendingFormat:](*p_preParsedPrefix, "stringByAppendingFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *p_preParsedPrefix;
        *p_preParsedPrefix = (NSString *)v15;

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  if (!-[NSMutableArray count](self->_subCommands, "count"))
  {
    if (-[NSMutableArray count](self->_optionalArguments, "count")
      || -[NSMutableArray count](self->_positionalArguments, "count"))
    {
      if (!-[ADArgumentParserCommand parseUsingDocopt:](self, "parseUsingDocopt:", v6))
        goto LABEL_18;
    }
    else if (objc_msgSend(v6, "count") > (unint64_t)(v4 + 1))
    {
      goto LABEL_18;
    }
    if (-[ADArgumentParserCommand verifyInputs](self, "verifyInputs"))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v18 = 1;
        goto LABEL_19;
      }
      v17 = -[ADArgumentParserCommandHandler didReceiveCommand:](self->_handler, "didReceiveCommand:", self);
      goto LABEL_10;
    }
LABEL_18:
    -[ADArgumentParserCommand usage](self, "usage");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    puts((const char *)objc_msgSend(v19, "UTF8String"));

    v18 = 0;
    goto LABEL_19;
  }
  v17 = -[ADArgumentParserCommand parseSubCommand:commandIndex:](self, "parseSubCommand:commandIndex:", v6, v4);
LABEL_10:
  v18 = v17;
LABEL_19:

  return v18;
}

- (ADArgumentParserCommandHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_storeStrong((id *)&self->_handler, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_subCommands, 0);
  objc_storeStrong((id *)&self->_optionalArguments, 0);
  objc_storeStrong((id *)&self->_positionalArguments, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_preParsedPrefix, 0);
  objc_storeStrong((id *)&self->_programName, 0);
}

@end
