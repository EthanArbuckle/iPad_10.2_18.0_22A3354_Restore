@implementation PBCodable(Redactor)

- (uint64_t)redact
{
  return objc_msgSend(a1, "_redact:", a1);
}

- (id)_redact:()Redactor
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(a1, "_isRedactable:", v4) & 1) != 0)
  {
    v29 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "dictionaryRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = (id)objc_msgSend(v4, "mutableCopy");
      else
        v6 = 0;
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v7 = objc_msgSend(&unk_24D786530, "countByEnumeratingWithState:objects:count:", &v42, v48, 16, v29);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(&unk_24D786530);
          v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("<<redacted>>"), v11);
        }
        v8 = objc_msgSend(&unk_24D786530, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v8);
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v13 = objc_msgSend(&unk_24D786548, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      v31 = *(_QWORD *)v39;
      v32 = v6;
      do
      {
        v16 = 0;
        v33 = v14;
        do
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(&unk_24D786548);
          v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v16);
          objc_msgSend(v6, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if (objc_msgSend(a1, "_isRedactable:", v18))
            {
              objc_msgSend(a1, "_redact:", v18);
              v19 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v17);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_38;
              v20 = v18;
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v19 = v20;
              v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v35;
                do
                {
                  for (j = 0; j != v23; ++j)
                  {
                    if (*(_QWORD *)v35 != v24)
                      objc_enumerationMutation(v19);
                    v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
                    if (objc_msgSend(a1, "_isRedactable:", v26))
                    {
                      objc_msgSend(a1, "_redact:", v26);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "addObject:", v27);

                    }
                    else
                    {
                      objc_msgSend(v21, "addObject:", v26);
                    }
                  }
                  v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                }
                while (v23);
              }

              v6 = v32;
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v17);

              v15 = v31;
              v14 = v33;
            }

          }
LABEL_38:

          ++v16;
        }
        while (v16 != v14);
        v14 = objc_msgSend(&unk_24D786548, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v14);
    }
    v4 = v30;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (uint64_t)_isRedactable:()Redactor
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 1;
  else
    v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

@end
