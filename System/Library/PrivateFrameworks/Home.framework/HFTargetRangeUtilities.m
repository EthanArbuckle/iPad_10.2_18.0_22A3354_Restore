@implementation HFTargetRangeUtilities

+ (unint64_t)rangeModeForHeatingCoolingMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (id)targetValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetResponse:(id)a5 minimumThresholdResponse:(id)a6 maximumThresholdResponse:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  objc_msgSend((id)objc_opt_class(), "targetRelativePercentValueWithTargetMode:currentMode:rawTargetResponse:minimumThresholdResponse:maximumThresholdResponse:", a3, a4, v13, v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)targetRelativePercentValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetResponse:(id)a5 minimumThresholdResponse:(id)a6 maximumThresholdResponse:(id)a7
{
  id v11;
  id v12;
  id v13;
  HFRelativePercentValue *v14;
  HFRelativePercentValue *v15;
  HFRelativePercentValue *v16;
  void *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = -[HFRelativePercentValue initWithCharacteristicReadResponse:]([HFRelativePercentValue alloc], "initWithCharacteristicReadResponse:", v13);

  v15 = -[HFRelativePercentValue initWithCharacteristicReadResponse:]([HFRelativePercentValue alloc], "initWithCharacteristicReadResponse:", v12);
  v16 = -[HFRelativePercentValue initWithCharacteristicReadResponse:]([HFRelativePercentValue alloc], "initWithCharacteristicReadResponse:", v11);

  objc_msgSend((id)objc_opt_class(), "targetRelativePercentValueWithTargetMode:currentMode:rawTargetRelativePercentValue:minimumThresholdRelativePercentValue:maximumThresholdRelativePercentValue:", a3, a4, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)targetRelativePercentValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetRelativePercentValue:(id)a5 minimumThresholdRelativePercentValue:(id)a6 maximumThresholdRelativePercentValue:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v19[4];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  if (a4 == 3)
    NSLog(CFSTR("currentMode shouldn't support HFTargetRangeModeAuto"));
  v19[0] = (void *)MEMORY[0x1E0C809B0];
  v19[1] = (void *)3221225472;
  v19[2] = __183__HFTargetRangeUtilities_targetRelativePercentValueWithTargetMode_currentMode_rawTargetRelativePercentValue_minimumThresholdRelativePercentValue_maximumThresholdRelativePercentValue___block_invoke;
  v19[3] = &unk_1EA738D38;
  v23 = a4;
  v24 = a3;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  __183__HFTargetRangeUtilities_targetRelativePercentValueWithTargetMode_currentMode_rawTargetRelativePercentValue_minimumThresholdRelativePercentValue_maximumThresholdRelativePercentValue___block_invoke(v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void **__183__HFTargetRangeUtilities_targetRelativePercentValueWithTargetMode_currentMode_rawTargetRelativePercentValue_minimumThresholdRelativePercentValue_maximumThresholdRelativePercentValue___block_invoke(void **a1)
{
  void *v1;
  void *v2;
  void **v3;
  void **result;

  switch((unint64_t)a1[7])
  {
    case 0uLL:
    case 3uLL:
      v1 = a1[8];
      switch((unint64_t)v1)
      {
        case 0uLL:
        case 3uLL:
          v2 = a1[4];
          if (v2)
            goto LABEL_22;
          v2 = a1[6];
          if (a1[5])
          {
            if (!v2)
            {
              v2 = a1[5];
              goto LABEL_22;
            }
          }
          else if (v2)
          {
            goto LABEL_22;
          }
          result = (void **)0;
          break;
        case 1uLL:
          v2 = a1[4];
          if (v2)
            goto LABEL_22;
          v3 = a1 + 5;
          goto LABEL_16;
        case 2uLL:
          v2 = a1[4];
          if (v2)
            goto LABEL_22;
          v3 = a1 + 6;
          goto LABEL_16;
        default:
          goto LABEL_8;
      }
      return result;
    case 1uLL:
      v1 = a1[8];
LABEL_8:
      if (v1 != (void *)3)
      {
        v2 = a1[4];
        if (v2)
          goto LABEL_22;
      }
      v2 = a1[5];
      if (v2)
        goto LABEL_22;
      goto LABEL_15;
    case 2uLL:
      if (a1[8] == (void *)3 || (v2 = a1[4]) == 0)
      {
        v2 = a1[6];
        if (!v2)
        {
LABEL_15:
          v3 = a1 + 4;
LABEL_16:
          v2 = *v3;
        }
      }
LABEL_22:
      a1 = v2;
      return a1;
    default:
      return a1;
  }
}

+ (unint64_t)rangeModeForTargetHeaterCoolerState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_1DD6699C8[a3];
}

+ (unint64_t)rangeModeForCurrentHeaterCoolerState:(int64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

+ (unint64_t)rangeModeForTargetHumidifierDehumidifierState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_1DD6699C8[a3];
}

+ (unint64_t)rangeModeForCurrentHumidifierDehumidifierState:(int64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

+ (id)targetValueForService:(id)a3 valueProvider:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HFRelativePercentValue *v22;
  HFRelativePercentValue *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  HFRelativePercentValue *v27;
  void *v28;
  void *v29;
  HFRelativePercentValue *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  HFRelativePercentValue *v34;
  void *v35;
  void *v36;
  HFRelativePercentValue *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  void *v45;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFTargetRangeUtilities.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueProvider != nil"));

  }
  objc_msgSend(v7, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9B00]);

  if (!v10)
  {
    objc_msgSend(v7, "serviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB9A30]);

    if (v16)
    {
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB88D8]);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8828]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8AB8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v8[2](v8, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          v44 = objc_msgSend((id)objc_opt_class(), "rangeModeForTargetHeaterCoolerState:", objc_msgSend(v18, "integerValue"));
        else
          v44 = 0;

      }
      else
      {
        v44 = 0;
      }
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8840]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v8[2](v8, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = objc_msgSend((id)objc_opt_class(), "rangeModeForCurrentHeaterCoolerState:", objc_msgSend(v32, "integerValue"));
LABEL_40:
          v24 = v33;
LABEL_43:

          goto LABEL_44;
        }
        goto LABEL_42;
      }
    }
    else
    {
      objc_msgSend(v7, "serviceType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB9A38]);

      if (!v20)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v45 = 0;
        v26 = 0;
        v11 = 0;
        v27 = 0;
        goto LABEL_53;
      }
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB88F0]);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB88A8]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8AD0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v8[2](v8, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          v44 = objc_msgSend((id)objc_opt_class(), "rangeModeForTargetHumidifierDehumidifierState:", objc_msgSend(v21, "integerValue"));
        else
          v44 = 0;

      }
      else
      {
        v44 = 0;
      }
      objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8858]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v8[2](v8, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = objc_msgSend((id)objc_opt_class(), "rangeModeForCurrentHumidifierDehumidifierState:", objc_msgSend(v32, "integerValue"));
          goto LABEL_40;
        }
LABEL_42:
        v24 = 0;
        goto LABEL_43;
      }
    }
    v24 = 0;
LABEL_44:

    v23 = 0;
    v11 = 0;
    goto LABEL_45;
  }
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8B08]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB88D8]);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8828]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8AC0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v8[2](v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v44 = objc_msgSend((id)objc_opt_class(), "rangeModeForHeatingCoolingMode:", objc_msgSend(v14, "integerValue"));
    else
      v44 = 0;

  }
  else
  {
    v44 = 0;
  }
  objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x1E0CB8848]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v8[2](v8, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      v24 = objc_msgSend((id)objc_opt_class(), "rangeModeForHeatingCoolingMode:", objc_msgSend(v29, "integerValue"));
    else
      v24 = 0;

  }
  else
  {
    v24 = 0;
  }

  if (v11)
  {
    v30 = [HFRelativePercentValue alloc];
    v8[2](v8, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HFRelativePercentValue initWithValue:forCharacteristic:](v30, "initWithValue:forCharacteristic:", v17, v11);
LABEL_45:

    goto LABEL_46;
  }
  v23 = 0;
LABEL_46:
  v22 = (HFRelativePercentValue *)v12;
  if (v12)
  {
    v34 = [HFRelativePercentValue alloc];
    v8[2](v8, (void *)v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v12;
    v22 = -[HFRelativePercentValue initWithValue:forCharacteristic:](v34, "initWithValue:forCharacteristic:", v35, v12);

  }
  else
  {
    v36 = 0;
  }
  if (v45)
  {
    v37 = [HFRelativePercentValue alloc];
    v8[2](v8, v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HFRelativePercentValue initWithValue:forCharacteristic:](v37, "initWithValue:forCharacteristic:", v38, v45);

  }
  else
  {
    v45 = 0;
    v27 = 0;
  }
  v26 = v36;
  v25 = v44;
LABEL_53:
  objc_msgSend((id)objc_opt_class(), "targetRelativePercentValueWithTargetMode:currentMode:rawTargetRelativePercentValue:minimumThresholdRelativePercentValue:maximumThresholdRelativePercentValue:", v25, v24, v23, v22, v27);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    objc_msgSend(v39, "value");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

@end
