@implementation HMEPendingEventsCollection

- (HMEPendingEventsCollection)initWithEvents:(id)a3
{
  id v4;
  HMEPendingEventsCollection *v5;
  uint64_t v6;
  NSMutableArray *mutableEventItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMEPendingEventsCollection;
  v5 = -[HMEPendingEventsCollection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    mutableEventItems = v5->_mutableEventItems;
    v5->_mutableEventItems = (NSMutableArray *)v6;

  }
  return v5;
}

- (HMEPendingEventsCollection)init
{
  return -[HMEPendingEventsCollection initWithEvents:](self, "initWithEvents:", MEMORY[0x1E0C9AA60]);
}

- (NSArray)eventItems
{
  void *v2;
  void *v3;

  -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)_addEventInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "combineType");

  if (v7 < 2)
  {
LABEL_13:
    -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v4);

    goto LABEL_14;
  }
  if (v7 == 2)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "topic");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "topic");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (v17)
          {
            -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeObject:", v14);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)addEventInfoItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HMEPendingEventsCollection _addEventInfo:](self, "_addEventInfo:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)combinePreviousEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  -[HMEPendingEventsCollection setMutableEventItems:](self, "setMutableEventItems:", v7);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[HMEPendingEventsCollection _addEventInfo:](self, "_addEventInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)resetItems
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMEPendingEventsCollection setMutableEventItems:](self, "setMutableEventItems:", v3);

}

- (BOOL)hasEventItem
{
  void *v2;
  BOOL v3;

  -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)popEventItemsUpWithFragments:(BOOL)a3 toSizeInBytes:(unint64_t)a4 usedBytes:(unint64_t *)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v9);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (v13)
          {
            v13 = 1;
            v17 = v7;
          }
          else
          {
            v18 = -[HMEPendingEventsCollection eventInfoMaxSizeInBytes:](self, "eventInfoMaxSizeInBytes:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i))+ v12;
            v13 = v18 > a4;
            if (v18 <= a4)
              v17 = v23;
            else
              v17 = v7;
            if (v18 <= a4)
              v12 = v18;
          }
          objc_msgSend(v17, "addObject:", v16);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    -[HMEPendingEventsCollection setMutableEventItems:](self, "setMutableEventItems:", v7);
    if (a5)
      *a5 = v12;

    return v23;
  }
  else
  {
    -[HMEPendingEventsCollection mutableEventItems](self, "mutableEventItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v19, "copy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEPendingEventsCollection setMutableEventItems:](self, "setMutableEventItems:", v20);

    return v24;
  }
}

- (unint64_t)eventInfoMaxSizeInBytes:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = +[HMEEventInfo topicAndMetadataMaxSizeInBytes](HMEEventInfo, "topicAndMetadataMaxSizeInBytes") + v5;

  return v6;
}

- (NSMutableArray)mutableEventItems
{
  return self->_mutableEventItems;
}

- (void)setMutableEventItems:(id)a3
{
  objc_storeStrong((id *)&self->_mutableEventItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableEventItems, 0);
}

@end
