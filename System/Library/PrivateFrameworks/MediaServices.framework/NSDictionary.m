@implementation NSDictionary

void __44__NSDictionary_MSVSequence__msv_firstWhere___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    *a4 = 1;
    +[MSVPair pairWithFirst:second:](MSVPair, "pairWithFirst:second:", v11, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)_msv_enumerateKeysAndObjectsWithSortedKeys:(void *)a3 usingBlock:
{
  id v5;
  void (**v6)(id, uint64_t, void *, unsigned __int8 *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unsigned __int8 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v18 = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(a1, "objectForKey:", v12, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v12, v13, &v18);
        LODWORD(v12) = v18;

        if ((_DWORD)v12)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __52__NSDictionary_MSVAdditions__msv_compactDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (_NSIsNSString())
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : \"%@\"), v11, v5);
LABEL_6:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);
    goto LABEL_7;
  }
  v7 = _NSIsNSArray();
  v6 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : %@"), v11, v5);
    goto LABEL_6;
  }
  objc_msgSend(v5, "msv_compactDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ : [%@]"), v11, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

LABEL_7:
}

void __53__NSDictionary_MSVSequence__msv_reduceIntoObject_by___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __53__NSDictionary_MSVSequence__msv_reduceIntoUInt64_by___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__NSDictionary_MSVSequence__msv_reduceIntoUInt32_by___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __51__NSDictionary_MSVSequence__msv_reduceIntoUInt_by___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__NSDictionary_MSVSequence__msv_reduceIntoInt64_by___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__NSDictionary_MSVSequence__msv_reduceIntoInt32_by___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __50__NSDictionary_MSVSequence__msv_reduceIntoInt_by___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __53__NSDictionary_MSVSequence__msv_reduceIntoDouble_by___block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(double (**)(double))(*(_QWORD *)(a1 + 32)
                                                                                                 + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __54__NSDictionary_MSVSequence__msv_reduceIntoCGFloat_by___block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(double (**)(double))(*(_QWORD *)(a1 + 32)
                                                                                                 + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __52__NSDictionary_MSVSequence__msv_reduceIntoFloat_by___block_invoke(uint64_t a1)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(float (**)(float))(*(_QWORD *)(a1 + 32)
                                                                                              + 16))(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __51__NSDictionary_MSVSequence__msv_reduceIntoBool_by___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __41__NSDictionary_MSVSequence__msv_flatMap___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v2);

}

void __40__NSDictionary_MSVSequence__msv_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v3);

}

void __50__NSDictionary_MSVSequence__msv_compactMapValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

void __57__NSDictionary_MSVSequence__msv_compactMapKeysAndValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const void *v7;
  const void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = v7;
  if (v6 != v9)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:");
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);
    CFRelease(v6);
  }
  if (v8)
    CFRelease(v8);

}

void __44__NSDictionary_MSVSequence__msv_compactMap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

void __43__NSDictionary_MSVSequence__msv_mapValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, v7);

}

void __50__NSDictionary_MSVSequence__msv_mapKeysAndValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const void *v7;
  const void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = v7;
  if (v6 != v9)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);
  CFRelease(v6);
  CFRelease(v8);

}

void __37__NSDictionary_MSVSequence__msv_map___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

@end
