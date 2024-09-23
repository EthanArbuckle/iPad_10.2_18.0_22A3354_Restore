@implementation NSMutableOrderedSet

- (void)intersectSet:(NSSet *)other
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  CFStringRef v18;
  NSException *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSException *v24;
  uint64_t v25;
  size_t v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other)
      goto LABEL_4;
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    v20 = _os_log_pack_size();
    v22 = (char *)&v25 - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136315138;
    *(_QWORD *)(v23 + 4) = "-[NSMutableOrderedSet intersectSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet intersectSet:]");
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
    objc_exception_throw(v24);
  }
LABEL_4:
  v6 = -[NSOrderedSet count](self, "count");
  if (v6 >> 60)
  {
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v19 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v18, 0);
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  if (v6 <= 1)
    v6 = 1;
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = (uint64_t *)((char *)&v25 - v9);
  v26 = 0;
  if (v11 >= 0x101)
  {
    v10 = (uint64_t *)_CFCreateArrayStorage(v8, 0, &v26);
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  v14 = v10;
  if (v13)
  {
    v15 = *(_QWORD *)v29;
    v14 = v10;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(self);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (!-[NSSet countForObject:](other, "countForObject:", v17))
          *v14++ = v17;
      }
      v13 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v13);
  }
  while (v10 < v14)
    -[NSMutableOrderedSet removeObject:](self, "removeObject:", *v10++);
  free(v12);
}

- (void)removeObject:(id)object
{
  uint64_t v3;
  NSUInteger v6;

  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v6 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", object);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v6);
}

- (void)addObject:(id)object
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (object)
      goto LABEL_3;
LABEL_5:
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableOrderedSet addObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableOrderedSet addObject:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (!object)
    goto LABEL_5;
LABEL_3:
  -[NSMutableOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", object, -[NSOrderedSet count](self, "count"));
}

uint64_t __57__NSMutableOrderedSet_sortRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3));
}

- (void)unionSet:(NSSet *)other
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other)
      goto LABEL_4;
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSMutableOrderedSet unionSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet unionSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
LABEL_4:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(other);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = -[NSSet countForObject:](other, "countForObject:", v10);
        if (v11)
        {
          v12 = v11;
          do
          {
            --v12;
            -[NSMutableOrderedSet addObject:](self, "addObject:", v10);
          }
          while (v12);
        }
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v7);
  }
}

- (void)minusSet:(NSSet *)other
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other)
      goto LABEL_4;
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSMutableOrderedSet minusSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet minusSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
LABEL_4:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(other);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = -[NSSet countForObject:](other, "countForObject:", v10);
        if (v11)
        {
          v12 = v11;
          do
          {
            --v12;
            -[NSMutableOrderedSet removeObject:](self, "removeObject:", v10);
          }
          while (v12);
        }
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v7);
  }
}

- (void)addObjectsFromArray:(NSArray *)array
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!array)
      goto LABEL_4;
  }
  else if (!array)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)array) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v8 = (char *)v11 - ((MEMORY[0x1E0C80A78](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "-[NSMutableOrderedSet addObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet addObjectsFromArray:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
LABEL_4:
  -[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", array, 0, -[NSArray count](array, "count"), -[NSOrderedSet count](self, "count"));
}

- (void)intersectOrderedSet:(NSOrderedSet *)other
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  NSException *v22;
  CFStringRef v23;
  NSException *v24;
  uint64_t v25;
  size_t v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other)
      goto LABEL_4;
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    v18 = _os_log_pack_size();
    v20 = (char *)&v25 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSMutableOrderedSet intersectOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet intersectOrderedSet:]");
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
    objc_exception_throw(v22);
  }
LABEL_4:
  if (self != (NSMutableOrderedSet *)other)
  {
    v6 = -[NSOrderedSet count](self, "count");
    if (v6 >> 60)
    {
      v23 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
      v24 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v23, 0);
      CFRelease(v23);
      objc_exception_throw(v24);
    }
    if (v6 <= 1)
      v6 = 1;
    v8 = MEMORY[0x1E0C80A78](v6, v7);
    v10 = (uint64_t *)((char *)&v25 - v9);
    v26 = 0;
    if (v11 >= 0x101)
    {
      v10 = (uint64_t *)_CFCreateArrayStorage(v8, 0, &v26);
      v12 = v10;
    }
    else
    {
      v12 = 0;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    v14 = v10;
    if (v13)
    {
      v15 = *(_QWORD *)v29;
      v14 = v10;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(self);
          v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!-[NSOrderedSet countForObject:](other, "countForObject:", v17))
            *v14++ = v17;
        }
        v13 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v13);
    }
    while (v10 < v14)
      -[NSMutableOrderedSet removeObject:](self, "removeObject:", *v10++);
    free(v12);
  }
}

- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  double v23;
  NSException *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  NSException *v29;
  CFStringRef v30;
  NSException *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSException *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  double v42;
  NSException *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  double v49;
  NSException *v50;
  size_t v51[2];

  length = a4.length;
  location = a4.location;
  v51[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v32 = _os_log_pack_size();
    v34 = (char *)v51 - ((MEMORY[0x1E0C80A78](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    v35 = _os_log_pack_fill();
    *(_DWORD *)v35 = 136315138;
    *(_QWORD *)(v35 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v34, v32);
    objc_exception_throw(v36);
  }
LABEL_4:
  v11 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      v19 = _os_log_pack_size();
      v21 = (char *)v51 - ((MEMORY[0x1E0C80A78](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = _os_log_pack_fill();
      v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v23, "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length);
      v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v21, v19);
      objc_exception_throw(v24);
    }
    v37 = v11;
    v38 = _os_log_pack_size();
    v40 = (char *)v51 - ((MEMORY[0x1E0C80A78](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = _os_log_pack_fill();
    v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v41, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length, --v37);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v42, "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", location, length, v37);
    v43 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v40, v38);
    objc_exception_throw(v43);
  }
  v12 = -[NSOrderedSet count](self, "count");
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      v25 = _os_log_pack_size();
      v27 = (char *)v51 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = _os_log_pack_fill();
      *(_DWORD *)v28 = 136315394;
      *(_QWORD *)(v28 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]";
      *(_WORD *)(v28 + 12) = 2048;
      *(_QWORD *)(v28 + 14) = a5;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", a5);
      v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
      objc_exception_throw(v29);
    }
    v44 = v12;
    v45 = _os_log_pack_size();
    v47 = (char *)v51 - ((MEMORY[0x1E0C80A78](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
    v48 = _os_log_pack_fill();
    v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", a5, --v44);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v49, "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]", a5, v44);
    v50 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v47, v45);
    objc_exception_throw(v50);
  }
  if (length >> 60)
  {
    v30 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v31 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v30, 0);
    CFRelease(v30);
    objc_exception_throw(v31);
  }
  if (length <= 1)
    v14 = 1;
  else
    v14 = length;
  v15 = MEMORY[0x1E0C80A78](v14, v13);
  v17 = (char *)v51 - v16;
  v51[0] = 0;
  if (length >= 0x101)
  {
    v17 = (char *)_CFCreateArrayStorage(v15, 0, v51);
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v17, location, length, v51[0]);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v17, length, a5);
  free(v18);
}

+ (NSMutableOrderedSet)orderedSetWithCapacity:(NSUInteger)numItems
{
  return (NSMutableOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:", numItems);
}

- (void)unionOrderedSet:(NSOrderedSet *)other
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t i;
  unint64_t v14;
  CFStringRef v15;
  NSException *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSException *v21;
  size_t v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other)
      goto LABEL_4;
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    v17 = _os_log_pack_size();
    v19 = (char *)v22 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315138;
    *(_QWORD *)(v20 + 4) = "-[NSMutableOrderedSet unionOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet unionOrderedSet:]");
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
    objc_exception_throw(v21);
  }
LABEL_4:
  v6 = -[NSOrderedSet count](other, "count");
  v8 = v6;
  if (v6 >> 60)
  {
    v15 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v16 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v15, 0);
    CFRelease(v15);
    objc_exception_throw(v16);
  }
  if (v6 <= 1)
    v6 = 1;
  v9 = MEMORY[0x1E0C80A78](v6, v7);
  v11 = (char *)v22 - v10;
  v22[0] = 0;
  if (v8 >= 0x101)
  {
    v11 = (char *)_CFCreateArrayStorage(v9, 0, v22);
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  -[NSOrderedSet getObjects:range:](other, "getObjects:range:", v11, 0, v8, v22[0]);
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      v14 = -[NSOrderedSet countForObject:](other, "countForObject:", *(_QWORD *)&v11[8 * i]) + 1;
      while (--v14)
        -[NSMutableOrderedSet addObject:](self, "addObject:", *(_QWORD *)&v11[8 * i]);
    }
  }
  free(v12);
}

- (void)minusOrderedSet:(NSOrderedSet *)other
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other)
      goto LABEL_4;
  }
  else if (!other)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSMutableOrderedSet minusOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet minusOrderedSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
LABEL_4:
  if (self == (NSMutableOrderedSet *)other)
  {
    -[NSOrderedSet removeAllObjects](other, "removeAllObjects");
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(other);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v11 = -[NSOrderedSet countForObject:](other, "countForObject:", v10);
          if (v11)
          {
            v12 = v11;
            do
            {
              --v12;
              -[NSMutableOrderedSet removeObject:](self, "removeObject:", v10);
            }
            while (v12);
          }
        }
        v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      }
      while (v7);
    }
  }
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  NSException *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  double v28;
  NSException *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a4)
  {
    v18 = _os_log_pack_size();
    v19 = (char *)v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a4);
    goto LABEL_20;
  }
LABEL_4:
  if (a4 >> 61)
  {
    v18 = _os_log_pack_size();
    v19 = (char *)v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)(v21 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(_QWORD *)(v21 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a4);
LABEL_20:
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v19, v18);
    objc_exception_throw(v22);
  }
  if (a4)
  {
    v10 = 0;
    do
    {
      if (!a3[v10])
      {
        v15 = _os_log_pack_size();
        v16 = _os_log_pack_fill();
        *(_DWORD *)v16 = 136315394;
        *(_QWORD *)(v16 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
        *(_WORD *)(v16 + 12) = 2048;
        *(_QWORD *)(v16 + 14) = v10;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableOrderedSet insertObjects:count:atIndex:]", v10);
        v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
        objc_exception_throw(v17);
      }
      ++v10;
    }
    while (a4 != v10);
  }
  v11 = -[NSOrderedSet count](self, "count");
  if ((a5 & 0x8000000000000000) != 0 || v11 < a5)
  {
    if (v11)
    {
      v26 = v11;
      v23 = _os_log_pack_size();
      v24 = (char *)v30 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      v27 = _os_log_pack_fill();
      v28 = __os_log_helper_1_2_3_8_32_8_0_8_0(v27, (uint64_t)"-[NSMutableOrderedSet insertObjects:count:atIndex:]", a5, --v26);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v28, "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a5, v26);
    }
    else
    {
      v23 = _os_log_pack_size();
      v24 = (char *)v30 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = _os_log_pack_fill();
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)(v25 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
      *(_WORD *)(v25 + 12) = 2048;
      *(_QWORD *)(v25 + 14) = a5;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet insertObjects:count:atIndex:]", a5);
    }
    v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v24, v23);
    objc_exception_throw(v29);
  }
  v12 = -[NSOrderedSet count](self, "count");
  if (a4)
  {
    v13 = a5 - v12;
    do
    {
      v14 = (uint64_t)*a3++;
      -[NSMutableOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", v14, v13 + -[NSOrderedSet count](self, "count"));
      --a4;
    }
    while (a4);
  }
}

- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
  uint64_t v4;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSException *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSException *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  NSException *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  double v46;
  NSException *v47;
  CFStringRef v48;
  NSException *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  NSException *v54;
  size_t v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!objects)
      goto LABEL_4;
  }
  else if (!objects)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    v50 = _os_log_pack_size();
    v52 = (char *)v55 - ((MEMORY[0x1E0C80A78](v50, v51) + 15) & 0xFFFFFFFFFFFFFFF0);
    v53 = _os_log_pack_fill();
    *(_DWORD *)v53 = 136315138;
    *(_QWORD *)(v53 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet insertObjects:atIndexes:]");
    v54 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v52, v50);
    objc_exception_throw(v54);
  }
LABEL_4:
  if (!indexes)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)v55 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableOrderedSet insertObjects:atIndexes:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v31 = _os_log_pack_size();
    v33 = (char *)v55 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136315138;
    *(_QWORD *)(v34 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableOrderedSet insertObjects:atIndexes:]");
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v35);
  }
  v8 = -[NSOrderedSet count](self, "count");
  v9 = -[NSArray count](objects, "count");
  v10 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  if ((v10 & 0x8000000000000000) != 0)
  {
    v36 = v10;
    v11 = v9 + v8;
    goto LABEL_26;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v9 + v8;
    if (v11 <= v10)
    {
      v36 = v10;
LABEL_26:
      if (!v11)
      {
        v37 = _os_log_pack_size();
        v39 = (char *)v55 - ((MEMORY[0x1E0C80A78](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
        v40 = _os_log_pack_fill();
        *(_DWORD *)v40 = 136315394;
        *(_QWORD *)(v40 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
        *(_WORD *)(v40 + 12) = 2048;
        *(_QWORD *)(v40 + 14) = v36;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty ordered set"), "-[NSMutableOrderedSet insertObjects:atIndexes:]", v36);
        v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v39, v37);
        objc_exception_throw(v41);
      }
      v42 = _os_log_pack_size();
      v44 = (char *)v55 - ((MEMORY[0x1E0C80A78](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
      v45 = _os_log_pack_fill();
      v46 = __os_log_helper_1_2_3_8_32_8_0_8_0(v45, (uint64_t)"-[NSMutableOrderedSet insertObjects:atIndexes:]", v36, v11 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v46, "-[NSMutableOrderedSet insertObjects:atIndexes:]", v36, v11 - 1);
      v47 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v44, v42);
      objc_exception_throw(v47);
    }
  }
  v12 = -[NSArray count](objects, "count");
  v13 = -[NSIndexSet count](indexes, "count");
  if (v12 != v13)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of array (%lu) differs from count of index set (%lu)"), "-[NSMutableOrderedSet insertObjects:atIndexes:]", v12, v13);
  v14 = -[NSArray count](objects, "count");
  v16 = v14;
  if (v14 >> 60)
  {
    v48 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v14);
    v49 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v48, 0);
    CFRelease(v48);
    objc_exception_throw(v49);
  }
  if (v14 <= 1)
    v14 = 1;
  v17 = MEMORY[0x1E0C80A78](v14, v15);
  v19 = (char *)v55 - v18;
  v55[0] = 0;
  if (v16 >= 0x101)
  {
    v19 = (char *)_CFCreateArrayStorage(v17, 0, v55);
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }
  -[NSArray getObjects:range:](objects, "getObjects:range:", v19, 0, v16, v55[0]);
  v21 = 0;
  for (i = 0; i < -[NSIndexSet rangeCount](indexes, "rangeCount"); ++i)
  {
    v23 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", i);
    v25 = v24;
    -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", &v19[8 * v21], v24, v23);
    v21 += v25;
  }
  free(v20);
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  NSException *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (indexes)
      goto LABEL_3;
LABEL_12:
    v14 = _os_log_pack_size();
    v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableOrderedSet removeObjectsAtIndexes:]");
    goto LABEL_14;
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!indexes)
    goto LABEL_12;
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableOrderedSet removeObjectsAtIndexes:]");
LABEL_14:
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v18);
  }
  v6 = -[NSOrderedSet count](self, "count");
  v7 = objc_msgSend(0, "count");
  v8 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  if ((v8 & 0x8000000000000000) != 0)
  {
    v19 = v8;
    v9 = v7 + v6;
    goto LABEL_17;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7 + v6;
    if (v9 <= v8)
    {
      v19 = v8;
LABEL_17:
      v20 = _os_log_pack_size();
      v21 = _os_log_pack_fill();
      if (v9)
      {
        v22 = v9 - 1;
        v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet removeObjectsAtIndexes:]", v19, v22);
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v23, "-[NSMutableOrderedSet removeObjectsAtIndexes:]", v19, v22);
      }
      else
      {
        *(_DWORD *)v21 = 136315394;
        *(_QWORD *)(v21 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
        *(_WORD *)(v21 + 12) = 2048;
        *(_QWORD *)(v21 + 14) = v19;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty ordered set"), "-[NSMutableOrderedSet removeObjectsAtIndexes:]", v19);
      }
      v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
      objc_exception_throw(v24);
    }
  }
  v10 = -[NSIndexSet rangeCount](indexes, "rangeCount");
  if (v10)
  {
    v11 = v10 - 1;
    do
    {
      v12 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", v11);
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v12, v13);
      --v11;
    }
    while (v11 != -1);
  }
}

- (void)sortRange:(NSRange)range options:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  uint64_t v5;
  char v7;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSException *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  double v37;
  NSException *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  double v43;
  NSException *v44;
  CFStringRef v45;
  NSException *v46;
  char *v47;
  size_t v48;
  _QWORD v49[6];
  size_t v50[2];

  v7 = opts;
  length = range.length;
  location = range.location;
  v50[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (cmptr)
      goto LABEL_3;
LABEL_27:
    v28 = _os_log_pack_size();
    v30 = (char *)&v47 - ((MEMORY[0x1E0C80A78](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136315138;
    *(_QWORD *)(v31 + 4) = "-[NSMutableOrderedSet sortRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSMutableOrderedSet sortRange:options:usingComparator:]");
    v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v30, v28);
    objc_exception_throw(v32);
  }
  if (!cmptr)
    goto LABEL_27;
LABEL_3:
  v11 = -[NSOrderedSet count](self, "count");
  v13 = v11;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      v33 = _os_log_pack_size();
      v35 = (char *)&v47 - ((MEMORY[0x1E0C80A78](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
      v36 = _os_log_pack_fill();
      v37 = __os_log_helper_1_2_3_8_32_8_0_8_0(v36, (uint64_t)"-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v37, "-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length);
      v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v35, v33);
      objc_exception_throw(v38);
    }
    v39 = _os_log_pack_size();
    v41 = (char *)&v47 - ((MEMORY[0x1E0C80A78](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    v42 = _os_log_pack_fill();
    v43 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v42, (uint64_t)"-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length, v13 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v43, "-[NSMutableOrderedSet sortRange:options:usingComparator:]", location, length, v13 - 1);
    v44 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v41, v39);
    objc_exception_throw(v44);
  }
  if (length >= 2)
  {
    if (length >> 60)
    {
      v45 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
      v46 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v45, 0);
      CFRelease(v45);
      objc_exception_throw(v46);
    }
    if (length >= 0x101)
      v14 = 1;
    else
      v14 = length;
    v15 = 8 * v14;
    MEMORY[0x1E0C80A78](v11, v12);
    v17 = (char *)&v47 - v16;
    v50[0] = 0;
    if (length >= 0x101)
    {
      v17 = (char *)_CFCreateArrayStorage(length, 0, v50);
      v47 = v17;
    }
    else
    {
      v47 = 0;
    }
    v18 = -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v17, location, length, v47);
    MEMORY[0x1E0C80A78](v18, v19);
    v21 = (char *)&v47 - v20;
    v22 = (char *)&v47 - v20;
    if (length > 0x1000)
      v22 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __57__NSMutableOrderedSet_sortRange_options_usingComparator___block_invoke;
    v49[3] = &unk_1E12E12E0;
    v49[4] = cmptr;
    v49[5] = v17;
    CFSortIndexes((uint64_t)v22, length, v7, (uint64_t)v49);
    MEMORY[0x1E0C80A78](v23, v24);
    v25 = 0;
    v48 = 0;
    if (length >= 0x101)
      v25 = (char *)_CFCreateArrayStorage(length, 0, &v48);
    v26 = 0;
    if (length >= 0x101)
      v27 = v25;
    else
      v27 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    do
    {
      *(_QWORD *)&v27[8 * v26] = *(_QWORD *)&v17[8 * *(_QWORD *)&v22[8 * v26]];
      ++v26;
    }
    while (length != v26);
    -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length);
    if (v21 != v22)
      free(v22);
    free(v25);
    free(v47);
  }
}

- (void)replaceObjectsInRange:(NSRange)range withObjects:(id *)objects count:(NSUInteger)count
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  NSException *v27;
  NSUInteger v28;
  uint64_t v29;
  double v30;
  NSException *v31;
  _QWORD v32[2];

  length = range.length;
  location = range.location;
  v32[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v11 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      v28 = v11;
      v19 = _os_log_pack_size();
      v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v29, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length, --v28);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v30, "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length, v28);
    }
    else
    {
      v19 = _os_log_pack_size();
      v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v22, "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", location, length);
    }
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v20, v19);
    objc_exception_throw(v31);
  }
  if (!objects && count)
  {
    v23 = _os_log_pack_size();
    v24 = (char *)v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    v25 = _os_log_pack_fill();
    *(_DWORD *)v25 = 136315394;
    *(_QWORD *)(v25 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v25 + 12) = 2048;
    *(_QWORD *)(v25 + 14) = count;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", count);
    goto LABEL_24;
  }
  if (count >> 61)
  {
    v23 = _os_log_pack_size();
    v24 = (char *)v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    v26 = _os_log_pack_fill();
    *(_DWORD *)v26 = 136315394;
    *(_QWORD *)(v26 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v26 + 12) = 2048;
    *(_QWORD *)(v26 + 14) = count;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", count);
LABEL_24:
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v24, v23);
    objc_exception_throw(v27);
  }
  if (count)
  {
    v12 = 0;
    do
    {
      if (!objects[v12])
      {
        v16 = _os_log_pack_size();
        v17 = _os_log_pack_fill();
        *(_DWORD *)v17 = 136315394;
        *(_QWORD *)(v17 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v17 + 12) = 2048;
        *(_QWORD *)(v17 + 14) = v12;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]", v12);
        v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
        objc_exception_throw(v18);
      }
      ++v12;
    }
    while (count != v12);
    v13 = 0;
    do
      v14 = objects[v13++];
    while (count != v13);
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
    -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", objects, count, location);
    do
    {
      v15 = *objects++;

      --count;
    }
    while (count);
  }
  else
  {
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
    -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", objects, 0, location);
  }
}

- (void)removeObjectsInRange:(NSRange)range
{
  uint64_t v3;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  NSUInteger v12;
  uint64_t v13;
  double v14;
  NSException *v15;
  _QWORD v16[2];

  length = range.length;
  location = range.location;
  v16[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v7 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v7 < location + length)
  {
    if (v7)
    {
      v12 = v7;
      v8 = _os_log_pack_size();
      v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:]", location, length, --v12);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v14, "-[NSMutableOrderedSet removeObjectsInRange:]", location, length, v12);
    }
    else
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      v10 = _os_log_pack_fill();
      v11 = __os_log_helper_1_2_3_8_32_8_0_8_0(v10, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v11, "-[NSMutableOrderedSet removeObjectsInRange:]", location, length);
    }
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v15);
  }
  for (; length; --length)
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", location);
}

- (void)sortUsingComparator:(NSComparator)cmptr
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSException *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr)
      goto LABEL_3;
LABEL_6:
    v7 = _os_log_pack_size();
    v9 = (char *)v12 - ((MEMORY[0x1E0C80A78](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSMutableOrderedSet sortUsingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSMutableOrderedSet sortUsingComparator:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v7);
    objc_exception_throw(v11);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!cmptr)
    goto LABEL_6;
LABEL_3:
  v6 = -[NSOrderedSet count](self, "count");
  if (v6 >= 2)
    -[NSMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v6, 0, cmptr);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)removeObjectsInArray:(NSArray *)array
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!array)
      goto LABEL_4;
  }
  else if (!array)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)array) & 1) == 0)
  {
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSMutableOrderedSet removeObjectsInArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet removeObjectsInArray:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v14[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)], v11);
    objc_exception_throw(v13);
  }
LABEL_4:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](array, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(array);
        v10 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](array, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v7);
  }
}

- (void)addObjects:(id *)objects count:(NSUInteger)count
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (objects)
      goto LABEL_4;
  }
  else if (objects)
  {
    goto LABEL_4;
  }
  if (count)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[NSMutableOrderedSet addObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = count;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableOrderedSet addObjects:count:]", count);
    goto LABEL_15;
  }
LABEL_4:
  if (count >> 61)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSMutableOrderedSet addObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = count;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableOrderedSet addObjects:count:]", count);
LABEL_15:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v16);
  }
  if (count)
  {
    v8 = 0;
    do
    {
      if (!objects[v8])
      {
        v9 = _os_log_pack_size();
        v10 = _os_log_pack_fill();
        *(_DWORD *)v10 = 136315394;
        *(_QWORD *)(v10 + 4) = "-[NSMutableOrderedSet addObjects:count:]";
        *(_WORD *)(v10 + 12) = 2048;
        *(_QWORD *)(v10 + 14) = v8;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableOrderedSet addObjects:count:]", v8);
        v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
        objc_exception_throw(v11);
      }
      ++v8;
    }
    while (count != v8);
  }
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", objects, count, -[NSOrderedSet count](self, "count"));
}

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  NSException *v20;
  _QWORD v21[2];

  length = a4.length;
  location = a4.location;
  v21[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSMutableOrderedSet addObjectsFromArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet addObjectsFromArray:range:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
    objc_exception_throw(v16);
  }
LABEL_4:
  v9 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v17 = v9;
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = _os_log_pack_fill();
      v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length, --v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v19, "-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length, v17);
    }
    else
    {
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v13, "-[NSMutableOrderedSet addObjectsFromArray:range:]", location, length);
    }
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v20);
  }
  -[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", a3, location, length, -[NSOrderedSet count](self, "count"));
}

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  NSException *v20;
  _QWORD v21[2];

  length = a4.length;
  location = a4.location;
  v21[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
    objc_exception_throw(v16);
  }
LABEL_4:
  v9 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v17 = v9;
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = _os_log_pack_fill();
      v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length, --v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v19, "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length, v17);
    }
    else
    {
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v13, "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]", location, length);
    }
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v20);
  }
  -[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, location, length, -[NSOrderedSet count](self, "count"));
}

- (void)addObjectsFromOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v8 = (char *)v11 - ((MEMORY[0x1E0C80A78](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "-[NSMutableOrderedSet addObjectsFromOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet addObjectsFromOrderedSet:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
LABEL_4:
  -[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, 0, objc_msgSend(a3, "count"), -[NSOrderedSet count](self, "count"));
}

- (void)addObjectsFromSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableOrderedSet addObjectsFromSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet addObjectsFromSet:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
LABEL_4:
  -[NSMutableOrderedSet insertObjectsFromSet:atIndex:](self, "insertObjectsFromSet:atIndex:", a3, -[NSOrderedSet count](self, "count"));
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
  uint64_t v4;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSUInteger v26;
  uint64_t v27;
  double v28;
  id v29[2];

  v29[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v8 = -[NSOrderedSet count](self, "count");
  if ((idx1 & 0x8000000000000000) != 0 || v8 <= idx1)
  {
    if (v8)
    {
      v20 = v8;
      v14 = _os_log_pack_size();
      v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx1, --v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v22, "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx1, v20);
    }
    else
    {
      v14 = _os_log_pack_size();
      v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      *(_DWORD *)v16 = 136315394;
      *(_QWORD *)(v16 + 4) = "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v16 + 12) = 2048;
      *(_QWORD *)(v16 + 14) = idx1;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx1);
    }
    v23 = _CFAutoreleasePoolAddObject();
    v24 = v15;
    v25 = v14;
LABEL_22:
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v23, 0, v24, v25));
  }
  v9 = -[NSOrderedSet count](self, "count");
  if ((idx2 & 0x8000000000000000) != 0 || v9 <= idx2)
  {
    if (v9)
    {
      v26 = v9;
      v17 = _os_log_pack_size();
      v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      v27 = _os_log_pack_fill();
      v28 = __os_log_helper_1_2_3_8_32_8_0_8_0(v27, (uint64_t)"-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx2, --v26);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v28, "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx2, v26);
    }
    else
    {
      v17 = _os_log_pack_size();
      v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      *(_DWORD *)v19 = 136315394;
      *(_QWORD *)(v19 + 4) = "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v19 + 12) = 2048;
      *(_QWORD *)(v19 + 14) = idx2;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]", idx2);
    }
    v23 = _CFAutoreleasePoolAddObject();
    v24 = v18;
    v25 = v17;
    goto LABEL_22;
  }
  if (idx1 != idx2)
  {
    if (idx2 <= idx1)
      v10 = idx1;
    else
      v10 = idx2;
    if (idx2 >= idx1)
      idx2 = idx1;
    v11 = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", idx2);
    v29[0] = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v10);
    v12 = v11;
    v13 = v29[0];
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", idx2, v29[0]);
    -[NSMutableOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", v11, v10);

  }
}

- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSException *v21;
  CFStringRef v22;
  NSException *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  NSException *v35;
  size_t v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v24 = _os_log_pack_size();
    v26 = (char *)v36 - ((MEMORY[0x1E0C80A78](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)(v27 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v8 = -[NSOrderedSet count](self, "count");
  v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      v17 = _os_log_pack_size();
      v19 = (char *)v36 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v20 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(_QWORD *)(v20 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]", a4);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
      objc_exception_throw(v21);
    }
    v29 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    v33 = v9 - 1;
    v34 = __os_log_helper_1_2_3_8_32_8_0_8_0(v32, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]", a4, v33);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v34, "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]", a4, v33);
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
    objc_exception_throw(v35);
  }
  v10 = objc_msgSend(a3, "count");
  v12 = v10;
  if (v10 >> 60)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v10);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (v10 <= 1)
    v10 = 1;
  v13 = MEMORY[0x1E0C80A78](v10, v11);
  v15 = (char *)v36 - v14;
  v36[0] = 0;
  if (v12 >= 0x101)
  {
    v15 = (char *)_CFCreateArrayStorage(v13, 0, v36);
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v15, 0, v12, v36[0]);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v15, v12, a4);
  free(v16);
}

- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  double v23;
  NSException *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  NSException *v29;
  CFStringRef v30;
  NSException *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSException *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  double v42;
  NSException *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  double v49;
  NSException *v50;
  size_t v51[2];

  length = a4.length;
  location = a4.location;
  v51[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v32 = _os_log_pack_size();
    v34 = (char *)v51 - ((MEMORY[0x1E0C80A78](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    v35 = _os_log_pack_fill();
    *(_DWORD *)v35 = 136315138;
    *(_QWORD *)(v35 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v34, v32);
    objc_exception_throw(v36);
  }
LABEL_4:
  v11 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      v19 = _os_log_pack_size();
      v21 = (char *)v51 - ((MEMORY[0x1E0C80A78](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = _os_log_pack_fill();
      v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v23, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v21, v19);
      objc_exception_throw(v24);
    }
    v37 = v11;
    v38 = _os_log_pack_size();
    v40 = (char *)v51 - ((MEMORY[0x1E0C80A78](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = _os_log_pack_fill();
    v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v41, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length, --v37);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v42, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", location, length, v37);
    v43 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v40, v38);
    objc_exception_throw(v43);
  }
  v12 = -[NSOrderedSet count](self, "count");
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      v25 = _os_log_pack_size();
      v27 = (char *)v51 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = _os_log_pack_fill();
      *(_DWORD *)v28 = 136315394;
      *(_QWORD *)(v28 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]";
      *(_WORD *)(v28 + 12) = 2048;
      *(_QWORD *)(v28 + 14) = a5;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", a5);
      v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
      objc_exception_throw(v29);
    }
    v44 = v12;
    v45 = _os_log_pack_size();
    v47 = (char *)v51 - ((MEMORY[0x1E0C80A78](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
    v48 = _os_log_pack_fill();
    v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", a5, --v44);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v49, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]", a5, v44);
    v50 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v47, v45);
    objc_exception_throw(v50);
  }
  if (length >> 60)
  {
    v30 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v31 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v30, 0);
    CFRelease(v30);
    objc_exception_throw(v31);
  }
  if (length <= 1)
    v14 = 1;
  else
    v14 = length;
  v15 = MEMORY[0x1E0C80A78](v14, v13);
  v17 = (char *)v51 - v16;
  v51[0] = 0;
  if (length >= 0x101)
  {
    v17 = (char *)_CFCreateArrayStorage(v15, 0, v51);
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v17, location, length, v51[0]);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v17, length, a5);
  free(v18);
}

- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSException *v21;
  CFStringRef v22;
  NSException *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  NSException *v35;
  size_t v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v24 = _os_log_pack_size();
    v26 = (char *)v36 - ((MEMORY[0x1E0C80A78](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)(v27 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v8 = -[NSOrderedSet count](self, "count");
  v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      v17 = _os_log_pack_size();
      v19 = (char *)v36 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v20 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(_QWORD *)(v20 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]", a4);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
      objc_exception_throw(v21);
    }
    v29 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    v33 = v9 - 1;
    v34 = __os_log_helper_1_2_3_8_32_8_0_8_0(v32, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]", a4, v33);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v34, "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]", a4, v33);
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
    objc_exception_throw(v35);
  }
  v10 = objc_msgSend(a3, "count");
  v12 = v10;
  if (v10 >> 60)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v10);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (v10 <= 1)
    v10 = 1;
  v13 = MEMORY[0x1E0C80A78](v10, v11);
  v15 = (char *)v36 - v14;
  v36[0] = 0;
  if (v12 >= 0x101)
  {
    v15 = (char *)_CFCreateArrayStorage(v13, 0, v36);
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v15, 0, v12, v36[0]);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v15, v12, a4);
  free(v16);
}

- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSException *v21;
  CFStringRef v22;
  NSException *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  NSException *v35;
  size_t v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    v24 = _os_log_pack_size();
    v26 = (char *)v36 - ((MEMORY[0x1E0C80A78](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)(v27 + 4) = "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v8 = -[NSOrderedSet count](self, "count");
  v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      v17 = _os_log_pack_size();
      v19 = (char *)v36 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v20 + 4) = "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(_QWORD *)(v20 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]", a4);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
      objc_exception_throw(v21);
    }
    v29 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    v33 = v9 - 1;
    v34 = __os_log_helper_1_2_3_8_32_8_0_8_0(v32, (uint64_t)"-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]", a4, v33);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v34, "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]", a4, v33);
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
    objc_exception_throw(v35);
  }
  v10 = objc_msgSend(a3, "count");
  v12 = v10;
  if (v10 >> 60)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v10);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (v10 <= 1)
    v10 = 1;
  v13 = MEMORY[0x1E0C80A78](v10, v11);
  v15 = (char *)v36 - v14;
  v36[0] = 0;
  if (v12 >= 0x101)
  {
    v15 = (char *)_CFCreateArrayStorage(v13, 0, v36);
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(a3, "getObjects:count:", v15, v12, v36[0]);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v15, v12, a4);
  free(v16);
}

- (void)moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx
{
  uint64_t v4;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSArray *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSException *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSException *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSException *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  double v43;
  NSException *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  NSException *v49;
  CFStringRef v50;
  NSException *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  double v56;
  NSException *v57;
  size_t v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (indexes)
      goto LABEL_3;
LABEL_17:
    v23 = _os_log_pack_size();
    v25 = (char *)v58 - ((MEMORY[0x1E0C80A78](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    v26 = _os_log_pack_fill();
    *(_DWORD *)v26 = 136315138;
    *(_QWORD *)(v26 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]");
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v25, v23);
    objc_exception_throw(v27);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!indexes)
    goto LABEL_17;
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v28 = _os_log_pack_size();
    v30 = (char *)v58 - ((MEMORY[0x1E0C80A78](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136315138;
    *(_QWORD *)(v31 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]");
    v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v30, v28);
    objc_exception_throw(v32);
  }
  v8 = -[NSOrderedSet count](self, "count");
  v9 = objc_msgSend(0, "count");
  v10 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  if ((v10 & 0x8000000000000000) != 0)
  {
    v33 = v10;
    v11 = v9 + v8;
    goto LABEL_21;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v9 + v8;
    if (v11 <= v10)
    {
      v33 = v10;
LABEL_21:
      if (!v11)
      {
        v34 = _os_log_pack_size();
        v36 = (char *)v58 - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
        v37 = _os_log_pack_fill();
        *(_DWORD *)v37 = 136315394;
        *(_QWORD *)(v37 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
        *(_WORD *)(v37 + 12) = 2048;
        *(_QWORD *)(v37 + 14) = v33;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty ordered set"), "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", v33);
        v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
        objc_exception_throw(v38);
      }
      v39 = _os_log_pack_size();
      v41 = (char *)v58 - ((MEMORY[0x1E0C80A78](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
      v42 = _os_log_pack_fill();
      v43 = __os_log_helper_1_2_3_8_32_8_0_8_0(v42, (uint64_t)"-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", v33, v11 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v43, "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", v33, v11 - 1);
      v44 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v41, v39);
      objc_exception_throw(v44);
    }
  }
  v12 = -[NSOrderedSet count](self, "count");
  v13 = -[NSIndexSet countOfIndexesInRange:](indexes, "countOfIndexesInRange:", 0, idx);
  v14 = v12 - v13;
  if ((idx & 0x8000000000000000) != 0 || v14 < idx)
  {
    if (v12 == v13)
    {
      v45 = _os_log_pack_size();
      v47 = (char *)v58 - ((MEMORY[0x1E0C80A78](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
      v48 = _os_log_pack_fill();
      *(_DWORD *)v48 = 136315394;
      *(_QWORD *)(v48 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v48 + 12) = 2048;
      *(_QWORD *)(v48 + 14) = idx;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", idx);
      v49 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v47, v45);
      objc_exception_throw(v49);
    }
    v52 = _os_log_pack_size();
    v54 = (char *)v58 - ((MEMORY[0x1E0C80A78](v52, v53) + 15) & 0xFFFFFFFFFFFFFFF0);
    v55 = _os_log_pack_fill();
    v56 = __os_log_helper_1_2_3_8_32_8_0_8_0(v55, (uint64_t)"-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", idx, v14 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v56, "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]", idx, v14 - 1);
    v57 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v54, v52);
    objc_exception_throw(v57);
  }
  v15 = -[NSOrderedSet objectsAtIndexes:](self, "objectsAtIndexes:", indexes);
  -[NSMutableOrderedSet removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", indexes);
  v16 = -[NSArray count](v15, "count");
  v18 = v16;
  if (v16 >> 60)
  {
    v50 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v16);
    v51 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v50, 0);
    CFRelease(v50);
    objc_exception_throw(v51);
  }
  if (v16 <= 1)
    v16 = 1;
  v19 = MEMORY[0x1E0C80A78](v16, v17);
  v21 = (char *)v58 - v20;
  v58[0] = 0;
  if (v18 >= 0x101)
  {
    v21 = (char *)_CFCreateArrayStorage(v19, 0, v58);
    v22 = v21;
  }
  else
  {
    v22 = 0;
  }
  -[NSArray getObjects:range:](v15, "getObjects:range:", v21, 0, v18, v58[0]);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v21, v18, idx);
  free(v22);
}

- (void)removeAllObjects
{
  uint64_t v2;
  NSUInteger v4;
  NSUInteger v5;

  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  v4 = -[NSOrderedSet count](self, "count");
  if (v4)
  {
    v5 = v4 - 1;
    do
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v5--);
    while (v5 != -1);
  }
}

- (void)removeFirstObject
{
  uint64_t v2;

  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  if (-[NSOrderedSet count](self, "count"))
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", 0);
}

- (void)removeLastObject
{
  uint64_t v2;
  NSUInteger v4;

  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  v4 = -[NSOrderedSet count](self, "count");
  if (v4)
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v4 - 1);
}

- (void)removeObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  NSUInteger v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  _QWORD v19[2];

  length = a4.length;
  location = a4.location;
  v19[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v15 = v9;
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v16, (uint64_t)"-[NSMutableOrderedSet removeObject:inRange:]", location, length, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v17, "-[NSMutableOrderedSet removeObject:inRange:]", location, length, v15);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet removeObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v14, "-[NSMutableOrderedSet removeObject:inRange:]", location, length);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v18);
  }
  v10 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  NSException *v25;
  NSUInteger v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  _QWORD v35[2];

  length = a5.length;
  location = a5.location;
  v9 = a3.length;
  v10 = a3.location;
  v35[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v12 = -[NSOrderedSet count](self, "count");
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (v12)
    {
      v26 = v12;
      v15 = _os_log_pack_size();
      v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v27 = _os_log_pack_fill();
      v28 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v27, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9, --v26);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v28, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9, v26);
    }
    else
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v18, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", v10, v9);
    }
    v29 = _CFAutoreleasePoolAddObject();
    v30 = v16;
    v31 = v15;
LABEL_25:
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v29, 0, v30, v31));
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v23 = _os_log_pack_size();
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136315138;
    *(_QWORD *)(v24 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]");
    v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
    objc_exception_throw(v25);
  }
  v13 = objc_msgSend(a4, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v13 < location + length)
  {
    if (v13)
    {
      v32 = v13;
      v19 = _os_log_pack_size();
      v20 = (char *)v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      v33 = _os_log_pack_fill();
      v34 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v33, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length, --v32);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v34, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length, v32);
    }
    else
    {
      v19 = _os_log_pack_size();
      v20 = (char *)v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v22, "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]", location, length);
    }
    v29 = _CFAutoreleasePoolAddObject();
    v30 = v20;
    v31 = v19;
    goto LABEL_25;
  }
  for (; length; --length)
  {
    v14 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", objc_msgSend(a4, "objectAtIndex:", location), v10, v9);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v14);
    ++location;
  }
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSException *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  NSException *v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  length = a3.length;
  location = a3.location;
  v32 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v9 = -[NSOrderedSet count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v16 = _os_log_pack_size();
      v17 = &v27[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      v23 = _os_log_pack_fill();
      v24 = v10 - 1;
      v25 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length, v24);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v25, "-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length, v24);
    }
    else
    {
      v16 = _os_log_pack_size();
      v17 = &v27[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      v18 = _os_log_pack_fill();
      v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v19, "-[NSMutableOrderedSet removeObjectsInRange:inArray:]", location, length);
    }
    v26 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v17, v16);
    objc_exception_throw(v26);
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v20 = _os_log_pack_size();
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet removeObjectsInRange:inArray:]");
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v27[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)], v20);
    objc_exception_throw(v22);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(a4);
        v15 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), location, length);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v15);
      }
      v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v12);
  }
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  _QWORD v22[2];

  length = a4.length;
  location = a4.location;
  v22[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSMutableOrderedSet removeObjectsInArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet removeObjectsInArray:range:]");
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
    objc_exception_throw(v17);
  }
LABEL_4:
  v9 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v18 = v9;
      v11 = _os_log_pack_size();
      v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length, --v18);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v20, "-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length, v18);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v14, "-[NSMutableOrderedSet removeObjectsInArray:range:]", location, length);
    }
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v21);
  }
  for (; length; --length)
  {
    v10 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", objc_msgSend(a3, "objectAtIndex:", location));
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
    ++location;
  }
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  double v27;
  NSException *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  double v33;
  NSException *v34;
  CFStringRef v35;
  NSException *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  NSException *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  double v46;
  NSException *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  double v52;
  NSException *v53;
  size_t v54[2];

  length = a5.length;
  location = a5.location;
  v9 = a3.length;
  v10 = a3.location;
  v54[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v12 = -[NSOrderedSet count](self, "count");
  v13 = v12;
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (!v12)
    {
      v23 = _os_log_pack_size();
      v25 = (char *)v54 - ((MEMORY[0x1E0C80A78](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      v26 = _os_log_pack_fill();
      v27 = __os_log_helper_1_2_3_8_32_8_0_8_0(v26, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v27, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9);
      v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v25, v23);
      objc_exception_throw(v28);
    }
    v42 = _os_log_pack_size();
    v44 = (char *)v54 - ((MEMORY[0x1E0C80A78](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
    v45 = _os_log_pack_fill();
    v46 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v45, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9, v13 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v46, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", v10, v9, v13 - 1);
    v47 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v44, v42);
    objc_exception_throw(v47);
  }
  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    v37 = _os_log_pack_size();
    v39 = (char *)v54 - ((MEMORY[0x1E0C80A78](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    v40 = _os_log_pack_fill();
    *(_DWORD *)v40 = 136315138;
    *(_QWORD *)(v40 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]");
    v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v39, v37);
    objc_exception_throw(v41);
  }
  v14 = objc_msgSend(a4, "count");
  v16 = v14;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v14 < location + length)
  {
    if (!v14)
    {
      v29 = _os_log_pack_size();
      v31 = (char *)v54 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
      v32 = _os_log_pack_fill();
      v33 = __os_log_helper_1_2_3_8_32_8_0_8_0(v32, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v33, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length);
      v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
      objc_exception_throw(v34);
    }
    v48 = _os_log_pack_size();
    v50 = (char *)v54 - ((MEMORY[0x1E0C80A78](v48, v49) + 15) & 0xFFFFFFFFFFFFFFF0);
    v51 = _os_log_pack_fill();
    v52 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v51, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length, v16 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v52, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]", location, length, v16 - 1);
    v53 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v50, v48);
    objc_exception_throw(v53);
  }
  if (length >> 60)
  {
    v35 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v36 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v35, 0);
    CFRelease(v35);
    objc_exception_throw(v36);
  }
  if (length <= 1)
    v17 = 1;
  else
    v17 = length;
  v18 = MEMORY[0x1E0C80A78](v17, v15);
  v20 = (size_t *)((char *)v54 - v19);
  v54[0] = 0;
  if (length >= 0x101)
  {
    v20 = _CFCreateArrayStorage(v18, 0, v54);
    v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v20, location, length, v54[0]);
  for (; length; --length)
  {
    v22 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", *v20, v10, v9);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v22);
    ++v20;
  }
  free(v21);
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSException *v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  NSException *v24;
  _QWORD v25[2];

  length = a3.length;
  location = a3.location;
  v25[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v20 = v9;
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = _os_log_pack_fill();
      v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length, --v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v23, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length, v20);
    }
    else
    {
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v14, "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]", location, length);
    }
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v24);
  }
  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v25 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", location, length, a4, 0, objc_msgSend(a4, "count"));
}

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSException *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  NSException *v24;
  _QWORD v25[2];

  length = a4.length;
  location = a4.location;
  v25[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v25 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
LABEL_4:
  v9 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v20 = v9;
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = _os_log_pack_fill();
      v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length, --v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v23, "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length, v20);
    }
    else
    {
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v14, "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]", location, length);
    }
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v24);
  }
  -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, -[NSOrderedSet count](self, "count"), a3, location, length);
}

- (void)removeObjectsInOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v8 = (char *)v11 - ((MEMORY[0x1E0C80A78](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "-[NSMutableOrderedSet removeObjectsInOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet removeObjectsInOrderedSet:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
LABEL_4:
  -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, -[NSOrderedSet count](self, "count"), a3, 0, objc_msgSend(a3, "count"));
}

- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSException *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  NSException *v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  length = a3.length;
  location = a3.location;
  v32 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v9 = -[NSOrderedSet count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v16 = _os_log_pack_size();
      v17 = &v27[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      v23 = _os_log_pack_fill();
      v24 = v10 - 1;
      v25 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length, v24);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v25, "-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length, v24);
    }
    else
    {
      v16 = _os_log_pack_size();
      v17 = &v27[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
      v18 = _os_log_pack_fill();
      v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v19, "-[NSMutableOrderedSet removeObjectsInRange:inSet:]", location, length);
    }
    v26 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v17, v16);
    objc_exception_throw(v26);
  }
  if (a4 && (_NSIsNSSet((uint64_t)a4) & 1) == 0)
  {
    v20 = _os_log_pack_size();
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet removeObjectsInRange:inSet:]");
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v27[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)], v20);
    objc_exception_throw(v22);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(a4);
        v15 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), location, length);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v15);
      }
      v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v12);
  }
}

- (void)removeObjectsInSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSMutableOrderedSet removeObjectsInSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet removeObjectsInSet:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v14[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)], v11);
    objc_exception_throw(v13);
  }
LABEL_4:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v10 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v7);
  }
}

- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  uint64_t v5;
  unint64_t v11;
  uint64_t v12;
  id IndexesPassingTest;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSException *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_12:
    v18 = _os_log_pack_size();
    v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315138;
    *(_QWORD *)(v20 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  if (!a3)
    goto LABEL_12;
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v18 = _os_log_pack_size();
    v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  if (!a5)
  {
    v18 = _os_log_pack_size();
    v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136315138;
    *(_QWORD *)(v22 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
LABEL_15:
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v19, v18);
    objc_exception_throw(v23);
  }
  v11 = a4 & 0xAFFFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0)
    v11 = a4;
  v12 = v11 | 0x5000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v11 | 0x5000000000000000, a3);
  IndexesPassingTest = __NSOrderedSetGetIndexesPassingTest(self, (uint64_t)a5, v12, a3);
  v14 = objc_msgSend(IndexesPassingTest, "rangeCount");
  if (v14)
  {
    v15 = v14 - 1;
    do
    {
      v16 = objc_msgSend(IndexesPassingTest, "rangeAtIndex:", v15);
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v16, v17);
      --v15;
    }
    while (v15 != -1);
  }
}

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  unint64_t v9;
  uint64_t v10;
  id IndexesPassingTest;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_10:
    v16 = _os_log_pack_size();
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSMutableOrderedSet removeObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableOrderedSet removeObjectsWithOptions:passingTest:]");
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
    objc_exception_throw(v18);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!a4)
    goto LABEL_10;
LABEL_3:
  v9 = a3 & 0xBFFFFFFFFFFFFFFELL;
  if ((a3 & 2) == 0)
    v9 = a3;
  v10 = v9 | 0x4000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v9 | 0x4000000000000000, 0);
  IndexesPassingTest = __NSOrderedSetGetIndexesPassingTest(self, (uint64_t)a4, v10, 0);
  v12 = objc_msgSend(IndexesPassingTest, "rangeCount");
  if (v12)
  {
    v13 = v12 - 1;
    do
    {
      v14 = objc_msgSend(IndexesPassingTest, "rangeAtIndex:", v13);
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v14, v15);
      --v13;
    }
    while (v13 != -1);
  }
}

- (void)removeObjectsPassingTest:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableOrderedSet removeObjectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableOrderedSet removeObjectsPassingTest:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  -[NSMutableOrderedSet removeObjectsWithOptions:passingTest:](self, "removeObjectsWithOptions:passingTest:", 0, a3);
}

- (void)replaceObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  double v17;
  NSUInteger v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  _QWORD v22[2];

  length = a4.length;
  location = a4.location;
  v22[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (a3)
      goto LABEL_3;
LABEL_9:
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSMutableOrderedSet replaceObject:inRange:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableOrderedSet replaceObject:inRange:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    objc_exception_throw(v13);
  }
  if (!a3)
    goto LABEL_9;
LABEL_3:
  v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v18 = v9;
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSMutableOrderedSet replaceObject:inRange:]", location, length, --v18);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v20, "-[NSMutableOrderedSet replaceObject:inRange:]", location, length, v18);
    }
    else
    {
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSMutableOrderedSet replaceObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v17, "-[NSMutableOrderedSet replaceObject:inRange:]", location, length);
    }
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v21);
  }
  v10 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v10, a3);
}

- (void)replaceObject:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_6:
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[NSMutableOrderedSet replaceObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableOrderedSet replaceObject:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!a3)
    goto LABEL_6;
LABEL_3:
  v6 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v6, a3);
}

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
  uint64_t v4;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t j;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  NSException *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  NSException *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  NSException *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  double v49;
  NSException *v50;
  CFStringRef v51;
  NSException *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  NSException *v57;
  size_t v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!objects)
      goto LABEL_4;
  }
  else if (!objects)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    v53 = _os_log_pack_size();
    v55 = (char *)v58 - ((MEMORY[0x1E0C80A78](v53, v54) + 15) & 0xFFFFFFFFFFFFFFF0);
    v56 = _os_log_pack_fill();
    *(_DWORD *)v56 = 136315138;
    *(_QWORD *)(v56 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]");
    v57 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v55, v53);
    objc_exception_throw(v57);
  }
LABEL_4:
  if (!indexes)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)v58 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v35 = _os_log_pack_size();
    v37 = (char *)v58 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    *(_DWORD *)v38 = 136315138;
    *(_QWORD *)(v38 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]");
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
    objc_exception_throw(v39);
  }
  v8 = -[NSOrderedSet count](self, "count");
  v9 = -[NSArray count](objects, "count");
  v10 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  v11 = v10;
  if ((v10 & 0x8000000000000000) != 0)
  {
    v12 = v9 + v8;
    goto LABEL_28;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v9 + v8;
    if (v12 <= v10)
    {
LABEL_28:
      if (!v12)
      {
        v40 = _os_log_pack_size();
        v42 = (char *)v58 - ((MEMORY[0x1E0C80A78](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
        v43 = _os_log_pack_fill();
        *(_DWORD *)v43 = 136315394;
        *(_QWORD *)(v43 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
        *(_WORD *)(v43 + 12) = 2048;
        *(_QWORD *)(v43 + 14) = v11;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty ordered set"), "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v11);
        v44 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v42, v40);
        objc_exception_throw(v44);
      }
      v45 = _os_log_pack_size();
      v47 = (char *)v58 - ((MEMORY[0x1E0C80A78](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
      v48 = _os_log_pack_fill();
      v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v11, v12 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v49, "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v11, v12 - 1);
      v50 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v47, v45);
      objc_exception_throw(v50);
    }
  }
  v13 = -[NSArray count](objects, "count");
  v14 = -[NSIndexSet count](indexes, "count");
  if (v13 != v14)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of array (%lu) differs from count of index set (%lu)"), "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]", v13, v14);
  v15 = -[NSArray count](objects, "count");
  v17 = v15;
  if (v15 >> 60)
  {
    v51 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v15);
    v52 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v51, 0);
    CFRelease(v51);
    objc_exception_throw(v52);
  }
  if (v15 <= 1)
    v15 = 1;
  v18 = MEMORY[0x1E0C80A78](v15, v16);
  v20 = (char *)v58 - v19;
  v58[0] = 0;
  if (v17 >= 0x101)
  {
    v20 = (char *)_CFCreateArrayStorage(v18, 0, v58);
    v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  -[NSArray getObjects:range:](objects, "getObjects:range:", v20, 0, v17, v58[0]);
  for (i = -[NSIndexSet rangeCount](indexes, "rangeCount") - 1; i != -1; --i)
  {
    v23 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", i);
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v23, v24);
  }
  v25 = 0;
  for (j = 0; j < -[NSIndexSet rangeCount](indexes, "rangeCount"); ++j)
  {
    v27 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", j);
    v29 = v28;
    -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", &v20[8 * v25], v28, v27);
    v25 += v29;
  }
  free(v21);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4 range:(_NSRange)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  double v24;
  NSException *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  double v30;
  NSException *v31;
  CFStringRef v32;
  NSException *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSException *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  double v44;
  NSException *v45;
  NSUInteger v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  double v51;
  NSException *v52;
  size_t v53[2];

  length = a5.length;
  location = a5.location;
  v9 = a3.length;
  v10 = a3.location;
  v53[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a4)
      goto LABEL_4;
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v34 = _os_log_pack_size();
    v36 = (char *)v53 - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = _os_log_pack_fill();
    *(_DWORD *)v37 = 136315138;
    *(_QWORD *)(v37 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]");
    v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
    objc_exception_throw(v38);
  }
LABEL_4:
  v12 = objc_msgSend(a4, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v12 < location + length)
  {
    if (!v12)
    {
      v20 = _os_log_pack_size();
      v22 = (char *)v53 - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = _os_log_pack_fill();
      v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v24, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
      objc_exception_throw(v25);
    }
    v39 = v12;
    v40 = _os_log_pack_size();
    v42 = (char *)v53 - ((MEMORY[0x1E0C80A78](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
    v43 = _os_log_pack_fill();
    v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v43, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length, --v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v44, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", location, length, v39);
    v45 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v42, v40);
    objc_exception_throw(v45);
  }
  v13 = -[NSOrderedSet count](self, "count");
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      v26 = _os_log_pack_size();
      v28 = (char *)v53 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v30, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v31);
    }
    v46 = v13;
    v47 = _os_log_pack_size();
    v49 = (char *)v53 - ((MEMORY[0x1E0C80A78](v47, v48) + 15) & 0xFFFFFFFFFFFFFFF0);
    v50 = _os_log_pack_fill();
    v51 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v50, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, --v46);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v51, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, v46);
    v52 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v49, v47);
    objc_exception_throw(v52);
  }
  if (length >> 60)
  {
    v32 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v33 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v32, 0);
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (length <= 1)
    v15 = 1;
  else
    v15 = length;
  v16 = MEMORY[0x1E0C80A78](v15, v14);
  v18 = (char *)v53 - v17;
  v53[0] = 0;
  if (length >= 0x101)
  {
    v18 = (char *)_CFCreateArrayStorage(v16, 0, v53);
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v18, location, length, v53[0]);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
  free(v19);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  double v22;
  NSException *v23;
  CFStringRef v24;
  NSException *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSException *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  NSException *v37;
  size_t v38[2];

  length = a3.length;
  location = a3.location;
  v38[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a4)
      goto LABEL_4;
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)v38 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
LABEL_4:
  v9 = -[NSOrderedSet count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v18 = _os_log_pack_size();
      v20 = (char *)v38 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v22, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length);
      v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
      objc_exception_throw(v23);
    }
    v31 = _os_log_pack_size();
    v33 = (char *)v38 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    v35 = v10 - 1;
    v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v34, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length, v35);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v36, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]", location, length, v35);
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v37);
  }
  v11 = objc_msgSend(a4, "count");
  v13 = v11;
  if (v11 >> 60)
  {
    v24 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v11);
    v25 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v24, 0);
    CFRelease(v24);
    objc_exception_throw(v25);
  }
  if (v11 <= 1)
    v11 = 1;
  v14 = MEMORY[0x1E0C80A78](v11, v12);
  v16 = (char *)v38 - v15;
  v38[0] = 0;
  if (v13 >= 0x101)
  {
    v16 = (char *)_CFCreateArrayStorage(v14, 0, v38);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v16, 0, v13, v38[0]);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  double v24;
  NSException *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  double v30;
  NSException *v31;
  CFStringRef v32;
  NSException *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSException *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  double v44;
  NSException *v45;
  NSUInteger v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  double v51;
  NSException *v52;
  size_t v53[2];

  length = a5.length;
  location = a5.location;
  v9 = a3.length;
  v10 = a3.location;
  v53[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a4)
      goto LABEL_4;
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    v34 = _os_log_pack_size();
    v36 = (char *)v53 - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = _os_log_pack_fill();
    *(_DWORD *)v37 = 136315138;
    *(_QWORD *)(v37 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]");
    v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
    objc_exception_throw(v38);
  }
LABEL_4:
  v12 = objc_msgSend(a4, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v12 < location + length)
  {
    if (!v12)
    {
      v20 = _os_log_pack_size();
      v22 = (char *)v53 - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = _os_log_pack_fill();
      v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v24, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
      objc_exception_throw(v25);
    }
    v39 = v12;
    v40 = _os_log_pack_size();
    v42 = (char *)v53 - ((MEMORY[0x1E0C80A78](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
    v43 = _os_log_pack_fill();
    v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v43, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, --v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v44, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, v39);
    v45 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v42, v40);
    objc_exception_throw(v45);
  }
  v13 = -[NSOrderedSet count](self, "count");
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      v26 = _os_log_pack_size();
      v28 = (char *)v53 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v30, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v31);
    }
    v46 = v13;
    v47 = _os_log_pack_size();
    v49 = (char *)v53 - ((MEMORY[0x1E0C80A78](v47, v48) + 15) & 0xFFFFFFFFFFFFFFF0);
    v50 = _os_log_pack_fill();
    v51 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v50, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, --v46);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v51, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, v46);
    v52 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v49, v47);
    objc_exception_throw(v52);
  }
  if (length >> 60)
  {
    v32 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v33 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v32, 0);
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (length <= 1)
    v15 = 1;
  else
    v15 = length;
  v16 = MEMORY[0x1E0C80A78](v15, v14);
  v18 = (char *)v53 - v17;
  v53[0] = 0;
  if (length >= 0x101)
  {
    v18 = (char *)_CFCreateArrayStorage(v16, 0, v53);
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v18, location, length, v53[0]);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
  free(v19);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  double v22;
  NSException *v23;
  CFStringRef v24;
  NSException *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSException *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  NSException *v37;
  size_t v38[2];

  length = a3.length;
  location = a3.location;
  v38[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a4)
      goto LABEL_4;
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)v38 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
LABEL_4:
  v9 = -[NSOrderedSet count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v18 = _os_log_pack_size();
      v20 = (char *)v38 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v22, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
      objc_exception_throw(v23);
    }
    v31 = _os_log_pack_size();
    v33 = (char *)v38 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    v35 = v10 - 1;
    v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v34, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v35);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v36, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v35);
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v37);
  }
  v11 = objc_msgSend(a4, "count");
  v13 = v11;
  if (v11 >> 60)
  {
    v24 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v11);
    v25 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v24, 0);
    CFRelease(v24);
    objc_exception_throw(v25);
  }
  if (v11 <= 1)
    v11 = 1;
  v14 = MEMORY[0x1E0C80A78](v11, v12);
  v16 = (char *)v38 - v15;
  v38[0] = 0;
  if (v13 >= 0x101)
  {
    v16 = (char *)_CFCreateArrayStorage(v14, 0, v38);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a4, "getObjects:range:", v16, 0, v13, v38[0]);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  double v22;
  NSException *v23;
  CFStringRef v24;
  NSException *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSException *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  NSException *v37;
  size_t v38[2];

  length = a3.length;
  location = a3.location;
  v38[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a4)
      goto LABEL_4;
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a4) & 1) == 0)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)v38 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
LABEL_4:
  v9 = -[NSOrderedSet count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v18 = _os_log_pack_size();
      v20 = (char *)v38 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v22, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length);
      v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
      objc_exception_throw(v23);
    }
    v31 = _os_log_pack_size();
    v33 = (char *)v38 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    v35 = v10 - 1;
    v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v34, (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length, v35);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v36, "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]", location, length, v35);
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v37);
  }
  v11 = objc_msgSend(a4, "count");
  v13 = v11;
  if (v11 >> 60)
  {
    v24 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v11);
    v25 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v24, 0);
    CFRelease(v24);
    objc_exception_throw(v25);
  }
  if (v11 <= 1)
    v11 = 1;
  v14 = MEMORY[0x1E0C80A78](v11, v12);
  v16 = (char *)v38 - v15;
  v38[0] = 0;
  if (v13 >= 0x101)
  {
    v16 = (char *)_CFCreateArrayStorage(v14, 0, v38);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a4, "getObjects:count:", v16, v13, v38[0]);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)setArray:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableOrderedSet setArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableOrderedSet setArray:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
LABEL_4:
  -[NSMutableOrderedSet removeAllObjects](self, "removeAllObjects");
  -[NSMutableOrderedSet insertObjectsFromArray:atIndex:](self, "insertObjectsFromArray:atIndex:", a3, 0);
}

- (void)setObject:(id)obj atIndex:(NSUInteger)idx
{
  uint64_t v4;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (obj)
      goto LABEL_3;
LABEL_9:
    v9 = _os_log_pack_size();
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSMutableOrderedSet setObject:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableOrderedSet setObject:atIndex:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  if (!obj)
    goto LABEL_9;
LABEL_3:
  v8 = -[NSOrderedSet count](self, "count");
  if ((idx & 0x8000000000000000) != 0 || v8 < idx)
  {
    if (v8)
    {
      v15 = v8;
      v12 = _os_log_pack_size();
      v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSMutableOrderedSet setObject:atIndex:]", idx, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v17, "-[NSMutableOrderedSet setObject:atIndex:]", idx, v15);
    }
    else
    {
      v12 = _os_log_pack_size();
      v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v14 = _os_log_pack_fill();
      *(_DWORD *)v14 = 136315394;
      *(_QWORD *)(v14 + 4) = "-[NSMutableOrderedSet setObject:atIndex:]";
      *(_WORD *)(v14 + 12) = 2048;
      *(_QWORD *)(v14 + 14) = idx;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[NSMutableOrderedSet setObject:atIndex:]", idx);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v18);
  }
  if (-[NSOrderedSet count](self, "count") == idx)
    -[NSMutableOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", obj, idx);
  else
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", idx, obj);
}

- (void)setObject:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_10:
    v8 = _os_log_pack_size();
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "-[NSMutableOrderedSet setObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableOrderedSet setObject:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    objc_exception_throw(v10);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!a3)
    goto LABEL_10;
LABEL_3:
  v6 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v6);
  if (v7 != a3)
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v6, a3);
}

- (void)setOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableOrderedSet setOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableOrderedSet setOrderedSet:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
LABEL_4:
  if (self != a3)
  {
    -[NSMutableOrderedSet removeAllObjects](self, "removeAllObjects");
    -[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:](self, "insertObjectsFromOrderedSet:atIndex:", a3, 0);
  }
}

- (void)setSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableOrderedSet setSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableOrderedSet setSet:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
LABEL_4:
  -[NSMutableOrderedSet removeAllObjects](self, "removeAllObjects");
  -[NSMutableOrderedSet insertObjectsFromSet:atIndex:](self, "insertObjectsFromSet:atIndex:", a3, 0);
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMutableOrderedSet;
  return (id)objc_msgSend(-[NSOrderedSet sortedArrayFromRange:options:usingComparator:](&v6, sel_sortedArrayFromRange_options_usingComparator_, a3.location, a3.length, a4, a5), "copy");
}

- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  uint64_t v4;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr)
      goto LABEL_3;
LABEL_6:
    v9 = _os_log_pack_size();
    v11 = (char *)v14 - ((MEMORY[0x1E0C80A78](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSMutableOrderedSet sortWithOptions:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSMutableOrderedSet sortWithOptions:usingComparator:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v9);
    objc_exception_throw(v13);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!cmptr)
    goto LABEL_6;
LABEL_3:
  v8 = -[NSOrderedSet count](self, "count");
  if (v8 >= 2)
    -[NSMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v8, opts, cmptr);
}

- (NSMutableOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  NSMutableOrderedSet *v7;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableOrderedSet initWithObjects:count:]", a4);
    goto LABEL_12;
  }
  if (a4 >> 61)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableOrderedSet initWithObjects:count:]", a4);
LABEL_12:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v16);
  }
  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v9 = _os_log_pack_size();
        v10 = _os_log_pack_fill();
        *(_DWORD *)v10 = 136315394;
        *(_QWORD *)(v10 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
        *(_WORD *)(v10 + 12) = 2048;
        *(_QWORD *)(v10 + 14) = i;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableOrderedSet initWithObjects:count:]", i);
        v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
        objc_exception_throw(v11);
      }
    }
  }
  v7 = -[NSMutableOrderedSet initWithCapacity:](self, "initWithCapacity:", a4);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](v7, "insertObjects:count:atIndex:", a3, a4, 0);
  return v7;
}

- (void)insertObject:(id)object atIndex:(NSUInteger)idx
{
  objc_class *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(v4, v5);
}

- (void)removeObjectAtIndex:(NSUInteger)idx
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(v3, v4);
}

- (void)replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object
{
  objc_class *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(v4, v5);
}

- (NSMutableOrderedSet)initWithCapacity:(NSUInteger)numItems
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_1();
  __CFLookUpClass("NSMutableOrderedSet");
  OUTLINED_FUNCTION_1_1();
  __CFRequireConcreteImplementation(v3, v4);
}

@end
