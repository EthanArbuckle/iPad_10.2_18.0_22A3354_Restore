@implementation INUICKPInterfaceSectionConverter

+ (id)generateInterfaceSectionsFromCard:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  INUICKPCardInterfaceSection *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "cardSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(a1, "_interactionMatchingCardSection:inCard:", v10, v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "parametersForInteraction:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }
        v13 = -[INUICKPCardInterfaceSection initWithInteractiveBehavior:parameters:]([INUICKPCardInterfaceSection alloc], "initWithInteractiveBehavior:parameters:", objc_msgSend(a1, "_intrinsicInteractiveBehaviorForCardSection:", v10), v12);
        -[INUICKPCardInterfaceSection setCardSection:](v13, "setCardSection:", v10);
        objc_msgSend(v5, "addObject:", v13);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

+ (id)_interactionMatchingCardSection:(id)a3 inCard:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "interactions", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unint64_t)_intrinsicInteractiveBehaviorForCardSection:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "inuickp_interactiveBehaviorPrecedenceOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "count");
  v5 = objc_msgSend(v3, "inuickp_intrinsicInteractiveBehavior");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v7 = objc_msgSend(v4, "indexOfObject:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = v3;
    objc_msgSend(v3, "actionCommands");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = v20 - v7;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = objc_msgSend(v14, "inuickp_intrinsicInteractiveBehavior");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v20 - objc_msgSend(v21, "indexOfObject:", v16);

            if (v17 > v11)
            {
              v11 = v17;
              v5 = v15;
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    v3 = v19;
  }

  return v5;
}

@end
