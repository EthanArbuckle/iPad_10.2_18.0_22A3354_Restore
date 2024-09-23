@implementation MLDataConversionUtils

+ (id)stridesForShape:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = 1;
  v7 = -1;
  while (v5 < objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:atIndexedSubscript:", v8, v7 + objc_msgSend(v3, "count"));

    objc_msgSend(v3, "objectAtIndexedSubscript:", v7 + objc_msgSend(v3, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v6 * objc_msgSend(v9, "integerValue");

    ++v5;
    --v7;
  }

  return v4;
}

+ (BOOL)populateEspressoShapeAndStridesFromInputShape:(id)a3 ndRepresentation:(BOOL)a4 espressoShape:(id *)a5 espressoStrides:(id *)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[7];

  v10 = a4;
  v35[5] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = v12;
  if (v10)
  {
    switch(objc_msgSend(v12, "count"))
    {
      case 1:
        v35[0] = &unk_1E3DA2470;
        v35[1] = &unk_1E3DA2470;
        v35[2] = &unk_1E3DA2470;
        v35[3] = &unk_1E3DA2470;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35[4] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 2:
        v34[0] = &unk_1E3DA2470;
        v34[1] = &unk_1E3DA2470;
        v34[2] = &unk_1E3DA2470;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34[3] = v14;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34[4] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 3:
        v33[0] = &unk_1E3DA2470;
        v33[1] = &unk_1E3DA2470;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v14;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33[3] = v16;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33[4] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 4:
        v32[0] = &unk_1E3DA2470;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v14;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v16;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v18;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32[4] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 5:
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v14;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v16;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v18;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[3] = v20;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[4] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        goto LABEL_21;
      default:
        if (a7)
          goto LABEL_14;
        goto LABEL_32;
    }
  }
  switch(objc_msgSend(v12, "count"))
  {
    case 1:
      v30[0] = &unk_1E3DA2470;
      v30[1] = &unk_1E3DA2470;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v14;
      v30[3] = &unk_1E3DA2470;
      v30[4] = &unk_1E3DA2470;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 2:
      v29[0] = &unk_1E3DA2470;
      v29[1] = &unk_1E3DA2470;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v14;
      v29[3] = &unk_1E3DA2470;
      v29[4] = &unk_1E3DA2470;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v17 = (void *)v15;
      goto LABEL_23;
    case 3:
      v28[0] = &unk_1E3DA2470;
      v28[1] = &unk_1E3DA2470;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v14;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v16;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[4] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 4:
      v27[0] = &unk_1E3DA2470;
      v27[1] = &unk_1E3DA2470;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v14;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v16;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[4] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 5:
      v26[0] = &unk_1E3DA2470;
      v26[1] = &unk_1E3DA2470;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v14;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v16;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[4] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v17 = (void *)v19;
LABEL_21:

LABEL_22:
LABEL_23:

      objc_msgSend(a1, "stridesForShape:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
        v24 = a6 == 0;
      else
        v24 = 1;
      LOBYTE(a7) = !v24;
      if (!v24)
      {
        *a5 = objc_retainAutorelease(v17);
        *a6 = objc_retainAutorelease(v23);
      }

      break;
    default:
      if (a7)
      {
LABEL_14:
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Data provided has unsupported shape (%@)"), v22);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a7) = 0;
      }
      break;
  }
LABEL_32:

  return (char)a7;
}

+ (BOOL)populateShapeAndStrideFor:(id)a3 inputShape:(id)a4 outputShape:(id *)a5 outputStrides:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v36;
  BOOL v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  id *v57;
  id *v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[8];
  _QWORD v63[2];
  void *v64;
  _QWORD v65[3];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (v11)
  {
    objc_msgSend(v11, "multiArrayConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shapeConstraint");
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v61 = (void *)v14;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = a6;
  v58 = a5;
  v69[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "unsignedLongValue") != 1)
    goto LABEL_7;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "unsignedLongValue") == 1)
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedLongValue") == 1;

  if (!v25)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v22;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_8:
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "unsignedLongValue") != 1)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "unsignedLongValue") == 1)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedLongValue") == 1;

      if (!v21)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v22;
        objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      goto LABEL_16;
    }

  }
LABEL_16:
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v22;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v26;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v27;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
    v30 = v11 != 0;
  else
    v30 = 0;
  if (v30 && objc_msgSend(v61, "type") != 1)
  {
    if (objc_msgSend(v61, "isAllowedShape:error:", v60, a7))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "unsignedLongValue") == 1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "unsignedLongValue") == 1;

        v38 = v60;
        if (v37)
          goto LABEL_30;
      }
      else
      {

      }
    }
    v39 = objc_msgSend(v61, "isAllowedShape:error:", v29, a7);
    v38 = v29;
    if ((v39 & 1) == 0)
    {
      if (v59 && objc_msgSend(v61, "isAllowedShape:error:", v59, a7))
      {
        v32 = v59;
      }
      else
      {
        objc_msgSend(v61, "findAvailableShape:", v29);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19C486000, v56, OS_LOG_TYPE_INFO, "WARNING: The computed output shape does not match any output shape allowed in the model's description. Please update the model description.", buf, 2u);
          }

          goto LABEL_22;
        }
      }
LABEL_36:
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "unsignedLongValue");
      if (v41 == 1
        && (objc_msgSend(v12, "objectAtIndexedSubscript:", 1),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            (unint64_t)objc_msgSend(v26, "unsignedLongValue") >= 2))
      {

      }
      else
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v42, "unsignedLongValue") < 2)
        {

          if (v41 != 1)
            goto LABEL_50;
          goto LABEL_49;
        }
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "unsignedLongValue");

        if (v41 == 1)
        {

          if (v44 != 1)
          {
LABEL_51:
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v50, "unsignedLongValue") >= 2)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (unint64_t)objc_msgSend(v51, "unsignedLongValue") > 1;

              if (!v52)
              {
LABEL_55:
                +[MLDataConversionUtils stridesForShape:](MLDataConversionUtils, "stridesForShape:", v32);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_23;
              }
              objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v63[0] = v50;
              objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v63[1] = v53;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "arrayByAddingObjectsFromArray:", v32);
              v55 = objc_claimAutoreleasedReturnValue();

              v32 = (id)v55;
            }

            goto LABEL_55;
          }
        }
        else
        {

          if (v44 != 1)
            goto LABEL_51;
        }
      }
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "unsignedLongValue");
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "unsignedLongValue");
      if (v46 <= v48)
        v46 = v48;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v46);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v32);
      v49 = objc_claimAutoreleasedReturnValue();

      v32 = (id)v49;
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
LABEL_30:
    v32 = v38;
    if (!v32)
    {
      v31 = 0;
      goto LABEL_23;
    }
    goto LABEL_36;
  }
LABEL_22:
  v31 = 0;
  v32 = 0;
LABEL_23:
  v33 = objc_retainAutorelease(v32);
  *v58 = v33;
  v34 = objc_retainAutorelease(v31);
  *v57 = v34;

  return 1;
}

+ (id)espressoDataProviderFromFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  _MLDataSource *v11;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = -[_MLDataSource initWithMLFeatureProvider:forPrediction:neuralNetworkEngine:error:]([_MLDataSource alloc], "initWithMLFeatureProvider:forPrediction:neuralNetworkEngine:error:", v9, v8, v10, a6);

  return v11;
}

+ (id)espressoDataProviderFromBatchProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  _MLBatchDataSource *v11;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = -[_MLBatchDataSource initWithMLBatchProvider:forPrediction:neuralNetworkEngine:error:]([_MLBatchDataSource alloc], "initWithMLBatchProvider:forPrediction:neuralNetworkEngine:error:", v9, v8, v10, a6);

  return v11;
}

+ (id)featureProviderFromEspressoDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v6;
  void *v7;

  +[MLDataConversionUtils batchProviderFromEspressoDataProvider:neuralNetworkEngine:options:error:](MLDataConversionUtils, "batchProviderFromEspressoDataProvider:neuralNetworkEngine:options:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featuresAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)batchProviderFromEspressoDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  char v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  MLMultiArray *v27;
  uint64_t v28;
  MLMultiArray *v29;
  BOOL v30;
  void *v31;
  int v32;
  MLDictionaryFeatureProvider *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  MLDictionaryFeatureProvider *v41;
  MLDictionaryFeatureProvider *v42;
  MLArrayBatchProvider *v43;
  id v44;
  MLMultiArray *v45;
  void *v47;
  unint64_t v49;
  id v50;
  id v51;
  MLDictionaryFeatureProvider *v52;
  id obj;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  MLMultiArray *v59;
  void *v60;
  MLMultiArray *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v8 = a4;
  v50 = a5;
  v60 = v8;
  objc_msgSend(v8, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputDescriptionsByName");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v51, "numberOfDataPoints"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v10 = 0;
  while (1)
  {
    if (v49 >= objc_msgSend(v51, "numberOfDataPoints"))
    {
      v43 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v47);
      goto LABEL_70;
    }
    v82 = v10;
    objc_msgSend(v51, "dataPointAtIndex:error:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v82;

    if (!v54)
      break;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(v54, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    if (v13)
    {
      v56 = *(_QWORD *)v79;
      while (2)
      {
        v55 = v13;
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v79 != v56)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v57, "objectForKeyedSubscript:", v15);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "classScoreVectorName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v15);

          if (v64)
            v18 = 1;
          else
            v18 = v17;
          if ((v18 & 1) != 0)
          {
            if ((v17 & 1) == 0 && objc_msgSend(v64, "type") != 5)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Output is not in the expected format"));
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_65;
            }
            objc_msgSend(v54, "objectForKeyedSubscript:", v15);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v17 & 1) != 0)
            {
              v19 = 65568;
            }
            else
            {
              objc_msgSend(v64, "multiArrayConstraint");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v20, "dataType");

            }
            objc_msgSend(v62, "shape");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = 0;
            v77 = 0;
            v75 = v11;
            v22 = +[MLDataConversionUtils populateShapeAndStrideFor:inputShape:outputShape:outputStrides:error:](MLDataConversionUtils, "populateShapeAndStrideFor:inputShape:outputShape:outputStrides:error:", v64, v21, &v77, &v76, &v75);
            v23 = v77;
            v63 = v76;
            v24 = v75;

            if (!v22)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v24, CFSTR("Output is not in the expected format"));
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }

LABEL_64:
              v11 = v24;
LABEL_65:

              goto LABEL_66;
            }
            if (!v23)
            {
              objc_msgSend(v62, "shape");
              v25 = objc_claimAutoreleasedReturnValue();
              +[MLDataConversionUtils stridesForShape:](MLDataConversionUtils, "stridesForShape:", v25);
              v26 = objc_claimAutoreleasedReturnValue();

              v63 = (id)v26;
              v23 = (id)v25;
            }
            v27 = [MLMultiArray alloc];
            v28 = objc_msgSend(v62, "dataPointer");
            v74 = v24;
            v61 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v27, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v28, v23, 65568, v63, 0, &v74);
            v58 = v23;
            v11 = v74;

            if (!v61)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v11, CFSTR("Failed to extract output tensor"));
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_65;
            }
            v29 = [MLMultiArray alloc];
            v73 = v11;
            v59 = -[MLMultiArray initWithShape:dataType:error:](v29, "initWithShape:dataType:error:", v23, v19, &v73);
            v24 = v73;

            if (!v59)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v24, CFSTR("Failed to extract output tensor"));
                v44 = (id)objc_claimAutoreleasedReturnValue();
                v45 = 0;
                *a6 = v44;
              }
              else
              {
                v45 = 0;
              }
              goto LABEL_63;
            }
            v72 = v24;
            v30 = -[MLMultiArray copyIntoMultiArray:error:](v61, "copyIntoMultiArray:error:", v59, &v72);
            v11 = v72;

            if (!v30)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v11, CFSTR("Failed to extract output tensor"));
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_61:
              v24 = v11;
LABEL_62:
              v45 = v59;
LABEL_63:

              goto LABEL_64;
            }
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v59, v15);
            objc_msgSend(v60, "classScoreVectorName");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isEqualToString:", v15);

            if (v32)
            {
              v33 = [MLDictionaryFeatureProvider alloc];
              v71 = v11;
              v52 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v33, "initWithDictionary:error:", v12, &v71);
              v24 = v71;

              if (!v52)
              {
                if (a6)
                {
                  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v24, CFSTR("Failed to extract output tensor"));
                  *a6 = (id)objc_claimAutoreleasedReturnValue();
                }
                goto LABEL_62;
              }
              v70 = v24;
              objc_msgSend(v60, "addClassifierInformationToOutput:options:error:", v52, v50, &v70);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v70;

              if (!v34)
              {
                if (a6)
                {
                  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v11, CFSTR("Failed to extract output tensor"));
                  *a6 = (id)objc_claimAutoreleasedReturnValue();
                }

                goto LABEL_61;
              }
              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              objc_msgSend(v34, "featureNames");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
              if (v36)
              {
                v37 = *(_QWORD *)v67;
                do
                {
                  for (j = 0; j != v36; ++j)
                  {
                    if (*(_QWORD *)v67 != v37)
                      objc_enumerationMutation(v35);
                    v39 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
                    objc_msgSend(v34, "featureValueForName:", v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, v39);

                  }
                  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
                }
                while (v36);
              }

            }
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
        if (v13)
          continue;
        break;
      }
    }

    v41 = [MLDictionaryFeatureProvider alloc];
    v65 = v11;
    v42 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v41, "initWithDictionary:error:", v12, &v65);
    v10 = v65;

    if (v42)
    {
      objc_msgSend(v47, "addObject:", v42);
    }
    else if (a6)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v10, CFSTR("Failed to extract output tensor"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    ++v49;
    if (!v42)
    {
      v43 = 0;
LABEL_70:
      v11 = v10;
      goto LABEL_67;
    }
  }
  if (a6)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v11, CFSTR("Failed to extract output tensor"));
    v43 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_66:
    v43 = 0;
  }
LABEL_67:

  return v43;
}

+ (id)mlComputeDataProviderFromBatchProvider:(id)a3 batchSize:(unint64_t)a4 forPrediction:(BOOL)a5 neuralNetworkEngine:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  MLComputeBatchDataSource *v13;

  v9 = a5;
  v11 = a3;
  v12 = a6;
  v13 = -[MLComputeBatchDataSource initWithBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:]([MLComputeBatchDataSource alloc], "initWithBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:", v11, a4, v9, v12, a7);

  return v13;
}

+ (id)featureProviderFomMLComputeDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v6;
  void *v7;

  +[MLDataConversionUtils batchProviderFromMLComputeDataProvider:neuralNetworkEngine:options:error:](MLDataConversionUtils, "batchProviderFromMLComputeDataProvider:neuralNetworkEngine:options:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featuresAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)batchProviderFromMLComputeDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  MLMultiArray *v33;
  id v34;
  MLMultiArray *v35;
  float v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  MLMultiArray *v41;
  MLMultiArray *v42;
  uint64_t v43;
  MLMultiArray *v44;
  id v45;
  MLMultiArray *v46;
  uint64_t v47;
  BOOL v48;
  void *v49;
  MLDictionaryFeatureProvider *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  void *v57;
  id v58;
  int v59;
  void *v60;
  MLDictionaryFeatureProvider *v61;
  MLDictionaryFeatureProvider *v62;
  MLDictionaryFeatureProvider *v63;
  MLArrayBatchProvider *v64;
  id v66;
  uint64_t v67;
  uint64_t v68;
  MLDictionaryFeatureProvider *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  id obj;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  MLMultiArray *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  _BYTE v105[128];
  void *v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v8 = a4;
  v70 = a5;
  v87 = v8;
  objc_msgSend(v8, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputDescriptionsByName");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v72, "numberOfBatches");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_74:
    v64 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v71);
    v85 = v10;
    goto LABEL_84;
  }
  v66 = v10;
  v10 = 0;
  v11 = 0;
LABEL_3:
  v104 = v10;
  v68 = v11;
  objc_msgSend(v72, "batchAtIndex:error:", v66);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v104;

  if (v79)
  {
    v10 = v85;
    v67 = objc_msgSend(v72, "sizeOfBatchAtIndex:", v68);
    if (!v67)
      goto LABEL_73;
    v73 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 0u;
      v103 = 0u;
      v101 = 0u;
      v100 = 0u;
      objc_msgSend(v79, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v13;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
      if (!v14)
      {
        v85 = v10;
        goto LABEL_71;
      }
      v77 = *(_QWORD *)v101;
      v85 = v10;
      do
      {
        v76 = v14;
        for (i = 0; i != v76; ++i)
        {
          if (*(_QWORD *)v101 != v77)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
          objc_msgSend(v78, "objectForKeyedSubscript:", v16);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "modelDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "predictedFeatureName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v16);

          if (v88)
            v20 = 1;
          else
            v20 = v19;
          if ((v20 & 1) == 0)
            continue;
          if ((v19 & 1) == 0 && objc_msgSend(v88, "type") != 5)
          {
            if (a6)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Output is not in the expected format."));
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_80;
          }
          v21 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v79, "objectForKeyedSubscript:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "bytes");
          objc_msgSend(v79, "objectForKeyedSubscript:", v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "dataWithBytesNoCopy:length:freeWhenDone:", v23, objc_msgSend(v24, "length"), 0);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v19 & 1) != 0)
          {
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v87, "classLabels");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v27;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = 65568;
          }
          else
          {
            objc_msgSend(v88, "multiArrayConstraint");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v29, "dataType");

            objc_msgSend(v88, "multiArrayConstraint");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "shape");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
          }

          +[MLDataConversionUtils stridesForShape:](MLDataConversionUtils, "stridesForShape:", v84);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(a1, "sizeFromShape:", v84);
          v31 = objc_msgSend(a1, "mlComputeDataTypeSize:", v28);
          if (objc_msgSend(v87, "classifierOutputIsSigmoidOutput"))
            v32 = objc_msgSend(a1, "mlComputeDataTypeSize:", v28);
          else
            v32 = v31 * v30;
          objc_msgSend(v82, "subdataWithRange:", v32 * v73);
          v86 = (id)objc_claimAutoreleasedReturnValue();
          v33 = [MLMultiArray alloc];
          v99 = v85;
          v83 = -[MLMultiArray initWithShape:dataType:error:](v33, "initWithShape:dataType:error:", v84, v28, &v99);
          v34 = v99;

          if (!v83)
          {
            if (a6)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to extract output tensor"));
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }

            v85 = v34;
LABEL_80:

LABEL_81:
            goto LABEL_82;
          }
          if (objc_msgSend(v87, "classifierOutputIsSigmoidOutput"))
          {
            v35 = -[MLMultiArray initWithShape:dataType:error:]([MLMultiArray alloc], "initWithShape:dataType:error:", &unk_1E3DA29F0, 65568, a6);
            if (!v35)
            {
              if (a6)
              {
                +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to create a multi array of size 2"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_53;
              }
LABEL_54:

              v59 = 0;
              v44 = 0;
LABEL_55:
              v85 = v34;
              goto LABEL_64;
            }
            v36 = *(float *)objc_msgSend(objc_retainAutorelease(v86), "bytes");
            *(float *)&v37 = v36;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLMultiArray setObject:atIndexedSubscript:](v35, "setObject:atIndexedSubscript:", v38, 0);

            *(float *)&v39 = 1.0 - v36;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLMultiArray setObject:atIndexedSubscript:](v35, "setObject:atIndexedSubscript:", v40, 1);

            v41 = [MLMultiArray alloc];
            v42 = objc_retainAutorelease(v35);
            v43 = -[MLMultiArray mutableBytes](v42, "mutableBytes");
            v98 = v34;
            v44 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v41, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v43, v84, 65568, v81, 0, &v98);
            v45 = v98;

            if (!v44)
            {
              if (a6)
              {
                +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to extract output tensor"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = v45;
LABEL_53:
                *a6 = v60;
              }
              else
              {
                v34 = v45;
              }
              goto LABEL_54;
            }

          }
          else
          {
            v46 = [MLMultiArray alloc];
            v47 = objc_msgSend(objc_retainAutorelease(v86), "bytes");
            v97 = v34;
            v44 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v46, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v47, v84, 65568, v81, 0, &v97);
            v85 = v97;

            if (!v44)
            {
              if (a6)
              {
                +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to extract output tensor"));
                v58 = (id)objc_claimAutoreleasedReturnValue();
                v59 = 0;
                v44 = 0;
                goto LABEL_48;
              }
              v59 = 0;
              v44 = 0;
              goto LABEL_64;
            }
            v45 = v85;
          }
          v96 = v45;
          v48 = -[MLMultiArray copyIntoMultiArray:error:](v44, "copyIntoMultiArray:error:", v83, &v96);
          v85 = v96;

          if (v48)
          {
            if (!v19)
            {
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v83, v16);
LABEL_50:
              v59 = 1;
              goto LABEL_64;
            }
            objc_msgSend(v87, "classScoreVectorName");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v83, v49);

            v50 = [MLDictionaryFeatureProvider alloc];
            v95 = v85;
            v69 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v50, "initWithDictionary:error:", v12, &v95);
            v34 = v95;

            if (!v69)
            {
              if (a6)
              {
                +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to extract output tensor"));
                v59 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v59 = 0;
              }
              goto LABEL_55;
            }
            v94 = v34;
            objc_msgSend(v87, "addClassifierInformationToOutput:options:error:", v69, v70, &v94);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v94;

            if (v51)
            {
              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              objc_msgSend(v51, "featureNames");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
              if (v53)
              {
                v54 = *(_QWORD *)v91;
                do
                {
                  for (j = 0; j != v53; ++j)
                  {
                    if (*(_QWORD *)v91 != v54)
                      objc_enumerationMutation(v52);
                    v56 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
                    objc_msgSend(v51, "featureValueForName:", v56);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setObject:forKeyedSubscript:", v57, v56);

                  }
                  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
                }
                while (v53);
              }

              goto LABEL_50;
            }
            v61 = v69;
            if (a6)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to extract output tensor"));
              *a6 = (id)objc_claimAutoreleasedReturnValue();
              v61 = v69;
            }

          }
          else if (a6)
          {
            +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to copy output data to output tensor"));
            v58 = (id)objc_claimAutoreleasedReturnValue();
            v59 = 0;
LABEL_48:
            *a6 = v58;
            goto LABEL_64;
          }
          v59 = 0;
LABEL_64:

          if (!v59)
            goto LABEL_81;
        }
        v13 = obj;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
      }
      while (v14);
LABEL_71:

      v62 = [MLDictionaryFeatureProvider alloc];
      v89 = v85;
      v63 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v62, "initWithDictionary:error:", v12, &v89);
      v10 = v89;

      if (!v63)
      {
        if (a6)
        {
          +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to extract output tensor"));
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        v85 = v10;
LABEL_82:

        goto LABEL_83;
      }
      objc_msgSend(v71, "addObject:", v63);

      if (++v73 == v67)
      {
LABEL_73:

        v11 = v68 + 1;
        if ((id)(v68 + 1) == v66)
          goto LABEL_74;
        goto LABEL_3;
      }
    }
  }
  if (a6)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to extract output tensor."));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_83:
  v64 = 0;
LABEL_84:

  return v64;
}

+ (unint64_t)mlComputeDataTypeSize:(int64_t)a3
{
  return 4;
}

+ (unint64_t)sizeFromShape:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  v4 = 0;
  v5 = 1;
  while (v4 < objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 *= objc_msgSend(v6, "unsignedIntegerValue");

    ++v4;
  }

  return v5;
}

@end
