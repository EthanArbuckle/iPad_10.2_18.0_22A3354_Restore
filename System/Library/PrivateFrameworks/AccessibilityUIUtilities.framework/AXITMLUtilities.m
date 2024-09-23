@implementation AXITMLUtilities

+ (id)textByReconcilingClientText:(id)a3 withServerText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), &stru_1E76AC698);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), &stru_1E76AC698);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_msgSend(v5, "length");
  v14 = objc_msgSend(v6, "length");
  if (v13 | v14)
  {
    if (v5 && !v14)
      goto LABEL_8;
    if (!v14 || v13)
    {
      if (objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", v6))
      {
LABEL_8:
        v15 = v5;
LABEL_13:
        v16 = v15;
        goto LABEL_14;
      }
      if (!objc_msgSend(v6, "localizedCaseInsensitiveContainsString:", v5))
      {
        __AXStringForVariables();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    v15 = v6;
    goto LABEL_13;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

+ (unint64_t)listItemElementCountForViewElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_listTemplateForViewElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "list");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v11, "count");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)firstItemTitleForViewElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "_listTemplateForViewElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "list");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getIKListItemLockupElementClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v8)
    _AXAssert();
  getIKListItemLockupElementClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_listTemplateForViewElement:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v3 = (void *)getIKViewElementClass_softClass;
  v26 = getIKViewElementClass_softClass;
  if (!getIKViewElementClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getIKViewElementClass_block_invoke;
    v21 = &unk_1E76AB358;
    v22 = &v23;
    __getIKViewElementClass_block_invoke((uint64_t)&v18);
    v3 = (void *)v24[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "children");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v23 = 0;
          v24 = &v23;
          v25 = 0x2050000000;
          v10 = (void *)getIKListTemplateClass_softClass;
          v26 = getIKListTemplateClass_softClass;
          if (!getIKListTemplateClass_softClass)
          {
            v18 = MEMORY[0x1E0C809B0];
            v19 = 3221225472;
            v20 = __getIKListTemplateClass_block_invoke;
            v21 = &unk_1E76AB358;
            v22 = &v23;
            __getIKListTemplateClass_block_invoke((uint64_t)&v18);
            v10 = (void *)v24[3];
          }
          v11 = objc_retainAutorelease(v10);
          _Block_object_dispose(&v23, 8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v6 = v9;
            goto LABEL_17;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v27, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
