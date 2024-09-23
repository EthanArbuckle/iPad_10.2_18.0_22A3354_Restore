@implementation NSError(DADAExtendedDescription)

- (id)DAExtendedDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSDetailedErrors"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v2, "stringByAppendingString:", CFSTR("NSDetailedErrors: "));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "DAExtendedDescription", (_QWORD)v20);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              objc_msgSend(v5, "stringByAppendingString:", v11);
              v12 = objc_claimAutoreleasedReturnValue();

              v5 = (void *)v12;
            }

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v8);
      }

    }
    else
    {
      objc_msgSend(a1, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v2, "stringByAppendingString:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v18;
      }

      v5 = v2;
    }

  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v2, "stringByAppendingString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v15;
    }

    v5 = v2;
  }

  return v5;
}

@end
