@implementation FIIntervalWorkoutDefinition

- (FIIntervalWorkoutDefinition)initWithName:(id)a3 identifier:(id)a4 sets:(id)a5
{
  id v9;
  id v10;
  id v11;
  FIIntervalWorkoutDefinition *v12;
  FIIntervalWorkoutDefinition *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FIIntervalWorkoutDefinition;
  v12 = -[FIIntervalWorkoutDefinition init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_sets, a5);
    objc_storeStrong((id *)&v13->_identifier, a4);
  }

  return v13;
}

- (unint64_t)intervalCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_sets;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "intervalCount", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)intervalDefinitionForIntervalAtIndex:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_sets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "intervalCount", (_QWORD)v13) + v7 > (unint64_t)a3)
        {
          objc_msgSend(v10, "intervalAtIndex:", a3 - v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        v7 += objc_msgSend(v10, "intervalCount");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)definitionFromDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  FIIntervalWorkoutDefinition *v23;
  FIIntervalWorkoutDefinition *v24;
  id v25;
  void *v26;
  void *v27;
  id *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[7];

  v36[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'name' exists"), &__block_literal_global_62);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'identifier' exists"), &__block_literal_global_65);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v7;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'sets' exists"), &__block_literal_global_68);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v8;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Sets is an arary"), &__block_literal_global_71);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v9;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'sets' contains dictionaries only"), &__block_literal_global_74);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = +[FIValidation performValidations:withObject:error:](FIValidation, "performValidations:withObject:error:", v11, v5, a4);
  if ((_DWORD)v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sets"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v13)
    {
      v14 = v13;
      v29 = a4;
      v15 = 0;
      v16 = *(_QWORD *)v32;
      v17 = (void *)MEMORY[0x24BDBD1A8];
      while (2)
      {
        v18 = 0;
        v19 = v17;
        v20 = v15;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v12);
          v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18);
          v30 = v20;
          +[FIIntervalSetDefinition definitionFromDictionary:error:](FIIntervalSetDefinition, "definitionFromDictionary:error:", v21, &v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v30;

          if (!v22)
          {
            v17 = v19;
            goto LABEL_13;
          }
          objc_msgSend(v19, "arrayByAddingObject:", v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          ++v18;
          v19 = v17;
          v20 = v15;
        }
        while (v14 != v18);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v14)
          continue;
        break;
      }
LABEL_13:

      if (v15)
      {
        FISetOutErrorIfNotNull(v29, v15);
        v23 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

      v17 = (void *)MEMORY[0x24BDBD1A8];
    }
    v24 = [FIIntervalWorkoutDefinition alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithUUIDString:", v26);
    v23 = -[FIIntervalWorkoutDefinition initWithName:identifier:sets:](v24, "initWithName:identifier:sets:", v15, v27, v17);

    goto LABEL_17;
  }
  v23 = 0;
LABEL_18:

  return v23;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fi_mapUsingBlock:", &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("name");
  -[FIIntervalWorkoutDefinition name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("identifier");
  -[FIIntervalWorkoutDefinition identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = CFSTR("sets");
  v11[1] = v7;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __55__FIIntervalWorkoutDefinition_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

+ (id)intervalWorkoutDefinition
{
  FIIntervalSetDefinition *v2;
  FIIntervalSetDefinition *v3;
  FIIntervalWorkoutDefinition *v4;
  void *v5;
  void *v6;
  FIIntervalWorkoutDefinition *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = [FIIntervalSetDefinition alloc];
  v3 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v2, "initWithIntervalDefinitions:repeatCount:setType:", MEMORY[0x24BDBD1A8], 0, 2);
  v4 = [FIIntervalWorkoutDefinition alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FIIntervalWorkoutDefinition initWithName:identifier:sets:](v4, "initWithName:identifier:sets:", &stru_24CC50B10, v5, v6);

  return v7;
}

- (id)byChangingName:(id)a3
{
  id v4;
  FIIntervalWorkoutDefinition *v5;
  void *v6;
  void *v7;
  FIIntervalWorkoutDefinition *v8;

  v4 = a3;
  v5 = [FIIntervalWorkoutDefinition alloc];
  -[FIIntervalWorkoutDefinition identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FIIntervalWorkoutDefinition initWithName:identifier:sets:](v5, "initWithName:identifier:sets:", v4, v6, v7);

  return v8;
}

- (id)byAddingSetDefinition:(id)a3
{
  id v4;
  FIIntervalWorkoutDefinition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FIIntervalWorkoutDefinition *v10;

  v4 = a3;
  v5 = [FIIntervalWorkoutDefinition alloc];
  -[FIIntervalWorkoutDefinition name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinition identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FIIntervalWorkoutDefinition initWithName:identifier:sets:](v5, "initWithName:identifier:sets:", v6, v7, v9);
  return v10;
}

- (id)byInsertingSetDefinition:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  FIIntervalWorkoutDefinition *v9;
  void *v10;
  void *v11;
  void *v12;
  FIIntervalWorkoutDefinition *v13;

  v6 = a3;
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "insertObject:atIndex:", v6, a4);
  v9 = [FIIntervalWorkoutDefinition alloc];
  -[FIIntervalWorkoutDefinition name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinition identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "copy");
  v13 = -[FIIntervalWorkoutDefinition initWithName:identifier:sets:](v9, "initWithName:identifier:sets:", v10, v11, v12);

  return v13;
}

- (id)byReplacingSetDefinitionAtIndex:(unint64_t)a3 withSetDefinition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  FIIntervalWorkoutDefinition *v9;
  void *v10;
  void *v11;
  void *v12;
  FIIntervalWorkoutDefinition *v13;

  v6 = a4;
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v6);
  v9 = [FIIntervalWorkoutDefinition alloc];
  -[FIIntervalWorkoutDefinition name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinition identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "copy");
  v13 = -[FIIntervalWorkoutDefinition initWithName:identifier:sets:](v9, "initWithName:identifier:sets:", v10, v11, v12);

  return v13;
}

- (id)byRemovingSetDefinitionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FIIntervalWorkoutDefinition *v7;
  void *v8;
  void *v9;
  void *v10;
  FIIntervalWorkoutDefinition *v11;

  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectAtIndex:", a3);
  v7 = [FIIntervalWorkoutDefinition alloc];
  -[FIIntervalWorkoutDefinition name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinition identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "copy");
  v11 = -[FIIntervalWorkoutDefinition initWithName:identifier:sets:](v7, "initWithName:identifier:sets:", v8, v9, v10);

  return v11;
}

- (id)byAddingIntervalDefinition:(id)a3 toSetIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "byAddingIntervalDefinition:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIIntervalWorkoutDefinition byReplacingSetDefinitionAtIndex:withSetDefinition:](self, "byReplacingSetDefinitionAtIndex:withSetDefinition:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)byInsertingIntervalDefinition:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "byInsertingIntervalDefinition:atIndex:", v7, objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "section");
  -[FIIntervalWorkoutDefinition byReplacingSetDefinitionAtIndex:withSetDefinition:](self, "byReplacingSetDefinitionAtIndex:withSetDefinition:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)byReplacingIntervalDefinitionAtIndexPath:(id)a3 withIntervalDefinition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "byReplacingIntervalDefinitionAtIndex:withIntervalDefinition:", objc_msgSend(v7, "row"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "section");
  -[FIIntervalWorkoutDefinition byReplacingSetDefinitionAtIndex:withSetDefinition:](self, "byReplacingSetDefinitionAtIndex:withSetDefinition:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)byRemovingIntervalDefinitionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[FIIntervalWorkoutDefinition sets](self, "sets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "byRemovingIntervalDefinitionAtIndex:", objc_msgSend(v4, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "section");

  -[FIIntervalWorkoutDefinition byReplacingSetDefinitionAtIndex:withSetDefinition:](self, "byReplacingSetDefinitionAtIndex:withSetDefinition:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)sets
{
  return self->_sets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
