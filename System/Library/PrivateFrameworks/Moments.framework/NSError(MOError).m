@implementation NSError(MOError)

+ (id)errorUsingError:()MOError withUnderyingError:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E08];
      if (v8)
      {
        objc_msgSend(v5, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dictionaryWithDictionary:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = (void *)objc_opt_new();
      }

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB3388]);
      objc_msgSend(v5, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v7, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "userInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "userInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ (due '%@')"), v22, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, v15);

          goto LABEL_17;
        }
      }
      else
      {

      }
      objc_msgSend(v7, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
LABEL_18:
        v29 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v5, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v5, "code"), v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      v28 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("due '%@'"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v15);
LABEL_17:

      goto LABEL_18;
    }
    v12 = v5;
  }
  else
  {
    if (!v6)
    {
      v13 = 0;
      goto LABEL_19;
    }
    v12 = v6;
  }
  v13 = v12;
LABEL_19:

  return v13;
}

@end
