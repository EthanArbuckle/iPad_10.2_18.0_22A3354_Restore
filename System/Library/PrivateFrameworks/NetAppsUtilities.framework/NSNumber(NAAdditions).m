@implementation NSNumber(NAAdditions)

- (uint64_t)na_isSignedValue
{
  unsigned int v1;

  v1 = *(char *)objc_msgSend(objc_retainAutorelease(a1), "objCType") - 67;
  return (v1 > 0x10) | (0xBDBEu >> v1) & 1;
}

- (id)na_smallerNumber:()NAAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "compare:", v4) == -1)
    v5 = a1;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)na_valueRoundedToNearestStepValue:()NAAdditions relativeToBaseValue:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "isEqualToNumber:", &unk_1E622EAE8))
  {
    objc_msgSend(a1, "na_largerNumber:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(a1, "na_isFloatValue") & 1) != 0 || objc_msgSend(v6, "na_isFloatValue"))
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "floatValue");
      v12 = v11;
      objc_msgSend(v7, "floatValue");
      v14 = (float)(v12 - v13);
      objc_msgSend(v6, "floatValue");
      v16 = round(v14 / v15);
      objc_msgSend(v6, "floatValue");
      v18 = v17;
      objc_msgSend(v7, "floatValue");
      v20 = v19;
    }
    else if ((objc_msgSend(a1, "na_isSignedValue") & 1) != 0
           || (objc_msgSend(v6, "na_isSignedValue") & 1) != 0
           || v9 == v7)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      v16 = round((double)(objc_msgSend(a1, "longLongValue") - objc_msgSend(v7, "longLongValue"))/ (double)objc_msgSend(v6, "longLongValue"));
      v18 = (double)objc_msgSend(v6, "longLongValue");
      v20 = (double)objc_msgSend(v7, "longLongValue");
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      v16 = round((double)(unint64_t)(objc_msgSend(a1, "unsignedLongLongValue")- objc_msgSend(v7, "unsignedLongLongValue"))/ (double)(unint64_t)objc_msgSend(v6, "unsignedLongLongValue"));
      v18 = (double)(unint64_t)objc_msgSend(v6, "unsignedLongLongValue");
      v20 = (double)(unint64_t)objc_msgSend(v7, "unsignedLongLongValue");
    }
    objc_msgSend(v10, "numberWithDouble:", v20 + v16 * v18);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v21 = v8;

  return v21;
}

- (id)na_largerNumber:()NAAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "compare:", v4) == -1)
    v5 = v4;
  else
    v5 = a1;
  v6 = v5;

  return v6;
}

- (BOOL)na_isFloatValue
{
  return (*(_BYTE *)objc_msgSend(objc_retainAutorelease(a1), "objCType") & 0xFD) == 100;
}

- (id)na_absoluteValue
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  uint64_t v13;

  v1 = objc_retainAutorelease(a1);
  switch(*(_BYTE *)objc_msgSend(v1, "objCType"))
  {
    case 'c':
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = objc_msgSend(v1, "charValue");
      goto LABEL_12;
    case 'd':
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v1, "doubleValue");
      objc_msgSend(v8, "numberWithDouble:", fabs(v9));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    case 'f':
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v1, "floatValue");
      *(float *)&v12 = fabsf(v11);
      objc_msgSend(v10, "numberWithFloat:", v12);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    case 'i':
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = objc_msgSend(v1, "intValue");
      goto LABEL_12;
    case 'l':
    case 'q':
      v2 = (void *)MEMORY[0x1E0CB37E8];
      v3 = objc_msgSend(v1, "longLongValue");
      if (v3 >= 0)
        v4 = v3;
      else
        v4 = -v3;
      objc_msgSend(v2, "numberWithLongLong:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    case 's':
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = objc_msgSend(v1, "shortValue");
LABEL_12:
      if (v7 >= 0)
        v13 = v7;
      else
        v13 = -v7;
      objc_msgSend(v6, "numberWithInt:", v13);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = v1;
      break;
  }
  return v5;
}

- (uint64_t)na_compareAbsoluteValue:()NAAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "na_absoluteValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_absoluteValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
