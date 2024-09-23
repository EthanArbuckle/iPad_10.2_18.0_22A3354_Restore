@implementation FIIntervalSetDefinition

- (FIIntervalSetDefinition)initWithIntervalDefinitions:(id)a3 repeatCount:(int64_t)a4 setType:(int64_t)a5
{
  id v9;
  FIIntervalSetDefinition *v10;
  FIIntervalSetDefinition *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FIIntervalSetDefinition;
  v10 = -[FIIntervalSetDefinition init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_intervalDefinitions, a3);
    v11->_repeatCount = a4;
    v11->_setType = a5;
  }

  return v11;
}

- (unint64_t)intervalCount
{
  NSUInteger v3;

  v3 = -[NSArray count](self->_intervalDefinitions, "count");
  return v3 + v3 * self->_repeatCount;
}

- (id)intervalAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intervalDefinitions, "objectAtIndexedSubscript:", a3 % -[NSArray count](self->_intervalDefinitions, "count"));
}

+ (id)definitionFromDictionary:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
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
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  FIIntervalSetDefinition *v25;
  FIIntervalSetDefinition *v26;
  uint64_t v27;
  void *v28;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[10];

  v38[8] = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'intervalDefinitions' exists"), &__block_literal_global_54);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v4;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'repeatCount' exists"), &__block_literal_global_57);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v5;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'setType' exists"), &__block_literal_global_60);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v6;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'setType' is number"), &__block_literal_global_63);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v7;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'repeatCount' is number"), &__block_literal_global_66);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v8;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'intervalDefinitions' is an array"), &__block_literal_global_69);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v9;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'setType' is a valid identifier"), &__block_literal_global_73);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v10;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'intervalDefinitions' contains dictionaries only"), &__block_literal_global_76);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v31;
  LODWORD(v4) = +[FIValidation performValidations:withObject:error:](FIValidation, "performValidations:withObject:error:", v12, v31, a4);

  if ((_DWORD)v4)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("intervalDefinitions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v34;
      v19 = (void *)MEMORY[0x24BDBD1A8];
      while (2)
      {
        v20 = 0;
        v21 = v19;
        v22 = v17;
        do
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v14);
          v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v20);
          v32 = v22;
          +[FIIntervalDefinition definitionFromDictionary:error:](FIIntervalDefinition, "definitionFromDictionary:error:", v23, &v32);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v32;

          if (!v24)
          {
            v19 = v21;
            goto LABEL_13;
          }
          objc_msgSend(v21, "arrayByAddingObject:", v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          ++v20;
          v21 = v19;
          v22 = v17;
        }
        while (v16 != v20);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v16)
          continue;
        break;
      }
LABEL_13:

      if (v17)
      {
        FISetOutErrorIfNotNull(a4, v17);
        v25 = 0;
        v13 = v31;
LABEL_18:

        goto LABEL_19;
      }
      v13 = v31;
    }
    else
    {

      v19 = (void *)MEMORY[0x24BDBD1A8];
    }
    v26 = [FIIntervalSetDefinition alloc];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("repeatCount"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v17, "unsignedIntegerValue");
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("setType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v26, "initWithIntervalDefinitions:repeatCount:setType:", v19, v27, objc_msgSend(v28, "integerValue"));

    goto LABEL_18;
  }
  v25 = 0;
LABEL_19:

  return v25;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  -[FIIntervalSetDefinition intervalDefinitions](self, "intervalDefinitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fi_mapUsingBlock:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v9[0] = CFSTR("intervalDefinitions");
  v9[1] = CFSTR("repeatCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIIntervalSetDefinition repeatCount](self, "repeatCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("setType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIIntervalSetDefinition setType](self, "setType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__FIIntervalSetDefinition_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)byChangingRepeatCount:(int64_t)a3
{
  FIIntervalSetDefinition *v5;
  void *v6;
  FIIntervalSetDefinition *v7;

  v5 = [FIIntervalSetDefinition alloc];
  -[FIIntervalSetDefinition intervalDefinitions](self, "intervalDefinitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v5, "initWithIntervalDefinitions:repeatCount:setType:", v6, a3, -[FIIntervalSetDefinition setType](self, "setType"));

  return v7;
}

- (id)byChangingSetType:(int64_t)a3
{
  FIIntervalSetDefinition *v5;
  void *v6;
  FIIntervalSetDefinition *v7;

  v5 = [FIIntervalSetDefinition alloc];
  -[FIIntervalSetDefinition intervalDefinitions](self, "intervalDefinitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v5, "initWithIntervalDefinitions:repeatCount:setType:", v6, -[FIIntervalSetDefinition repeatCount](self, "repeatCount"), a3);

  return v7;
}

- (id)byAddingIntervalDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FIIntervalSetDefinition *v7;

  v4 = a3;
  -[FIIntervalSetDefinition intervalDefinitions](self, "intervalDefinitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:]([FIIntervalSetDefinition alloc], "initWithIntervalDefinitions:repeatCount:setType:", v6, -[FIIntervalSetDefinition repeatCount](self, "repeatCount"), -[FIIntervalSetDefinition setType](self, "setType"));
  return v7;
}

- (id)byInsertingIntervalDefinition:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  FIIntervalSetDefinition *v9;
  void *v10;
  FIIntervalSetDefinition *v11;

  v6 = a3;
  -[FIIntervalSetDefinition intervalDefinitions](self, "intervalDefinitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "insertObject:atIndex:", v6, a4);
  v9 = [FIIntervalSetDefinition alloc];
  v10 = (void *)objc_msgSend(v8, "copy");
  v11 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v9, "initWithIntervalDefinitions:repeatCount:setType:", v10, -[FIIntervalSetDefinition repeatCount](self, "repeatCount"), -[FIIntervalSetDefinition setType](self, "setType"));

  return v11;
}

- (id)byReplacingIntervalDefinitionAtIndex:(unint64_t)a3 withIntervalDefinition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  FIIntervalSetDefinition *v9;
  void *v10;
  FIIntervalSetDefinition *v11;

  v6 = a4;
  -[FIIntervalSetDefinition intervalDefinitions](self, "intervalDefinitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v6);
  v9 = [FIIntervalSetDefinition alloc];
  v10 = (void *)objc_msgSend(v8, "copy");
  v11 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v9, "initWithIntervalDefinitions:repeatCount:setType:", v10, -[FIIntervalSetDefinition repeatCount](self, "repeatCount"), -[FIIntervalSetDefinition setType](self, "setType"));

  return v11;
}

- (id)byRemovingIntervalDefinitionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FIIntervalSetDefinition *v7;
  void *v8;
  FIIntervalSetDefinition *v9;

  -[FIIntervalSetDefinition intervalDefinitions](self, "intervalDefinitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectAtIndex:", a3);
  v7 = [FIIntervalSetDefinition alloc];
  v8 = (void *)objc_msgSend(v6, "copy");
  v9 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v7, "initWithIntervalDefinitions:repeatCount:setType:", v8, -[FIIntervalSetDefinition repeatCount](self, "repeatCount"), -[FIIntervalSetDefinition setType](self, "setType"));

  return v9;
}

- (NSArray)intervalDefinitions
{
  return self->_intervalDefinitions;
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (int64_t)setType
{
  return self->_setType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalDefinitions, 0);
}

@end
