@implementation SFCardSection(CRCardSection)

- (id)backingCardSection
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_25511A598))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)parametersForInteraction:()CRCardSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentResponse");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v5, "_intentInstanceDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(a1, "backingCardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameterKeyPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v10)
  {

LABEL_23:
    if (objc_msgSend(v31, "_type") == 2)
      v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    else
      v12 = 0;
    goto LABEL_26;
  }
  v11 = v10;
  v27 = v6;
  v28 = v4;
  v12 = 0;
  v13 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      v16 = objc_msgSend(v15, "rangeOfString:", CFSTR("."));
      if (v16 == 0x7FFFFFFFFFFFFFFFLL && v17 == 0)
      {
        v21 = 0;
        v22 = 0;
      }
      else
      {
        v19 = v16;
        v20 = v17;
        objc_msgSend(v15, "substringToIndex:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "substringFromIndex:", v19 + v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((objc_msgSend(v21, "isEqualToString:", v7) & 1) != 0
        || objc_msgSend(v21, "isEqualToString:", v29))
      {
        objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), v22);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v12, "addObject:", v24);

        }
      }

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  }
  while (v11);

  v6 = v27;
  v4 = v28;
  if (!v12)
    goto LABEL_23;
LABEL_26:
  v25 = (void *)objc_msgSend(v12, "copy");

  return v25;
}

- (id)actionCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRNextCardCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CRPunchoutCommand *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(a1, "backingCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "backingCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(CRNextCardCommand);
    objc_msgSend(a1, "backingCardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRNextCardCommand setNextCard:](v8, "setNextCard:", v10);

    objc_msgSend(v5, "addObject:", v8);
  }
  objc_msgSend(a1, "backingCardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "punchoutOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
          v19 = objc_alloc_init(CRPunchoutCommand);
          -[CRPunchoutCommand setPunchout:](v19, "setPunchout:", v18, (_QWORD)v22);
          objc_msgSend(v5, "addObject:", v19);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

  }
  v20 = (void *)objc_msgSend(v5, "copy", (_QWORD)v22);

  return v20;
}

- (BOOL)hasNextCard
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "backingCardSection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nextCard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)cardSectionIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(a1, "cardSectionId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || !objc_msgSend(v2, "length") || objc_msgSend(v3, "isEqualToString:", CFSTR("0")))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = CRLogContextCards;
    if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR))
      -[SFCardSection(CRCardSection) cardSectionIdentifier].cold.1((uint64_t)a1, (uint64_t)v5, v6);
    objc_msgSend(a1, "setCardSectionId:", v5);

  }
  objc_msgSend(a1, "cardSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)resolvedCardSections
{
  return 0;
}

- (void)cardSectionIdentifier
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
  _os_log_error_impl(&dword_21AC64000, log, OS_LOG_TYPE_ERROR, "Card section %@ does not have a card section identifier. This is a requirement. Category CRCardSection on SFCardSection is setting one (%@) on the client's behalf as a workaround", (uint8_t *)&v3, 0x16u);
}

@end
