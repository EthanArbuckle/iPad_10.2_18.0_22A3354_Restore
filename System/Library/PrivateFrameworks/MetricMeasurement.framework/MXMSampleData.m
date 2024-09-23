@implementation MXMSampleData

- (NSSet)tags
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_tagsToSampleSets, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v9) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSArray)samples
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[MXMSampleData tags](self, "tags");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "samples");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObjectsFromArray:", v14);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)numberOfSets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MXMSampleData tags](self, "tags", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_tagsToSampleSets, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "count");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)numberOfSamples
{
  void *v2;
  unint64_t v3;

  -[MXMSampleData samples](self, "samples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (id)data
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "init");
}

- (MXMSampleData)init
{
  MXMSampleData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXMSampleData;
  v2 = -[MXMSampleData init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleData setTagsToSampleSets:](v2, "setTagsToSampleSets:", v3);

    -[MXMSampleData setEnumSet:](v2, "setEnumSet:", 0);
  }
  return v2;
}

- (MXMSampleData)initWithSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MXMSampleData *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MXMSampleData initWithSets:](self, "initWithSets:", v6, v9, v10);
  return v7;
}

- (MXMSampleData)initWithSets:(id)a3
{
  id v4;
  MXMSampleData *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MXMSampleData init](self, "init");
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[MXMSampleData _appendSet:](v5, "_appendSet:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)sampleSetWithTag:(id)a3 attribute:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleData sampleSetWithTag:attributes:](self, "sampleSetWithTag:attributes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sampleSetWithTag:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", a3);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "attributes", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "isEqualToSet:", v13))
        {

LABEL_13:
          v16 = v12;
          goto LABEL_14;
        }
        objc_msgSend(v12, "attributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "isSubsetOfSet:", v14);

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_14:

  return v16;
}

- (id)_sampleSetsWithTag:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tagsToSampleSets, "objectForKeyedSubscript:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_tagsToSampleSets, CFSTR("tagsToSampleSets"));
}

- (MXMSampleData)initWithCoder:(id)a3
{
  id v4;
  MXMSampleData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *tagsToSampleSets;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MXMSampleData;
  v5 = -[MXMSampleData init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("tagsToSampleSets"));
    v11 = objc_claimAutoreleasedReturnValue();
    tagsToSampleSets = v5->_tagsToSampleSets;
    v5->_tagsToSampleSets = (NSMutableDictionary *)v11;

  }
  return v5;
}

- (id)copy
{
  return -[MXMSampleData copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MXMSampleData *v4;
  void *v5;
  void *v6;
  MXMSampleData *v7;

  v4 = [MXMSampleData alloc];
  -[NSMutableDictionary allValues](self->_tagsToSampleSets, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flattenArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXMSampleData initWithSets:](v4, "initWithSets:", v6);

  return v7;
}

- (id)mutableCopy
{
  return -[MXMSampleData mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MXMMutableSampleData *v4;
  void *v5;
  void *v6;
  MXMMutableSampleData *v7;

  v4 = [MXMMutableSampleData alloc];
  -[NSMutableDictionary allValues](self->_tagsToSampleSets, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flattenArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXMSampleData initWithSets:](v4, "initWithSets:", v6);

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v9;
  NSArray *v10;
  NSArray *enumSet;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id *v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[MXMSampleData enumSet](self, "enumSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v24 = a4;
    v25 = a5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    enumSet = self->_enumSet;
    self->_enumSet = v10;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[MXMSampleData tags](self, "tags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v27;
            do
            {
              v22 = 0;
              do
              {
                if (*(_QWORD *)v27 != v21)
                  objc_enumerationMutation(v18);
                -[NSArray addObject:](self->_enumSet, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22++));
              }
              while (v20 != v22);
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v20);
          }

          ++v16;
        }
        while (v16 != v14);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v14);
    }

    a4 = v24;
    a5 = v25;
  }
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_enumSet, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)_appendAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_tagsToSampleSets, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flattenArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "appendAttribute:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_appendSet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSMutableDictionary *tagsToSampleSets;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = (id)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  tagsToSampleSets = self->_tagsToSampleSets;
  objc_msgSend(v4, "tag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](tagsToSampleSets, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v27 = v6;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = self->_tagsToSampleSets;
    objc_msgSend(v4, "tag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "attributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "attributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToSet:", v19);

          if (v20)
          {
            objc_msgSend(v17, "appendSet:", v4);

            v6 = v27;
            goto LABEL_17;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v14)
          continue;
        break;
      }
    }

    v21 = self->_tagsToSampleSets;
    objc_msgSend(v4, "tag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v27;
    objc_msgSend(v23, "addObject:", v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = self->_tagsToSampleSets;
    objc_msgSend(v4, "tag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, v26);

  }
  -[MXMSampleData setEnumSet:](self, "setEnumSet:", 0);
LABEL_17:

}

- (void)_appendData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*((id *)a3 + 2), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                -[MXMSampleData _appendSet:](self, "_appendSet:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

  }
}

- (id)_dataMatchingFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MXMSampleData samples](self, "samples", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v4, "matchesSample:", v11))
          v12 = (id)objc_msgSend(v5, "appendSample:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)enumSet
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEnumSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)tagsToSampleSets
{
  return self->_tagsToSampleSets;
}

- (void)setTagsToSampleSets:(id)a3
{
  objc_storeStrong((id *)&self->_tagsToSampleSets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagsToSampleSets, 0);
  objc_storeStrong((id *)&self->_enumSet, 0);
}

@end
