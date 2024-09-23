@implementation NSObject(IntentsUICardKitProvider)

+ (id)inuickp_interactiveBehaviorPrecedenceOrder
{
  if (inuickp_interactiveBehaviorPrecedenceOrder_onceToken != -1)
    dispatch_once(&inuickp_interactiveBehaviorPrecedenceOrder_onceToken, &__block_literal_global);
  return (id)inuickp_interactiveBehaviorPrecedenceOrder_interactiveBehaviorPrecedenceOrder;
}

- (uint64_t)inuickp_intrinsicInteractiveBehavior
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a1, "conformsToProtocol:", &unk_255785810))
    return 0;
  objc_msgSend((id)objc_opt_class(), "inuickp_interactiveBehaviorPrecedenceOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v2, "count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v2;
  v4 = objc_msgSend(v2, "indexOfObject:", v3);

  v5 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(a1, "actionCommands");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = v17 - v4;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_msgSend(v12, "inuickp_intrinsicInteractiveBehavior");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v17 - objc_msgSend(v18, "indexOfObject:", v14);

            if (v15 > v9)
            {
              v5 = v13;
              v9 = v15;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

@end
