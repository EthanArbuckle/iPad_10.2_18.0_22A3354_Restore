@implementation LNActionConfigurationWhen(LinkServices)

- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices
{
  return objc_msgSend(a1, "actionConfigurationByEvaluatingAction:context:", a3, 0);
}

- (id)actionConfigurationByEvaluatingAction:()LinkServices context:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  int v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "valueForAction:context:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "condition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "comparisonOperator");

  switch(v10)
  {
    case 0:
      if (v8)
        goto LABEL_51;
      goto LABEL_34;
    case 1:
      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v12))
        goto LABEL_27;
      goto LABEL_24;
    case 2:
      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", v12) & 1) != 0)
        goto LABEL_27;
      goto LABEL_24;
    case 3:
      if (!v8)
        goto LABEL_51;
      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "compare:", v12) == -1)
        goto LABEL_27;
LABEL_24:
      objc_msgSend(a1, "otherwise");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 4:
      if (!v8)
        goto LABEL_51;
      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "compare:", v12) == -1)
        goto LABEL_27;
      goto LABEL_43;
    case 5:
      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "compare:", v12) != 1)
        goto LABEL_24;
      goto LABEL_27;
    case 6:
      if (!v8)
        goto LABEL_34;
      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "compare:", v12) == 1)
      {
LABEL_27:
        objc_msgSend(a1, "when");
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v17 = (void *)v18;
      }
      else
      {
LABEL_43:
        objc_msgSend(a1, "condition");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "value");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "compare:", v29))
          objc_msgSend(a1, "otherwise");
        else
          objc_msgSend(a1, "when");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_61:
      }

LABEL_63:
      objc_msgSend(v17, "actionConfigurationByEvaluatingAction:context:", v6, v7);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      return v39;
    case 7:
      objc_msgSend(a1, "condition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v32 = v22;

      v33 = objc_msgSend(v32, "containsObject:", v8);
      if ((v33 & 1) != 0)
        goto LABEL_51;
      goto LABEL_34;
    case 8:
      if (v8)
      {
LABEL_34:
        objc_msgSend(a1, "otherwise");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_51:
        objc_msgSend(a1, "when");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v23;
      goto LABEL_63;
    case 9:
      objc_msgSend(v8, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
      }
      else
      {
        v25 = 0;
      }
      v34 = v25;

      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "containsString:", v28);

      v36 = a1;
      if (!v35)
        goto LABEL_55;
      goto LABEL_59;
    case 10:
      objc_msgSend(v8, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v27 = v26;
        else
          v27 = 0;
      }
      else
      {
        v27 = 0;
      }
      v30 = v27;

      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "containsString:", v28);
      goto LABEL_58;
    case 11:
      objc_msgSend(v8, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v30 = v14;

      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasPrefix:", v28);
      goto LABEL_58;
    case 12:
      objc_msgSend(v8, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v30 = v16;

      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasSuffix:", v28);
LABEL_58:
      v38 = v31;

      v36 = a1;
      if ((v38 & 1) != 0)
      {
LABEL_55:
        objc_msgSend(v36, "when");
        v37 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_59:
        objc_msgSend(v36, "otherwise");
        v37 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v37;
      goto LABEL_61;
    default:
      v17 = 0;
      goto LABEL_63;
  }
}

- (id)valueForAction:()LinkServices context:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  _QWORD v45[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "condition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameterIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D43940]) & 1) != 0)
  {
    objc_msgSend(v7, "widgetFamily");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0D43E30]);
      objc_msgSend(v7, "widgetFamily");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D43D88], "stringValueType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithValue:valueType:", v12, v13);

      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __66__LNActionConfigurationWhen_LinkServices__valueForAction_context___block_invoke;
  v45[3] = &unk_1E45DE190;
  v45[4] = a1;
  objc_msgSend(v15, "if_firstObjectPassingTest:", v45);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v44 = v6;
    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "condition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "valueType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v18, "isEqual:", v21);

    if ((v22 & 1) != 0)
    {
      v6 = v44;
    }
    else
    {
      objc_msgSend(v16, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(a1, "condition");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "value");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
        }
        else
        {
          v28 = 0;
        }
        v29 = v28;

        objc_msgSend(v29, "memberValueType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = v30;
        }
        else
        {
          objc_msgSend(a1, "condition");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "value");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "valueType");
          v31 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x1E0D43D88], "intValueType");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v31, "isEqual:", v34);

        v36 = objc_alloc(MEMORY[0x1E0D43E30]);
        if (v35)
        {
          v37 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v24, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "instanceIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v39, "integerValue"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D43D88], "intValueType");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v36, "initWithValue:valueType:", v40, v41);

          v14 = (void *)v41;
        }
        else
        {
          objc_msgSend(v24, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "instanceIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D43D88], "stringValueType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v36, "initWithValue:valueType:", v39, v40);
        }
        v6 = v44;

        v14 = (void *)v42;
      }
      else
      {
        v6 = v44;
      }

    }
  }

LABEL_25:
  return v14;
}

@end
