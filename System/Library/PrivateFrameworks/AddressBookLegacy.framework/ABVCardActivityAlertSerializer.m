@implementation ABVCardActivityAlertSerializer

+ (id)serializeDictionary:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_76);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(a3, "objectForKey:", v11);
        if (v11)
        {
          v13 = (void *)v12;
          if ((objc_msgSend(v11, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0
            && v13
            && (objc_msgSend(v13, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
          {
            if (objc_msgSend(v5, "length"))
              objc_msgSend(v5, "appendString:", CFSTR("\\,"));
            objc_msgSend(v5, "appendString:", objc_msgSend(a1, "serializeString:", v11));
            objc_msgSend(v5, "appendString:", CFSTR("="));
            objc_msgSend(v5, "appendString:", objc_msgSend(a1, "serializeString:", v13));
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  return v5;
}

+ (id)serializeString:(id)a3
{
  __objc2_class **v4;

  v4 = off_1E3CA0AB8;
  if (+[ABVCardActivityAlertQuotingSerializationStrategy strategyWouldAlterString:](ABVCardActivityAlertQuotingSerializationStrategy, "strategyWouldAlterString:"))
  {
    return (id)-[__objc2_class serializeString:](*v4, "serializeString:", a3);
  }
  v4 = off_1E3CA0AB0;
  if (+[ABVCardActivityAlertEscapingSerializationStrategy strategyWouldAlterString:](ABVCardActivityAlertEscapingSerializationStrategy, "strategyWouldAlterString:", a3))
  {
    return (id)-[__objc2_class serializeString:](*v4, "serializeString:", a3);
  }
  else
  {
    return a3;
  }
}

@end
