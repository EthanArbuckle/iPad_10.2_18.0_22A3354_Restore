@implementation NSDictionary(Getters)

- (float)cmi_floatValueForKey:()Getters defaultValue:found:
{
  void *v7;
  char isKindOfClass;
  float v9;

  objc_msgSend(a1, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a5)
    *a5 = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "floatValue");
    a2 = v9;
  }

  return a2;
}

- (uint64_t)cmi_BOOLValueForKey:()Getters defaultValue:found:
{
  void *v7;
  char isKindOfClass;

  objc_msgSend(a1, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a5)
    *a5 = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
    a4 = objc_msgSend(v7, "BOOLValue");

  return a4;
}

- (uint64_t)cmi_intValueForKey:()Getters defaultValue:found:
{
  void *v7;
  char isKindOfClass;

  objc_msgSend(a1, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a5)
    *a5 = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
    a4 = objc_msgSend(v7, "intValue");

  return a4;
}

- (uint64_t)cmi_unsignedIntValueForKey:()Getters defaultValue:found:
{
  void *v7;
  char isKindOfClass;

  objc_msgSend(a1, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a5)
    *a5 = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
    a4 = objc_msgSend(v7, "unsignedIntValue");

  return a4;
}

- (double)cmi_doubleValueForKey:()Getters defaultValue:found:
{
  void *v7;
  char isKindOfClass;
  double v9;

  objc_msgSend(a1, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a5)
    *a5 = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    a2 = v9;
  }

  return a2;
}

- (__n128)cmi_simdInt2ValueForKey:()Getters defaultValue:found:
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  __n128 v13;
  char v14;

  objc_msgSend(a1, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (objc_msgSend(v7, "count") != 2)
    {
      v14 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      if (!a5)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = v6;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("X"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Y"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = objc_msgSend(v8, "intValue");
    v13.n128_u64[0] = __PAIR64__(objc_msgSend(v11, "intValue"), v12);
    a2 = v13;
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

LABEL_12:
  if (a5)
LABEL_13:
    *a5 = v14;
LABEL_14:

  return a2;
}

- (__n128)cmi_simdUInt2ValueForKey:()Getters defaultValue:found:
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  __n128 v13;
  char v14;

  objc_msgSend(a1, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (objc_msgSend(v7, "count") != 2)
    {
      v14 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      if (!a5)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = v6;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("X"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Y"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = objc_msgSend(v8, "unsignedIntValue");
    v13.n128_u64[0] = __PAIR64__(objc_msgSend(v11, "unsignedIntValue"), v12);
    a2 = v13;
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

LABEL_12:
  if (a5)
LABEL_13:
    *a5 = v14;
LABEL_14:

  return a2;
}

- (__n128)cmi_simdInt2ValueForXKey:()Getters yKey:defaultValue:found:
{
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __n128 v13;
  char v14;

  v9 = a5;
  objc_msgSend(a1, "objectForKey:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v10, "intValue");
      v13.n128_u64[0] = __PAIR64__(objc_msgSend(v11, "intValue"), v12);
      a2 = v13;
      v14 = 1;
      if (!a6)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v14 = 0;
  if (a6)
LABEL_6:
    *a6 = v14;
LABEL_7:

  return a2;
}

- (__n128)cmi_simdUInt2ValueForXKey:()Getters yKey:defaultValue:found:
{
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __n128 v13;
  char v14;

  v9 = a5;
  objc_msgSend(a1, "objectForKey:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v10, "unsignedIntValue");
      v13.n128_u64[0] = __PAIR64__(objc_msgSend(v11, "unsignedIntValue"), v12);
      a2 = v13;
      v14 = 1;
      if (!a6)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v14 = 0;
  if (a6)
LABEL_6:
    *a6 = v14;
LABEL_7:

  return a2;
}

- (__n128)cmi_simdInt4ValueForKey:()Getters defaultValue:found:
{
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  unsigned int v13;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;

  objc_msgSend(a1, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v16 = a2;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v6, "count");
  v8 = *(double *)a2.i64;
  if (v7 == 4)
  {
    v9 = 0;
    LOBYTE(v10) = 1;
    v16 = a2;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v10 & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v12 = objc_msgSend(v11, "intValue");
        v18 = v16;
        *(_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (v9 & 3))) = v12;
        v10 = 1;
        v16 = v18;
      }
      else
      {
        v10 = 0;
      }

      ++v9;
    }
    while (v9 != 4);
LABEL_11:
    if (!a5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = 0;
  v16 = a2;
  if (a5)
LABEL_12:
    *a5 = v10;
LABEL_13:
  if (v10)
    v13 = -1;
  else
    v13 = 0;
  v17 = vbslq_s8((int8x16_t)vdupq_n_s32(v13), v16, a2);

  return (__n128)v17;
}

- (__n128)cmi_simdFloat4ValueForKey:()Getters defaultValue:found:
{
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  unsigned int v13;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;

  objc_msgSend(a1, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v16 = a2;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v6, "count");
  v8 = *(double *)a2.i64;
  if (v7 == 4)
  {
    v9 = 0;
    LOBYTE(v10) = 1;
    v16 = a2;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v10 & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v11, "floatValue");
        v18 = v16;
        *(_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (v9 & 3))) = v12;
        v10 = 1;
        v16 = v18;
      }
      else
      {
        v10 = 0;
      }

      ++v9;
    }
    while (v9 != 4);
LABEL_11:
    if (!a5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = 0;
  v16 = a2;
  if (a5)
LABEL_12:
    *a5 = v10;
LABEL_13:
  if (v10)
    v13 = -1;
  else
    v13 = 0;
  v17 = vbslq_s8((int8x16_t)vdupq_n_s32(v13), v16, a2);

  return (__n128)v17;
}

- (CGFloat)cmi_cgRectForKey:()Getters defaultValue:found:
{
  const __CFDictionary *v13;
  BOOL v14;
  CGRect v16;

  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  objc_msgSend(a1, "objectForKey:");
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = CGRectMakeWithDictionaryRepresentation(v13, &v16);
    if (!v14)
    {
      v16.origin.x = a2;
      v16.origin.y = a3;
      v16.size.width = a4;
      v16.size.height = a5;
    }
  }
  else
  {
    v14 = 0;
  }
  if (a8)
    *a8 = v14;

  return v16.origin.x;
}

- (uint64_t)cmi_BOOLValueFromArrayWithKey:()Getters forIndex:defaultValue:found:
{
  void *v9;
  void *v10;
  char isKindOfClass;

  objc_msgSend(a1, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v9, "count") <= a4)
  {
    isKindOfClass = 0;
    if (!a6)
      goto LABEL_9;
LABEL_8:
    *a6 = isKindOfClass & 1;
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    a5 = objc_msgSend(v10, "BOOLValue");

  if (a6)
    goto LABEL_8;
LABEL_9:

  return a5;
}

- (uint64_t)cmi_intValueFromArrayWithKey:()Getters forIndex:defaultValue:found:
{
  void *v9;
  void *v10;
  char isKindOfClass;

  objc_msgSend(a1, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v9, "count") <= a4)
  {
    isKindOfClass = 0;
    if (!a6)
      goto LABEL_9;
LABEL_8:
    *a6 = isKindOfClass & 1;
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    a5 = objc_msgSend(v10, "intValue");

  if (a6)
    goto LABEL_8;
LABEL_9:

  return a5;
}

- (uint64_t)cmi_unsignedIntValueFromArrayWithKey:()Getters forIndex:defaultValue:found:
{
  void *v9;
  void *v10;
  char isKindOfClass;

  objc_msgSend(a1, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v9, "count") <= a4)
  {
    isKindOfClass = 0;
    if (!a6)
      goto LABEL_9;
LABEL_8:
    *a6 = isKindOfClass & 1;
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    a5 = objc_msgSend(v10, "unsignedIntValue");

  if (a6)
    goto LABEL_8;
LABEL_9:

  return a5;
}

- (float)cmi_floatValueFromArrayWithKey:()Getters forIndex:defaultValue:found:
{
  void *v9;
  void *v10;
  char isKindOfClass;
  float v12;

  objc_msgSend(a1, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v9, "count") <= a5)
  {
    isKindOfClass = 0;
    if (!a6)
      goto LABEL_9;
LABEL_8:
    *a6 = isKindOfClass & 1;
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectAtIndex:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "floatValue");
    a2 = v12;
  }

  if (a6)
    goto LABEL_8;
LABEL_9:

  return a2;
}

- (double)cmi_doubleValueFromArrayWithKey:()Getters forIndex:defaultValue:found:
{
  void *v9;
  void *v10;
  char isKindOfClass;
  double v12;

  objc_msgSend(a1, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v9, "count") <= a5)
  {
    isKindOfClass = 0;
    if (!a6)
      goto LABEL_9;
LABEL_8:
    *a6 = isKindOfClass & 1;
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectAtIndex:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "doubleValue");
    a2 = v12;
  }

  if (a6)
    goto LABEL_8;
LABEL_9:

  return a2;
}

- (__n128)cmi_simdInt2ValueFromArraysWithXKey:()Getters yKey:forIndex:defaultValue:found:
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  __n128 v17;
  char v18;

  v11 = a5;
  objc_msgSend(a1, "objectForKey:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v12, "count") <= a6
    || objc_msgSend(v13, "count") <= a6)
  {
    v18 = 0;
    if (!a7)
      goto LABEL_10;
LABEL_9:
    *a7 = v18;
    goto LABEL_10;
  }
  objc_msgSend(v12, "objectAtIndex:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = objc_msgSend(v14, "intValue");
    v17.n128_u64[0] = __PAIR64__(objc_msgSend(v15, "intValue"), v16);
    a2 = v17;
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  if (a7)
    goto LABEL_9;
LABEL_10:

  return a2;
}

- (__n128)cmi_simdUInt2ValueFromArraysWithXKey:()Getters yKey:forIndex:defaultValue:found:
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  __n128 v17;
  char v18;

  v11 = a5;
  objc_msgSend(a1, "objectForKey:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v12, "count") <= a6
    || objc_msgSend(v13, "count") <= a6)
  {
    v18 = 0;
    if (!a7)
      goto LABEL_10;
LABEL_9:
    *a7 = v18;
    goto LABEL_10;
  }
  objc_msgSend(v12, "objectAtIndex:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = objc_msgSend(v14, "intValue");
    v17.n128_u64[0] = __PAIR64__(objc_msgSend(v15, "intValue"), v16);
    a2 = v17;
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  if (a7)
    goto LABEL_9;
LABEL_10:

  return a2;
}

@end
