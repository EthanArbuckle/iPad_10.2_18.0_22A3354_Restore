@implementation NNMKBatchedRequest

- (NNMKBatchedRequest)init
{
  NNMKBatchedRequest *v2;
  uint64_t v3;
  NSMutableDictionary *messagesToBeSentInBatch;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NNMKBatchedRequest;
  v2 = -[NNMKBatchedRequest init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    messagesToBeSentInBatch = v2->_messagesToBeSentInBatch;
    v2->_messagesToBeSentInBatch = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)diffFromMessages:(id)a3 maxMessagesToAdd:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NNMKDiffMessageResult *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NNMKDiffMessageResult *v47;
  unint64_t v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NNMKBatchedRequest latestFetchRequest](self, "latestFetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMessageIdsAndStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decompressedData");
  v9 = objc_claimAutoreleasedReturnValue();

  v50 = (void *)v9;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
  v11 = (void *)v10;
  v12 = &stru_24F9F9D80;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v48 = a4;
  v49 = v13;
  if (-[__CFString length](v13, "length"))
    -[__CFString componentsSeparatedByString:](v13, "componentsSeparatedByString:", CFSTR("\n"));
  else
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (objc_msgSend(v22, "length"))
        {
          objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("|"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "integerValue");

          objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v28, "status") != v25)
              objc_msgSend(v51, "addObject:", v26);
            objc_msgSend(v53, "removeObject:", v26);

          }
          else
          {
            objc_msgSend(v52, "addObject:", v26);
          }

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v19);
  }

  v29 = objc_alloc_init(NNMKDiffMessageResult);
  v30 = v53;
  -[NNMKDiffMessageResult setMessageIdsToAddToWatch:](v29, "setMessageIdsToAddToWatch:", v53);
  -[NNMKDiffMessageResult setMessageIdsToUpdateOnWatch:](v29, "setMessageIdsToUpdateOnWatch:", v51);
  -[NNMKDiffMessageResult setMessageIdsToDeleteFromWatch:](v29, "setMessageIdsToDeleteFromWatch:", v52);
  -[NNMKDiffMessageResult messageIdsToAddToWatch](v29, "messageIdsToAddToWatch");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32 > v48)
  {
    v47 = v29;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v34 = v53;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v55 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
            objc_msgSend(v33, "insertObject:atIndex:", v39, objc_msgSend(v33, "indexOfObject:inSortedRange:options:usingComparator:", v39, 0, objc_msgSend(v33, "count"), 1024, &__block_literal_global_4));

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v36);
    }

    objc_msgSend(v33, "subarrayWithRange:", 0, v48);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v47;
    -[NNMKDiffMessageResult setMessageToAddToWatch:](v47, "setMessageToAddToWatch:", v40);

    -[NNMKDiffMessageResult messageToAddToWatch](v47, "messageToAddToWatch");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "nnmk_map:", &__block_literal_global_12);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKDiffMessageResult setMessageIdsToAddToWatch:](v47, "setMessageIdsToAddToWatch:", v43);

    -[NNMKDiffMessageResult messageIdsToUpdateOnWatch](v47, "messageIdsToUpdateOnWatch");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "removeAllObjects");

    -[NNMKDiffMessageResult messageIdsToDeleteFromWatch](v47, "messageIdsToDeleteFromWatch");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "removeAllObjects");

    -[NNMKDiffMessageResult setTrimed:](v47, "setTrimed:", 1);
    v30 = v53;
  }

  return v29;
}

uint64_t __56__NNMKBatchedRequest_diffFromMessages_maxMessagesToAdd___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "dateReceived");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __56__NNMKBatchedRequest_diffFromMessages_maxMessagesToAdd___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "messageId");
}

- (NSMutableDictionary)messagesToBeSentInBatch
{
  return self->_messagesToBeSentInBatch;
}

- (void)setMessagesToBeSentInBatch:(id)a3
{
  objc_storeStrong((id *)&self->_messagesToBeSentInBatch, a3);
}

- (NNMKProtoFetchRequest)latestFetchRequest
{
  return self->_latestFetchRequest;
}

- (void)setLatestFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_latestFetchRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestFetchRequest, 0);
  objc_storeStrong((id *)&self->_messagesToBeSentInBatch, 0);
}

@end
