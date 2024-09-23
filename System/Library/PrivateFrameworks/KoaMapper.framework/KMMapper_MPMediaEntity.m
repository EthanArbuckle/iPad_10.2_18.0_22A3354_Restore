@implementation KMMapper_MPMediaEntity

- (KMMapper_MPMediaEntity)init
{
  KMMapper_MPMediaEntity *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KMMapper_MPMediaEntity;
  v2 = -[KMMapper_MPMediaEntity init](&v6, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 5;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v7;
  NSMutableArray *v8;
  NSMutableArray *items;
  NSMutableArray *v10;
  NSMutableArray *v11;

  v7 = a3;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  items = self->_items;
  self->_items = v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!-[KMMapper_MPMediaEntity _itemsFromMediaItem:error:](self, "_itemsFromMediaItem:error:", v7, a5))
    {
LABEL_7:
      v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !-[KMMapper_MPMediaEntity _itemsFromMediaPlaylist:error:](self, "_itemsFromMediaPlaylist:error:", v7, a5))
    {
      goto LABEL_7;
    }
  }
  v10 = self->_items;
LABEL_8:
  v11 = v10;

  return v11;
}

- (BOOL)_addItemWithItemId:(id)a3 itemIdType:(int64_t)a4 fields:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  KVItemBuilder *builder;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  KVItemBuilder *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  KVItemBuilder *v30;
  void *v31;
  id *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if ((unint64_t)(a4 - 202) > 0x1E)
    v12 = 0;
  else
    v12 = dword_2188559F4[a4 - 202];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%X-%@"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  builder = self->_builder;
  v43 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 5, v13, &v43);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v43;

  if (v15)
  {
    v33 = a6;
    v34 = v13;
    v35 = v11;
    v36 = v10;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = v11;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v22, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = self->_builder;
            v25 = objc_msgSend(v22, "fieldType");
            objc_msgSend(v22, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v16;
            -[KVItemBuilder addFieldWithType:value:error:](v24, "addFieldWithType:value:error:", v25, v26, &v38);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v38;

            if (!v27)
            {
              KMMapperSetBuilderError((uint64_t)v33, v28);

              LOBYTE(v15) = 0;
              v16 = v28;
              v11 = v35;
              v10 = v36;
              v13 = v34;
              goto LABEL_24;
            }
            v19 = 1;
            v16 = v28;
          }
        }
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v18)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
    v29 = v16;

    v30 = self->_builder;
    v37 = v16;
    -[KVItemBuilder buildItemWithError:](v30, "buildItemWithError:", &v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v37;

    LOBYTE(v15) = v31 != 0;
    if (v31)
    {
      v10 = v36;
      v13 = v34;
      if ((v19 & 1) != 0)
        -[NSMutableArray addObject:](self->_items, "addObject:", v31);
    }
    else
    {
      KMMapperSetBuilderError((uint64_t)v33, v16);
      v10 = v36;
      v13 = v34;
    }

    v11 = v35;
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)a6, v16);
  }
LABEL_24:

  return (char)v15;
}

- (BOOL)_mapMusicItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KMFieldValue *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  KMFieldValue *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  KMFieldValue *v21;
  void *v22;
  void *v23;
  KMFieldValue *v24;
  KMFieldValue *v25;
  void *v26;
  BOOL v27;
  KMFieldValue *v29;
  KMFieldValue *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  KMFieldValue *v36;
  KMFieldValue *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBAF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBAF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 204, v9);
  v38[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v8, 204, v11, a4);

  if (v12)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB18]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 202, v15);
    v37 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v14, 202, v17, a4);

    if (v18)
    {
      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB80]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringValue");
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB78]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 210, v33);
      v36 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v20;
      LODWORD(v20) = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v20, 210, v22, a4);

      if ((_DWORD)v20)
      {
        objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC40]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBCD8]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 228, v32);
        v35[0] = v30;
        v29 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 203, v8);
        v35[1] = v29;
        v24 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 201, v14);
        v35[2] = v24;
        v25 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 209, v34);
        v35[3] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v31, 228, v26, a4);

      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)_mapPodcastItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KMFieldValue *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  KMFieldValue *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  KMFieldValue *v21;
  void *v22;
  void *v23;
  KMFieldValue *v24;
  KMFieldValue *v25;
  void *v26;
  BOOL v27;
  KMFieldValue *v29;
  KMFieldValue *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  KMFieldValue *v36;
  KMFieldValue *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 218, v9);
  v38[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v8, 218, v11, a4);

  if (v12)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBAF0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBAF8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 224, v15);
    v37 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v14, 224, v17, a4);

    if (v18)
    {
      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC60]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringValue");
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC68]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 222, v33);
      v36 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v20;
      LODWORD(v20) = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v20, 222, v22, a4);

      if ((_DWORD)v20)
      {
        objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC40]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBCD8]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 228, v32);
        v35[0] = v30;
        v29 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 217, v8);
        v35[1] = v29;
        v24 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 223, v14);
        v35[2] = v24;
        v25 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 221, v34);
        v35[3] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v31, 220, v26, a4);

      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)_mapAudioBookItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KMFieldValue *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  KMFieldValue *v16;
  KMFieldValue *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 206, v9);
  v22[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v8, 206, v11, a4);

  if (v12)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC40]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBCD8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 208, v15);
    v17 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 205, v8, v16);
    v21[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v14, 208, v18, a4);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_mapTVShowItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KMFieldValue *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  KMFieldValue *v16;
  KMFieldValue *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBAF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBAF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 232, v9);
  v22[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v8, 232, v11, a4);

  if (v12)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC40]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBCD8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 230, v15);
    v17 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 231, v8, v16);
    v21[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v14, 230, v18, a4);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_mapMovieItem:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  KMFieldValue *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDDBC40];
  v7 = a3;
  objc_msgSend(v7, "valueForProperty:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BDDBCD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 212, v10);
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v9, 212, v12, a4);

  return (char)a4;
}

- (BOOL)_mapMusicVideoItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KMFieldValue *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  KMFieldValue *v16;
  KMFieldValue *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBB10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 202, v9);
  v22[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v8, 202, v11, a4);

  if (v12)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC40]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBCD8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 214, v15);
    v17 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 201, v8, v16);
    v21[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v14, 214, v18, a4);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_itemsFromMediaItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __int16 v8;
  BOOL v9;
  BOOL v10;

  v6 = a3;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongValue");

  if ((v8 & 1) != 0)
  {
    v9 = -[KMMapper_MPMediaEntity _mapMusicItem:error:](self, "_mapMusicItem:error:", v6, a4);
  }
  else if ((v8 & 0x402) != 0)
  {
    v9 = -[KMMapper_MPMediaEntity _mapPodcastItem:error:](self, "_mapPodcastItem:error:", v6, a4);
  }
  else if ((v8 & 4) != 0)
  {
    v9 = -[KMMapper_MPMediaEntity _mapAudioBookItem:error:](self, "_mapAudioBookItem:error:", v6, a4);
  }
  else if ((v8 & 0x200) != 0)
  {
    v9 = -[KMMapper_MPMediaEntity _mapTVShowItem:error:](self, "_mapTVShowItem:error:", v6, a4);
  }
  else if ((v8 & 0x100) != 0)
  {
    v9 = -[KMMapper_MPMediaEntity _mapMovieItem:error:](self, "_mapMovieItem:error:", v6, a4);
  }
  else
  {
    if ((v8 & 0x800) == 0)
    {
      v10 = 1;
      goto LABEL_6;
    }
    v9 = -[KMMapper_MPMediaEntity _mapMusicVideoItem:error:](self, "_mapMusicVideoItem:error:", v6, a4);
  }
  v10 = v9;
LABEL_6:

  return v10;
}

- (BOOL)_itemsFromMediaPlaylist:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  KMFieldValue *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDDBD50];
  v7 = a3;
  objc_msgSend(v7, "valueForProperty:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BDDBD40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 216, v10);
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[KMMapper_MPMediaEntity _addItemWithItemId:itemIdType:fields:error:](self, "_addItemWithItemId:itemIdType:fields:error:", v9, 216, v12, a4);

  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
