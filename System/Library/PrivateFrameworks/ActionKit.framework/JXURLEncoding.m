@implementation JXURLEncoding

+ (id)encodedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":/?#[]@!$&'()*+,;="));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24F8BBA48;
  }

  return v6;
}

+ (id)formEncodedString:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "encodedString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%20"), CFSTR("+"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24F8BBA48;
  }

  return v6;
}

+ (id)encodedDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v13, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "encodeObject:withKey:andSubKey:intoArray:", v14, v13, 0, v5);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("&"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = &stru_24F8BBA48;
  }

  return v15;
}

+ (id)formEncodedDictionary:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "encodedDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%20"), CFSTR("+"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24F8BBA48;
  }

  return v6;
}

+ (void)encodeObject:(id)a3 withKey:(id)a4 andSubKey:(id)a5 intoArray:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v10;
  v14 = v12;
  v15 = a6;
  if (v10 && objc_msgSend(v11, "length"))
  {
    if (v14)
    {
      v16 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(a1, "encodedString:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodedString:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@[%@]"), v17, v18);

    }
    else
    {
      objc_msgSend(a1, "encodedString:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v14;
      v41 = v11;
      objc_msgSend(v10, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v48 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v13, "objectForKey:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "encodeObject:withKey:andSubKey:intoArray:", v28, v19, v27, v15);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v24);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v10, "stringValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("%@=%@"), v19, v36);
          objc_msgSend(v15, "addObject:", v37);

          v13 = v10;
        }
        else
        {
          objc_msgSend(a1, "encodedString:", v10);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@=%@"), v19, v38);
          objc_msgSend(v15, "addObject:", v39);

          v13 = v10;
        }
        goto LABEL_25;
      }
      v40 = v14;
      v41 = v11;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v10;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v44 != v31)
              objc_enumerationMutation(obj);
            v33 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@[]"), v19);
            objc_msgSend(a1, "encodeObject:withKey:andSubKey:intoArray:", v33, v34, 0, v15);

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v30);
      }

      v13 = v10;
    }
    v14 = v40;
    v11 = v41;
LABEL_25:

  }
}

@end
