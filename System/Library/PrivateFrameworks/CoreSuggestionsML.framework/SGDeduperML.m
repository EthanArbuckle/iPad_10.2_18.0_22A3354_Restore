@implementation SGDeduperML

+ (id)dedupe:(id)a3 bucketer:(id)a4 resolver:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  CFMutableSetRef Mutable;
  __CFSet *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  const void *v26;
  id v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  Mutable = CFSetCreateMutable(0, 16, 0);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v11 = Mutable;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = v8;
  v30 = v7;
  (*((void (**)(id, id))v8 + 2))(v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v16, "count") < 2)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          CFSetAddValue(v11, v17);
        }
        else
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v9[2](v9, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v36 != v19)
                  objc_enumerationMutation(v17);
                CFSetAddValue(v11, *(const void **)(*((_QWORD *)&v35 + 1) + 8 * j));
              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            }
            while (v18);
          }
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v13);
  }

  v21 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v30;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v22);
        v26 = *(const void **)(*((_QWORD *)&v31 + 1) + 8 * k);
        if (CFSetContainsValue(v11, v26))
        {
          objc_msgSend(v21, "addObject:", v26);
          CFSetRemoveValue(v11, v26);
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v23);
  }

  CFRelease(v11);
  return v21;
}

+ (id)bucketerWithMapping:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SGDeduperML_bucketerWithMapping___block_invoke;
  v7[3] = &unk_24DDC4FA8;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22075400C](v7);

  return v5;
}

+ (id)bucketerWithLabeledBuckets:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SGDeduperML_bucketerWithLabeledBuckets___block_invoke;
  v7[3] = &unk_24DDC4FD0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22075400C](v7);

  return v5;
}

+ (id)bucketerWithEqualityTest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__SGDeduperML_bucketerWithEqualityTest___block_invoke;
  v7[3] = &unk_24DDC4FF8;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22075400C](v7);

  return v5;
}

+ (id)resolveByPairs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SGDeduperML_resolveByPairs___block_invoke;
  v7[3] = &unk_24DDC5020;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22075400C](v7);

  return v5;
}

+ (id)resolveByScoreBreakTiesArbitrarily:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SGDeduperML_resolveByScoreBreakTiesArbitrarily___block_invoke;
  v7[3] = &unk_24DDC5020;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22075400C](v7);

  return v5;
}

id __50__SGDeduperML_resolveByScoreBreakTiesArbitrarily___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  signed int v8;
  uint64_t i;
  void *v10;
  signed int v11;
  signed int v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (!v4)
    goto LABEL_12;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
  v8 = 0x80000000;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (v11 > v8)
      {
        v12 = v11;
        v13 = v10;

        v8 = v12;
        v6 = v13;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  }
  while (v5);
  if (v6)
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v14;
}

id __30__SGDeduperML_resolveByPairs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v3);
      if (v6)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      else
      {
        v6 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  }
  while (v5);
  if (v6)
  {
    v16 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_13:
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

id __40__SGDeduperML_bucketerWithEqualityTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = (id)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v6 = v18;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              v12 = *(_QWORD *)(a1 + 32);
              objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v5, v13);

              if ((_DWORD)v12)
              {
                objc_msgSend(v11, "addObject:", v5);
                goto LABEL_16;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v8)
              continue;
            break;
          }
        }

        v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v5, 0);
        objc_msgSend(v6, "addObject:", v14);
        v6 = (id)v14;
LABEL_16:

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  return v18;
}

id __42__SGDeduperML_bucketerWithLabeledBuckets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

id __35__SGDeduperML_bucketerWithMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x220753E80](v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);
        }
        objc_msgSend(v13, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = v6;
    }
    while (v6);
  }

  v14 = (void *)MEMORY[0x220753E80]();
  objc_msgSend(v4, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v14);

  return v15;
}

@end
