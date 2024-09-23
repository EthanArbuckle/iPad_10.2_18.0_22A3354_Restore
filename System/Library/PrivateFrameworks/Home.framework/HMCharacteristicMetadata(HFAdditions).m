@implementation HMCharacteristicMetadata(HFAdditions)

- (HFNumberValueConstraints)hf_numericValueConstraints
{
  HFNumberValueConstraints *v2;
  void *v3;
  void *v4;
  void *v5;
  HFNumberValueConstraints *v6;

  if (objc_msgSend(a1, "hf_isNumeric"))
  {
    v2 = [HFNumberValueConstraints alloc];
    objc_msgSend(a1, "minimumValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "maximumValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stepValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HFNumberValueConstraints initWithMinValue:maxValue:stepValue:](v2, "initWithMinValue:maxValue:stepValue:", v3, v4, v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)hf_isNumeric
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "hf_isInteger") & 1) != 0)
    return 1;
  objc_msgSend(a1, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8700]);

  return v4;
}

- (uint64_t)hf_isInteger
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "format");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  if (_MergedGlobals_264 != -1)
    dispatch_once(&_MergedGlobals_264, &__block_literal_global_3_8);
  v3 = (id)qword_1ED3791B0;
  objc_msgSend(a1, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (id)hf_normalizedValueForValue:()HFAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(a1, "hf_numericValueConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "normalizedValueForValue:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    v9 = v8;

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (uint64_t)hf_isEqualToMetadata:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  int v42;

  v4 = a3;
  objc_msgSend(a1, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (v7 != v8)
  {
    v10 = 0;
    v11 = v8;
    v12 = v7;
LABEL_36:

    goto LABEL_37;
  }
  if (!v7 || (v13 = objc_msgSend(v7, "isEqual:", v7), v7, v7, v13))
  {
    objc_msgSend(a1, "maximumValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v16 = v15;
    v11 = v16;
    if (v12 != v16)
    {
      v10 = 0;
      v17 = v16;
      v18 = v12;
LABEL_35:

      goto LABEL_36;
    }
    if (v12)
    {
      v19 = objc_msgSend(v12, "isEqual:", v12);

      if (!v19)
      {
        v10 = 0;
        v11 = v12;
        goto LABEL_36;
      }
    }
    objc_msgSend(a1, "stepValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stepValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    v22 = v21;
    v17 = v22;
    if (v18 != v22)
    {
      v10 = 0;
      v23 = v22;
      v24 = v18;
LABEL_34:

      goto LABEL_35;
    }
    if (v18)
    {
      v25 = objc_msgSend(v18, "isEqual:", v18);

      if (!v25)
      {
        v10 = 0;
        v17 = v18;
        goto LABEL_35;
      }
    }
    objc_msgSend(a1, "maxLength");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxLength");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;
    v28 = v27;
    v23 = v28;
    if (v24 != v28)
    {
      v10 = 0;
      v29 = v28;
      v41 = v24;
LABEL_33:

      v24 = v41;
      goto LABEL_34;
    }
    if (v24)
    {
      v42 = objc_msgSend(v24, "isEqual:", v24);

      if (!v42)
      {
        v10 = 0;
        v23 = v24;
        goto LABEL_34;
      }
    }
    v41 = v24;
    objc_msgSend(a1, "format");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "format");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v30;
    v31 = v39;
    v40 = v31;
    if (v24 == v31)
    {
      if (v24)
      {
        LODWORD(v36) = objc_msgSend(v24, "isEqual:", v24);

        if (!(_DWORD)v36)
        {
          v10 = 0;
          v29 = v24;
          goto LABEL_33;
        }
      }
      v38 = v24;
      objc_msgSend(a1, "units", v36);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "units");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v32;
      v37 = v33;
      if (v34 == v37)
      {
        if (v34)
        {
          v24 = v34;
          v10 = objc_msgSend(v34, "isEqual:", v34);
        }
        else
        {
          v24 = 0;
          v10 = 1;
        }
      }
      else
      {
        v24 = v34;
        v10 = 0;
      }

      v31 = v37;
    }
    else
    {
      v10 = 0;
      v38 = v24;
    }

    v24 = v38;
    v29 = v40;
    goto LABEL_33;
  }
  v10 = 0;
LABEL_37:

  return v10;
}

- (uint64_t)hf_isValidValue:()HFAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v4 = a3;
  if (!v4)
    goto LABEL_12;
  objc_msgSend(a1, "validValues");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(a1, "validValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if (!v8)
      goto LABEL_12;
  }
  objc_msgSend(a1, "minimumValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "minimumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

  }
  else
  {
    v12 = 2.22507386e-308;
  }

  objc_msgSend(a1, "maximumValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1, "maximumValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

  }
  else
  {
    v16 = 1.79769313e308;
  }

  objc_msgSend(v4, "doubleValue");
  if (v17 >= v12 && (objc_msgSend(v4, "doubleValue"), v18 <= v16))
    v19 = 1;
  else
LABEL_12:
    v19 = 0;

  return v19;
}

- (uint64_t)hf_percentageForCharacteristicValue:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  v4 = a3;
  objc_msgSend(a1, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  objc_msgSend(a1, "maximumValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "maximumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

  }
  else
  {
    v12 = 100.0;
  }

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "doubleValue");
  v15 = v14;

  return objc_msgSend(v13, "numberWithDouble:", (v15 - v8) / (v12 - v8));
}

- (id)hf_valueRoundedToNearestStepValue:()HFAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(a1, "hf_numericValueConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "roundedValueForValue:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    v9 = v8;

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (id)hf_characteristicValueForPercentage:()HFAdditions
{
  float v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  double v19;
  void *v20;

  if (objc_msgSend(a1, "hf_isNumeric"))
  {
    if (a2 < 0.0 || a2 > 1.0)
      NSLog(CFSTR("Incremental state value %f must be between 0 and 1"), *(_QWORD *)&a2);
    v5 = a2;
    v6 = 0.0;
    v7 = fmaxf(v5, 0.0);
    objc_msgSend(a1, "minimumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(a1, "minimumValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v6 = v10;

    }
    v11 = fminf(v7, 1.0);

    objc_msgSend(a1, "maximumValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(a1, "maximumValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

    }
    else
    {
      v15 = 100.0;
    }

    v17 = v6 + (float)(v11 * (float)(v15 - v6));
    objc_msgSend(a1, "stepValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      v17 = *(float *)&v19 * roundf(v17 / *(float *)&v19);
    }
    *(float *)&v19 = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

@end
