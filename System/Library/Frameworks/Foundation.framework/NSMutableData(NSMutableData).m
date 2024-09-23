@implementation NSMutableData(NSMutableData)

- (uint64_t)_isCompact
{
  return 1;
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (id)dataWithCapacity:()NSMutableData
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithCapacity:", a3);
}

+ (id)dataWithLength:()NSMutableData
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithLength:", a3);
}

+ (id)allocWithZone:()NSMutableData
{
  if ((objc_class *)objc_opt_self() == a1)
    return +[NSData _alloc](NSConcreteMutableData, "_alloc");
  else
    return NSAllocateObject(a1, 0, a3);
}

- (void)replaceBytesInRange:()NSMutableData withBytes:length:
{
  uint64_t v6;
  unint64_t v13;
  unint64_t v14;
  size_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  size_t v22;
  int v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  const __CFString *v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  uint64_t v33;
  unint64_t v34;
  NSUInteger v35;
  NSRange v36;
  NSRange v37;
  NSRange v38;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v6, *MEMORY[0x1E0C9AA10]);
  v13 = objc_msgSend(a1, "length");
  if (__CFADD__(a4, a3))
  {
    v25 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v36.location = a3;
    v36.length = a4;
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v25, NSStringFromRange(v36), v33);
    goto LABEL_35;
  }
  v14 = v13;
  v15 = v13 - (a3 + a4);
  if (v13 < a3 + a4)
  {
    v27 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v28 = v27;
    if (a4)
    {
      v38.location = a3;
      v38.length = a4;
      v32 = NSStringFromRange(v38);
      v34 = v14;
      v31 = v28;
      v29 = CFSTR("%@: range %@ exceeds data length %lu");
    }
    else
    {
      v32 = (NSString *)a3;
      v34 = v14;
      v31 = v27;
      v29 = CFSTR("%@: location %lu exceeds data length %lu");
    }
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v31, v32, v34);
LABEL_35:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v26, 0));
  }
  if (__CFADD__(a6, v13 - a4))
  {
    v30 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v37.location = v14 - a4;
    v37.length = a6;
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v30, NSStringFromRange(v37), v33);
    goto LABEL_35;
  }
  v16 = v13 - a4 + a6;
  v17 = objc_msgSend(a1, "mutableBytes");
  v18 = v17;
  v19 = (char *)a5;
  if (a5)
  {
    v19 = (char *)a5;
    if (v17)
    {
      v19 = (char *)a5;
      if (v17 + v14 > a5)
      {
        v19 = (char *)a5;
        if (v17 < a5 + a6)
        {
          v20 = (unint64_t)malloc_type_malloc(a6, 0xE8FA8E9DuLL);
          v19 = (char *)v20;
          v21 = (char *)a5;
          v22 = a6;
          if (a6 >= 0x80000)
          {
            v22 = a6;
            v21 = (char *)a5;
            if (((*MEMORY[0x1E0C85AD8] - 1) & (v20 | a5)) != 0
              || (malloc_default_zone(),
                  v23 = malloc_zone_claimed_address(),
                  v20 = (unint64_t)v19,
                  v22 = a6,
                  v21 = (char *)a5,
                  v23))
            {
LABEL_15:
              memmove((void *)v20, v21, v22);
              goto LABEL_16;
            }
            v35 = -*MEMORY[0x1E0C85AD8] & a6;
            NSCopyMemoryPages((const void *)a5, v19, v35);
            v21 = (char *)(a5 + v35);
            v20 = (unint64_t)&v19[v35];
            v22 = a6 - v35;
          }
          if (!v22)
            goto LABEL_16;
          goto LABEL_15;
        }
      }
    }
  }
LABEL_16:
  if (v16 > v14)
  {
    objc_msgSend(a1, "setLength:", v16);
    v18 = objc_msgSend(a1, "mutableBytes");
  }
  if (v16 != v14)
    memmove((void *)(v18 + a3 + a6), (const void *)(v18 + a3 + a4), v15);
  if (a6)
  {
    v24 = (void *)(v18 + a3);
    if (v19)
      memmove(v24, v19, a6);
    else
      bzero(v24, a6);
  }
  if (v19 != (char *)a5)
    free(v19);
  if (v16 < v14)
    objc_msgSend(a1, "setLength:", v16);
}

- (void)mutableBytes
{
  uint64_t v2;
  objc_class *v5;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v2, *MEMORY[0x1E0C9AA10]);
  v5 = NSClassFromString((NSString *)CFSTR("NSMutableData"));
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)setLength:()NSMutableData
{
  uint64_t v2;
  objc_class *v5;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v2, *MEMORY[0x1E0C9AA10]);
  v5 = NSClassFromString((NSString *)CFSTR("NSMutableData"));
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)appendBytes:()NSMutableData length:
{
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  char *v14;
  _QWORD *v15;
  int v16;
  NSUInteger v17;
  NSUInteger v18;
  _QWORD *v19;
  char *v20;
  NSUInteger v21;
  NSString *v22;
  void *v23;
  NSRange v24;

  v5 = a4;
  if (*MEMORY[0x1E0C9AA88])
  {
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v4, *MEMORY[0x1E0C9AA10]);
    if (!v5)
      return;
  }
  else if (!a4)
  {
    return;
  }
  v9 = objc_msgSend(a1, "length");
  if (__CFADD__(v5, v9))
  {
    v22 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v24.location = v9;
    v24.length = v5;
    v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v22, NSStringFromRange(v24)), 0);
    objc_exception_throw(v23);
  }
  v10 = objc_msgSend(a1, "mutableBytes");
  v11 = a3;
  if (v10)
  {
    v11 = a3;
    if (v10 + v9 > a3)
    {
      v11 = a3;
      if (v10 < a3 + v5)
      {
        v12 = (unint64_t)malloc_type_malloc(v5, 0x80689A48uLL);
        v11 = v12;
        v13 = v5;
        v14 = (char *)a3;
        if (v5 < 0x80000)
          goto LABEL_12;
        v15 = (_QWORD *)MEMORY[0x1E0C85AD8];
        v13 = v5;
        v14 = (char *)a3;
        if (((*MEMORY[0x1E0C85AD8] - 1) & (v12 | a3)) != 0)
          goto LABEL_12;
        malloc_default_zone();
        v16 = malloc_zone_claimed_address();
        v12 = v11;
        v13 = v5;
        v14 = (char *)a3;
        if (v16)
          goto LABEL_12;
        v17 = -*v15 & v5;
        NSCopyMemoryPages((const void *)a3, (void *)v11, v17);
        v13 = v5 - v17;
        if (v5 != v17)
        {
          v14 = (char *)(a3 + v17);
          v12 = v11 + v17;
LABEL_12:
          memmove((void *)v12, v14, v13);
        }
      }
    }
  }
  objc_msgSend(a1, "setLength:", v9 + v5);
  v18 = objc_msgSend(a1, "mutableBytes") + v9;
  if (v5 < 0x80000
    || (v19 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v18 | v11)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    v20 = (char *)v11;
LABEL_17:
    memmove((void *)v18, v20, v5);
    goto LABEL_18;
  }
  v21 = -*v19 & v5;
  NSCopyMemoryPages((const void *)v11, (void *)v18, v21);
  v5 -= v21;
  if (v5)
  {
    v20 = (char *)(v11 + v21);
    v18 += v21;
    goto LABEL_17;
  }
LABEL_18:
  if (v11 != a3)
    free((void *)v11);
}

- (void)appendData:()NSMutableData
{
  uint64_t v3;
  uint64_t v7;
  size_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  char *v16;
  size_t v17;
  const void *v18;
  NSUInteger v19;
  _QWORD *v20;
  char *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSString *v25;
  void *v26;
  NSRange v27;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v3, *MEMORY[0x1E0C9AA10]);
  v7 = objc_msgSend(a3, "length");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(a3, "bytes");
    v10 = objc_msgSend(a1, "length");
    v11 = objc_msgSend(a3, "length");
    if (__CFADD__(v11, v10))
    {
      v24 = v11;
      v25 = _NSMethodExceptionProem((objc_class *)a1, a2);
      v27.location = v10;
      v27.length = v24;
      v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v25, NSStringFromRange(v27)), 0);
      objc_exception_throw(v26);
    }
    v12 = objc_msgSend(a1, "mutableBytes");
    if (v12 && v9 < v12 + v10 && v12 < v9 + v8)
    {
      v13 = (unint64_t)malloc_type_malloc(v8, 0x49FE5E55uLL);
      v14 = v13;
      if (v8 < 0x80000
        || (v15 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v13 | v9)) != 0)
        || (malloc_default_zone(), malloc_zone_claimed_address()))
      {
        v16 = (char *)v14;
        v17 = v8;
        v18 = (const void *)v9;
      }
      else
      {
        v23 = v8 & -*v15;
        NSCopyMemoryPages((const void *)v9, (void *)v14, v23);
        v17 = v8 - v23;
        if (v8 == v23)
          goto LABEL_14;
        v18 = (const void *)(v9 + v23);
        v16 = (char *)(v14 + v23);
      }
      memmove(v16, v18, v17);
    }
    else
    {
      v14 = v9;
    }
LABEL_14:
    objc_msgSend(a1, "setLength:", v10 + v8);
    v19 = objc_msgSend(a1, "mutableBytes") + v10;
    if (v8 < 0x80000
      || (v20 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v19 | v14)) != 0)
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      v21 = (char *)v14;
    }
    else
    {
      v22 = v8 & -*v20;
      NSCopyMemoryPages((const void *)v14, (void *)v19, v22);
      v8 -= v22;
      if (!v8)
      {
LABEL_19:
        if (v14 != v9)
          free((void *)v14);
        return;
      }
      v21 = (char *)(v14 + v22);
      v19 += v22;
    }
    memmove((void *)v19, v21, v8);
    goto LABEL_19;
  }
}

- (uint64_t)increaseLengthBy:()NSMutableData
{
  uint64_t v3;
  uint64_t v7;
  NSString *v9;
  void *v10;
  _QWORD *v11;
  NSUInteger v12;
  NSString *v13;
  NSRange v14;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(objc_class *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v3, *MEMORY[0x1E0C9AA10]);
  if (a3 >= 0x8000000000000001)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem(a1, a2), "extra length", a3, 0x8000000000000000);
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_8;
  }
  v7 = -[objc_class length](a1, "length");
  if (__CFADD__(a3, v7))
  {
    v12 = v7;
    v13 = _NSMethodExceptionProem(a1, a2);
    v14.location = v12;
    v14.length = a3;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v13, NSStringFromRange(v14));
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", *v11, v9, 0));
  }
  return -[objc_class setLength:](a1, "setLength:", v7 + a3);
}

- (void)replaceBytesInRange:()NSMutableData withBytes:
{
  uint64_t v5;
  NSUInteger v7;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  char *v17;
  _QWORD *v18;
  int v19;
  NSUInteger v20;
  NSUInteger v21;
  _QWORD *v22;
  char *v23;
  NSUInteger v24;
  NSString *v25;
  NSString *v26;
  uint64_t v27;
  NSRange v28;

  v7 = a4;
  if (*MEMORY[0x1E0C9AA88])
  {
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v5, *MEMORY[0x1E0C9AA10]);
    if (!v7)
      return;
  }
  else if (!a4)
  {
    return;
  }
  v11 = objc_msgSend(a1, "length");
  v12 = v11;
  if (a3 > v11)
  {
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: location %lu exceeds data length %lu"), _NSMethodExceptionProem((objc_class *)a1, a2), a3, v11);
    goto LABEL_29;
  }
  if (__CFADD__(v7, a3))
  {
    v26 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v28.location = a3;
    v28.length = v7;
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v26, NSStringFromRange(v28), v27);
LABEL_29:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v25, 0));
  }
  v13 = (char *)a5;
  if (v11 < a3 + v7)
  {
    v14 = objc_msgSend(a1, "mutableBytes");
    v13 = (char *)a5;
    if (!v14)
      goto LABEL_15;
    v13 = (char *)a5;
    if (v14 + v12 <= a5)
      goto LABEL_15;
    v13 = (char *)a5;
    if (v14 >= a5 + v7)
      goto LABEL_15;
    v15 = (unint64_t)malloc_type_malloc(v7, 0x98FE564uLL);
    v13 = (char *)v15;
    v16 = v7;
    v17 = (char *)a5;
    if (v7 >= 0x80000)
    {
      v18 = (_QWORD *)MEMORY[0x1E0C85AD8];
      v16 = v7;
      v17 = (char *)a5;
      if (((*MEMORY[0x1E0C85AD8] - 1) & (v15 | a5)) == 0)
      {
        malloc_default_zone();
        v19 = malloc_zone_claimed_address();
        v15 = (unint64_t)v13;
        v16 = v7;
        v17 = (char *)a5;
        if (!v19)
        {
          v20 = v7 & -*v18;
          NSCopyMemoryPages((const void *)a5, v13, v20);
          v16 = v7 - v20;
          if (v7 == v20)
          {
LABEL_15:
            objc_msgSend(a1, "setLength:", a3 + v7);
            goto LABEL_16;
          }
          v17 = (char *)(a5 + v20);
          v15 = (unint64_t)&v13[v20];
        }
      }
    }
    memmove((void *)v15, v17, v16);
    goto LABEL_15;
  }
LABEL_16:
  v21 = objc_msgSend(a1, "mutableBytes") + a3;
  if (v7 < 0x80000
    || (v22 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v21 | a5)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    v23 = (char *)a5;
LABEL_20:
    memmove((void *)v21, v23, v7);
    goto LABEL_21;
  }
  v24 = v7 & -*v22;
  NSCopyMemoryPages((const void *)a5, (void *)v21, v24);
  v7 -= v24;
  if (v7)
  {
    v23 = (char *)(a5 + v24);
    v21 += v24;
    goto LABEL_20;
  }
LABEL_21:
  if (v13 != (char *)a5)
    free(v13);
}

- (void)resetBytesInRange:()NSMutableData
{
  uint64_t v4;
  unint64_t v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  NSRange v13;

  if (*MEMORY[0x1E0C9AA88])
  {
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v4, *MEMORY[0x1E0C9AA10]);
    if (!a4)
      return;
  }
  else if (!a4)
  {
    return;
  }
  v9 = objc_msgSend(a1, "length");
  if (a3 > v9)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: location %lu exceeds data length %lu"), _NSMethodExceptionProem((objc_class *)a1, a2), a3, v9);
    goto LABEL_12;
  }
  if (__CFADD__(a4, a3))
  {
    v11 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v13.location = a3;
    v13.length = a4;
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v11, NSStringFromRange(v13), v12);
LABEL_12:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v10, 0));
  }
  if (v9 < a3 + a4)
    objc_msgSend(a1, "setLength:");
  bzero((void *)(objc_msgSend(a1, "mutableBytes") + a3), a4);
}

- (uint64_t)setData:()NSMutableData
{
  uint64_t v3;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v3, *MEMORY[0x1E0C9AA10]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__NSMutableData_NSMutableData__setData___block_invoke;
  v7[3] = &unk_1E0F4D100;
  v7[4] = a1;
  objc_msgSend(a3, "enumerateByteRangesUsingBlock:", v7);
  return objc_msgSend(a1, "setLength:", objc_msgSend(a3, "length"));
}

- (void)initWithCapacity:()NSMutableData
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSMutableData"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)initWithLength:()NSMutableData
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "initWithCapacity:");
  objc_msgSend(v4, "setLength:", a3);
  return v4;
}

+ (_NSClrDatM)_newZeroingDataWithBytes:()NSMutableData length:
{
  return -[NSConcreteMutableData initWithBytes:length:copy:deallocator:]([_NSClrDatM alloc], "initWithBytes:length:copy:deallocator:", a3, a4, 1, 0);
}

@end
