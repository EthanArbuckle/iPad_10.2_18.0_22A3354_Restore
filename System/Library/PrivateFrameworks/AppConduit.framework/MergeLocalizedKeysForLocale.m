@implementation MergeLocalizedKeysForLocale

void ___MergeLocalizedKeysForLocale_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
  {
    objc_opt_class();
    v9 = v6;
    v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v7);

      }
      else
      {
        v16 = *(_QWORD *)(a1 + 40);
        v17[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, v7);

      }
    }
  }

}

@end
