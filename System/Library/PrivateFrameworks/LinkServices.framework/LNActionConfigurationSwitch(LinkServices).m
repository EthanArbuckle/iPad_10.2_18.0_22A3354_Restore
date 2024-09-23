@implementation LNActionConfigurationSwitch(LinkServices)

- (id)actionConfigurationByEvaluatingAction:()LinkServices context:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  id v34;
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
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = v6;
  objc_msgSend(a1, "valueForAction:context:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a1, "cases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v40;
    v31 = v7;
    v33 = v9;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
      if (objc_msgSend(v15, "isDefaultCase", v31))
      {
        v16 = v12;
        v12 = v15;
      }
      else
      {
        objc_msgSend(v15, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          if (!v8)
          {
            objc_msgSend(v15, "value");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v32)
            {
LABEL_36:
              objc_msgSend(v15, "configuration");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v34;
              v7 = v31;
              objc_msgSend(v18, "actionConfigurationByEvaluatingAction:context:", v34, v31);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

              goto LABEL_39;
            }
          }
          objc_msgSend(v15, "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v8, "isEqual:", v24);

          if (v8)
          {
            if (v25)
              goto LABEL_36;
          }
          else
          {

            if ((v25 & 1) != 0)
              goto LABEL_36;
          }
          goto LABEL_30;
        }
        if (objc_msgSend(v18, "count"))
          v19 = 0;
        else
          v19 = v8 == 0;
        if (v19)
        {
          objc_msgSend(v15, "configuration");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v34;
          v7 = v31;
          objc_msgSend(v29, "actionConfigurationByEvaluatingAction:context:", v34, v31);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_38;
        }
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v16 = v18;
        v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v36 != v22)
                objc_enumerationMutation(v16);
              if ((objc_msgSend(v8, "isEqual:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i)) & 1) != 0)
              {
                objc_msgSend(v15, "configuration");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v34;
                v7 = v31;
                objc_msgSend(v26, "actionConfigurationByEvaluatingAction:context:", v34, v31);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                v9 = v33;
                goto LABEL_39;
              }
            }
            v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v21)
              continue;
            break;
          }
        }

        v9 = v33;
      }

LABEL_30:
      if (++v14 == v11)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        v7 = v31;
        if (v11)
          goto LABEL_3;
        goto LABEL_35;
      }
    }
  }
  v12 = 0;
LABEL_35:

  objc_msgSend(v12, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v34;
  objc_msgSend(v9, "actionConfigurationByEvaluatingAction:context:", v34, v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

  return v28;
}

- (id)valueForAction:()LinkServices context:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "parameterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D43940]) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v7, "widgetFamily");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_5:
    objc_msgSend(v6, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__LNActionConfigurationSwitch_LinkServices__valueForAction_context___block_invoke;
    v17[3] = &unk_1E45DE190;
    v17[4] = a1;
    objc_msgSend(v14, "if_firstObjectPassingTest:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v10 = objc_alloc(MEMORY[0x1E0D43E30]);
  objc_msgSend(v7, "widgetFamily");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43D88], "stringValueType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithValue:valueType:", v11, v12);

LABEL_6:
  return v13;
}

- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices
{
  return objc_msgSend(a1, "actionConfigurationByEvaluatingAction:context:", a3, 0);
}

@end
