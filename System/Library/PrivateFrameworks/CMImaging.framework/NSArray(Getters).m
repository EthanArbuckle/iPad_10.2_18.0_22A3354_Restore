@implementation NSArray(Getters)

- (uint64_t)cmi_BOOLValueForIndex:()Getters
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)cmi_intValueForIndex:()Getters
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (uint64_t)cmi_unsignedIntValueForIndex:()Getters
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)cmi_floatValueForIndex:()Getters
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)cmi_BOOLValueForIndex:()Getters valid:
{
  void *v7;
  char isKindOfClass;
  uint64_t v9;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v9 = 0;
    isKindOfClass = 0;
    if (!a4)
      return v9;
    goto LABEL_8;
  }
  objc_msgSend(a1, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 0;

  if (a4)
LABEL_8:
    *a4 = isKindOfClass & 1;
  return v9;
}

- (uint64_t)cmi_intValueForIndex:()Getters valid:
{
  void *v7;
  char isKindOfClass;
  uint64_t v9;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v9 = 0;
    isKindOfClass = 0;
    if (!a4)
      return v9;
    goto LABEL_8;
  }
  objc_msgSend(a1, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = objc_msgSend(v7, "intValue");
  else
    v9 = 0;

  if (a4)
LABEL_8:
    *a4 = isKindOfClass & 1;
  return v9;
}

- (uint64_t)cmi_unsignedIntValueForIndex:()Getters valid:
{
  void *v7;
  char isKindOfClass;
  uint64_t v9;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v9 = 0;
    isKindOfClass = 0;
    if (!a4)
      return v9;
    goto LABEL_8;
  }
  objc_msgSend(a1, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = objc_msgSend(v7, "unsignedIntValue");
  else
    v9 = 0;

  if (a4)
LABEL_8:
    *a4 = isKindOfClass & 1;
  return v9;
}

- (float)cmi_floatValueForIndex:()Getters valid:
{
  void *v7;
  char isKindOfClass;
  float v9;
  float v10;

  if (objc_msgSend(a1, "count") <= a3)
  {
    isKindOfClass = 0;
    v9 = 0.0;
    if (!a4)
      return v9;
LABEL_7:
    *a4 = isKindOfClass & 1;
    return v9;
  }
  objc_msgSend(a1, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = 0.0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v10;
  }

  if (a4)
    goto LABEL_7;
  return v9;
}

- (id)cmi_numberForIndex:()Getters valid:
{
  void *v7;
  char isKindOfClass;
  id v9;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v9 = 0;
    isKindOfClass = 0;
    if (!a4)
      return v9;
    goto LABEL_8;
  }
  objc_msgSend(a1, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = v7;
  else
    v9 = 0;

  if (a4)
LABEL_8:
    *a4 = isKindOfClass & 1;
  return v9;
}

- (BOOL)cmi_copyBoolValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  BOOL v10;
  char v11;

  result = 0;
  v11 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
    {
      return 0;
    }
    else if (v9 <= v7)
    {
      return 1;
    }
    else
    {
      do
      {
        *v8++ = objc_msgSend(a1, "cmi_BOOLValueForIndex:valid:", v7, &v11);
        result = v11 != 0;
        ++v7;
        if (v11)
          v10 = v7 >= v9;
        else
          v10 = 1;
      }
      while (!v10);
    }
  }
  return result;
}

- (BOOL)cmi_copyCharValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  int v10;
  BOOL v11;
  char v12;

  result = 0;
  v12 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
      return 0;
    if (v9 > v7)
    {
      while (1)
      {
        v10 = objc_msgSend(a1, "cmi_intValueForIndex:valid:", v7, &v12);
        if (v10 != (char)v10)
          break;
        *v8++ = v10;
        result = v12 != 0;
        ++v7;
        if (v12)
          v11 = v7 >= v9;
        else
          v11 = 1;
        if (v11)
          return result;
      }
      return 0;
    }
    return 1;
  }
  return result;
}

- (BOOL)cmi_copyUnsignedCharValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unsigned int v10;
  BOOL v11;
  char v12;

  result = 0;
  v12 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
      return 0;
    if (v9 > v7)
    {
      while (1)
      {
        v10 = objc_msgSend(a1, "cmi_unsignedIntValueForIndex:valid:", v7, &v12);
        if (v10 > 0xFF)
          break;
        *v8++ = v10;
        result = v12 != 0;
        ++v7;
        if (v12)
          v11 = v7 >= v9;
        else
          v11 = 1;
        if (v11)
          return result;
      }
      return 0;
    }
    return 1;
  }
  return result;
}

- (BOOL)cmi_copyShortValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _WORD *v8;
  unint64_t v9;
  int v10;
  BOOL v11;
  char v12;

  result = 0;
  v12 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
      return 0;
    if (v9 > v7)
    {
      while (1)
      {
        v10 = objc_msgSend(a1, "cmi_intValueForIndex:valid:", v7, &v12);
        if (v10 != (__int16)v10)
          break;
        *v8++ = v10;
        result = v12 != 0;
        ++v7;
        if (v12)
          v11 = v7 >= v9;
        else
          v11 = 1;
        if (v11)
          return result;
      }
      return 0;
    }
    return 1;
  }
  return result;
}

- (BOOL)cmi_copyUnsignedShortValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _WORD *v8;
  unint64_t v9;
  unsigned int v10;
  BOOL v11;
  char v12;

  result = 0;
  v12 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
      return 0;
    if (v9 > v7)
    {
      while (1)
      {
        v10 = objc_msgSend(a1, "cmi_unsignedIntValueForIndex:valid:", v7, &v12);
        if (HIWORD(v10))
          break;
        *v8++ = v10;
        result = v12 != 0;
        ++v7;
        if (v12)
          v11 = v7 >= v9;
        else
          v11 = 1;
        if (v11)
          return result;
      }
      return 0;
    }
    return 1;
  }
  return result;
}

- (BOOL)cmi_copyIntValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  BOOL v10;
  char v11;

  result = 0;
  v11 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
    {
      return 0;
    }
    else if (v9 <= v7)
    {
      return 1;
    }
    else
    {
      do
      {
        *v8++ = objc_msgSend(a1, "cmi_intValueForIndex:valid:", v7, &v11);
        result = v11 != 0;
        ++v7;
        if (v11)
          v10 = v7 >= v9;
        else
          v10 = 1;
      }
      while (!v10);
    }
  }
  return result;
}

- (BOOL)cmi_copyUnsignedIntValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  BOOL v10;
  char v11;

  result = 0;
  v11 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
    {
      return 0;
    }
    else if (v9 <= v7)
    {
      return 1;
    }
    else
    {
      do
      {
        *v8++ = objc_msgSend(a1, "cmi_unsignedIntValueForIndex:valid:", v7, &v11);
        result = v11 != 0;
        ++v7;
        if (v11)
          v10 = v7 >= v9;
        else
          v10 = 1;
      }
      while (!v10);
    }
  }
  return result;
}

- (BOOL)cmi_copyFloatValuesToBuffer:()Getters startingIndex:count:
{
  _BOOL8 result;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  int v10;
  BOOL v11;
  char v12;

  result = 0;
  v12 = 1;
  if (a3 && a5)
  {
    v7 = a4;
    v8 = a3;
    v9 = a5 + a4;
    if (a5 + a4 > objc_msgSend(a1, "count"))
    {
      return 0;
    }
    else if (v9 <= v7)
    {
      return 1;
    }
    else
    {
      do
      {
        objc_msgSend(a1, "cmi_floatValueForIndex:valid:", v7, &v12);
        *v8++ = v10;
        result = v12 != 0;
        ++v7;
        if (v12)
          v11 = v7 >= v9;
        else
          v11 = 1;
      }
      while (!v11);
    }
  }
  return result;
}

- (uint64_t)cmi_copy2DNestedBoolValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v12;
  uint64_t v14;
  unint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = 0;
  if (a3 && a6)
  {
    v12 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v12)
    {
      v17 = a6 - 1;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v18, "cmi_copyBoolValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v17-- != 0)
        {
          v14 += a4;
          ++v12;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

- (uint64_t)cmi_copy2DNestedCharValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v12;
  uint64_t v14;
  unint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = 0;
  if (a3 && a6)
  {
    v12 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v12)
    {
      v17 = a6 - 1;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v18, "cmi_copyCharValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v17-- != 0)
        {
          v14 += a4;
          ++v12;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

- (uint64_t)cmi_copy2DNestedUnsignedCharValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v12;
  uint64_t v14;
  unint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = 0;
  if (a3 && a6)
  {
    v12 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v12)
    {
      v17 = a6 - 1;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v18, "cmi_copyUnsignedCharValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v17-- != 0)
        {
          v14 += a4;
          ++v12;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

- (uint64_t)cmi_copy2DNestedShortValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v8 = 0;
  if (a3 && (a4 & 1) == 0 && a6)
  {
    v13 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v13)
    {
      v17 = a4 >> 1;
      v18 = a6 - 1;
      v19 = 2 * v17;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v20, "cmi_copyShortValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v18-- != 0)
        {
          ++v13;
          v14 += v19;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

- (uint64_t)cmi_copy2DNestedUnsignedShortValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v8 = 0;
  if (a3 && (a4 & 1) == 0 && a6)
  {
    v13 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v13)
    {
      v17 = a4 >> 1;
      v18 = a6 - 1;
      v19 = 2 * v17;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v20, "cmi_copyUnsignedShortValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v18-- != 0)
        {
          ++v13;
          v14 += v19;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

- (uint64_t)cmi_copy2DNestedIntValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v8 = 0;
  if (a3 && (a4 & 3) == 0 && a6)
  {
    v13 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v13)
    {
      v17 = a4 >> 2;
      v18 = a6 - 1;
      v19 = 4 * v17;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v20, "cmi_copyIntValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v18-- != 0)
        {
          ++v13;
          v14 += v19;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

- (uint64_t)cmi_copy2DNestedUnsignedIntValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v8 = 0;
  if (a3 && (a4 & 3) == 0 && a6)
  {
    v13 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v13)
    {
      v17 = a4 >> 2;
      v18 = a6 - 1;
      v19 = 4 * v17;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v20, "cmi_copyUnsignedIntValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v18-- != 0)
        {
          ++v13;
          v14 += v19;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

- (uint64_t)cmi_copy2DNestedFloatValuesToBuffer:()Getters bufferStride:outerStartingIndex:outerCount:innerStartingIndex:innerCount:
{
  uint64_t v8;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v8 = 0;
  if (a3 && (a4 & 3) == 0 && a6)
  {
    v13 = a5;
    v14 = a3;
    v16 = a6 + a5;
    if (a6 + a5 > objc_msgSend(a1, "count"))
      return 0;
    if (v16 > v13)
    {
      v17 = a4 >> 2;
      v18 = a6 - 1;
      v19 = 4 * v17;
      while (1)
      {
        objc_msgSend(a1, "objectAtIndex:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v8 = objc_msgSend(v20, "cmi_copyFloatValuesToBuffer:startingIndex:count:", v14, a7, a8);

        if (v18-- != 0)
        {
          ++v13;
          v14 += v19;
          if ((v8 & 1) != 0)
            continue;
        }
        return v8;
      }

      return 0;
    }
    return 1;
  }
  return v8;
}

@end
