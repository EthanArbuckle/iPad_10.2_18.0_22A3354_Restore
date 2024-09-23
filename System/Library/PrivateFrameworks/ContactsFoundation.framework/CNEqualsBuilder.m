@implementation CNEqualsBuilder

+ (BOOL)isObject:(id)a3 equalToOther:(id)a4 withBlocks:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 == v9)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = objc_msgSend(a1, "evaluateBuilderBlock:remainingBlocks:", v10, &v13);
    else
      v11 = 0;
  }

  return v11;
}

+ (BOOL)isObject:(id)a3 kindOfClass:(Class)a4 andEqualToObject:(id)a5 withBlocks:(id)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  uint64_t v14;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (v10 == v9)
  {
    v12 = 1;
  }
  else if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(a1, "evaluateBuilderBlock:remainingBlocks:", v11, &v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)evaluateBuilderBlock:(id)a3 remainingBlocks:(char *)a4
{
  id v5;
  uint64_t (**v6)(_QWORD);
  uint64_t (**v7)(_QWORD);
  void *v8;
  int v9;
  const void **v10;
  BOOL v11;
  char *v13;

  v5 = a3;
  v13 = a4;
  v6 = (uint64_t (**)(_QWORD))_Block_copy(v5);
  if (v6)
  {
    v7 = v6;
    do
    {
      v8 = v7;
      v9 = v7[2](v7);
      v10 = (const void **)v13;
      v13 += 8;
      v7 = (uint64_t (**)(_QWORD))_Block_copy(*v10);

      if (v9)
        v11 = v7 == 0;
      else
        v11 = 1;
    }
    while (!v11);

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

+ (BOOL)isObject:(id)a3 equalToOther:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return 1;
}

+ (BOOL)isDouble:(double)a3 equalToOther:(double)a4 withAccuracy:(double)a5
{
  return vabdd_f64(a3, a4) < fabs(a5);
}

+ (BOOL)isString:(id)a3 localizedCaseInsensitiveEqualToOther:(id)a4
{
  __CFString *v4;
  const __CFString *v5;

  if (a3)
    v4 = (__CFString *)a3;
  else
    v4 = &stru_1E29BCC70;
  if (a4)
    v5 = (const __CFString *)a4;
  else
    v5 = &stru_1E29BCC70;
  return -[__CFString localizedCaseInsensitiveCompare:](v4, "localizedCaseInsensitiveCompare:", v5) == 0;
}

+ (BOOL)isObject:(id)a3 memberOfSameClassAndEqualTo:(id)a4 withBlocks:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 == v8)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = objc_msgSend(a1, "evaluateBuilderBlock:remainingBlocks:", v10, &v13);
    else
      v11 = 0;
  }

  return v11;
}

+ (BOOL)isObject:(id)a3 memberOfClass:(Class)a4 andEqualToObject:(id)a5 withBlocks:(id)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11 == v10)
  {
    v13 = 1;
  }
  else if (objc_msgSend(v10, "isMemberOfClass:", a4))
  {
    v13 = objc_msgSend(a1, "evaluateBuilderBlock:remainingBlocks:", v12, &v15);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isBool:(BOOL)a3 equalToOther:(BOOL)a4
{
  return a3 ^ a4 ^ 1;
}

+ (BOOL)isInteger:(int64_t)a3 equalToOther:(int64_t)a4
{
  return a3 == a4;
}

@end
