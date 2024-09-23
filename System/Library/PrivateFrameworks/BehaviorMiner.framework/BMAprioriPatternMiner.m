@implementation BMAprioriPatternMiner

- (BMAprioriPatternMiner)initWithBaskets:(id)a3
{
  id v4;
  BMAprioriPatternMiner *v5;
  BMAprioriPatternMiner *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *items;
  uint64_t v22;
  NSArray *indexBaskets;
  BMAprioriPatternMiner *v25;
  id v26;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMAprioriPatternMiner;
  v5 = -[BMAprioriPatternMiner init](&v40, sel_init);
  v6 = v5;
  if (v5)
  {
    v25 = v5;
    v5->_maxItemsetSize = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = v4;
    obj = v4;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v30)
    {
      v28 = *(_QWORD *)v37;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(obj);
          v31 = v9;
          v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v33 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                v18 = objc_msgSend(v8, "indexOfObject:", v17);
                if (v18 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(v8, "addObject:", v17);
                  v18 = objc_msgSend(v8, "indexOfObject:", v17);
                  objc_msgSend(v7, "addObject:", v17);
                }
                objc_msgSend(v11, "addIndex:", v18);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v14);
          }

          v19 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v29, "addObject:", v19);

          v9 = v31 + 1;
        }
        while (v31 + 1 != v30);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v30);
    }

    v20 = objc_msgSend(v7, "copy");
    v6 = v25;
    items = v25->_items;
    v25->_items = (NSArray *)v20;

    v22 = objc_msgSend(v29, "copy");
    indexBaskets = v25->_indexBaskets;
    v25->_indexBaskets = (NSArray *)v22;

    v25->_shouldStop = 0;
    v4 = v26;
  }

  return v6;
}

- (void)terminateEarly
{
  -[BMAprioriPatternMiner setShouldStop:](self, "setShouldStop:", 1);
}

- (id)supportOfItemIndexSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMAprioriPatternMiner indexBaskets](self, "indexBaskets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "containsIndexes:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getItemIndexSetsWithMinSupport:(double)a3 itemIndexSets:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if (-[BMAprioriPatternMiner shouldStop](self, "shouldStop", (_QWORD)v18))
        {

          v16 = (id)MEMORY[0x24BDBD1B8];
          goto LABEL_13;
        }
        -[BMAprioriPatternMiner supportOfItemIndexSet:](self, "supportOfItemIndexSet:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (double)objc_msgSend(v14, "integerValue");
        if (v15 >= a3)
          objc_msgSend(v7, "setObject:forKey:", v14, v13, v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = v7;
LABEL_13:

  return v16;
}

- (id)minePatternsWithMinSupport:(unint64_t)a3 constrainedToPatternsWithTypes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  unint64_t v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAprioriPatternMiner items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __83__BMAprioriPatternMiner_minePatternsWithMinSupport_constrainedToPatternsWithTypes___block_invoke;
  v46[3] = &unk_24D21E6F8;
  v40 = v6;
  v47 = v40;
  v9 = v7;
  v48 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v46);

  v39 = v9;
  v45 = (void *)objc_msgSend(v9, "copy");
  v10 = 0x24BDBC000uLL;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[BMAprioriPatternMiner items](self, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

      ++v14;
      -[BMAprioriPatternMiner items](self, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v17 > v14);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (double)a3;
  v38 = v11;
  -[BMAprioriPatternMiner getItemIndexSetsWithMinSupport:itemIndexSets:](self, "getItemIndexSetsWithMinSupport:itemIndexSets:", v11, (double)a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (objc_msgSend(v20, "count"))
  {
    v22 = 2;
    v23 = v20;
    v37 = v18;
    while (1)
    {
      objc_msgSend(v18, "addEntriesFromDictionary:", v23);
      v43 = objc_alloc_init(*(Class *)(v10 + 3768));

      v41 = v23;
      objc_msgSend(v23, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count"))
        break;
LABEL_17:
      if (-[BMAprioriPatternMiner maxItemsetSize](self, "maxItemsetSize")
        && v22 > -[BMAprioriPatternMiner maxItemsetSize](self, "maxItemsetSize"))
      {
        BMLog();
        v35 = objc_claimAutoreleasedReturnValue();
        v21 = v43;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[BMAprioriPatternMiner minePatternsWithMinSupport:constrainedToPatternsWithTypes:].cold.1(self, v35);

        v20 = v41;
        v18 = v37;
        goto LABEL_25;
      }
      v21 = v43;
      -[BMAprioriPatternMiner getItemIndexSetsWithMinSupport:itemIndexSets:](self, "getItemIndexSetsWithMinSupport:itemIndexSets:", v43, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      ++v22;
      v23 = v20;
      v10 = 0x24BDBC000;
      v18 = v37;
      if (!objc_msgSend(v20, "count"))
        goto LABEL_25;
    }
    v25 = 0;
    v44 = v24;
    while (1)
    {
      v42 = v25 + 1;
      if (v25 + 1 < objc_msgSend(v24, "count"))
        break;
LABEL_16:
      v25 = v42;
      if (v42 >= objc_msgSend(v24, "count"))
        goto LABEL_17;
    }
    v26 = v25 + 1;
    while (!-[BMAprioriPatternMiner shouldStop](self, "shouldStop"))
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc_init(MEMORY[0x24BDD1698]);
      objc_msgSend(v29, "addIndexes:", v27);
      objc_msgSend(v29, "addIndexes:", v28);
      if (objc_msgSend(v29, "count") == v22)
      {
        v30 = v25;
        v31 = v22;
        v32 = (void *)objc_msgSend(v45, "mutableCopy");
        objc_msgSend(v32, "removeIndexes:", v29);
        v33 = objc_msgSend(v32, "count");
        if (v33 != objc_msgSend(v45, "count"))
          objc_msgSend(v43, "addObject:", v29);

        v22 = v31;
        v25 = v30;
        v24 = v44;
      }

      if (++v26 >= objc_msgSend(v24, "count"))
        goto LABEL_16;
    }

    v34 = (id)MEMORY[0x24BDBD1B8];
    v18 = v37;
    v21 = v43;
    v20 = v41;
  }
  else
  {
LABEL_25:
    v34 = v18;
  }

  return v34;
}

void __83__BMAprioriPatternMiner_minePatternsWithMinSupport_constrainedToPatternsWithTypes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (NSArray)indexBaskets
{
  return self->_indexBaskets;
}

- (unint64_t)maxItemsetSize
{
  return self->_maxItemsetSize;
}

- (void)setMaxItemsetSize:(unint64_t)a3
{
  self->_maxItemsetSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexBaskets, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)minePatternsWithMinSupport:(void *)a1 constrainedToPatternsWithTypes:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "maxItemsetSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_2147C2000, a2, OS_LOG_TYPE_DEBUG, "Finished mining patterns due to max items in itemset (%@) reached", (uint8_t *)&v4, 0xCu);

}

@end
