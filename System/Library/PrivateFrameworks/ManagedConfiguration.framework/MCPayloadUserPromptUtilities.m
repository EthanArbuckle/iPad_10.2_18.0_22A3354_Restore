@implementation MCPayloadUserPromptUtilities

+ (id)promptDictionaryForKey:(id)a3 title:(id)a4 description:(id)a5 retypeDescription:(id)a6 finePrint:(id)a7 defaultValue:(id)a8 placeholderValue:(id)a9 minimumLength:(unint64_t)a10 fieldType:(int)a11 flags:(int)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
    objc_msgSend(v24, "setObject:forKey:", v17, CFSTR("UUID"));
  if (objc_msgSend(v18, "length"))
    objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("title"));
  if (objc_msgSend(v19, "length"))
    objc_msgSend(v24, "setObject:forKey:", v19, CFSTR("description"));
  if (objc_msgSend(v20, "length"))
    objc_msgSend(v24, "setObject:forKey:", v20, CFSTR("retryDescription"));
  if (objc_msgSend(v21, "length"))
    objc_msgSend(v24, "setObject:forKey:", v21, CFSTR("finePrint"));
  if (objc_msgSend(v22, "length"))
    objc_msgSend(v24, "setObject:forKey:", v22, CFSTR("defaultValue"));
  if (objc_msgSend(v23, "length"))
    objc_msgSend(v24, "setObject:forKey:", v23, CFSTR("placeholderValue"));
  if (a10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("minimumLength"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v26, CFSTR("fieldType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v27, CFSTR("flags"));

  return v24;
}

+ (id)prioritizeUserInput:(id)a3 key:(id)a4 overField:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    v21 = v9;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
        objc_msgSend(v16, "objectForKey:", CFSTR("UUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v8);

        if ((v18 & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v16, "objectForKey:", CFSTR("response"));
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v21;
      if (v19)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

      v10 = v21;
    }
  }
  v19 = v10;
LABEL_13:

  return v19;
}

@end
