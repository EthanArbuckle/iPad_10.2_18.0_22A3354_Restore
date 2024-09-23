@implementation INParameter(CardKit)

- (uint64_t)isSubParameterOf:()CardKit
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(a1, "parameterClass");
  if (v5 == objc_msgSend(v4, "parameterClass"))
  {
    objc_msgSend(v4, "parameterKeyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    objc_msgSend(a1, "parameterKeyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterKeyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hasPrefix:", v10);

    objc_msgSend(v4, "_indexesForSubKeyPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_indexesForSubKeyPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v12, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v16 = v15;
      v25 = v11;
      v26 = v8;
      v17 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if (!v22)
          {
            v23 = 0;
            goto LABEL_13;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v16)
          continue;
        break;
      }
      v23 = 1;
LABEL_13:
      v8 = v26;
      v11 = v25;
    }
    else
    {
      v23 = 1;
    }

    if (v8)
      v6 = v11 & v23;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
