void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

id ANE_BuildNeuronParams(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  float v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  int v21;
  void *v22;
  const __CFString *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  char *v54;
  __int16 v56;
  int v57;

  v1 = a1;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
  switch(objc_msgSend(v1, "activationType"))
  {
    case 1u:
      objc_msgSend(v1, "a");
      if (fabsf(v4) < 0.000001)
      {
        v5 = CFSTR("ReLU");
        goto LABEL_28;
      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("LeakyReLU"), CFSTR("Type"));
      objc_msgSend(v1, "a");
      v57 = v49;
      v56 = 0;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("ReluSlope"));

        v56 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("ReluOffset");
        goto LABEL_44;
      }
      +[MLCLog framework](MLCLog, "framework");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_68;
      goto LABEL_64;
    case 2u:
      ANE_BuildLinearParams(v1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_25;
      +[MLCLog framework](MLCLog, "framework");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        ANE_BuildNeuronParams_cold_3(v1, (char *)v7);
      goto LABEL_68;
    case 3u:
      v5 = CFSTR("SigmoidHighPrecision");
      goto LABEL_28;
    case 4u:
      objc_msgSend(v1, "a");
      v9 = v8;
      objc_msgSend(v1, "b");
      LODWORD(v11) = v10;
      LODWORD(v12) = v9;
      +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 2, v12, v11);
      v7 = objc_claimAutoreleasedReturnValue();
      ANE_BuildLinearParams(v7);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v2, "addObjectsFromArray:", v13);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ClampedReLU"), CFSTR("Type"));
        v57 = 1065353216;
        v56 = 0;
        ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("ReluMin"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ReluMax"));

        v17 = v2;
        v18 = v3;
        goto LABEL_37;
      }
      +[MLCLog framework](MLCLog, "framework");
      v54 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
        ANE_BuildNeuronParams_cold_3(v1, v54);
      goto LABEL_67;
    case 5u:
      objc_msgSend(v1, "a");
      if (fabsf(v19 + -1.0) < 0.000001)
      {
        objc_msgSend(v1, "b");
        if (fabsf(v20 + -1.0) < 0.000001)
        {
          v5 = CFSTR("Tanh");
LABEL_28:
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Type"));
          goto LABEL_45;
        }
      }
      objc_msgSend(v1, "b");
      v57 = v42;
      v56 = 0;
      if (!ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        +[MLCLog framework](MLCLog, "framework");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
        goto LABEL_64;
      }
      v7 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v43, CFSTR("ScaleScalar"));

      objc_msgSend(v2, "addObject:", v7);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Tanh"), CFSTR("Type"));
      objc_msgSend(v2, "addObject:", v3);
      objc_msgSend(v1, "a");
      v57 = v44;
      v56 = 0;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v45, CFSTR("ScaleScalar"));

        v17 = v2;
        v18 = v14;
LABEL_37:
        objc_msgSend(v17, "addObject:", v18);

LABEL_38:
        goto LABEL_46;
      }
      +[MLCLog framework](MLCLog, "framework");
      v54 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
        ANE_BuildNeuronParams_cold_2((uint64_t)&v57);
LABEL_67:

      goto LABEL_68;
    case 6u:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      v5 = CFSTR("Abs");
      goto LABEL_28;
    case 9u:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ELU"), CFSTR("Type"));
      objc_msgSend(v1, "a");
      v57 = v21;
      v56 = 0;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("EluAlpha");
        goto LABEL_44;
      }
      +[MLCLog framework](MLCLog, "framework");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      goto LABEL_68;
    case 0xAu:
      if (!+[MLCPlatformInfo isAneSubTypeVersionGreaterThanOrEqualTo:](MLCPlatformInfo, "isAneSubTypeVersionGreaterThanOrEqualTo:", 13))
      {
        objc_msgSend(v1, "a");
        if (v52 <= (float)-0.000001 || (objc_msgSend(v1, "b"), v53 < 0.000001))
        {
          +[MLCLog framework](MLCLog, "framework");
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            ANE_BuildNeuronParams_cold_11(v7);
LABEL_68:

          v51 = 0;
          goto LABEL_69;
        }
      }
      objc_msgSend(v1, "a");
      if (fabsf(v24) >= 0.000001
        || (objc_msgSend(v1, "b"), v25 < 0.000001)
        || (objc_msgSend(v1, "b"), v27 = v26, objc_msgSend(v1, "a"), v27 <= v28))
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ReLUN"), CFSTR("Type"));
        objc_msgSend(v1, "b");
        v57 = v46;
        v56 = 0;
        if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("ReluMax"));

          objc_msgSend(v1, "a");
          v57 = v48;
          v56 = 0;
          if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = CFSTR("ReluSlope");
            goto LABEL_44;
          }
          +[MLCLog framework](MLCLog, "framework");
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            goto LABEL_68;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            goto LABEL_68;
        }
      }
      else
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ClampedReLU"), CFSTR("Type"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9843EE8, CFSTR("ReluMin"));
        objc_msgSend(v1, "b");
        v57 = v29;
        v56 = 0;
        if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
        {
          v30 = (void *)MEMORY[0x1E0CB37E8];
          goto LABEL_33;
        }
        +[MLCLog framework](MLCLog, "framework");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
      }
      ANE_BuildNeuronParams_cold_8((uint64_t)&v57);
      goto LABEL_68;
    case 0xBu:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("SigmoidHighPrecision"), CFSTR("Type"));
      objc_msgSend(v2, "addObject:", v3);
      ANE_BuildArithmeticParams(24);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v7 = v6;
      objc_msgSend(v2, "addObjectsFromArray:", v6);
      goto LABEL_38;
    case 0x10u:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Tanh"), CFSTR("Type"));
      objc_msgSend(v2, "addObject:", v3);
      v31 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("Sub"), CFSTR("Type"));
      objc_msgSend(v2, "addObject:", v31);

      goto LABEL_46;
    case 0x12u:
      v5 = CFSTR("GELU");
      goto LABEL_28;
    case 0x13u:
      v32 = (void *)MEMORY[0x1E0C9AA70];
      v7 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
      v57 = 1077936128;
      v56 = 0;
      ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v33, CFSTR("BiasScalar"));

      objc_msgSend(v2, "addObject:", v7);
      v34 = (void *)objc_msgSend(v32, "mutableCopy");
      objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("ClampedReLU"), CFSTR("Type"));
      objc_msgSend(v34, "setObject:forKeyedSubscript:", &unk_1E9843EE8, CFSTR("ReluMin"));
      v57 = 1086324736;
      ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("ReluMax"));

      objc_msgSend(v2, "addObject:", v34);
      v36 = (void *)objc_msgSend(v32, "mutableCopy");
      objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
      v57 = 1042983595;
      ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, CFSTR("ScaleScalar"));

      objc_msgSend(v2, "addObject:", v36);
      v38 = (void *)objc_msgSend(v32, "mutableCopy");
      objc_msgSend(v38, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      objc_msgSend(v38, "setObject:forKeyedSubscript:", CFSTR("Mult"), CFSTR("Type"));
      objc_msgSend(v2, "addObject:", v38);

      goto LABEL_38;
    case 0x14u:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ClampedReLU"), CFSTR("Type"));
      objc_msgSend(v1, "a");
      v57 = v39;
      v56 = 0;
      if (!ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        +[MLCLog framework](MLCLog, "framework");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
LABEL_64:
        ANE_BuildNeuronParams_cold_2((uint64_t)&v57);
        goto LABEL_68;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v56);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("ReluMin"));

      objc_msgSend(v1, "b");
      v57 = v41;
      v56 = 0;
      if (!ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        +[MLCLog framework](MLCLog, "framework");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
        goto LABEL_64;
      }
      v30 = (void *)MEMORY[0x1E0CB37E8];
LABEL_33:
      objc_msgSend(v30, "numberWithShort:", v56);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("ReluMax");
LABEL_44:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v23);

LABEL_45:
      objc_msgSend(v2, "addObject:", v3);
LABEL_46:
      v51 = (void *)objc_msgSend(v2, "copy");
LABEL_69:

      return v51;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        ANE_BuildNeuronParams_cold_1(v1, (char *)v7);
      goto LABEL_68;
  }
}

id ANE_BuildLinearParams(void *a1)
{
  id v1;
  void *v2;
  float v3;
  NSObject *v4;
  float v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int16 v22;
  __int16 v23;
  float v24;

  v1 = a1;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v1, "a");
  if (fabsf(v3) >= 0.0001)
  {
    objc_msgSend(v1, "a");
    v24 = v13;
    v23 = 0;
    if (!ANE_ConvertFp32ToInt16((uint64_t)&v24, &v23))
    {
      +[MLCLog framework](MLCLog, "framework");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      goto LABEL_12;
    }
    objc_msgSend(v1, "b");
    v15 = v14;
    objc_msgSend(v1, "a");
    v24 = v15 / v16;
    v22 = 0;
    if (ANE_ConvertFp32ToInt16((uint64_t)&v24, &v22))
    {
      v7 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v17, CFSTR("ScaleScalar"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v18, CFSTR("BiasScalar"));

      objc_msgSend(v2, "addObject:", v7);
      goto LABEL_10;
    }
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ANE_BuildLinearParams_cold_1((uint64_t)&v24);
LABEL_20:

    v19 = 0;
    goto LABEL_21;
  }
  +[MLCLog framework](MLCLog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    ANE_BuildLinearParams_cold_3(v1, v4);

  objc_msgSend(v1, "a");
  v24 = v5;
  v23 = 0;
  if (!ANE_ConvertFp32ToInt16((uint64_t)&v24, &v23))
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      ANE_BuildLinearParams_cold_1((uint64_t)&v24);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  v6 = (void *)MEMORY[0x1E0C9AA70];
  v7 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, CFSTR("ScaleScalar"));

  objc_msgSend(v2, "addObject:", v7);
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Pooling"), kMLCANENetUnitType[0]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Max"), CFSTR("Type"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Zero"), CFSTR("PaddingMode"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E9843F00, CFSTR("KernelWidth"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E9843F00, CFSTR("KernelHeight"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E9844990, CFSTR("Step"));
  objc_msgSend(v2, "addObject:", v9);
  objc_msgSend(v1, "b");
  v24 = v10;
  v22 = 0;
  if (!ANE_ConvertFp32ToInt16((uint64_t)&v24, &v22))
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      ANE_BuildLinearParams_cold_1((uint64_t)&v24);

    goto LABEL_20;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("BiasScalar"));

  objc_msgSend(v2, "addObject:", v11);
LABEL_10:

  v19 = (void *)objc_msgSend(v2, "copy");
LABEL_21:

  return v19;
}

id ANE_CreateNeuronLayer(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = (id)MEMORY[0x1E0C9AA60];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  ANE_BuildNeuronParams(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_MLCANENeuronParameters neuronUnitParametersWith:neuronType:](_MLCANENeuronParameters, "neuronUnitParametersWith:neuronType:", v4, objc_msgSend(v1, "activationType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 10, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "addObject:", v6);
    v2 = v3;

  }
  return v2;
}

id ANE_CreateUnitsWithNeuronLayer(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  char v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  _QWORD v121[2];
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _QWORD v127[2];
  _QWORD v128[2];
  void *v129;
  _QWORD v130[2];

  v130[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  switch(a3)
  {
    case 1:
    case 3:
    case 9:
    case 10:
    case 18:
    case 20:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "sourceTensors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = ANE_ValidateNeuronUnit(v10, v9, 1);

      if ((v8 & 1) != 0)
        goto LABEL_3;
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      goto LABEL_7;
    case 2:
      ANE_CreateUnitsOfLinear(v5, v6);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v9 = v14;
        objc_msgSend(v7, "addObjectsFromArray:", v14);
        goto LABEL_4;
      }
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithNeuronLayer_cold_2();
      goto LABEL_9;
    case 4:
      objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
      v9 = objc_claimAutoreleasedReturnValue();
      ANE_CreateUnitsOfLinear(v5, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = v15;
        v17 = objc_msgSend(v15, "count");
        objc_msgSend(v6, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "label");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("_%lu"), v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v6;
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("Name"));

        objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v16, "count") - 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Name"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("Bottom"));

        v6 = v22;
        objc_msgSend(v7, "addObjectsFromArray:", v16);
        objc_msgSend(v7, "addObject:", v19);

        goto LABEL_4;
      }
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithNeuronLayer_cold_2();
      goto LABEL_8;
    case 5:
      if (objc_msgSend(v6, "count") != 3)
      {
        if (objc_msgSend(v6, "count") != 1)
        {
          +[MLCLog framework](MLCLog, "framework");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            ANE_CreateUnitsWithNeuronLayer_cold_7();
          goto LABEL_9;
        }
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v110);
        v9 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "sourceTensors");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = ANE_ValidateNeuronUnit(v111, v9, 1);

        if ((v112 & 1) != 0)
        {
LABEL_3:
          objc_msgSend(v7, "addObject:", v9);
LABEL_4:

          goto LABEL_5;
        }
        +[MLCLog framework](MLCLog, "framework");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        goto LABEL_7;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v26);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByAppendingString:", CFSTR("_0"));
      v28 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v28, CFSTR("Name"));

      objc_msgSend(v5, "sourceTensors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v28) = ANE_ValidateGOCUnit(v29, v9, 1);

      if ((v28 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        goto LABEL_7;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v30);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByAppendingString:", CFSTR("_1"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v32, CFSTR("Name"));

      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Name"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v130[0] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 1);
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v34, CFSTR("Bottom"));

      objc_msgSend(v5, "sourceTensors");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v34) = ANE_ValidateNeuronUnit(v35, v12, 1);

      if ((v34 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          ANE_CreateUnitsWithNeuronLayer_cold_3();

        goto LABEL_8;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringByAppendingString:", CFSTR("_2"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("Name"));

      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("Name"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, CFSTR("Bottom"));

      objc_msgSend(v5, "sourceTensors");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v41) = ANE_ValidateGOCUnit(v42, v37, 1);

      if ((v41 & 1) != 0)
      {
        objc_msgSend(v7, "addObject:", v9);
        objc_msgSend(v7, "addObject:", v12);
        objc_msgSend(v7, "addObject:", v37);

        goto LABEL_5;
      }
      +[MLCLog framework](MLCLog, "framework");
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithNeuronLayer_cold_3();

      v11 = 0;
      goto LABEL_11;
    case 6:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v43);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "sourceTensors");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = ANE_ValidateElementWiseUnit(v46, v9, 1);

      if ((v47 & 1) != 0)
        goto LABEL_3;
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithNeuronLayer_cold_3();
      goto LABEL_8;
    case 11:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v7, "count"));
      v52 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v52, CFSTR("Name"));

      objc_msgSend(v5, "sourceTensors");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v52) = ANE_ValidateNeuronUnit(v53, v50, 1);

      if ((v52 & 1) != 0)
      {
        objc_msgSend(v7, "addObject:", v50);
        v119 = v6;
        objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        ANE_CreateUnitsWithArithmeticOpeartion(24, v5, v117);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "count"))
        {
          v55 = 0;
          do
          {
            objc_msgSend(v54, "objectAtIndexedSubscript:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "label");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v7, "count"), v117);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v58, CFSTR("Name"));

            objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("Name"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            v125 = v60;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v125, 1);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v61, CFSTR("Bottom"));

            objc_msgSend(v7, "addObject:", v56);
            ++v55;
          }
          while (v55 < objc_msgSend(v54, "count"));
        }

        goto LABEL_36;
      }
      +[MLCLog framework](MLCLog, "framework");
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithNeuronLayer_cold_3();
      goto LABEL_61;
    case 16:
      if (objc_msgSend(v6, "count") != 2)
      {
        +[MLCLog framework](MLCLog, "framework");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          ANE_CreateUnitsWithNeuronLayer_cold_10();
        goto LABEL_9;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v62);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringByAppendingString:", CFSTR("_0"));
      v64 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v64, CFSTR("Name"));

      objc_msgSend(v5, "sourceTensors");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v64) = ANE_ValidateNeuronUnit(v65, v9, 1);

      if ((v64 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
LABEL_7:
          ANE_CreateUnitsWithNeuronLayer_cold_3();
LABEL_8:

        goto LABEL_9;
      }
      v119 = v6;
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v66);
      v67 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "stringByAppendingString:", CFSTR("_1"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v67, "setObject:forKeyedSubscript:", v69, CFSTR("Name"));

      objc_msgSend(v5, "sourceTensors");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "label");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v128[0] = v72;
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Name"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v128[1] = v73;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
      v74 = v5;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v67, "setObject:forKeyedSubscript:", v75, CFSTR("Bottom"));

      objc_msgSend(v74, "sourceTensors");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v127[0] = v77;
      v78 = v74;
      v79 = v74;
      v80 = (void *)v67;
      objc_msgSend(v79, "sourceTensors");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v127[1] = v82;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v67) = ANE_ValidateElementWiseUnit(v83, (void *)v67, 1);

      if ((v67 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v115 = objc_claimAutoreleasedReturnValue();
        v5 = v78;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          ANE_CreateUnitsWithNeuronLayer_cold_3();

        v11 = 0;
        v6 = v119;
        goto LABEL_11;
      }
      objc_msgSend(v7, "addObject:", v9);
      objc_msgSend(v7, "addObject:", v80);

      v5 = v78;
LABEL_36:
      v6 = v119;
      goto LABEL_5;
    case 19:
      if (objc_msgSend(v6, "count") != 4)
      {
        +[MLCLog framework](MLCLog, "framework");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          ANE_CreateUnitsWithNeuronLayer_cold_15();
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v84);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v7, "count"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v86, CFSTR("Name"));

      objc_msgSend(v7, "addObject:", v50);
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v87);
      v88 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v7, "count"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v88, "setObject:forKeyedSubscript:", v90, CFSTR("Name"));

      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("Name"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v91;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
      v92 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v88, "setObject:forKeyedSubscript:", v92, CFSTR("Bottom"));

      objc_msgSend(v5, "sourceTensors");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v92) = ANE_ValidateNeuronUnit(v93, v88, 1);

      if ((v92 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          ANE_CreateUnitsWithNeuronLayer_cold_3();

LABEL_61:
LABEL_10:
        v11 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v7, "addObject:", v88);
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v50;
      v97 = v5;
      objc_msgSend(v96, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v7, "count"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setObject:forKeyedSubscript:", v98, CFSTR("Name"));

      -[NSObject objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("Name"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v99;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
      v120 = v6;
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setObject:forKeyedSubscript:", v100, CFSTR("Bottom"));

      objc_msgSend(v7, "addObject:", v95);
      objc_msgSend(v120, "objectAtIndexedSubscript:", 3);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v7, "count"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setObject:forKeyedSubscript:", v104, CFSTR("Name"));

      objc_msgSend(v5, "sourceTensors");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "objectAtIndexedSubscript:", 0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "label");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v121[0] = v107;
      objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Name"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v121[1] = v108;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setObject:forKeyedSubscript:", v109, CFSTR("Bottom"));

      v5 = v97;
      objc_msgSend(v7, "addObject:", v102);

      v6 = v120;
LABEL_5:
      v11 = v7;
LABEL_11:

      return v11;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithNeuronLayer_cold_1();

      goto LABEL_10;
  }
}

id ANE_CreateUnitsOfLinear(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (objc_msgSend(v4, "count") != 3)
  {
    if (objc_msgSend(v4, "count") != 1)
    {
      +[MLCLog framework](MLCLog, "framework");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsOfLinear_cold_5();
      goto LABEL_23;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v3, v25);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "sourceTensors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = ANE_ValidateGOCUnit(v26, v7, 1);

    if ((v27 & 1) != 0)
    {
      objc_msgSend(v5, "addObject:", v7);
      goto LABEL_9;
    }
    +[MLCLog framework](MLCLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_22;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v3, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("_0"));
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, CFSTR("Name"));

  objc_msgSend(v3, "sourceTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = ANE_ValidateGOCUnit(v10, v7, 1);

  if ((v9 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
LABEL_11:
      ANE_CreateUnitsOfLinear_cold_1();
LABEL_22:

LABEL_23:
    v28 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v3, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("_1"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, CFSTR("Name"));

  -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("Name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v16, CFSTR("Bottom"));

  objc_msgSend(v3, "sourceTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = ANE_ValidatePoolingUnit(v17, v12, 1);

  if ((v16 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      ANE_CreateUnitsOfLinear_cold_2();
    goto LABEL_21;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v3, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingString:", CFSTR("_2"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, CFSTR("Name"));

  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("Name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v23 = objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v23, CFSTR("Bottom"));

  objc_msgSend(v3, "sourceTensors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = ANE_ValidateGOCUnit(v24, v19, 1);

  if ((v23 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      ANE_CreateUnitsOfLinear_cold_1();

LABEL_21:
    goto LABEL_22;
  }
  objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(v5, "addObject:", v12);
  objc_msgSend(v5, "addObject:", v19);

LABEL_9:
  v28 = (void *)objc_msgSend(v5, "copy");
LABEL_24:

  return v28;
}

id ANE_CompileNeuronLayer(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a1;
  objc_msgSend(a3, "parentLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "params");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "neuronParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "params");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");

  ANE_CreateUnitsWithNeuronLayer(v6, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12;

  return v13;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double OUTLINED_FUNCTION_4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return *(float *)a1;
}

uint64_t OUTLINED_FUNCTION_11(void *a1, const char *a2)
{
  return objc_msgSend(a1, "activationType");
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id GPU_CreateLossLayer(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v4, "lossType");
  if (v5 >= 9)
  {
    +[MLCLog framework](MLCLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      GPU_CreateLossLayer_cold_2(v4);
    goto LABEL_13;
  }
  v6 = v5;
  v7 = v4;
  v8 = objc_msgSend(v4, "reductionType");
  objc_msgSend(v7, "lossType");
  if (v8 >= 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      GPU_CreateLossLayer_cold_1(v7);
LABEL_13:

    v11 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CC6D20], "cnnLossDescriptorWithType:reductionType:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReduceAcrossBatch:", objc_msgSend(v7, "reductionType") != 0);
  v4 = v7;
  if ((v6 & 0xE) == 2)
  {
    objc_msgSend(v7, "labelSmoothing");
    objc_msgSend(v9, "setLabelSmoothing:");
  }
  switch((_DWORD)v6)
  {
    case 8:
      objc_msgSend(v7, "epsilon");
      objc_msgSend(v9, "setEpsilon:");
      break;
    case 6:
      objc_msgSend(v7, "delta");
      objc_msgSend(v9, "setDelta:");
      break;
    case 2:
      objc_msgSend(v9, "setNumberOfClasses:", objc_msgSend(v7, "classCount"));
      break;
  }
  objc_msgSend(v3, "deviceList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v31 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (v13)
  {
    v14 = 0;
    v15 = 0x1E0CC7000uLL;
    v29 = v13;
    v30 = v3;
    do
    {
      objc_msgSend(v3, "deviceList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "weight");
      objc_msgSend(v9, "setWeight:");
      v18 = (void *)objc_msgSend(objc_alloc(*(Class *)(v15 + 448)), "initWithDevice:lossDescriptor:", v17, v9);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC71E0]), "initWithDevice:lossDescriptor:", v17, v9);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC71D0]), "initWithDevice:", v17);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6D10]), "initWithDevice:lossDescriptor:", v17, v9);
      if ((objc_msgSend(v4, "lossType") == 2 || objc_msgSend(v4, "lossType") == 4)
        && !objc_msgSend(v4, "reductionType"))
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7210]), "initWithDevice:", v17);
        if (!v18)
          goto LABEL_32;
      }
      else
      {
        v20 = 0;
        if (!v18)
          goto LABEL_32;
      }
      if (v19)
      {
        if (objc_msgSend(v4, "reductionType") != 2 || v13 == 1)
        {
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v18, v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            goto LABEL_30;
        }
        else
        {
          LODWORD(v21) = 0.5;
          LODWORD(v22) = 0;
          objc_msgSend(MEMORY[0x1E0CC71E8], "cnnNeuronDescriptorWithType:a:b:", 2, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v9;
          v25 = v4;
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6D30]), "initWithDevice:neuronDescriptor:", v17, v23);
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:secondaryGradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:secondaryGradientKernel:", v18, v19, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v25;
          v9 = v24;
          v13 = v29;

          v3 = v30;
          if (!v27)
            goto LABEL_31;
LABEL_30:
          objc_msgSend(v27, "setLossInitialGradientKernel:", v33);
          objc_msgSend(v27, "setCombinedForwardAndGradientLossKernel:", v32);
          objc_msgSend(v27, "setReduceLossKernel:", v20);
          objc_msgSend(v27, "setSourceOfForwardNeededForGradient:", 1);
          objc_msgSend(v27, "setResultOfForwardNeededForGradient:", 0);
          objc_msgSend(v31, "addObject:", v27);
        }
LABEL_31:

        v15 = 0x1E0CC7000;
      }
LABEL_32:

      ++v14;
    }
    while (v13 != v14);
  }
  v11 = (void *)objc_msgSend(v31, "copy");

LABEL_34:
  return v11;
}

id GPU_CreateYOLOLossLayer(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  double v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  double v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  double v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  double v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  double v57;
  void *v58;
  int v59;
  int v60;
  void *v61;
  double v62;
  void *v63;
  int v64;
  int v65;
  void *v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  int v82;
  void *v83;
  double v84;
  void *v85;
  int v86;
  int v87;
  void *v88;
  double v89;
  void *v90;
  int v91;
  int v92;
  void *v93;
  double v94;
  void *v95;
  int v96;
  int v97;
  void *v98;
  double v99;
  void *v100;
  int v101;
  int v102;
  void *v103;
  double v104;
  void *v105;
  int v106;
  int v107;
  void *v108;
  double v109;
  void *v110;
  int v111;
  int v112;
  void *v113;
  double v114;
  void *v115;
  int v116;
  int v117;
  void *v118;
  double v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t i;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  id v141;

  v141 = a1;
  v3 = a2;
  objc_msgSend(v3, "spatialPositionLossDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lossType");
  v6 = 0;
  v7 = 0;
  v8 = 0;
  switch((int)v5)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      v7 = 0;
      v8 = 0;
      v6 = 1;
      break;
    case 6:
      v6 = 0;
      v7 = 0;
      v8 = 1;
      break;
    case 8:
      v6 = 0;
      v8 = 0;
      v7 = 1;
      break;
    default:
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v5 = 10;
      break;
  }
  v133 = v6;
  v137 = v7;
  v139 = v8;

  objc_msgSend(v3, "spatialSizeLossDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lossType");
  v11 = 0;
  v12 = 0;
  v13 = 0;
  switch((int)v10)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      v12 = 0;
      v13 = 0;
      v11 = 1;
      break;
    case 6:
      v11 = 0;
      v12 = 0;
      v13 = 1;
      break;
    case 8:
      v11 = 0;
      v13 = 0;
      v12 = 1;
      break;
    default:
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v10 = 10;
      break;
  }
  v132 = v11;
  v136 = v12;
  v140 = v13;

  objc_msgSend(v3, "confidenceLossDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "lossType");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  switch((int)v15)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      v17 = 0;
      v18 = 0;
      v16 = 1;
      break;
    case 6:
      v16 = 0;
      v17 = 0;
      v18 = 1;
      break;
    case 8:
      v16 = 0;
      v18 = 0;
      v17 = 1;
      break;
    default:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v15 = 10;
      break;
  }
  v131 = v16;
  v135 = v17;
  v138 = v18;

  objc_msgSend(v3, "classesLossDescriptor");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend((id)v19, "lossType");
  v21 = 0;
  v22 = 0;
  v23 = 0;
  switch((int)v20)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      v22 = 0;
      v23 = 0;
      v21 = 1;
      break;
    case 6:
      v21 = 0;
      v22 = 0;
      v23 = 1;
      break;
    case 8:
      v21 = 0;
      v23 = 0;
      v22 = 1;
      break;
    default:
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v20 = 10;
      break;
  }
  v134 = v22;

  LODWORD(v19) = objc_msgSend(v3, "reductionType");
  objc_msgSend(v3, "spatialPositionLossDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lossType");
  if (v19 >= 3)
    v19 = 4;
  else
    v19 = v19;

  v25 = (void *)MEMORY[0x1E0CC6DD8];
  objc_msgSend(v3, "anchorBoxes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cnnLossDescriptorWithXYLossType:WHLossType:confidenceLossType:classesLossType:reductionType:anchorBoxes:numberOfAnchorBoxes:", v5, v10, v15, v20, v19, v26, objc_msgSend(v3, "anchorBoxCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setReduceAcrossBatch:", 1);
  objc_msgSend(v3, "spatialPositionLossDescriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "weight");
  v30 = v29;
  objc_msgSend(v27, "XYLossDescriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = v30;
  objc_msgSend(v31, "setWeight:", v32);

  objc_msgSend(v3, "spatialSizeLossDescriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "weight");
  v35 = v34;
  objc_msgSend(v27, "WHLossDescriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = v35;
  objc_msgSend(v36, "setWeight:", v37);

  objc_msgSend(v3, "confidenceLossDescriptor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "weight");
  v40 = v39;
  objc_msgSend(v27, "confidenceLossDescriptor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = v40;
  objc_msgSend(v41, "setWeight:", v42);

  objc_msgSend(v3, "classesLossDescriptor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "weight");
  v45 = v44;
  objc_msgSend(v27, "classesLossDescriptor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v47) = v45;
  objc_msgSend(v46, "setWeight:", v47);

  if ((v5 & 0xE) == 2)
  {
    objc_msgSend(v3, "spatialPositionLossDescriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "labelSmoothing");
    v50 = v49;
    objc_msgSend(v27, "XYLossDescriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = v50;
    objc_msgSend(v51, "setLabelSmoothing:", v52);

  }
  if ((v10 & 0xE) == 2)
  {
    objc_msgSend(v3, "spatialSizeLossDescriptor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "labelSmoothing");
    v55 = v54;
    objc_msgSend(v27, "WHLossDescriptor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = v55;
    objc_msgSend(v56, "setLabelSmoothing:", v57);

  }
  if ((v15 & 0xE) == 2)
  {
    objc_msgSend(v3, "confidenceLossDescriptor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "labelSmoothing");
    v60 = v59;
    objc_msgSend(v27, "confidenceLossDescriptor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v62) = v60;
    objc_msgSend(v61, "setLabelSmoothing:", v62);

  }
  if ((v20 & 0xE) == 2)
  {
    objc_msgSend(v3, "classesLossDescriptor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "labelSmoothing");
    v65 = v64;
    objc_msgSend(v27, "classesLossDescriptor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v67) = v65;
    objc_msgSend(v66, "setLabelSmoothing:", v67);

  }
  if (v133)
  {
    objc_msgSend(v3, "spatialPositionLossDescriptor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "classCount");
    objc_msgSend(v27, "XYLossDescriptor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setNumberOfClasses:", v69);

  }
  if (v132)
  {
    objc_msgSend(v3, "spatialSizeLossDescriptor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "classCount");
    objc_msgSend(v27, "WHLossDescriptor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setNumberOfClasses:", v72);

  }
  if (v131)
  {
    objc_msgSend(v3, "confidenceLossDescriptor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "classCount");
    objc_msgSend(v27, "confidenceLossDescriptor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setNumberOfClasses:", v75);

  }
  if (v21)
  {
    objc_msgSend(v3, "classesLossDescriptor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "classCount");
    objc_msgSend(v27, "classesLossDescriptor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setNumberOfClasses:", v78);

  }
  if (v137)
  {
    objc_msgSend(v3, "spatialPositionLossDescriptor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "epsilon");
    v82 = v81;
    objc_msgSend(v27, "XYLossDescriptor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v84) = v82;
    objc_msgSend(v83, "setEpsilon:", v84);

  }
  if (v136)
  {
    objc_msgSend(v3, "spatialSizeLossDescriptor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "epsilon");
    v87 = v86;
    objc_msgSend(v27, "WHLossDescriptor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v89) = v87;
    objc_msgSend(v88, "setEpsilon:", v89);

  }
  if (v135)
  {
    objc_msgSend(v3, "confidenceLossDescriptor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "epsilon");
    v92 = v91;
    objc_msgSend(v27, "confidenceLossDescriptor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v94) = v92;
    objc_msgSend(v93, "setEpsilon:", v94);

  }
  if (v134)
  {
    objc_msgSend(v3, "classesLossDescriptor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "epsilon");
    v97 = v96;
    objc_msgSend(v27, "classesLossDescriptor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v99) = v97;
    objc_msgSend(v98, "setEpsilon:", v99);

  }
  if (v139)
  {
    objc_msgSend(v3, "spatialPositionLossDescriptor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "delta");
    v102 = v101;
    objc_msgSend(v27, "XYLossDescriptor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v104) = v102;
    objc_msgSend(v103, "setDelta:", v104);

  }
  if (v140)
  {
    objc_msgSend(v3, "spatialSizeLossDescriptor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "delta");
    v107 = v106;
    objc_msgSend(v27, "WHLossDescriptor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v109) = v107;
    objc_msgSend(v108, "setDelta:", v109);

  }
  if (v138)
  {
    objc_msgSend(v3, "confidenceLossDescriptor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "delta");
    v112 = v111;
    objc_msgSend(v27, "confidenceLossDescriptor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v114) = v112;
    objc_msgSend(v113, "setDelta:", v114);

  }
  if (v23)
  {
    objc_msgSend(v3, "classesLossDescriptor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "delta");
    v117 = v116;
    objc_msgSend(v27, "classesLossDescriptor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v119) = v117;
    objc_msgSend(v118, "setDelta:", v119);

  }
  objc_msgSend(v27, "setRescore:", objc_msgSend(v3, "shouldRescore"));
  objc_msgSend(v3, "scaleSpatialPositionLoss");
  objc_msgSend(v27, "setScaleXY:");
  objc_msgSend(v3, "scaleSpatialSizeLoss");
  objc_msgSend(v27, "setScaleWH:");
  objc_msgSend(v3, "scaleNoObjectConfidenceLoss");
  objc_msgSend(v27, "setScaleNoObject:");
  objc_msgSend(v3, "scaleObjectConfidenceLoss");
  objc_msgSend(v27, "setScaleObject:");
  objc_msgSend(v3, "scaleClassLoss");
  objc_msgSend(v27, "setScaleClass:");
  objc_msgSend(v3, "minimumIOUForObjectPresence");
  objc_msgSend(v27, "setMinIOUForObjectPresence:");
  objc_msgSend(v3, "maximumIOUForObjectAbsence");
  objc_msgSend(v27, "setMaxIOUForObjectAbsence:");
  objc_msgSend(v141, "deviceList");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "count");

  v122 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (v121)
  {
    for (i = 0; i != v121; ++i)
    {
      objc_msgSend(v141, "deviceList");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "objectAtIndexedSubscript:", i);
      v125 = (void *)objc_claimAutoreleasedReturnValue();

      v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6DD0]), "initWithDevice:lossDescriptor:", v125, v27);
      if (v126)
      {
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v126, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v127;
        if (v127)
        {
          objc_msgSend(v127, "setLossInitialGradientKernel:", 0);
          objc_msgSend(v128, "setCombinedForwardAndGradientLossKernel:", v126);
          objc_msgSend(v128, "setSourceOfForwardNeededForGradient:", 1);
          objc_msgSend(v128, "setResultOfForwardNeededForGradient:", 0);
          objc_msgSend(v122, "addObject:", v128);
        }

      }
    }
  }
  v129 = (void *)objc_msgSend(v122, "copy");

  return v129;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t CPU_BNNSDataTypeSizeInBytes(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  result = 4;
  if (a1 > 131103)
  {
    if (a1 <= 262159)
    {
      if (a1 == 131104)
        return result;
      if (a1 != 262152)
        goto LABEL_18;
    }
    else if (a1 != 1048584)
    {
      if (a1 == 262176)
        return result;
      v7 = 262160;
      goto LABEL_15;
    }
    return 1;
  }
  if (a1 > 131079)
  {
    if (a1 != 131080)
    {
      v7 = 131088;
LABEL_15:
      if (a1 == v7)
        return 2;
LABEL_18:
      +[MLCLog framework](MLCLog, "framework", v2, v1, v3, v4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        CPU_BNNSDataTypeSizeInBytes_cold_1(v8, v9, v10);

      return 0;
    }
    return 1;
  }
  if (a1 == 65552)
    return 2;
  if (a1 != 65568)
    goto LABEL_18;
  return result;
}

uint64_t CPU_BNNSDataType(int a1)
{
  int v2;
  NSObject *v3;

  v2 = a1 - 1;
  if ((a1 - 1) < 9 && ((0x1EDu >> v2) & 1) != 0)
    return dword_1D4AB8850[v2];
  +[MLCLog framework](MLCLog, "framework");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    CPU_BNNSDataType_cold_1(a1, v3);

  return 0;
}

uint64_t CPU_BuildBNNSNDArrayLastMajorDescriptor(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t *v51;
  void *v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  id v57;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v14 = (void *)objc_msgSend(v12, "mutableCopy");
  v57 = v11;
  switch(objc_msgSend(v9, "count"))
  {
    case 1:
      *(_DWORD *)(a1 + 4) = 98304;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v15, 0);

      if (!v10)
        goto LABEL_17;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      v18 = v16;
      v19 = 0;
      goto LABEL_9;
    case 2:
      *(_DWORD *)(a1 + 4) = 163840;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v24, 0);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v25, 1);

      if (v10)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v26, 0);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v14;
        v18 = v16;
        v19 = 1;
LABEL_9:
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v18, v19);

      }
      goto LABEL_17;
    case 3:
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v27, 0);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v28, 1);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v29, 2);

      if (v10)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v30, 0);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v31, 1);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v32, 2);

      }
      v33 = 229376;
      goto LABEL_16;
    case 4:
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v34, 0);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v35, 1);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v36, 2);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v37, 3);

      if (v10)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v38, 0);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v39, 1);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v40, 2);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v41, 3);

      }
      v33 = 294912;
LABEL_16:
      *(_DWORD *)(a1 + 4) = v33;
LABEL_17:
      v42 = CPU_BNNSDataType(a5);
      *(_DWORD *)(a1 + 144) = v42;
      v43 = CPU_BNNSDataTypeSizeInBytes(v42);
      v44 = objc_msgSend(v13, "count");
      if (v44)
      {
        v45 = v44;
        v46 = (_QWORD *)(a1 + 8);
        v47 = -1;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") + v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *v46++ = objc_msgSend(v48, "unsignedIntegerValue");

          --v47;
        }
        while (v45 + v47 != -1);
        if (v10)
        {
          v49 = 0;
          v50 = -(uint64_t)v45;
          v51 = (unint64_t *)(a1 + 72);
          do
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", --v49 + objc_msgSend(v13, "count"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *v51++ = objc_msgSend(v52, "unsignedIntegerValue") / v43;

          }
          while (v50 != v49);
        }
        else
        {
          *(_QWORD *)(a1 + 72) = 1;
          if (v45 >= 2)
          {
            v53 = v45 - 1;
            v54 = (uint64_t *)(a1 + 80);
            v55 = 1;
            do
            {
              v55 *= *(v54 - 9);
              *v54++ = v55;
              --v53;
            }
            while (v53);
          }
        }
      }
      else if (!v10)
      {
        *(_QWORD *)(a1 + 72) = 1;
      }
      v11 = v57;
      if (v57)
        *(_QWORD *)(a1 + 136) = objc_msgSend(objc_retainAutorelease(v57), "bytes");
      *(_QWORD *)(a1 + 164) = 1065353216;
      v23 = 1;
      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        CPU_BuildBNNSNDArrayLastMajorDescriptor_cold_1(v20, v21, v22);

      v23 = 0;
      break;
  }

  return v23;
}

uint64_t CPU_BuildBNNSNDArrayDescriptor(uint64_t a1, void *a2, void *a3, void *a4, int a5, int a6, int a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  unint64_t v58;
  void *v59;
  unint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  void *v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t *v67;
  void *v68;
  unint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  id v73;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = (void *)MEMORY[0x1E0C9AA60];
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v18 = (void *)objc_msgSend(v16, "mutableCopy");
  switch(objc_msgSend(v13, "count"))
  {
    case 1:
      *(_DWORD *)(a1 + 4) = 0x10000;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v19, 0);

      if (!v14)
        goto LABEL_24;
      v20 = v14;
      v21 = 0;
      goto LABEL_10;
    case 2:
      if (a6)
      {
        *(_DWORD *)(a1 + 4) = 0x10000;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v26, 0);

        if (!v14)
          goto LABEL_24;
        v20 = v14;
        v21 = 1;
LABEL_10:
        objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v18;
        v29 = v27;
        v30 = 0;
      }
      else
      {
        *(_DWORD *)(a1 + 4) = 0x20000;
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v49, 0);

        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v50, 1);

        if (!v14)
          goto LABEL_24;
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v51, 0);

        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v18;
        v29 = v27;
        v30 = 1;
      }
      objc_msgSend(v28, "setObject:atIndexedSubscript:", v29, v30);

      goto LABEL_24;
    case 3:
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v31, 0);

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v32, 1);

      if (a7)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v33, 2);

        if (!v14)
          goto LABEL_23;
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v34, 0);

        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v35, 1);

        objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v18;
        v38 = v36;
        v39 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v52, 2);

        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v53, 3);

        if (!v14)
          goto LABEL_23;
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v54, 0);

        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v55, 1);

        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v56, 2);

        v47 = v14;
        v48 = 2;
LABEL_21:
        objc_msgSend(v47, "objectAtIndexedSubscript:", v48);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v18;
        v38 = v36;
        v39 = 3;
      }
      objc_msgSend(v37, "setObject:atIndexedSubscript:", v38, v39);

LABEL_23:
      *(_DWORD *)(a1 + 4) = 196608;
LABEL_24:
      v73 = v13;
      v57 = CPU_BNNSDataType(a5);
      *(_DWORD *)(a1 + 144) = v57;
      v58 = CPU_BNNSDataTypeSizeInBytes(v57);
      if (objc_msgSend(v17, "count") == 4 && (a6 & 1) != 0)
      {
        v59 = v15;
        v60 = 3;
      }
      else
      {
        v59 = v15;
        v60 = objc_msgSend(v17, "count");
        if (!v60)
        {
          v64 = 1;
          if (v14)
            goto LABEL_31;
          goto LABEL_36;
        }
      }
      v61 = (_QWORD *)(a1 + 8);
      v62 = -1;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v17, "count") + v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *v61++ = objc_msgSend(v63, "unsignedIntegerValue");

        --v62;
      }
      while (v60 + v62 != -1);
      v64 = 0;
      if (v14)
      {
LABEL_31:
        if ((v64 & 1) == 0)
        {
          v65 = 0;
          v66 = -(uint64_t)v60;
          v67 = (unint64_t *)(a1 + 72);
          do
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", --v65 + objc_msgSend(v17, "count"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *v67++ = objc_msgSend(v68, "unsignedIntegerValue") / v58;

          }
          while (v66 != v65);
        }
        goto LABEL_39;
      }
LABEL_36:
      *(_QWORD *)(a1 + 72) = 1;
      if (v60 >= 2)
      {
        v69 = v60 - 1;
        v70 = (uint64_t *)(a1 + 80);
        v71 = 1;
        do
        {
          v71 *= *(v70 - 9);
          *v70++ = v71;
          --v69;
        }
        while (v69);
      }
LABEL_39:
      v15 = v59;
      if (v59)
        *(_QWORD *)(a1 + 136) = objc_msgSend(objc_retainAutorelease(v59), "bytes");
      *(_QWORD *)(a1 + 164) = 1065353216;
      v25 = 1;
      v13 = v73;
LABEL_42:

      return v25;
    case 4:
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v40, 0);

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v41, 1);

      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v42, 2);

      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v43, 3);

      if (!v14)
        goto LABEL_23;
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:atIndexedSubscript:", v44, 0);

      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:atIndexedSubscript:", v45, 1);

      objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:atIndexedSubscript:", v46, 2);

      v47 = v14;
      v48 = 3;
      goto LABEL_21;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        CPU_BuildBNNSNDArrayDescriptor_cold_1(v22, v23, v24);

      v25 = 0;
      goto LABEL_42;
  }
}

uint64_t CPU_BuildPermuteBNNSNDArrayDescriptor(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  id v54;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v14 = (void *)objc_msgSend(v12, "mutableCopy");
  v15 = objc_msgSend(v9, "count");
  switch(v15)
  {
    case 4:
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v20, 0);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v21, 1);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v22, 2);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v23, 3);

      if (v10)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v24, 0);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v25, 1);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v26, 2);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v27, 3);

      }
      v54 = v11;
      v28 = 294912;
      goto LABEL_12;
    case 3:
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v29, 0);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v30, 1);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v31, 2);

      if (v10)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v32, 0);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v33, 1);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v34, 2);

      }
      v54 = v11;
      v28 = 229376;
LABEL_12:
      *(_DWORD *)(a1 + 4) = v28;
LABEL_13:
      v35 = CPU_BNNSDataType(a5);
      *(_DWORD *)(a1 + 144) = v35;
      v36 = CPU_BNNSDataTypeSizeInBytes(v35);
      v37 = objc_msgSend(v13, "count");
      if (v37)
      {
        v38 = v37;
        v39 = (_QWORD *)(a1 + 8);
        v40 = -1;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") + v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *v39++ = objc_msgSend(v41, "unsignedIntegerValue");

          --v40;
        }
        while (v38 + v40 != -1);
        if (v10)
        {
          v42 = 0;
          v43 = -(uint64_t)v38;
          v44 = (unint64_t *)(a1 + 72);
          do
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", --v42 + objc_msgSend(v13, "count"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *v44++ = objc_msgSend(v45, "unsignedIntegerValue") / v36;

          }
          while (v43 != v42);
        }
        else
        {
          *(_QWORD *)(a1 + 72) = 1;
          if (v38 >= 2)
          {
            v50 = v38 - 1;
            v51 = (uint64_t *)(a1 + 80);
            v52 = 1;
            do
            {
              v52 *= *(v51 - 9);
              *v51++ = v52;
              --v50;
            }
            while (v50);
          }
        }
      }
      else if (!v10)
      {
        *(_QWORD *)(a1 + 72) = 1;
      }
      v11 = v54;
      if (v54)
        *(_QWORD *)(a1 + 136) = objc_msgSend(objc_retainAutorelease(v54), "bytes");
      *(_QWORD *)(a1 + 164) = 1065353216;
      v49 = 1;
      goto LABEL_31;
    case 2:
      v54 = v11;
      *(_DWORD *)(a1 + 4) = 163840;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v16, 0);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v17, 1);

      if (v10)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v18, 0);

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v19, 1);

      }
      goto LABEL_13;
  }
  +[MLCLog framework](MLCLog, "framework");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    CPU_BuildPermuteBNNSNDArrayDescriptor_cold_1(v46, v47, v48);

  v49 = 0;
LABEL_31:

  return v49;
}

BOOL CPU_BuildBNNSNDArrayDescriptorRowMajor(uint64_t a1, void *a2, void *a3, void *a4, int a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t *v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  id v37;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = (void *)objc_msgSend(a2, "mutableCopy");
  v17 = (void *)objc_msgSend(v13, "mutableCopy");
  if (v15)
  {
    objc_msgSend(v16, "removeObjectAtIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
    objc_msgSend(v17, "removeObjectAtIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
  }
  v18 = objc_msgSend(v16, "count");
  v19 = v18 - a6;
  if (v18 != a6)
  {
    do
    {
      objc_msgSend(v16, "removeObjectAtIndex:", 0);
      objc_msgSend(v17, "removeObjectAtIndex:", 0);
      --v19;
    }
    while (v19);
  }
  v20 = objc_msgSend(v16, "count");
  v21 = v20 - 1;
  if ((unint64_t)(v20 - 1) >= 8)
  {
    +[MLCLog framework](MLCLog, "framework");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      CPU_BuildBNNSNDArrayDescriptorRowMajor_cold_1(v30, v31, v32);

  }
  else
  {
    v22 = v20;
    v36 = v14;
    v37 = v13;
    *(_DWORD *)(a1 + 4) = dword_1D4AB8874[v21];
    v23 = CPU_BNNSDataType(a5);
    *(_DWORD *)(a1 + 144) = v23;
    v24 = CPU_BNNSDataTypeSizeInBytes(v23);
    v25 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v25, v36);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 8 + 8 * v25) = objc_msgSend(v26, "unsignedIntegerValue");

      ++v25;
    }
    while (v22 != v25);
    if (v17)
    {
      v27 = (unint64_t *)(a1 + 72);
      v28 = v21;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *v27++ = objc_msgSend(v29, "unsignedIntegerValue") / v24;

        --v28;
      }
      while (v28 != -1);
    }
    else
    {
      *(_QWORD *)(a1 + 72) = 1;
      if (v22 >= 2)
      {
        v33 = 1;
        v34 = 80;
        do
        {
          v33 *= *(_QWORD *)(a1 + 8 * v22);
          *(_QWORD *)(a1 + v34) = v33;
          --v22;
          v34 += 8;
        }
        while (v22 != 1);
      }
    }
    v14 = v36;
    if (v36)
      *(_QWORD *)(a1 + 136) = objc_msgSend(objc_retainAutorelease(v36), "bytes");
    *(_QWORD *)(a1 + 164) = 1065353216;
    v13 = v37;
  }

  return v21 < 8;
}

BOOL CPU_BuildBNNSNDArrayDescriptorColMajor(uint64_t a1, void *a2, void *a3, void *a4, int a5, uint64_t a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;

  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_msgSend(a2, "mutableCopy");
  v14 = (void *)objc_msgSend(v11, "mutableCopy");
  for (i = objc_msgSend(v13, "count") - a6; i; --i)
  {
    objc_msgSend(v13, "removeObjectAtIndex:", 0);
    objc_msgSend(v14, "removeObjectAtIndex:", 0);
  }
  v16 = objc_msgSend(v13, "count");
  v17 = v16 - 1;
  if ((unint64_t)(v16 - 1) >= 8)
  {
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      CPU_BuildBNNSNDArrayDescriptorColMajor_cold_1(v25, v26, v27);

  }
  else
  {
    v18 = v16;
    *(_DWORD *)(a1 + 4) = dword_1D4AB8894[v17];
    v19 = CPU_BNNSDataType(a5);
    v20 = 0;
    *(_DWORD *)(a1 + 144) = v19;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 8 + 8 * v20) = objc_msgSend(v21, "unsignedIntegerValue");

      ++v20;
    }
    while (v18 != v20);
    *(_QWORD *)(a1 + 72) = 1;
    if (v18 >= 2)
    {
      v22 = (uint64_t *)(a1 + 80);
      v23 = 1;
      v24 = v17;
      do
      {
        v23 *= *(v22 - 9);
        *v22++ = v23;
        --v24;
      }
      while (v24);
    }
    if (v12)
      *(_QWORD *)(a1 + 136) = objc_msgSend(objc_retainAutorelease(v12), "bytes");
    *(_QWORD *)(a1 + 164) = 1065353216;
  }

  return v17 < 8;
}

unint64_t CPU_SetBatchStride(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  unint64_t v15;

  v1 = a1;
  objc_msgSend(v1, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v1, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v1, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 *= objc_msgSend(v11, "unsignedIntegerValue");

  }
  objc_msgSend(v1, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dataType");

  v14 = v5 >> 2;
  if (v13 != 1)
    v14 = v5;
  if (v13 == 3)
    v15 = v5 >> 1;
  else
    v15 = v14;

  return v15;
}

void convertDataLayout(void *a1, void *a2, void *a3, int a4, int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _DWORD *v35;
  _DWORD *v36;
  _DWORD *v37;
  _DWORD *v38;
  uint64_t m;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  _DWORD *v48;
  int *v49;
  _DWORD *v50;
  uint64_t j;
  int v52;
  uint64_t v53;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = v11;
  if (!v10 || !v11)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      convertDataLayout_cold_1((uint64_t)v9, v15);
    goto LABEL_11;
  }
  v13 = objc_msgSend(v10, "length");
  if (v13 != objc_msgSend(v12, "length"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      convertDataLayout_cold_4((uint64_t)v9, v15);
    goto LABEL_11;
  }
  v14 = objc_msgSend(v9, "tensorAllocationSizeInBytes");
  if (v14 > objc_msgSend(v10, "length"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      convertDataLayout_cold_2((uint64_t)v9, v15);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v9, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v9, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v9, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntegerValue");

  v53 = (uint64_t)v9;
  objc_msgSend(v9, "shape");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedIntegerValue");

  if (a4 || a5 != 1)
  {
    if (a4 != 1 || a5)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      v9 = (id)v53;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        convertDataLayout_cold_3(v53, v15);
      goto LABEL_11;
    }
    v40 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    v41 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v9 = (id)v53;
    if (v27)
    {
      for (i = 0; i != v27; ++i)
      {
        if (v21)
        {
          v43 = 0;
          v44 = v40;
          v45 = v41;
          do
          {
            if (v18)
            {
              v46 = 0;
              v47 = (int *)v44;
              v48 = (_DWORD *)v45;
              do
              {
                v49 = v47;
                v50 = v48;
                for (j = v24; j; --j)
                {
                  v52 = *v49++;
                  *v50 = v52;
                  v50 += v21 * v18;
                }
                ++v46;
                ++v48;
                v47 += v24;
              }
              while (v46 != v18);
            }
            ++v43;
            v45 += 4 * v18;
            v44 += 4 * v18 * v24;
          }
          while (v43 != v21);
        }
        v41 += 4 * v24 * v21 * v18;
        v40 += 4 * v21 * v18 * v24;
      }
    }
  }
  else
  {
    v28 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    v29 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v9 = (id)v53;
    if (v27)
    {
      for (k = 0; k != v27; ++k)
      {
        if (v21)
        {
          v31 = 0;
          v32 = v29;
          v33 = v28;
          do
          {
            if (v18)
            {
              v34 = 0;
              v35 = (_DWORD *)v32;
              v36 = (_DWORD *)v33;
              do
              {
                v37 = v35;
                v38 = v36;
                for (m = v24; m; --m)
                {
                  *v37++ = *v38;
                  v38 += v21 * v18;
                }
                ++v34;
                ++v36;
                v35 += v24;
              }
              while (v34 != v18);
            }
            ++v31;
            v33 += 4 * v18;
            v32 += 4 * v18 * v24;
          }
          while (v31 != v21);
        }
        v28 += 4 * v24 * v21 * v18;
        v29 += 4 * v21 * v18 * v24;
      }
    }
  }
LABEL_12:

}

void convertNCHWtoTNC(void *a1, unint64_t a2, uint64_t a3, _DWORD *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  unint64_t v24;
  void *v25;
  int v26;
  NSObject *v27;
  id v28;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;

  v5 = a1;
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v5, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v5, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  if (v16 == 1)
  {
    v28 = v5;
    objc_msgSend(v5, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "batchSizePerSequenceStep");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2)
    {
      v19 = 0;
      do
      {
        if (v31)
        {
          v20 = 0;
          v21 = a3;
          v33 = a4;
          do
          {
            v32 = v20;
            if (v12)
            {
              v22 = 0;
              v23 = v33;
              do
              {
                v24 = a2;
                if (v18)
                {
                  objc_msgSend(v18, "objectAtIndexedSubscript:", v22);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v25, "unsignedIntegerValue");

                }
                v26 = 0;
                if (v19 < v24)
                  v26 = *(_DWORD *)(v21 + 4 * v22);
                *v23 = v26;
                ++v22;
                v23 += v31 * a2;
              }
              while (v12 != v22);
            }
            v20 = v32 + 1;
            v21 += 4 * v12;
            ++v33;
          }
          while (v32 + 1 != v31);
        }
        ++v19;
        a3 += 4 * v31 * v12;
        a4 += v31;
      }
      while (v19 != a2);
    }

    v5 = v28;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      convertNCHWtoTNC_cold_1(v5, v27);

  }
}

void convertNSEtoTNC(void *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  _DWORD *v16;
  _DWORD *v17;
  uint64_t i;
  unint64_t v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;

  v22 = a1;
  objc_msgSend(v22, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v22, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v22, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "batchSizePerSequenceStep");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    v13 = 0;
    v26 = v25;
    do
    {
      if (v27)
      {
        v14 = 0;
        v15 = a3;
        v16 = a4;
        do
        {
          v28 = v15;
          v17 = v16;
          for (i = v25; i; --i)
          {
            v19 = a2;
            if (v12)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v20, "unsignedIntegerValue");

            }
            v21 = 0;
            if (v13 < v19)
              v21 = *v15;
            *v17++ = v21;
            ++v15;
          }
          ++v14;
          v16 += v25 * a2;
          v15 = &v28[v26];
        }
        while (v14 != v27);
      }
      ++v13;
      a4 = (_DWORD *)((char *)a4 + v26 * 4);
      a3 += v27 * v25;
    }
    while (v13 != a2);
  }

}

void convertTNCtoNC(void *a1, void *a2, uint64_t a3, _DWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  int *v28;
  _DWORD *v29;
  uint64_t i;
  int v31;
  id v32;

  v32 = a1;
  v7 = a2;
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v32, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v7, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v32, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "batchSizePerSequenceStep");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v15 - 1;
  if (v21)
  {
    objc_msgSend(v21, "objectAtIndexedSubscript:", v15 - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

    if (!v24)
      goto LABEL_9;
  }
  else
  {
    v24 = v11;
    if (!v11)
      goto LABEL_9;
  }
  v25 = 0;
  v26 = 4 * v19;
  v27 = (int *)(a3 + 4 * v11 * v19 * v22);
  do
  {
    v28 = v27;
    v29 = a4;
    for (i = v19; i; --i)
    {
      v31 = *v28++;
      *v29++ = v31;
    }
    ++v25;
    a4 = (_DWORD *)((char *)a4 + v26);
    v27 = (int *)((char *)v27 + v26);
  }
  while (v25 != v24);
LABEL_9:

}

void convertTNCtoNCHW(void *a1, void *a2, unint64_t a3, _DWORD *a4, _DWORD *a5, int a6)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  _DWORD *v27;
  int *v28;
  _DWORD *v29;
  int *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  int *v38;
  _DWORD *v39;
  uint64_t j;
  int v41;
  id v42;
  _DWORD *v43;

  v42 = a1;
  v11 = a2;
  objc_msgSend(v42, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v11, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v42, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "batchSizePerSequenceStep");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    if (v15)
    {
      v22 = v15;
      for (i = 0; i != v22; ++i)
      {
        v24 = a3;
        if (v21)
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", i);
          v43 = a4;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v25, "unsignedIntegerValue");

          v22 = v15;
          a4 = v43;
        }
        if (a3)
        {
          v26 = 0;
          v27 = a5;
          v28 = a4;
          do
          {
            if (v26 < v24 && v19)
            {
              v29 = v27;
              v30 = v28;
              v31 = v19;
              do
              {
                v32 = *v30++;
                *v29 = v32;
                v29 += v15;
                --v31;
              }
              while (v31);
            }
            ++v26;
            v28 += v19;
            v27 += v19 * v15;
          }
          while (v26 != a3);
        }
        a4 += v19 * a3;
        ++a5;
      }
    }
  }
  else
  {
    v33 = a3;
    if (v21)
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", v15 - 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v34, "unsignedIntegerValue");

    }
    if (v33)
    {
      v35 = 0;
      v36 = 4 * v19;
      v37 = &a4[v19 * a3 * (v15 - 1)];
      do
      {
        v38 = v37;
        v39 = a5;
        for (j = v19; j; --j)
        {
          v41 = *v38++;
          *v39++ = v41;
        }
        ++v35;
        a5 = (_DWORD *)((char *)a5 + v36);
        v37 = (int *)((char *)v37 + v36);
      }
      while (v35 != v33);
    }
  }

}

void convertTNCtoNTC(void *a1, void *a2, unint64_t a3, int *a4, _DWORD *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  int *v26;
  _DWORD *v27;
  int *v28;
  _DWORD *v29;
  uint64_t v30;
  int v31;
  void *v32;
  id v33;
  uint64_t v34;

  v33 = a1;
  v9 = a2;
  objc_msgSend(v33, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v32 = v9;
  objc_msgSend(v9, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v33, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "batchSizePerSequenceStep");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v13;
  if (v13)
  {
    v20 = 0;
    v21 = 4 * v17;
    v22 = 4 * v13 * v17;
    do
    {
      v23 = a3;
      if (v19)
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v24, "unsignedIntegerValue");

      }
      if (a3)
      {
        v25 = 0;
        v26 = a4;
        v27 = a5;
        do
        {
          if (v25 < v23 && v17)
          {
            v28 = v26;
            v29 = v27;
            v30 = v17;
            do
            {
              v31 = *v28++;
              *v29++ = v31;
              --v30;
            }
            while (v30);
          }
          ++v25;
          v27 = (_DWORD *)((char *)v27 + v22);
          v26 = (int *)((char *)v26 + v21);
        }
        while (v25 != a3);
      }
      ++v20;
      a5 = (_DWORD *)((char *)a5 + v21);
      a4 += v17 * a3;
    }
    while (v20 != v34);
  }

}

void convertHiddenBNNStoMLC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v22, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  if (v12)
  {
    v17 = 0;
    if (v16 / a5 <= 1)
      v18 = 1;
    else
      v18 = v16 / a5;
    do
    {
      v19 = 0;
      do
      {
        if (v16 >= a5)
        {
          v20 = 0;
          v21 = v18;
          do
          {
            *(_DWORD *)(a2 + 4 * (v20 + (v19 + v17 * a5) * (v16 / a5))) = *(_DWORD *)(a1
                                                                                    + 4
                                                                                    * (v20
                                                                                     + (v17 + (v19 + (a4 - 1) * a5)
                                                                                            * v12)
                                                                                     * (v16
                                                                                      / a5)));
            ++v20;
            --v21;
          }
          while (v21);
        }
        ++v19;
      }
      while (v19 != a5);
      ++v17;
    }
    while (v17 != v12);
  }

}

uint64_t convertNCtoTNC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  _BOOL4 v14;
  BOOL v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  if (result)
  {
    v6 = 0;
    v7 = a3 * a2;
    while (!a4)
    {
LABEL_20:
      ++v6;
      a6 += a3 * a2 * a4;
      if (v6 == result)
        return result;
    }
    v8 = 0;
    v9 = 0;
    v10 = a6;
    while (!a3)
    {
LABEL_19:
      ++v9;
      v8 += v7;
      v10 += a3 * a2;
      if (v9 == a4)
        goto LABEL_20;
    }
    v11 = 0;
    v12 = v10;
    while (!a2)
    {
LABEL_18:
      ++v11;
      v12 += a2;
      if (v11 == a3)
        goto LABEL_19;
    }
    v13 = 0;
    v14 = result - 1 == v6;
    v15 = v6 != 0;
    if ((v11 & 1) != 0)
      v14 = 0;
    else
      v15 = 1;
    v16 = v12;
    v17 = a2;
    v18 = v8;
    while (1)
    {
      if (v15)
      {
        v19 = 0;
        v20 = v18;
        if (!v14)
          goto LABEL_17;
      }
      else
      {
        v20 = v9 * v7 + v11 * a2 + v13;
      }
      v19 = *(_DWORD *)(a5 + 4 * v20);
LABEL_17:
      *v16++ = v19;
      ++v13;
      ++v18;
      if (!--v17)
        goto LABEL_18;
    }
  }
  return result;
}

id CPU_GetDeviceMemoryData(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "deviceMemory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "deviceIndex");

  objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t adjustBatchSizeForFC(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a1;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 4)
  {
    objc_msgSend(v3, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "unsignedIntegerValue") == 1)
    {
      objc_msgSend(v3, "descriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shape");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      if (v13 == 1)
        goto LABEL_11;
    }
    else
    {

    }
    v14 = 3;
  }
  else
  {
    v14 = v6 - 1;
    if ((unint64_t)(v6 - 1) < 2)
      goto LABEL_11;
  }
  v15 = 1;
  do
  {
    objc_msgSend(v3, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    a2 *= objc_msgSend(v18, "unsignedIntegerValue");

    ++v15;
  }
  while (v14 != v15);
LABEL_11:

  return a2;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

double sub_1D49A5524()
{
  return 0.00781250183;
}

double sub_1D49A5530()
{
  return 0.0078125;
}

double sub_1D49A553C()
{
  double result;

  *(_QWORD *)&result = 1065353216;
  return result;
}

double sub_1D49A5548()
{
  return 0.0000305175852;
}

unint64_t *hashCombine(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 4;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_10_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "dataType");
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;

  return v0;
}

id ANE_CreateUpsampleLayer(int a1, float a2, double a3)
{
  NSObject *v3;
  float v4;
  int8x8_t v6;
  uint8x8_t v8;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;

  if (a1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ANE_CreateUpsampleLayer_cold_3(v3);
LABEL_18:

    v11 = (void *)MEMORY[0x1E0C9AA60];
    return v11;
  }
  v4 = *(float *)&a3;
  LODWORD(a3) = vcvtms_s32_f32(a2);
  v6 = vcnt_s8(*(int8x8_t *)&a3);
  v6.i16[0] = vaddlv_u8((uint8x8_t)v6);
  if ((float)(int)floorf(a2) != a2 || v6.i32[0] >= 2u)
  {
    +[MLCLog framework](MLCLog, "framework");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ANE_CreateUpsampleLayer_cold_2();
    goto LABEL_18;
  }
  v6.i32[0] = vcvtms_s32_f32(v4);
  v8 = (uint8x8_t)vcnt_s8(v6);
  v8.i16[0] = vaddlv_u8(v8);
  if ((float)(int)floorf(v4) != v4 || v8.i32[0] >= 2u)
  {
    +[MLCLog framework](MLCLog, "framework");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ANE_CreateUpsampleLayer_cold_1();
    goto LABEL_18;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Conv"), kMLCANENetUnitType[0]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("ChannelWiseDeConv"), CFSTR("Type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("KernelGroupReuse"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Unity"), CFSTR("KernelMode"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9843FC0, CFSTR("KernelWidth"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9843FC0, CFSTR("KernelHeight"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9844A80, CFSTR("Step"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9843FD8, CFSTR("PadTop"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9843FF0, CFSTR("PadBot"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9843FD8, CFSTR("PadLeft"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9843FF0, CFSTR("PadRight"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Zero"), CFSTR("PaddingMode"));
  *(float *)&v14 = a2;
  *(float *)&v15 = v4;
  +[_MLCANEUpsampleParameters upsampleUnitParametersWith:scaleFactorX:scaleFactorY:](_MLCANEUpsampleParameters, "upsampleUnitParametersWith:scaleFactorX:scaleFactorY:", v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 16, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    objc_msgSend(v11, "addObject:", v17);

  return v11;
}

id ANE_CompileUpsampleLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *context;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v7, "parentLayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "params");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "dimensionCount");
  if (v15 == 4)
  {
    ANE_CreateUpsampleUnits(v13, v10, v12);
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = (void *)v43;
      v66 = v14;
      objc_msgSend(v8, "addObjectsFromArray:", v43);

      goto LABEL_26;
    }
    +[MLCLog framework](MLCLog, "framework");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      ANE_CompileUpsampleLayer_cold_4();

    v53 = 0;
  }
  else
  {
    v16 = v15;
    v67 = v5;
    if (v15 == 3)
    {
      v63 = v6;
      context = (void *)MEMORY[0x1D8263D2C]();
      v68 = 0;
      v69 = 0;
      v17 = +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:](_MLCANEPlistBuilder, "createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:", v10, &v69, &v68);
      v18 = v69;
      v19 = v68;
      v66 = v14;
      v64 = v19;
      if (v17)
      {
        v20 = v19;
        v59 = v13;
        objc_msgSend(v10, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("Name"));

        v62 = v18;
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v24);

        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v12;
        ANE_CreateUpsampleUnits(v60, v10, v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          v57 = v11;
          v58 = v7;
          if (objc_msgSend(v25, "count"))
          {
            v27 = 0;
            do
            {
              objc_msgSend(v26, "objectAtIndexedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "label");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("Name"));

              objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Name"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v71[0] = v32;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, CFSTR("Bottom"));

              objc_msgSend(v8, "addObject:", v28);
              ++v27;
            }
            while (v27 < objc_msgSend(v26, "count"));
          }
          objc_msgSend(v10, "label");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectAtIndexedSubscript:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("Name"));

          objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Name"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectAtIndexedSubscript:", 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("Bottom"));

          objc_msgSend(v62, "objectAtIndexedSubscript:", 1);
          v41 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v41);
          v42 = 0;
          v6 = v63;
          v11 = v57;
          v7 = v58;
          v13 = v59;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            ANE_CompileUpsampleLayer_cold_2();
          v42 = 1;
          v13 = v59;
          v6 = v63;
        }

        v12 = v61;
        v18 = v62;
        v54 = v60;
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          ANE_CompileUpsampleLayer_cold_3();
        v42 = 1;
      }

      objc_autoreleasePoolPop(context);
      v5 = v67;
      if (v42)
      {
        v53 = 0;
LABEL_27:
        v14 = v66;
        goto LABEL_28;
      }
LABEL_26:
      v53 = (void *)objc_msgSend(v8, "copy");
      goto LABEL_27;
    }
    v45 = v14;
    +[MLCLog framework](MLCLog, "framework");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      ANE_CompileUpsampleLayer_cold_1(v16, v46, v47, v48, v49, v50, v51, v52);

    v53 = 0;
    v14 = v45;
    v5 = v67;
  }
LABEL_28:

  return v53;
}

id ANE_CreateUpsampleUnits(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unint64_t v20;
  char v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  float v26;
  float v28;
  float v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1D8263D2C]();
  objc_msgSend(v7, "upsampleParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v5, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "dataType");

  ANE_GetANECIRDataTypeWithMLCDataType(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("KernelType"));
    v14 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v7, "scaleFactorX");
    v16 = log2f(v15);
    objc_msgSend(v7, "scaleFactorY");
    v18 = log2f(v17);
    v19 = v18;
    if (v16 < v18)
      v18 = v16;
    v20 = (unint64_t)v18;
    v53 = v8;
    if ((unint64_t)v18)
    {
      v57 = 0;
      v21 = ANE_CreateUpsampleUnitsWithParams(v10, v6, v14, (unint64_t)v18, 1, 1, v5, &v57);
      v22 = v57;
      v23 = v22;
      if ((v21 & 1) != 0)
      {
        v24 = v22;
        goto LABEL_15;
      }
      +[MLCLog framework](MLCLog, "framework");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        ANE_CreateUpsampleUnits_cold_5();

      v25 = 0;
    }
    else
    {
      v26 = fabsf(v19);
      if (fabsf(v16) >= 0.000001 || v26 >= 0.000001)
      {
        v24 = 0;
LABEL_15:
        v28 = v16 - (float)v20;
        v29 = v19 - (float)v20;
        if (v24)
          v30 = v24;
        else
          v30 = v5;
        v31 = v30;

        if (v28 != 0.0 || v29 == 0.0)
        {
          if (v28 == 0.0 || v29 != 0.0)
            goto LABEL_30;
          v32 = (void *)objc_msgSend(v10, "mutableCopy");
          v52 = v31;
          v41 = v6;
          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E9843FD8, CFSTR("KernelHeight"));
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Step"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_msgSend(v42, "mutableCopy");

          objc_msgSend(v43, "setObject:atIndexedSubscript:", &unk_1E9843FD8, 1);
          v50 = v43;
          v44 = objc_msgSend(v43, "copy");
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v44, CFSTR("Step"));

          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E9843FF0, CFSTR("PadTop"));
          v54 = v24;
          v37 = v41;
          v45 = v41;
          v31 = v52;
          LOBYTE(v44) = ANE_CreateUpsampleUnitsWithParams(v32, v45, v14, (unint64_t)v28, 1, 0, v52, &v54);
          v23 = v54;

          if ((v44 & 1) == 0)
          {
            +[MLCLog framework](MLCLog, "framework");
            v39 = objc_claimAutoreleasedReturnValue();
            v6 = v37;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              ANE_CreateUpsampleUnits_cold_4();
            goto LABEL_40;
          }
        }
        else
        {
          v32 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E9843FD8, CFSTR("KernelWidth"));
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Step"));
          v51 = v31;
          v33 = v6;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v34, "mutableCopy");

          objc_msgSend(v35, "setObject:atIndexedSubscript:", &unk_1E9843FD8, 0);
          v50 = v35;
          v36 = objc_msgSend(v35, "copy");
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("Step"));

          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E9843FF0, CFSTR("PadLeft"));
          v55 = v24;
          v37 = v33;
          v38 = v33;
          v31 = v51;
          LOBYTE(v36) = ANE_CreateUpsampleUnitsWithParams(v32, v38, v14, (unint64_t)v29, 0, 1, v51, &v55);
          v23 = v55;

          if ((v36 & 1) == 0)
          {
            +[MLCLog framework](MLCLog, "framework");
            v39 = objc_claimAutoreleasedReturnValue();
            v6 = v37;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              ANE_CreateUpsampleUnits_cold_3();
LABEL_40:

            v25 = 0;
            goto LABEL_41;
          }
        }

        v24 = v23;
        v6 = v37;
LABEL_30:
        v25 = -[NSObject copy](v14, "copy");
        v23 = v24;
LABEL_41:

        v5 = v31;
        v8 = v53;
        goto LABEL_42;
      }
      v46 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E9843FD8, CFSTR("KernelWidth"));
      objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E9843FD8, CFSTR("KernelHeight"));
      objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E9844A98, CFSTR("Step"));
      objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E9843FF0, CFSTR("PadLeft"));
      objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E9843FF0, CFSTR("PadTop"));
      v56 = 0;
      v47 = ANE_CreateUpsampleUnitsWithParams(v46, v6, v14, 1uLL, 0, 0, v5, &v56);
      v23 = v56;
      if ((v47 & 1) != 0)
      {
        v25 = -[NSObject copy](v14, "copy");
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          ANE_CreateUpsampleUnits_cold_2();

        v25 = 0;
      }

    }
    v31 = v5;
    goto LABEL_41;
  }
  +[MLCLog framework](MLCLog, "framework");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    ANE_CreateUpsampleUnits_cold_1((uint64_t)v5, v12, v14);
  v25 = 0;
LABEL_42:

  objc_autoreleasePoolPop(v8);
  return v25;
}

uint64_t ANE_CreateUpsampleUnitsWithParams(void *a1, void *a2, void *a3, unint64_t a4, char a5, char a6, void *a7, _QWORD *a8)
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  NSObject *v52;
  id v55;
  id v56;
  unint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  char v63;
  char v64;
  unint64_t v65;
  BOOL v66;
  id v67;
  _QWORD v68[4];
  void *v69;
  _QWORD v70[4];
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v56 = a1;
  v14 = a2;
  v15 = a3;
  v67 = 0;
  v61 = a7;
  ANE_GetTensor4DShapeWithBatchFirst(v61, &v67);
  v16 = v67;
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  v55 = v16;
  v21 = v16;
  v22 = a4;
  objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntegerValue");

  if (!v22)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v44;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v45;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v46;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v61;
    objc_msgSend(v61, "descriptor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v27, objc_msgSend(v49, "dataType"));
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v50 = 1;
    v51 = v55;
    goto LABEL_16;
  }
  v66 = 0;
  v25 = 0;
  v63 = a6;
  v64 = a5;
  v65 = v22 - 1;
  v58 = v14;
  v59 = v15;
  v57 = v22;
  while (1)
  {
    if (v25)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "mutableCopy");
    }
    else
    {
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v14, v56);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("OutputChannels"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("NumGroups"));
    }

    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "label");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@_%lu"), v30, objc_msgSend(v15, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("Name"));

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Name"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, CFSTR("Bottom"));

    }
    if (v65 != v25)
      goto LABEL_11;
    v35 = (void *)MEMORY[0x1D8263D2C]();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v36;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v38;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "descriptor");
    v41 = objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v40, objc_msgSend((id)v41, "dataType"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = ANE_ValidateConvolutionUnit(v43, v27, 0);

    if ((v41 & 1) == 0)
      break;

    objc_autoreleasePoolPop(v35);
    v14 = v58;
    v15 = v59;
    v22 = v57;
LABEL_11:
    objc_msgSend(v15, "addObject:", v27);
    v24 <<= v64;
    v20 <<= v63;

    v66 = ++v25 >= v22;
    if (v22 == v25)
      goto LABEL_12;
  }
  +[MLCLog framework](MLCLog, "framework");
  v52 = objc_claimAutoreleasedReturnValue();
  v14 = v58;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    ANE_CreateUpsampleUnitsWithParams_cold_1();

  objc_autoreleasePoolPop(v35);
  v15 = v59;
  v48 = v61;
  v51 = v55;
  v50 = v66;
LABEL_16:

  return v50 & 1;
}

uint64_t missingMPSGraphActivationType(unsigned int a1)
{
  return (a1 < 0x15) & (0x1FFFF4u >> a1);
}

BOOL activationIsFusableWithMPSGraph(void *a1)
{
  id v1;
  unsigned int v2;
  float v3;
  _BOOL8 v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "activationType") - 2;
  v4 = 0;
  if (v2 >= 0x13 || ((0x7FFFDu >> v2) & 1) == 0)
  {
    objc_msgSend(v1, "a");
    if (v3 == 0.0 || objc_msgSend(v1, "activationType") != 1)
      v4 = 1;
  }

  return v4;
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id ANE_CreateSliceLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v48;
  id v49;
  NSObject *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v11), "unsignedIntegerValue") != 1)
        {
          +[MLCLog framework](MLCLog, "framework");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            ANE_CreateSliceLayer_cold_3(v13, v17, v18, v19, v20, v21, v22, v23);
          v24 = (void *)MEMORY[0x1E0C9AA60];
          v12 = v7;
          goto LABEL_34;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = (void *)objc_msgSend(v5, "mutableCopy");
  v13 = objc_msgSend(v6, "mutableCopy");
  v14 = (void *)objc_msgSend(v7, "mutableCopy");
  v15 = objc_msgSend(v5, "count");
  switch(v15)
  {
    case 4:
      goto LABEL_20;
    case 3:
      objc_msgSend(v12, "insertObject:atIndex:", &unk_1E9844008, 0);
      -[NSObject insertObject:atIndex:](v13, "insertObject:atIndex:", &unk_1E9844020, 0);
      objc_msgSend(v14, "insertObject:atIndex:", &unk_1E9844020, 0);
LABEL_20:
      v48 = v5;
      v49 = v6;
      v50 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      if (objc_msgSend(v12, "count"))
      {
        v25 = 0;
        while (1)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "unsignedIntegerValue");

          -[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "unsignedIntegerValue");
          objc_msgSend(v12, "objectAtIndexedSubscript:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "unsignedIntegerValue");

          v32 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
          objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("InputView"), kMLCANENetUnitType[0]);
          ANE_GetANECIRDimension(v25);
          v33 = objc_claimAutoreleasedReturnValue();
          if (!v33)
            break;
          v34 = (void *)v33;
          v35 = (v29 + ~v31) / v27 + 1;
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("Dimension"));
          objc_msgSend(v12, "objectAtIndexedSubscript:", v25);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("Offset"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, CFSTR("Size"));

          v38 = (void *)objc_msgSend(v32, "copy");
          -[NSObject addObject:](v50, "addObject:", v38);

          if (++v25 >= objc_msgSend(v12, "count"))
            goto LABEL_24;
        }
        +[MLCLog framework](MLCLog, "framework");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          ANE_CreateSliceLayer_cold_2(v39, v40, v41, v42, v43, v44, v45, v46);
        v24 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
LABEL_24:
        v24 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        +[_MLCANESliceParameters sliceUnitParametersWith:](_MLCANESliceParameters, "sliceUnitParametersWith:", v50);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 33, v32);
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39)
          objc_msgSend(v24, "addObject:", v39);
      }
      v5 = v48;

      v6 = v49;
      goto LABEL_33;
    case 2:
      if (objc_msgSend(v5, "count") != 4)
      {
        v16 = 0;
        do
        {
          objc_msgSend(v12, "insertObject:atIndex:", &unk_1E9844008, 0);
          -[NSObject insertObject:atIndex:](v13, "insertObject:atIndex:", &unk_1E9844020, 0);
          objc_msgSend(v14, "insertObject:atIndex:", &unk_1E9844020, 0);
          ++v16;
        }
        while (v16 < 4 - objc_msgSend(v5, "count"));
      }
      goto LABEL_20;
  }
  +[MLCLog framework](MLCLog, "framework");
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    ANE_CreateSliceLayer_cold_1(v5, v50);
  v24 = (void *)MEMORY[0x1E0C9AA60];
LABEL_33:

LABEL_34:
  return v24;
}

id ANE_CompileSliceLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "parentLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v5;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "params");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sliceParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v36 = v6;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v13, &v41);
  v39 = v41;

  v40 = 0;
  v35 = v7;
  ANE_GetTensor4DShapeWithOnePrepended(v7, &v40);
  v38 = v40;
  if (!objc_msgSend(v11, "count"))
  {
    v37 = 0;
LABEL_15:
    v26 = v37;
    if (!objc_msgSend(v12, "count"))
      objc_msgSend(v12, "addObject:", v37);
    v27 = (void *)objc_msgSend(v12, "copy");
    v29 = v33;
    v28 = v34;
    v30 = v35;
    goto LABEL_23;
  }
  v37 = 0;
  v14 = 0;
  while (1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v12, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("Name"));
    if ((unint64_t)(v14 - 1) >= 3)
      break;
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Name"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v42[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("Bottom"));

    }
    if (v14 == 2)
    {
      v22 = v18;

      v37 = v22;
    }
LABEL_9:
    objc_msgSend(v39, "objectAtIndexedSubscript:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToNumber:", v24);

    if ((v25 & 1) == 0)
    {
      if ((ANE_ValidateInputViewUnit(v36, v18, 1) & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          ANE_CompileSliceLayer_cold_2((uint64_t)v18, (uint64_t)v9, v31);
        goto LABEL_22;
      }
      objc_msgSend(v12, "addObject:", v18);
    }

    if (++v14 >= (unint64_t)objc_msgSend(v11, "count"))
      goto LABEL_15;
  }
  if (!v14)
    goto LABEL_9;
  +[MLCLog framework](MLCLog, "framework");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    ANE_CompileSliceLayer_cold_1();
LABEL_22:
  v29 = v33;

  v27 = 0;
  v28 = v34;
  v30 = v35;
  v26 = v37;
LABEL_23:

  return v27;
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id ANE_CreateComparisonLayer(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  void *v13;
  __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C9AA60];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v4 = (void *)objc_msgSend(v2, "mutableCopy");
  v14 = kMLCANENetUnitType[0];
  v15[0] = CFSTR("ElementWise");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  switch(a1)
  {
    case 0:
      v7 = CFSTR("Equal");
      goto LABEL_14;
    case 1:
    case 11:
      v7 = CFSTR("NotEqual");
      goto LABEL_14;
    case 2:
      v7 = CFSTR("LessThan");
      goto LABEL_14;
    case 3:
      v7 = CFSTR("GreaterThan");
      goto LABEL_14;
    case 4:
      v7 = CFSTR("LessThanEqual");
      goto LABEL_14;
    case 5:
      v7 = CFSTR("GreaterThanEqual");
      goto LABEL_14;
    case 6:
      v7 = CFSTR("Mult");
      goto LABEL_14;
    case 7:
      v7 = CFSTR("Add");
      goto LABEL_14;
    case 8:
      v7 = CFSTR("EqualZero");
LABEL_14:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("Type"));
      goto LABEL_15;
    case 9:
      v12 = CFSTR("Mult");
      goto LABEL_21;
    case 10:
      v12 = CFSTR("Add");
LABEL_21:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("Type"));
      objc_msgSend(v4, "addObject:", v6);
      v13 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("EqualZero"), CFSTR("Type"));
      v6 = v13;
LABEL_15:
      objc_msgSend(v4, "addObject:", v6);
      +[_MLCANEArithmeticParameters arithmeticUnitParametersWith:](_MLCANEArithmeticParameters, "arithmeticUnitParametersWith:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 34, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v3, "addObject:", v10);
      v9 = (void *)objc_msgSend(v3, "copy");

      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        ANE_CreateComparisonLayer_cold_1();
      v9 = (void *)MEMORY[0x1E0C9AA60];
      break;
  }

  return v9;
}

id ANE_CompileComparisonLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  unsigned int v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  __int16 v85;
  id v86;
  void *v87;
  _QWORD v88[2];

  v88[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "parentLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "params");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arithmeticParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v15 = objc_msgSend(v9, "operation");
  v85 = 0;
  v80 = (void *)objc_msgSend(v13, "mutableCopy");
  if (objc_msgSend(v6, "count") != 2)
  {
LABEL_10:
    if (v15 > 0xB)
    {
      +[MLCLog framework](MLCLog, "framework");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        ANE_CompileComparisonLayer_cold_1();
    }
    else if (((1 << v15) & 0x8FF) != 0)
    {
      if (objc_msgSend(v12, "count") == 1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v32 = v14;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v32;
        if ((ANE_ConnectBroadcastUnits(v34, v32, v9, &v85, v80) & 1) != 0)
        {
LABEL_14:

          v35 = (void *)objc_msgSend(v14, "copy");
          goto LABEL_34;
        }
        +[MLCLog framework](MLCLog, "framework");
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
LABEL_24:
        ANE_CompileComparisonLayer_cold_2(v47, v48, v49, v50, v51, v52, v53, v54);
LABEL_25:

        goto LABEL_26;
      }
      +[MLCLog framework](MLCLog, "framework");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        ANE_CompileComparisonLayer_cold_3();
    }
    else if (((1 << v15) & 0x600) != 0)
    {
      if (objc_msgSend(v12, "count") == 2)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v74 = v14;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v37);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v74;
        if ((ANE_ConnectBroadcastUnits(v34, v74, v9, &v85, v80) & 1) != 0)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "label");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v74, "count"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, CFSTR("Name"));

          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Name"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v88[0] = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, CFSTR("Bottom"));

          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("OutputType"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v44;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
          v45 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v45, CFSTR("InputType"));

          v86 = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v45) = ANE_ValidateElementWiseUnit(v46, v39, 1);

          if ((v45 & 1) == 0)
          {
            +[MLCLog framework](MLCLog, "framework");
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              ANE_CompileComparisonLayer_cold_4();

            v35 = 0;
            goto LABEL_33;
          }
          v14 = v74;
          objc_msgSend(v74, "addObject:", v39);

          goto LABEL_14;
        }
        +[MLCLog framework](MLCLog, "framework");
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        goto LABEL_24;
      }
      +[MLCLog framework](MLCLog, "framework");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        ANE_CompileComparisonLayer_cold_8();
    }
    else
    {
      if (objc_msgSend(v12, "count") == 1)
      {
        v64 = v14;
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v65);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if ((ANE_ValidateElementWiseUnit(v6, v34, 1) & 1) != 0)
        {
          v14 = v64;
          objc_msgSend(v64, "addObject:", v34);
          goto LABEL_14;
        }
        +[MLCLog framework](MLCLog, "framework");
        v47 = objc_claimAutoreleasedReturnValue();
        v14 = v64;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          ANE_CompileComparisonLayer_cold_4();
        goto LABEL_25;
      }
      +[MLCLog framework](MLCLog, "framework");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        ANE_CompileComparisonLayer_cold_5(v36, v66, v67, v68, v69, v70, v71, v72);
    }

LABEL_26:
    v35 = 0;
    goto LABEL_34;
  }
  v75 = v15;
  v78 = v7;
  v79 = v12;
  v76 = v5;
  v77 = v10;
  v84 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v7, &v84);
  v16 = v84;
  if (!objc_msgSend(v6, "count"))
  {
LABEL_9:

    v5 = v76;
    v10 = v77;
    v7 = v78;
    v12 = v79;
    v15 = v75;
    goto LABEL_10;
  }
  v17 = 0;
  v18 = 0x1E981F000uLL;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(v18 + 3072);
    v82 = 0;
    v83 = 0;
    v21 = objc_msgSend(v20, "createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:", v19, v16, v9, &v83, &v82);
    v22 = v83;
    v23 = v82;
    if (v21 == 1)
      goto LABEL_8;
    if (v21 != 2)
      break;
    if (!v22)
    {
      v74 = v14;
      +[MLCLog framework](MLCLog, "framework");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        ANE_CompileComparisonLayer_cold_10(v55, v56, v57, v58, v59, v60, v61, v62);
      v22 = 0;
      goto LABEL_32;
    }
    *((_BYTE *)&v85 + v17) = 1;
    objc_msgSend(v9, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v14, "count"));
    v81 = v23;
    v25 = v19;
    v26 = v16;
    v27 = v18;
    v28 = v6;
    v29 = v9;
    v30 = v14;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, CFSTR("Name"));

    v14 = v30;
    v9 = v29;
    v6 = v28;
    v18 = v27;
    v16 = v26;
    v19 = v25;
    v23 = v81;

    objc_msgSend(v14, "addObject:", v22);
    objc_msgSend(v80, "addObject:", v81);
LABEL_8:

    if (++v17 >= (unint64_t)objc_msgSend(v6, "count"))
      goto LABEL_9;
  }
  v74 = v14;
  +[MLCLog framework](MLCLog, "framework");
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    ANE_CompileComparisonLayer_cold_9();
LABEL_32:
  v5 = v76;
  v12 = v79;

  v35 = 0;
  v10 = v77;
  v7 = v78;
LABEL_33:
  v14 = v74;
LABEL_34:

  return v35;
}

uint64_t ANE_ConnectBroadcastUnits(void *a1, void *a2, void *a3, _BYTE *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "sourceTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Bottom"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a4[1];
  if (!*a4)
  {
    if (!a4[1])
    {
      v22 = v13;
      goto LABEL_9;
    }
    objc_msgSend(v11, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v10, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("Name"));

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "label");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:atIndexedSubscript:", v26, 0);

    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Name"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:atIndexedSubscript:", v28, 1);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v29;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v30;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = v39;
LABEL_7:
    objc_msgSend(v31, "arrayWithObjects:count:", v32, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v11, "label");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v10, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("Name"));

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Name"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:atIndexedSubscript:", v19, 0);

  if (!v15)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "label");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:atIndexedSubscript:", v34, 1);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v29;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v30;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = v40;
    goto LABEL_7;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Name"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:atIndexedSubscript:", v21, 1);

  v22 = v12;
LABEL_9:
  v35 = v22;
LABEL_10:
  v36 = ANE_ValidateElementWiseUnit(v35, v9, 1);
  if ((v36 & 1) != 0)
  {
    objc_msgSend(v10, "addObject:", v9);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      ANE_ConnectBroadcastUnits_cold_1();

  }
  return v36;
}

id ANE_CreateReshapeLayer()
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 18, MEMORY[0x1E0C9AA70]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ANE_CompileReshapeLayer(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "parentLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Reshape"), kMLCANENetUnitType[0]);
  objc_msgSend(v5, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v10, "count"))
  {
    case 1:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9844038, CFSTR("ReshapedBatch"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9844038, CFSTR("ReshapedChannel"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9844038, CFSTR("ReshapedHeight"));
      v11 = 0;
      goto LABEL_8;
    case 2:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9844038, CFSTR("ReshapedBatch"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9844038, CFSTR("ReshapedChannel"));
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("ReshapedHeight"));

      v11 = 1;
      goto LABEL_8;
    case 3:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9844038, CFSTR("ReshapedBatch"));
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("ReshapedChannel"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("ReshapedHeight"));

      v11 = 2;
      goto LABEL_8;
    case 4:
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("ReshapedBatch"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("ReshapedChannel"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("ReshapedHeight"));

      v11 = 3;
LABEL_8:
      objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("ReshapedWidth"));

      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v7, v8);
      v12 = objc_claimAutoreleasedReturnValue();
      if ((ANE_ValidateReshapeUnit(v4, v12, 1) & 1) != 0)
      {
        v23[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          ANE_CompileReshapeLayer_cold_2();

LABEL_13:
        v20 = 0;
      }

      return v20;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ANE_CompileReshapeLayer_cold_1();
      goto LABEL_13;
  }
}

id GPU_CreateOptimizerDeviceDataForTensor(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v49 = a2;
  v54 = a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v5, "deviceList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    v10 = 0x1E0C99000uLL;
    v50 = v6;
    v51 = v5;
    while (1)
    {
      objc_msgSend(v5, "deviceList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v9;
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[MLCTensorOptimizerDeviceData optimizerDeviceData](MLCTensorOptimizerDeviceData, "optimizerDeviceData");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v14 = v54;
      if (objc_msgSend(v54, "count"))
      {
        v15 = 0;
        do
        {
          v16 = *(void **)(v10 + 3408);
          objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "bytes");
          objc_msgSend(v54, "objectAtIndexedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dataWithBytesNoCopy:length:freeWhenDone:", v18, objc_msgSend(v19, "length"), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(v20, "length");
          v22 = objc_retainAutorelease(v20);
          v23 = (void *)objc_msgSend(v12, "newBufferWithBytes:length:options:", objc_msgSend(v22, "bytes"), v21, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
          objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, v21 >> 2, v21, 268435488);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v23, v24);
          objc_msgSend(v13, "setObject:atIndexedSubscript:", v25, v15);

          v14 = v54;
          v10 = 0x1E0C99000;

          ++v15;
        }
        while (v15 < objc_msgSend(v54, "count"));
      }
      if (!objc_msgSend(v13, "count"))
        break;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setMomentumVectors:", v27);

      if ((unint64_t)objc_msgSend(v13, "count") >= 2)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setVelocityVectors:", v29);

        if ((unint64_t)objc_msgSend(v13, "count") >= 3)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setCenterWeightVectors:", v31);

        }
      }
      +[MLCGPUDeviceOps deviceOps](MLCGPUDeviceOps, "deviceOps");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v51;
      if (v32)
      {
        objc_msgSend(v51, "deviceList");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v34 >= 2)
        {
          +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          GPU_AllocateResourceForMultiGPUTraining(v51, v35, v36, v52);

          v32 = v35;
        }
      }
      v6 = v50;
      objc_msgSend(v53, "setGpuOps:", v32);
      objc_msgSend(v50, "addObject:", v53);

      v9 = v52 + 1;
      objc_msgSend(v51, "deviceList");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      v10 = 0x1E0C99000;
      if (v52 + 1 >= v38)
        goto LABEL_14;
    }
    +[MLCLog framework](MLCLog, "framework");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      GPU_CreateOptimizerDeviceDataForTensor_cold_1(v40, v41, v42, v43, v44, v45, v46, v47);

    v39 = (void *)MEMORY[0x1E0C9AA60];
    v6 = v50;
    v5 = v51;
  }
  else
  {
LABEL_14:
    v39 = (void *)objc_msgSend(v6, "copy");
  }

  return v39;
}

id GPU_CreateOptimizerDeviceVectorDataForTensor(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v4, "deviceList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    v40 = v6;
    v41 = v4;
    while (1)
    {
      objc_msgSend(v4, "deviceList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v9;
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[MLCTensorOptimizerDeviceData optimizerDeviceData](MLCTensorOptimizerDeviceData, "optimizerDeviceData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      if (objc_msgSend(v5, "count"))
      {
        v14 = 0;
        do
        {
          v15 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "bytes");
          objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dataWithBytesNoCopy:length:freeWhenDone:", v17, objc_msgSend(v18, "length"), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          GPU_AllocateMemoryForMomentum(v11, v19, 268435488);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:atIndexedSubscript:", v20, v14);

          ++v14;
        }
        while (v14 < objc_msgSend(v5, "count"));
      }
      if (!objc_msgSend(v13, "count"))
        break;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMomentumVectors:", v22);

      v6 = v40;
      if ((unint64_t)objc_msgSend(v13, "count") >= 2)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setVelocityVectors:", v24);

        if ((unint64_t)objc_msgSend(v13, "count") >= 3)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setCenterWeightVectors:", v26);

        }
      }
      +[MLCGPUDeviceOps deviceOps](MLCGPUDeviceOps, "deviceOps");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setGpuOps:", v27);
      objc_msgSend(v40, "addObject:", v12);

      v4 = v41;
      v9 = v42 + 1;
      objc_msgSend(v41, "deviceList");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v42 + 1 >= v29)
        goto LABEL_11;
    }
    +[MLCLog framework](MLCLog, "framework");
    v31 = objc_claimAutoreleasedReturnValue();
    v6 = v40;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      GPU_CreateOptimizerDeviceVectorDataForTensor_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);

    v30 = (void *)MEMORY[0x1E0C9AA60];
    v4 = v41;
  }
  else
  {
LABEL_11:
    v30 = (void *)objc_msgSend(v6, "copy");
  }

  return v30;
}

id ANE_BuildArithmeticParams(int a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  switch(a1)
  {
    case 0:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Add");
      goto LABEL_20;
    case 1:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Sub");
      goto LABEL_20;
    case 2:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Mult");
      goto LABEL_20;
    case 3:
      v5 = (void *)MEMORY[0x1E0C9AA70];
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Inv"), CFSTR("Type"));
      v6 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      v7 = CFSTR("Mult");
      v8 = v6;
      goto LABEL_13;
    case 7:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Sqrt");
      goto LABEL_20;
    case 8:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Rsqrt");
      goto LABEL_20;
    case 17:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Tanh");
      goto LABEL_20;
    case 22:
      v11 = (void *)MEMORY[0x1E0C9AA70];
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
      v19 = 1069066811;
      v18 = 0;
      ANE_ConvertFp32ToInt16((uint64_t)&v19, &v18);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ScaleScalar"));

      v6 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      v7 = CFSTR("Exp2");
      v8 = v6;
LABEL_13:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("Type"));
      goto LABEL_16;
    case 23:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Exp2");
      goto LABEL_20;
    case 24:
      v13 = (void *)MEMORY[0x1E0C9AA70];
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Log2"), CFSTR("Type"));
      v6 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
      v17 = 1060205080;
      v16 = 0;
      ANE_ConvertFp32ToInt16((uint64_t)&v17, &v16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("ScaleScalar"));

LABEL_16:
      objc_msgSend(v2, "addObject:", v3);
      objc_msgSend(v2, "addObject:", v6);

      goto LABEL_21;
    case 25:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Log2");
      goto LABEL_20;
    case 28:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Min");
      goto LABEL_20;
    case 29:
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ElementWise"), kMLCANENetUnitType[0]);
      v4 = CFSTR("Max");
LABEL_20:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Type"));
      objc_msgSend(v2, "addObject:", v3);
LABEL_21:

      v10 = (void *)objc_msgSend(v2, "copy");
      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_BuildArithmeticParams_cold_1();

      v10 = 0;
      break;
  }

  return v10;
}

id ANE_CreateArithmeticLayer(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  ANE_BuildArithmeticParams(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[_MLCANEArithmeticParameters arithmeticUnitParametersWith:](_MLCANEArithmeticParameters, "arithmeticUnitParametersWith:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v2, "addObject:", v5);
    v6 = v2;

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ANE_CreateArithmeticLayer_cold_1();

    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

id ANE_CreateUnitsWithArithmeticOpeartion(int a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  char v129;
  NSObject *v130;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  int v171;
  id v172;
  void *v173;
  void *v174;
  id v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  id v182;
  id v183;
  id v184;
  __int16 v185;
  void *v186;
  void *v187;
  void *v188;
  _QWORD v189[2];
  _QWORD v190[2];
  void *v191;
  void *v192;
  void *v193;
  _QWORD v194[2];
  _QWORD v195[2];
  _QWORD v196[2];
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  _QWORD v202[2];
  _QWORD v203[2];
  _QWORD v204[2];
  void *v205;
  void *v206;
  void *v207;
  _QWORD v208[2];
  _QWORD v209[2];
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  _QWORD v215[2];
  _QWORD v216[4];

  v216[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v5, "sourceTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v185 = 0;
  v180 = (void *)objc_msgSend(v7, "mutableCopy");
  v179 = v9;
  if (objc_msgSend(v9, "count") != 2)
  {
LABEL_10:
    if (a1 <= 21)
    {
      if (a1 >= 3)
      {
        if (a1 == 3)
        {
          if (objc_msgSend(v6, "count") == 2)
          {
            v174 = v11;
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "label");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("Name"));

            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v172 = v5;
            objc_msgSend(v5, "label");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count") + 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("Name"));

            v181 = 0;
            objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            ANE_GetTensorFeatureChannelsWithOnePrepended(v29, &v181);

            v176 = v6;
            v178 = v8;
            if ((_BYTE)v185 && HIBYTE(v185))
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = v8;
              v32 = (void *)v30;
              objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("InputType"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v214 = v35;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v214, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("InputType"));

              objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "label");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v213 = v38;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v213, 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("Bottom"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v181);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v40, CFSTR("OutputChannels"));

              objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v212 = v41;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v212, 1);
              v170 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("OutputType"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v211 = v42;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v211, 1);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v43, CFSTR("InputType"));

              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Name"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v210 = v44;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v210, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v45, CFSTR("Bottom"));

              objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("OutputType"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v209[0] = v46;
              objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("OutputType"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v209[1] = v47;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 2);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v48, CFSTR("InputType"));

              objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Name"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v208[0] = v49;
              objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Name"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v208[1] = v50;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 2);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v51, CFSTR("Bottom"));

              v9 = v179;
              v52 = v180;

            }
            else
            {
              v108 = v26;
              if ((_BYTE)v185)
              {
                objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("InputType"));
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "objectAtIndexedSubscript:", 1);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                v207 = v111;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v207, 1);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v112, CFSTR("InputType"));

                objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "label");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v206 = v114;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v206, 1);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v115, CFSTR("Bottom"));

                objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v205 = v116;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v205, 1);
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("OutputType"));
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                v204[0] = v117;
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("OutputType"));
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                v204[1] = v118;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v204, 2);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v119, CFSTR("InputType"));

                objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("Name"));
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v203[0] = v120;
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Name"));
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v203[1] = v121;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 2);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v122, CFSTR("Bottom"));

                v9 = v179;
                objc_msgSend(v180, "objectAtIndexedSubscript:", 0);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v202[0] = v123;
                objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v202[1] = v124;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v202, 2);
                v52 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_71;
              }
              if (!HIBYTE(v185))
              {
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("InputType"));
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v154, "objectAtIndexedSubscript:", 1);
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                v193 = v155;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v193, 1);
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v156, CFSTR("InputType"));

                objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v157, "label");
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                v192 = v158;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v192, 1);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v159, CFSTR("Bottom"));

                objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                v191 = v160;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
                v161 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("InputType"));
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "objectAtIndexedSubscript:", 0);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                v190[0] = v163;
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("OutputType"));
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                v190[1] = v164;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 2);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v165, CFSTR("InputType"));

                objc_msgSend(v179, "objectAtIndexedSubscript:", 0);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "label");
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v189[0] = v167;
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Name"));
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                v189[1] = v168;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2);
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v169, CFSTR("Bottom"));

                v9 = v179;
                v53 = (void *)v161;

                v52 = v179;
                goto LABEL_71;
              }
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("InputType"));
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v132, "objectAtIndexedSubscript:", 1);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v201 = v133;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v201, 1);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v134, CFSTR("InputType"));

              objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "label");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v200 = v136;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v200, 1);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v137, CFSTR("Bottom"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v181);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v138, CFSTR("OutputChannels"));

              objc_msgSend(v179, "objectAtIndexedSubscript:", 1);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v199 = v139;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v199, 1);
              v170 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("OutputType"));
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v198 = v140;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v198, 1);
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v141, CFSTR("InputType"));

              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Name"));
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              v197 = v142;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v143, CFSTR("Bottom"));

              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("InputType"));
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "objectAtIndexedSubscript:", 0);
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              v196[0] = v145;
              objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("OutputType"));
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v196[1] = v146;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 2);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setObject:forKeyedSubscript:", v147, CFSTR("InputType"));

              v26 = v108;
              objc_msgSend(v179, "objectAtIndexedSubscript:", 0);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "label");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v195[0] = v149;
              objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Name"));
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              v195[1] = v150;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2);
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setObject:forKeyedSubscript:", v151, CFSTR("Bottom"));

              v9 = v179;
              objc_msgSend(v179, "objectAtIndexedSubscript:", 0);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              v194[0] = v152;
              objc_msgSend(v180, "objectAtIndexedSubscript:", 0);
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              v194[1] = v153;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 2);
              v52 = (id)objc_claimAutoreleasedReturnValue();

            }
            v53 = (void *)v170;
LABEL_71:
            v5 = v172;
            v125 = v53;
            if ((ANE_ValidateNeuronUnit(v53, v22, 1) & 1) != 0)
            {
              v8 = v178;
              objc_msgSend(v178, "addObject:", v22);
              v6 = v176;
              if ((ANE_ValidateElementWiseUnit(v52, v26, 1) & 1) != 0)
              {
                objc_msgSend(v178, "addObject:", v26);

                v11 = v174;
                goto LABEL_65;
              }
              +[MLCLog framework](MLCLog, "framework");
              v130 = objc_claimAutoreleasedReturnValue();
              v11 = v174;
              if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
                ANE_CreateUnitsWithArithmeticOpeartion_cold_4();
            }
            else
            {
              +[MLCLog framework](MLCLog, "framework");
              v130 = objc_claimAutoreleasedReturnValue();
              v6 = v176;
              v8 = v178;
              if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
                ANE_CreateUnitsWithArithmeticOpeartion_cold_7();
              v11 = v174;
            }

            goto LABEL_95;
          }
          +[MLCLog framework](MLCLog, "framework");
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            ANE_CreateUnitsWithArithmeticOpeartion_cold_8();
LABEL_33:

LABEL_96:
          v100 = 0;
          goto LABEL_97;
        }
        goto LABEL_40;
      }
LABEL_26:
      if (objc_msgSend(v6, "count") != 1)
      {
        +[MLCLog framework](MLCLog, "framework");
        v77 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        goto LABEL_32;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v67);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Bottom"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_BYTE)v185 && HIBYTE(v185))
      {
        objc_msgSend(v5, "label");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v70, CFSTR("Name"));

        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Name"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:atIndexedSubscript:", v72, 0);

        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("Name"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:atIndexedSubscript:", v74, 1);

        v75 = v180;
LABEL_30:
        v76 = v75;
LABEL_62:
        if ((ANE_ValidateElementWiseUnit(v76, v22, 1) & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v107 = objc_claimAutoreleasedReturnValue();
          v9 = v179;
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
            ANE_CreateUnitsWithArithmeticOpeartion_cold_4();

          goto LABEL_95;
        }
        objc_msgSend(v8, "addObject:", v22);

LABEL_64:
        v9 = v179;
        goto LABEL_65;
      }
      if ((_BYTE)v185)
      {
        objc_msgSend(v5, "label");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v79, CFSTR("Name"));

        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("Name"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:atIndexedSubscript:", v81, 0);

        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "label");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:atIndexedSubscript:", v83, 1);

        objc_msgSend(v180, "objectAtIndexedSubscript:", 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v216[0] = v84;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v216[1] = v85;
        v86 = (void *)MEMORY[0x1E0C99D20];
        v87 = v216;
      }
      else
      {
        if (!HIBYTE(v185))
        {
          v75 = v9;
          goto LABEL_30;
        }
        objc_msgSend(v5, "label");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v8, "count"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v102, CFSTR("Name"));

        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "label");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:atIndexedSubscript:", v104, 0);

        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("Name"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:atIndexedSubscript:", v106, 1);

        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v215[0] = v84;
        objc_msgSend(v180, "objectAtIndexedSubscript:", 0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v215[1] = v85;
        v86 = (void *)MEMORY[0x1E0C99D20];
        v87 = v215;
      }
      objc_msgSend(v86, "arrayWithObjects:count:", v87, 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_62;
    }
    if ((a1 - 28) < 2)
      goto LABEL_26;
    if (a1 == 22)
    {
      if (objc_msgSend(v6, "count") != 2)
      {
        +[MLCLog framework](MLCLog, "framework");
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          ANE_CreateUnitsWithArithmeticOpeartion_cold_11();
        goto LABEL_33;
      }
      v54 = v11;
      v88 = v9;
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v89);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "stringByAppendingString:", CFSTR("_0"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v91, CFSTR("Name"));

      if ((ANE_ValidateGOCUnit(v9, v22, 1) & 1) != 0)
      {
        objc_msgSend(v8, "addObject:", v22);
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v92);
        v60 = objc_claimAutoreleasedReturnValue();

        v61 = v5;
        objc_msgSend(v5, "label");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "stringByAppendingString:", CFSTR("_1"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", v94, CFSTR("Name"));

        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Name"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = v95;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v188, 1);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", v96, CFSTR("Bottom"));

        v9 = v88;
        if ((ANE_ValidateNeuronUnit(v88, v60, 1) & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v66 = objc_claimAutoreleasedReturnValue();
          v11 = v54;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
LABEL_86:
            ANE_CreateUnitsWithArithmeticOpeartion_cold_9();
LABEL_87:

LABEL_94:
LABEL_95:

          goto LABEL_96;
        }
LABEL_39:
        objc_msgSend(v8, "addObject:", v60);

        v5 = v61;
        v11 = v54;
LABEL_65:

        v100 = (void *)objc_msgSend(v8, "copy");
        goto LABEL_97;
      }
      +[MLCLog framework](MLCLog, "framework");
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        goto LABEL_77;
    }
    else
    {
      if (a1 != 24)
      {
LABEL_40:
        if (objc_msgSend(v6, "count") == 1)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v97);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Type"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v97) = objc_msgSend(v98, "isEqualToString:", CFSTR("Neuron"));

          if ((_DWORD)v97)
          {
            if ((ANE_ValidateNeuronUnit(v9, v22, 1) & 1) == 0)
            {
              +[MLCLog framework](MLCLog, "framework");
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                ANE_CreateUnitsWithArithmeticOpeartion_cold_1();
LABEL_93:
              v9 = v179;
              goto LABEL_94;
            }
          }
          else
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v186 = v127;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v186, 1);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = ANE_ValidateElementWiseUnit(v128, v22, 1);

            if ((v129 & 1) == 0)
            {
              +[MLCLog framework](MLCLog, "framework");
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                ANE_CreateUnitsWithArithmeticOpeartion_cold_2();
              goto LABEL_93;
            }
          }
          objc_msgSend(v8, "addObject:", v22);
          goto LABEL_64;
        }
        +[MLCLog framework](MLCLog, "framework");
        v77 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
LABEL_32:
        ANE_CreateUnitsWithArithmeticOpeartion_cold_3();
        goto LABEL_33;
      }
      if (objc_msgSend(v6, "count") != 2)
      {
        +[MLCLog framework](MLCLog, "framework");
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          ANE_CreateUnitsWithArithmeticOpeartion_cold_14();
        goto LABEL_33;
      }
      v54 = v11;
      v55 = v9;
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v56);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "label");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringByAppendingString:", CFSTR("_0"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v58, CFSTR("Name"));

      if ((ANE_ValidateNeuronUnit(v9, v22, 1) & 1) != 0)
      {
        objc_msgSend(v8, "addObject:", v22);
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v5, v59);
        v60 = objc_claimAutoreleasedReturnValue();

        v61 = v5;
        objc_msgSend(v5, "label");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "stringByAppendingString:", CFSTR("_1"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", v63, CFSTR("Name"));

        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Name"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = v64;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v187, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", v65, CFSTR("Bottom"));

        v9 = v55;
        if ((ANE_ValidateGOCUnit(v55, v60, 1) & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v66 = objc_claimAutoreleasedReturnValue();
          v11 = v54;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            goto LABEL_86;
          goto LABEL_87;
        }
        goto LABEL_39;
      }
      +[MLCLog framework](MLCLog, "framework");
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
LABEL_77:
        ANE_CreateUnitsWithArithmeticOpeartion_cold_9();
    }

    v100 = 0;
    v9 = v179;
    v11 = v54;
    goto LABEL_97;
  }
  v171 = a1;
  v175 = v6;
  v177 = v8;
  v184 = 0;
  v173 = v11;
  ANE_GetTensor4DShapeWithOnePrepended(v11, &v184);
  v12 = v184;
  if (!objc_msgSend(v9, "count"))
  {
LABEL_9:

    v6 = v175;
    v8 = v177;
    v11 = v173;
    a1 = v171;
    goto LABEL_10;
  }
  v13 = 0;
  while (1)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = 0;
    v183 = 0;
    v15 = +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:](_MLCANEPlistBuilder, "createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:", v14, v12, v5, &v183, &v182);
    v16 = v183;
    v17 = v182;
    if (v15 == 1)
      goto LABEL_8;
    if (v15 != 2)
      break;
    if (!v16)
    {
      +[MLCLog framework](MLCLog, "framework");
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithArithmeticOpeartion_cold_16(v99);
      v16 = 0;
      goto LABEL_50;
    }
    *((_BYTE *)&v185 + v13) = 1;
    objc_msgSend(v5, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v177, "count"));
    v19 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("Name"));

    v5 = v19;
    v9 = v179;
    objc_msgSend(v177, "addObject:", v16);
    objc_msgSend(v180, "addObject:", v17);
LABEL_8:

    if (++v13 >= (unint64_t)objc_msgSend(v9, "count"))
      goto LABEL_9;
  }
  +[MLCLog framework](MLCLog, "framework");
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    ANE_CreateUnitsWithArithmeticOpeartion_cold_15();
LABEL_50:

  v100 = 0;
  v6 = v175;
  v8 = v177;
  v11 = v173;
LABEL_97:

  return v100;
}

id ANE_CompileArithmeticLayer(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a1;
  objc_msgSend(a3, "parentLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "params");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arithmeticParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ANE_CreateUnitsWithArithmeticOpeartion(objc_msgSend(v6, "operation"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      ANE_CompileArithmeticLayer_cold_1();

    v12 = 0;
  }

  return v12;
}

uint64_t ANE_IsSupportedLayer(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (ANE_IsAneCompiledLayer(v1))
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0 && !objc_msgSend(v1, "skipLayer"))
      goto LABEL_28;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v1, "resultTensors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v43 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          objc_msgSend(v10, "childLayers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v39 != v14)
                  objc_enumerationMutation(v11);
                if (!ANE_IsSupportedLayer(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j)))
                {

LABEL_28:
                  v2 = 0;
                  goto LABEL_29;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v7);
    }

    if ((isKindOfClass & 1) != 0)
    {
      v2 = objc_msgSend(v1, "isLastLayer") ^ 1;
      goto LABEL_29;
    }
LABEL_2:
    v2 = 1;
    goto LABEL_29;
  }
  v3 = v1;
  if ((objc_msgSend(v3, "isLastLayer") & 1) != 0 || objc_msgSend(v3, "paddingType"))
  {
    v2 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "resultTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v18, "childLayers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (!v20)
  {
    v2 = 1;
    goto LABEL_55;
  }
  v21 = v20;
  v22 = *(_QWORD *)v47;
  v37 = v18;
  while (2)
  {
    for (k = 0; k != v21; ++k)
    {
      if (*(_QWORD *)v47 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
      if (!ANE_IsAneCompiledLayer(v24))
      {
LABEL_50:
        v2 = 0;
        v18 = v37;
        goto LABEL_55;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v24, "deviceOps");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
        v26 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "units");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ANE_FindUnitWithType(CFSTR("Conv"), v27);
        v28 = objc_claimAutoreleasedReturnValue();

        if (!v28 || !applyAndCheckPaddingSizes(v3, v28, 1))
          goto LABEL_53;

        continue;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_50;
      v26 = v24;
      objc_msgSend(v26, "descriptor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "poolingType");

      if (v30 != 1)
      {
        if (v30 == 2)
        {
          objc_msgSend(v26, "descriptor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countIncludesPadding");

          if ((v32 & 1) != 0)
            goto LABEL_44;
          v18 = v37;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            ANE_IsSupportedLayer_cold_1(v26, v28);
LABEL_53:
          v18 = v37;

        }
        v2 = 0;
        goto LABEL_55;
      }
LABEL_44:
      objc_msgSend(v26, "deviceOps");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v28 = objc_claimAutoreleasedReturnValue();

      -[NSObject units](v28, "units");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ANE_FindUnitWithType(CFSTR("Pooling"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_53;
      v36 = applyAndCheckPaddingSizes(v3, v35, 0);

      if (!v36)
        goto LABEL_50;
    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    v2 = 1;
    v18 = v37;
    if (v21)
      continue;
    break;
  }
LABEL_55:

LABEL_7:
LABEL_29:

  return v2;
}

void buildANESubgraph(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  __int128 v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  id v85;
  id v86;
  void *v87;
  id obj;
  id obja;
  id v90;
  void *v91;
  char *v92;
  id v93;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint8_t v126[4];
  uint64_t v127;
  uint8_t buf[4];
  const char *v129;
  __int16 v130;
  NSObject *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = v15;
  v19 = v17;
  v20 = a6;
  v91 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v14, "addObject:", v13);
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v87 = v13;
  v21 = v13;
  v22 = v16;
  objc_msgSend(v21, "sourceTensors");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
  if (v24)
  {
    v26 = *(_QWORD *)v113;
    *(_QWORD *)&v25 = 136315394;
    v73 = v25;
    v94 = v19;
    v95 = v23;
    v86 = v15;
    v90 = v16;
    v80 = *(_QWORD *)v113;
    do
    {
      v27 = 0;
      v79 = v24;
      do
      {
        if (*(_QWORD *)v113 != v26)
        {
          v28 = v27;
          objc_enumerationMutation(v23);
          v27 = v28;
        }
        v83 = v27;
        v29 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v27);
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v30 = v29;
        v31 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        objc_msgSend(v30, "parentLayers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");

        if (!v33)
        {
LABEL_24:
          v50 = v31;
          v22 = v90;
          goto LABEL_32;
        }
        v34 = (char *)v33;
        v35 = 0;
        obj = v30;
        v84 = v34;
        while (1)
        {
          objc_msgSend(v30, "parentLayers", v73);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = v35;
          objc_msgSend(v36, "objectAtIndexedSubscript:", v35);
          v37 = objc_claimAutoreleasedReturnValue();

          if (-[NSObject skipLayer](v37, "skipLayer"))
            break;
          objc_msgSend(v31, "addObject:", v37);
LABEL_23:

          v35 = v92 + 1;
          v30 = obj;
          if (v92 + 1 == v34)
            goto LABEL_24;
        }
        if (v37)
        {
          while (-[NSObject skipLayer](v37, "skipLayer"))
          {
            -[NSObject sourceTensors](v37, "sourceTensors");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "count");

            if (v39 != 1)
            {
              +[MLCLog framework](MLCLog, "framework");
              v51 = objc_claimAutoreleasedReturnValue();
              v19 = v94;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v73;
                v129 = "getParentLayers";
                v130 = 2112;
                v131 = v37;
                _os_log_error_impl(&dword_1D4999000, v51, OS_LOG_TYPE_ERROR, "%s: Cannot find parents for a layer = %@", buf, 0x16u);
              }

              v22 = v90;
              goto LABEL_31;
            }
            -[NSObject sourceTensors](v37, "sourceTensors");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "lastObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "parentLayers");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "lastObject");
            v43 = objc_claimAutoreleasedReturnValue();

            v37 = v43;
            if (!v43)
              goto LABEL_25;
          }
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          -[NSObject sourceTensors](v37, "sourceTensors");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v117;
            do
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v117 != v47)
                  objc_enumerationMutation(v44);
                objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "parentLayers");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObjectsFromArray:", v49);

              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
            }
            while (v46);
          }

          v34 = v84;
          v18 = v86;
          v19 = v94;
          goto LABEL_23;
        }
LABEL_25:
        +[MLCLog framework](MLCLog, "framework");
        v37 = objc_claimAutoreleasedReturnValue();
        v22 = v90;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          buildANESubgraph_cold_1(v126, &v127, v37);
        v19 = v94;
LABEL_31:

        v50 = (id)MEMORY[0x1E0C9AA60];
        v30 = obj;
LABEL_32:

        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
        v23 = v95;
        if (v52)
        {
          v53 = *(_QWORD *)v109;
          v78 = *(_QWORD *)v109;
          while (2)
          {
            v54 = 0;
            v77 = v52;
            do
            {
              if (*(_QWORD *)v109 != v53)
                objc_enumerationMutation(v50);
              v55 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v54);
              if ((objc_msgSend(v22, "doesLayer:dominatesSubgraph:", v55, v18, v73) & 1) != 0
                || (objc_msgSend(v19, "containsObject:", v55) & 1) != 0)
              {
LABEL_70:

                goto LABEL_71;
              }
              v106 = 0u;
              v107 = 0u;
              v104 = 0u;
              v105 = 0u;
              objc_msgSend(v55, "resultTensors");
              obja = (id)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
              if (v81)
              {
                v56 = *(_QWORD *)v105;
                v85 = v50;
                v74 = v55;
                v75 = v54;
                v76 = *(_QWORD *)v105;
                do
                {
                  v57 = 0;
                  do
                  {
                    if (*(_QWORD *)v105 != v56)
                    {
                      v58 = v57;
                      objc_enumerationMutation(obja);
                      v57 = v58;
                    }
                    v82 = v57;
                    v59 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v57);
                    v100 = 0u;
                    v101 = 0u;
                    v102 = 0u;
                    v103 = 0u;
                    objc_msgSend(v59, "childLayers");
                    v93 = (id)objc_claimAutoreleasedReturnValue();
                    v60 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
                    if (v60)
                    {
                      v61 = v60;
                      v62 = *(_QWORD *)v101;
                      do
                      {
                        for (j = 0; j != v61; ++j)
                        {
                          if (*(_QWORD *)v101 != v62)
                            objc_enumerationMutation(v93);
                          v64 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
                          objc_msgSend(v64, "key");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "objectForKeyedSubscript:", v65);
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v66, "unsignedIntegerValue") >= a7)
                          {

                            v23 = v95;
                          }
                          else
                          {
                            v67 = objc_msgSend(v14, "containsObject:", v64);

                            v23 = v95;
                            if ((v67 & 1) == 0)
                            {

                              v50 = v85;
                              v18 = v86;
                              v22 = v90;
                              v19 = v94;
                              goto LABEL_70;
                            }
                          }
                          v19 = v94;
                        }
                        v61 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
                      }
                      while (v61);
                    }

                    v57 = v82 + 1;
                    v50 = v85;
                    v18 = v86;
                    v22 = v90;
                    v55 = v74;
                    v54 = v75;
                    v56 = v76;
                  }
                  while (v82 + 1 != v81);
                  v68 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
                  v56 = v76;
                  v81 = v68;
                }
                while (v68);
              }

              objc_msgSend(v91, "addObject:", v55);
              ++v54;
              v53 = v78;
            }
            while (v54 != v77);
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
            v53 = v78;
            if (v52)
              continue;
            break;
          }
        }

        v27 = v83 + 1;
        v26 = v80;
      }
      while (v83 + 1 != v79);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
      v26 = v80;
    }
    while (v24);
  }

  if (objc_msgSend(v91, "count"))
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v23 = v91;
    v69 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v97;
      do
      {
        for (k = 0; k != v70; ++k)
        {
          if (*(_QWORD *)v97 != v71)
            objc_enumerationMutation(v23);
          buildANESubgraph(*(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * k), v14, v18, v22, v19, v20, a7);
        }
        v70 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
      }
      while (v70);
    }
LABEL_71:

  }
}

uint64_t applyAndCheckPaddingSizes(void *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  ANE_ApplyPaddingSizes(v5, v6);
  if (a3)
    v7 = ANE_ValidateConvolutionLayer(v5, v6);
  else
    v7 = ANE_ValidatePoolingLayer(v5, v6);
  v8 = v7;

  return v8;
}

uint64_t canMergeANESubgraphsHelper(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id obj;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "getDominanceFrontierForSubgraph:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v12, "minusSet:", v7);
  v13 = objc_msgSend(v12, "count");
  if (v13 == objc_msgSend(v11, "count") || (objc_msgSend(v9, "doesSubgraph:dominatesSubgraph:", v7, v12) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v46 = v12;
    v47 = v11;
    v49 = v7;
    v50 = v9;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v7;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v62 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v20, "key");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 <= objc_msgSend(v22, "unsignedIntegerValue"))
          {
            objc_msgSend(v20, "key");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v24, "unsignedIntegerValue");

          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v48 = v8;
    v52 = v8;
    v25 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v58 != v28)
            objc_enumerationMutation(v52);
          v30 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v30, "key");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27 <= objc_msgSend(v32, "unsignedIntegerValue"))
          {
            objc_msgSend(v30, "key");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v34, "unsignedIntegerValue");

          }
        }
        v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }

    if (v17 <= v27)
      v35 = v27;
    else
      v35 = v17;
    v9 = v50;
    objc_msgSend(v50, "getPostDominanceFrontierForSubgraph:", obj);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v54;
      v8 = v48;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v54 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
          objc_msgSend(v41, "key");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "unsignedIntegerValue") >= v35)
          {

          }
          else
          {
            v44 = objc_msgSend(v52, "containsObject:", v41);

            if ((v44 & 1) == 0)
            {
              v14 = 0;
              goto LABEL_41;
            }
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v38);
      v14 = 1;
LABEL_41:
      v9 = v50;
    }
    else
    {
      v14 = 1;
      v8 = v48;
    }

    v7 = v49;
    v12 = v46;
    v11 = v47;
  }

  return v14;
}

uint64_t __pruneANESubgraphs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "count");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "compare:", v6);

  return v10;
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  void *v0;

  return objc_msgSend(v0, "deviceOpType");
}

uint64_t setBNNSActivation(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  float v5;
  NSObject *v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  int v11;
  int v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "activationType");
  switch(v4)
  {
    case 0:
    case 3:
    case 6:
      goto LABEL_30;
    case 1:
      objc_msgSend(v3, "a");
      if (v5 == 0.0)
        v4 = 1;
      else
        v4 = 2;
      goto LABEL_30;
    case 2:
      objc_msgSend(v3, "b");
      if (v8 == 0.0)
        v4 = 7;
      else
        v4 = 20;
      goto LABEL_30;
    case 4:
      v4 = 15;
      goto LABEL_30;
    case 5:
      objc_msgSend(v3, "a");
      v4 = 5;
      if (v9 == 1.0)
      {
        objc_msgSend(v3, "b");
        if (v10 == 1.0)
          v4 = 4;
        else
          v4 = 5;
      }
      goto LABEL_30;
    case 7:
      v4 = 16;
      goto LABEL_30;
    case 8:
      v4 = 17;
      goto LABEL_30;
    case 9:
      v4 = 18;
      goto LABEL_30;
    case 10:
      v4 = 19;
      goto LABEL_30;
    case 11:
      v4 = 22;
      goto LABEL_30;
    case 12:
      v4 = 23;
      goto LABEL_30;
    case 13:
      v4 = 24;
      goto LABEL_30;
    case 14:
      v4 = 25;
      goto LABEL_30;
    case 15:
      v4 = 26;
      goto LABEL_30;
    case 16:
      v4 = 27;
      goto LABEL_30;
    case 17:
      v4 = 28;
      goto LABEL_30;
    case 18:
      *(_DWORD *)a1 = 12;
      *(_QWORD *)(a1 + 4) = 0x3D3727133F4C422ALL;
      goto LABEL_31;
    case 19:
      v4 = 30;
      goto LABEL_30;
    case 20:
      v4 = 8;
LABEL_30:
      *(_DWORD *)a1 = v4;
      objc_msgSend(v3, "a");
      *(_DWORD *)(a1 + 4) = v11;
      objc_msgSend(v3, "b");
      *(_DWORD *)(a1 + 8) = v12;
LABEL_31:
      v7 = 1;
      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        setBNNSActivation_cold_1(v3);

      v7 = 0;
      break;
  }

  return v7;
}

id softLinkClass_ANEIOSurfaceObject()
{
  if (softLinkClass_ANEIOSurfaceObject_onceToken != -1)
    dispatch_once(&softLinkClass_ANEIOSurfaceObject_onceToken, &__block_literal_global_25);
  return (id)softLinkClass_ANEIOSurfaceObject_softLinkClass_ANEIOSurfaceObject;
}

void sub_1D49C8700(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D49C8798(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id softLinkClass_ANEDeviceInfo()
{
  if (softLinkClass_ANEDeviceInfo_onceToken != -1)
    dispatch_once(&softLinkClass_ANEDeviceInfo_onceToken, &__block_literal_global_79);
  return (id)softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo;
}

void sub_1D49CB618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

unint64_t *hashCombine_0(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 11;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

uint64_t ANE_BuildConvolutionParams(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  size_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Conv"), kMLCANENetUnitType[0]);
  v8 = objc_msgSend(v6, "convolutionType");
  switch(v8)
  {
    case 2:
      goto LABEL_4;
    case 1:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("DeConv"), CFSTR("Type"));
      goto LABEL_8;
    case 0:
LABEL_4:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Conv"), CFSTR("Type"));
      if ((unint64_t)objc_msgSend(v6, "dilationRateInX") > 1
        || (unint64_t)objc_msgSend(v6, "dilationRateInY") >= 2)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("DilatedConv"), CFSTR("Type"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "dilationRateInX"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("KernelDilationX"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "dilationRateInY"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("KernelDilationY"));

      }
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("KernelGroupReuse"));

      objc_msgSend(v7, "descriptor");
      v12 = objc_claimAutoreleasedReturnValue();
      ANE_GetANECIRDataTypeWithMLCDataType(-[NSObject dataType](v12, "dataType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[MLCLog framework](MLCLog, "framework");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          ANE_BuildConvolutionParams_cold_2(v12);
        v29 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("KernelType"));
      -[NSObject shape](v12, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("KernelWidth"));

      -[NSObject shape](v12, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("KernelHeight"));

      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E98441E8, CFSTR("KernelDepth"));
      if (objc_msgSend(v6, "convolutionType") == 1)
      {
        v39 = v13;
        objc_msgSend(v7, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v7;
        v20 = objc_msgSend(v18, "length");

        v21 = malloc_type_malloc(v20, 0xDD75BE8EuLL);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v21, v20, 1);
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "data");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v7 = v19;
        v24 = +[MLCDataHelper convertOIHWtoIOHW:sourceOIHW:resultIOHW:inputFeatureChannelCount:outputFeatureChannelCount:](MLCDataHelper, "convertOIHWtoIOHW:sourceOIHW:resultIOHW:inputFeatureChannelCount:outputFeatureChannelCount:", v19, objc_msgSend(v23, "bytes"), v21, objc_msgSend(v6, "inputFeatureChannelCount") / (unint64_t)objc_msgSend(v6, "groupCount"), objc_msgSend(v6, "outputFeatureChannelCount"));

        if (!v24)
        {
          +[MLCLog framework](MLCLog, "framework");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            ANE_BuildConvolutionParams_cold_3(v30, v31, v32, v33, v34, v35, v36, v37);

          v29 = 0;
          v13 = v39;
          goto LABEL_22;
        }
        objc_msgSend(v19, "deviceMemory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:atIndexedSubscript:", v22, objc_msgSend(v19, "deviceIndex"));

        v13 = v39;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Dense"), CFSTR("KernelMode"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("KernelMutable"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "strideInX"));
      v22 = objc_claimAutoreleasedReturnValue();
      v40[0] = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "strideInY"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v27;
      v40[2] = &unk_1E98441E8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("Step"));

      v29 = 1;
LABEL_22:

      goto LABEL_23;
  }
  +[MLCLog framework](MLCLog, "framework");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    ANE_BuildConvolutionParams_cold_1(v6);
  v29 = 0;
LABEL_23:

  return v29;
}

id ANE_CreateConvolutionLayer(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v7 = a2;
  v8 = a4;
  v9 = a3;
  v10 = a1;
  v11 = (id)MEMORY[0x1E0C9AA60];
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v14 = ANE_BuildConvolutionParams(v13, v9, v10);

  if (v14)
  {
    if (v7)
    {
      +[_MLCANEPlistBuilder buildBiasParamsWithBiases:](_MLCANEPlistBuilder, "buildBiasParamsWithBiases:", v7);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[MLCLog framework](MLCLog, "framework");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          ANE_CreateConvolutionLayer_cold_2(v15, v21, v22, v23, v24, v25, v26, v27);
        goto LABEL_17;
      }
      if (v8)
        goto LABEL_5;
    }
    else
    {
      v15 = 0;
      if (v8)
      {
LABEL_5:
        ANE_BuildNeuronParams(v8);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          +[MLCLog framework](MLCLog, "framework");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            ANE_CreateConvolutionLayer_cold_1(v17, v28, v29, v30, v31, v32, v33, v34);
          goto LABEL_16;
        }
        v17 = v16;
        v18 = 5;
LABEL_9:
        +[_MLCANEConvolutionParameters convolutionUnitParametersWith:biasParams:neuronParams:](_MLCANEConvolutionParameters, "convolutionUnitParametersWith:biasParams:neuronParams:", v13, v15, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v12, "addObject:", v20);
        v11 = v12;

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }
    }
    v17 = 0;
    v18 = 4;
    goto LABEL_9;
  }
LABEL_18:

  return v11;
}

uint64_t ANE_ValidateConvolutionLayer(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(a1, "sourceTensors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ANE_ValidateConvolutionUnit(v4, v3, 0);

  return v5;
}

id ANE_CreateUnitsWithConvolutionLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  NSObject *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[2];

  v93[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v10 = v5;
  v11 = (void *)objc_msgSend(v8, "mutableCopy");
  v12 = 6;
  do
  {
    objc_msgSend(v11, "addObject:", &unk_1E9844200);
    --v12;
  }
  while (v12);
  objc_opt_class();
  v90 = v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v86 = v7;
  v88 = v6;
  v85 = v10;
  v13 = v10;
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sourceTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "resultTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = objc_msgSend(v14, "paddingPolicy");
  v91 = 1;
  v92 = 1;
  v84 = v16;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v16, &v92, &v91);
  v19 = v92;
  v82 = v91;
  v83 = v18;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v18, &v92, &v91);
  v20 = v92;
  v81 = v91;
  v21 = objc_msgSend(v13, "kernelWidth");
  v80 = objc_msgSend(v13, "kernelHeight");
  v22 = objc_msgSend(v13, "dilationRateInX");
  v78 = objc_msgSend(v13, "dilationRateInY");
  v23 = objc_msgSend(v13, "strideInX");
  v24 = objc_msgSend(v13, "strideInY");
  v25 = v14;
  if (objc_msgSend(v14, "convolutionType") != 1)
  {
    if (v79 == 2)
    {
      v32 = objc_msgSend(v14, "paddingSizeInY");
      v31 = objc_msgSend(v14, "paddingSizeInY");
      v34 = objc_msgSend(v25, "paddingSizeInX");
      v33 = objc_msgSend(v25, "paddingSizeInX");
    }
    else
    {
      v35 = v22 * (v21 - 1) - v19 + v23 * (v20 - 1) + 1;
      v36 = v35 & ~(v35 >> 63);
      v37 = (v78 * (v80 - 1) - v82 + v24 * (v81 - 1) + 1) & ~((v78 * (v80 - 1) - v82 + v24 * (v81 - 1) + 1) >> 63);
      v32 = v37 >> 1;
      v31 = v37 - (v37 >> 1);
      v34 = v36 >> 1;
      v33 = v36 - (v36 >> 1);
    }
    goto LABEL_11;
  }
  v26 = v20 - v23 * v19;
  v27 = __OFADD__(v26, v21);
  v28 = v26 + v21;
  if ((v28 < 0) ^ v27 | (v28 == 0))
  {
    +[MLCLog framework](MLCLog, "framework");
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      ANE_CreateUnitsWithConvolutionLayer_cold_4();
  }
  else
  {
    v29 = v81 - v24 * v82;
    v27 = __OFADD__(v29, v80);
    v30 = v29 + v80;
    if (!((v30 < 0) ^ v27 | (v30 == 0)))
    {
      v31 = (v30 - v24) / 2;
      v32 = v30 - 1 - v31;
      v33 = (v28 - v23) / 2;
      v34 = v28 - 1 - v33;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v32);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v38, 0);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v31);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v39, 1);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v40, 2);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v33);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v41, 3);

      v7 = v86;
      v6 = v88;
      v10 = v85;
      v9 = v90;
LABEL_12:
      v42 = v11;
      goto LABEL_13;
    }
    +[MLCLog framework](MLCLog, "framework");
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      ANE_CreateUnitsWithConvolutionLayer_cold_5();
  }
  v7 = v86;
  v6 = v88;
  v10 = v85;
  v9 = v90;

  v42 = (id)MEMORY[0x1E0C9AA60];
LABEL_13:

  if (objc_msgSend(v42, "count"))
  {
    objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("PadTop"));

    objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("PadBot"));

    objc_msgSend(v42, "objectAtIndexedSubscript:", 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("PadLeft"));

    objc_msgSend(v42, "objectAtIndexedSubscript:", 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("PadRight"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E9844200, CFSTR("PadFront"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E9844200, CFSTR("PadBack"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Zero"), CFSTR("PaddingMode"));
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v10, v6);
    v47 = objc_claimAutoreleasedReturnValue();
    v92 = 1;
    objc_msgSend(v10, "resultTensors");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    ANE_GetTensorFeatureChannelsWithBatchFirst(v49, &v92);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v92);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v50, CFSTR("OutputChannels"));

    objc_msgSend(v10, "descriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "convolutionType");
    v53 = (void *)MEMORY[0x1E0CB37E8];
    if (v52 == 2)
      v54 = objc_msgSend(v51, "inputFeatureChannelCount");
    else
      v54 = objc_msgSend(v51, "groupCount");
    objc_msgSend(v53, "numberWithUnsignedInteger:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v56, CFSTR("NumGroups"));

    if ((ANE_ValidateConvolutionLayer(v10, v47) & 1) != 0)
    {
      v57 = v90;
      objc_msgSend(v90, "addObject:", v47);
      if (!v7)
      {
LABEL_24:
        v55 = (void *)objc_msgSend(v57, "copy");
        v9 = v57;
LABEL_32:

        goto LABEL_33;
      }
      v89 = v6;
      objc_msgSend(v10, "label");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringByAppendingFormat:", CFSTR("%@"), CFSTR("_0"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v59, CFSTR("Name"));
      v87 = v7;
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v10, v7);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v92);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v61, CFSTR("OutputChannels"));

      objc_msgSend(v10, "label");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringByAppendingFormat:", CFSTR("%@"), CFSTR("_1"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "setObject:forKeyedSubscript:", v63, CFSTR("Name"));
      v93[0] = v59;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v64, CFSTR("Bottom"));

      objc_msgSend(v10, "resultTensors");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = ANE_ValidateGOCUnit(v65, v60, 0);

      if ((v66 & 1) != 0)
      {
        v57 = v90;
        objc_msgSend(v90, "addObject:", v60);

        v7 = v87;
        v6 = v89;
        goto LABEL_24;
      }
      +[MLCLog framework](MLCLog, "framework");
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithConvolutionLayer_cold_2();

      v55 = 0;
      v7 = v87;
      v6 = v89;
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        ANE_CreateUnitsWithConvolutionLayer_cold_3(v67, v68, v69, v70, v71, v72, v73, v74);

      v55 = 0;
    }
    v9 = v90;
    goto LABEL_32;
  }
  +[MLCLog framework](MLCLog, "framework");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    ANE_CreateUnitsWithConvolutionLayer_cold_1();
  v55 = 0;
LABEL_33:

  return v55;
}

id ANE_CompileConvolutionLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  char isKindOfClass;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentLayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dimensionCount");

  objc_msgSend(v8, "params");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v14, "convolutionParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v14, "biasParams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v14, "neuronParams");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v13 == 4)
  {
    ANE_CreateUnitsWithConvolutionLayer(v10, v86, v85);
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)v46;
      v82 = v19;
      objc_msgSend(v15, "addObjectsFromArray:", v46);

LABEL_25:
      v19 = v82;
      if (!v82)
      {
LABEL_29:
        v54 = (void *)objc_msgSend(v15, "copy");
        goto LABEL_37;
      }
      v84 = v11;
      objc_msgSend(v10, "fusedLayers");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v10, "fusedLayers");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "descriptor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v60;
        ANE_CreateUnitsWithNeuronLayer(v60, v82, objc_msgSend(v61, "activationType"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("Name"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v63;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
          v81 = v14;
          v64 = v8;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
          v66 = v10;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v65, CFSTR("Bottom"));

          v10 = v66;
          v8 = v64;
          v14 = v81;

          objc_msgSend(v15, "addObjectsFromArray:", v62);
          v19 = v82;
          v11 = v84;
          goto LABEL_29;
        }
        +[MLCLog framework](MLCLog, "framework");
        v69 = objc_claimAutoreleasedReturnValue();
        v11 = v84;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          ANE_CompileConvolutionLayer_cold_2();

      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v68 = objc_claimAutoreleasedReturnValue();
        v11 = v84;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          ANE_CompileConvolutionLayer_cold_3(v10);

      }
LABEL_36:
      v54 = 0;
      v19 = v82;
      goto LABEL_37;
    }
    +[MLCLog framework](MLCLog, "framework");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      ANE_CompileConvolutionLayer_cold_4();

    v54 = 0;
  }
  else
  {
    v83 = v11;
    if (v13 == 3)
    {
      v80 = v14;
      v20 = (void *)MEMORY[0x1D8263D2C]();
      v87 = 0;
      v88 = 0;
      v21 = +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:](_MLCANEPlistBuilder, "createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:", v10, &v88, &v87);
      v22 = v88;
      v76 = v87;
      v78 = v22;
      v82 = v19;
      if (v21)
      {
        v75 = v20;
        objc_msgSend(v10, "label");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v15, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("Name"));

        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v26);

        ANE_CreateUnitsWithConvolutionLayer(v10, v86, v85);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          v71 = v8;
          v72 = v7;
          v73 = v6;
          v74 = v5;
          if (-[NSObject count](v27, "count"))
          {
            v29 = 0;
            do
            {
              -[NSObject objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "label");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v15, "count"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("Name"));

              objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Name"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v91[0] = v34;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
              v35 = v10;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v36, CFSTR("Bottom"));

              v10 = v35;
              objc_msgSend(v15, "addObject:", v30);

              ++v29;
            }
            while (v29 < -[NSObject count](v28, "count"));
          }
          objc_msgSend(v10, "label");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v15, "count"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("Name"));

          objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("Name"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("Bottom"));

          objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
          v44 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v44);
          v45 = 0;
          v6 = v73;
          v5 = v74;
          v8 = v71;
          v7 = v72;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            ANE_CompileConvolutionLayer_cold_4();
          v45 = 1;
        }
        v20 = v75;

      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          ANE_CompileConvolutionLayer_cold_5();
        v45 = 1;
      }

      objc_autoreleasePoolPop(v20);
      v14 = v80;
      v11 = v83;
      if (v45)
        goto LABEL_36;
      goto LABEL_25;
    }
    v48 = v8;
    v49 = v7;
    v50 = v6;
    v51 = v5;
    v52 = (void *)v18;
    +[MLCLog framework](MLCLog, "framework");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      ANE_CompileConvolutionLayer_cold_1();

    v54 = 0;
    v19 = v52;
    v5 = v51;
    v6 = v50;
    v7 = v49;
    v8 = v48;
    v11 = v83;
  }
LABEL_37:

  return v54;
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id ANE_CreateSelectionLayer()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C9AA60];
  v1 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v11[0] = kMLCANENetUnitType[0];
  v11[1] = CFSTR("Type");
  v12[0] = CFSTR("ElementWise");
  v12[1] = CFSTR("Mult");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v1, "addObject:", v3);
  objc_msgSend(v1, "addObject:", v3);
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("EqualZero"), CFSTR("Type"));
  objc_msgSend(v1, "addObject:", v4);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Add"), CFSTR("Type"));
  objc_msgSend(v1, "addObject:", v5);
  v6 = (void *)objc_msgSend(v0, "mutableCopy");
  +[_MLCANEArithmeticParameters arithmeticUnitParametersWith:](_MLCANEArithmeticParameters, "arithmeticUnitParametersWith:", v1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 35, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "addObject:", v8);
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

id ANE_CompileSelectionLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  NSObject *v134;
  NSObject *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  _QWORD *v140;
  void *v142;
  int v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  NSObject *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  NSObject *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  id v173;
  void *v174;
  void *v175;
  uint64_t v176[3];
  id v177;
  _QWORD v178[2];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  void *v193;
  uint64_t v194;
  _QWORD v195[3];

  v195[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "params");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arithmeticParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      ANE_CompileSelectionLayer_cold_8(v11, v88, v89, v90, v91, v92, v93, v94);
    v95 = 0;
    goto LABEL_71;
  }
  v171 = v9;
  v168 = v8;
  objc_msgSend(v6, "parentLayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C9AA60];
  v175 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = (void *)objc_msgSend(v12, "mutableCopy");
  v177 = 0;
  v169 = v6;
  ANE_GetTensor4DShapeWithOnePrepended(v6, &v177);
  v172 = v5;
  v173 = v177;
  if (!objc_msgSend(v5, "count"))
  {
LABEL_10:
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v176[0] = 1;
    ANE_GetTensorFeatureChannelsWithOnePrepended(v22, v176);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "descriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v25, "dataType"));
    v26 = objc_claimAutoreleasedReturnValue();

    v165 = v23;
    objc_msgSend(v23, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v27, "dataType"));
    v28 = objc_claimAutoreleasedReturnValue();

    v166 = v24;
    objc_msgSend(v24, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v29, "dataType"));
    v30 = objc_claimAutoreleasedReturnValue();

    v162 = (void *)v26;
    v163 = (void *)v30;
    v164 = (void *)v28;
    if (!v26 || !v28 || !v30)
    {
      +[MLCLog framework](MLCLog, "framework");
      v96 = objc_claimAutoreleasedReturnValue();
      v104 = v175;
      v167 = v96;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        ANE_CompileSelectionLayer_cold_1(v96, v97, v98, v99, v100, v101, v102, v103);
      v95 = 0;
      v5 = v172;
      v8 = v168;
      v6 = v169;
      goto LABEL_69;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v11, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v11, v33);
    v161 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v11, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v11, v36);
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject label](v11, "label");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v175, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, CFSTR("Name"));

    objc_msgSend(v22, "label");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v195[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 1);
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, CFSTR("Bottom"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v176[0]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v41, CFSTR("OutputChannels"));

    v194 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, CFSTR("InputType"));

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v26, CFSTR("OutputType"));
    v193 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v193, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v40) = ANE_ValidateElementWiseUnit(v43, v35, 1);

    v44 = v22;
    v167 = v32;
    v160 = v35;
    if ((v40 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v85 = objc_claimAutoreleasedReturnValue();
      v8 = v168;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        ANE_CompileSelectionLayer_cold_2();
      v95 = 0;
      v6 = v169;
      v9 = v171;
      v5 = v172;
      goto LABEL_68;
    }
    objc_msgSend(v175, "addObject:", v35);
    v45 = objc_msgSend(v175, "count");
    -[NSObject label](v11, "label");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringByAppendingFormat:", CFSTR("_%lu"), v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v32;
    -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v47, CFSTR("Name"));

    objc_msgSend(v165, "label");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v192[0] = v49;
    objc_msgSend(v22, "label");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v192[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 2);
    v51 = v26;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v22;
    v53 = (void *)objc_msgSend(v52, "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v53, CFSTR("Bottom"));

    v191[0] = v164;
    v191[1] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v55, CFSTR("InputType"));

    -[NSObject label](v11, "label");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v45 + 2;
    objc_msgSend(v56, "stringByAppendingFormat:", CFSTR("_%lu"), v45 + 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v58, CFSTR("Name"));

    objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("Name"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = v59;
    objc_msgSend(v166, "label");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v190[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v61, "mutableCopy");
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v62, CFSTR("Bottom"));

    objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("OutputType"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v189[0] = v63;
    v189[1] = v163;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v64, "mutableCopy");
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v65, CFSTR("InputType"));

    -[NSObject label](v11, "label");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v57;
    v22 = v44;
    objc_msgSend(v66, "stringByAppendingFormat:", CFSTR("_%lu"), v146);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "setObject:forKeyedSubscript:", v67, CFSTR("Name"));

    -[NSObject objectForKeyedSubscript:](v167, "objectForKeyedSubscript:", CFSTR("Name"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v188[0] = v68;
    objc_msgSend(v161, "objectForKeyedSubscript:", CFSTR("Name"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v188[1] = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "setObject:forKeyedSubscript:", v70, CFSTR("Bottom"));

    -[NSObject objectForKeyedSubscript:](v167, "objectForKeyedSubscript:", CFSTR("OutputType"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v187[0] = v71;
    objc_msgSend(v161, "objectForKeyedSubscript:", CFSTR("OutputType"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v187[1] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "setObject:forKeyedSubscript:", v73, CFSTR("InputType"));

    v186[0] = v165;
    v186[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 2);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v74, "mutableCopy");

    v185[0] = v44;
    v185[1] = v166;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v185, 2);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = (void *)objc_msgSend(v75, "mutableCopy");

    v184[0] = v165;
    v184[1] = v166;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v171;
    if (objc_msgSend(v77, "BOOLValue"))
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v78, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "BOOLValue");

        if (v80)
        {
          objc_msgSend(v175, "objectAtIndexedSubscript:", 0);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = v76;
          objc_msgSend(v175, "objectAtIndexedSubscript:", 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "objectAtIndexedSubscript:", 2);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "objectAtIndexedSubscript:", 1);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "objectAtIndexedSubscript:", 2);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v81;
          v85 = v157;
          ANE_ConnectBroadcastUnitForSource0(v81, v83, v167, v157);
          v86 = v148;
          ANE_ConnectBroadcastUnitForMask(v148, v82, v167, v160, v161, v157, v158, v175);
          ANE_ConnectBroadcastUnitForSource1(v147, v84, v161, v158);
          v183[0] = v83;
          v183[1] = v84;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 2);
          v87 = objc_claimAutoreleasedReturnValue();

          v76 = (void *)v87;
          v22 = v156;
          v8 = v168;
          v6 = v169;
          goto LABEL_51;
        }
LABEL_35:
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v113, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend(v114, "BOOLValue");

          v6 = v169;
          if (v115)
          {
            objc_msgSend(v175, "objectAtIndexedSubscript:", 0);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = v76;
            objc_msgSend(v175, "objectAtIndexedSubscript:", 1);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 1);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = v116;
            v85 = v157;
            ANE_ConnectBroadcastUnitForSource0(v116, v118, v167, v157);
            ANE_ConnectBroadcastUnitForMask(v149, v117, v167, v160, v161, v157, v158, v175);
            v182[0] = v118;
            v182[1] = v166;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v182, 2);
            v119 = objc_claimAutoreleasedReturnValue();

            v86 = v149;
LABEL_42:
            v76 = (void *)v119;
            goto LABEL_50;
          }
        }
        else
        {

          v6 = v169;
        }
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v120, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = objc_msgSend(v121, "BOOLValue");

          if (v122)
          {
            objc_msgSend(v175, "objectAtIndexedSubscript:", 0);
            v153 = v76;
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v175, "objectAtIndexedSubscript:", 1);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 1);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            ANE_ConnectBroadcastUnitForSource0(v123, v125, v167, v157);
            v155 = v124;
            ANE_ConnectBroadcastUnitForSource1(v124, v126, v161, v158);
            v181[0] = v125;
            v181[1] = v126;
            v85 = v157;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 2);
            v119 = objc_claimAutoreleasedReturnValue();

            v86 = v123;
            goto LABEL_42;
          }
        }
        else
        {

        }
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v127, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v128, "BOOLValue");

          if (v129)
          {
            objc_msgSend(v175, "objectAtIndexedSubscript:", 0);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = v76;
            objc_msgSend(v175, "objectAtIndexedSubscript:", 1);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 1);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v157;
            ANE_ConnectBroadcastUnitForMask(v150, v170, v167, v160, v161, v157, v158, v175);
            v155 = v130;
            ANE_ConnectBroadcastUnitForSource1(v130, v131, v161, v158);
            v180[0] = v165;
            v180[1] = v131;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 2);
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            v86 = v150;
            goto LABEL_50;
          }
        }
        else
        {

        }
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v132, "BOOLValue");

        if (!v133)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = objc_msgSend(v136, "BOOLValue");

          v8 = v168;
          v85 = v157;
          if (v137)
          {
            objc_msgSend(v175, "objectAtIndexedSubscript:", 0);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            ANE_ConnectBroadcastUnitForSource0(v86, v138, v167, v157);
            v155 = v138;
            v179[0] = v138;
            v179[1] = v166;
            v139 = (void *)MEMORY[0x1E0C99D20];
            v140 = v179;
          }
          else
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = objc_msgSend(v142, "BOOLValue");

            if (!v143)
            {
LABEL_52:
              v5 = v172;
              if ((ANE_ValidateElementWiseUnit(v85, v167, 1) & 1) == 0)
              {
                +[MLCLog framework](MLCLog, "framework");
                v134 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                  ANE_CompileSelectionLayer_cold_2();

                v95 = 0;
                goto LABEL_67;
              }
              objc_msgSend(v175, "addObject:", v167);
              if ((ANE_ValidateElementWiseUnit(v158, v161, 1) & 1) != 0)
              {
                objc_msgSend(v175, "addObject:", v161);
                if ((ANE_ValidateElementWiseUnit(v76, v159, 1) & 1) != 0)
                {
                  objc_msgSend(v175, "addObject:", v159);
                  v95 = (void *)objc_msgSend(v175, "copy");
LABEL_66:
                  v85 = v157;
LABEL_67:

LABEL_68:
                  v104 = v175;
LABEL_69:

                  goto LABEL_70;
                }
                +[MLCLog framework](MLCLog, "framework");
                v135 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
                  goto LABEL_64;
              }
              else
              {
                +[MLCLog framework](MLCLog, "framework");
                v135 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
LABEL_64:
                  ANE_CompileSelectionLayer_cold_2();
              }

              v95 = 0;
              goto LABEL_66;
            }
            objc_msgSend(v175, "objectAtIndexedSubscript:", 0);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            ANE_ConnectBroadcastUnitForSource1(v86, v144, v161, v158);
            v178[0] = v165;
            v178[1] = v144;
            v155 = v144;
            v139 = (void *)MEMORY[0x1E0C99D20];
            v140 = v178;
          }
          objc_msgSend(v139, "arrayWithObjects:count:", v140, 2);
          v145 = objc_claimAutoreleasedReturnValue();

          v76 = (void *)v145;
LABEL_51:

          goto LABEL_52;
        }
        objc_msgSend(v175, "objectAtIndexedSubscript:", 0);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v157;
        ANE_ConnectBroadcastUnitForMask(v86, v155, v167, v160, v161, v157, v158, v175);
LABEL_50:
        v8 = v168;
        goto LABEL_51;
      }

    }
    goto LABEL_35;
  }
  v14 = 0;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
    v176[1] = 0;
    v176[2] = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    v17 = +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:](_MLCANEPlistBuilder, "createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:");
    v18 = 0;
    v19 = 0;
    if (v17 == 2)
      break;
    if (v17 != 1)
    {
      +[MLCLog framework](MLCLog, "framework");
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        ANE_CompileSelectionLayer_cold_6(v17, v105);
      goto LABEL_32;
    }
    objc_msgSend(v13, "setObject:atIndexedSubscript:", MEMORY[0x1E0C9AAA0], v14);
LABEL_9:

    ++v14;
    v11 = v16;
    if (v14 >= objc_msgSend(v5, "count"))
      goto LABEL_10;
  }
  if (v18)
  {
    objc_msgSend(v13, "setObject:atIndexedSubscript:", MEMORY[0x1E0C9AAB0], v14);
    -[NSObject label](v16, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v175, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("Name"));

    v5 = v172;
    objc_msgSend(v175, "addObject:", v18);
    objc_msgSend(v174, "addObject:", v19);
    goto LABEL_9;
  }
  +[MLCLog framework](MLCLog, "framework");
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    ANE_CompileSelectionLayer_cold_7(v105, v106, v107, v108, v109, v110, v111, v112);
  v18 = 0;
LABEL_32:

  v95 = 0;
  v8 = v168;
  v11 = v16;
  v104 = v175;
  v22 = v15;
LABEL_70:

LABEL_71:
  return v95;
}

void ANE_ConnectBroadcastUnitForSource0(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a3;
  v14 = a2;
  v9 = a1;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Bottom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:atIndexedSubscript:", v10, 0);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OutputType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("InputType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:atIndexedSubscript:", v12, 0);
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v14, 0);

}

void ANE_ConnectBroadcastUnitForMask(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v16 = a2;
  v17 = a8;
  v36 = a7;
  v34 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_msgSend(v15, "mutableCopy");
  v22 = v16;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Name"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingString:", CFSTR("_copy"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v35, CFSTR("Name"));
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Name"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("Bottom"));

  objc_msgSend(v17, "addObject:", v21);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Name"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Bottom"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:atIndexedSubscript:", v26, 1);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("OutputType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("InputType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setObject:atIndexedSubscript:", v28, 1);
  objc_msgSend(v34, "setObject:atIndexedSubscript:", v22, 1);

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Name"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Bottom"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:atIndexedSubscript:", v30, 0);

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("OutputType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("InputType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setObject:atIndexedSubscript:", v32, 0);
  objc_msgSend(v36, "setObject:atIndexedSubscript:", v22, 0);

}

void ANE_ConnectBroadcastUnitForSource1(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a3;
  v14 = a2;
  v9 = a1;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Bottom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:atIndexedSubscript:", v10, 1);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OutputType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("InputType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:atIndexedSubscript:", v12, 1);
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v14, 1);

}

unint64_t *hashCombine_1(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 8;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

id softLinkClass_ANEDeviceInfo_0()
{
  if (softLinkClass_ANEDeviceInfo_onceToken_0 != -1)
    dispatch_once(&softLinkClass_ANEDeviceInfo_onceToken_0, &__block_literal_global_184);
  return (id)softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo_0;
}

uint64_t VerifyTensorBeforeRead(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v1 = a1;
  objc_msgSend(v1, "deviceMemory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      VerifyTensorBeforeRead_cold_1();
    goto LABEL_10;
  }
  objc_msgSend(v1, "deviceMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v1, "deviceIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      VerifyTensorBeforeRead_cold_3(v8);
LABEL_10:
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v1, "deviceMemory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v1, "deviceIndex"));
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject liveIOStatus](v8, "liveIOStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v11 = 1;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      VerifyTensorBeforeRead_cold_2();

    v11 = 0;
  }

LABEL_15:
  return v11;
}

id softLinkClass_ANERequest()
{
  if (softLinkClass_ANERequest_onceToken != -1)
    dispatch_once(&softLinkClass_ANERequest_onceToken, &__block_literal_global_200);
  return (id)softLinkClass_ANERequest_softLinkClass_ANERequest;
}

id softLinkClass_ANEQoSMapper()
{
  if (softLinkClass_ANEQoSMapper_onceToken != -1)
    dispatch_once(&softLinkClass_ANEQoSMapper_onceToken, &__block_literal_global_202);
  return (id)softLinkClass_ANEQoSMapper_softLinkClass_ANEQoSMapper;
}

id softLinkClass_ANEInMemoryModelDescriptor()
{
  if (softLinkClass_ANEInMemoryModelDescriptor_onceToken != -1)
    dispatch_once(&softLinkClass_ANEInMemoryModelDescriptor_onceToken, &__block_literal_global_204);
  return (id)softLinkClass_ANEInMemoryModelDescriptor_softLinkClass_ANEInMemoryModelDescriptor;
}

id softLinkClass_ANEInMemoryModel()
{
  if (softLinkClass_ANEInMemoryModel_onceToken != -1)
    dispatch_once(&softLinkClass_ANEInMemoryModel_onceToken, &__block_literal_global_206);
  return (id)softLinkClass_ANEInMemoryModel_softLinkClass_ANEInMemoryModel;
}

void *__softLinkObjcConstantkANEFModelDescriptionKey_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelDescriptionKey");
  softLinkObjcConstantkANEFModelDescriptionKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelProcedureNameToIDMapKey");
  softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelProceduresArrayKey_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelProceduresArrayKey");
  softLinkObjcConstantkANEFModelProceduresArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelInputSymbolIndexArrayKey");
  softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelInputSymbolsArrayKey_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelInputSymbolsArrayKey");
  softLinkObjcConstantkANEFModelInputSymbolsArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelOutputSymbolIndexArrayKey");
  softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelOutputSymbolsArrayKey");
  softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_constant = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

id createMatrices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6, void *a7)
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v12 = a5;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1);
  if (a1)
  {
    v15 = 0;
    v16 = 4 * a1 * a3;
    v17 = a1 - 1;
    do
    {
      v18 = a2;
      if (v12)
      {
        if (a6)
          v19 = v17;
        else
          v19 = v15;
        objc_msgSend(v12, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v20, "unsignedIntegerValue");

      }
      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v18, a4, v16, 268435488);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v13, v21);
      objc_msgSend(v14, "addObject:", v22);

      ++v15;
      --v17;
    }
    while (v17 != -1);
  }
  v23 = (void *)objc_msgSend(v14, "copy");

  return v23;
}

void copyNC1TtoNTCMTLBuffer(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *context;
  id v24;
  id v25;
  id v26;

  v24 = a1;
  v13 = a2;
  v26 = a6;
  v25 = a7;
  context = (void *)MEMORY[0x1D8263D2C]();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6EE8]), "initWithDevice:count:", v13, a3);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6EE0]), "initWithDevice:copyRows:copyColumns:sourcesAreTransposed:destinationsAreTransposed:", v13, a4, a5, 0, 1);
  objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", a4, a5, 4 * a5, 268435488);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", a5, a4, 4 * a4, 268435488);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v17 = 0;
    v18 = 0;
    v19 = 4 * a5 * a4;
    do
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:offset:descriptor:", v26, v17, v15);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:offset:descriptor:", v25, v17, v16);
      objc_msgSend(v14, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v18, v20, v21, 0, 0);

      ++v18;
      v17 += v19;
    }
    while (a3 != v18);
  }
  objc_msgSend(v22, "encodeToCommandBuffer:copyDescriptor:", v24, v14);

  objc_autoreleasePoolPop(context);
}

id createMatricesForTNCBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v22 = a4;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1);
  if (a1)
  {
    v12 = 0;
    v13 = 0;
    v14 = 4 * a3;
    v15 = 4 * a3 * a2;
    do
    {
      v16 = a2;
      if (v9)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v17, "unsignedIntegerValue");

      }
      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v16, v22, v14, 268435488, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:offset:descriptor:", v10, v12, v18);
      objc_msgSend(v11, "addObject:", v19);

      ++v13;
      v12 += v15;
    }
    while (a1 != v13);
  }
  v20 = (void *)objc_msgSend(v11, "copy", v22);

  return v20;
}

id createTemporaryMatrixViews(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v26;

  v8 = a1;
  v26 = a2;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  if (a4)
  {
    v10 = a4;
    v11 = 0;
    v22 = 4 * a4 * a6;
    do
    {
      objc_msgSend(v8, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "batchSizePerSequenceStep");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a5;
      if (v13)
      {
        objc_msgSend(v8, "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "batchSizePerSequenceStep");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v17, "unsignedIntegerValue");

      }
      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v14, a6, v22, 268435488);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC7238], "temporaryMatrixWithCommandBuffer:matrixDescriptor:", v26, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setReadCount:", objc_msgSend(v19, "readCount") + a3);
      objc_msgSend(v9, "addObject:", v19);

      ++v11;
    }
    while (v10 != v11);
  }
  v20 = (void *)objc_msgSend(v9, "copy");

  return v20;
}

id createMatricesForTNCBufferNoOffset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1);
  if (a1)
  {
    v14 = 4 * a3;
    v15 = a1 - 1;
    do
    {
      v16 = a2;
      if (v11)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v17, "unsignedIntegerValue");

      }
      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v16, a4, v14, 268435488);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v12, v18);
      objc_msgSend(v13, "addObject:", v19);

      --v15;
    }
    while (v15 != -1);
  }
  v20 = (void *)objc_msgSend(v13, "copy");

  return v20;
}

void GPU_AllocateResourceForMultiGPUTraining(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  int v48;
  int v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t v68;
  _BYTE v69[15];

  v7 = a1;
  v8 = a2;
  v9 = a3;
  objc_msgSend(v7, "deviceList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v58 = v7;
  if (v11 > 1)
  {
    objc_msgSend(v7, "deviceList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
    v12 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C9AA60];
    v56 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v65 = (void *)objc_msgSend(v15, "mutableCopy");
    v64 = (void *)objc_msgSend(v15, "mutableCopy");
    v63 = (void *)objc_msgSend(v15, "mutableCopy");
    v57 = v8;
    objc_msgSend(v8, "rnnTrainableWeightGradients");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v16, "count");
    v60 = v9;
    v61 = v16;
    if (v67)
      v17 = v16;
    else
      v17 = v9;
    v59 = objc_msgSend(v17, "count");
    if (!v59)
    {
LABEL_33:
      v51 = (void *)objc_msgSend(v56, "copy");
      v13 = v57;
      objc_msgSend(v57, "setRemoteGradientBuffers:", v51);

      v52 = (void *)objc_msgSend(v65, "copy");
      objc_msgSend(v57, "setLocalGradientMatrices:", v52);

      v53 = (void *)objc_msgSend(v64, "copy");
      objc_msgSend(v57, "setReceivedGradientMatrices:", v53);

      v54 = (void *)objc_msgSend(v63, "copy");
      objc_msgSend(v57, "setMatrixSumKernels:", v54);

      v55 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v57, "setAllReducedGradientMatrices:", v55);

      objc_msgSend(v57, "setMultiGPUReduction:", 1);
      v9 = v60;
      goto LABEL_34;
    }
    v18 = 0;
    v62 = 0;
    while (v67)
    {
      objc_msgSend(v61, "objectAtIndexedSubscript:", v62);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v66 = v20;
      if (v20)
        goto LABEL_15;
LABEL_12:
      if (++v62 == v59)
        goto LABEL_33;
    }
    v66 = 1;
LABEL_15:
    v21 = 0;
    do
    {
      if (!v67)
      {
        objc_msgSend(v60, "objectAtIndexedSubscript:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "descriptor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v36, "tensorAllocationSizeInBytes");

        objc_msgSend(v23, "descriptor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shape");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (v39)
        {
          v40 = 0;
          v26 = 1;
          do
          {
            objc_msgSend(v23, "descriptor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "shape");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectAtIndexedSubscript:", v40);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v26 *= objc_msgSend(v43, "unsignedIntegerValue");

            ++v40;
            objc_msgSend(v23, "descriptor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "shape");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "count");

          }
          while (v40 < v46);
        }
        else
        {
          v26 = 1;
        }
        objc_msgSend(v23, "descriptor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "dataType");

        v49 = v48 - 1;
        v27 = 1;
        v28 = v26;
        v29 = 1073741832;
        switch(v49)
        {
          case 0:
            v28 = 4 * v26;
            goto LABEL_31;
          case 2:
            v28 = 2 * v26;
            v29 = 268435472;
            v27 = 1;
            goto LABEL_19;
          case 3:
          case 5:
            goto LABEL_19;
          default:
            +[MLCLog framework](MLCLog, "framework");
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              GPU_AllocateResourceForMultiGPUTraining_cold_2(&v68, v69, v50);

            v28 = 0;
LABEL_31:
            v27 = 1;
            goto LABEL_18;
        }
      }
      objc_msgSend(v61, "objectAtIndexedSubscript:", v62);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "allocatedSize");
      v26 = objc_msgSend(v23, "columns");
      v27 = objc_msgSend(v23, "rows");
      v28 = objc_msgSend(v23, "rowBytes");

LABEL_18:
      v29 = 268435488;
LABEL_19:

      v30 = (void *)-[NSObject newBufferWithLength:options:](v12, "newBufferWithLength:options:", v25, 32);
      v31 = (void *)-[NSObject newBufferWithLength:options:](v12, "newBufferWithLength:options:", v25, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v27, v26, v28, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v30, v32);
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v31, v32);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F48]), "initWithDevice:count:rows:columns:transpose:", v12, 2, v27, v26, 0);
      objc_msgSend(v65, "setObject:atIndexedSubscript:", v33, v18);
      objc_msgSend(v64, "setObject:atIndexedSubscript:", v34, v18);
      objc_msgSend(v63, "setObject:atIndexedSubscript:", v35, v18++);

      ++v21;
    }
    while (v21 != v66);
    goto LABEL_12;
  }
  +[MLCLog framework](MLCLog, "framework");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    GPU_AllocateResourceForMultiGPUTraining_cold_1(v58, v12);
  v13 = v8;
LABEL_34:

}

id GPU_AllocateMemoryForMomentum(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a1;
  v7 = objc_msgSend(v5, "length");
  v8 = v7;
  v9 = 1;
  if ((_DWORD)a3 != 268435472)
    v9 = 2;
  v10 = v7 >> v9;
  v11 = objc_retainAutorelease(v5);
  v12 = objc_msgSend(v11, "bytes");

  v13 = (void *)objc_msgSend(v6, "newBufferWithBytes:length:options:", v12, v8, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
  objc_msgSend(MEMORY[0x1E0CC7250], "vectorDescriptorWithLength:dataType:", v10, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7248]), "initWithBuffer:descriptor:", v13, v14);

  return v15;
}

void rotateWeightsTensorBy180Degree(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  id v21;

  v21 = a1;
  v5 = a3;
  v6 = objc_msgSend(objc_retainAutorelease(a2), "bytes");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = 1;
  objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (objc_msgSend(v21, "count") != 2)
  {
    if (objc_msgSend(v21, "count") == 3)
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");
      v14 = 1;
    }
    else
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "unsignedIntegerValue");

      objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "unsignedIntegerValue");
    }

    v9 = v14 * v13;
  }
  if (v11)
  {
    LODWORD(v16) = 0;
    v17 = 0;
    do
    {
      if (v9)
      {
        v18 = 0;
        v19 = 1;
        do
        {
          *(_DWORD *)(v8 + 4 * (v18 + v17)) = *(_DWORD *)(v6 + 4 * (v17 + v9 + ~v18));
          v18 = v19;
        }
        while (v9 > v19++);
      }
      v16 = (v16 + 1);
      v17 += v9;
    }
    while (v11 > v16);
  }

}

void GPU_SetPaddingPolicyForLayer(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;

  v21 = a1;
  v9 = a2;
  objc_msgSend(v21, "deviceList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "forwardKernel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[_MLCGPUConvolutionTransposePadding convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:](_MLCGPUConvolutionTransposePadding, "convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:", 0, 0, 0, 0, 0, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setPadding:", v20);

          break;
        }
        v16 = 1;
      }
      else
      {
        if (a3 == 2)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            +[_MLCGPUConvolutionTransposePadding convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:](_MLCGPUConvolutionTransposePadding, "convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:", a5, a5, a4, a4, 0, 0);
          else
            objc_msgSend(MEMORY[0x1E0CC71B8], "zeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:", a5, a5, a4, a4);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        v16 = 28;
      }
      objc_msgSend(MEMORY[0x1E0CC71B8], "paddingWithMethod:", v16);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v17 = (void *)v15;
      objc_msgSend(v14, "setPadding:", v15);

      ++v12;
      objc_msgSend(v21, "deviceList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v12 < v19);
  }

}

uint64_t GPU_GetDataType(int a1)
{
  int v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1 - 1;
  if ((a1 - 1) < 6 && ((0x2Du >> v1) & 1) != 0)
    return dword_1D4AB8CCC[v1];
  +[MLCLog framework](MLCLog, "framework");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    GPU_GetDataType_cold_1(v2, v3, v4);

  return 268435488;
}

uint64_t GPU_GetDataTypeFromMPSDataType(int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;

  switch(a1)
  {
    case 8:
      return 6;
    case 268435488:
      return 1;
    case 268435472:
      return 3;
  }
  +[MLCLog framework](MLCLog, "framework");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    GPU_GetDataType_cold_1(v2, v3, v4);

  return 0;
}

id createArrayOfMPSMatrixSlicesFromBatch(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v6 = objc_msgSend(v4, "matrices");
  objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", objc_msgSend(v4, "rows"), objc_msgSend(v4, "columns"), 1, objc_msgSend(v4, "rowBytes"), objc_msgSend(v4, "matrixBytes"), objc_msgSend(v4, "dataType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:offset:descriptor:", v3, objc_msgSend(v4, "matrixBytes") * i, v7);
      objc_msgSend(v5, "addObject:", v9);

    }
  }

  return v5;
}

void convertNCHWToWHCN(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_msgSend(v1, "copy");
  objc_msgSend(v1, "removeAllObjects");
  objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v7);

}

id makeMPSNDArrayDescriptorFromTensor(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t DataType;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "calculateBatchSizeToUse");
  if (v6 == 1)
    v7 = 1;
  else
    v7 = v6 / a2;
  switch(objc_msgSend(v5, "count"))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v24[0] = v8;
      v24[1] = &unk_1E9844260;
      v24[2] = &unk_1E9844260;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v9;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = v24;
      goto LABEL_10;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v23[1] = &unk_1E9844260;
      v23[2] = &unk_1E9844260;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v9;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = v23;
LABEL_10:
      objc_msgSend(v10, "arrayWithObjects:count:", v11, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v9;
      v22[2] = &unk_1E9844260;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v9;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v15;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:

      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        makeMPSNDArrayDescriptorFromTensor_cold_1(v8, v12, v13);
      v14 = (void *)MEMORY[0x1E0C9AA60];
      break;
  }

  objc_msgSend(v3, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  DataType = GPU_GetDataType(objc_msgSend(v17, "dataType"));

  objc_msgSend(MEMORY[0x1E0CC6FE0], "descriptorWithDataType:shape:", DataType, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id makeMPSNDArrayFromMTLBuffer(void *a1, void *a2, void *a3, void *a4, unint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = a4;
  v12 = a3;
  v13 = a2;
  GPU_CreateMPSMatrixDescForNDArray(a1, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v12, v14);

  objc_msgSend(v13, "setPreferPackedRows:", 1);
  objc_msgSend(v15, "ndArrayWithCommandBuffer:descriptor:aliasing:", v11, v13, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id GPU_CreateMPSMatrixDescForNDArray(void *a1, unint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a1;
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v8, "unsignedIntegerValue");

    v9 = 1;
  }
  else
  {
    if (!a3)
    {
      v10 = objc_msgSend(v5, "calculateBatchSizeToUse");
      if (v10 == 1)
        a3 = 1;
      else
        a3 = v10 / a2;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "unsignedIntegerValue");

    if ((unint64_t)(objc_msgSend(v7, "count") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = 1;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        a3 *= objc_msgSend(v13, "unsignedIntegerValue");

        ++v12;
      }
      while (v12 < objc_msgSend(v7, "count") - 1);
    }
  }
  objc_msgSend(v5, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GPU_CreateMPSMatrixDesc(a3, v9, 1, objc_msgSend(v14, "dataType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id makeMPSTemporaryNDArrayFromTensor(void *a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  makeMPSNDArrayDescriptorFromTensor(a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC7240], "temporaryNDArrayWithCommandBuffer:descriptor:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void encodeMPSImageBatchToMPSTemporaryNDArray(void *a1, void *a2, uint64_t a3, void *a4, __int128 *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;

  v9 = a4;
  v10 = a2;
  objc_msgSend(a1, "deviceMemory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subarrayWithRange:", 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *a5;
  v17 = *((_QWORD *)a5 + 2);
  objc_msgSend(v10, "importDataWithCommandBuffer:fromImages:offset:", v9, v15, &v16);

}

void encodeMPSTemporaryNDArrayToMPSImageBatch(void *a1, void *a2, uint64_t a3, void *a4, __int128 *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;

  v9 = a4;
  v10 = a2;
  objc_msgSend(a1, "deviceMemory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subarrayWithRange:", 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *a5;
  v17 = *((_QWORD *)a5 + 2);
  objc_msgSend(v10, "exportDataWithCommandBuffer:toImages:offset:", v9, v15, &v16);

}

void GPU_GetTensorWidthAndHeight(void *a1, uint64_t *a2, uint64_t *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a1;
  objc_msgSend(v18, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v18, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 == 4)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v18, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");
  }
  else
  {
    v17 = objc_msgSend(v9, "count");

    if (v17 != 3)
    {
      v12 = 1;
      v16 = 1;
      goto LABEL_7;
    }
    objc_msgSend(v18, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "unsignedIntegerValue");
    v16 = 1;
  }

LABEL_7:
  *a2 = v12;
  *a3 = v16;

}

void GPU_GetTensorWidthAndHeightStrides(void *a1, uint64_t *a2, uint64_t *a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a1;
  objc_msgSend(v25, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataType");

  objc_msgSend(v25, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 4)
  {
    objc_msgSend(v25, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stride");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v25, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stride");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");
  }
  else
  {
    v18 = 1;
    if (v6 == 3)
      v18 = 2;
    if (v6 == 1)
      v13 = 4;
    else
      v13 = v18;
    objc_msgSend(v25, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 != 3)
    {
      v17 = v13;
      goto LABEL_12;
    }
    objc_msgSend(v25, "descriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stride");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v24, "unsignedIntegerValue");

    objc_msgSend(v25, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue") * v13;
  }

LABEL_12:
  *a2 = v13;
  *a3 = v17;

}

uint64_t GPU_AdjustFeatureChannelBeyondMax(uint64_t *a1, uint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if ((*a3 & 1) != 0)
    return 0;
  v4 = *a2;
  v5 = *a1;
  *a3 >>= 1;
  *a1 = 2 * v5;
  if (a4)
    *a4 *= 2;
  v6 = *a3;
  if (*a3 > kMaxFeatureChannelMPSImage
    && ((v6 & 1) != 0 || (*a3 = v6 >> 1, *a2 = 2 * v4, *a3 > kMaxFeatureChannelMPSImage)))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

id deviceParameterWithVectors(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  +[MLCTensorOptimizerDeviceData optimizerDeviceData](MLCTensorOptimizerDeviceData, "optimizerDeviceData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMomentumVectors:", v7);

  objc_msgSend(v8, "setVelocityVectors:", v6);
  objc_msgSend(v8, "setCenterWeightVectors:", v5);

  return v8;
}

id GPU_GetDataSourceFromTensors(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "deviceDataSources", (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v5, "deviceDataSources");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

void GPU_AssociateDataSourceToTensors(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setDeviceDataSources:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void GPU_ScaleMPSImageBatchWithKernel(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  MPSImageBatch *v8;
  MPSImageBatch *v9;
  id v10;

  v10 = a1;
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a4)
    MPSImageBatchIncrementReadCount(v8, 1);
  objc_msgSend(v10, "encodeBatchToCommandBuffer:sourceImages:destinationImages:", v7, v9, v9);

}

void GPU_AllocateExportableRunningMeanVariancetatesWithDevice(void *a1, void *a2, void *a3, void *a4, unint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "deviceMemory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") <= a5;

    if (v12)
    {
LABEL_3:
      objc_msgSend(v12, "deviceMemory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") <= a5;

      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    if (v11)
      goto LABEL_3;
  }
  v16 = 0;
LABEL_6:
  if (v14)
  {
    objc_msgSend(v10, "data");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "bytes");
    objc_msgSend(v10, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v33, "newBufferWithBytes:length:options:", v18, objc_msgSend(v19, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    objc_msgSend(v10, "deviceMemory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:atIndexedSubscript:", v20, a5);

  }
  if (v16)
  {
    objc_msgSend(v12, "data");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "bytes");
    objc_msgSend(v12, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v33, "newBufferWithBytes:length:options:", v23, objc_msgSend(v24, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    objc_msgSend(v12, "deviceMemory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:atIndexedSubscript:", v25, a5);

  }
  v27 = objc_alloc(MEMORY[0x1E0CC6D88]);
  objc_msgSend(v10, "deviceMemory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceMemory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", a5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v27, "initWithMean:variance:", v29, v31);

  objc_msgSend(v9, "setMovingState:", v32);
}

void GPU_AllocateExportableGammaBetaStatesWithDevice(void *a1, void *a2, void *a3, void *a4, unint64_t a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = (void *)v11;
  if (!(v10 | v11))
  {
    objc_msgSend(v9, "setExportableState:", 0);
    goto LABEL_13;
  }
  if (!v10)
  {
    v14 = 0;
    if (v11)
      goto LABEL_5;
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_msgSend((id)v10, "deviceMemory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") <= a5;

  if (!v12)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v12, "deviceMemory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") <= a5;

LABEL_8:
  if (v14)
  {
    objc_msgSend((id)v10, "data");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "bytes");
    objc_msgSend((id)v10, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v33, "newBufferWithBytes:length:options:", v18, objc_msgSend(v19, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    objc_msgSend((id)v10, "deviceMemory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:atIndexedSubscript:", v20, a5);

  }
  if (v16)
  {
    objc_msgSend(v12, "data");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "bytes");
    objc_msgSend(v12, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v33, "newBufferWithBytes:length:options:", v23, objc_msgSend(v24, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    objc_msgSend(v12, "deviceMemory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:atIndexedSubscript:", v25, a5);

  }
  v27 = objc_alloc(MEMORY[0x1E0CC6D80]);
  objc_msgSend(v12, "deviceMemory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "deviceMemory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", a5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v27, "initWithGamma:beta:", v29, v31);

  objc_msgSend(v9, "setExportableState:", v32);
LABEL_13:

}

BOOL GPU_isAppleFamily(void *a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "capitalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("Name = Apple")) != 0x7FFFFFFFFFFFFFFFLL;
  return v3;
}

uint64_t GPU_CreateMPSMatrixDesc(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a4 - 1;
  if ((a4 - 1) > 5)
  {
    v5 = 268435488;
    v6 = 1;
  }
  else
  {
    v5 = dword_1D4AB8CE4[v4];
    v6 = qword_1D4AB8D00[v4];
  }
  return objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", a1, a2, a3, v6 * a2, v6 * a2 * a1, v5);
}

void copyNDArrayToMTLBuffer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v7, "exportDataWithCommandBuffer:toBuffer:destinationDataType:offset:rowStrides:", v5, v6, objc_msgSend(v7, "dataType"), 0, 0);

}

void GPU_clearTemporaryImageBatchReadCount(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if (v7)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v7, "readCount"))
                objc_msgSend(v7, "setReadCount:", 0);
            }
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }
  }

}

unint64_t GPU_AlignForThreadGroupMemorySize(uint64_t a1)
{
  return (a1 + 15) & 0xFFFFFFFFFFFFFFF0;
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

id CPU_CreateUpsampleLayer(uint64_t a1, int a2, char a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v14[11];
  _OWORD v15[11];
  _OWORD v16[22];
  __int128 v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v17 = 0u;
  memset(v16, 0, sizeof(v16));
  if (a2 == 1)
    LODWORD(v16[0]) = 1;
  BYTE8(v17) = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16, 368);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v15, 0, sizeof(v15));
  memset(v14, 0, sizeof(v14));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, 176);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, 176);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 24, v6, v9, v10, 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v5, "addObject:", v11);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

uint64_t CPU_CompileUpsampleLayer(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  _OWORD v28[2];

  v5 = a2;
  v25 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "params");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v26, "bytes");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CPU_BuildBNNSNDArrayDescriptor(v24 + 8, v8, v11, 0, objc_msgSend(v13, "dataType"), 1, 0);

  v15 = 0;
  if (v14)
  {
    objc_msgSend(v25, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CPU_BuildBNNSNDArrayDescriptor(v24 + 184, v17, v19, 0, objc_msgSend(v20, "dataType"), 1, 0);

    v15 = 0;
    if (v21)
    {
      memset(v28, 0, sizeof(v28));
      LODWORD(v28[0]) = 1;
      v15 = MEMORY[0x1D82639E4](v24, v28);
      if (v15)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setSourceStride:", CPU_SetBatchStride(v22));

        objc_msgSend(v27, "setResultStride:", CPU_SetBatchStride(v25));
      }
    }
  }

  return v15;
}

unint64_t *hashCombine_2(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 9;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

unint64_t *hashCombine_3(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 7;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

uint64_t getBNNSConcatLayerTensorDataOffset(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "concatOffset");
  objc_msgSend(v1, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "concatDimension");

  objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue") * v2;

  return v7;
}

uint64_t getBNNSSplitLayerTensorDataOffset(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "splitOffset");
  objc_msgSend(v1, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "splitDimension");

  objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue") * v2;

  return v7;
}

uint64_t ANE_ValidateConcatUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  _BYTE v43[4];
  _BOOL4 v44;
  void *v45;
  _BYTE *v46;
  id v47;
  __int128 v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  int v54;
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _QWORD v60[72];

  v60[70] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateConcatUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateConcatUnit_onceToken, &__block_literal_global_3);
  if ((ANE_ValidateConcatUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    v8 = objc_msgSend(v5, "count");
    v9 = MEMORY[0x1E0C80A78]();
    if (v9)
    {
      v10 = 0;
      v11 = &v43[-64 * v9];
      while (1)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!ANE_BuildANECTensorDesc((uint64_t)v11, v12, a3))
          break;

        ++v10;
        v11 += 64;
        if (v8 == v10)
          goto LABEL_9;
      }
      +[MLCLog framework](MLCLog, "framework");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        ANE_ValidateConcatUnit_cold_4();

      v7 = 0;
      goto LABEL_37;
    }
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v53 = 0;
    ANECConcatLayerDescInitialize();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Dimension"));
    v52 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v51, v13))
    {
      +[MLCLog framework](MLCLog, "framework");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        ANE_ValidateConcatUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);

      v7 = 0;
      goto LABEL_36;
    }
    v46 = v43;
    v49 = 0;
    v50 = 0;
    v14 = ANECValidateConcatLayer();
    v7 = v14 == 0;
    v47 = v6;
    if (v14)
    {
      v15 = v14;
      v44 = v14 == 0;
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v60[0]) = 136315906;
        *(_QWORD *)((char *)v60 + 4) = "ANE_ValidateConcatUnit";
        WORD2(v60[1]) = 1024;
        *(_DWORD *)((char *)&v60[1] + 6) = v15;
        WORD1(v60[2]) = 2112;
        *(_QWORD *)((char *)&v60[2] + 4) = v13;
        WORD2(v60[3]) = 2112;
        *(_QWORD *)((char *)&v60[3] + 6) = v6;
        _os_log_error_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)v60, 0x26u);
      }
      v45 = v13;

      v18 = v50;
      if (v50)
      {
        v19 = 0;
        *(_QWORD *)&v17 = 136315650;
        v48 = v17;
        do
        {
          memcpy(v60, (const void *)(v49 + 552 * v19), 0x228uLL);
          v20 = v60[0];
          if (v60[0])
          {
            v21 = 0;
            do
            {
              +[MLCLog framework](MLCLog, "framework");
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v23 = v60[v21 + 1];
                v54 = v48;
                v55 = "ANE_ValidateConcatUnit";
                v56 = 2048;
                v57 = v21;
                v58 = 2112;
                v59 = v23;
                _os_log_error_impl(&dword_1D4999000, v22, OS_LOG_TYPE_ERROR, "%s: ANE hardware constraint violation %lu: %@", (uint8_t *)&v54, 0x20u);
              }

              ++v21;
            }
            while (v20 != v21);
            v18 = v50;
          }
          ++v19;
        }
        while (v19 < v18);
      }
      v24 = ANECUnitValidatorDelete();
      v13 = v45;
      v7 = v44;
      if (!v24)
        goto LABEL_35;
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_35:
        v6 = v47;
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    ANE_ValidateConcatUnit_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_34;
  }
  v7 = 0;
LABEL_38:

  return v7;
}

BOOL ANE_BuildANECTensorDesc(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v20 = 0;
    v7 = (id *)&v20;
    ANE_GetTensor4DShapeWithOnePrepended(v5, &v20);
  }
  else
  {
    v19 = 0;
    v7 = (id *)&v19;
    ANE_GetTensor4DShapeWithBatchFirst(v5, &v19);
  }
  v8 = *v7;
  ANECTensorDimsInitialize();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0, 0, 0, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v17 = objc_msgSend(v9, "longValue");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v17 + 1) = objc_msgSend(v10, "longValue");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v18 = objc_msgSend(v11, "longValue");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v18 + 1) = objc_msgSend(v12, "longValue");

  ANECTensorDescInitialize();
  ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v6, "dataType"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    *(_QWORD *)a1 = v13;
    *(_OWORD *)(a1 + 8) = v17;
    *(_OWORD *)(a1 + 24) = v18;
    *(_QWORD *)(a1 + 40) = 1;
    objc_msgSend(v5, "setInterleave:", 1);
    *(_QWORD *)(a1 + 48) = 1;
    *(_BYTE *)(a1 + 57) = (objc_msgSend(v5, "computeFlags") & 2) != 0;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      ANE_BuildANECTensorDesc_cold_1(v6, (uint64_t)v5, v15);

  }
  return v14 != 0;
}

id softLinkClass_ANEDeviceInfo_1()
{
  if (softLinkClass_ANEDeviceInfo_onceToken_1 != -1)
    dispatch_once(&softLinkClass_ANEDeviceInfo_onceToken_1, &__block_literal_global_76);
  return (id)softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo_1;
}

BOOL ANE_CreateUnitValidator(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  NSObject *v4;

  v2 = a2;
  v3 = ANECUnitValidatorCreate();
  if (v3 == 10)
  {
    +[MLCLog framework](MLCLog, "framework");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ANE_CreateUnitValidator_cold_1();

  }
  return v3 != 10;
}

uint64_t ANE_ValidateConvolutionUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  __int128 v59;
  uint64_t v60;
  int v61;
  int64x2_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  int64x2_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint8_t v74[64];
  _DWORD __dst[3];
  __int16 v76;
  int v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateConvolutionUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateConvolutionUnit_onceToken, &__block_literal_global_4);
  if ((ANE_ValidateConvolutionUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v74, 0, sizeof(v74));
    if (!ANE_BuildANECTensorDesc((uint64_t)v74, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        ANE_ValidateConvolutionUnit_cold_4(v30, v31, v32, v33, v34, v35, v36, v37);

      v7 = 0;
      goto LABEL_28;
    }
    v72 = 0uLL;
    v73 = 0;
    ANE_BuildANECKernelSize((uint64_t *)&v72, v6);
    v70 = 0uLL;
    v71 = 0;
    ANE_BuildANECPadding(&v70, v6);
    v69 = 0;
    v68 = 0;
    ANE_BuildANECStep(&v68, v6);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ANECKernelDilationRateInitialize();
    v66 = vdupq_n_s64(1uLL);
    v67 = 1;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelDilationX"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelDilationX"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v66.i64[0] = objc_msgSend(v11, "longValue");

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelDilationY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelDilationY"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v66.i64[1] = objc_msgSend(v13, "longValue");

    }
    v64 = 0u;
    v65 = 0u;
    ANECConvLayerDescInitialize();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Type"));
    v48 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelMode"));
    v49 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelType"));
    v50 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PaddingMode"));
    v51 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OutputChannels"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v14, "longValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NumGroups"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v15, "longValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelGroupReuse"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v16, "BOOLValue");

    v55 = v72;
    v56 = v73;
    v57 = v68;
    v58 = v69;
    v59 = v70;
    v60 = v71;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KernelMutable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v17, "BOOLValue");

    v62 = v66;
    v63 = v67;
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v47, v18))
    {
      +[MLCLog framework](MLCLog, "framework");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        ANE_ValidateConvolutionUnit_cold_3(v38, v39, v40, v41, v42, v43, v44, v45);

      v7 = 0;
      goto LABEL_27;
    }
    v19 = ANECValidateConvLayer();
    v7 = v19 == 0;
    if (v19)
    {
      v20 = v19;
      +[MLCLog framework](MLCLog, "framework");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateConvolutionUnit";
        v76 = 1024;
        v77 = v20;
        v78 = 2112;
        v79 = v18;
        v80 = 2112;
        v81 = v6;
        _os_log_error_impl(&dword_1D4999000, v21, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_27;
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    ANE_ValidateConvolutionUnit_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_26;
  }
  v7 = 0;
LABEL_29:

  return v7;
}

void ANE_BuildANECKernelSize(uint64_t *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  ANECKernelSizeInitialize();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Params"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("KernelWidth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("KernelHeight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("KernelDepth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("KernelDepth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longValue");

  }
  else
  {
    v10 = 1;
  }
  *a1 = v5;
  a1[1] = v7;
  a1[2] = v10;

}

void ANE_BuildANECPadding(_DWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  ANECPaddingInitialize();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Params"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadTop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  a1[2] = objc_msgSend(v4, "intValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadBot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a1[3] = objc_msgSend(v5, "intValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadLeft"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = objc_msgSend(v6, "intValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadRight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  a1[1] = objc_msgSend(v7, "intValue");

  a1[4] = 0;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadFront"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadFront"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a1[4] = objc_msgSend(v9, "intValue");

  }
  a1[5] = 0;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadBack"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PadBack"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a1[5] = objc_msgSend(v11, "intValue");

  }
}

void ANE_BuildANECStep(_DWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  ANECStepInitialize();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Params"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Step"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = objc_msgSend(v5, "intValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Step"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  a1[1] = objc_msgSend(v7, "intValue");

  a1[2] = 1;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Step"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 3)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Step"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a1[2] = objc_msgSend(v11, "intValue");

  }
}

uint64_t ANE_ValidateInstanceNormUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v41[9];
  _OWORD v42[4];
  _DWORD __dst[3];
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateInstanceNormUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateInstanceNormUnit_onceToken, &__block_literal_global_25_0);
  if ((ANE_ValidateInstanceNormUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v42, 0, sizeof(v42));
    if (!ANE_BuildANECTensorDesc((uint64_t)v42, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateInstanceNormUnit_cold_4(v9, v25, v26, v27, v28, v29, v30, v31);
      v7 = 0;
      goto LABEL_27;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    memset(&v41[1], 0, 56);
    ANECInstanceNormLayerDescInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Dimension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = objc_msgSend(v10, "count");
    if (objc_msgSend(v10, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v41[v11++ + 2] = v12;
      }
      while (v11 < objc_msgSend(v10, "count"));
    }
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v41, v13))
    {
      +[MLCLog framework](MLCLog, "framework");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        ANE_ValidateInstanceNormUnit_cold_3(v32, v33, v34, v35, v36, v37, v38, v39);

      v7 = 0;
      goto LABEL_26;
    }
    v14 = ANECValidateInstanceNormLayer();
    v7 = v14 == 0;
    if (v14)
    {
      v15 = v14;
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateInstanceNormUnit";
        v44 = 1024;
        v45 = v15;
        v46 = 2112;
        v47 = v13;
        v48 = 2112;
        v49 = v6;
        _os_log_error_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_26;
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    ANE_ValidateInstanceNormUnit_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_25;
  }
  v7 = 0;
LABEL_28:

  return v7;
}

uint64_t ANE_ValidateNeuronUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __int16 v11;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  _OWORD v50[4];
  _DWORD __dst[3];
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateNeuronUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateNeuronUnit_onceToken, &__block_literal_global_26_0);
  if ((ANE_ValidateNeuronUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v50, 0, sizeof(v50));
    if (!ANE_BuildANECTensorDesc((uint64_t)v50, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateNeuronUnit_cold_4(v9, v30, v31, v32, v33, v34, v35, v36);
      v7 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v47 = 0u;
    v48 = 0u;
    ANECNeuronLayerDescInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Type"));
    *(_QWORD *)&v47 = objc_claimAutoreleasedReturnValue();

    if ((__CFString *)v47 == CFSTR("LeakyReLU"))
    {
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("ReluSlope"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shortValue");

      _H0 = v11;
      __asm { FCVT            S0, H0 }
      DWORD2(v47) = _S0;
    }
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v46, v18))
    {
      +[MLCLog framework](MLCLog, "framework");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        ANE_ValidateNeuronUnit_cold_3(v37, v38, v39, v40, v41, v42, v43, v44);

      v7 = 0;
      goto LABEL_25;
    }
    v19 = ANECValidateNeuronLayer();
    v7 = v19 == 0;
    if (v19)
    {
      v20 = v19;
      +[MLCLog framework](MLCLog, "framework");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateNeuronUnit";
        v52 = 1024;
        v53 = v20;
        v54 = 2112;
        v55 = v18;
        v56 = 2112;
        v57 = v6;
        _os_log_error_impl(&dword_1D4999000, v21, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_25;
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    ANE_ValidateNeuronUnit_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_24;
  }
  v7 = 0;
LABEL_27:

  return v7;
}

BOOL ANE_ValidatePoolingUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v41;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  _BYTE v49[28];
  __int128 v50;
  uint64_t v51;
  int v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint8_t v57[64];
  _DWORD __dst[3];
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidatePoolingUnit_onceToken != -1)
    dispatch_once(&ANE_ValidatePoolingUnit_onceToken, &__block_literal_global_31_0);
  if ((ANE_ValidatePoolingUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v57, 0, sizeof(v57));
    if (!ANE_BuildANECTensorDesc((uint64_t)v57, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        ANE_ValidatePoolingUnit_cold_4(v24, v25, v26, v27, v28, v29, v30, v31);

      v7 = 0;
      goto LABEL_25;
    }
    v55 = 0uLL;
    v56 = 0;
    ANE_BuildANECKernelSize((uint64_t *)&v55, v6);
    v53 = 0uLL;
    v54 = 0;
    ANE_BuildANECPadding(&v53, v6);
    v52 = 0;
    v51 = 0;
    ANE_BuildANECStep(&v51, v6);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&v49[12] = 0u;
    v50 = 0u;
    ANECPoolLayerDescInitialize();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Type"));
    v43 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PaddingMode"));
    v44 = (id)objc_claimAutoreleasedReturnValue();

    v45 = v55;
    v46 = v56;
    v47 = v51;
    v48 = v52;
    *(_OWORD *)v49 = v53;
    *(_QWORD *)&v49[16] = v54;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AverageCountExcludePadding"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49[24] = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OutputChannels"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v50 = objc_msgSend(v11, "longValue");

    DWORD2(v50) = 1065353216;
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v12))
    {
      +[MLCLog framework](MLCLog, "framework");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        ANE_ValidatePoolingUnit_cold_3(v32, v33, v34, v35, v36, v37, v38, v39);

      v7 = 0;
      goto LABEL_24;
    }
    v13 = ANECValidatePoolLayer();
    v41 = v13 == 0;
    if (v13)
    {
      v14 = v13;
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidatePoolingUnit";
        v59 = 1024;
        v60 = v14;
        v61 = 2112;
        v62 = v12;
        v63 = 2112;
        v64 = v6;
        _os_log_error_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      if (!ANECUnitValidatorDelete())
        goto LABEL_23;
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:
        v7 = v41;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidatePoolingUnit_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_22;
  }
  v7 = 0;
LABEL_26:

  return v7;
}

uint64_t ANE_ValidateSoftmaxUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v39[3];
  __int128 v40;
  __int128 v41;
  _OWORD v42[4];
  _DWORD __dst[3];
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateSoftmaxUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateSoftmaxUnit_onceToken, &__block_literal_global_34_0);
  if ((ANE_ValidateSoftmaxUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v42, 0, sizeof(v42));
    if (!ANE_BuildANECTensorDesc((uint64_t)v42, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateSoftmaxUnit_cold_4(v9, v23, v24, v25, v26, v27, v28, v29);
      v7 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    ANECSoftmaxLayerDescInitialize();
    v39[1] = 1;
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Dimension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v39[2] = v10;
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v39, v11))
    {
      +[MLCLog framework](MLCLog, "framework");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        ANE_ValidateSoftmaxUnit_cold_3(v30, v31, v32, v33, v34, v35, v36, v37);

      v7 = 0;
      goto LABEL_23;
    }
    v12 = ANECValidateSoftmaxLayer();
    v7 = v12 == 0;
    if (v12)
    {
      v13 = v12;
      +[MLCLog framework](MLCLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateSoftmaxUnit";
        v44 = 1024;
        v45 = v13;
        v46 = 2112;
        v47 = v11;
        v48 = 2112;
        v49 = v6;
        _os_log_error_impl(&dword_1D4999000, v14, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_23;
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateSoftmaxUnit_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_22;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateReshapeUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _OWORD v49[4];
  _DWORD __dst[3];
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateReshapeUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateReshapeUnit_onceToken, &__block_literal_global_35);
  if ((ANE_ValidateReshapeUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v49, 0, sizeof(v49));
    if (!ANE_BuildANECTensorDesc((uint64_t)v49, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateReshapeUnit_cold_4(v9, v26, v27, v28, v29, v30, v31, v32);
      v7 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    ANECTensorDimsInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("ReshapedBatch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v46 = objc_msgSend(v10, "longValue");

    v48 = 1;
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("ReshapedChannel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v46 + 1) = objc_msgSend(v11, "longValue");

    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("ReshapedHeight"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v47 = objc_msgSend(v12, "longValue");

    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("ReshapedWidth"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v47 + 1) = objc_msgSend(v13, "longValue");

    ANECReshapeLayerDescInitialize();
    v43 = v46;
    v44 = v47;
    v45 = 1;
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v14))
    {
      +[MLCLog framework](MLCLog, "framework");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        ANE_ValidateReshapeUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);

      v7 = 0;
      goto LABEL_23;
    }
    v15 = ANECValidateReshapeLayer();
    v7 = v15 == 0;
    if (v15)
    {
      v16 = v15;
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateReshapeUnit";
        v51 = 1024;
        v52 = v16;
        v53 = 2112;
        v54 = v14;
        v55 = 2112;
        v56 = v6;
        _os_log_error_impl(&dword_1D4999000, v17, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_23;
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateReshapeUnit_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_22;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateTransposeUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  _OWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  id v45;
  _QWORD v46[13];
  _OWORD v47[4];
  _BYTE __dst[18];
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateTransposeUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateTransposeUnit_onceToken, &__block_literal_global_44);
  if ((ANE_ValidateTransposeUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v47, 0, sizeof(v47));
    if (!ANE_BuildANECTensorDesc((uint64_t)v47, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateTransposeUnit_cold_4(v9, v28, v29, v30, v31, v32, v33, v34);
      v7 = 0;
      goto LABEL_27;
    }
    v44 = v8;
    v45 = v5;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    memset(&v46[1], 0, 88);
    ANECTransposeLayerDescInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("TransposeDimensions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = objc_msgSend(v10, "count");
    if (objc_msgSend(v10, "count"))
    {
      v11 = 0;
      v12 = &v46[2];
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)__dst = 0;
        *(_QWORD *)&__dst[8] = 0;
        ANECDimensionMappingInitialize();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TransposeSourceDimension"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)__dst = v14;
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TransposeDestinationDimension"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&__dst[8] = v15;
        *v12++ = *(_OWORD *)__dst;

        ++v11;
      }
      while (v11 < objc_msgSend(v10, "count"));
    }
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v46, v16))
    {
      +[MLCLog framework](MLCLog, "framework");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        ANE_ValidateTransposeUnit_cold_3(v35, v36, v37, v38, v39, v40, v41, v42);

      v7 = 0;
      goto LABEL_26;
    }
    v17 = ANECValidateTransposeLayer();
    v7 = v17 == 0;
    if (v17)
    {
      v18 = v17;
      +[MLCLog framework](MLCLog, "framework");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__dst = 136315906;
        *(_QWORD *)&__dst[4] = "ANE_ValidateTransposeUnit";
        *(_WORD *)&__dst[12] = 1024;
        *(_DWORD *)&__dst[14] = v18;
        v49 = 2112;
        v50 = v16;
        v51 = 2112;
        v52 = v6;
        _os_log_error_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", __dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_26;
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_26:

        v8 = v44;
        v5 = v45;
LABEL_27:

        goto LABEL_28;
      }
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    ANE_ValidateTransposeUnit_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_25;
  }
  v7 = 0;
LABEL_28:

  return v7;
}

uint64_t ANE_ValidateReductionUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  id v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD v46[2];
  uint64_t v47;
  _OWORD v48[4];
  _DWORD __dst[3];
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateReductionUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateReductionUnit_onceToken, &__block_literal_global_51);
  if ((ANE_ValidateReductionUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v48, 0, sizeof(v48));
    if (!ANE_BuildANECTensorDesc((uint64_t)v48, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateReductionUnit_cold_4(v9, v25, v26, v27, v28, v29, v30, v31);
      v7 = 0;
      goto LABEL_27;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    v47 = 0;
    memset(v46, 0, sizeof(v46));
    ANECReductionLayerDescInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Type"));
    v42 = (id)objc_claimAutoreleasedReturnValue();

    v43 = CFSTR("Bypass");
    v44 = 0x3727C5AC3F800000;
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Dimension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v10, "count");
    if (objc_msgSend(v10, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)v46 + v11) = v12;

        ++v11;
      }
      while (v11 < objc_msgSend(v10, "count"));
    }
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v41, v13))
    {
      +[MLCLog framework](MLCLog, "framework");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        ANE_ValidateReductionUnit_cold_3(v32, v33, v34, v35, v36, v37, v38, v39);

      v7 = 0;
      goto LABEL_26;
    }
    v14 = ANECValidateReductionLayer();
    v7 = v14 == 0;
    if (v14)
    {
      v15 = v14;
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateReductionUnit";
        v50 = 1024;
        v51 = v15;
        v52 = 2112;
        v53 = v13;
        v54 = 2112;
        v55 = v6;
        _os_log_error_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_26;
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    ANE_ValidateReductionUnit_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_25;
  }
  v7 = 0;
LABEL_28:

  return v7;
}

BOOL ANE_ValidateBroadcastUnit(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  _OWORD v49[4];
  _OWORD v50[4];
  _DWORD __dst[3];
  __int16 v52;
  int v53;
  __int16 v54;
  NSObject *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (ANE_ValidateBroadcastUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateBroadcastUnit_onceToken, &__block_literal_global_54);
  if ((ANE_ValidateBroadcastUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v50, 0, sizeof(v50));
    if (!ANE_BuildANECTensorDesc((uint64_t)v50, v11, a4))
    {
      +[MLCLog framework](MLCLog, "framework");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        ANE_ValidateBroadcastUnit_cold_5(v24, v25, v26, v27, v28, v29, v30, v31);

      v10 = 0;
      goto LABEL_24;
    }
    memset(v49, 0, sizeof(v49));
    if (ANE_BuildANECTensorDesc((uint64_t)v49, v8, a4))
    {
      objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
      v12 = objc_claimAutoreleasedReturnValue();
      v48 = 0;
      if (ANE_CreateUnitValidator((uint64_t)&v48, v12))
      {
        v13 = ANECValidateBroadcastLayer();
        v10 = v13 == 0;
        if (v13)
        {
          v14 = v13;
          +[MLCLog framework](MLCLog, "framework");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            __dst[0] = 136315906;
            *(_QWORD *)&__dst[1] = "ANE_ValidateBroadcastUnit";
            v52 = 1024;
            v53 = v14;
            v54 = 2112;
            v55 = v12;
            v56 = 2112;
            v57 = v9;
            _os_log_error_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
          }

          if (!ANECUnitValidatorDelete())
            goto LABEL_23;
          +[MLCLog framework](MLCLog, "framework");
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_29;
          goto LABEL_28;
        }
        if (ANECUnitValidatorDelete())
        {
          +[MLCLog framework](MLCLog, "framework");
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
LABEL_29:

            goto LABEL_23;
          }
LABEL_28:
          ANE_ValidateBroadcastUnit_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
          goto LABEL_29;
        }
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      +[MLCLog framework](MLCLog, "framework");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        ANE_ValidateBroadcastUnit_cold_3(v39, v40, v41, v42, v43, v44, v45, v46);

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ANE_ValidateBroadcastUnit_cold_4(v12, v32, v33, v34, v35, v36, v37, v38);
    }
    v10 = 0;
    goto LABEL_23;
  }
  v10 = 0;
LABEL_25:

  return v10;
}

uint64_t ANE_ValidateElementWiseUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  void *v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v59[12];
  _BOOL4 v60;
  void *v61;
  void *v62;
  id v63;
  _BYTE *v64;
  __int128 v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD v68[2];
  id v69;
  int v70;
  const char *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _OWORD v76[35];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateElementWiseUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateElementWiseUnit_onceToken, &__block_literal_global_55);
  if ((ANE_ValidateElementWiseUnit_isAppleNeuralEngineAvailable & 1) != 0)
  {
    v7 = 0;
    goto LABEL_37;
  }
  v8 = objc_msgSend(v5, "count");
  v64 = v59;
  v9 = MEMORY[0x1E0C80A78]();
  if (!v9)
  {
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __asm { FMOV            V0.2S, #1.0 }
    v68[1] = _D0;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Type"));
    v69 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v68, v22))
    {
      +[MLCLog framework](MLCLog, "framework");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        ANE_ValidateElementWiseUnit_cold_3(v42, v43, v44, v45, v46, v47, v48, v49);

      v7 = 0;
      goto LABEL_36;
    }
    v63 = v6;
    v66 = 0;
    v67 = 0;
    v23 = ANECValidateElementWiseLayer();
    v7 = v23 == 0;
    if (v23)
    {
      v24 = v23;
      v60 = v23 == 0;
      v62 = v16;
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v76[0]) = 136315906;
        *(_QWORD *)((char *)v76 + 4) = "ANE_ValidateElementWiseUnit";
        WORD6(v76[0]) = 1024;
        *(_DWORD *)((char *)v76 + 14) = v24;
        WORD1(v76[1]) = 2112;
        *(_QWORD *)((char *)&v76[1] + 4) = v22;
        WORD6(v76[1]) = 2112;
        *(_QWORD *)((char *)&v76[1] + 14) = v63;
        _os_log_error_impl(&dword_1D4999000, v25, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)v76, 0x26u);
      }
      v61 = v22;

      v27 = v67;
      if (v67)
      {
        v28 = 0;
        *(_QWORD *)&v26 = 136315650;
        v65 = v26;
        do
        {
          memcpy(v76, (const void *)(v66 + 552 * v28), 0x228uLL);
          v29 = *(_QWORD *)&v76[0];
          if (*(_QWORD *)&v76[0])
          {
            v30 = 0;
            do
            {
              +[MLCLog framework](MLCLog, "framework");
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v32 = *((_QWORD *)v76 + v30 + 1);
                v70 = v65;
                v71 = "ANE_ValidateElementWiseUnit";
                v72 = 2048;
                v73 = v30;
                v74 = 2112;
                v75 = v32;
                _os_log_error_impl(&dword_1D4999000, v31, OS_LOG_TYPE_ERROR, "%s: ANE hardware constraint violation %lu: %@", (uint8_t *)&v70, 0x20u);
              }

              ++v30;
            }
            while (v29 != v30);
            v27 = v67;
          }
          ++v28;
        }
        while (v28 < v27);
      }
      v33 = ANECUnitValidatorDelete();
      v22 = v61;
      v16 = v62;
      v7 = v60;
      if (!v33)
        goto LABEL_35;
      +[MLCLog framework](MLCLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_35:
        v6 = v63;
LABEL_36:

        goto LABEL_37;
      }
      +[MLCLog framework](MLCLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    ANE_ValidateElementWiseUnit_cold_1(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_34;
  }
  v10 = 0;
  v11 = &v59[-64 * v9];
  while (1)
  {
    memset(v76, 0, 64);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ANE_BuildANECTensorDesc((uint64_t)v76, v12, a3);

    if (!v13)
      break;
    v14 = v76[1];
    *v11 = v76[0];
    v11[1] = v14;
    v15 = v76[3];
    v11[2] = v76[2];
    v11[3] = v15;
    ++v10;
    v11 += 4;
    if (v8 == v10)
      goto LABEL_9;
  }
  +[MLCLog framework](MLCLog, "framework");
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    ANE_ValidateElementWiseUnit_cold_4(v50, v51, v52, v53, v54, v55, v56, v57);

  v7 = 0;
LABEL_37:

  return v7;
}

uint64_t ANE_ValidateInputViewUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  id v46;
  _OWORD v47[4];
  _DWORD __dst[3];
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateInputViewUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateInputViewUnit_onceToken, &__block_literal_global_56);
  if ((ANE_ValidateInputViewUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v47, 0, sizeof(v47));
    if (!ANE_BuildANECTensorDesc((uint64_t)v47, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateInputViewUnit_cold_4(v9, v26, v27, v28, v29, v30, v31, v32);
      v7 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    v45 = 0;
    ANECInputViewLayerDescInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Dimension"));
    v46 = (id)objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Offset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Size"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    v43 = v11;
    v44 = v13;
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v14))
    {
      +[MLCLog framework](MLCLog, "framework");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        ANE_ValidateInputViewUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);

      v7 = 0;
      goto LABEL_23;
    }
    v15 = ANECValidateInputViewLayer();
    v7 = v15 == 0;
    if (v15)
    {
      v16 = v15;
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateInputViewUnit";
        v49 = 1024;
        v50 = v16;
        v51 = 2112;
        v52 = v14;
        v53 = 2112;
        v54 = v6;
        _os_log_error_impl(&dword_1D4999000, v17, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_23;
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateInputViewUnit_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_22;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateArgMinMaxUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _OWORD v48[4];
  _DWORD __dst[3];
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateArgMinMaxUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateArgMinMaxUnit_onceToken, &__block_literal_global_61);
  if ((ANE_ValidateArgMinMaxUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v48, 0, sizeof(v48));
    if (!ANE_BuildANECTensorDesc((uint64_t)v48, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateArgMinMaxUnit_cold_4(v9, v26, v27, v28, v29, v30, v31, v32);
      v7 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    ANECKernelSizeInitialize();
    ANECStepInitialize();
    ANECPaddingInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Mode"));
    *(_QWORD *)&v43 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("KernelHeight"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      *(_QWORD *)&v44 = objc_msgSend(v10, "longValue");
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("KernelWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      *((_QWORD *)&v43 + 1) = objc_msgSend(v12, "longValue");
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v14))
    {
      +[MLCLog framework](MLCLog, "framework");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        ANE_ValidateArgMinMaxUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);

      v7 = 0;
      goto LABEL_27;
    }
    v15 = ANECValidateArgMinMaxLayer();
    v7 = v15 == 0;
    if (v15)
    {
      v16 = v15;
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateArgMinMaxUnit";
        v50 = 1024;
        v51 = v16;
        v52 = 2112;
        v53 = v14;
        v54 = 2112;
        v55 = v6;
        _os_log_error_impl(&dword_1D4999000, v17, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_27;
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    ANE_ValidateArgMinMaxUnit_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_26;
  }
  v7 = 0;
LABEL_29:

  return v7;
}

uint64_t ANE_ValidateGOCUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  int v39;
  _OWORD v40[4];
  _DWORD __dst[3];
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateGOCUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateGOCUnit_onceToken, &__block_literal_global_68);
  if ((ANE_ValidateGOCUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v40, 0, sizeof(v40));
    if (!ANE_BuildANECTensorDesc((uint64_t)v40, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        ANE_ValidateGOCUnit_cold_4(v21, v22, v23, v24, v25, v26, v27, v28);

      v7 = 0;
      goto LABEL_24;
    }
    v39 = 0;
    ANECGOCLayerDescInitialize();
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v38, v9))
    {
      +[MLCLog framework](MLCLog, "framework");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        ANE_ValidateGOCUnit_cold_3(v29, v30, v31, v32, v33, v34, v35, v36);

      v7 = 0;
      goto LABEL_23;
    }
    v10 = ANECValidateGOCLayer();
    v7 = v10 == 0;
    if (v10)
    {
      v11 = v10;
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateGOCUnit";
        v42 = 1024;
        v43 = v11;
        v44 = 2112;
        v45 = v9;
        v46 = 2112;
        v47 = v6;
        _os_log_error_impl(&dword_1D4999000, v12, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      v7 = v7;
      if (!ANECUnitValidatorDelete())
        goto LABEL_23;
      +[MLCLog framework](MLCLog, "framework");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      +[MLCLog framework](MLCLog, "framework");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateGOCUnit_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_22;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateMatrixMultUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  void *v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v56[12];
  _BOOL4 v57;
  void *v58;
  void *v59;
  id v60;
  _BYTE *v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  _OWORD v74[35];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateMatrixMultUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateMatrixMultUnit_onceToken, &__block_literal_global_69);
  if ((ANE_ValidateMatrixMultUnit_isAppleNeuralEngineAvailable & 1) != 0)
  {
    v7 = 0;
    goto LABEL_37;
  }
  v8 = objc_msgSend(v5, "count");
  v61 = v56;
  v9 = MEMORY[0x1E0C80A78]();
  if (!v9)
  {
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v67 = 0;
    ANECMatrixMultLayerDescInitialize();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Bias"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v66) = v17 != 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OutputChannels"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v18, "longValue");

    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v65, v19))
    {
      +[MLCLog framework](MLCLog, "framework");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        ANE_ValidateMatrixMultUnit_cold_3(v39, v40, v41, v42, v43, v44, v45, v46);

      v7 = 0;
      goto LABEL_36;
    }
    v60 = v6;
    v63 = 0;
    v64 = 0;
    v20 = ANECValidateMatrixMultLayer();
    v7 = v20 == 0;
    if (v20)
    {
      v21 = v20;
      v57 = v20 == 0;
      v59 = v16;
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v74[0]) = 136315906;
        *(_QWORD *)((char *)v74 + 4) = "ANE_ValidateMatrixMultUnit";
        WORD6(v74[0]) = 1024;
        *(_DWORD *)((char *)v74 + 14) = v21;
        WORD1(v74[1]) = 2112;
        *(_QWORD *)((char *)&v74[1] + 4) = v19;
        WORD6(v74[1]) = 2112;
        *(_QWORD *)((char *)&v74[1] + 14) = v60;
        _os_log_error_impl(&dword_1D4999000, v22, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)v74, 0x26u);
      }
      v58 = v19;

      v24 = v64;
      if (v64)
      {
        v25 = 0;
        *(_QWORD *)&v23 = 136315650;
        v62 = v23;
        do
        {
          memcpy(v74, (const void *)(v63 + 552 * v25), 0x228uLL);
          v26 = *(_QWORD *)&v74[0];
          if (*(_QWORD *)&v74[0])
          {
            v27 = 0;
            do
            {
              +[MLCLog framework](MLCLog, "framework");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                v29 = *((_QWORD *)v74 + v27 + 1);
                v68 = v62;
                v69 = "ANE_ValidateMatrixMultUnit";
                v70 = 2048;
                v71 = v27;
                v72 = 2112;
                v73 = v29;
                _os_log_error_impl(&dword_1D4999000, v28, OS_LOG_TYPE_ERROR, "%s: ANE hardware constraint violation %lu: %@", (uint8_t *)&v68, 0x20u);
              }

              ++v27;
            }
            while (v26 != v27);
            v24 = v64;
          }
          ++v25;
        }
        while (v25 < v24);
      }
      v30 = ANECUnitValidatorDelete();
      v19 = v58;
      v16 = v59;
      v7 = v57;
      if (!v30)
        goto LABEL_35;
      +[MLCLog framework](MLCLog, "framework");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_35:
        v6 = v60;
LABEL_36:

        goto LABEL_37;
      }
      +[MLCLog framework](MLCLog, "framework");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    ANE_ValidateMatrixMultUnit_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_34;
  }
  v10 = 0;
  v11 = &v56[-64 * v9];
  while (1)
  {
    memset(v74, 0, 64);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ANE_BuildANECTensorDesc((uint64_t)v74, v12, a3);

    if (!v13)
      break;
    v14 = v74[1];
    *v11 = v74[0];
    v11[1] = v14;
    v15 = v74[3];
    v11[2] = v74[2];
    v11[3] = v15;
    ++v10;
    v11 += 4;
    if (v8 == v10)
      goto LABEL_9;
  }
  +[MLCLog framework](MLCLog, "framework");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    ANE_ValidateMatrixMultUnit_cold_4(v47, v48, v49, v50, v51, v52, v53, v54);

  v7 = 0;
LABEL_37:

  return v7;
}

BOOL ANE_ValidateLayerNormUnit(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v44;
  uint64_t v45;
  __int128 v46;
  _OWORD v47[2];
  uint64_t v48;
  _OWORD v49[4];
  _DWORD __dst[3];
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (ANE_ValidateLayerNormUnit_onceToken != -1)
    dispatch_once(&ANE_ValidateLayerNormUnit_onceToken, &__block_literal_global_72);
  if ((ANE_ValidateLayerNormUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v49, 0, sizeof(v49));
    if (!ANE_BuildANECTensorDesc((uint64_t)v49, v8, a3))
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ANE_ValidateLayerNormUnit_cold_4(v9, v13, v14, v15, v16, v17, v18, v19);
      v7 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Params"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NumGroups"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NumGroups"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

    }
    else
    {
      v12 = 1;
    }

    v48 = 0;
    memset(v47, 0, sizeof(v47));
    v46 = 0u;
    ANECLayerNormLayerDescInitialize();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Dimension"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v46 = objc_msgSend(v20, "count");
    if (objc_msgSend(v20, "count"))
    {
      v21 = 0;
      do
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        *((_QWORD *)v47 + v21++) = v22;
      }
      while (v21 < objc_msgSend(v20, "count"));
    }
    *((_QWORD *)&v46 + 1) = v12;
    objc_msgSend(softLinkClass_ANEDeviceInfo_1(), "aneSubType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v45, v23))
    {
      +[MLCLog framework](MLCLog, "framework");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        ANE_ValidateLayerNormUnit_cold_3(v35, v36, v37, v38, v39, v40, v41, v42);

      v7 = 0;
      goto LABEL_30;
    }
    v24 = ANECValidateLayerNormLayer();
    v44 = v24 == 0;
    if (v24)
    {
      v25 = v24;
      +[MLCLog framework](MLCLog, "framework");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(_QWORD *)&__dst[1] = "ANE_ValidateLayerNormUnit";
        v51 = 1024;
        v52 = v25;
        v53 = 2112;
        v54 = v23;
        v55 = 2112;
        v56 = v6;
        _os_log_error_impl(&dword_1D4999000, v26, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      if (!ANECUnitValidatorDelete())
        goto LABEL_29;
      +[MLCLog framework](MLCLog, "framework");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_29:
        v7 = v44;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      +[MLCLog framework](MLCLog, "framework");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    ANE_ValidateLayerNormUnit_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_28;
  }
  v7 = 0;
LABEL_32:

  return v7;
}

void __isAppleNeuralEngineAPIAvailable_block_invoke()
{
  char v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (AppleNeuralEngineLibrary_onceToken_2 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_2, &__block_literal_global_74);
  if (AppleNeuralEngineLibrary_frameworkLibrary_2 && softLinkClass_ANEDeviceInfo_1())
  {
    v0 = 1;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __isAppleNeuralEngineAPIAvailable_block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

    v0 = 0;
  }
  isAppleNeuralEngineAPIAvailable_isAvailable = v0;
}

id ANE_BuildReductionParams(int a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  ANE_Get4DReductionDimensions(a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v13 = 0;
    goto LABEL_27;
  }
  v23 = xmmword_1E98209C0;
  v24 = *(_OWORD *)off_1E98209D0;
  if ((a1 - 1) < 4)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Reduction"), kMLCANENetUnitType[0], v23, v24);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *((_QWORD *)&v23 + (a1 - 1)), CFSTR("Type"));
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ANE_GetANECIRDimension(objc_msgSend(v10, "unsignedIntegerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addObject:", v11);
        ++v9;
      }
      while (v9 < objc_msgSend(v7, "count"));
    }
    v12 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("Dimension"));

    goto LABEL_20;
  }
  if ((a1 - 5) > 1)
  {
    +[MLCLog framework](MLCLog, "framework", v23, v24);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      ANE_BuildReductionParams_cold_1();

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("ArgMinMax"), kMLCANENetUnitType[0], v23, v24);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    if ((unint64_t)(v15 - 2) < 2)
    {
      v16 = CFSTR("SpatialArgMax");
      v17 = CFSTR("SpatialArgMin");
LABEL_16:
      if (a1 == 6)
        v19 = v17;
      else
        v19 = v16;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("Mode"));
LABEL_20:
      v13 = (void *)objc_msgSend(v6, "copy");
      goto LABEL_25;
    }
    if (v15 == 1)
    {
      v16 = CFSTR("ChannelArgMax");
      v17 = CFSTR("ChannelArgMin");
      goto LABEL_16;
    }
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      ANE_BuildReductionParams_cold_2(v7);

  }
  v13 = 0;
LABEL_25:
  for (i = 24; i != -8; i -= 8)

LABEL_27:
  return v13;
}

id ANE_Get4DReductionDimensions(unint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v18;

  v3 = a2;
  if (a1 < 5)
  {
    v4 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (objc_msgSend(v3, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        v18 = 1;
        ANE_GetDimensionIn4DWithOnePrepended(a1, v15, &v18);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v4, "addObject:", v16);

        ++v13;
      }
      while (v13 < objc_msgSend(v3, "count"));
    }
    v12 = -[NSObject copy](v4, "copy");
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ANE_Get4DReductionDimensions_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = 0;
  }

  return v12;
}

id ANE_CreateReductionLayer(int a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  ANE_BuildReductionParams(a1, v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[_MLCANEReductionParameters reductionUnitParametersWith:](_MLCANEReductionParameters, "reductionUnitParametersWith:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 30, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "addObject:", v9);
    v10 = v6;

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      ANE_CreateReductionLayer_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

id ANE_CompileReductionLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;

  v5 = a2;
  v6 = a1;
  objc_msgSend(a3, "parentLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "params");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reductionParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 1;
  v30 = 1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v14, &v30, &v29);
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  objc_msgSend(v8, "dimensions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_Get4DReductionDimensions(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v8, "reductionType");
  if ((v20 - 1) >= 4)
  {
    if ((v20 - 5) > 1)
    {
      +[MLCLog framework](MLCLog, "framework");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        ANE_CompileReductionLayer_cold_1(v8, v21);
      goto LABEL_18;
    }
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

    if (v24 != 1)
    {
      if (v24 == 3)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9844290, CFSTR("KernelHeight"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("KernelWidth"));

      }
      else
      {
        if (v24 != 2)
        {
          +[MLCLog framework](MLCLog, "framework");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            ANE_CompileReductionLayer_cold_2(v19);
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("KernelHeight"));

        objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9844290, CFSTR("KernelWidth"));
      }
    }
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v8, v12);
    v21 = objc_claimAutoreleasedReturnValue();
    if ((ANE_ValidateArgMinMaxUnit(v5, v21, 1) & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
LABEL_16:
        ANE_CompileReductionLayer_cold_3();
LABEL_17:

LABEL_18:
      v27 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v8, v12);
    v21 = objc_claimAutoreleasedReturnValue();
    if ((ANE_ValidateReductionUnit(v5, v21, 1) & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      goto LABEL_17;
    }
  }
  objc_msgSend(v13, "addObject:", v21);

  v27 = (void *)objc_msgSend(v13, "copy");
LABEL_19:

  return v27;
}

id ANE_CreateSoftmaxLayer(int a1, unint64_t a2, unint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v14;
  int v15;
  unint64_t v16;

  v16 = 1;
  ANE_GetDimensionIn4DWithOnePrepended(a3, a2, (uint64_t *)&v16);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Softmax"), kMLCANENetUnitType[0]);
  ANE_GetANECIRDimension(v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Dimension"));

  if (a1 == 1)
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Neuron"), kMLCANENetUnitType[0]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Log2"), CFSTR("Type"));
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
    v15 = 1060205080;
    v14 = 0;
    ANE_ConvertFp32ToInt16((uint64_t)&v15, &v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("ScaleScalar"));

  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  +[_MLCANESoftmaxParameters softmaxUnitParametersWith:neuronParams:gocParams:](_MLCANESoftmaxParameters, "softmaxUnitParametersWith:neuronParams:gocParams:", v5, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 12, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "addObject:", v12);

  return v4;
}

id ANE_CompileSoftmaxLayer(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend(a3, "parentLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "params");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "softmaxParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = ANE_ValidateSoftmaxUnit(v12, v11, 1);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v10, "addObject:", v11);
    if (objc_msgSend(v6, "operation") != 1)
      goto LABEL_28;
    objc_msgSend(v6, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("_0"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("_1"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("_2"));
    v53 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("Name"));
    objc_msgSend(v8, "neuronParams");
    v19 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v19;
    if (v19)
    {
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v6, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v52 = v17;
      -[NSObject setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v17, CFSTR("Name"));
      v50 = v15;
      v57[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, CFSTR("Bottom"));

      objc_msgSend(v6, "sourceTensors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = ANE_ValidateNeuronUnit(v22, v20, 1);

      v55 = v20;
      if ((v23 & 1) != 0)
      {
        objc_msgSend(v10, "addObject:", v20);
        objc_msgSend(v8, "gocParams");
        v24 = objc_claimAutoreleasedReturnValue();
        v51 = v24;
        if (v24)
        {
          +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v6, v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v53;
          -[NSObject setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v53, CFSTR("Name"));
          v56 = v52;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v27, CFSTR("Bottom"));

          objc_msgSend(v6, "sourceTensors");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = ANE_ValidateGOCUnit(v28, v25, 1);

          if ((v29 & 1) != 0)
          {
            objc_msgSend(v10, "addObject:", v25);
            v30 = 0;
          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              ANE_CompileSoftmaxLayer_cold_3();

            v30 = 1;
          }
          v15 = v50;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v25 = objc_claimAutoreleasedReturnValue();
          v15 = v50;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            ANE_CompileSoftmaxLayer_cold_2(v25, v40, v41, v42, v43, v44, v45, v46);
          v30 = 1;
          v26 = (void *)v53;
        }

        v17 = v52;
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          ANE_CompileSoftmaxLayer_cold_3();
        v30 = 1;
        v15 = v50;
        v26 = (void *)v53;
      }

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v32 = objc_claimAutoreleasedReturnValue();
      v55 = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        ANE_CompileSoftmaxLayer_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
      v30 = 1;
      v26 = (void *)v53;
    }

    if (!v30)
    {
LABEL_28:
      v48 = (void *)objc_msgSend(v10, "copy");
      goto LABEL_29;
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      ANE_CompileSoftmaxLayer_cold_3();

  }
  v48 = 0;
LABEL_29:

  return v48;
}

id buildBNNSDescInputWeightMomentumForOneGate(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v9 = 0u;
  v10 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  v5 = a3 - 1;
  if (!a5)
    a1 = a2;
  if (a5)
    v5 = 1;
  v7 = 1;
  if (a4)
    v7 = 2;
  *((_QWORD *)&v9 + 1) = a1;
  *(_QWORD *)&v10 = a2;
  *((_QWORD *)&v10 + 1) = v7;
  *(_QWORD *)&v11 = v5;
  DWORD1(v19) = 1065353216;
  LODWORD(v18) = 65568;
  DWORD1(v9) = 131328;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 176);
  return (id)objc_claimAutoreleasedReturnValue();
}

id buildBNNSDescHiddenWeightMomentumForOneGate(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v5 = 0u;
  v6 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = 1;
  if (a3)
    v3 = 2;
  v12 = 0uLL;
  v13 = 0uLL;
  v10 = 0uLL;
  v11 = 0uLL;
  v8 = 0uLL;
  v9 = 0uLL;
  *((_QWORD *)&v5 + 1) = a1;
  *(_QWORD *)&v6 = a1;
  *((_QWORD *)&v6 + 1) = v3;
  v7 = a2;
  DWORD1(v15) = 1065353216;
  LODWORD(v14) = 65568;
  DWORD1(v5) = 131328;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v5, 176);
  return (id)objc_claimAutoreleasedReturnValue();
}

id createNewBNNSNDArrayForLSTM(size_t a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v2 = a2[9];
  v9 = a2[8];
  v10 = v2;
  v11 = a2[10];
  v3 = a2[5];
  v8[4] = a2[4];
  v8[5] = v3;
  v4 = a2[7];
  v8[6] = a2[6];
  v8[7] = v4;
  v5 = a2[1];
  v8[0] = *a2;
  v8[1] = v5;
  v6 = a2[3];
  v8[2] = a2[2];
  v8[3] = v6;
  *((_QWORD *)&v9 + 1) = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 176);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL CPU_BuildBNNSLSTMInputAndOutput(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  size_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;

  a1[2] = a2;
  a1[4] = a3;
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[3];
  v12 = *((_DWORD *)a1 + 11);
  v13 = a5;
  objc_msgSend(v13, "combinedInputsBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "combinedOutputsBuffer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == a4)
  {
    v27 = v9;
    if ((v12 & 1) != 0)
      v15 = 2;
    else
      v15 = 1;
    a1[29] = a4;
    a1[30] = a2;
    a1[31] = a3;
    *((_DWORD *)a1 + 92) = 65568;
    a1[51] = v10;
    a1[52] = a2;
    a1[53] = v15;
    a1[54] = v11;
    *((_DWORD *)a1 + 136) = 65568;
    a1[73] = v10;
    a1[74] = a2;
    a1[75] = v15;
    a1[76] = v11;
    v26 = v14;
    v16 = v10 * a2 * (v11 << (v12 & 1));
    *((_DWORD *)a1 + 180) = 65568;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a1[89] = objc_msgSend(v25, "bytes");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a1[67] = objc_msgSend(v28, "bytes");
    v24 = a3 * a2;
    v29 = a4;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(a3 * a2 * a4, 4uLL, 0x100004052888210uLL), 4 * a3 * a2 * a4, 1);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a1[45] = objc_msgSend(v17, "bytes");
    a1[95] = v10;
    a1[96] = v15;
    a1[97] = a2;
    a1[98] = a3;
    *((_DWORD *)a1 + 224) = 65568;
    a1[117] = v10;
    a1[118] = a2;
    a1[119] = v15;
    a1[120] = v11;
    *((_DWORD *)a1 + 268) = 65568;
    a1[139] = v10;
    a1[140] = a2;
    a1[141] = v15;
    v9 = v27;
    a1[142] = v11;
    *((_DWORD *)a1 + 312) = 65568;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a1[133] = objc_msgSend(v18, "bytes");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a1[155] = objc_msgSend(v19, "bytes");
    objc_msgSend(v26, "addObject:", v17);
    objc_msgSend(v26, "addObject:", v28);
    objc_msgSend(v26, "addObject:", v25);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(4 * v10 * (v24 << (v12 & 1)), 0x100004052888210uLL), 4 * v10 * (v24 << (v12 & 1)), 1);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a1[111] = objc_msgSend(v20, "bytes");
    v21 = v30;
    objc_msgSend(v30, "addObject:", v20);
    objc_msgSend(v30, "addObject:", v18);
    objc_msgSend(v30, "addObject:", v19);

    a4 = v29;
    v14 = v26;
  }
  else
  {
    v21 = v30;
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      CPU_BuildBNNSLSTMInputAndOutput_cold_1(v9, a4, v22);

  }
  return v9 == a4;
}

void setBiasOptimizerData(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t __n;
  uint64_t v31;
  id v32;

  v27 = a1;
  v32 = a2;
  v7 = objc_msgSend(v27, "numLayers");
  v8 = objc_msgSend(v27, "biDirectional");
  v9 = objc_msgSend(v27, "hiddenSize");
  objc_msgSend(v27, "biasMomentumData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = a4;
  objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_retainAutorelease(v11);
  v12 = v8;
  __n = 4 * v9;
  v31 = *(_QWORD *)(objc_msgSend(v25, "bytes") + 136);
  v13 = v7;
  if (v7)
  {
    v14 = v9;
    v15 = 0;
    do
    {
      v16 = 0;
      v17 = 1;
      do
      {
        v18 = v17;
        v19 = (void *)(v31 + 4 * (v16 + (v15 << v12)) * v14);
        objc_msgSend(v32, "objectAtIndexedSubscript:", a3 + 4 * (v15 + v16 * v13));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "optimizerData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        memcpy(v19, (const void *)objc_msgSend(v22, "bytes"), __n);

        if (!v12)
          break;
        v17 = 0;
        v16 = 1;
      }
      while ((v18 & 1) != 0);
      ++v15;
    }
    while (v15 != v13);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v31, __n * (v13 << v12), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "biasMomentumDataBytes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:atIndexedSubscript:", v23, v26);

}

void setBNNSLSTMGateDesc(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "inputSize");
  v5 = objc_msgSend(v3, "hiddenSize");
  v6 = objc_msgSend(v3, "isBidirectional");
  v7 = v6;
  if (v6)
    v8 = 2;
  else
    v8 = 1;
  v9 = objc_msgSend(v3, "layerCount");
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 360) = v5;
  *(_QWORD *)(a1 + 368) = v5;
  *(_QWORD *)(a1 + 376) = v8;
  *(_QWORD *)(a1 + 384) = v9;
  *(_QWORD *)(a1 + 516) = 1065353216;
  *(_QWORD *)(a1 + 164) = 1065353216;
  *(_DWORD *)(a1 + 144) = 65568;
  *(_DWORD *)(a1 + 496) = 65568;
  *(_DWORD *)(a1 + 4) = 131328;
  *(_DWORD *)(a1 + 356) = 131328;
  v10 = objc_msgSend(v3, "usesBiases");

  if (v10)
  {
    *(_QWORD *)(a1 + 712) = v5;
    *(_QWORD *)(a1 + 720) = v8;
    *(_QWORD *)(a1 + 728) = v9;
    *(_QWORD *)(a1 + 776) = 1;
    *(_QWORD *)(a1 + 784) = v5;
    *(_QWORD *)(a1 + 792) = v5 << v7;
    *(_QWORD *)(a1 + 868) = 1065353216;
    *(_DWORD *)(a1 + 848) = 65568;
    *(_DWORD *)(a1 + 708) = 229376;
  }
  if (v9 >= 2)
  {
    *(_QWORD *)(a1 + 184) = v5;
    *(_QWORD *)(a1 + 192) = v5;
    *(_QWORD *)(a1 + 200) = v8;
    *(_QWORD *)(a1 + 208) = v9 - 1;
    *(_QWORD *)(a1 + 340) = 1065353216;
    *(_DWORD *)(a1 + 320) = 65568;
    *(_DWORD *)(a1 + 180) = 131328;
  }
}

void addInputWeightPointersToGate(uint64_t a1, void *a2, int a3, unint64_t a4, uint64_t a5, void *a6, int a7)
{
  id v13;
  id v14;
  size_t v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;

  v13 = a2;
  v14 = a6;
  if (!a7)
  {
    v22 = a4 - 1;
    v23 = malloc_type_malloc(8 * ((a4 - 1) << a3), 0x80040B8603338uLL);
    if (v23)
    {
      v17 = v23;
      v38 = 8 * ((a4 - 1) << a3);
      v39 = a1;
      v40 = v14;
      if (a4 >= 2)
      {
        v24 = 0;
        v25 = a5 + 4;
        v41 = 4 * a4;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v25, v38, v39, v40);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "data");
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17[v24 << a3] = objc_msgSend(v27, "bytes");

          if (a3)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v41 + v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "data");
            v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v17[(v24 << a3) + 1] = objc_msgSend(v29, "bytes");

          }
          v25 += 4;
          ++v24;
        }
        while (v22 != v24);
      }
      v14 = v40;
      *(_QWORD *)(v39 + 312) = v17;
      v15 = v38;
      goto LABEL_16;
    }
    +[MLCLog framework](MLCLog, "framework");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
LABEL_20:
    addInputWeightPointersToGate_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_21;
  }
  if (a3)
    v15 = 16;
  else
    v15 = 8;
  v16 = malloc_type_malloc(v15, 0x80040B8603338uLL);
  if (!v16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    goto LABEL_20;
  }
  v17 = v16;
  objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "data");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *v17 = objc_msgSend(v19, "bytes");

  if (a3)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", a5 + 4 * a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "data");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17[1] = objc_msgSend(v21, "bytes");

  }
  *(_QWORD *)(a1 + 136) = v17;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v17, v15, 1, v38, v39, v40);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v30);
LABEL_21:

}

id createParameterPointersForGate(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v9 = a1;
  v10 = a5;
  v11 = malloc_type_malloc(8 * (a3 << a4), 0x80040B8603338uLL);
  if (v11)
  {
    v12 = v11;
    if (a3)
    {
      v13 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "data");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12[v13 << a4] = objc_msgSend(v15, "bytes");

        if (a4)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 4 * a3 + a2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "data");
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v12[(v13 << a4) + 1] = objc_msgSend(v17, "bytes");

        }
        ++v13;
        a2 += 4;
      }
      while (a3 != v13);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, 8 * (a3 << a4), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      createParameterPointersForGate_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);

    v18 = 0;
  }

  return v18;
}

id createBiDirectionalAndStackedGateWeightData(size_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  size_t v20;
  id v21;
  uint64_t v22;
  id v24;

  v24 = a2;
  v20 = a1;
  v21 = a7;
  v12 = (char *)malloc_type_malloc(a1, 0xECD43C9BuLL);
  if (a4)
  {
    v13 = 0;
    v22 = 4 * a4;
    do
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", a5, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "data");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      memcpy(&v12[4 * (v13 << a3)], (const void *)objc_msgSend(v15, "bytes"), 4 * a6);

      if (a3)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", v22 + a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "data");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        memcpy(&v12[4 * (v13 << a3) + 4 * a6], (const void *)objc_msgSend(v17, "bytes"), 4 * a6);

      }
      a5 += 4;
      v13 += a6;
      --a4;
    }
    while (a4);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, v20, 1, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v18);

  return v18;
}

NSObject *ANE_CreatePoolingLayer(void *a1, _QWORD *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if ((unint64_t)objc_msgSend(v3, "dilationRateInX") <= 1
    && (unint64_t)objc_msgSend(v3, "dilationRateInY") < 2)
  {
    v4 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Pooling"), kMLCANENetUnitType[0]);
    v14 = objc_msgSend(v3, "poolingType");
    switch(v14)
    {
      case 1:
        v16 = CFSTR("Max");
        v17 = CFSTR("Negative");
        goto LABEL_11;
      case 3:
        +[MLCLog framework](MLCLog, "framework");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
LABEL_17:
          ANE_CreatePoolingLayer_cold_2(v3, v22);
        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "countIncludesPadding") ^ 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("AverageCountExcludePadding"));

        v16 = CFSTR("Avg");
        v17 = CFSTR("Zero");
LABEL_11:
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("Type"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("PaddingMode"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "kernelWidth"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("KernelWidth"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "kernelHeight"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("KernelHeight"));

        objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E98442A8, CFSTR("KernelDepth"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "strideInX"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "strideInY", v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v21;
        v30[2] = &unk_1E98442A8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("Step"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("PadLeft"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2[1]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("PadRight"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2[2]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("PadTop"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2[3]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("PadBot"));

        objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E98442C0, CFSTR("PadFront"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E98442C0, CFSTR("PadBack"));
        +[_MLCANEPoolingParameters poolingUnitParametersWith:](_MLCANEPoolingParameters, "poolingUnitParametersWith:", v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 11, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          -[NSObject addObject:](v4, "addObject:", v28);
        v12 = v4;

        goto LABEL_19;
      default:
        +[MLCLog framework](MLCLog, "framework");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        break;
    }
    v12 = MEMORY[0x1E0C9AA60];
LABEL_19:

    goto LABEL_20;
  }
  +[MLCLog framework](MLCLog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    ANE_CreatePoolingLayer_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = MEMORY[0x1E0C9AA60];
LABEL_20:

  return v12;
}

BOOL ANE_ValidatePoolingLayer(void *a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(a1, "sourceTensors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ANE_ValidatePoolingUnit(v4, v3, 1);

  return v5;
}

id ANE_CompilePoolingLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1;
  v65 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v6, "parentLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v10;
  objc_msgSend(v10, "params");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "poolingParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "dimensionCount");

  if (v16 != 4)
  {
    if (v16 != 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        ANE_CompilePoolingLayer_cold_1();
      goto LABEL_17;
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E98442A8, CFSTR("KernelHeight"));
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Step"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "setObject:atIndexedSubscript:", &unk_1E98442A8, 1);
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("Step"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E98442C0, CFSTR("PadTop"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E98442C0, CFSTR("PadBot"));

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("KernelWidth"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("KernelHeight"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  v68 = 0;
  v69 = 0;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_GetTensorWidthAndHeightWithBatchFirst(v24, &v69, &v68);

  v66 = 0;
  v67 = 0;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v6, &v67, &v66);
  if (v21 == v69 && v23 == v68 && v67 == 1 && v66 == 1)
  {
    if (+[MLCPlatformInfo isAneSubTypeVersionGreaterThanOrEqualTo:](MLCPlatformInfo, "isAneSubTypeVersionGreaterThanOrEqualTo:", 13))
    {
      objc_msgSend(v9, "descriptor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "poolingType");

      if (v26 == 1)
      {
        v28 = 3;
        v27 = v65;
      }
      else
      {
        v27 = v65;
        if (v26 != 2)
        {
          +[MLCLog framework](MLCLog, "framework");
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            ANE_CompilePoolingLayer_cold_2();

          goto LABEL_21;
        }
        v28 = 2;
      }
      if (v16 == 4)
      {
        v29 = &unk_1E9844AE0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v50;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
        v29 = objc_claimAutoreleasedReturnValue();

      }
      ANE_BuildReductionParams(v28, v29, v16);
      v52 = objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v31 = v52;
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sourceTensors");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = ANE_ValidateReductionUnit(v54, v53, 1);

        if ((v55 & 1) != 0)
        {
          v27 = v65;
          objc_msgSend(v65, "addObject:", v53);

          goto LABEL_38;
        }
        +[MLCLog framework](MLCLog, "framework");
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          ANE_CompilePoolingLayer_cold_5((uint64_t)v53, (uint64_t)v9, v63);

LABEL_17:
        v30 = 0;
        v27 = v65;
        goto LABEL_22;
      }
      +[MLCLog framework](MLCLog, "framework");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        ANE_CompilePoolingLayer_cold_4(v31, v56, v57, v58, v59, v60, v61, v62);
    }
    else
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Step"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v40, "mutableCopy");

      -[NSObject setObject:atIndexedSubscript:](v29, "setObject:atIndexedSubscript:", &unk_1E98442A8, 0);
      -[NSObject setObject:atIndexedSubscript:](v29, "setObject:atIndexedSubscript:", &unk_1E98442A8, 1);
      v41 = -[NSObject copy](v29, "copy");
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v41, CFSTR("Step"));

      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v13);
      v31 = objc_claimAutoreleasedReturnValue();
      if (ANE_ValidatePoolingLayer(v9, v31))
      {
        v27 = v65;
        objc_msgSend(v65, "addObject:", v31);
LABEL_38:

        goto LABEL_14;
      }
      +[MLCLog framework](MLCLog, "framework");
      v42 = objc_claimAutoreleasedReturnValue();
      v27 = v65;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        ANE_CompilePoolingLayer_cold_6(v42, v43, v44, v45, v46, v47, v48, v49);

    }
LABEL_20:

LABEL_21:
    v30 = 0;
    goto LABEL_22;
  }
  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v13);
  v29 = objc_claimAutoreleasedReturnValue();
  if (!ANE_ValidatePoolingLayer(v9, v29))
  {
    +[MLCLog framework](MLCLog, "framework");
    v31 = objc_claimAutoreleasedReturnValue();
    v27 = v65;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      ANE_CompilePoolingLayer_cold_6(v31, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_20;
  }
  v27 = v65;
  objc_msgSend(v65, "addObject:", v29);
LABEL_14:

  v30 = (void *)objc_msgSend(v27, "copy");
LABEL_22:

  return v30;
}

id CPU_CreateLossLayer(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v17[11];
  _OWORD v18[11];
  _OWORD v19[22];
  __int128 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v4 = objc_msgSend(v2, "lossType");
  v20 = 0u;
  memset(v19, 0, sizeof(v19));
  v5 = 9;
  switch(v4)
  {
    case 0:
      goto LABEL_20;
    case 1:
      v5 = 3;
      goto LABEL_20;
    case 2:
      v7 = 1;
      goto LABEL_11;
    case 3:
      v7 = 2;
LABEL_11:
      LODWORD(v19[0]) = v7;
      DWORD2(v20) = getBNNSLossReductionFunction(objc_msgSend(v2, "reductionType"));
      goto LABEL_12;
    case 4:
      v5 = 10;
      goto LABEL_20;
    case 5:
      v5 = 8;
      goto LABEL_20;
    case 6:
      LODWORD(v19[0]) = 4;
      DWORD2(v20) = getBNNSLossReductionFunction(objc_msgSend(v2, "reductionType"));
      goto LABEL_16;
    case 7:
      v5 = 7;
      goto LABEL_20;
    case 8:
      v5 = 6;
LABEL_20:
      LODWORD(v19[0]) = v5;
      DWORD2(v20) = getBNNSLossReductionFunction(objc_msgSend(v2, "reductionType"));
      goto LABEL_21;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        CPU_CreateLossLayer_cold_1();

      LODWORD(v19[0]) = 1;
      DWORD2(v20) = getBNNSLossReductionFunction(objc_msgSend(v2, "reductionType"));
      if (v4 == 6)
      {
LABEL_16:
        objc_msgSend(v2, "delta");
        goto LABEL_17;
      }
      if (v4 == 3 || v4 == 2)
      {
LABEL_12:
        objc_msgSend(v2, "labelSmoothing");
LABEL_17:
        HIDWORD(v20) = v8;
      }
LABEL_21:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v19, 368);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v18, 0, sizeof(v18));
      memset(v17, 0, sizeof(v17));
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v18, 176);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, 176);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 12, v9, v12, v13, 0, 0, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v2, "weight");
        objc_msgSend(v14, "setLossWeight:");
        objc_msgSend(v3, "addObject:", v14);
      }
      v15 = (void *)objc_msgSend(v3, "copy");

      return v15;
  }
}

uint64_t getBNNSLossReductionFunction(unsigned int a1)
{
  NSObject *v2;

  if (a1 < 3)
    return dword_1D4AB8D98[a1];
  +[MLCLog framework](MLCLog, "framework");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    getBNNSLossReductionFunction_cold_1();

  return 0;
}

id CPU_CreateYOLOLossLayer(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _OWORD v23[11];
  _OWORD v24[11];
  _OWORD v25[22];
  uint64_t v26;
  int BNNSLossReductionFunction;
  int v28;
  __int128 v29;
  __int128 v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v29 = 0u;
  v30 = 0u;
  v26 = 0;
  memset(v25, 0, sizeof(v25));
  LODWORD(v25[0]) = 5;
  objc_msgSend(v2, "spatialSizeLossDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delta");
  v28 = v5;

  BNNSLossReductionFunction = getBNNSLossReductionFunction(objc_msgSend(v2, "reductionType"));
  v31 = objc_msgSend(v2, "shouldRescore");
  objc_msgSend(v2, "scaleSpatialPositionLoss");
  v32 = v6;
  objc_msgSend(v2, "scaleSpatialSizeLoss");
  v33 = v7;
  objc_msgSend(v2, "scaleObjectConfidenceLoss");
  v34 = v8;
  objc_msgSend(v2, "scaleNoObjectConfidenceLoss");
  v35 = v9;
  objc_msgSend(v2, "scaleClassLoss");
  v36 = v10;
  objc_msgSend(v2, "minimumIOUForObjectPresence");
  v37 = v11;
  objc_msgSend(v2, "maximumIOUForObjectAbsence");
  v38 = v12;
  *(_QWORD *)&v30 = objc_msgSend(v2, "anchorBoxCount");
  objc_msgSend(v2, "anchorBoxes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v39 = objc_msgSend(v14, "bytes");

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v25, 440);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v24, 0, sizeof(v24));
  memset(v23, 0, sizeof(v23));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24, 176);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 176);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 18, v15, v18, v19, 0, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v3, "addObject:", v20);
  v21 = (void *)objc_msgSend(v3, "copy");

  return v21;
}

uint64_t CPU_CompileLossLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _OWORD v27[2];

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "params");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend(v26, "bytes");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor(v23 + 8, v9, v12, 0, objc_msgSend(v14, "dataType"), 1, 0);

  objc_msgSend(v6, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stride");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor(v23 + 184, v16, v18, 0, objc_msgSend(v19, "dataType"), 1, 0);

  memset(v27, 0, sizeof(v27));
  LODWORD(v27[0]) = 1;
  v20 = MEMORY[0x1D8263990](v23, v27);
  if (v20)
  {
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSourceStride:", CPU_SetBatchStride(v21));

    objc_msgSend(v25, "setResultStride:", CPU_SetBatchStride(v6));
  }

  return v20;
}

uint64_t CPU_CompileYOLOLossLayer(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  NSObject *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  _OWORD v62[2];

  v5 = a2;
  v60 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "params");
  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v58, "bytes");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v6 + 376) = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v6 + 368) = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v6 + 392) = (unint64_t)objc_msgSend(v18, "unsignedIntegerValue") / *(_QWORD *)(v6 + 384);

  *(_DWORD *)(v6 + 12) = 0x10000;
  v19 = v5;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "descriptor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "shape");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectAtIndexedSubscript:", 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v52, "unsignedIntegerValue");
  v61 = v19;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "shape");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue") * v20;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shape");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v6 + 16) = v25 * objc_msgSend(v29, "unsignedIntegerValue");

  *(_QWORD *)(v6 + 80) = 1;
  *(_QWORD *)(v6 + 172) = 1065353216;
  objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "descriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "dataType");

  v33 = 65552;
  if (v32 == 1)
  {
    v33 = 65568;
  }
  else if (v32 != 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v61;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      CPU_CompileYOLOLossLayer_cold_1(v61, v34);

    v36 = 0;
    v37 = v59;
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 152) = v33;
  *(_DWORD *)(v6 + 188) = 0x10000;
  objc_msgSend(v60, "descriptor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "shape");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectAtIndexedSubscript:", 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "unsignedIntegerValue");
  objc_msgSend(v60, "descriptor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "shape");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "unsignedIntegerValue") * v39;
  objc_msgSend(v60, "descriptor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "shape");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v6 + 192) = v43 * objc_msgSend(v46, "unsignedIntegerValue");

  *(_QWORD *)(v6 + 256) = 1;
  *(_QWORD *)(v6 + 348) = 1065353216;
  objc_msgSend(v60, "descriptor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "dataType");

  if (v48 == 1)
  {
    v49 = 65568;
    v37 = v59;
  }
  else
  {
    v37 = v59;
    v49 = 65552;
    if (v48 != 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v50 = objc_claimAutoreleasedReturnValue();
      v35 = v61;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        CPU_CompileYOLOLossLayer_cold_2(v60, v50);

      v36 = 0;
      goto LABEL_15;
    }
  }
  *(_DWORD *)(v6 + 328) = v49;
  memset(v62, 0, sizeof(v62));
  LODWORD(v62[0]) = 1;
  v36 = MEMORY[0x1D8263990](v6, v62);
  v35 = v61;
  if (v36)
  {
    objc_msgSend(v37, "setSourceStride:", *(_QWORD *)(v6 + 80) * *(_QWORD *)(v6 + 16));
    objc_msgSend(v37, "setResultStride:", *(_QWORD *)(v6 + 256) * *(_QWORD *)(v6 + 192));
  }
LABEL_15:

  return v36;
}

NSString *__cdecl MLCActivationTypeDebugDescription(MLCActivationType activationType)
{
  if ((activationType - 1) > 0x14)
    return (NSString *)CFSTR("None");
  else
    return &off_1E98209E0[activationType - 1]->isa;
}

NSString *__cdecl MLCArithmeticOperationDebugDescription(MLCArithmeticOperation operation)
{
  if ((operation - 1) > 0x1D)
    return (NSString *)CFSTR("Add");
  else
    return &off_1E9820A88[operation - 1]->isa;
}

const __CFString *MLCPredicateTypeDebugDescription(int a1)
{
  if ((a1 - 1) > 5)
    return CFSTR("Equal");
  else
    return off_1E9820B78[a1 - 1];
}

NSString *__cdecl MLCComparisonOperationDebugDescription(MLCComparisonOperation operation)
{
  if ((operation - 1) > 0xB)
    return (NSString *)CFSTR("Equal");
  else
    return &off_1E9820BA8[operation - 1]->isa;
}

NSString *__cdecl MLCPaddingPolicyDebugDescription(MLCPaddingPolicy paddingPolicy)
{
  const __CFString *v1;

  v1 = CFSTR("Same");
  if (paddingPolicy == MLCPaddingPolicyValid)
    v1 = CFSTR("Valid");
  if (paddingPolicy == MLCPaddingPolicyUsePaddingSize)
    return (NSString *)CFSTR("Use Padding Size");
  else
    return &v1->isa;
}

NSString *__cdecl MLCLossTypeDebugDescription(MLCLossType lossType)
{
  if ((lossType - 1) > 8)
    return (NSString *)CFSTR("Absolute Error");
  else
    return &off_1E9820C08[lossType - 1]->isa;
}

NSString *__cdecl MLCReductionTypeDebugDescription(MLCReductionType reductionType)
{
  if ((reductionType - 1) > 9)
    return (NSString *)CFSTR("None");
  else
    return &off_1E9820C50[reductionType - 1]->isa;
}

NSString *__cdecl MLCPaddingTypeDebugDescription(MLCPaddingType paddingType)
{
  if ((paddingType - 1) > 2)
    return (NSString *)CFSTR("Zero");
  else
    return &off_1E9820CA0[paddingType - 1]->isa;
}

NSString *__cdecl MLCConvolutionTypeDebugDescription(MLCConvolutionType convolutionType)
{
  const __CFString *v1;

  v1 = CFSTR("Standard");
  if (convolutionType == MLCConvolutionTypeTransposed)
    v1 = CFSTR("Transposed");
  if (convolutionType == MLCConvolutionTypeDepthwise)
    return (NSString *)CFSTR("Depthwise");
  else
    return &v1->isa;
}

NSString *__cdecl MLCPoolingTypeDebugDescription(MLCPoolingType poolingType)
{
  if ((poolingType - 2) > 2)
    return (NSString *)CFSTR("Max");
  else
    return &off_1E9820CB8[poolingType - 2]->isa;
}

NSString *__cdecl MLCSoftmaxOperationDebugDescription(MLCSoftmaxOperation operation)
{
  if (operation)
    return (NSString *)CFSTR("Log Softmax");
  else
    return (NSString *)CFSTR("Softmax");
}

NSString *__cdecl MLCSampleModeDebugDescription(MLCSampleMode mode)
{
  if (mode)
    return (NSString *)CFSTR("Linear");
  else
    return (NSString *)CFSTR("Nearest");
}

NSString *__cdecl MLCLSTMResultModeDebugDescription(MLCLSTMResultMode mode)
{
  if (mode)
    return (NSString *)CFSTR("Output and States");
  else
    return (NSString *)CFSTR("Output");
}

NSString *__cdecl MLCGradientClippingTypeDebugDescription(MLCGradientClippingType gradientClippingType)
{
  const __CFString *v1;

  v1 = CFSTR("By Value");
  if (gradientClippingType == MLCGradientClippingTypeByNorm)
    v1 = CFSTR("By Norm");
  if (gradientClippingType == MLCGradientClippingTypeByGlobalNorm)
    return (NSString *)CFSTR("By Global Norm");
  else
    return &v1->isa;
}

id CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(float a1, float a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, uint64_t a12, unsigned int a13)
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  unsigned int v28;
  int v29;
  size_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  size_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  size_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  uint64_t j;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  _OWORD v106[11];
  _OWORD v107[11];
  _BYTE v108[1064];
  _QWORD v109[8];
  _BYTE v110[840];
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _QWORD v117[3];

  v117[1] = *MEMORY[0x1E0C80C00];
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v102 = a9;
  v103 = a10;
  v26 = v22;
  v27 = a11;
  v99 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v100 = v27;
  v101 = v25;
  if (a13 <= 0x24)
  {
    if (((1 << a13) & 0xC00000) != 0)
    {
      v29 = 0;
      v28 = 1;
      goto LABEL_10;
    }
    if (((1 << a13) & 0xC0000000) != 0)
    {
      v29 = 0;
      v28 = 2;
      goto LABEL_10;
    }
    if (((1 << a13) & 0x1800000000) != 0)
    {
      v28 = 3;
      v29 = 1;
LABEL_10:
      bzero(v110, 0x348uLL);
      CPU_BuildBNNSConvolutionWeightAndBiasParams((uint64_t)v110, v23, v21, v26);
      bzero(v108, 0x468uLL);
      v30 = objc_msgSend(v23, "outputFeatureChannelCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v117[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CPU_BuildBNNSNormalizationParams(v28, (uint64_t)v108, v32, v101, v102, v103, v100, a1, a2);

      if (v33 && (!v24 || setBNNSActivation((uint64_t)v109, v24)))
      {
        v84 = v24;
        if (v29)
          v109[6] = a12;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v110, 840);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v108, 1128);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        memset(v107, 0, sizeof(v107));
        memset(v106, 0, sizeof(v106));
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v107, 176);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v106, 176);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "descriptor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v23, 0, 0, objc_msgSend(v34, "dataType"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v36 = 3;
        for (i = 0; i != 3; ++i)
        {
          objc_msgSend(v21, "descriptor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v23, 0, 0, objc_msgSend(v38, "dataType"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:atIndexedSubscript:", v39, i);

        }
        v93 = v35;
        v86 = v21;
        v83 = v23;
        if (v26)
        {
          objc_msgSend(v26, "descriptor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v23, 0, objc_msgSend(v40, "dataType"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          v91 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          v41 = 0;
          v42 = 0x1E0C99000;
          do
          {
            objc_msgSend(v26, "descriptor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v23, 0, objc_msgSend(v43, "dataType"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "setObject:atIndexedSubscript:", v44, v41);

            ++v41;
          }
          while (v41 != 3);
        }
        else
        {
          v91 = 0;
          v92 = 0;
          v42 = 0x1E0C99000uLL;
        }
        v85 = v26;
        objc_msgSend(*(id *)(v42 + 3408), "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL), 4 * v30, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v42 + 3408), "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL), 4 * v30, 1);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v49;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v103;
        objc_msgSend(v103, "descriptor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v48;
        CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v50, v48, objc_msgSend(v52, "dataType"), 0);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = 0x1E0C99000uLL;
        v54 = v30;
        v105 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        if (v103)
        {
          v55 = 0;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = v56;
            objc_msgSend(*(id *)(v53 + 3360), "arrayWithObjects:count:", &v115, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "descriptor");
            v58 = v36;
            v59 = v51;
            v60 = v54;
            v61 = v53;
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v57, 0, objc_msgSend(v62, "dataType"), 0);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "setObject:atIndexedSubscript:", v63, v55);

            v53 = v61;
            v54 = v60;
            v51 = v59;
            v36 = v58;

            ++v55;
          }
          while (v58 != v55);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v64;
        objc_msgSend(*(id *)(v53 + 3360), "arrayWithObjects:count:", &v114, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v53;
        objc_msgSend(v100, "descriptor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v65, v98, objc_msgSend(v67, "dataType"), 0);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        v104 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        if (v100)
        {
          for (j = 0; j != v36; ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = v69;
            objc_msgSend(*(id *)(v66 + 3360), "arrayWithObjects:count:", &v113, 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "descriptor");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v70, 0, objc_msgSend(v71, "dataType"), 0);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setObject:atIndexedSubscript:", v72, j);

          }
        }
        v112 = v96;
        objc_msgSend(*(id *)(v66 + 3360), "arrayWithObjects:count:", &v112, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v95;
        objc_msgSend(*(id *)(v66 + 3360), "arrayWithObjects:count:", &v111, 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", a13, v97, v73, v74, v94, v92, v93, v91);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = v84;
        v26 = v85;
        v25 = v101;
        v46 = v102;
        v23 = v83;
        if (v75)
        {
          objc_msgSend(v99, "addObject:", v75);
          objc_msgSend(v75, "setFusedPrimitiveParams:", v90);
          objc_msgSend(v75, "setBetaDeltaData:", v88);
          objc_msgSend(v75, "setGammaDeltaData:", v87);
          objc_msgSend(v75, "setBetaDeltaDataBytes:", v89);
          objc_msgSend(v75, "setGammaDeltaDataBytes:", v98);
          v76 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          objc_msgSend(v75, "setWeightsMomentumDataBytes:", v76);

          if (v85)
          {
            v77 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
            objc_msgSend(v75, "setBiasMomentumDataBytes:", v77);

          }
          objc_msgSend(v75, "setBetaMomentumData:", v105);
          objc_msgSend(v75, "setGammaMomentumData:", v104);
          v78 = (void *)MEMORY[0x1E0C9AA60];
          v79 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          objc_msgSend(v75, "setBetaMomentumDataBytes:", v79);

          v80 = (void *)objc_msgSend(v78, "mutableCopy");
          objc_msgSend(v75, "setGammaMomentumDataBytes:", v80);

          if (v101)
            objc_msgSend(v75, "setMovingMean:", v101);
          if (v102)
            objc_msgSend(v75, "setMovingVariance:", v102);
          objc_msgSend(v75, "setPaddingPolicy:", objc_msgSend(v83, "paddingPolicy"));
        }
        v45 = (void *)objc_msgSend(v99, "copy");

        v21 = v86;
        v47 = v103;
        v27 = v100;
      }
      else
      {
        v45 = (void *)MEMORY[0x1E0C9AA60];
        v25 = v101;
        v46 = v102;
        v47 = v103;
        v27 = v100;
      }
      goto LABEL_41;
    }
  }
  if (a13 - 6 < 2)
  {
    v29 = 0;
    v28 = 0;
    goto LABEL_10;
  }
  +[MLCLog framework](MLCLog, "framework");
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    CPU_CreateFusedConvolutionNormalizationAndNeuronLayer_cold_1();

  v45 = (void *)MEMORY[0x1E0C9AA60];
  v46 = v102;
  v47 = v103;
LABEL_41:

  return v45;
}

void CPU_BuildBNNSConvolutionWeightAndBiasParams(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;

  v37 = a2;
  v7 = a3;
  v8 = a4;
  *(_QWORD *)(a1 + 752) = objc_msgSend(v37, "strideInX");
  *(_QWORD *)(a1 + 760) = objc_msgSend(v37, "strideInY");
  *(_QWORD *)(a1 + 768) = objc_msgSend(v37, "dilationRateInX");
  *(_QWORD *)(a1 + 776) = objc_msgSend(v37, "dilationRateInY");
  if (objc_msgSend(v37, "usesDepthwiseConvolution"))
    v9 = objc_msgSend(v37, "inputFeatureChannelCount");
  else
    v9 = objc_msgSend(v37, "groupCount");
  *(_QWORD *)(a1 + 800) = v9;
  *(_DWORD *)(a1 + 180) = 0x40000;
  objc_msgSend(v7, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 == 2)
  {
    *(int64x2_t *)(a1 + 184) = vdupq_n_s64(1uLL);
  }
  else
  {
    objc_msgSend(v7, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    objc_msgSend(v7, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v15 == 3)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 184) = objc_msgSend(v19, "unsignedIntegerValue");

      *(_QWORD *)(a1 + 192) = 1;
    }
    else
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 184) = objc_msgSend(v20, "unsignedIntegerValue");

      objc_msgSend(v7, "descriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shape");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 192) = objc_msgSend(v23, "unsignedIntegerValue");

    }
  }
  v24 = *(_QWORD *)(a1 + 800);
  v25 = objc_msgSend(v37, "inputFeatureChannelCount");
  if (v24 >= 2)
    v25 /= *(_QWORD *)(a1 + 800);
  *(_QWORD *)(a1 + 200) = v25;
  *(_QWORD *)(a1 + 208) = objc_msgSend(v37, "outputFeatureChannelCount");
  v26 = *(_QWORD *)(a1 + 184);
  v27 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = 1;
  *(_QWORD *)(a1 + 256) = v26;
  v28 = v27 * v26;
  v29 = *(_QWORD *)(a1 + 200) * v27 * v26;
  *(_QWORD *)(a1 + 264) = v28;
  *(_QWORD *)(a1 + 272) = v29;
  objc_msgSend(v7, "data");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)(a1 + 312) = objc_msgSend(v30, "bytes");

  objc_msgSend(v7, "descriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a1 + 320) = CPU_BNNSDataType(objc_msgSend(v31, "dataType"));

  *(_QWORD *)(a1 + 340) = 1065353216;
  if (v8)
  {
    *(_DWORD *)(a1 + 532) = 0x10000;
    objc_msgSend(v8, "descriptor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "shape");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a1 + 536) = objc_msgSend(v34, "unsignedIntegerValue");

    objc_msgSend(v8, "data");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)(a1 + 664) = objc_msgSend(v35, "bytes");

    objc_msgSend(v8, "descriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a1 + 672) = CPU_BNNSDataType(objc_msgSend(v36, "dataType"));

    *(_QWORD *)(a1 + 692) = 1065353216;
  }
  if (objc_msgSend(v37, "paddingPolicy") == 2)
  {
    *(_QWORD *)(a1 + 784) = objc_msgSend(v37, "paddingSizeInX");
    *(_QWORD *)(a1 + 792) = objc_msgSend(v37, "paddingSizeInY");
  }

}

void *CPU_CompileFusedConvolutionNormalizationAndNeuronLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  double v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  BNNSFilterParameters v28;
  void *layer_params[2];
  BNNSFilterType filter_type[2];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "params");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (_QWORD *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v7, "deviceOpType");
  switch(v10)
  {
    case 22:
      v11 = 0;
      v12 = 0x300000000;
      goto LABEL_15;
    case 23:
      v12 = 0x300000006;
      goto LABEL_14;
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 32:
    case 33:
    case 34:
      goto LABEL_6;
    case 30:
      v11 = 0;
      v12 = 0x400000000;
      goto LABEL_15;
    case 31:
      v12 = 0x400000006;
      goto LABEL_14;
    case 35:
      v11 = 0;
      v12 = 0x500000000;
      goto LABEL_15;
    case 36:
      v12 = 0x500000006;
      goto LABEL_14;
    default:
      if (v10 == 6)
      {
        v11 = 0;
        v12 = 0x200000000;
      }
      else
      {
        if (v10 != 7)
        {
LABEL_6:
          +[MLCLog framework](MLCLog, "framework");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_1(v7, v13);

          goto LABEL_18;
        }
        v12 = 0x200000006;
LABEL_14:
        v11 = 1;
      }
LABEL_15:
      *(float *)&v14 = CPU_BuildBNNSConvolutionInputOutputParams(v9, v5, v6, v11, objc_msgSend(v7, "paddingPolicy"));
      objc_msgSend(v7, "fusedPrimitiveParams", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_retainAutorelease(v15);
      v16 = (_QWORD *)objc_msgSend(v8, "bytes");
      v31[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CPU_BuildBNNSNormalizationInputOutputParams((uint64_t)v16, v17, v6, 0);

      if (!v18)
      {
LABEL_18:
        v22 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v6, "descriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shape");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = objc_msgSend(v21, "unsignedIntegerValue");

      memset(&v28, 0, sizeof(v28));
      v28.flags = 1;
      *(_QWORD *)filter_type = v12;
      layer_params[0] = v9;
      layer_params[1] = v16;
      v22 = BNNSFilterCreateFusedLayer(2uLL, filter_type, (const void **)layer_params, &v28);
      if (v22)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSourceStride:", CPU_SetBatchStride(v23));

        objc_msgSend(v7, "setResultStride:", CPU_SetBatchStride(v6));
        objc_msgSend(v7, "setIsFusedBNNSFilter:", 1);
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_2(v24, v25, v26);

      }
LABEL_22:

      return v22;
  }
}

float CPU_BuildBNNSConvolutionInputOutputParams(_QWORD *a1, void *a2, void *a3, int a4, int a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
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
  float result;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  float v26;
  unint64_t v27;
  float v28;
  float v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  float v35;
  unint64_t v36;
  unint64_t v37;

  v7 = a3;
  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor((uint64_t)a1, v11, v14, 0, objc_msgSend(v16, "dataType"), 1, 0);

  objc_msgSend(v7, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stride");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_BuildBNNSNDArrayDescriptor((uint64_t)(a1 + 44), v18, v20, 0, objc_msgSend(v21, "dataType"), 1, 0);
  if (a5 != 2)
  {
    if (a4)
    {
      v23 = a1[2];
      v24 = a1[24];
      v25 = a1[46];
      v26 = (float)((float)((float)(unint64_t)((a1[1] - 1) * a1[94])
                          + (float)(unint64_t)((a1[23] - 1) * a1[96]))
                  + 1.0)
          - (float)(unint64_t)a1[45];
      v27 = (unint64_t)(float)(v26 * 0.5);
      a1[101] = v27;
      v28 = v26 - (float)v27;
      v29 = (float)(unint64_t)((v23 - 1) * a1[95]);
      v30 = (v24 - 1) * a1[97];
      a1[102] = (unint64_t)v28;
      v31 = (float)((float)(v29 + (float)(unint64_t)v30) + 1.0) - (float)v25;
    }
    else
    {
      v32 = a1[46];
      v33 = a1[2];
      v34 = a1[24];
      v35 = (float)(unint64_t)(a1[94] * a1[45])
          - (float)((float)((float)(unint64_t)a1[1] - (float)(unint64_t)((a1[23] - 1) * a1[96] + 1))
                  + (float)(unint64_t)a1[94]);
      if (v35 < 0.0)
        v35 = 0.0;
      v36 = (unint64_t)(float)(v35 * 0.5);
      a1[101] = v36;
      a1[102] = (unint64_t)(float)(v35 - (float)v36);
      v31 = (float)(unint64_t)(a1[95] * v32)
          - (float)((float)((float)v33 - (float)(unint64_t)((v34 - 1) * a1[97] + 1))
                  + (float)(unint64_t)a1[95]);
      if (v31 < 0.0)
        v31 = 0.0;
    }
    v37 = (unint64_t)(float)(v31 * 0.5);
    a1[103] = v37;
    result = v31 - (float)v37;
    a1[104] = (unint64_t)result;
  }
  return result;
}

uint64_t CPU_SetOptimizerDataForConvolutionLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v35;

  v5 = a1;
  v6 = a3;
  objc_msgSend(a2, "optimizerData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "bytes");
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataWithBytesNoCopy:length:freeWhenDone:", v12, objc_msgSend(v13, "length"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "weightsMomentumDataBytes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, v9);

      objc_msgSend(v8, "weightsMomentumData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_retainAutorelease(v17);
      v19 = objc_msgSend(v18, "bytes");
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v19 + 136) = objc_msgSend(v20, "bytes");

      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }
  if (v6)
  {
    v35 = v5;
    objc_msgSend(v6, "optimizerData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v22 = 0;
      do
      {
        v23 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "bytes");
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dataWithBytesNoCopy:length:freeWhenDone:", v25, objc_msgSend(v26, "length"), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "biasMomentumDataBytes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:atIndexedSubscript:", v27, v22);

        objc_msgSend(v8, "biasMomentumData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_retainAutorelease(v30);
        v32 = objc_msgSend(v31, "bytes");
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(v32 + 136) = objc_msgSend(v33, "bytes");

        ++v22;
      }
      while (v22 < objc_msgSend(v21, "count"));
    }

    v5 = v35;
  }

  return 1;
}

id CPU_CreateTransposeLayer(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _OWORD v20[11];
  _OWORD v21[11];
  _OWORD v22[22];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  memset(v22, 0, sizeof(v22));
  v4 = objc_msgSend(v2, "count");
  switch(v4)
  {
    case 4:
      objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v23 = 3 - objc_msgSend(v7, "unsignedIntegerValue");

      objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v23 + 1) = 3 - objc_msgSend(v8, "unsignedIntegerValue");

      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v24 = 3 - objc_msgSend(v9, "unsignedIntegerValue");

      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v24 + 1) = 3 - objc_msgSend(v6, "unsignedIntegerValue");
      break;
    case 3:
      objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v23 = 2 - objc_msgSend(v10, "unsignedIntegerValue");

      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v23 + 1) = 2 - objc_msgSend(v11, "unsignedIntegerValue");

      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v24 = 2 - objc_msgSend(v6, "unsignedIntegerValue");
      break;
    case 2:
      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v23 = objc_msgSend(v5, "unsignedIntegerValue") != 1;

      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v23 + 1) = objc_msgSend(v6, "unsignedIntegerValue") != 1;
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 416);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, 176);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, 176);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 39, v12, v15, v16, 0, 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v3, "addObject:", v17);
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

uint64_t CPU_CompileTransposeLayer(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  _OWORD v28[2];

  v5 = a2;
  v26 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "params");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v27, "bytes");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  LODWORD(v6) = CPU_BuildPermuteBNNSNDArrayDescriptor(v6, v9, v12, 0, objc_msgSend(v14, "dataType"));

  v15 = 0;
  if ((_DWORD)v6)
  {
    objc_msgSend(v26, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CPU_BuildPermuteBNNSNDArrayDescriptor(v24 + 176, v17, v19, 0, objc_msgSend(v20, "dataType"));

    v15 = 0;
    if (v21)
    {
      memset(v28, 0, sizeof(v28));
      LODWORD(v28[0]) = 1;
      v15 = MEMORY[0x1D82639C0](v24, v28);
      if (v15)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setSourceStride:", CPU_SetBatchStride(v22));

        objc_msgSend(v25, "setResultStride:", CPU_SetBatchStride(v26));
      }
    }
  }

  return v15;
}

id CPU_CreatePaddingLayer(float a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  void *v15;
  NSObject *v16;
  int v17;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _OWORD v30[11];
  _OWORD v31[11];
  _OWORD v32[22];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[2];

  _S8 = a1;
  v45[1] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  memset(v32, 0, sizeof(v32));
  v33 = a4;
  v34 = a5;
  v35 = a6;
  v36 = a7;
  switch(a3)
  {
    case 0:
    case 3:
      if (a8 == 3)
      {
        __asm { FCVT            H0, S8 }
        HIDWORD(v43) = _H0;
        goto LABEL_11;
      }
      if (a8 == 1)
      {
        *((float *)&v43 + 1) = _S8;
        goto LABEL_11;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        CPU_CreatePaddingLayer_cold_2();
      goto LABEL_16;
    case 1:
      v17 = 1;
      goto LABEL_9;
    case 2:
      v17 = 2;
LABEL_9:
      LODWORD(v43) = v17;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v32, 488);
      v16 = objc_claimAutoreleasedReturnValue();
      memset(v31, 0, sizeof(v31));
      memset(v30, 0, sizeof(v30));
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v31, 176);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, 176);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 14, v16, v25, v26, 0, 0, 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        objc_msgSend(v15, "addObject:", v27);
      v28 = (void *)objc_msgSend(v15, "copy");

      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        CPU_CreatePaddingLayer_cold_1();
LABEL_16:
      v28 = 0;
      break;
  }

  return v28;
}

uint64_t CPU_CompilePaddingLayer(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  _OWORD v28[2];

  v5 = a2;
  v26 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "params");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v27, "bytes");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  LODWORD(v6) = CPU_BuildBNNSNDArrayDescriptor(v6, v9, v12, 0, objc_msgSend(v14, "dataType"), 1, 0);

  v15 = 0;
  if ((_DWORD)v6)
  {
    objc_msgSend(v26, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CPU_BuildBNNSNDArrayDescriptor(v24 + 176, v17, v19, 0, objc_msgSend(v20, "dataType"), 1, 0);

    v15 = 0;
    if (v21)
    {
      memset(v28, 0, sizeof(v28));
      LODWORD(v28[0]) = 1;
      v15 = MEMORY[0x1D82639B4](v24, v28);
      if (v15)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setSourceStride:", CPU_SetBatchStride(v22));

        objc_msgSend(v25, "setResultStride:", CPU_SetBatchStride(v26));
      }
    }
  }

  return v15;
}

unint64_t *hashCombine_4(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 10;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

unint64_t *hashCombine_5(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 15;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

id ANE_CreateMatMulLayer(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  __int16 v19;
  int v20;
  _QWORD v21[2];
  _QWORD v22[2];
  __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v3 = v1;
  if (objc_msgSend(v3, "transposesX"))
    v4 = &unk_1E9844B88;
  else
    v4 = &unk_1E9844B70;
  ANE_BuildTransposeParams(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "transposesY"))
    v6 = &unk_1E9844B88;
  else
    v6 = &unk_1E9844B70;
  ANE_BuildTransposeParams(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_BuildTransposeParams(&unk_1E9844B70);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = kMLCANENetUnitType[0];
  v24[0] = CFSTR("MatrixMultiplication");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  if (fabsf(v10 + -1.0) <= 0.000001)
  {
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "alpha");
  v20 = v11;
  v19 = 0;
  if (ANE_ConvertFp32ToInt16((uint64_t)&v20, &v19))
  {
    v21[1] = CFSTR("ScaleScalar");
    v22[0] = CFSTR("GOC");
    v21[0] = kMLCANENetUnitType[0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    +[_MLCANEMatMulParameters matMulUnitParametersWith:transposeXParams:transposeYParams:finalTransposeParams:gocParams:](_MLCANEMatMulParameters, "matMulUnitParametersWith:transposeXParams:transposeYParams:finalTransposeParams:gocParams:", v9, v5, v7, v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  +[MLCLog framework](MLCLog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    ANE_CreateMatMulLayer_cold_2((float *)&v20, v15);

  v14 = 0;
LABEL_15:

  if (v14)
  {
    +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 32, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v2, "addObject:", v16);
    v17 = v2;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      ANE_CreateMatMulLayer_cold_1(v16);
    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

id ANE_CompileMatMulLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  NSObject *v102;
  void *v103;
  void *v104;
  char v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  NSObject *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  void *v130;
  uint64_t v131;
  NSObject *v132;
  int v133;
  id v134;
  void *v135;
  void *v136;
  uint64_t v137;
  id v138;
  unsigned int v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  NSObject *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  id v162;
  id v163;
  id v164;
  _BYTE v165[2];
  _QWORD v166[2];
  void *v167;
  void *v168;
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  void *v173;
  void *v174;
  void *v175;
  NSObject *v176;
  void *v177;
  void *v178;
  _QWORD v179[2];
  void *v180;
  void *v181;
  void *v182;
  _QWORD v183[4];

  v183[2] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v153 = a2;
  v6 = a3;
  objc_msgSend(v6, "parentLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "params");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12 = v10;
  v13 = (void *)MEMORY[0x1D8263D2C]();
  v160 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v11, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceTensors");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resultTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "dataType");

  v139 = v18;
  ANE_GetANECIRDataTypeWithMLCDataType(v18);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v154)
  {
    v108 = v153;
    +[MLCLog framework](MLCLog, "framework");
    v152 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      ANE_CompileMatMulLayer_cold_1();
    v109 = 0;
    goto LABEL_29;
  }
  v151 = v16;
  v143 = v13;
  v145 = v9;
  v146 = v6;
  v147 = v5;
  objc_msgSend(v12, "transposeXParams");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transposeYParams");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finalTransposeParams");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "matMulParams");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v12;
  objc_msgSend(v12, "gocParams");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v19;
  v183[0] = v19;
  v183[1] = v20;
  v141 = (void *)v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 2);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = objc_msgSend(v14, "transposesX");
  v142 = v14;
  v165[1] = objc_msgSend(v14, "transposesY");
  v21 = (void *)MEMORY[0x1E0C9AA60];
  v156 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v157 = (void *)objc_msgSend(v21, "mutableCopy");
  v22 = 0;
  v23 = 1;
  v24 = v160;
  v155 = v11;
  do
  {
    v25 = v23;
    objc_msgSend(v159, "objectAtIndexedSubscript:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = 0;
    ANE_GetTensor4DShapeWithOnePrepended(v26, &v164);
    v27 = v164;
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    if (v165[v22])
    {
      objc_msgSend(v27, "objectAtIndexedSubscript:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:atIndexedSubscript:", v29, 1);

      objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:atIndexedSubscript:", v30, 2);

      objc_msgSend(v27, "objectAtIndexedSubscript:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v28;
      v33 = v31;
      v34 = 3;
    }
    else
    {
      objc_msgSend(v27, "objectAtIndexedSubscript:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:atIndexedSubscript:", v35, 1);

      objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v28;
      v33 = v31;
      v34 = 2;
    }
    objc_msgSend(v32, "setObject:atIndexedSubscript:", v33, v34);

    objc_msgSend(v158, "objectAtIndexedSubscript:", v22);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v11, v36);
    v37 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "label");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v24, "count"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v39, CFSTR("Name"));

    objc_msgSend(v26, "label");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v182, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v41, CFSTR("Bottom"));

    objc_msgSend(v26, "descriptor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "dataType");

    ANE_GetANECIRDataTypeWithMLCDataType(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      +[MLCLog framework](MLCLog, "framework");
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        ANE_CompileMatMulLayer_cold_2();
      goto LABEL_27;
    }
    objc_msgSend(v157, "addObject:", v44);
    v181 = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v181, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v45, CFSTR("InputType"));

    v46 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "unsignedIntegerValue"));
    v48 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v48, CFSTR("OutputChannels"));

    v180 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v48) = ANE_ValidateTransposeUnit(v49, v37, 1);

    if ((v48 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v110 = objc_claimAutoreleasedReturnValue();
      v11 = v155;
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        ANE_CompileMatMulLayer_cold_9();
LABEL_27:
      v16 = v151;
      v111 = v141;

      v109 = 0;
      goto LABEL_28;
    }
    v24 = v160;
    objc_msgSend(v160, "addObject:", v37);
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v28, v43);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "addObject:", v50);

    v23 = 0;
    v22 = 1;
    v11 = v155;
  }
  while ((v25 & 1) != 0);
  v163 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v151, &v163);
  v51 = v163;
  v52 = (void *)objc_msgSend(v51, "mutableCopy");
  objc_msgSend(v51, "objectAtIndexedSubscript:", 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:atIndexedSubscript:", v53, 1);

  objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:atIndexedSubscript:", v54, 2);

  v138 = v51;
  objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v55, "unsignedIntegerValue");

  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v155, v150);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "label");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v160, "count"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v58, CFSTR("Name"));

  objc_msgSend(v160, "objectAtIndexedSubscript:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("Name"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v60;
  objc_msgSend(v160, "objectAtIndexedSubscript:", 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("Name"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v179[1] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v63, CFSTR("Bottom"));

  v64 = (void *)objc_msgSend(v157, "copy");
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v64, CFSTR("InputType"));

  v65 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v52, "objectAtIndexedSubscript:", 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "numberWithUnsignedInteger:", objc_msgSend(v66, "unsignedIntegerValue"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v67, CFSTR("OutputChannels"));

  if ((ANE_ValidateMatrixMultUnit(v156, v56, 1) & 1) != 0)
  {
    objc_msgSend(v160, "addObject:", v56);
    v136 = v52;
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v52, v139);
    v37 = objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v155, v149);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "label");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v160, "count"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v70, CFSTR("Name"));

    v140 = v56;
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Name"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v178, 1);
    v72 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v72, CFSTR("Bottom"));

    v177 = v154;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v177, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v73, CFSTR("InputType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v137);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v74, CFSTR("OutputChannels"));

    v176 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v176, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v72) = ANE_ValidateTransposeUnit(v75, v68, 1);

    if ((v72 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v113 = objc_claimAutoreleasedReturnValue();
      v111 = v141;
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        ANE_CompileMatMulLayer_cold_9();

      v109 = 0;
      v16 = v151;
      goto LABEL_58;
    }
    v76 = v160;
    objc_msgSend(v160, "addObject:", v68);
    v135 = v68;
    if (!v148)
      goto LABEL_14;
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v155, v148);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "label");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v160, "count"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v79, CFSTR("Name"));

    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("Name"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v80;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
    v81 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v81, CFSTR("Bottom"));

    v174 = v154;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v174, 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v82, CFSTR("InputType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v137);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v83, CFSTR("OutputChannels"));

    v173 = v151;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v173, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v81) = ANE_ValidateGOCUnit(v84, v77, 0);

    if ((v81 & 1) != 0)
    {
      objc_msgSend(v160, "addObject:", v77);

      v76 = v160;
      if (objc_msgSend(v159, "count") != 3)
        goto LABEL_56;
LABEL_14:
      objc_msgSend(v159, "objectAtIndexedSubscript:", 2);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "descriptor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v86, "dataType");

      v171[0] = kMLCANENetUnitType[0];
      v171[1] = CFSTR("Type");
      v172[0] = CFSTR("ElementWise");
      v172[1] = CFSTR("Add");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v172, v171, 2);
      v131 = objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v155);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "label");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v76, "count"));
      v89 = v76;
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v90, CFSTR("Name"));

      objc_msgSend(v89, "objectAtIndexedSubscript:", objc_msgSend(v89, "count") - 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("Name"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v170[0] = v92;
      v93 = v85;
      objc_msgSend(v85, "label");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v170[1] = v94;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 2);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v95, CFSTR("Bottom"));

      ANE_GetANECIRDataTypeWithMLCDataType(v133);
      v96 = objc_claimAutoreleasedReturnValue();
      v97 = (void *)v96;
      if (v96)
      {
        v169[0] = v154;
        v169[1] = v96;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 2);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setObject:forKeyedSubscript:", v98, CFSTR("InputType"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v137);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setObject:forKeyedSubscript:", v99, CFSTR("OutputChannels"));

        v161 = 0;
        v162 = 0;
        v100 = v93;
        v101 = +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:](_MLCANEPlistBuilder, "createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:", v93, v138, v155, &v162, &v161);
        v102 = v162;
        v132 = v102;
        v134 = v161;
        if (v101 != 2)
        {
          v103 = v97;
          v76 = v160;
          if (v101 == 1)
          {
            v167 = v151;
            v168 = v100;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v167, 2);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = ANE_ValidateElementWiseUnit(v104, v87, 1);

            v106 = (void *)v131;
            if ((v105 & 1) != 0)
            {
              objc_msgSend(v160, "addObject:", v87);
              v107 = 0;
              v11 = v155;
              v68 = v135;
            }
            else
            {
              +[MLCLog framework](MLCLog, "framework");
              v127 = objc_claimAutoreleasedReturnValue();
              v11 = v155;
              v68 = v135;
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                ANE_CompileMatMulLayer_cold_5();

              v107 = 1;
            }
          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v126 = objc_claimAutoreleasedReturnValue();
            v68 = v135;
            v106 = (void *)v131;
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              ANE_CompileMatMulLayer_cold_4();

            v107 = 1;
            v11 = v155;
          }
          v97 = v103;
          goto LABEL_52;
        }
        v76 = v160;
        if (v102)
        {
          v130 = v97;
          objc_msgSend(v155, "label");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v160, "count"));
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v102, "setObject:forKeyedSubscript:", v116, CFSTR("Name"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v137);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v102, "setObject:forKeyedSubscript:", v117, CFSTR("OutputChannels"));

          objc_msgSend(v160, "addObject:", v102);
          objc_msgSend(v155, "label");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v160, "count"));
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v119, CFSTR("Name"));

          objc_msgSend(v160, "objectAtIndexedSubscript:", objc_msgSend(v160, "count") - 2);
          v120 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v120, "objectForKeyedSubscript:", CFSTR("Name"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v167 = v121;
          -[NSObject objectForKeyedSubscript:](v102, "objectForKeyedSubscript:", CFSTR("Name"));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = v122;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v167, 2);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v123, CFSTR("Bottom"));

          v124 = v134;
          v166[0] = v151;
          v166[1] = v134;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 2);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v120) = ANE_ValidateElementWiseUnit(v125, v87, 1);

          if ((v120 & 1) != 0)
          {
            objc_msgSend(v160, "addObject:", v87);
            v107 = 0;
            v76 = v160;
            v11 = v155;
            v68 = v135;
            v106 = (void *)v131;
            v97 = v130;
          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v129 = objc_claimAutoreleasedReturnValue();
            v11 = v155;
            v68 = v135;
            v106 = (void *)v131;
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
              ANE_CompileMatMulLayer_cold_5();

            v107 = 1;
            v76 = v160;
            v97 = v130;
          }
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
            ANE_CompileMatMulLayer_cold_6();

          v107 = 1;
          v11 = v155;
          v68 = v135;
          v106 = (void *)v131;
LABEL_52:
          v124 = v134;
        }

      }
      else
      {
        v100 = v85;
        +[MLCLog framework](MLCLog, "framework");
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
          ANE_CompileMatMulLayer_cold_3();
        v107 = 1;
        v76 = v160;
        v11 = v155;
        v68 = v135;
        v106 = (void *)v131;
        v97 = 0;
      }

      if (v107)
        v109 = 0;
      else
LABEL_56:
        v109 = (void *)objc_msgSend(v76, "copy");
      v16 = v151;
      v111 = v141;
LABEL_58:
      v27 = v136;
      v26 = v138;
      v28 = v140;
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        ANE_CompileMatMulLayer_cold_8();

      v109 = 0;
      v16 = v151;
      v28 = v56;
      v111 = v141;
      v27 = v136;
      v26 = v138;
    }

  }
  else
  {
    v28 = v56;
    v27 = v52;
    +[MLCLog framework](MLCLog, "framework");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      ANE_CompileMatMulLayer_cold_10();
    v109 = 0;
    v16 = v151;
    v111 = v141;
    v26 = v138;
  }
LABEL_28:

  v6 = v146;
  v5 = v147;
  v108 = v153;
  v12 = v144;
  v9 = v145;
  v14 = v142;
  v13 = v143;
LABEL_29:

  objc_autoreleasePoolPop(v13);
  return v109;
}

id ANE_CreateConcatLayer(unint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v9;

  v9 = 1;
  ANE_GetDimensionIn4DWithOnePrepended(a2, a1, (uint64_t *)&v9);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Concat"), kMLCANENetUnitType[0]);
  ANE_GetANECIRDimension(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Dimension"));

  +[_MLCANEConcatParameters concatUnitParametersWith:](_MLCANEConcatParameters, "concatUnitParametersWith:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 31, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v2, "addObject:", v6);
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

uint64_t ANE_ValidateConcatLayer(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(a1, "sourceTensors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ANE_ValidateConcatUnit(v4, v3, 1);

  return v5;
}

id ANE_CompileConcatLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a1;
  objc_msgSend(a3, "parentLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    v17[0] = kMLCANENetUnitType[0];
    v17[1] = CFSTR("BiasScalar");
    v18[0] = CFSTR("GOC");
    v18[1] = &unk_1E98444B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((ANE_ValidateGOCUnit(v5, v11, 1) & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ANE_CompileConcatLayer_cold_1();
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v9, "params");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "concatParams");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v8, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((ANE_ValidateConcatLayer(v8, v11) & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ANE_CompileConcatLayer_cold_1();
      goto LABEL_9;
    }
  }

  v16 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v14;
}

id ANE_CreateNormalizationLayer(int a1, void *a2, void *a3, float a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  char v24;
  char *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  char v36;
  char *v37;
  NSObject *v38;
  char *v39;
  NSObject *v40;
  char v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  char v55;
  NSObject *v56;
  NSObject *v57;
  char v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  NSObject *v68;
  id v69;
  char v70;
  void *v71;
  void *v72;
  char v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  NSObject *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  NSObject *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  id v154;
  id v155;
  id v156;
  void *v157;
  id v158;
  id v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  void *v164;
  char *v165;
  id v166;
  __int16 v167;
  float v168;
  __CFString *v169;
  const __CFString *v170;
  const __CFString *v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v23 = (void *)v22;
  switch(a1)
  {
    case 0:
      v165 = 0;
      v24 = ANE_BuildBatchNormalizationParams(&v165, v17, v18, v19, v20, v21, a4);
      v25 = v165;
      if ((v24 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          ANE_CreateNormalizationLayer_cold_4(v59, v60, v61, v62, v63, v64, v65, v66);

        goto LABEL_27;
      }
      v163 = v18;
      v164 = v23;
      v26 = 0;
      v27 = 2;
      if (v16)
        goto LABEL_82;
      goto LABEL_4;
    case 1:
      v32 = v17;
      v33 = v18;
      v160 = v19;
      v154 = v20;
      v152 = v21;
      v162 = v19;
      v163 = v18;
      v164 = v23;
      v157 = v33;
      if (objc_msgSend(v32, "count") == 1)
      {
        objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "unsignedIntegerValue");

        if (v157 && v160)
        {
          v169 = 0;
          v36 = ANE_BuildBatchNormalizationParams((char **)&v169, v32, v157, v160, v154, v152, a4);
          v37 = v169;
          if ((v36 & 1) != 0)
          {
            v38 = 0;
LABEL_12:
            v39 = objc_retainAutorelease(v37);
            v40 = objc_retainAutorelease(v38);

            v41 = 1;
            v37 = v39;
            goto LABEL_79;
          }
          +[MLCLog framework](MLCLog, "framework");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            ANE_CreateNormalizationLayer_cold_6(v38, v84, v85, v86, v87, v88, v89, v90);
        }
        else
        {
          v151 = v35;
          v37 = (char *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
          objc_msgSend(v37, "setObject:forKeyedSubscript:", CFSTR("InstanceNormalization"), kMLCANENetUnitType[0]);
          v169 = CFSTR("Height");
          v170 = CFSTR("Width");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v169, 2);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v71, CFSTR("Dimension"));

          v168 = a4;
          v167 = 0;
          if (ANE_ConvertFp32ToInt16((uint64_t)&v168, &v167))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v167);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v72, CFSTR("Epsilon"));

            v38 = 0;
            if (!v154 || !v152)
              goto LABEL_12;
            v166 = 0;
            v73 = ANE_BuildGocParams(&v166, v151, v154, v152);
            v38 = v166;
            if ((v73 & 1) != 0)
            {
              if ((ANE_CalculateScaleAndBiasForInstanceNorm(v151, v154, v152, a4) & 1) != 0)
                goto LABEL_12;
              +[MLCLog framework](MLCLog, "framework");
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                ANE_CreateNormalizationLayer_cold_7(v74, v75, v76, v77, v78, v79, v80, v81);
            }
            else
            {
              +[MLCLog framework](MLCLog, "framework");
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                ANE_CreateNormalizationLayer_cold_8(v74, v124, v125, v126, v127, v128, v129, v130);
            }

          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              ANE_CreateNormalizationLayer_cold_9((uint64_t)&v168);
          }
        }

      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v37 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
          ANE_CreateNormalizationLayer_cold_10(v32, v37);
      }
      v39 = 0;
      v40 = 0;
      v41 = 0;
LABEL_79:

      v25 = v39;
      v26 = v40;
      if ((v41 & 1) != 0)
      {
        v27 = 13;
        goto LABEL_81;
      }
      +[MLCLog framework](MLCLog, "framework");
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        ANE_CreateNormalizationLayer_cold_5(v116, v132, v133, v134, v135, v136, v137, v138);
      goto LABEL_88;
    case 2:
      v164 = (void *)v22;
      v42 = v17;
      v43 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      v44 = objc_msgSend(v42, "count");

      *(float *)&v166 = a4;
      LOWORD(v168) = 0;
      v162 = v19;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v166, &v168))
      {
        if ((unint64_t)(v44 - 1) < 2)
        {
          objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("InstanceNormalization"), kMLCANENetUnitType[0]);
          v23 = v164;
          if (v44 == 1)
          {
            v169 = CFSTR("Width");
            v45 = (void *)MEMORY[0x1E0C99D20];
            v46 = 1;
          }
          else
          {
            v169 = CFSTR("Height");
            v170 = CFSTR("Width");
            v45 = (void *)MEMORY[0x1E0C99D20];
            v46 = 2;
          }
          objc_msgSend(v45, "arrayWithObjects:count:", &v169, v46);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v91, CFSTR("Dimension"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SLOWORD(v168));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v83, CFSTR("Epsilon"));

          v69 = objc_retainAutorelease(v43);
          v70 = 1;
LABEL_53:

          v25 = (char *)v69;
          if ((v70 & 1) != 0)
          {
            v163 = v18;
            v26 = 0;
            v27 = 19;
            goto LABEL_81;
          }
          +[MLCLog framework](MLCLog, "framework");
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            ANE_CreateNormalizationLayer_cold_11(v92, v93, v94, v95, v96, v97, v98, v99);

          v67 = (id)MEMORY[0x1E0C9AA60];
          v19 = v162;
          goto LABEL_97;
        }
        if (v44 == 3)
        {
          objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("LayerNormalization"), kMLCANENetUnitType[0]);
          v169 = CFSTR("Channel");
          v170 = CFSTR("Height");
          v171 = CFSTR("Width");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v169, 3);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v82, CFSTR("Dimension"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SLOWORD(v168));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v164;
          goto LABEL_52;
        }
        +[MLCLog framework](MLCLog, "framework");
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          ANE_CreateNormalizationLayer_cold_12();

      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          ANE_CreateNormalizationLayer_cold_13((uint64_t)&v166);

      }
      v69 = 0;
      v70 = 0;
      v23 = v164;
      goto LABEL_53;
    case 3:
      v163 = v18;
      v47 = v17;
      v48 = v20;
      v158 = v21;
      v161 = v48;
      v162 = v19;
      v164 = v23;
      if (objc_msgSend(v47, "count") == 1)
      {
        v155 = v16;
        objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "unsignedIntegerValue");

        v51 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        -[NSObject setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", CFSTR("LayerNormalization"), kMLCANENetUnitType[0]);
        v169 = CFSTR("Channel");
        v170 = CFSTR("Height");
        v171 = CFSTR("Width");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v169, 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", v52, CFSTR("Dimension"));

        v168 = a4;
        v167 = 0;
        if (ANE_ConvertFp32ToInt16((uint64_t)&v168, &v167))
        {
          v153 = v50;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v167);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", v53, CFSTR("Epsilon"));

          v54 = 0;
          if (!v161 || !v158)
            goto LABEL_23;
          v166 = 0;
          v55 = ANE_BuildGocParams(&v166, v153, v161, v158);
          v54 = v166;
          if ((v55 & 1) != 0)
          {
            if ((ANE_CalculateScaleAndBiasForInstanceNorm(v153, v161, v158, a4) & 1) != 0)
            {
LABEL_23:
              v56 = objc_retainAutorelease(v51);
              v57 = objc_retainAutorelease(v54);
              v58 = 1;
              v54 = v57;
LABEL_69:

              v16 = v155;
              goto LABEL_70;
            }
            +[MLCLog framework](MLCLog, "framework");
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              ANE_CreateNormalizationLayer_cold_15(v101, v109, v110, v111, v112, v113, v114, v115);
          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              ANE_CreateNormalizationLayer_cold_16(v101, v102, v103, v104, v105, v106, v107, v108);
          }

        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            ANE_CreateNormalizationLayer_cold_17((uint64_t)&v168);
        }
        v56 = 0;
        v57 = 0;
        v58 = 0;
        goto LABEL_69;
      }
      +[MLCLog framework](MLCLog, "framework");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        ANE_CreateNormalizationLayer_cold_18(v47, (char *)v51);
      v56 = 0;
      v57 = 0;
      v58 = 0;
LABEL_70:

      v25 = v56;
      v26 = v57;
      if ((v58 & 1) != 0)
      {
        v27 = 23;
LABEL_81:
        v19 = v162;
        if (v16)
        {
LABEL_82:
          ANE_BuildNeuronParams(v16);
          v131 = objc_claimAutoreleasedReturnValue();
          if (!v131)
          {
            +[MLCLog framework](MLCLog, "framework");
            v31 = objc_claimAutoreleasedReturnValue();
            v23 = v164;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              ANE_CreateNormalizationLayer_cold_2(v31, v139, v140, v141, v142, v143, v144, v145);
            v67 = (id)MEMORY[0x1E0C9AA60];
            goto LABEL_96;
          }
          v31 = v131;
          if (a1)
          {
            if (a1 != 1)
            {
              +[MLCLog framework](MLCLog, "framework");
              v150 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                ANE_CreateNormalizationLayer_cold_1();

              v67 = (id)MEMORY[0x1E0C9AA60];
              v23 = v164;
              goto LABEL_96;
            }
            v156 = v17;
            v159 = v21;
            v28 = v20;
            v29 = v19;
            v30 = v16;
            v27 = 14;
          }
          else
          {
            v156 = v17;
            v159 = v21;
            v28 = v20;
            v29 = v19;
            v30 = v16;
            v27 = 3;
          }
        }
        else
        {
LABEL_4:
          v156 = v17;
          v159 = v21;
          v28 = v20;
          v29 = v19;
          v30 = v16;
          v31 = 0;
        }
        +[_MLCANENormalizationParameters normalizationUnitParametersWith:gocParams:neuronParams:](_MLCANENormalizationParameters, "normalizationUnitParametersWith:gocParams:neuronParams:", v25, v26, v31);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", v27, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        if (v147)
          objc_msgSend(v164, "addObject:", v147);
        v67 = v164;

        v16 = v30;
        v19 = v29;
        v148 = v28;
        v17 = v156;
        v21 = v159;
        v23 = v164;
        v20 = v148;
LABEL_96:

        v18 = v163;
        goto LABEL_97;
      }
      +[MLCLog framework](MLCLog, "framework");
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        ANE_CreateNormalizationLayer_cold_14(v116, v117, v118, v119, v120, v121, v122, v123);
LABEL_88:

      v67 = (id)MEMORY[0x1E0C9AA60];
      v19 = v162;
      v18 = v163;
      v23 = v164;
LABEL_97:

      return v67;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
        ANE_CreateNormalizationLayer_cold_1();
LABEL_27:
      v67 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_97;
  }
}

uint64_t ANE_BuildBatchNormalizationParams(char **a1, void *a2, void *a3, void *a4, void *a5, void *a6, float a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  char *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  size_t v32;
  _WORD *v33;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  float TensorValueInFloat;
  float v40;
  double v41;
  id v42;
  uint64_t v43;
  void *v44;
  int v45;
  float v46;
  id v47;
  uint64_t v48;
  void *v49;
  int v50;
  float v51;
  double v52;
  double v53;
  float v55;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char **v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  _WORD *v94;
  uint64_t v95;
  uint64_t v96;
  id v97[2];

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (objc_msgSend(v13, "count") != 1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      ANE_BuildBatchNormalizationParams_cold_5(v13, v20);
    goto LABEL_27;
  }
  v97[0] = 0;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = ANE_BuildGocParams(v97, objc_msgSend(v18, "unsignedIntegerValue"), v14, v15);
  v20 = (char *)v97[0];

  if ((v19 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      ANE_BuildBatchNormalizationParams_cold_4(v64, v65, v66, v67, v68, v69, v70, v71);

LABEL_27:
    v63 = 0;
    goto LABEL_28;
  }
  v82 = a1;
  v88 = v20;
  v93 = v13;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v87, "unsignedIntegerValue");
  v92 = v14;
  v22 = v14;
  v91 = v15;
  v23 = v15;
  v90 = v16;
  v24 = v16;
  v89 = v17;
  v25 = v17;
  objc_msgSend(v22, "descriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "dataType");

  v86 = v22;
  objc_msgSend(v22, "data");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v96 = objc_msgSend(v28, "bytes");

  v94 = malloc_type_malloc(+[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v27) * v21, 0x7373461AuLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "dataType");

  v85 = v23;
  objc_msgSend(v23, "data");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v95 = objc_msgSend(v31, "bytes");

  v32 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v30) * v21;
  v33 = malloc_type_malloc(v32, 0xDF017A91uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v33, v32, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_21:
    objc_msgSend(v86, "deviceMemory");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:atIndexedSubscript:", v84, objc_msgSend(v86, "deviceIndex"));

    objc_msgSend(v85, "deviceMemory");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:atIndexedSubscript:", v83, objc_msgSend(v85, "deviceIndex"));

    v20 = objc_retainAutorelease(v88);
    *v82 = v20;
    v63 = 1;
    v14 = v92;
    v13 = v93;
    v16 = v90;
    v15 = v91;
    v17 = v89;
    goto LABEL_28;
  }
  v35 = v21;
  v36 = 0;
  v37 = a7;
  v38 = a7 + 1.0;
  while (1)
  {
    TensorValueInFloat = ANE_GetTensorValueInFloat(v96, v27, v36, *(float *)&_D0);
    v40 = ANE_GetTensorValueInFloat(v95, v30, v36, TensorValueInFloat);
    v41 = 1.0;
    if (v25)
    {
      objc_msgSend(v25, "data");
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = objc_msgSend(v42, "bytes");
      objc_msgSend(v25, "descriptor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "dataType");
      v41 = ANE_GetTensorValueInFloat(v43, v45, v36, v46);

    }
    if (v24)
    {
      objc_msgSend(v24, "data");
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v48 = objc_msgSend(v47, "bytes");
      objc_msgSend(v24, "descriptor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "dataType");
      v52 = ANE_GetTensorValueInFloat(v48, v50, v36, v51);

    }
    else
    {
      v52 = 0.0;
    }
    _D0 = 1.0 / sqrt(v37 + v40) * v41;
    v53 = v38 / (fabs(_D0) + v37);
    if (_D0 < 0.0)
      v53 = -v53;
    _D1 = -(TensorValueInFloat - v52 * v53);
    if ((_DWORD)v27 == 3)
    {
      __asm { FCVT            H1, D1 }
      v94[v36] = _H1;
    }
    else
    {
      if ((_DWORD)v27 != 1)
      {
        +[MLCLog framework](MLCLog, "framework");
        v73 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        goto LABEL_32;
      }
      v55 = _D1;
      *(float *)&v94[2 * v36] = v55;
    }
    if ((_DWORD)v30 == 3)
    {
      __asm { FCVT            H0, D0 }
      v33[v36] = LOWORD(_D0);
      goto LABEL_20;
    }
    if ((_DWORD)v30 != 1)
      break;
    *(float *)&_D0 = _D0;
    *(_DWORD *)&v33[2 * v36] = LODWORD(_D0);
LABEL_20:
    if (v35 == ++v36)
      goto LABEL_21;
  }
  +[MLCLog framework](MLCLog, "framework");
  v73 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    goto LABEL_33;
LABEL_32:
  ANE_BuildBatchNormalizationParams_cold_2();
LABEL_33:
  v14 = v92;
  v13 = v93;
  v16 = v90;
  v15 = v91;

  +[MLCLog framework](MLCLog, "framework");
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    ANE_BuildBatchNormalizationParams_cold_1(v74, v75, v76, v77, v78, v79, v80, v81);

  v63 = 0;
  v20 = v88;
  v17 = v89;
LABEL_28:

  return v63;
}

id ANE_CompileNormalizationLayer(unsigned int a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  int v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  id v71;
  id v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  void *v102;
  NSObject *v103;
  void *v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  NSObject *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  char isKindOfClass;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  NSObject *v131;
  NSObject *v132;
  void *v133;
  uint64_t v134;
  NSObject *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[2];
  id v176[2];
  id v177[4];

  v177[2] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v9;
  objc_msgSend(v9, "parentLayers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "params");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v13, "normalizationParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v13, "gocParams");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "neuronParams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 < 2)
    goto LABEL_4;
  if (a1 != 2)
  {
    if (a1 != 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        ANE_CompileNormalizationLayer_cold_1();

      goto LABEL_65;
    }
LABEL_4:
    v156 = v8;
    v158 = v12;
    v165 = v7;
    v18 = v12;
    v19 = v16;
    v163 = v170;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_opt_class();
    v168 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v160 = v17;
      v154 = v13;
      v21 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v160 = v17;
        v154 = v13;
        v21 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            ANE_CompileNormalizationLayer_cold_8();
          goto LABEL_60;
        }
        v160 = v17;
        v154 = v13;
        v21 = 3;
      }
    }
    objc_msgSend(v18, "sourceTensors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = objc_claimAutoreleasedReturnValue();

    -[NSObject descriptor](v36, "descriptor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "dimensionCount");

    if ((unint64_t)(v38 - 2) < 2)
    {
      v145 = (void *)MEMORY[0x1D8263D2C]();
      v177[0] = 0;
      v176[0] = 0;
      v39 = +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:](_MLCANEPlistBuilder, "createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:", v18, v177, v176);
      v153 = v177[0];
      v40 = v176[0];
      v151 = v19;
      v147 = v40;
      if (v39)
      {
        v41 = v40;
        v149 = v10;
        objc_msgSend(v18, "label");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v20, "count"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "objectAtIndexedSubscript:", 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("Name"));

        objc_msgSend(v153, "objectAtIndexedSubscript:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v45);

        objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        ANE_CreateNormUnits(v21, v46, v18, v19, v163);
        v47 = objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v141 = v14;
          if (-[NSObject count](v47, "count"))
          {
            v48 = 0;
            do
            {
              -[NSObject objectAtIndexedSubscript:](v47, "objectAtIndexedSubscript:", v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "label");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v20, "count"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKeyedSubscript:", v51, CFSTR("Name"));

              objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v20, "count") - 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("Name"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v175[0] = v53;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 1);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKeyedSubscript:", v54, CFSTR("Bottom"));

              objc_msgSend(v20, "addObject:", v49);
              ++v48;
            }
            while (v48 < -[NSObject count](v47, "count"));
          }
          objc_msgSend(v18, "label");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v20, "count"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "objectAtIndexedSubscript:", 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, CFSTR("Name"));

          objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v20, "count") - 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Name"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v174[0] = v59;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "objectAtIndexedSubscript:", 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, CFSTR("Bottom"));

          objc_msgSend(v153, "objectAtIndexedSubscript:", 1);
          v62 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v62);
          v63 = 0;
          v10 = v149;
          v14 = v141;
          v17 = v160;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v62 = objc_claimAutoreleasedReturnValue();
          v17 = v160;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            ANE_CompileNormalizationLayer_cold_5();
          v63 = 1;
          v10 = v149;
        }

      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          ANE_CompileNormalizationLayer_cold_6();
        v63 = 1;
        v17 = v160;
      }

      objc_autoreleasePoolPop(v145);
      v13 = v154;
      if (v63)
      {
        v67 = 0;
LABEL_56:
        v19 = v151;
        goto LABEL_61;
      }
LABEL_55:
      v67 = (void *)objc_msgSend(v20, "copy");
      goto LABEL_56;
    }
    if (v38 != 4)
    {
      +[MLCLog framework](MLCLog, "framework");
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        ANE_CompileNormalizationLayer_cold_4();

      v67 = 0;
      v13 = v154;
      v17 = v160;
LABEL_61:

      v8 = v156;
      v102 = v158;
      v7 = v165;
      if (!v67)
      {
        v12 = v158;
        +[MLCLog framework](MLCLog, "framework");
        v103 = objc_claimAutoreleasedReturnValue();
        v16 = v168;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          ANE_CompileNormalizationLayer_cold_2();

LABEL_65:
        v104 = 0;
LABEL_91:
        v129 = v169;
        goto LABEL_92;
      }
      goto LABEL_87;
    }
    ANE_CreateNormUnits(v21, v36, v18, v19, v163);
    v64 = objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v65 = (void *)v64;
      v151 = v19;
      objc_msgSend(v20, "addObjectsFromArray:", v64);

      v13 = v154;
      v17 = v160;
      goto LABEL_55;
    }
    +[MLCLog framework](MLCLog, "framework");
    v101 = objc_claimAutoreleasedReturnValue();
    v13 = v154;
    v17 = v160;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      ANE_CompileNormalizationLayer_cold_5();

LABEL_60:
    v67 = 0;
    goto LABEL_61;
  }
  v22 = v12;
  v168 = v16;
  v23 = v16;
  v24 = v10;
  v25 = v23;
  v148 = v24;
  v144 = v24;
  v164 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v26 = v22;
  objc_msgSend(v26, "normalizedShape");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  objc_msgSend(v26, "gamma");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "beta");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v26;
  v146 = v25;
  if ((unint64_t)(v28 - 1) < 2)
  {
    v29 = v26;
    v30 = v17;
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v29, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sourceTensors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = ANE_ValidateInstanceNormUnit(v32, v31, 1);

    if ((v33 & 1) != 0)
    {
      v10 = v148;
      goto LABEL_34;
    }
    +[MLCLog framework](MLCLog, "framework");
    v99 = objc_claimAutoreleasedReturnValue();
    v17 = v30;
    v26 = v143;
    v10 = v148;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      ANE_CompileNormalizationLayer_cold_15();

LABEL_48:
    v67 = 0;
    goto LABEL_86;
  }
  if (v28 != 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v100 = objc_claimAutoreleasedReturnValue();
    v10 = v148;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      ANE_CompileNormalizationLayer_cold_10();

    goto LABEL_48;
  }
  v68 = v26;
  v30 = v17;
  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v68, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "sourceTensors");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = ANE_ValidateLayerNormUnit(v69, v31, 1);

  v10 = v148;
  if (!v70)
  {
    +[MLCLog framework](MLCLog, "framework");
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      ANE_CompileNormalizationLayer_cold_16();

    v67 = 0;
    v17 = v30;
    goto LABEL_85;
  }
LABEL_34:
  objc_msgSend(v164, "addObject:", v31);

  v17 = v30;
  if (!v152 || !v150)
    goto LABEL_81;
  v166 = v7;
  v159 = v12;
  v71 = v143;
  v72 = v152;
  v140 = v150;
  v73 = v164;
  v139 = v144;
  if (objc_msgSend(v73, "count"))
  {
    v161 = v30;
    v155 = v13;
    objc_msgSend(v73, "objectAtIndexedSubscript:", objc_msgSend(v73, "count") - 1);
    v74 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "label");
    v138 = v72;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v73, "count") - 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v74, "setObject:forKeyedSubscript:", v76, CFSTR("Name"));

    objc_msgSend(v71, "sourceTensors");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = v138;
    ANE_CreateBroadcastedConstantTensor(v138, v78);
    v79 = objc_claimAutoreleasedReturnValue();
    v136 = (void *)v79;
    v137 = v78;
    if (v79)
    {
      v80 = (void *)v79;
      objc_msgSend(v139, "constantTensors");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "addObject:", v80);

      ANE_CreateBroadcastedConstantTensor(v140, v78);
      v82 = objc_claimAutoreleasedReturnValue();
      if (v82)
      {
        objc_msgSend(v139, "constantTensors");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "addObject:", v82);

        v176[0] = kMLCANENetUnitType[0];
        v176[1] = CFSTR("Type");
        v177[0] = CFSTR("ElementWise");
        v177[1] = CFSTR("Mult");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
        v134 = objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v71, v134);
        v135 = v74;
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "label");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v73, "count"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setObject:forKeyedSubscript:", v86, CFSTR("Name"));

        -[NSObject objectForKeyedSubscript:](v135, "objectForKeyedSubscript:", CFSTR("Name"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v175[0] = v87;
        objc_msgSend(v80, "label");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v175[1] = v88;
        v157 = v8;
        v142 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 2);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setObject:forKeyedSubscript:", v89, CFSTR("Bottom"));

        v90 = v84;
        v91 = v84;
        v74 = v135;
        objc_msgSend(v73, "addObject:", v90);
        v173[0] = kMLCANENetUnitType[0];
        v173[1] = CFSTR("Type");
        v174[0] = CFSTR("ElementWise");
        v174[1] = CFSTR("Add");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 2);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v71, v133);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "label");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v73, "count"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setObject:forKeyedSubscript:", v94, CFSTR("Name"));

        objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("Name"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v172[0] = v95;
        -[NSObject label](v82, "label");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v172[1] = v96;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 2);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setObject:forKeyedSubscript:", v97, CFSTR("Bottom"));

        v14 = v142;
        v8 = v157;

        objc_msgSend(v73, "addObject:", v92);
        v10 = v148;

        v98 = (void *)v134;
        v17 = v161;
        v72 = v138;
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          ANE_CompileNormalizationLayer_cold_14();
        v17 = v161;
        v72 = v138;
        v98 = v114;
      }
      v113 = v82 != 0;

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        ANE_CompileNormalizationLayer_cold_13();
      v113 = 0;
      v17 = v161;
    }

    v13 = v155;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      ANE_CompileNormalizationLayer_cold_12(v74, v106, v107, v108, v109, v110, v111, v112);
    v113 = 0;
  }

  v12 = v159;
  v7 = v166;
  if (!v113)
  {
    +[MLCLog framework](MLCLog, "framework");
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      ANE_CompileNormalizationLayer_cold_11();

    v67 = 0;
  }
  else
  {
LABEL_81:
    v67 = (void *)objc_msgSend(v164, "copy");
  }
LABEL_85:
  v26 = v143;
LABEL_86:

  v102 = v12;
  if (!v67)
  {
    +[MLCLog framework](MLCLog, "framework");
    v132 = objc_claimAutoreleasedReturnValue();
    v16 = v168;
    v129 = v169;
    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      ANE_CompileNormalizationLayer_cold_2();

    v104 = 0;
    goto LABEL_92;
  }
LABEL_87:
  objc_msgSend(v14, "addObjectsFromArray:", v67);

  if (!v17)
  {
LABEL_90:
    v12 = v102;
    v104 = (void *)objc_msgSend(v14, "copy");
    v16 = v168;
    goto LABEL_91;
  }
  objc_msgSend(v102, "fusedLayers");
  v12 = v102;
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "objectAtIndexedSubscript:", 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "fusedLayers");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v120, "descriptor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    ANE_CreateUnitsWithNeuronLayer(v120, v17, objc_msgSend(v121, "activationType"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "label");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v123;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v171, 1);
    v167 = v7;
    v162 = v17;
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "objectAtIndexedSubscript:", 0);
    v125 = v14;
    v126 = v13;
    v127 = v10;
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setObject:forKeyedSubscript:", v124, CFSTR("Bottom"));

    v10 = v127;
    v13 = v126;
    v14 = v125;

    v17 = v162;
    v7 = v167;

    objc_msgSend(v14, "addObjectsFromArray:", v122);
    v102 = v12;
    goto LABEL_90;
  }
  +[MLCLog framework](MLCLog, "framework");
  v131 = objc_claimAutoreleasedReturnValue();
  v129 = v169;
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    ANE_CompileNormalizationLayer_cold_3(v12, v131);

  v104 = 0;
  v16 = v168;
LABEL_92:

  return v104;
}

uint64_t ANE_BuildGocParams(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C9AA70];
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
  v11 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("BiasMutable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("BiasCount"));

  objc_msgSend(v7, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "dataType");

  ANE_GetANECIRDataTypeWithMLCDataType(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      ANE_BuildGocParams_cold_1();
    goto LABEL_9;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("BiasType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("ScaleMutable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("ScaleCount"));

  objc_msgSend(v8, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v19, "dataType");

  ANE_GetANECIRDataTypeWithMLCDataType((int)v17);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      ANE_BuildGocParams_cold_1();

LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("ScaleType"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("BiasScaleGroupData"));
  *a1 = objc_retainAutorelease(v10);
  v21 = 1;
LABEL_10:

  return v21;
}

uint64_t ANE_CalculateScaleAndBiasForInstanceNorm(uint64_t a1, void *a2, void *a3, float a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  size_t v13;
  _WORD *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  size_t v19;
  _WORD *v20;
  uint64_t v22;
  double v23;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "dataType");

  objc_msgSend(v7, "data");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");

  v13 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v10) * a1;
  v14 = malloc_type_malloc(v13, 0x51A39D83uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, v13, 1);
  v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "dataType");

  objc_msgSend(v8, "data");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "bytes");

  v19 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v16) * a1;
  v20 = malloc_type_malloc(v19, 0x8B7540F8uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v20, v19, 1);
  v36 = objc_claimAutoreleasedReturnValue();
  if (!a1)
  {
LABEL_12:
    objc_msgSend(v7, "deviceMemory", v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v38;
    objc_msgSend(v29, "setObject:atIndexedSubscript:", v38, objc_msgSend(v7, "deviceIndex"));

    objc_msgSend(v8, "deviceMemory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v37;
    objc_msgSend(v31, "setObject:atIndexedSubscript:", v37, objc_msgSend(v8, "deviceIndex"));

    v33 = 1;
    goto LABEL_18;
  }
  v22 = 0;
  v23 = a4;
  while (1)
  {
    _S8 = ANE_GetTensorValueInFloat(v18, v16, v22, *(float *)&_D0);
    _D0 = ANE_GetTensorValueInFloat(v12, v10, v22, _S8) / (v23 + _S8);
    if ((_DWORD)v10 == 3)
    {
      __asm { FCVT            H0, D0 }
      v14[v22] = LOWORD(_D0);
    }
    else
    {
      if ((_DWORD)v10 != 1)
      {
        +[MLCLog framework](MLCLog, "framework", _D0);
        v34 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        goto LABEL_16;
      }
      *(float *)&_D0 = _D0;
      *(_DWORD *)&v14[2 * v22] = LODWORD(_D0);
    }
    if ((_DWORD)v16 == 3)
    {
      __asm { FCVT            H0, S8 }
      v20[v22] = LOWORD(_D0);
      goto LABEL_11;
    }
    if ((_DWORD)v16 != 1)
      break;
    *(float *)&v20[2 * v22] = _S8;
LABEL_11:
    if (a1 == ++v22)
      goto LABEL_12;
  }
  +[MLCLog framework](MLCLog, "framework");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    goto LABEL_17;
LABEL_16:
  ANE_CalculateScaleAndBiasForInstanceNorm_cold_1();
LABEL_17:

  v33 = 0;
  v32 = (void *)v36;
  v30 = (void *)v38;
LABEL_18:

  return v33;
}

id ANE_CreateNormUnits(int a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  _QWORD v87[2];

  v87[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a1 == 3)
  {
    v82 = v10;
    v22 = v10;
    v23 = v13;
    v24 = v11;
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v26 = v22;
    v84 = 0;
    ANE_GetTensor4DShapeWithBatchFirst(v9, &v84);
    v79 = v84;
    objc_msgSend(v79, "objectAtIndexedSubscript:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unsignedIntegerValue");

    v80 = v24;
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v26, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("OutputChannels"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "groupCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("NumGroups"));

    v87[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = ANE_ValidateLayerNormUnit(v32, v29, 0);

    if ((v24 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        ANE_CreateNormUnits_cold_7();

      v21 = 0;
      goto LABEL_38;
    }
    objc_msgSend(v25, "addObject:", v29);
    if (v23)
    {
      v77 = v13;
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v26, v23);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "label");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringByAppendingString:", CFSTR("_0"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("Name"));

      objc_msgSend(v26, "label");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringByAppendingString:", CFSTR("_1"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("Name"));

      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Name"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, CFSTR("Bottom"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v40, CFSTR("OutputChannels"));

      v85 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = ANE_ValidateGOCUnit(v41, v33, 0);

      if ((v39 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          ANE_CreateNormUnits_cold_6();

        v21 = 0;
        v13 = v77;
        goto LABEL_38;
      }
      objc_msgSend(v25, "addObject:", v33);

      v13 = v77;
    }
    v21 = (void *)objc_msgSend(v25, "copy");
LABEL_38:

    v11 = v80;
    v10 = v82;
    goto LABEL_45;
  }
  if (a1 == 1)
  {
    v42 = v10;
    v43 = v11;
    v83 = v13;
    v81 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v44 = v42;
    v84 = 0;
    ANE_GetTensor4DShapeWithBatchFirst(v9, &v84);
    v45 = v84;
    objc_msgSend(v44, "mean");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46
      && (v47 = (void *)v46,
          objc_msgSend(v44, "variance"),
          v48 = (void *)objc_claimAutoreleasedReturnValue(),
          v48,
          v47,
          v48))
    {
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v44, v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend((id)v51, "unsignedIntegerValue"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v52, CFSTR("OutputChannels"));

      v87[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v51) = ANE_ValidateGOCUnit(v53, v49, 0);

      if ((v51 & 1) != 0)
      {
        v54 = v81;
        objc_msgSend(v81, "addObject:", v49);
LABEL_22:
        v60 = v83;
        goto LABEL_39;
      }
      +[MLCLog framework](MLCLog, "framework");
      v61 = objc_claimAutoreleasedReturnValue();
      v60 = v83;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        ANE_CreateNormUnits_cold_3();
    }
    else
    {
      v78 = v13;
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v44, v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
      v57 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "numberWithUnsignedInteger:", objc_msgSend((id)v57, "unsignedIntegerValue"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v58, CFSTR("OutputChannels"));

      v87[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v57) = ANE_ValidateInstanceNormUnit(v59, v49, 0);

      if ((v57 & 1) != 0)
      {
        v54 = v81;
        objc_msgSend(v81, "addObject:", v49);
        v60 = v83;
        if (!v83)
        {
LABEL_39:

          v21 = (void *)objc_msgSend(v54, "copy");
LABEL_44:

          goto LABEL_45;
        }
        +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v44, v83);
        v61 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "label");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "stringByAppendingString:", CFSTR("_0"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v63, CFSTR("Name"));

        objc_msgSend(v44, "label");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringByAppendingString:", CFSTR("_1"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", v65, CFSTR("Name"));

        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("Name"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v66;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", v67, CFSTR("Bottom"));

        v68 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
        v69 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "numberWithUnsignedInteger:", objc_msgSend((id)v69, "unsignedIntegerValue"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", v70, CFSTR("OutputChannels"));

        v85 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v69) = ANE_ValidateGOCUnit(v71, v61, 0);

        if ((v69 & 1) != 0)
        {
          objc_msgSend(v81, "addObject:", v61);

          v54 = v81;
          v13 = v78;
          goto LABEL_22;
        }
        +[MLCLog framework](MLCLog, "framework");
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          ANE_CreateNormUnits_cold_3();

        v13 = v78;
        v60 = v83;
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v61 = objc_claimAutoreleasedReturnValue();
        v60 = v83;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          ANE_CreateNormUnits_cold_4();
      }
    }

    v21 = 0;
    v54 = v81;
    goto LABEL_44;
  }
  if (a1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      ANE_CreateNormUnits_cold_1();

    v21 = 0;
  }
  else
  {
    v14 = v12;
    v84 = 0;
    ANE_GetTensor4DShapeWithBatchFirst(v9, &v84);
    v15 = v84;
    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend((id)v18, "unsignedIntegerValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("OutputChannels"));

    v87[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = ANE_ValidateGOCUnit(v20, v16, 0);

    if ((v18 & 1) != 0)
    {
      v86 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        ANE_CreateNormUnits_cold_2();

      v21 = 0;
    }
    v13 = v14;

  }
LABEL_45:

  return v21;
}

id ANE_CreateBroadcastedConstantTensor(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  const void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  size_t v25;
  size_t v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  size_t v31;
  char *v32;
  void *v33;
  void *v34;
  void *v36;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dimensionCount");

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v8 = v6 - 3;
  if (v6 < 3)
    v8 = 0;
  if (v8 >= v6)
  {
    v11 = 1;
  }
  else
  {
    v9 = 3;
    if (v6 < 3)
      v9 = v6;
    v10 = -v9;
    v11 = 1;
    do
    {
      objc_msgSend(v4, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shape");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v6 + v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

      objc_msgSend(v4, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v6 + v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 *= objc_msgSend(v17, "unsignedIntegerValue");

    }
    while (!__CFADD__(v10++, 1));
  }
  objc_msgSend(v3, "data");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (const void *)objc_msgSend(v19, "bytes");

  objc_msgSend(v3, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "dataType");

  v23 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v22);
  v36 = v3;
  objc_msgSend(v3, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "tensorAllocationSizeInBytes");

  v26 = v25 / v23;
  v27 = v11 / (v25 / v23);
  if (v11 % (v25 / v23))
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      ANE_CreateBroadcastedConstantTensor_cold_1();

    v29 = 0;
    v30 = v36;
  }
  else
  {
    v31 = v23 * v11;
    v32 = (char *)malloc_type_malloc(v31, 0x25DED30DuLL);
    +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v32, v31, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 <= v11)
    {
      if (v27 <= 1)
        v27 = 1;
      do
      {
        memcpy(v32, v20, v25);
        v32 += v25;
        --v27;
      }
      while (v27);
    }
    v30 = v36;
    objc_msgSend(v36, "label");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCANEPlistBuilder constantTensorWithShape:data:dataType:tensorLabel:](_MLCANEPlistBuilder, "constantTensorWithShape:data:dataType:tensorLabel:", v7, v33, v22, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v29;
}

void OUTLINED_FUNCTION_13_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_15(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

unint64_t *hashCombine_6(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 6;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

unint64_t *hashCombine_7(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 3;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

id GPU_CreateSGDOptimizer(void *a1, uint64_t a2, void *a3, float a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  unsigned int v35;
  const __CFString *v36;

  v7 = a1;
  v8 = a3;
  objc_msgSend(v7, "deviceList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v12 = (void *)v11;
  if (v10)
  {
    v13 = 0;
    v14 = CFSTR("sgdMomentumOptimizerUpdate");
    if (a4 == 0.0)
      v14 = CFSTR("sgdVanillaOptimizerUpdate");
    v36 = v14;
    v35 = a2;
    v33 = (void *)v11;
    v34 = v10;
    do
    {
      objc_msgSend(v7, "deviceList", v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "gpuLibrary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "newFunctionWithName:", v36);

      v20 = objc_msgSend(v16, "newComputePipelineStateWithFunction:error:", v19, 0);
      if (v20)
      {
        v21 = (void *)v20;
        +[MLCDeviceOptimizer deviceOptimizerWithKernel:](MLCDeviceOptimizer, "deviceOptimizerWithKernel:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v12, "addObject:", v22);
        objc_msgSend(v22, "setGpuOptimizerKernelType:", 2);
        objc_msgSend(v22, "setDescriptor:", v8);
        objc_msgSend(v8, "learningRate");
        objc_msgSend(v22, "setLearningRate:");
        *(float *)&v23 = a4;
        objc_msgSend(v22, "setMomentumScale:", v23);
        objc_msgSend(v22, "setUsesNesterov:", a2);
        objc_msgSend(v22, "setL2NormBuffer:", 0);
        if (objc_msgSend(v8, "gradientClippingType") == 2)
        {
          objc_msgSend(v8, "customGlobalNorm");
          if (v24 == 0.0)
          {
            objc_msgSend(v7, "gpuLibrary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", v13);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v26, "newFunctionWithName:", CFSTR("compute_l2norm"));

            v28 = (void *)objc_msgSend(v16, "newComputePipelineStateWithFunction:error:", v27, 0);
            objc_msgSend(v22, "setComputeL2NormKernel:", v28);
            objc_msgSend(v7, "gpuLibrary");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectAtIndexedSubscript:", v13);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v30, "newFunctionWithName:", CFSTR("sum_l2norm_values_in_buffer"));

            v12 = v33;
            v10 = v34;
            v21 = (void *)objc_msgSend(v16, "newComputePipelineStateWithFunction:error:", v19, 0);

            a2 = v35;
            objc_msgSend(v22, "setSumL2NormKernel:", v21);
          }
        }

      }
      ++v13;
    }
    while (v10 != v13);
  }
  v31 = (void *)objc_msgSend(v12, "copy");

  return v31;
}

id GPU_CreateAdamOptimizer(void *a1, uint64_t a2, float a3, float a4, float a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  float v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  unsigned int v42;
  unsigned int v43;
  void *v44;
  const __CFString *v45;

  v14 = a1;
  v15 = a8;
  objc_msgSend(v14, "deviceList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v44 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (v17)
  {
    v18 = 0;
    v19 = CFSTR("adamOptimizerUpdate");
    if ((_DWORD)a2)
      v19 = CFSTR("adamWithAmsGradOptimizerUpdate");
    v45 = v19;
    v42 = a2;
    v43 = a7;
    v41 = v15;
    do
    {
      objc_msgSend(v14, "deviceList", v41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "gpuLibrary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "newFunctionWithName:", v45);

      v25 = objc_msgSend(v21, "newComputePipelineStateWithFunction:error:", v24, 0);
      if (v25)
      {
        v26 = (void *)v25;
        +[MLCDeviceOptimizer deviceOptimizerWithKernel:](MLCDeviceOptimizer, "deviceOptimizerWithKernel:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v44, "addObject:", v27);
        objc_msgSend(v27, "setGpuOptimizerKernelType:", 1);
        objc_msgSend(v27, "setDescriptor:", v15);
        *(float *)&v28 = a3;
        objc_msgSend(v27, "setBeta1:", v28);
        *(float *)&v29 = a4;
        objc_msgSend(v27, "setBeta2:", v29);
        *(float *)&v30 = a5;
        objc_msgSend(v27, "setEpsilon:", v30);
        objc_msgSend(v27, "setAmsgrad:", a2);
        objc_msgSend(v27, "setDecoupleWeightDecay:", a7);
        objc_msgSend(v27, "setL2NormBuffer:", 0);
        if (objc_msgSend(v15, "gradientClippingType") == 2)
        {
          objc_msgSend(v15, "customGlobalNorm");
          if (v31 == 0.0)
          {
            objc_msgSend(v14, "gpuLibrary");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectAtIndexedSubscript:", v18);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v17;
            v35 = (void *)objc_msgSend(v33, "newFunctionWithName:", CFSTR("compute_l2norm"));

            v36 = (void *)objc_msgSend(v21, "newComputePipelineStateWithFunction:error:", v35, 0);
            objc_msgSend(v27, "setComputeL2NormKernel:", v36);
            objc_msgSend(v14, "gpuLibrary");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectAtIndexedSubscript:", v18);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v38, "newFunctionWithName:", CFSTR("sum_l2norm_values_in_buffer"));

            v17 = v34;
            v15 = v41;

            a2 = v42;
            v26 = (void *)objc_msgSend(v21, "newComputePipelineStateWithFunction:error:", v24, 0);

            a7 = v43;
            objc_msgSend(v27, "setSumL2NormKernel:", v26);
          }
        }

      }
      ++v18;
    }
    while (v17 != v18);
  }
  v39 = (void *)objc_msgSend(v44, "copy");

  return v39;
}

id GPU_CreateRMSPropOptimizer(void *a1, uint64_t a2, void *a3, float a4, float a5, float a6)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  float v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  unsigned int v41;

  v11 = a1;
  v12 = a3;
  objc_msgSend(v11, "deviceList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v16 = (void *)v15;
  if (v14)
  {
    v17 = 0;
    v41 = a2;
    v39 = (void *)v15;
    v40 = v12;
    do
    {
      objc_msgSend(v11, "deviceList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "gpuLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "newFunctionWithName:", CFSTR("rmsPropOptimizerUpdate"));

      v23 = objc_msgSend(v19, "newComputePipelineStateWithFunction:error:", v22, 0);
      if (v23)
      {
        v24 = (void *)v23;
        +[MLCDeviceOptimizer deviceOptimizerWithKernel:](MLCDeviceOptimizer, "deviceOptimizerWithKernel:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v16, "addObject:", v25);
        objc_msgSend(v25, "setGpuOptimizerKernelType:", 3);
        objc_msgSend(v25, "setDescriptor:", v12);
        *(float *)&v26 = a6;
        objc_msgSend(v25, "setEpsilon:", v26);
        *(float *)&v27 = a5;
        objc_msgSend(v25, "setAlpha:", v27);
        objc_msgSend(v25, "setCentered:", a2);
        *(float *)&v28 = a4;
        objc_msgSend(v25, "setMomentumScale:", v28);
        objc_msgSend(v25, "setL2NormBuffer:", 0);
        if (objc_msgSend(v12, "gradientClippingType") == 2)
        {
          objc_msgSend(v12, "customGlobalNorm");
          if (v29 == 0.0)
          {
            objc_msgSend(v11, "gpuLibrary");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectAtIndexedSubscript:", v17);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v14;
            v33 = (void *)objc_msgSend(v31, "newFunctionWithName:", CFSTR("compute_l2norm"));

            v34 = (void *)objc_msgSend(v19, "newComputePipelineStateWithFunction:error:", v33, 0);
            objc_msgSend(v25, "setComputeL2NormKernel:", v34);
            objc_msgSend(v11, "gpuLibrary");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndexedSubscript:", v17);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v36, "newFunctionWithName:", CFSTR("sum_l2norm_values_in_buffer"));

            v14 = v32;
            v12 = v40;

            v16 = v39;
            v24 = (void *)objc_msgSend(v19, "newComputePipelineStateWithFunction:error:", v22, 0);

            a2 = v41;
            objc_msgSend(v25, "setSumL2NormKernel:", v24);
          }
        }

      }
      ++v17;
    }
    while (v14 != v17);
  }
  v37 = (void *)objc_msgSend(v16, "copy");

  return v37;
}

BOOL ANE_ConvertFp32ToFp16(uint64_t a1, uint64_t a2)
{
  return +[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:", 1, a1, a2);
}

BOOL ANE_ConvertFp32ToInt16(uint64_t a1, _WORD *a2)
{
  _BOOL8 v3;
  NSObject *v4;
  __int16 v6;

  v6 = 0;
  v3 = +[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:", 1, a1, &v6);
  if (v3)
  {
    *a2 = v6;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ANE_ConvertFp32ToInt16_cold_1();

  }
  return v3;
}

uint64_t ANE_CompressSparseKernel(void *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, float a6)
{
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  float v31;
  float v32;
  NSObject *v42;
  _QWORD *v43;

  v10 = a1;
  *a5 = 0;
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "bytes");
  v13 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", a2);
  v14 = objc_msgSend(v11, "length");
  v16 = v14;
  v17 = v14 / v13;
  if (v13 <= v14)
  {
    v18 = 0;
    if (v17 <= 1)
      v19 = 1;
    else
      v19 = v14 / v13;
    do
    {
      v15 = fabsf(ANE_GetTensorValueInFloat(v12, a2, v18, v15));
      if (v15 > a6)
        ++*a5;
      ++v18;
    }
    while (v19 != v18);
  }
  if ((float)((float)(v17 - *a5) / (float)v17) >= 0.2)
  {
    v43 = a4;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc((v17 + 7) >> 3, 1uLL, 0x100004077774924uLL), (v17 + 7) >> 3, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(*a5 * v13, 0x3AEDEE18uLL), *a5 * v13, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_retainAutorelease(v22);
    v24 = -[NSObject bytes](v20, "bytes");
    v25 = objc_retainAutorelease(v23);
    v26 = objc_msgSend(v25, "bytes");
    if (v13 <= v16)
    {
      v27 = 0;
      v28 = 0;
      if (v17 <= 1)
        v29 = 1;
      else
        v29 = v17;
      while (2)
      {
        switch((int)a2)
        {
          case 1:
            v32 = *(float *)(v12 + 4 * v27);
            if (fabsf(v32) <= a6)
              goto LABEL_26;
            *(float *)(v26 + 4 * v28) = v32;
            goto LABEL_25;
          case 3:
            _H0 = *(_WORD *)(v12 + 2 * v27);
            __asm { FCVT            S1, H0 }
            _S1 = fabsf(_S1);
            __asm
            {
              FCVT            H1, S1
              FCVT            S1, H1
            }
            if (_S1 <= a6)
              goto LABEL_26;
            *(_WORD *)(v26 + 2 * v28) = _H0;
            goto LABEL_25;
          case 6:
          case 9:
            v30 = *(unsigned __int8 *)(v12 + v27);
            v31 = (float)v30;
            goto LABEL_23;
          case 8:
            LOBYTE(v30) = *(_BYTE *)(v12 + v27);
            v31 = fabsf((float)(char)v30);
LABEL_23:
            if (v31 <= a6)
              goto LABEL_26;
            *(_BYTE *)(v26 + v28) = v30;
LABEL_25:
            ++v28;
            *(_BYTE *)(v24 + (v27 >> 3)) |= 1 << (v27 & 7);
LABEL_26:
            if (v29 == ++v27)
              break;
            continue;
          default:
            +[MLCLog framework](MLCLog, "framework");
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              ANE_CompressSparseKernel_cold_2();

            v21 = 0;
            goto LABEL_28;
        }
        break;
      }
    }
    *a3 = objc_retainAutorelease(v20);
    *v43 = objc_retainAutorelease(v25);
    v21 = 1;
LABEL_28:

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      ANE_CompressSparseKernel_cold_1();
    v21 = 0;
  }

  return v21;
}

float ANE_GetTensorValueInFloat(uint64_t a1, int a2, uint64_t a3, float a4)
{
  float result;
  NSObject *v5;

  switch(a2)
  {
    case 1:
      result = *(float *)(a1 + 4 * a3);
      break;
    case 3:
      _H0 = *(_WORD *)(a1 + 2 * a3);
      __asm { FCVT            S0, H0 }
      break;
    case 4:
    case 6:
    case 9:
      LOBYTE(a4) = *(_BYTE *)(a1 + a3);
      result = (float)LODWORD(a4);
      break;
    case 8:
      result = (float)*(char *)(a1 + a3);
      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        ANE_GetTensorValueInFloat_cold_1();

      result = NAN;
      break;
  }
  return result;
}

uint64_t ANE_CalculateImageSizeForTensor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;

  v1 = a1;
  objc_msgSend(v1, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 1;

  objc_msgSend(v1, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = 1;
  if (v7 > v4)
  {
    do
    {
      objc_msgSend(v1, "descriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shape");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 *= objc_msgSend(v11, "unsignedIntegerValue");

      ++v4;
      objc_msgSend(v1, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shape");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v4 < v14);
  }
  objc_msgSend(v1, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "elementByteCount");

  return v16 * v8;
}

void ANE_GetTensorWidthAndHeightWithOnePrepended(void *a1, uint64_t *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a1;
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "dimensionCount");

  switch(v7)
  {
    case 1:
      objc_msgSend(v5, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shape");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
      v12 = 1;
      goto LABEL_10;
    case 2:
      objc_msgSend(v5, "descriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shape");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v16, "unsignedIntegerValue");

      objc_msgSend(v5, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shape");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      v18 = 0;
      goto LABEL_9;
    case 3:
      objc_msgSend(v5, "descriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shape");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v21, "unsignedIntegerValue");

      objc_msgSend(v5, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shape");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      v18 = 1;
      goto LABEL_9;
    case 4:
      objc_msgSend(v5, "descriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shape");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v24, "unsignedIntegerValue");

      objc_msgSend(v5, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shape");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      v18 = 2;
LABEL_9:
      objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
LABEL_10:

      *a2 = v11;
      *a3 = v12;
      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        ANE_GetTensorWidthAndHeightWithOnePrepended_cold_1();

      break;
  }

}

void ANE_GetTensorFeatureChannelsWithOnePrepended(void *a1, uint64_t *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a1;
  objc_msgSend(v11, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dimensionCount");

  if (v4 == 3)
  {
    objc_msgSend(v11, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shape");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  else
  {
    if (v4 != 4)
    {
      v10 = 1;
      goto LABEL_7;
    }
    objc_msgSend(v11, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shape");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

LABEL_7:
  *a2 = v10;

}

void ANE_GetTensorBatchSizeWithOnePrepended(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a1;
  objc_msgSend(v7, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "dimensionCount") == 4)
  {
    objc_msgSend(v7, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shape");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *a2 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    *a2 = 1;
  }

}

void ANE_GetTensor4DShapeWithOnePrepended(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v10 = 1;
  v11 = 1;
  v8 = 1;
  v9 = 1;
  v3 = a1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v3, &v8, &v9);
  ANE_GetTensorFeatureChannelsWithOnePrepended(v3, &v10);
  ANE_GetTensorBatchSizeWithOnePrepended(v3, &v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  *a2 = (id)objc_claimAutoreleasedReturnValue();

}

void ANE_GetDimensionIn4DWithOnePrepended(unint64_t a1, unint64_t a2, uint64_t *a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  if (a1 >= 5)
  {
    +[MLCLog framework](MLCLog, "framework");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ANE_GetDimensionIn4DWithOnePrepended_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

LABEL_11:
    v12 = -1;
    goto LABEL_12;
  }
  if (a2 >= a1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      ANE_GetDimensionIn4DWithOnePrepended_cold_2();

    goto LABEL_11;
  }
  *a3 = a2;
  if (a1 > 3)
    return;
  v12 = a2 - a1 + 4;
LABEL_12:
  *a3 = v12;
}

void ANE_GetTensorWidthAndHeightWithBatchFirst(void *a1, uint64_t *a2, uint64_t *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a1;
  objc_msgSend(v15, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dimensionCount");

  if (v6 == 3)
  {
    objc_msgSend(v15, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "unsignedIntegerValue");
    v14 = 1;
  }
  else
  {
    if (v6 != 4)
    {
      v14 = 1;
      v10 = 1;
      goto LABEL_7;
    }
    objc_msgSend(v15, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v15, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");
  }

LABEL_7:
  *a2 = v10;
  *a3 = v14;

}

void ANE_GetTensorFeatureChannelsWithBatchFirst(void *a1, uint64_t *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v3 = a1;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dimensionCount");

  if ((unint64_t)(v5 - 2) < 3)
  {
    objc_msgSend(v3, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
LABEL_5:
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    *a2 = v11;
    goto LABEL_9;
  }
  if (v5 == 1)
  {
    objc_msgSend(v3, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
    goto LABEL_5;
  }
  +[MLCLog framework](MLCLog, "framework");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    ANE_GetTensorFeatureChannelsWithBatchFirst_cold_1();

LABEL_9:
}

void ANE_GetTensorBatchSizeWithBatchFirst(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a1;
  objc_msgSend(v7, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "dimensionCount") == 1)
  {
    *a2 = 1;
  }
  else
  {
    objc_msgSend(v7, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shape");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *a2 = objc_msgSend(v6, "unsignedIntegerValue");

  }
}

void ANE_GetTensor4DShapeWithBatchFirst(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v10 = 1;
  v11 = 1;
  v8 = 1;
  v9 = 1;
  v3 = a1;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v3, &v8, &v9);
  ANE_GetTensorFeatureChannelsWithBatchFirst(v3, &v10);
  ANE_GetTensorBatchSizeWithBatchFirst(v3, &v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  *a2 = (id)objc_claimAutoreleasedReturnValue();

}

__CFString *ANE_GetANECIRDimension(unint64_t a1)
{
  NSObject *v2;

  if (a1 < 4)
    return off_1E9820CD0[a1];
  +[MLCLog framework](MLCLog, "framework");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    ANE_GetANECIRDimension_cold_1();

  return 0;
}

__CFString *ANE_GetANECIRDataTypeWithMLCDataType(int a1)
{
  int v1;
  NSObject *v2;

  v1 = a1 - 1;
  if ((a1 - 1) < 9 && ((0x1ADu >> v1) & 1) != 0)
    return off_1E9820CF0[v1];
  +[MLCLog framework](MLCLog, "framework");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    ANE_GetANECIRDataTypeWithMLCDataType_cold_1();

  return 0;
}

id ANE_FindUnitWithType(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Type"), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v3))
        {
          v11 = v9;

          goto LABEL_11;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

BOOL ANE_ValidateInterleave(unint64_t a1, unint64_t a2, int a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 result;
  BOOL v14;

  if (a1)
  {
    v4 = 0;
    while (kMLCANEIOInterleaves[v4] != a1)
    {
      if (++v4 == 5)
      {
        if (!a3)
          return 0;
        +[MLCLog framework](MLCLog, "framework");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          ANE_ValidateInterleave_cold_5();
        goto LABEL_25;
      }
    }
    if (a2)
    {
      if (a1 <= a2)
      {
        result = a2 % a1 == 0;
        if (a2 % a1)
          v14 = a3 == 0;
        else
          v14 = 1;
        if (v14)
          return result;
        +[MLCLog framework](MLCLog, "framework");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          ANE_ValidateInterleave_cold_4();
      }
      else
      {
        if (!a3)
          return 0;
        +[MLCLog framework](MLCLog, "framework");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          ANE_ValidateInterleave_cold_3();
      }
    }
    else
    {
      if (!a3)
        return 0;
      +[MLCLog framework](MLCLog, "framework");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        ANE_ValidateInterleave_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_25;
  }
  if (a3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      ANE_ValidateInterleave_cold_1();
LABEL_25:

  }
  return 0;
}

unint64_t ANE_GetANEElementByteCount(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;

  if (a1 <= 9)
  {
    if (((1 << a1) & 0x358) != 0)
    {
      v1 = a1;
      return +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v1);
    }
    if ((_DWORD)a1 == 1)
    {
      v1 = 3;
      return +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v1);
    }
  }
  +[MLCLog framework](MLCLog, "framework");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    ANE_GetANEElementByteCount_cold_1();

  return 0;
}

unint64_t ANE_CalculateRowStrideForTensor(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  unint64_t ANEElementByteCount;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a1;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 1;
  v17 = 1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v3, &v19, &v18);
  ANE_GetTensorFeatureChannelsWithOnePrepended(v3, (uint64_t *)&v17);

  ANEElementByteCount = ANE_GetANEElementByteCount(objc_msgSend(v4, "dataType"));
  if (!ANEElementByteCount)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ANE_CalculateRowStrideForTensor_cold_1();
    goto LABEL_8;
  }
  v6 = ANEElementByteCount;
  if (!ANE_ValidateInterleave(a2, v17, 1))
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ANE_CalculateRowStrideForTensor_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_8:

    v7 = 0;
    goto LABEL_9;
  }
  v7 = ((v6 * a2 * v19 + 63) / 0x40) << 6;
LABEL_9:

  return v7;
}

uint64_t ANE_CalculatePlaneStrideForTensor(void *a1, unint64_t a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = ANE_CalculateRowStrideForTensor(v3, a2);
  if (v4)
  {
    v5 = v4;
    v9 = 1;
    ANE_GetTensorWidthAndHeightWithOnePrepended(v3, &v10, &v9);
    v6 = v9 * v5;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ANE_CalculatePlaneStrideForTensor_cold_1();

    v6 = 0;
  }

  return v6;
}

unint64_t ANE_CalculatePlaneCountForTensor(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(a1, &v17);
  v3 = v17;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (ANE_ValidateInterleave(a2, v7, 1))
    return (a2 + v7 - 1) / a2 * v5;
  +[MLCLog framework](MLCLog, "framework");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    ANE_CalculatePlaneCountForTensor_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

  return 0;
}

uint64_t ANE_CalculateIOInterleave(void *a1)
{
  id v1;
  void *v2;
  unint64_t ANEElementByteCount;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = a1;
  objc_msgSend(v1, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 1;
  v13 = 1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v1, &v15, &v14);
  ANE_GetTensorFeatureChannelsWithOnePrepended(v1, (uint64_t *)&v13);
  ANEElementByteCount = ANE_GetANEElementByteCount(objc_msgSend(v2, "dataType"));
  if (ANEElementByteCount)
  {
    v4 = v15 * ANEElementByteCount;
    v5 = 1;
    if (v15 * ANEElementByteCount % 0x40)
    {
      v6 = ANE_CalculateRowStrideForTensor(v1, 1uLL) - v4;
      v7 = 4u;
      v8 = v13;
      do
      {
        v9 = kMLCANEIOInterleaves[v7];
        if (ANE_ValidateInterleave(v9, v8, 0))
        {
          v10 = ANE_CalculateRowStrideForTensor(v1, v9);
          if (v10 - v4 * v9 < v6)
          {
            v5 = v9;
            v6 = v10 - v4 * v9;
          }
        }
        --v7;
      }
      while (v7 * 8);
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      ANE_CalculateIOInterleave_cold_1();

    v5 = 0;
  }

  return v5;
}

uint64_t ANE_ConvertInputTensor(void *a1, void *a2, char *a3, uint64_t a4, char *a5, unint64_t a6)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  size_t v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  size_t v42;
  NSObject *v43;
  BOOL v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  unint64_t v62;
  NSObject *v63;
  NSObject *v64;
  size_t v65;
  size_t v66;
  char *v67;
  size_t v68;
  size_t v69;
  char *v70;
  NSObject *v72;
  NSObject *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  NSObject *v80;
  NSObject *v81;
  uint64_t i;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  char *__src;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  id v107[2];

  v11 = a1;
  v12 = a2;
  objc_msgSend(v11, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "tensorAllocationSizeInBytes");

  if (v14 == a4)
  {
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v11, "descriptor");
      v15 = objc_claimAutoreleasedReturnValue();
      v107[0] = 0;
      ANE_GetTensor4DShapeWithOnePrepended(v11, v107);
      v16 = v107[0];
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v17, "unsignedIntegerValue");

      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v18, "unsignedIntegerValue");

      objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v19, "unsignedIntegerValue");

      objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v20, "unsignedIntegerValue");

      v104 = a5;
      switch(-[NSObject dimensionCount](v15, "dimensionCount"))
      {
        case 1:
          goto LABEL_14;
        case 2:
          v96 = a6;
          goto LABEL_14;
        case 3:
          v84 = a6;
          goto LABEL_14;
        case 4:
          v83 = a6;
LABEL_14:
          v30 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", -[NSObject dataType](v15, "dataType"));
          v31 = -[NSObject dataType](v15, "dataType");
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Interleave"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v32, "unsignedIntegerValue");

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RowStride"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v33, "unsignedIntegerValue");

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PlaneStride"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v34, "unsignedIntegerValue");

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Type"));
          v29 = objc_claimAutoreleasedReturnValue();
          v35 = ANE_ANECDataTypeToMLCDataType(v29);
          v36 = v35;
          if ((v31 & 0xFFFFFFFD) == 1 && (_DWORD)v35 == 3
            || v31 <= 9 && ((1 << v31) & 0x250) != 0 && (v35 | 2) == 6)
          {
            if ((v31 | 2) == 6)
              v31 = 9;
            if ((v35 | 2) == 6)
              v36 = 9;
          }
          else
          {
            if (v31 != 8 || (_DWORD)v35 != 8)
            {
              v63 = v29;
              +[MLCLog framework](MLCLog, "framework");
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                ANE_ConvertInputTensor_cold_4();

              v28 = 0;
              v29 = v63;
              goto LABEL_87;
            }
            v31 = 8;
          }
          v37 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v36);
          v38 = v105;
          if (!v105)
          {
            +[MLCLog framework](MLCLog, "framework");
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              ANE_ConvertInputTensor_cold_3();

LABEL_34:
            v28 = 0;
            goto LABEL_87;
          }
          v39 = v37;
          v95 = v102 / v37;
          if (v105 == 1)
          {
            v40 = v106;
            v41 = v84 * v106 * v96 * v83;
            v42 = v41 * v30;
            if ((_DWORD)v36 == v31)
            {
              if (v106 == v95)
              {
                memcpy(v104, a3, v41 * v30);
LABEL_86:
                v28 = 1;
                goto LABEL_87;
              }
              if (!v42)
                goto LABEL_86;
              v81 = v29;
              v65 = 0;
              v66 = v30 * v106;
              v67 = v104;
              do
              {
                memcpy(v67, &a3[v65], v66);
                v65 += v66;
                v67 += v102;
              }
              while (v65 < v42);
              v28 = 1;
LABEL_80:
              v29 = v81;
              goto LABEL_87;
            }
            if (v106 == v95)
            {
              +[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:");
              goto LABEL_86;
            }
            if (!v42)
              goto LABEL_86;
            v78 = v16;
            v80 = v29;
            v68 = 0;
            v69 = v30 * v106;
            v70 = v104;
            do
            {
              +[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:", v40, &a3[v68], v70);
              v40 = v106;
              v68 += v69;
              v70 += v102;
            }
            while (v68 < v42);
            v28 = 1;
          }
          else
          {
            v94 = v100 / v37;
            v44 = (_DWORD)v36 == v31;
            v45 = a3;
            v46 = v106;
            if (!v44)
            {
              if (!v83)
                goto LABEL_86;
              v79 = v16;
              v81 = v29;
              v75 = v12;
              v77 = v11;
              v73 = v15;
              v55 = v84 / v105;
              if (v84 / v105 <= 1)
                v55 = 1;
              v87 = 0;
              v89 = v55;
              do
              {
                v86 = v45;
                if (v38 <= v84)
                {
                  v93 = 0;
                  v91 = v45;
                  do
                  {
                    if (v96)
                    {
                      v101 = 0;
                      v99 = v91;
                      do
                      {
                        if (v46)
                        {
                          v56 = 0;
                          v57 = v99;
                          v58 = (v87 * v84 / v38 + v93) * v94;
                          do
                          {
                            v59 = 0;
                            v60 = v101 * v95 + v56 * v38;
                            v61 = v57;
                            v62 = v38;
                            do
                            {
                              +[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:", 1, v61, &v104[2 * v60 + 2 * v59++ + 2 * v58], v73, v75, v77);
                              v61 += 4 * v106 * v96;
                              --v62;
                            }
                            while (v62);
                            ++v56;
                            v57 += 4;
                            v38 = v105;
                            v46 = v106;
                          }
                          while (v56 != v106);
                        }
                        v99 += 4 * v106;
                        ++v101;
                      }
                      while (v101 != v96);
                    }
                    v91 += 4 * v106 * v96 * v105;
                    ++v93;
                  }
                  while (v93 != v89);
                }
                v45 = &v86[4 * v106 * v96 * v84];
                ++v87;
              }
              while (v87 != v83);
              v28 = 1;
              v15 = v73;
              v12 = v75;
              v11 = v77;
              v16 = v79;
              goto LABEL_80;
            }
            if (!v83)
              goto LABEL_86;
            v78 = v16;
            v80 = v29;
            v72 = v15;
            v74 = v12;
            v76 = v11;
            v47 = v84 / v105;
            if (v84 / v105 <= 1)
              v47 = 1;
            v88 = v47;
            v48 = v30 * v106 * v96;
            for (i = 0; i != v83; ++i)
            {
              v85 = v45;
              if (v38 <= v84)
              {
                v92 = 0;
                v90 = v45;
                do
                {
                  if (v96)
                  {
                    v98 = 0;
                    __src = v90;
                    do
                    {
                      if (v46)
                      {
                        v49 = 0;
                        v50 = (i * v84 / v38 + v92) * v94;
                        v51 = __src;
                        do
                        {
                          v52 = 0;
                          v53 = v98 * v95 + v49 * v38;
                          v103 = v51;
                          v54 = v38;
                          do
                          {
                            memcpy(&v104[(v53 + v52++ + v50) * v39], v51, v30);
                            v51 += v48;
                            --v54;
                          }
                          while (v54);
                          ++v49;
                          v51 = &v103[v30];
                          v38 = v105;
                          v46 = v106;
                        }
                        while (v49 != v106);
                      }
                      __src += v30 * v106;
                      ++v98;
                    }
                    while (v98 != v96);
                  }
                  v90 += v48 * v105;
                  ++v92;
                }
                while (v92 != v88);
              }
              v45 = &v85[v48 * v84];
            }
            v28 = 1;
            v12 = v74;
            v11 = v76;
            v15 = v72;
          }
          v16 = v78;
          v29 = v80;
LABEL_87:

          goto LABEL_88;
        default:
          +[MLCLog framework](MLCLog, "framework");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            ANE_ConvertInputTensor_cold_2(v15, v29);
          goto LABEL_34;
      }
    }
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      ANE_ConvertInputTensor_cold_1(v15, v21, v22, v23, v24, v25, v26, v27);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      ANE_ConvertInputTensor_cold_5(v11, a4, v15);
  }
  v28 = 0;
LABEL_88:

  return v28;
}

uint64_t ANE_ANECDataTypeToMLCDataType(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UInt8")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Int8")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Float16")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ANE_ANECDataTypeToMLCDataType_cold_1();

    v2 = 0;
  }

  return v2;
}

uint64_t ANE_ReadOutputTensor(void *a1, void *a2, uint64_t a3, char *a4, unint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  size_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v44;
  unsigned int v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  __IOSurface *v51;
  char *BaseAddress;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  unint64_t v76;
  unint64_t v77;
  size_t v78;
  unint64_t v79;
  __IOSurface *buffer;
  NSObject *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *__dst;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  int v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  id v110[2];

  v9 = a1;
  v10 = a2;
  objc_msgSend(v9, "deviceMemory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      ANE_ReadOutputTensor_cold_1();
    goto LABEL_15;
  }
  if (objc_msgSend(v9, "deviceIndex") != a3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      ANE_ReadOutputTensor_cold_8(v9, a3, v19);
    goto LABEL_15;
  }
  objc_msgSend(v9, "deviceMemory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      ANE_ReadOutputTensor_cold_7(v19, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_15;
  }
  if (!objc_msgSend(v10, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      ANE_ReadOutputTensor_cold_2(v19, v35, v36, v37, v38, v39, v40, v41);
LABEL_15:
    v42 = 0;
    goto LABEL_16;
  }
  __dst = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Interleave"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RowStride"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PlaneStride"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Type"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = ANE_ANECDataTypeToMLCDataType(v19);
  v21 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:");
  objc_msgSend(v9, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v9, v110);
  v23 = v110[0];
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v24, "unsignedIntegerValue");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v25, "unsignedIntegerValue");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v26, "unsignedIntegerValue");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v27, "unsignedIntegerValue");

  v85 = v23;
  switch(objc_msgSend(v22, "dimensionCount"))
  {
    case 1:
      goto LABEL_21;
    case 2:
      v99 = a5;
      goto LABEL_21;
    case 3:
      v88 = a5;
      goto LABEL_21;
    case 4:
      v87 = a5;
LABEL_21:
      v105 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", objc_msgSend(v22, "dataType"));
      v45 = objc_msgSend(v22, "dataType");
      if (v20 == 3 && (v45 & 0xFFFFFFFD) == 1)
      {
        v84 = v22;
        v46 = 3;
        goto LABEL_28;
      }
      if (v45 <= 9 && ((1 << v45) & 0x250) != 0 && (v20 | 2) == 6)
      {
        v84 = v22;
        v46 = 9;
LABEL_28:
        v100 = v46;
        if ((v45 | 2) == 6)
          v47 = 9;
        else
          v47 = v45;
LABEL_34:
        objc_msgSend(v9, "deviceMemory");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndexedSubscript:", a3);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "ioSurfaceObject");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (__IOSurface *)objc_msgSend(v50, "ioSurface");

        if (v51)
        {
          IOSurfaceLock(v51, 0, 0);
          BaseAddress = (char *)IOSurfaceGetBaseAddress(v51);
          v53 = v108;
          if (v108)
          {
            v54 = BaseAddress;
            v98 = v107 / v21;
            if (v108 == 1)
            {
              v55 = v109;
              v56 = v87 * v109 * v88 * v99;
              v57 = v105 * v56;
              if (v100 == v47)
              {
                if (v98 == v109)
                {
                  memcpy(__dst, BaseAddress, v105 * v56);
                }
                else if (v57)
                {
                  v77 = 0;
                  v78 = v105 * v109;
                  do
                  {
                    memcpy(&__dst[v77], v54, v78);
                    v77 += v78;
                    v54 += v107;
                  }
                  while (v77 < v57);
                }
              }
              else if (v98 == v109)
              {
                +[MLCDataHelper convertFp16toFp32:fp16Values:fp32Values:](MLCDataHelper, "convertFp16toFp32:fp16Values:fp32Values:");
              }
              else if (v57)
              {
                v79 = 0;
                do
                {
                  +[MLCDataHelper convertFp16toFp32:fp16Values:fp32Values:](MLCDataHelper, "convertFp16toFp32:fp16Values:fp32Values:", v55, v54, &__dst[v79]);
                  v55 = v109;
                  v79 += v105 * v109;
                  v54 += v107;
                }
                while (v79 < v57);
              }
              IOSurfaceUnlock(v51, 0, 0);
              v42 = 1;
            }
            else
            {
              buffer = v51;
              v81 = v19;
              v82 = v10;
              v83 = v9;
              v97 = v102 / v21;
              v60 = v109;
              if (v100 == v47)
              {
                if (v87)
                {
                  v86 = 0;
                  v61 = v88 / v108;
                  if (v88 / v108 <= 1)
                    v61 = 1;
                  v91 = v61;
                  do
                  {
                    if (v53 <= v88)
                    {
                      v95 = 0;
                      v93 = __dst;
                      do
                      {
                        if (v99)
                        {
                          v103 = 0;
                          v101 = v93;
                          do
                          {
                            if (v60)
                            {
                              v62 = 0;
                              v63 = v101;
                              v64 = (v86 * v88 / v53 + v95) * v97;
                              do
                              {
                                v65 = 0;
                                v66 = v103 * v98 + v62 * v53;
                                v67 = v63;
                                v68 = v53;
                                do
                                {
                                  memcpy(v67, &v54[(v66 + v65++ + v64) * v21], v21);
                                  v67 += v105 * v109 * v99;
                                  --v68;
                                }
                                while (v68);
                                ++v62;
                                v63 += v105;
                                v53 = v108;
                                v60 = v109;
                              }
                              while (v62 != v109);
                            }
                            v101 += v105 * v109;
                            ++v103;
                          }
                          while (v103 != v99);
                        }
                        v93 += v105 * v109 * v99 * v108;
                        ++v95;
                      }
                      while (v95 != v91);
                    }
                    __dst += v105 * v109 * v99 * v88;
                    ++v86;
                  }
                  while (v86 != v87);
                }
              }
              else if (v87)
              {
                v69 = v88 / v108;
                if (v88 / v108 <= 1)
                  v69 = 1;
                v90 = 0;
                v92 = v69;
                do
                {
                  if (v53 <= v88)
                  {
                    v96 = 0;
                    v94 = __dst;
                    do
                    {
                      if (v99)
                      {
                        v106 = 0;
                        v104 = v94;
                        do
                        {
                          if (v60)
                          {
                            v70 = 0;
                            v71 = v104;
                            v72 = (v90 * v88 / v53 + v96) * v97;
                            do
                            {
                              v73 = 0;
                              v74 = v106 * v98 + v70 * v53;
                              v75 = v71;
                              v76 = v53;
                              do
                              {
                                +[MLCDataHelper convertFp16toFp32:fp16Values:fp32Values:](MLCDataHelper, "convertFp16toFp32:fp16Values:fp32Values:", 1, &v54[2 * v74 + 2 * v73++ + 2 * v72], v75, buffer);
                                v75 += 4 * v109 * v99;
                                --v76;
                              }
                              while (v76);
                              ++v70;
                              v71 += 4;
                              v53 = v108;
                              v60 = v109;
                            }
                            while (v70 != v109);
                          }
                          v104 += 4 * v109;
                          ++v106;
                        }
                        while (v106 != v99);
                      }
                      v94 += 4 * v109 * v99 * v108;
                      ++v96;
                    }
                    while (v96 != v92);
                  }
                  __dst += 4 * v109 * v99 * v88;
                  ++v90;
                }
                while (v90 != v87);
              }
              IOSurfaceUnlock(buffer, 0, 0);
              v42 = 1;
              v10 = v82;
              v9 = v83;
              v19 = v81;
            }
            goto LABEL_95;
          }
          +[MLCLog framework](MLCLog, "framework");
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            ANE_ReadOutputTensor_cold_5();

          IOSurfaceUnlock(v51, 0, 0);
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            ANE_ReadOutputTensor_cold_4();

        }
        v42 = 0;
LABEL_95:
        v22 = v84;
        goto LABEL_96;
      }
      if (v20 == 8 && v45 == 8)
      {
        v84 = v22;
        v100 = 8;
        v47 = 8;
        goto LABEL_34;
      }
      +[MLCLog framework](MLCLog, "framework");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        ANE_ReadOutputTensor_cold_6();
LABEL_67:

      v42 = 0;
LABEL_96:

      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        ANE_ReadOutputTensor_cold_3(v22, v44);
      goto LABEL_67;
  }
LABEL_16:

  return v42;
}

id ANE_GetDeviceMemoryData(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "deviceMemory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "deviceIndex");

  objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t ANE_CanProgramANECConstantTensorUnit(void *a1)
{
  id v1;
  unsigned int v2;
  uint64_t v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "computeFlags");
  v4 = 1;
  ANE_GetTensorBatchSizeWithOnePrepended(v1, &v4);

  return (v4 == 1) & (v2 >> 1);
}

BOOL ANE_IsPaddingLayerAndNotCompiledForANE(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  objc_opt_class();
  v2 = (objc_opt_isKindOfClass() & 1) != 0 && !ANE_IsAneCompiledLayer(v1);

  return v2;
}

BOOL ANE_IsAneCompiledLayer(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  objc_msgSend(v1, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v1, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "type") == 3;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void ANE_ApplyPaddingSizes(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  v3 = a1;
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Params"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_msgSend(v3, "paddingTop");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PadTop"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue") + v6;

  v9 = objc_msgSend(v3, "paddingBottom");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PadBot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue") + v9;

  v12 = objc_msgSend(v3, "paddingLeft");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PadLeft"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue") + v12;

  v15 = objc_msgSend(v3, "paddingRight");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PadRight"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue") + v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("PadTop"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("PadBot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("PadLeft"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("PadRight"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PaddingMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("Negative")))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Zero"), CFSTR("PaddingMode"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v5, CFSTR("Params"));

}

id ANE_ComputeLiveOutputs(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = v1;
  v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v3);
        v23 = v4;
        v5 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v4);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v5, "resultTensors");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v31;
          v24 = v6;
          v25 = v5;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v31 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
              objc_msgSend(v11, "childLayers");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v12, "count") || (objc_msgSend(v5, "isDebuggingEnabled") & 1) != 0)
              {
LABEL_24:

LABEL_25:
                objc_msgSend(v2, "addObject:", v11);
                goto LABEL_26;
              }
              v13 = objc_msgSend(v11, "computeFlags");

              if ((v13 & 1) != 0)
                goto LABEL_25;
              v28 = 0u;
              v29 = 0u;
              v26 = 0u;
              v27 = 0u;
              objc_msgSend(v11, "childLayers");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v27;
                while (2)
                {
                  for (i = 0; i != v15; ++i)
                  {
                    if (*(_QWORD *)v27 != v16)
                      objc_enumerationMutation(v12);
                    if (!objc_msgSend(v3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i)))
                    {
                      v6 = v24;
                      v5 = v25;
                      goto LABEL_24;
                    }
                  }
                  v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
                  if (v15)
                    continue;
                  break;
                }

                v6 = v24;
                v5 = v25;
              }
              else
              {

              }
LABEL_26:
              ++v10;
            }
            while (v10 != v8);
            v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            v8 = v18;
          }
          while (v18);
        }

        v4 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v22);
  }

  v19 = (void *)objc_msgSend(v2, "copy");
  return v19;
}

id ANE_ComputeLiveInputs(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = v1;
  v26 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v4 = *(_QWORD *)v33;
    v25 = *(_QWORD *)v33;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v4)
          objc_enumerationMutation(v3);
        v27 = v5;
        v6 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v5);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v6, "sourceTensors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v12, "parentLayers");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "count");

              if (v14 >= 2)
              {
                +[MLCLog framework](MLCLog, "framework");
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  ANE_ComputeLiveInputs_cold_1(v12, v23);

                objc_msgSend(MEMORY[0x1E0C99E60], "set");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_24;
              }
              objc_msgSend(v12, "parentLayers");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "count");

              if (v16)
              {
                objc_msgSend(v12, "parentLayers");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v3, "containsObject:", v18);

                if ((v19 & 1) != 0)
                  continue;
              }
              v20 = v12;
              if (v20)
              {
                v21 = v20;
                objc_msgSend(v2, "addObject:", v20);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v9)
              continue;
            break;
          }
        }

        v5 = v27 + 1;
        v4 = v25;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }

  v22 = (void *)objc_msgSend(v2, "copy");
LABEL_24:

  return v22;
}

uint64_t ANE_WriteANEModelFiles(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  unsigned __int8 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  LODWORD(a2) = arc4random();
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[MLCStrings tempDirectoryForANEModels](MLCStrings, "tempDirectoryForANEModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@-%lu/"), v6, CFSTR("net"), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("net.plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  if ((objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v7, &v37) & 1) != 0)
  {
    if (!v37)
    {
      +[MLCLog framework](MLCLog, "framework");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        ANE_WriteANEModelFiles_cold_1((uint64_t)v7, &v37, v10);
LABEL_20:

      ANE_DeleteANEModelDirectory(v7);
LABEL_24:
      v25 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    v36 = 0;
    v11 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v36);
    v12 = v36;
    v13 = v12;
    if ((v11 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        ANE_WriteANEModelFiles_cold_4();

      goto LABEL_24;
    }

  }
  if ((objc_msgSend(v3, "writeToFile:atomically:", v8, 1) & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ANE_WriteANEModelFiles_cold_3();
    goto LABEL_20;
  }
  v29 = v9;
  v30 = v8;
  v31 = v3;
  objc_msgSend(v4, "allKeys");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allKeys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "stringByAppendingPathComponent:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "writeToFile:atomically:", v22, 1) & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            ANE_WriteANEModelFiles_cold_2();

          ANE_DeleteANEModelDirectory(v7);
          v25 = 0;
          v24 = v14;
          goto LABEL_28;
        }

      }
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (v16)
        continue;
      break;
    }
  }

  +[MLCLog framework](MLCLog, "framework");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = 1;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "ANE_WriteANEModelFiles";
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_1D4999000, v24, OS_LOG_TYPE_INFO, "%s: wrote ANE Model to directory = %@", buf, 0x16u);
  }
LABEL_28:
  v8 = v30;
  v3 = v31;
  v9 = v29;

LABEL_29:
  return v25;
}

void ANE_DeleteANEModelDirectory(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v1))
  {
    v6 = 0;
    v3 = objc_msgSend(v2, "removeItemAtPath:error:", v1, &v6);
    v4 = v6;
    if ((v3 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        ANE_DeleteANEModelDirectory_cold_1();

    }
  }

}

void OUTLINED_FUNCTION_13_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

id CPU_CreateOptimizerDeviceDataForTensor(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a2;
  v5 = a3;
  +[MLCTensorOptimizerDeviceData optimizerDeviceData](MLCTensorOptimizerDeviceData, "optimizerDeviceData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v8, 0, objc_msgSend(v9, "dataType"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceBNNSDesc:", v10);

  objc_msgSend(v4, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v12, 0, objc_msgSend(v13, "dataType"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGradientBNNSDesc:", v14);

  v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v6, "setMomentumData:", v15);

  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v4, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v18, 0, objc_msgSend(v19, "dataType"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "momentumData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:atIndexedSubscript:", v20, i);

  }
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v6, "setMomentumDataBytes:", v22);

  if (objc_msgSend(v5, "count"))
  {
    v23 = 0;
    do
    {
      v24 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v5, "objectAtIndexedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "bytes");
      objc_msgSend(v5, "objectAtIndexedSubscript:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dataWithBytesNoCopy:length:freeWhenDone:", v26, objc_msgSend(v27, "length"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "momentumDataBytes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:atIndexedSubscript:", v28, v23);

      objc_msgSend(v6, "momentumData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_retainAutorelease(v31);
      v33 = objc_msgSend(v32, "bytes");
      objc_msgSend(v5, "objectAtIndexedSubscript:", v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v33 + 136) = objc_msgSend(v34, "bytes");

      ++v23;
    }
    while (v23 < objc_msgSend(v5, "count"));
  }
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v35, "addObject:", v6);
  v36 = (void *)objc_msgSend(v35, "copy");

  return v36;
}

void *saveOrRestoreLSTMWeightsAndAccumulatorsHelper(uint64_t a1, uint64_t a2, void *__src, size_t __n, int a5)
{
  void *v5;
  void *v6;

  v5 = (void *)(a1 + 4 * a2);
  if (a5)
  {
    v6 = __src;
  }
  else
  {
    v6 = v5;
    v5 = __src;
  }
  return memcpy(v6, v5, __n);
}

unint64_t *hashCombine_8(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v12 = &a9;
  v9 = *result;
  v10 = 14;
  do
  {
    v11 = v12;
    v12 += 8;
    v9 ^= *(_QWORD *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *result = v9;
  return result;
}

id CPU_CreateSGDOptimizer(float a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  void *v7;
  _DWORD *v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;

  v6 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v8 = malloc_type_calloc(0x30uLL, 1uLL, 0xA2D08676uLL);
  v8[7] = 0;
  if (objc_msgSend(v6, "appliesGradientClipping"))
  {
    v9 = objc_msgSend(v6, "gradientClippingType");
    if (v9 >= 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
        CPU_CreateSGDOptimizer_cold_2(v6, v21);
      goto LABEL_14;
    }
    v8[7] = v9 + 1;
  }
  objc_msgSend(v6, "gradientClipMin");
  v8[8] = v10;
  objc_msgSend(v6, "gradientClipMax");
  v8[9] = v11;
  objc_msgSend(v6, "maximumClippingNorm");
  v8[10] = v12;
  objc_msgSend(v6, "customGlobalNorm");
  v8[11] = v13;
  *((_BYTE *)v8 + 16) = a3;
  v14 = objc_msgSend(v6, "regularizationType");
  if (v14 >= 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      CPU_CreateSGDOptimizer_cold_1(v6, v21);
LABEL_14:

    v20 = (void *)objc_msgSend(v7, "copy");
    goto LABEL_15;
  }
  v8[5] = v14;
  objc_msgSend(v6, "learningRate");
  *v8 = v15;
  *((float *)v8 + 1) = a1;
  objc_msgSend(v6, "gradientRescale");
  v8[2] = v16;
  objc_msgSend(v6, "regularizationScale");
  v8[3] = v17;
  if (a3)
    v8[6] = 1;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 48);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCDeviceOptimizer deviceOptimizerWithFunction:optimizerAlgFields:accumulatorBufferCount:](MLCDeviceOptimizer, "deviceOptimizerWithFunction:optimizerAlgFields:accumulatorBufferCount:", 7, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v7, "addObject:", v19);
  free(v8);
  v20 = (void *)objc_msgSend(v7, "copy");

LABEL_15:
  return v20;
}

id CPU_CreateAdamOptimizer(float a1, float a2, float a3, uint64_t a4, int a5, unint64_t a6, int a7, void *a8)
{
  id v14;
  void *v15;
  float *v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char *v33;

  v14 = a8;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v16 = (float *)malloc_type_calloc(0x34uLL, 1uLL, 0xD286C853uLL);
  v16[8] = 0.0;
  if (objc_msgSend(v14, "appliesGradientClipping"))
  {
    v17 = objc_msgSend(v14, "gradientClippingType");
    if (v17 >= 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
        CPU_CreateAdamOptimizer_cold_2(v14, v33);
      goto LABEL_24;
    }
    *((_DWORD *)v16 + 8) = v17 + 1;
  }
  objc_msgSend(v14, "gradientClipMin");
  *((_DWORD *)v16 + 9) = v18;
  objc_msgSend(v14, "gradientClipMax");
  *((_DWORD *)v16 + 10) = v19;
  objc_msgSend(v14, "maximumClippingNorm");
  *((_DWORD *)v16 + 11) = v20;
  objc_msgSend(v14, "customGlobalNorm");
  *((_DWORD *)v16 + 12) = v21;
  v22 = objc_msgSend(v14, "regularizationType");
  if (v22 >= 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v33 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      CPU_CreateAdamOptimizer_cold_1(v14, v33);
LABEL_24:

    v32 = (void *)objc_msgSend(v15, "copy");
    goto LABEL_25;
  }
  *((_DWORD *)v16 + 7) = v22;
  objc_msgSend(v14, "learningRate");
  *(_DWORD *)v16 = v23;
  v16[1] = a1;
  v16[2] = a2;
  v16[3] = (float)a6;
  v16[4] = a3;
  objc_msgSend(v14, "gradientRescale");
  *((_DWORD *)v16 + 5) = v24;
  objc_msgSend(v14, "regularizationScale");
  *((_DWORD *)v16 + 6) = v25;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16, 52);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    v27 = 12;
  else
    v27 = 10;
  if (a5)
    v28 = 11;
  else
    v28 = 8;
  if (a5)
    v29 = 3;
  else
    v29 = 2;
  if (a7)
    v30 = v27;
  else
    v30 = v28;
  +[MLCDeviceOptimizer deviceOptimizerWithFunction:optimizerAlgFields:accumulatorBufferCount:](MLCDeviceOptimizer, "deviceOptimizerWithFunction:optimizerAlgFields:accumulatorBufferCount:", v30, v26, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v15, "addObject:", v31);
  free(v16);
  v32 = (void *)objc_msgSend(v15, "copy");

LABEL_25:
  return v32;
}

id CPU_CreateRMSPropOptimizer(float a1, float a2, float a3, uint64_t a4, int a5, void *a6)
{
  id v10;
  void *v11;
  float *v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;

  v10 = a6;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v12 = (float *)malloc_type_calloc(0x34uLL, 1uLL, 0xA5A980CCuLL);
  v12[8] = 0.0;
  if (objc_msgSend(v10, "appliesGradientClipping"))
  {
    v13 = objc_msgSend(v10, "gradientClippingType");
    if (v13 >= 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        CPU_CreateRMSPropOptimizer_cold_2(v10, v27);
      goto LABEL_17;
    }
    *((_DWORD *)v12 + 8) = v13 + 1;
  }
  objc_msgSend(v10, "gradientClipMin");
  *((_DWORD *)v12 + 9) = v14;
  objc_msgSend(v10, "gradientClipMax");
  *((_DWORD *)v12 + 10) = v15;
  objc_msgSend(v10, "maximumClippingNorm");
  *((_DWORD *)v12 + 11) = v16;
  objc_msgSend(v10, "customGlobalNorm");
  *((_DWORD *)v12 + 12) = v17;
  v18 = objc_msgSend(v10, "regularizationType");
  if (v18 >= 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      CPU_CreateRMSPropOptimizer_cold_1(v10, v27);
LABEL_17:

    v26 = (void *)objc_msgSend(v11, "copy");
    goto LABEL_18;
  }
  *((_DWORD *)v12 + 7) = v18;
  objc_msgSend(v10, "learningRate");
  *(_DWORD *)v12 = v19;
  v12[1] = a2;
  v12[2] = a3;
  *((_BYTE *)v12 + 12) = a5;
  v12[4] = a1;
  objc_msgSend(v10, "gradientRescale");
  *((_DWORD *)v12 + 5) = v20;
  objc_msgSend(v10, "regularizationScale");
  *((_DWORD *)v12 + 6) = v21;
  v22 = 1;
  if (a5)
    v22 = 2;
  if (a1 == 0.0)
    v23 = v22;
  else
    v23 = v22 + 1;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, 52);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCDeviceOptimizer deviceOptimizerWithFunction:optimizerAlgFields:accumulatorBufferCount:](MLCDeviceOptimizer, "deviceOptimizerWithFunction:optimizerAlgFields:accumulatorBufferCount:", 9, v24, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v11, "addObject:", v25);
  free(v12);
  v26 = (void *)objc_msgSend(v11, "copy");

LABEL_18:
  return v26;
}

uint64_t OUTLINED_FUNCTION_3_4(void *a1, const char *a2)
{
  return objc_msgSend(a1, "regularizationType");
}

id CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(void *a1, void *a2, int a3, int a4)
{
  int v4;
  void *v5;
  _OWORD v7[11];

  memset(v7, 0, sizeof(v7));
  v4 = CPU_BuildBNNSNDArrayDescriptor((uint64_t)v7, a1, 0, a2, a3, 1, a4);
  v5 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 176);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t CPU_BuildBNNSNormalizationParams(unsigned int a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, float a8, float a9)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  if (v20)
  {
    objc_msgSend(v20, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CPU_BuildBNNSNDArrayDescriptor(a2 + 352, v17, 0, v22, objc_msgSend(v23, "dataType"), 1, a1 == 2);

    if (!v24)
      goto LABEL_11;
  }
  if (v21
    && (objc_msgSend(v21, "data"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v21, "descriptor"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = CPU_BuildBNNSNDArrayDescriptor(a2 + 528, v17, 0, v25, objc_msgSend(v26, "dataType"), 1, a1 == 2),
        v26,
        v25,
        !v27))
  {
LABEL_11:
    v31 = 0;
  }
  else
  {
    if (a1 > 1)
      goto LABEL_10;
    if (!v18)
      goto LABEL_15;
    objc_msgSend(v18, "data");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CPU_BuildBNNSNDArrayDescriptor(a2 + 704, v17, 0, v28, objc_msgSend(v29, "dataType"), 1, 0);

    v31 = 0;
    if (v30)
    {
LABEL_15:
      if (!v19)
        goto LABEL_10;
      objc_msgSend(v19, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "descriptor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CPU_BuildBNNSNDArrayDescriptor(a2 + 880, v17, 0, v32, objc_msgSend(v33, "dataType"), 1, 0);

      v31 = 0;
      if (v34)
      {
LABEL_10:
        *(float *)(a2 + 1056) = a9;
        *(float *)(a2 + 1060) = a8;
        v31 = 1;
      }
    }
  }

  return v31;
}

uint64_t CPU_BuildBNNSNormalizationInputOutputParams(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = objc_msgSend(v12, "count");
  if (a4 == 2)
  {
    if (v17 != 4)
    {
      v18 = 0;
      do
      {
        objc_msgSend(v12, "insertObject:atIndex:", &unk_1E9844668, 1);
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "insertObject:atIndex:", v19, 1);

        ++v18;
      }
      while (v18 < 4 - objc_msgSend(v12, "count"));
    }
  }
  else if (v17 == 2)
  {
    objc_msgSend(v12, "insertObject:atIndex:", &unk_1E9844668, 2);
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertObject:atIndex:", v20, 2);

  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CPU_BuildBNNSNDArrayDescriptor(a1, v12, v16, 0, objc_msgSend(v22, "dataType"), 1, 0);

  if (v23)
  {
    objc_msgSend(v8, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v8, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stride");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    v30 = objc_msgSend(v26, "count");
    if (a4 == 2)
    {
      if (v30 != 4)
      {
        v31 = 0;
        do
        {
          objc_msgSend(v26, "insertObject:atIndex:", &unk_1E9844668, 1);
          objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "insertObject:atIndex:", v32, 1);

          ++v31;
        }
        while (v31 < 4 - objc_msgSend(v26, "count"));
      }
    }
    else if (v30 == 2)
    {
      objc_msgSend(v26, "insertObject:atIndex:", &unk_1E9844668, 2);
      objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "insertObject:atIndex:", v34, 2);

    }
    objc_msgSend(v8, "descriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CPU_BuildBNNSNDArrayDescriptor(a1 + 176, v26, v29, 0, objc_msgSend(v35, "dataType"), 1, 0);

  }
  else
  {
    v33 = 0;
    v26 = v12;
    v29 = v16;
  }

  return v33;
}

id CPU_CreateNormalizationLayer(unsigned int a1, float a2, float a3, uint64_t a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9, void *a10, void *a11)
{
  id v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  size_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v56;
  unsigned int v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  _OWORD v69[11];
  _OWORD v70[11];
  _BYTE v71[1064];
  _QWORD v72[8];
  void *v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v19 = a5;
  v20 = a6;
  v65 = a8;
  v67 = a9;
  v68 = a10;
  v21 = a11;
  v66 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  bzero(v71, 0x468uLL);
  v22 = (void *)objc_msgSend(v20, "mutableCopy");
  if (a1 == 2 && objc_msgSend(v20, "count") != 3)
  {
    v23 = 0;
    do
    {
      objc_msgSend(v22, "insertObject:atIndex:", &unk_1E9844668, 0);
      ++v23;
    }
    while (v23 < 3 - objc_msgSend(v20, "count"));
  }
  v24 = v65;
  v25 = v67;
  v26 = v68;
  if (CPU_BuildBNNSNormalizationParams(a1, (uint64_t)v71, v22, v65, v67, v68, v21, a2, a3))
  {
    v27 = 2;
    switch(a1)
    {
      case 0u:
        goto LABEL_12;
      case 1u:
        v27 = 20;
        if (!v19)
          goto LABEL_18;
        goto LABEL_13;
      case 2u:
        v72[7] = 3 - objc_msgSend(v20, "count");
        v27 = 28;
LABEL_12:
        if (v19)
          goto LABEL_13;
        goto LABEL_18;
      case 3u:
        v72[6] = a7;
        v27 = 33;
        if (!v19)
          goto LABEL_18;
LABEL_13:
        if (!setBNNSActivation((uint64_t)v72, v19))
          goto LABEL_16;
        if (a1 >= 4)
        {
          +[MLCLog framework](MLCLog, "framework");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
LABEL_40:
            CPU_CreateNormalizationLayer_cold_1();
LABEL_41:
          v29 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v27 = dword_1D4AB8F70[a1];
LABEL_18:
          v57 = v27;
          v58 = v19;
          v30 = 0x1E0C99000uLL;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v71, 1128);
          v63 = objc_claimAutoreleasedReturnValue();
          memset(v70, 0, sizeof(v70));
          memset(v69, 0, sizeof(v69));
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v70, 176);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v69, 176);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            v31 = 0;
            v32 = 1;
            do
            {
              objc_msgSend(v22, "objectAtIndexedSubscript:", v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v32 *= objc_msgSend(v33, "unsignedIntegerValue");

              ++v31;
            }
            while (v31 < objc_msgSend(v22, "count"));
          }
          else
          {
            v32 = 1;
          }
          v34 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          v35 = 4 * v32;
          if (v68)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v32, 4uLL, 0x100004052888210uLL), 4 * v32, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "descriptor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v36;
            CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, v36, objc_msgSend(v37, "dataType"), a1 == 2);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            for (i = 0; i != 3; ++i)
            {
              objc_msgSend(v26, "descriptor");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, 0, objc_msgSend(v39, "dataType"), a1 == 2);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:atIndexedSubscript:", v40, i);

              v26 = v68;
            }
            v30 = 0x1E0C99000;
            v35 = 4 * v32;
          }
          else
          {
            v64 = 0;
            v60 = 0;
          }
          v41 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          if (v21)
          {
            objc_msgSend(*(id *)(v30 + 3408), "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v32, 4uLL, 0x100004052888210uLL), v35, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "descriptor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v42;
            CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, v42, objc_msgSend(v43, "dataType"), a1 == 2);
            v56 = objc_claimAutoreleasedReturnValue();

            for (j = 0; j != 3; ++j)
            {
              objc_msgSend(v21, "descriptor");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, 0, objc_msgSend(v45, "dataType"), a1 == 2);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setObject:atIndexedSubscript:", v46, j);

            }
            v47 = (void *)v56;
          }
          else
          {
            v47 = 0;
            v59 = 0;
          }
          v74[0] = v62;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v61;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:betaDeltaData:gammaDeltaData:betaMomentumData:gammaMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:betaDeltaData:gammaDeltaData:betaMomentumData:gammaMomentumData:", v57, v63, v48, v49, v64, v47, v34, v41);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v65;
          v25 = v67;
          if (v50)
          {
            objc_msgSend(v66, "addObject:", v50);
            objc_msgSend(v50, "setBetaDeltaData:", v64);
            objc_msgSend(v50, "setGammaDeltaData:", v47);
            objc_msgSend(v50, "setBetaDeltaDataBytes:", v60);
            objc_msgSend(v50, "setGammaDeltaDataBytes:", v59);
            v51 = (void *)MEMORY[0x1E0C9AA60];
            v52 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
            objc_msgSend(v50, "setBetaMomentumDataBytes:", v52);

            v53 = (void *)objc_msgSend(v51, "mutableCopy");
            objc_msgSend(v50, "setGammaMomentumDataBytes:", v53);

            if (v65)
              objc_msgSend(v50, "setMovingMean:", v65);
            v25 = v67;
            if (v67)
              objc_msgSend(v50, "setMovingVariance:", v67);
          }
          v54 = v47;
          v29 = (void *)objc_msgSend(v66, "copy");

          v19 = v58;
          v26 = v68;
          v28 = v63;
        }

        break;
      default:
        +[MLCLog framework](MLCLog, "framework");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        goto LABEL_41;
    }
  }
  else
  {
LABEL_16:
    v29 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v29;
}

void *CPU_CompileNormalizationLayer(unsigned int a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  const BNNSLayerParametersNormalization *v11;
  void *v12;
  void *v13;
  BNNSFilterParameters v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "params");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const BNNSLayerParametersNormalization *)objc_msgSend(v10, "bytes");
  v12 = 0;
  if (CPU_BuildBNNSNormalizationInputOutputParams((uint64_t)v11, v7, v8, a1))
  {
    memset(&v15, 0, sizeof(v15));
    v15.flags = 1;
    if (a1 > 3)
    {
      v12 = 0;
    }
    else
    {
      v12 = BNNSFilterCreateLayerNormalization((BNNSFilterType)(a1 + 2), v11, &v15);
      if (v12)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0, *(_OWORD *)&v15.flags, *(_OWORD *)&v15.alloc_memory);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSourceStride:", CPU_SetBatchStride(v13));

        objc_msgSend(v9, "setResultStride:", CPU_SetBatchStride(v8));
      }
    }
  }

  return v12;
}

uint64_t CPU_SetOptimizerDataForNormalizationLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "optimizerData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        v10 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "bytes");
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataWithBytesNoCopy:length:freeWhenDone:", v12, objc_msgSend(v13, "length"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "betaMomentumDataBytes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, v9);

        objc_msgSend(v7, "betaMomentumData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_retainAutorelease(v17);
        v19 = objc_msgSend(v18, "bytes");
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(v19 + 136) = objc_msgSend(v20, "bytes");

        ++v9;
      }
      while (v9 < objc_msgSend(v8, "count"));
    }

  }
  if (v6)
  {
    objc_msgSend(v6, "optimizerData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v22 = 0;
      do
      {
        v23 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "bytes");
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dataWithBytesNoCopy:length:freeWhenDone:", v25, objc_msgSend(v26, "length"), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "gammaMomentumDataBytes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:atIndexedSubscript:", v27, v22);

        objc_msgSend(v7, "gammaMomentumData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_retainAutorelease(v30);
        v32 = objc_msgSend(v31, "bytes");
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(v32 + 136) = objc_msgSend(v33, "bytes");

        ++v22;
      }
      while (v22 < objc_msgSend(v21, "count"));
    }

  }
  return 1;
}

id ANE_BuildTransposeParams(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v22;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "count");
  if (v4 == 4)
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:atIndexedSubscript:", v12, 0);

    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:atIndexedSubscript:", v13, 1);

    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:atIndexedSubscript:", v14, 2);

    objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:atIndexedSubscript:", v15, 3);
  }
  else
  {
    v5 = 4 - v2;
    if (v4 == 3)
    {
      objc_msgSend(v3, "setObject:atIndexedSubscript:", &unk_1E9844680, 0);
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") + v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:atIndexedSubscript:", v18, 1);

      v19 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:atIndexedSubscript:", v21, 2);

      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = v1;
      v11 = 2;
    }
    else
    {
      if (v4 != 2)
      {
        +[MLCLog framework](MLCLog, "framework");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          ANE_BuildTransposeParams_cold_1(v1, v23);
        v33 = 0;
        goto LABEL_23;
      }
      objc_msgSend(v3, "setObject:atIndexedSubscript:", &unk_1E9844680, 0);
      objc_msgSend(v3, "setObject:atIndexedSubscript:", &unk_1E9844698, 1);
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:atIndexedSubscript:", v8, 2);

      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = v1;
      v11 = 1;
    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:atIndexedSubscript:", v22, 3);

  }
  v23 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (!objc_msgSend(v3, "count"))
  {
LABEL_15:
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("Transpose"), kMLCANENetUnitType[0]);
    v32 = -[NSObject copy](v23, "copy");
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, CFSTR("TransposeDimensions"));

    v33 = (void *)objc_msgSend(v28, "copy");
    goto LABEL_22;
  }
  v24 = 0;
  while (1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    if (v24 != v26)
      break;
LABEL_14:
    if (++v24 >= objc_msgSend(v3, "count"))
      goto LABEL_15;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_GetANECIRDimension(objc_msgSend(v27, "unsignedIntegerValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  ANE_GetANECIRDimension(v24);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v28 && v29)
  {
    v36[0] = CFSTR("TransposeSourceDimension");
    v36[1] = CFSTR("TransposeDestinationDimension");
    v37[0] = v28;
    v37[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v23, "addObject:", v31);

    goto LABEL_14;
  }
  +[MLCLog framework](MLCLog, "framework");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    ANE_BuildTransposeParams_cold_2(v34);

  v33 = 0;
LABEL_22:

LABEL_23:
  return v33;
}

id ANE_CreateTransposeLayer(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v1 = a1;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  ANE_BuildTransposeParams(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[_MLCANETransposeParameters transposeUnitParametersWith:](_MLCANETransposeParameters, "transposeUnitParametersWith:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 28, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v2, "addObject:", v5);
    v6 = v2;

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ANE_CreateTransposeLayer_cold_1();

    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

id ANE_CompileTransposeLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a1;
  objc_msgSend(a3, "parentLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "params");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transposeParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = ANE_ValidateTransposeUnit(v5, v12, 1);

  if ((v13 & 1) != 0)
  {
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      ANE_CompileTransposeLayer_cold_1();

    v14 = 0;
  }

  return v14;
}

void sub_1D4A87F04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 120), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

unint64_t *hashCombine_9(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  char v10;
  char v11;
  char *v12;
  char *v13;

  v13 = &a9;
  v9 = *result;
  v10 = 1;
  do
  {
    v11 = v10;
    v12 = v13;
    v13 += 8;
    v9 ^= *(_QWORD *)v12 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    v10 = 0;
  }
  while ((v11 & 1) != 0);
  *result = v9;
  return result;
}

id ANE_CreateFullyConnectedLayer()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[MLCANEDeviceOps deviceOpsWithType:params:](MLCANEDeviceOps, "deviceOpsWithType:params:", 7, MEMORY[0x1E0C9AA70]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_msgSend(v0, "addObject:", v1);

  return v0;
}

id ANE_CompileFullyConnectedLayer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  size_t v46;
  _DWORD *v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _WORD *v60;
  _DWORD *v61;
  _BYTE *v62;
  uint64_t v63;
  _WORD *v64;
  _DWORD *v65;
  _BYTE *v66;
  _BYTE *v67;
  _DWORD *v68;
  _WORD *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  NSObject *v101;
  NSObject *v102;
  int v103;
  NSObject *v104;
  id v105;
  id v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  __int16 v120;
  _QWORD v121[2];
  _QWORD v122[5];

  v122[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v6, "parentLayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v11;
  if (objc_msgSend(v12, "dimensionCount") == 4)
  {
    objc_msgSend(v11, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "unsignedIntegerValue") == 1)
    {
      objc_msgSend(v11, "descriptor");
      v112 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shape");
      v110 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v7;
      v19 = objc_msgSend(v18, "unsignedIntegerValue");

      v10 = v110;
      v8 = v112;

      v20 = v19 == 1;
      v7 = v108;
      if (!v20)
        goto LABEL_12;
      v21 = v110;
      objc_msgSend(v21, "descriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "weights");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "biases");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      if ((ANE_BuildConvolutionParams(v25, v22, v23) & 1) != 0)
      {
        if (v24)
        {
          +[_MLCANEPlistBuilder buildBiasParamsWithBiases:](_MLCANEPlistBuilder, "buildBiasParamsWithBiases:", v24);
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            +[MLCLog framework](MLCLog, "framework");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              ANE_CompileFullyConnectedLayer_cold_3(v26, v27, v28, v29, v30, v31, v32, v33);
LABEL_67:
            v53 = 0;
LABEL_75:

            v10 = v110;
            v8 = v112;
            if (v53)
              goto LABEL_59;
            +[MLCLog framework](MLCLog, "framework");
            v102 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              ANE_CompileFullyConnectedLayer_cold_1();

LABEL_63:
            v89 = 0;
            goto LABEL_64;
          }
        }
        else
        {
          v26 = 0;
        }
        ANE_CreateUnitsWithConvolutionLayer(v21, v25, v26);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v99;
        if (v99)
        {
          v100 = v99;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
            ANE_CompileFullyConnectedLayer_cold_2();

          v7 = v108;
        }

        goto LABEL_75;
      }
      +[MLCLog framework](MLCLog, "framework");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        ANE_CompileFullyConnectedLayer_cold_4(v26, v92, v93, v94, v95, v96, v97, v98);
      goto LABEL_67;
    }

  }
LABEL_12:
  v34 = v10;
  v117 = v7;
  v114 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v35 = v34;
  objc_msgSend(v35, "descriptor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sourceTensors");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "weights");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "descriptor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "dataType");

  objc_msgSend(v35, "biases");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    objc_msgSend(v39, "descriptor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "dataType");

    if (v42 != (_DWORD)v38)
    {
      +[MLCLog framework](MLCLog, "framework");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        ANE_CompileFullyConnectedLayer_cold_8(v40, v38, v52);
      v53 = 0;
      goto LABEL_58;
    }
  }
  v111 = v10;
  v113 = v8;
  v109 = v7;
  v105 = v6;
  v106 = v5;
  v43 = objc_msgSend(v118, "inputFeatureChannelCount");
  v44 = objc_msgSend(v118, "outputFeatureChannelCount");
  if (v40)
    v45 = v43 + 1;
  else
    v45 = v43;
  v46 = v45
      * v44
      * +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v38);
  v47 = malloc_type_malloc(v46, 0xF9FDDE1EuLL);
  +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v47, v46, 1);
  v107 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "data");
  v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v49 = objc_msgSend(v48, "bytes");

  if (!v40)
  {
    v51 = 0;
    if (!v45)
      goto LABEL_47;
LABEL_24:
    v54 = 0;
    v55 = 0;
    if (v44 <= 1)
      v56 = 1;
    else
      v56 = v44;
    v57 = v49;
    v58 = v49;
    while (1)
    {
      if (v44)
      {
        if ((v38 - 1) > 8 || ((0x1A5u >> (v38 - 1)) & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            v103 = v38;
            v87 = v88;
            ANE_CompileFullyConnectedLayer_cold_7(v103, v88);
            v53 = 0;
            v6 = v105;
            v5 = v106;
            v7 = v109;
            v10 = v111;
            v8 = v113;
            v52 = v107;
          }
          else
          {
            v53 = 0;
            v6 = v105;
            v7 = v109;
            v10 = v111;
            v8 = v113;
            v52 = v107;
            v87 = v88;
            v5 = v106;
          }
          goto LABEL_57;
        }
        v59 = v54;
        v60 = (_WORD *)v49;
        v61 = (_DWORD *)v57;
        v62 = (_BYTE *)v58;
        v63 = v56;
        v64 = (_WORD *)v51;
        v65 = (_DWORD *)v51;
        v66 = (_BYTE *)v51;
        do
        {
          switch((int)v38)
          {
            case 1:
              if (v55 == v43)
                v68 = v65;
              else
                v68 = v61;
              v47[v59] = *v68;
              break;
            case 3:
              if (v55 == v43)
                v69 = v64;
              else
                v69 = v60;
              *((_WORD *)v47 + v59) = *v69;
              break;
            default:
              if (v55 == v43)
                v67 = v66;
              else
                v67 = v62;
              *((_BYTE *)v47 + v59) = *v67;
              break;
          }
          ++v66;
          ++v65;
          ++v64;
          v62 += v43;
          v61 += v43;
          v60 += v43;
          ++v59;
          --v63;
        }
        while (v63);
      }
      ++v55;
      ++v58;
      v57 += 4;
      v49 += 2;
      v54 += v44;
      if (v55 == v45)
        goto LABEL_47;
    }
  }
  objc_msgSend(v40, "data");
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51 = objc_msgSend(v50, "bytes");

  if (v45)
    goto LABEL_24;
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v70;
  v122[1] = &unk_1E98446E0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v122[2] = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 3);
  v72 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v119, "label");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v72;
  +[_MLCANEPlistBuilder constantTensorWithShape:data:dataType:tensorLabel:](_MLCANEPlistBuilder, "constantTensorWithShape:data:dataType:tensorLabel:", v72, v107, v38, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v117, "constantTensors");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v74);

  v76 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v76, "setObject:forKeyedSubscript:", CFSTR("MatrixMultiplication"), kMLCANENetUnitType[0]);
  if (v40)
  {
    LODWORD(v121[0]) = 1065353216;
    v120 = 0;
    ANE_ConvertFp32ToInt16((uint64_t)v121, &v120);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v120);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKeyedSubscript:", v77, CFSTR("Bias"));

  }
  +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v35, v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("Bottom"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "label");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObject:", v80);

  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("InputType"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "descriptor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v82, "dataType"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v81, "addObject:", v83);
  v121[0] = v116;
  v121[1] = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = ANE_ValidateMatrixMultUnit(v84, v78, 1);

  if ((v85 & 1) != 0)
  {
    objc_msgSend(v114, "addObject:", v78);
    v53 = (void *)objc_msgSend(v114, "copy");
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      ANE_CompileFullyConnectedLayer_cold_6();

    v53 = 0;
  }
  v7 = v109;

  v6 = v105;
  v5 = v106;
  v10 = v111;
  v8 = v113;
  v52 = v107;
  v87 = v104;
LABEL_57:

LABEL_58:
  if (!v53)
  {
    +[MLCLog framework](MLCLog, "framework");
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      ANE_CompileFullyConnectedLayer_cold_5();

    goto LABEL_63;
  }
LABEL_59:
  objc_msgSend(v8, "addObjectsFromArray:", v53);

  v89 = (void *)objc_msgSend(v8, "copy");
LABEL_64:

  return v89;
}

void ANE_BuildNeuronParams_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_11(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, a2, v3, "%s: unsupported activation type=%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_BuildNeuronParams_cold_2(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v1, v2, "%s: failed to convert FP32 value=%f to int16", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildNeuronParams_cold_3(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_11(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, a2, v3, "%s: failed to build the parameters for activation type=%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_BuildNeuronParams_cold_8(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v1, v2, "%s: failed to convert float value=%f to int16", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildNeuronParams_cold_11(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "ANE_BuildNeuronParams";
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: ReLUN with a < 0 or b <= 0 is not supported on AppleNeuralEngine pre-H13 architecture", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildLinearParams_cold_1(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v1, v2, "%s: failed to convert FP32 value=%f to int16", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildLinearParams_cold_3(void *a1, NSObject *a2)
{
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "a");
  v3[0] = 136315394;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D4999000, a2, OS_LOG_TYPE_DEBUG, "%s: descriptor value a=%.10f is too small(< 1e-4f)", (uint8_t *)v3, 0x16u);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateUnitsWithNeuronLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s unsupported activation type=%d", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithNeuronLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the ANEC IR units of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithNeuronLayer_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateUnitsWithNeuronLayer_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  v3 = 5;
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: number of neuron parameter dictionaries should be either 1 or 3 for activation type=%d", v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithNeuronLayer_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  v3 = 16;
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: number of neuron parameter dictionaries should be 2 for activation type=%d", v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithNeuronLayer_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  v3 = 19;
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: number of neuron parameter dictionaries should be 4 for activation type=%d", v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsOfLinear_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateUnitsOfLinear_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: neuron unit=%@ failed validation", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsOfLinear_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  v3 = 2;
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: number of neuron parameter dictionaries should be either 1 or 3 for activation type=%d", v2);
  OUTLINED_FUNCTION_5();
}

void GPU_CreateLossLayer_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "reductionType");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v1, v2, "%s: Unknown reduction type %d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_0();
}

void GPU_CreateLossLayer_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "lossType");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v1, v2, "%s: Unknown loss type %d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CPU_BNNSDataTypeSizeInBytes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "CPU_BNNSDataTypeSizeInBytes";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a1, a3, "%s: Unsupported data type", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void CPU_BNNSDataType_cold_1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "CPU_BNNSDataType";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%s: Unsupported sources data type (%d)", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

void CPU_BuildBNNSNDArrayLastMajorDescriptor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "CPU_BuildBNNSNDArrayLastMajorDescriptor";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void CPU_BuildBNNSNDArrayDescriptor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "CPU_BuildBNNSNDArrayDescriptor";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void CPU_BuildPermuteBNNSNDArrayDescriptor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "CPU_BuildPermuteBNNSNDArrayDescriptor";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void CPU_BuildBNNSNDArrayDescriptorRowMajor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "CPU_BuildBNNSNDArrayDescriptorRowMajor";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void CPU_BuildBNNSNDArrayDescriptorColMajor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "CPU_BuildBNNSNDArrayDescriptorColMajor";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void convertDataLayout_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v5, "%@: tensor layout conversion without allocation", v6);

  OUTLINED_FUNCTION_1_0();
}

void convertDataLayout_cold_2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v5, "%@: tensorDesc not matching data in layout conversion", v6);

  OUTLINED_FUNCTION_1_0();
}

void convertDataLayout_cold_3(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v5, "%@: unsupported format for converting", v6);

  OUTLINED_FUNCTION_1_0();
}

void convertDataLayout_cold_4(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v5, "%@: tensor layout conversion with mismatching source and result tensor", v6);

  OUTLINED_FUNCTION_1_0();
}

void convertNCHWtoTNC_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v6, "%@: height should be 1 for LSTM input tensor of shape NCHW", v7);

}

void ANE_CreateUpsampleLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: scaleFactorY=%f is not a power-of-2 value and not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUpsampleLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: scaleFactorX=%f is not a power-of-2 value and not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUpsampleLayer_cold_3(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "ANE_CreateUpsampleLayer";
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: only nearest sample mode is supported", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileUpsampleLayer_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4999000, a2, a3, "%s: unsupported source tensor shape count=%lu", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileUpsampleLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the upsample units of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileUpsampleLayer_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create two reshape units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileUpsampleLayer_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create upsample units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUpsampleUnits_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "ANE_CreateUpsampleUnits";
  v5 = 1024;
  v6 = a2;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: unsupported data type=%d for tensor=%@", (uint8_t *)&v3, 0x1Cu);
}

void ANE_CreateUpsampleUnits_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the upsample unit that performs 1x1 upsampling of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUpsampleUnits_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the upsample units each that performs 1x2 upsampling of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUpsampleUnits_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the upsample units each that performs 2x1 upsampling of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUpsampleUnits_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the upsample units each that performs 2x2 upsampling of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUpsampleUnitsWithParams_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_10();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1D4999000, v2, OS_LOG_TYPE_ERROR, "%s: the unit=%@ of layer=%@ failed validation", (uint8_t *)v3, 0x20u);
}

void ANE_CreateSliceLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  v4[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v3, "%s: the number of dimensions=%lu is unsupported", (uint8_t *)v4);
}

void ANE_CreateSliceLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to get ANEC IR dimension", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateSliceLayer_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: only stride of 1 is supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileSliceLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, v0, v1, "%s: unsupported dimension=%lu", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileSliceLayer_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "ANE_CompileSliceLayer";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: unit=%@ of layer=%@ failed validation", (uint8_t *)&v3, 0x20u);
}

void ANE_CreateComparisonLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported comparison operation=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileComparisonLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported comparison operation=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileComparisonLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to connect the broadcast units", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileComparisonLayer_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: the number of parameters should be 1 for comparison operation=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileComparisonLayer_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileComparisonLayer_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, a1, a3, "%s: the number of parameters should be 1 for comparison operation=%d", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileComparisonLayer_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: the number of parameters should be 2 for comparison operation=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileComparisonLayer_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: invalid broadcast status=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileComparisonLayer_cold_10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: broadcasting is needed but not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ConnectBroadcastUnits_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileReshapeLayer_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_10();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1D4999000, v2, OS_LOG_TYPE_ERROR, "%s: unsupported shape=%@ for result tensor=%@", (uint8_t *)v3, 0x20u);
}

void ANE_CompileReshapeLayer_cold_2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_1D4999000, v0, OS_LOG_TYPE_ERROR, "%s: layer=%@ failed validation", (uint8_t *)v1, 0x16u);
}

void GPU_CreateOptimizerDeviceDataForTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: momentum creation failed", a5, a6, a7, a8, 2u);
}

void GPU_CreateOptimizerDeviceVectorDataForTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: momentum creation failed", a5, a6, a7, a8, 2u);
}

void ANE_BuildArithmeticParams_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported arithmetic operation=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateArithmeticLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: failed to build the ANEC IR parameters for arithmetic operation=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: the neuron unit of layer=%@ failed validation", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: the elementwise unit of layer=%@ failed validation", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 1 for operation=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the elementwise unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the neuron unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 2 for operation=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_9()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 2 for operation=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 2 for operation=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: invalid broadcast status=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_16(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "ANE_CreateUnitsWithArithmeticOpeartion";
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: broadcasting is needed but not supported", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileArithmeticLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the ANEC IR units of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_IsSupportedLayer_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "poolingType");
  v4 = 136315394;
  v5 = "includePaddingLayer";
  OUTLINED_FUNCTION_9_1();
  _os_log_debug_impl(&dword_1D4999000, a2, OS_LOG_TYPE_DEBUG, "%s: unsupported pooling type=%d", (uint8_t *)&v4, 0x12u);

  OUTLINED_FUNCTION_1_0();
}

void buildANESubgraph_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "getParentLayers";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a3, (uint64_t)a3, "%s: Cannot find parents for a layer", a1);
}

void setBNNSActivation_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "activationType");
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v1, v2, "%s: Unknown neuron type %d", v3, v4, v5, v6, 2u);
}

void ANE_BuildConvolutionParams_cold_1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "convolutionType");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x12u);
}

void ANE_BuildConvolutionParams_cold_2(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "dataType");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

void ANE_BuildConvolutionParams_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to convert weight layout from OIHW to IOHW for a convolution transpose layer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateConvolutionLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECIR neuron parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateConvolutionLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build bias parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithConvolutionLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to calculate padding sizes for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithConvolutionLayer_cold_2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_10();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1D4999000, v2, OS_LOG_TYPE_ERROR, "%s: unit=%@ of layer=%@ failed validation", (uint8_t *)v3, 0x20u);
}

void ANE_CreateUnitsWithConvolutionLayer_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed convolution layer validation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithConvolutionLayer_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid total padding size on width=%ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateUnitsWithConvolutionLayer_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid total padding size on height=%ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileConvolutionLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported source shape count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileConvolutionLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the units of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileConvolutionLayer_cold_3(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(a1, "fusedLayers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_2();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x16u);

}

void ANE_CompileConvolutionLayer_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the convolution units of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileConvolutionLayer_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create two reshape units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileSelectionLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: the data types of source tensors are not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileSelectionLayer_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileSelectionLayer_cold_6(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "ANE_CompileSelectionLayer";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%s: invalid broadcast status=%d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileSelectionLayer_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: broadcasting is needed but not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileSelectionLayer_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: the number of arithmetic parameters must be 4", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void VerifyTensorBeforeRead_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, v0, v1, "%s: device memory not allocated for tensor=%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void VerifyTensorBeforeRead_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, v0, v1, "%s: empty liveIOStatus in tensor=%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void VerifyTensorBeforeRead_cold_3(NSObject *a1)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "VerifyTensorBeforeRead";
  OUTLINED_FUNCTION_7(&dword_1D4999000, a1, OS_LOG_TYPE_ERROR, "%s: Tensor's device memory was not converted to ANE data structure", (uint8_t *)&v1);
  OUTLINED_FUNCTION_5();
}

void GPU_AllocateResourceForMultiGPUTraining_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "deviceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "count");
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "2 GPUs are expected but only %lu GPU is available", (uint8_t *)&v4, 0xCu);

}

void GPU_AllocateResourceForMultiGPUTraining_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_7(&dword_1D4999000, a3, (uint64_t)a3, "Unsupported data type.", a1);
}

void GPU_GetDataType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_7(&dword_1D4999000, a1, a3, "Unsupported data type.", v3);
  OUTLINED_FUNCTION_1_3();
}

void makeMPSNDArrayDescriptorFromTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_7(&dword_1D4999000, a1, a3, "unsupported shape", v3);
  OUTLINED_FUNCTION_1_3();
}

void ANE_ValidateConcatUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateConcatUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateConcatUnit_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to build ANECTensorDesc for sourceTensor=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildANECTensorDesc_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 136315650;
  v6 = "ANE_BuildANECTensorDesc";
  v7 = 1024;
  v8 = objc_msgSend(a1, "dataType");
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%s: unsupported data type=%d for tensor=%@", (uint8_t *)&v5, 0x1Cu);
}

void ANE_CreateUnitValidator_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: incorrect platform=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateConvolutionUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateConvolutionUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateConvolutionUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInstanceNormUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInstanceNormUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInstanceNormUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateNeuronUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateNeuronUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateNeuronUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidatePoolingUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidatePoolingUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidatePoolingUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateSoftmaxUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateSoftmaxUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateSoftmaxUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateReshapeUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateReshapeUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateReshapeUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateTransposeUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateTransposeUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateTransposeUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateReductionUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateReductionUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateReductionUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateBroadcastUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateBroadcastUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateBroadcastUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build output ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateBroadcastUnit_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build input ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateElementWiseUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateElementWiseUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateElementWiseUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInputViewUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInputViewUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInputViewUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateArgMinMaxUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateArgMinMaxUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateArgMinMaxUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateGOCUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateGOCUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateGOCUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateMatrixMultUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateMatrixMultUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateMatrixMultUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateLayerNormUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: unable to delete the validator instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateLayerNormUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to create ANEC unit validator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateLayerNormUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECTensorDesc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __isAppleNeuralEngineAPIAvailable_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: no AppleNeuralEngine framework API available", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildReductionParams_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: unsupported reduction type=%d", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildReductionParams_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%s: unsupported reduction dimension=%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

void ANE_Get4DReductionDimensions_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: only suppport a source tensor with up to 4 dimensions", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateReductionLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build the reduction parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileReductionLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "reductionType");
  v4[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, a2, v3, "%s: unsupported reduction type=%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileReductionLayer_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%s: unsupported reduction dimension=%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

void ANE_CompileReductionLayer_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileSoftmaxLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: nil neuron unit parameters", a5, a6, a7, a8, 2u);
}

void ANE_CompileSoftmaxLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: nil GOC unit parameters", a5, a6, a7, a8, 2u);
}

void ANE_CompileSoftmaxLayer_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void CPU_BuildBNNSLSTMInputAndOutput_cold_1(int a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "CPU_BuildBNNSLSTMInputAndOutput";
  v5 = 1024;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: LSTM input feature size is %d but source tensor input feature size is %d", (uint8_t *)&v3, 0x18u);
  OUTLINED_FUNCTION_5();
}

void addInputWeightPointersToGate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to allocate pointed weight for first input weight", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void createParameterPointersForGate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to allocate pointed weight for either hidden weights or bias terms", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreatePoolingLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: pooling with dilation rate > 1 is not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreatePoolingLayer_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "poolingType");
  v4[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, a2, v3, "%s: unsupported pooling type %d", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_CompilePoolingLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported source shape count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompilePoolingLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: unsupported pooling type=%d", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CompilePoolingLayer_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build the reduction parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompilePoolingLayer_cold_5(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "ANE_CompilePoolingLayer";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: reduction unit=%@ for layer=%@ failed validation", (uint8_t *)&v3, 0x20u);
  OUTLINED_FUNCTION_6();
}

void ANE_CompilePoolingLayer_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed pooling layer validation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void CPU_CreateLossLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: Unknown loss type %d", (uint8_t *)v2);
}

void getBNNSLossReductionFunction_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: Unknown reduction type %d", (uint8_t *)v2);
}

void CPU_CompileYOLOLossLayer_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataType");
  v6[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, a2, v5, "%s: Unsupported sources data type %d", (uint8_t *)v6);

}

void CPU_CompileYOLOLossLayer_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataType");
  v5[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, a2, v4, "%s: Unsupported result data type (%d)", (uint8_t *)v5);

}

void CPU_CreateFusedConvolutionNormalizationAndNeuronLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, v0, v1, "%s: Unsupported operation type (%d)", (uint8_t *)v2);
}

void CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "deviceOpType");
  v4[0] = 136315394;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1D4999000, a2, v3, "%s: Unsupported operation type (%d)", (uint8_t *)v4);
  OUTLINED_FUNCTION_1_0();
}

void CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "CPU_CompileFusedConvolutionNormalizationAndNeuronLayer";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a1, a3, "%s: BNNS filter could not be created", (uint8_t *)&v3);
}

void CPU_CreatePaddingLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: Unsupported padding type %d", v2, v3, v4, v5, 2u);
}

void CPU_CreatePaddingLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: Unsupported data type %d", v2, v3, v4, v5, 2u);
}

void ANE_CreateMatMulLayer_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "ANE_CreateMatMulLayer";
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: failed to build Matrix Mult parameters", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateMatMulLayer_cold_2(float *a1, NSObject *a2)
{
  double v2;
  int v3;
  const char *v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315394;
  v4 = "ANE_BuildMatMulParameters";
  v5 = 2048;
  v6 = v2;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%s: failed to convert the FP32 value=%f to int16", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileMatMulLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: failed to get the ANEC IR data type from result tensor data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileMatMulLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: failed to get the ANEC IR data type from source tensor data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileMatMulLayer_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: failed to get the ANEC IR data type from biases data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileMatMulLayer_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: invalid broadcasting status=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileMatMulLayer_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: elementWise add unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileMatMulLayer_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: broadcasting bias tensor is needed but not supported. bias tensor=%@, result tensor=%@", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileMatMulLayer_cold_8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: GOC unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileMatMulLayer_cold_9()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: transpose unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileMatMulLayer_cold_10()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: matrix mult unit=%@ for layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileConcatLayer_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateNormalizationLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported norm type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build ANECIR neuron parameter", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build batch normalization parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build instance normalization parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build the parameters of instance normalization layer with mean and variance tensors specified", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to calculate scales and biases for instnace normalization", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build the parameters of beta and gamma", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_9(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v1, v2, "%s: failed to convert the FP32 value=%f to int16", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_10(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_15(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v3, "%s: unsupported shape dimensions=%lu for instance normalization", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateNormalizationLayer_cold_11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build layer normalization parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported normalized shape count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_13(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v1, v2, "%s: failed to convert the FP32 value=%f to int16", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build group normalization parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to calculate scales and biases for group normalization", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build the parameters of beta and gamma", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_17(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v1, v2, "%s: failed to convert the FP32 value=%f to int16", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormalizationLayer_cold_18(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_15(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v3, "%s: unsupported shape dimensions=%lu for group normalization", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_BuildBatchNormalizationParams_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to calculate biases and scales for batch normalization", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildBatchNormalizationParams_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildBatchNormalizationParams_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build the parameters of batch normalization", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_BuildBatchNormalizationParams_cold_5(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_15(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v3, "%s: unsupported shape dimensions=%lu for batch normalization", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileNormalizationLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported norm type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the units of layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fusedLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v5, "%s: the fused layer is not a neuron layer.The fused layer=%@", (uint8_t *)v6);

}

void ANE_CompileNormalizationLayer_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported source tensor shape count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the normalization units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create two reshape units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported normalized shape count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the units to apply the gamma and beta used by layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: no units created for the layer normalization layer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the constant tensor for gamma=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create the constant tensor for beta=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileNormalizationLayer_cold_15()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the instance normalization unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CompileNormalizationLayer_cold_16()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the layer normalization unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_BuildGocParams_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_13_1(&dword_1D4999000, v0, v1, "%s: unsupported data type=%d for tensor=%@", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CalculateScaleAndBiasForInstanceNorm_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormUnits_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported normalization type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateNormUnits_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the GOC unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateNormUnits_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the GOC unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateNormUnits_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the instance normalization unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateNormUnits_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the GOC unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateNormUnits_cold_7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the group normalization unit=%@ of layer=%@ failed validation", v2);
  OUTLINED_FUNCTION_6();
}

void ANE_CreateBroadcastedConstantTensor_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 136315650;
  OUTLINED_FUNCTION_2_0();
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_1(&dword_1D4999000, v1, v2, "%s: the size of the constant tensor=%lu is not divisible by the size of source tensor=%lu", v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ANE_ConvertFp32ToInt16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to convert the FP32 value=%f to FP16", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompressSparseKernel_cold_1()
{
  uint64_t v0;
  __int16 v1;
  float v2;
  os_log_t v3;
  int v4[3];
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_15_0();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_debug_impl(&dword_1D4999000, v3, OS_LOG_TYPE_DEBUG, "%s: not a sparse kernel because sparsity=%f is below sparsityThreshold=%f", (uint8_t *)v4, 0x20u);
  OUTLINED_FUNCTION_6();
}

void ANE_CompressSparseKernel_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_GetTensorValueInFloat_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_GetTensorWidthAndHeightWithOnePrepended_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported tensor shape count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_GetDimensionIn4DWithOnePrepended_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: only support up to 4 dimensions", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_GetDimensionIn4DWithOnePrepended_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;
  uint64_t v3;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "ANE_GetDimensionIn4DWithOnePrepended";
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: dimension=%lu cannot be equal to or greater than tensor shape count=%lu", (const char *)v2, DWORD2(v2), v3);
  OUTLINED_FUNCTION_6();
}

void ANE_GetTensorFeatureChannelsWithBatchFirst_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported tensor shape count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_GetANECIRDimension_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported dimension=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_GetANECIRDataTypeWithMLCDataType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInterleave_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid interleave value=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInterleave_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: channels cannot equal to 0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ValidateInterleave_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;
  uint64_t v3;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "ANE_ValidateInterleave";
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: invalid interleave (%lu) that exceeds the number of channels (%lu)", (const char *)v2, DWORD2(v2), v3);
  OUTLINED_FUNCTION_6();
}

void ANE_ValidateInterleave_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;
  uint64_t v3;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "ANE_ValidateInterleave";
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: the number of channels (%lu) must be a multiple of interleave (%lu)", (const char *)v2, DWORD2(v2), v3);
  OUTLINED_FUNCTION_6();
}

void ANE_ValidateInterleave_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid interleave value=%lu.The interleave values supported by ANE compiler are 1, 2, 3, 4, and 8", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_GetANEElementByteCount_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: unsupported data type=%d on AppleNeuralEngine", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CalculateRowStrideForTensor_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid element byte count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CalculateRowStrideForTensor_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed interleave validaiton", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CalculatePlaneStrideForTensor_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid row stride=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CalculatePlaneCountForTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed interleave validaiton", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CalculateIOInterleave_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid element byte count=%lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ConvertInputTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: empty liveIOStatus", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ConvertInputTensor_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dimensionCount");
  v4[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v3, "%s: unsupported tensor shape count=%lu", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_ConvertInputTensor_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid interleave value (%lu)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ConvertInputTensor_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_13_2(&dword_1D4999000, v0, v1, "%s: unsuppoted data type combination. Source data type=%d, result data type=%d", v2, v3, v4);
  OUTLINED_FUNCTION_5();
}

void ANE_ConvertInputTensor_cold_5(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  int v9[3];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tensorAllocationSizeInBytes");
  v9[0] = 136315650;
  OUTLINED_FUNCTION_15_0();
  v10 = a2;
  v11 = v6;
  v12 = v7;
  OUTLINED_FUNCTION_8_0(&dword_1D4999000, a3, v8, "%s: sourceBufferLength=%lu does not match tensorAllocationSizeInBytes=%lu", (uint8_t *)v9);

}

void ANE_ANECDataTypeToMLCDataType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: unsupported data type=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ReadOutputTensor_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: no device memory allocated for tensor=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ReadOutputTensor_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: empty liveIOStatus", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ReadOutputTensor_cold_3(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dimensionCount");
  v4[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v3, "%s: unsupported tensor shape count=%lu", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

void ANE_ReadOutputTensor_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: no IOSurface allocated for tensor=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ReadOutputTensor_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: invalid interleave value (%lu)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ReadOutputTensor_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_13_2(&dword_1D4999000, v0, v1, "%s: unsuppoted data type combination. Source data type=%d, result data type=%d", v2, v3, v4);
  OUTLINED_FUNCTION_5();
}

void ANE_ReadOutputTensor_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: Tensor's device memory was not converted to ANE data structure", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_ReadOutputTensor_cold_8(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 136315650;
  v7 = "ANE_ReadOutputTensor";
  v8 = 2048;
  v9 = objc_msgSend(a1, "deviceIndex");
  v10 = 2048;
  v11 = a2;
  OUTLINED_FUNCTION_8_0(&dword_1D4999000, a3, v5, "%s: ANE_ReadOutputTensor() must be called with deviceIndex = %lu, but given deviceIndex = %lu", (uint8_t *)&v6);
}

void ANE_ComputeLiveInputs_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "parentLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v4, "%s: failed to compute liveins: source tensor is defined by multiple layers = %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_6();
}

void ANE_WriteANEModelFiles_cold_1(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315650;
  v5 = "ANE_WriteANEModelFiles";
  v6 = 2112;
  v7 = a1;
  v8 = 1024;
  v9 = v3;
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: baseDirectoryPath=%@ exists : isDirectory=%d", (uint8_t *)&v4, 0x1Cu);
  OUTLINED_FUNCTION_6();
}

void ANE_WriteANEModelFiles_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to write weightFilePath=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_WriteANEModelFiles_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to write the ANEC IR plist to plistFilePath=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_WriteANEModelFiles_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "ANE_WriteANEModelFiles";
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: failed to create baseDirectoryPath=%@ : error=%@", (_QWORD)v2, DWORD2(v2));
  OUTLINED_FUNCTION_6();
}

void ANE_DeleteANEModelDirectory_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "ANE_DeleteANEModelDirectory";
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1(&dword_1D4999000, v0, v1, "%s: failed to delete %@ : error=%@", (_QWORD)v2, DWORD2(v2));
  OUTLINED_FUNCTION_6();
}

void CPU_CreateSGDOptimizer_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unknown regularization type type %d", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CPU_CreateSGDOptimizer_cold_2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unknown gradient clipping type %d", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CPU_CreateAdamOptimizer_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unknown regularization type type %d", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CPU_CreateAdamOptimizer_cold_2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unknown gradient clipping type %d", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CPU_CreateRMSPropOptimizer_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unknown regularization type type %d", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CPU_CreateRMSPropOptimizer_cold_2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unknown gradient clipping type %d", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CPU_CreateNormalizationLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, v0, v1, "%s: Unsupported norm type (%d)", v2, v3, v4, v5, 2u);
}

void ANE_BuildTransposeParams_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 136315394;
  v5 = "ANE_BuildTransposeParams";
  v6 = 2048;
  v7 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, v3, "%s: unsupported shape count=%lu", (uint8_t *)&v4);
}

void ANE_BuildTransposeParams_cold_2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "ANE_BuildTransposeParams";
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: failed to get ANEC IR dimension", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void ANE_CreateTransposeLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, v0, v1, "%s: failed to build the transpose parameteres for shape=%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileTransposeLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, v0, v1, "%s: layer=%@ failed validation", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileFullyConnectedLayer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create convolution units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileFullyConnectedLayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileFullyConnectedLayer_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build bias parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileFullyConnectedLayer_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D4999000, a1, a3, "%s: failed to build convolution parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileFullyConnectedLayer_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1D4999000, v0, v1, "%s: failed to create matrix multiplication units for layer=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileFullyConnectedLayer_cold_6()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_10();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1D4999000, v2, OS_LOG_TYPE_ERROR, "%s: unit=%@ of layer=%@ failed validation", (uint8_t *)v3, 0x20u);
}

void ANE_CompileFullyConnectedLayer_cold_7(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "ANE_CreateMatMulUnitsWithFullyConnectedLayer";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%s: unsupported weight data type=%d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

void ANE_CompileFullyConnectedLayer_cold_8(void *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "ANE_CreateMatMulUnitsWithFullyConnectedLayer";
  v8 = 1024;
  v9 = a2;
  v10 = 1024;
  v11 = objc_msgSend(v5, "dataType");
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%s: different data types between weights and biases are not supported. weight data type=%d, bias data type=%d", (uint8_t *)&v6, 0x18u);

}

uint64_t ANECConcatLayerDescInitialize()
{
  return MEMORY[0x1E0CF1448]();
}

uint64_t ANECConvLayerDescInitialize()
{
  return MEMORY[0x1E0CF1450]();
}

uint64_t ANECDimensionMappingInitialize()
{
  return MEMORY[0x1E0CF1478]();
}

uint64_t ANECGOCLayerDescInitialize()
{
  return MEMORY[0x1E0CF1498]();
}

uint64_t ANECInputViewLayerDescInitialize()
{
  return MEMORY[0x1E0CF14E0]();
}

uint64_t ANECInstanceNormLayerDescInitialize()
{
  return MEMORY[0x1E0CF14E8]();
}

uint64_t ANECKernelDilationRateInitialize()
{
  return MEMORY[0x1E0CF14F8]();
}

uint64_t ANECKernelSizeInitialize()
{
  return MEMORY[0x1E0CF1510]();
}

uint64_t ANECLayerNormLayerDescInitialize()
{
  return MEMORY[0x1E0CF1518]();
}

uint64_t ANECMatrixMultLayerDescInitialize()
{
  return MEMORY[0x1E0CF1530]();
}

uint64_t ANECNeuronLayerDescInitialize()
{
  return MEMORY[0x1E0CF1540]();
}

uint64_t ANECPaddingInitialize()
{
  return MEMORY[0x1E0CF1550]();
}

uint64_t ANECPoolLayerDescInitialize()
{
  return MEMORY[0x1E0CF1570]();
}

uint64_t ANECReductionLayerDescInitialize()
{
  return MEMORY[0x1E0CF1580]();
}

uint64_t ANECReshapeLayerDescInitialize()
{
  return MEMORY[0x1E0CF15A8]();
}

uint64_t ANECSoftmaxLayerDescInitialize()
{
  return MEMORY[0x1E0CF15B8]();
}

uint64_t ANECStepInitialize()
{
  return MEMORY[0x1E0CF15E0]();
}

uint64_t ANECTensorDescInitialize()
{
  return MEMORY[0x1E0CF15F8]();
}

uint64_t ANECTensorDimsInitialize()
{
  return MEMORY[0x1E0CF1600]();
}

uint64_t ANECTransposeLayerDescInitialize()
{
  return MEMORY[0x1E0CF1620]();
}

uint64_t ANECUnitValidatorCreate()
{
  return MEMORY[0x1E0CF1630]();
}

uint64_t ANECUnitValidatorDelete()
{
  return MEMORY[0x1E0CF1648]();
}

uint64_t ANECValidateArgMinMaxLayer()
{
  return MEMORY[0x1E0CF1660]();
}

uint64_t ANECValidateBroadcastLayer()
{
  return MEMORY[0x1E0CF1670]();
}

uint64_t ANECValidateConcatLayer()
{
  return MEMORY[0x1E0CF1680]();
}

uint64_t ANECValidateConvLayer()
{
  return MEMORY[0x1E0CF1698]();
}

uint64_t ANECValidateElementWiseLayer()
{
  return MEMORY[0x1E0CF16B8]();
}

uint64_t ANECValidateGOCLayer()
{
  return MEMORY[0x1E0CF16D8]();
}

uint64_t ANECValidateInputViewLayer()
{
  return MEMORY[0x1E0CF16F8]();
}

uint64_t ANECValidateInstanceNormLayer()
{
  return MEMORY[0x1E0CF1708]();
}

uint64_t ANECValidateLayerNormLayer()
{
  return MEMORY[0x1E0CF1710]();
}

uint64_t ANECValidateMatrixMultLayer()
{
  return MEMORY[0x1E0CF1728]();
}

uint64_t ANECValidateNeuronLayer()
{
  return MEMORY[0x1E0CF1750]();
}

uint64_t ANECValidatePoolLayer()
{
  return MEMORY[0x1E0CF1778]();
}

uint64_t ANECValidateReductionLayer()
{
  return MEMORY[0x1E0CF1788]();
}

uint64_t ANECValidateReshapeLayer()
{
  return MEMORY[0x1E0CF1798]();
}

uint64_t ANECValidateSoftmaxLayer()
{
  return MEMORY[0x1E0CF17B8]();
}

uint64_t ANECValidateTransposeLayer()
{
  return MEMORY[0x1E0CF17E8]();
}

int BNNSApplyMultiheadAttention(void *F, size_t batch_size, const void *query, size_t query_stride, const void *key, size_t key_stride, const BNNSNDArrayDescriptor *key_mask, size_t key_mask_stride, const void *value, size_t value_stride, void *output, size_t output_stride, const BNNSNDArrayDescriptor *add_to_attention, size_t *backprop_cache_size, void *backprop_cache, size_t *workspace_size, void *workspace)
{
  return MEMORY[0x1E0C8B488](F, batch_size, query, query_stride, key, key_stride, key_mask, key_mask_stride);
}

int BNNSApplyMultiheadAttentionBackward(void *F, size_t batch_size, const void *query, size_t query_stride, BNNSMHAProjectionParameters *query_param_delta, const void *key, size_t key_stride, const BNNSNDArrayDescriptor *key_mask, size_t key_mask_stride, BNNSMHAProjectionParameters *key_param_delta, const void *value, size_t value_stride, BNNSMHAProjectionParameters *value_param_delta, const BNNSNDArrayDescriptor *add_to_attention, BNNSNDArrayDescriptor *key_attn_bias_delta, BNNSNDArrayDescriptor *value_attn_bias_delta, const void *output, size_t output_stride, BNNSMHAProjectionParameters *output_param_delta, size_t backprop_cache_size,void *backprop_cache,size_t *workspace_size,void *workspace)
{
  return MEMORY[0x1E0C8B490](F, batch_size, query, query_stride, query_param_delta, key, key_stride, key_mask);
}

int BNNSArithmeticFilterApplyBackwardBatch(void *filter, size_t batch_size, size_t number_of_inputs, const void **in, const size_t *in_stride, BNNSNDArrayDescriptor **in_delta, const size_t *in_delta_stride, const void *out, const size_t out_stride, BNNSNDArrayDescriptor *out_delta, const size_t out_delta_stride)
{
  return MEMORY[0x1E0C8B498](filter, batch_size, number_of_inputs, in, in_stride, in_delta, in_delta_stride, out);
}

int BNNSArithmeticFilterApplyBatch(void *filter, size_t batch_size, size_t number_of_inputs, const void **in, const size_t *in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1E0C8B4A8](filter, batch_size, number_of_inputs, in, in_stride, out, out_stride);
}

int BNNSCompareTensor(const BNNSNDArrayDescriptor *in0, const BNNSNDArrayDescriptor *in1, BNNSRelationalOperator op, BNNSNDArrayDescriptor *out)
{
  return MEMORY[0x1E0C8B4D8](in0, in1, *(_QWORD *)&op, out);
}

size_t BNNSComputeLSTMTrainingCacheCapacity(const BNNSLayerParametersLSTM *layer_params)
{
  return MEMORY[0x1E0C8B4E0](layer_params);
}

int BNNSCopy(BNNSNDArrayDescriptor *dest, const BNNSNDArrayDescriptor *src, const BNNSFilterParameters *filter_params)
{
  return MEMORY[0x1E0C8B500](dest, src, filter_params);
}

int BNNSDirectApplyLSTMBatchBackward(const BNNSLayerParametersLSTM *layer_params, const BNNSLayerParametersLSTM *layer_delta_params, const BNNSFilterParameters *filter_params, const void *training_cache_ptr, const size_t training_cache_capacity)
{
  return MEMORY[0x1E0C8B578](layer_params, layer_delta_params, filter_params, training_cache_ptr, training_cache_capacity);
}

int BNNSDirectApplyLSTMBatchTrainingCaching(const BNNSLayerParametersLSTM *layer_params, const BNNSFilterParameters *filter_params, void *training_cache_ptr, const size_t training_cache_capacity)
{
  return MEMORY[0x1E0C8B580](layer_params, filter_params, training_cache_ptr, training_cache_capacity);
}

int BNNSFilterApply(void *filter, const void *in, void *out)
{
  return MEMORY[0x1E0C8B5A8](filter, in, out);
}

int BNNSFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, const BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *weights_delta, BNNSNDArrayDescriptor *bias_delta)
{
  return MEMORY[0x1E0C8B5C0](filter, batch_size, in, in_stride, in_delta, in_delta_stride, out, out_stride);
}

int BNNSFilterApplyBackwardTwoInputBatch(void *filter, size_t batch_size, const void *inA, size_t inA_stride, BNNSNDArrayDescriptor *inA_delta, size_t inA_delta_stride, const void *inB, size_t inB_stride, BNNSNDArrayDescriptor *inB_delta, size_t inB_delta_stride, const void *out, size_t out_stride, const BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *weights_delta, BNNSNDArrayDescriptor *bias_delta)
{
  return MEMORY[0x1E0C8B5C8](filter, batch_size, inA, inA_stride, inA_delta, inA_delta_stride, inB, inB_stride);
}

int BNNSFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1E0C8B5D0](filter, batch_size, in, in_stride, out, out_stride);
}

int BNNSFilterApplyTwoInputBatch(void *filter, size_t batch_size, const void *inA, size_t inA_stride, const void *inB, size_t inB_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1E0C8B5E8](filter, batch_size, inA, inA_stride, inB, inB_stride, out, out_stride);
}

uint64_t BNNSFilterCreateBatchLayerFullyConnected()
{
  return MEMORY[0x1E0C8B5F0]();
}

void *__cdecl BNNSFilterCreateFusedLayer(const size_t number_of_fused_filters, const BNNSFilterType *filter_type, const void **layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B610](number_of_fused_filters, filter_type, layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerActivation(const BNNSLayerParametersActivation *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B618](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerArithmetic(const BNNSLayerParametersArithmetic *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B628](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerBroadcastMatMul(const BNNSLayerParametersBroadcastMatMul *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B638](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerConvolution(const BNNSLayerParametersConvolution *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B648](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerDropout(const BNNSLayerParametersDropout *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B650](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerGram(const BNNSLayerParametersGram *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B670](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerLoss(const void *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B678](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerMultiheadAttention(const BNNSLayerParametersMultiheadAttention *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B680](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerNormalization(BNNSFilterType normType, const BNNSLayerParametersNormalization *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B688](*(_QWORD *)&normType, layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPadding(const BNNSLayerParametersPadding *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B690](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPermute(const BNNSLayerParametersPermute *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B698](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPooling(const BNNSLayerParametersPooling *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B6A0](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerReduction(const BNNSLayerParametersReduction *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B6B0](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerResize(const BNNSLayerParametersResize *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B6B8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerTransposedConvolution(const BNNSLayerParametersConvolution *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B6C0](layer_params, filter_params);
}

void BNNSFilterDestroy(void *filter)
{
  MEMORY[0x1E0C8B6E8](filter);
}

int BNNSFusedFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor **delta_parameters)
{
  return MEMORY[0x1E0C8B700](filter, batch_size, in, in_stride, in_delta, in_delta_stride, out, out_stride);
}

int BNNSFusedFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride, BOOL training)
{
  return MEMORY[0x1E0C8B710](filter, batch_size, in, in_stride, out, out_stride, training);
}

int BNNSLossFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *labels, size_t labels_stride, const void *weights, size_t weights_size, const BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride)
{
  return MEMORY[0x1E0C8B970](filter, batch_size, in, in_stride, in_delta, in_delta_stride, labels, labels_stride);
}

int BNNSLossFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, const void *labels, size_t labels_stride, const void *weights, size_t weights_size, void *out, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride)
{
  return MEMORY[0x1E0C8B978](filter, batch_size, in, in_stride, labels, labels_stride, weights, weights_size);
}

int BNNSNormalizationFilterApplyBackwardBatch(void *filter, size_t batch_size, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *beta_delta, BNNSNDArrayDescriptor *gamma_delta)
{
  return MEMORY[0x1E0C8B9C8](filter, batch_size, in_delta, in_delta_stride, out, out_stride, out_delta, out_delta_stride);
}

int BNNSNormalizationFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride, BOOL training)
{
  return MEMORY[0x1E0C8B9D0](filter, batch_size, in, in_stride, out, out_stride, training);
}

int BNNSOptimizerStep(BNNSOptimizerFunction function, const void *OptimizerAlgFields, size_t number_of_parameters, BNNSNDArrayDescriptor **parameters, const BNNSNDArrayDescriptor **gradients, BNNSNDArrayDescriptor **accumulators, const BNNSFilterParameters *filter_params)
{
  return MEMORY[0x1E0C8B9D8](*(_QWORD *)&function, OptimizerAlgFields, number_of_parameters, parameters, gradients, accumulators, filter_params);
}

int BNNSPoolingFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *bias_delta, const size_t *indices, size_t idx_stride)
{
  return MEMORY[0x1E0C8B9E0](filter, batch_size, in, in_stride, in_delta, in_delta_stride, out, out_stride);
}

int BNNSPoolingFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride, size_t *indices, size_t idx_stride)
{
  return MEMORY[0x1E0C8B9F0](filter, batch_size, in, in_stride, out, out_stride, indices, idx_stride);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MPSGetTemporaryBufferFromCommandBufferCache()
{
  return MEMORY[0x1E0CC6C60]();
}

NSUInteger MPSImageBatchIncrementReadCount(MPSImageBatch *batch, NSInteger amount)
{
  return MEMORY[0x1E0CC6C68](batch, amount);
}

NSUInteger MPSStateBatchIncrementReadCount(MPSStateBatch *batch, NSInteger amount)
{
  return MEMORY[0x1E0CC6C80](batch, amount);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1E0CB3170](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1E0C80C58]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

double drand48(void)
{
  double result;

  MEMORY[0x1E0C83070]();
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F18](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
  MEMORY[0x1E0C840C8](__b, __pattern8, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x1E0C84FB8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

void srand48(uint64_t a1)
{
  MEMORY[0x1E0C85480](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void vDSP_maxmgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C188](__A, __IA, __C, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2E8](__A, __I, __C, __N);
}

void vDSP_svemg(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C318](__A, __IA, __C, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C328](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C358](__A, __IA, __C, __IC, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C460](__A, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF28](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CFC0](src, dest, *(_QWORD *)&flags);
}

void vvpowsf(float *a1, const float *a2, const float *a3, const int *a4)
{
  MEMORY[0x1E0C8DAE0](a1, a2, a3, a4);
}

