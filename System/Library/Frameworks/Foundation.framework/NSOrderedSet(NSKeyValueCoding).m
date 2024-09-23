@implementation NSOrderedSet(NSKeyValueCoding)

- (id)valueForKeyPath:()NSKeyValueCoding
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  void *v23;
  uint64_t v24;
  objc_super v25;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(a3, "characterAtIndex:", 0) == 64)
    {
      v7 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("."), 2, 0, v6);
      if (v8)
      {
        v9 = v7 + 1;
        v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v7 - 1, 0);
        v11 = objc_msgSend(a3, "_newSubstringWithRange:zone:", v9, v6 - v9, 0);
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(v10, "lengthOfBytesUsingEncoding:", 4);
          *(_QWORD *)&v14 = MEMORY[0x1E0C80A78](v13).n128_u64[0];
          v16 = (char *)&v24 - v15;
          objc_msgSend(v10, "getCString:maxLength:encoding:", (char *)&v24 - v15, v14);
          v17 = (void *)objc_opt_class();
          if (!NSKeyValueMethodForPattern(v17, "%sForKeyPath:", v16))
          {
            v18 = (void *)objc_opt_class();
            if (!NSKeyValueMethodForPattern(v18, "_%sForKeyPath:", v16))
            {

              v22 = v10;
              v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> valueForKeyPath:]: this class does not implement the %@ operation."), objc_opt_class(), a1, v10), 0);
              objc_exception_throw(v23);
            }
          }
          method_invoke();
          v20 = v19;

          goto LABEL_11;
        }
      }
      else
      {
        v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
      }
      v26.receiver = a1;
      v26.super_class = (Class)NSOrderedSet_0;
      v20 = objc_msgSendSuper2(&v26, sel_valueForKey_, v10);
LABEL_11:

      return v20;
    }
  }
  v25.receiver = a1;
  v25.super_class = (Class)NSOrderedSet_0;
  return objc_msgSendSuper2(&v25, sel_valueForKeyPath_, a3);
}

- (id)valueForKey:()NSKeyValueCoding
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  if (v5
    && (v6 = v5, objc_msgSend(a3, "characterAtIndex:", 0) == 64)
    && (v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0)) != 0)
  {
    v8 = (void *)v7;
    v17.receiver = a1;
    v17.super_class = (Class)NSOrderedSet_0;
    v9 = objc_msgSendSuper2(&v17, sel_valueForKey_, v7);

  }
  else
  {
    v10 = NSAllocateObjectArray(objc_msgSend(a1, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = 0;
    v12 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(a1);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "valueForKey:", a3);
          if (v15)
            v10[v11++] = v15;
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v12);
    }
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:count:", v10, v11);
    free(v10);
  }
  return v9;
}

- (NSDecimalNumber)_sumForKeyPath:()NSKeyValueCoding
{
  NSDecimalNumber *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  uint64_t v12;
  NSDecimal leftOperand;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(&leftOperand, 0, sizeof(leftOperand));
  v5 = +[NSDecimalNumber zero](NSDecimalNumber, "zero");
  if (v5)
    -[NSDecimalNumber decimalValue](v5, "decimalValue");
  else
    memset(&leftOperand, 0, sizeof(leftOperand));
  v6 = objc_msgSend(a1, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = (void *)objc_msgSend(a1, "_valueForKeyPath:ofObjectAtIndex:", a3, i);
      if (v9)
      {
        LODWORD(v12) = 0;
        objc_msgSend(v9, "decimalValue", 0, 0, v12);
        NSDecimalAdd(&leftOperand, &leftOperand, (const NSDecimal *)&v11, NSRoundBankers);
      }
    }
  }
  v11 = (__int128)leftOperand;
  LODWORD(v12) = *(_DWORD *)&leftOperand._mantissa[6];
  return +[NSDecimalNumber decimalNumberWithDecimal:](NSDecimalNumber, "decimalNumberWithDecimal:", &v11);
}

- (uint64_t)_avgForKeyPath:()NSKeyValueCoding
{
  uint64_t result;

  result = objc_msgSend(a1, "count");
  if (result)
    return objc_msgSend((id)objc_msgSend(a1, "_sumForKeyPath:", a3), "decimalNumberByDividingBy:", +[NSDecimalNumber numberWithUnsignedInteger:](NSDecimalNumber, "numberWithUnsignedInteger:", result));
  return result;
}

- (NSNumber)_countForKeyPath:()NSKeyValueCoding
{
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a1, "count"));
}

- (void)_maxForKeyPath:()NSKeyValueCoding
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend(a1, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = objc_msgSend(a1, "_valueForKeyPath:ofObjectAtIndex:", a3, v7);
    if (v9)
    {
      v10 = (void *)v9;
      if (!v8 || objc_msgSend(v8, "compare:", v9) == -1)
        v8 = v10;
    }
    ++v7;
  }
  while (v6 != v7);
  return v8;
}

- (void)_minForKeyPath:()NSKeyValueCoding
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend(a1, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = objc_msgSend(a1, "_valueForKeyPath:ofObjectAtIndex:", a3, v7);
    if (v9)
    {
      v10 = (void *)v9;
      if (!v8 || objc_msgSend(v8, "compare:", v9) == 1)
        v8 = v10;
    }
    ++v7;
  }
  while (v6 != v7);
  return v8;
}

- (uint64_t)setValue:()NSKeyValueCoding forKey:
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a1);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setValue:forKey:", a3, a4);
      }
      while (v8 != v10);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

@end
