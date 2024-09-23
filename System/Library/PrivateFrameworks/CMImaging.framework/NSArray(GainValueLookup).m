@implementation NSArray(GainValueLookup)

- (BOOL)cmi_isValidGainValueArray
{
  unint64_t v2;
  unint64_t v3;
  float v4;
  float v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  float v11;
  float v12;
  char v14;

  v2 = objc_msgSend(a1, "count");
  v3 = v2;
  if ((v2 & 1) != 0 || v2 <= 1)
  {
    fig_log_get_emitter();
LABEL_20:
    FigDebugAssert3();
    return 0;
  }
  v14 = 0;
  objc_msgSend(a1, "cmi_floatValueForIndex:valid:", 0, &v14);
  if (!v14 || (v5 = v4, objc_msgSend(a1, "cmi_floatValueForIndex:valid:", 1, &v14), !v14))
  {
    fig_log_get_emitter();
    goto LABEL_20;
  }
  if (v3 < 4)
  {
    return 1;
  }
  else
  {
    v6 = 0;
    v7 = v3 >> 1;
    if (v3 >> 1 <= 2)
      v8 = 2;
    else
      v8 = v3 >> 1;
    v9 = 1;
    for (i = 3; ; i += 2)
    {
      objc_msgSend(a1, "cmi_floatValueForIndex:valid:", i - 1, &v14);
      if (!v14)
        break;
      v12 = v11;
      objc_msgSend(a1, "cmi_floatValueForIndex:valid:", i, &v14);
      if (!v14 || v12 <= v5)
        break;
      v6 = ++v9 >= v7;
      v5 = v12;
      if (v8 == v9)
        return 1;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v6;
}

- (float)cmi_interpolateValueForGain:()GainValueLookup
{
  unint64_t v4;
  unint64_t v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v18;
  float v19;
  float v20;
  char v21;

  v4 = objc_msgSend(a1, "count");
  v5 = v4;
  if ((v4 & 1) != 0 || v4 <= 1)
  {
    fig_log_get_emitter();
LABEL_29:
    FigDebugAssert3();
    return NAN;
  }
  v21 = 0;
  objc_msgSend(a1, "cmi_floatValueForIndex:valid:", 0, &v21);
  if (!v21 || (v7 = v6, objc_msgSend(a1, "cmi_floatValueForIndex:valid:", (v5 & 0xFFFFFFFFFFFFFFFELL) - 2, &v21), !v21))
  {
LABEL_28:
    fig_log_get_emitter();
    goto LABEL_29;
  }
  if (v7 >= a2)
  {
    objc_msgSend(a1, "cmi_floatValueForIndex:valid:", 1, &v21);
    v14 = v15;
    if (v21)
      return v14;
LABEL_30:
    fig_log_get_emitter();
    FigDebugAssert3();
    return v14;
  }
  if (v8 <= a2)
  {
    objc_msgSend(a1, "cmi_floatValueForIndex:valid:", (v5 & 0xFFFFFFFFFFFFFFFELL) - 1, &v21);
    v14 = v16;
    if (v21)
      return v14;
    goto LABEL_30;
  }
  if (v5 >= 4)
  {
    v9 = v5 >> 1;
    if (v5 >> 1 <= 2)
      v9 = 2;
    v10 = v9 - 1;
    for (i = 3; ; i += 2)
    {
      objc_msgSend(a1, "cmi_floatValueForIndex:valid:", i - 1, &v21);
      if (!v21)
        break;
      v13 = v12;
      if (v7 >= v12)
        break;
      if (v7 <= a2 && v12 > a2)
      {
        objc_msgSend(a1, "cmi_floatValueForIndex:valid:", i - 2, &v21);
        if (v21)
        {
          v19 = v18;
          objc_msgSend(a1, "cmi_floatValueForIndex:valid:", i, &v21);
          if (v21)
            return v19 + (float)((float)((float)(a2 - v7) * (float)(v20 - v19)) / (float)(v13 - v7));
        }
        goto LABEL_28;
      }
      v7 = v12;
      if (!--v10)
        return NAN;
    }
    goto LABEL_28;
  }
  return NAN;
}

- (id)cmi_selectValueForGain:()GainValueLookup
{
  unint64_t v4;
  unint64_t v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  void *v13;
  id v14;
  char v16;

  v16 = 0;
  v4 = objc_msgSend(a1, "count");
  v5 = v4;
  if ((v4 & 1) != 0 || v4 <= 1)
  {
    fig_log_get_emitter();
LABEL_28:
    FigDebugAssert3();
    goto LABEL_16;
  }
  objc_msgSend(a1, "cmi_floatValueForIndex:valid:", 0, &v16);
  if (!v16 || (v7 = v6, objc_msgSend(a1, "cmi_floatValueForIndex:valid:", (v5 & 0xFFFFFFFFFFFFFFFELL) - 2, &v16), !v16))
  {
LABEL_27:
    fig_log_get_emitter();
    goto LABEL_28;
  }
  if (v7 >= a2)
  {
    objc_msgSend(a1, "cmi_numberForIndex:valid:", 1, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_20;
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_20;
  }
  if (v8 <= a2)
  {
    objc_msgSend(a1, "cmi_numberForIndex:valid:", (v5 & 0xFFFFFFFFFFFFFFFELL) - 1, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_20;
    goto LABEL_29;
  }
  if (v5 >= 4)
  {
    v9 = v5 >> 1;
    if (v5 >> 1 <= 2)
      v9 = 2;
    v10 = v9 - 1;
    v11 = 1;
    do
    {
      objc_msgSend(a1, "cmi_floatValueForIndex:valid:", v11 + 1, &v16);
      if (!v16 || v7 >= v12)
        goto LABEL_27;
      if (v7 <= a2 && v12 > a2)
      {
        objc_msgSend(a1, "cmi_numberForIndex:valid:", v11, &v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          goto LABEL_20;
        goto LABEL_29;
      }
      v11 += 2;
      v7 = v12;
    }
    while (--v10);
  }
LABEL_16:
  v13 = 0;
LABEL_20:
  v14 = v13;

  return v14;
}

@end
