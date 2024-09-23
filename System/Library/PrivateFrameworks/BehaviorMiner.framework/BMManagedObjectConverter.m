@implementation BMManagedObjectConverter

- (id)convertRuleMOs:(id)a3 basketCount:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  BMRule *v19;
  void *v20;
  id *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  BMRule *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v31;
    v22 = a5;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "antecedent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        -[BMManagedObjectConverter convertItemMOs:error:](self, "convertItemMOs:error:", v11, &v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v29;

        if (v13)
          goto LABEL_13;
        objc_msgSend(v10, "consequent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        -[BMManagedObjectConverter convertItemMOs:error:](self, "convertItemMOs:error:", v14, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v28;

        if (v13)
        {

LABEL_13:
          a5 = v22;
          goto LABEL_14;
        }
        v27 = [BMRule alloc];
        objc_msgSend(v10, "support");
        v17 = v16;
        objc_msgSend(v10, "confidence");
        v19 = -[BMRule initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:](v27, "initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:", v12, v15, a4, objc_msgSend(v10, "absoluteSupport"), objc_msgSend(v10, "absoluteConsequentSupport"), objc_msgSend(v10, "absoluteConsequentSupport"), v17, v18, objc_msgSend(v10, "uniqueDaysLastWeek"), objc_msgSend(v10, "uniqueDaysTotal"));
        objc_msgSend(v8, "addObject:", v19);

      }
      v13 = 0;
      a5 = v22;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v26)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_14:

  if (a5)
    *a5 = objc_retainAutorelease(v13);
  if (v13)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)convertItemMOs:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BMItem *v15;
  void *v16;
  BMItem *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType allItemTypesDictionary](BMItemType, "allItemTypesDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v33;
    v29 = *MEMORY[0x24BDD0FC8];
    do
    {
      v11 = 0;
      v30 = v8;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        objc_msgSend(v12, "typeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = [BMItem alloc];
          objc_msgSend(v12, "normalizedValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[BMItem initWithType:normalizedValue:](v15, "initWithType:normalizedValue:", v14, v16);

          objc_msgSend(v5, "addObject:", v17);
        }
        else
        {
          v18 = (void *)MEMORY[0x24BDD1540];
          v36 = v29;
          v19 = v10;
          v20 = v6;
          v21 = v5;
          v22 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v12, "typeIdentifier");
          v17 = (BMItem *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ is not a registered type. See +[BMItemType allItemTypes] for possible values."), v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v23;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.BehaviorMiner"), 0, v24);
          v25 = objc_claimAutoreleasedReturnValue();

          v5 = v21;
          v6 = v20;
          v10 = v19;
          v8 = v30;
          v9 = (void *)v25;
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v9);
  if (v9)
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (id)insertRules:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BMRuleMO *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
        v14 = -[BMRuleMO initWithContext:]([BMRuleMO alloc], "initWithContext:", v7);
        objc_msgSend(v13, "antecedent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMManagedObjectConverter insertItems:inManagedObjectContext:](self, "insertItems:inManagedObjectContext:", v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMRuleMO setAntecedent:](v14, "setAntecedent:", v16);

        objc_msgSend(v13, "consequent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMManagedObjectConverter insertItems:inManagedObjectContext:](self, "insertItems:inManagedObjectContext:", v17, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMRuleMO setConsequent:](v14, "setConsequent:", v18);

        objc_msgSend(v13, "support");
        -[BMRuleMO setSupport:](v14, "setSupport:");
        objc_msgSend(v13, "confidence");
        -[BMRuleMO setConfidence:](v14, "setConfidence:");
        -[BMRuleMO setAbsoluteSupport:](v14, "setAbsoluteSupport:", objc_msgSend(v13, "absoluteSupport"));
        -[BMRuleMO setAbsoluteAntecedentSupport:](v14, "setAbsoluteAntecedentSupport:", objc_msgSend(v13, "absoluteConsequentSupport"));
        -[BMRuleMO setAbsoluteConsequentSupport:](v14, "setAbsoluteConsequentSupport:", objc_msgSend(v13, "absoluteConsequentSupport"));
        -[BMRuleMO setUniqueDaysLastWeek:](v14, "setUniqueDaysLastWeek:", objc_msgSend(v13, "uniqueDaysLastWeek"));
        -[BMRuleMO setUniqueDaysTotal:](v14, "setUniqueDaysTotal:", objc_msgSend(v13, "uniqueDaysTotal"));
        objc_msgSend(v8, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)insertItems:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BMItemMO *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = -[BMItemMO initWithContext:]([BMItemMO alloc], "initWithContext:", v6);
        objc_msgSend(v12, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMItemMO setTypeIdentifier:](v13, "setTypeIdentifier:", v15);

        objc_msgSend(v12, "normalizedValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMItemMO setNormalizedValue:](v13, "setNormalizedValue:", v16);

        objc_msgSend(v12, "uniformIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMItemMO setUniformIdentifier:](v13, "setUniformIdentifier:", v17);

        objc_msgSend(v7, "addObject:", v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
