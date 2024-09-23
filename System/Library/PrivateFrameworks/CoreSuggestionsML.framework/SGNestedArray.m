@implementation SGNestedArray

+ (void)traversalWithNestedArray:(id)a3 depthCallback:(id)a4 itemCallback:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void (**v31)(_QWORD);
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void (**v39)(_QWORD);
  id v40;
  void *v41;
  uint64_t v42;
  _BOOL4 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v36 = v7;
  objc_msgSend(v10, "addObject:", v7);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", -1);
  objc_msgSend(v11, "addObject:", v13);

  if (objc_msgSend(v10, "count"))
  {
    v14 = -1;
    v38 = v9;
    v39 = v8;
    v37 = v12;
    do
    {
      objc_msgSend(v10, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      objc_msgSend(v10, "removeLastObject");
      objc_msgSend(v11, "removeLastObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v15;
        v19 = objc_msgSend(v18, "count");
        v43 = v19 != 0;
        if (v19)
        {
          v41 = v15;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v40 = v18;
          objc_msgSend(v18, "reverseObjectEnumerator");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v45 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
                v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", v17 + 1);
                objc_msgSend(v11, "addObject:", v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
            }
            while (v22);
          }

          v9 = v38;
          v8 = v39;
          v12 = v37;
          v15 = v41;
          v18 = v40;
        }

      }
      else
      {
        v43 = 0;
      }
      if (v17 > v14)
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", -1);
        objc_msgSend(v12, "addObject:", v26);

        v14 = v17;
        if (v8)
        {
          v8[2](v8);
          v14 = v17;
        }
      }
      if ((v17 & 0x8000000000000000) == 0)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v17;
        v28 = v12;
        v29 = v14;
        v30 = v9;
        v31 = v8;
        v32 = v15;
        v33 = objc_msgSend(v27, "unsignedIntegerValue");

        v34 = v33 + 1;
        v15 = v32;
        v8 = v31;
        v9 = v30;
        v14 = v29;
        v12 = v28;
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v34);
        objc_msgSend(v28, "setObject:atIndexedSubscript:", v35, v42);

        (*((void (**)(id, void *, void *, uint64_t, uint64_t, _BOOL4))v9 + 2))(v9, v15, v28, v42, v14, v43);
      }

    }
    while (objc_msgSend(v10, "count"));
  }

}

@end
