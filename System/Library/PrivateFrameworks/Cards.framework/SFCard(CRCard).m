@implementation SFCard(CRCard)

+ (id)_interactionsByIntentDataHashes
{
  if (_interactionsByIntentDataHashes_onceToken != -1)
    dispatch_once(&_interactionsByIntentDataHashes_onceToken, &__block_literal_global_0);
  return (id)_interactionsByIntentDataHashes_interactionsByIntentDataHashes;
}

- (BOOL)asynchronous
{
  return objc_msgSend(a1, "type") == 2 || objc_msgSend(a1, "type") == 3;
}

- (void)loadCardWithCompletion:()CRCard
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[CRSFCardLoader sharedLoader](CRSFCardLoader, "sharedLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SFCard_CRCard__loadCardWithCompletion___block_invoke;
  v7[3] = &unk_24DDD9300;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "loadSFCard:completion:", a1, v7);

}

- (id)interactions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "interaction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v1);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)interaction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "intentMessageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_interactionsByIntentDataHashes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_interactionDataKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "intentMessageName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "intentMessageData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentCreate();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "intentResponseMessageName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "intentResponseMessageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentResponseCreate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9DF0]), "initWithIntent:response:", v8, v11);
      if (v5)
        objc_msgSend(v3, "setObject:forKey:", v5, v4);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)cardIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(a1, "cardId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = CRLogContextCards;
    if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR))
      -[SFCard(CRCard) cardIdentifier].cold.1((uint64_t)a1, (uint64_t)v4, v5);
    objc_msgSend(a1, "setCardId:", v4);

  }
  objc_msgSend(a1, "cardId");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)cardFormat
{
  return 1;
}

- (id)resolvedCardSections
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v8, "resolvedCardSections", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v11);
        }

        objc_msgSend(v2, "addObject:", v8);
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v14 = (void *)objc_msgSend(v2, "copy");
  return v14;
}

- (id)underlyingInteraction
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "interactions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_interactionDataKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "intentResponseMessageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "cardId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "intentMessageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v6;
  if (v2)
  {
    objc_msgSend(a1, "intentResponseMessageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%zd%zd"), v4, v7, objc_msgSend(v8, "hash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%zd"), v4, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)interaction
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0(&dword_21AC64000, v6, v4, "Invalid intent payload for intentMessageName: %@. Exception: %@", v5);

}

- (void)cardIdentifier
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0(&dword_21AC64000, a3, (uint64_t)a3, "Card %@ does not have a card identifier. This is a requirement. Category CRCard on SFCard is setting one (%@) on the client's behalf as a workaround", (uint8_t *)&v3);
}

@end
