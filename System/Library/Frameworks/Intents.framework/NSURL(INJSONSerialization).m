@implementation NSURL(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(a1, "isFileURL") && (v5 = MEMORY[0x18D780DA8](a1)) != 0)
  {
    v6 = (void *)v5;
    objc_msgSend(a1, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("?%@=%@"), CFSTR("scope"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v9);
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isFileURL");

    v13 = (void *)MEMORY[0x1E0C99E98];
    if ((v12 & 1) != 0)
    {
      v28 = v8;
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("?"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLWithString:", v15);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v27 = v10;
      objc_msgSend(v10, "queryItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v21, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("scope"));

            if (v23)
            {
              objc_msgSend(v21, "value");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "decodeObjectOfClass:from:", objc_opt_class(), v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                MEMORY[0x18D780D9C](v29, v25);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v18);
      }

      v8 = v28;
      v10 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {

    v29 = 0;
  }

  return v29;
}

@end
