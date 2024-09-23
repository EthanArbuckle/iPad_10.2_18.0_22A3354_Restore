@implementation NSMutableArray

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v12;
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
  NSUInteger v39;
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

  length = otherRange.length;
  location = otherRange.location;
  v9 = range.length;
  v10 = range.location;
  v53[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (!otherArray)
      goto LABEL_4;
  }
  else if (!otherArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    v34 = _os_log_pack_size();
    v36 = (char *)v53 - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = _os_log_pack_fill();
    *(_DWORD *)v37 = 136315138;
    *(_QWORD *)(v37 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]");
    v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
    objc_exception_throw(v38);
  }
LABEL_4:
  v12 = -[NSArray count](otherArray, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v12 < location + length)
  {
    if (!v12)
    {
      v20 = _os_log_pack_size();
      v22 = (char *)v53 - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = _os_log_pack_fill();
      v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v24, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length);
      v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
      objc_exception_throw(v25);
    }
    v39 = v12;
    v40 = _os_log_pack_size();
    v42 = (char *)v53 - ((MEMORY[0x1E0C80A78](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
    v43 = _os_log_pack_fill();
    v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v43, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length, --v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v44, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", location, length, v39);
    v45 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v42, v40);
    objc_exception_throw(v45);
  }
  v13 = -[NSArray count](self, "count");
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      v26 = _os_log_pack_size();
      v28 = (char *)v53 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v30, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9);
      v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v31);
    }
    v46 = v13;
    v47 = _os_log_pack_size();
    v49 = (char *)v53 - ((MEMORY[0x1E0C80A78](v47, v48) + 15) & 0xFFFFFFFFFFFFFFF0);
    v50 = _os_log_pack_fill();
    v51 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v50, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, --v46);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v51, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]", v10, v9, v46);
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
  -[NSArray getObjects:range:](otherArray, "getObjects:range:", v18, location, length, v53[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
  free(v19);
}

+ (NSMutableArray)arrayWithCapacity:(NSUInteger)numItems
{
  return (NSMutableArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:", numItems);
}

- (void)sortUsingSelector:(SEL)comparator
{
  uint64_t v3;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (comparator)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!comparator)
LABEL_3:
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", 0);
LABEL_4:
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NSMutableArray_sortUsingSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v6[4] = comparator;
  -[NSMutableArray sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0, v6);
}

- (void)sortUsingFunction:(NSInteger (__cdecl *)compare context:
{
  uint64_t v4;
  NSException *v8;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (compare)
      goto LABEL_3;
LABEL_5:
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: function pointer cannot be NULL"), "-[NSMutableArray sortUsingFunction:context:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v8);
  }
  if (!compare)
    goto LABEL_5;
LABEL_3:
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__NSMutableArray_sortUsingFunction_context___block_invoke;
  v9[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v9[4] = compare;
  v9[5] = context;
  -[NSMutableArray sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0, v9);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr)
      goto LABEL_3;
LABEL_6:
    v9 = _os_log_pack_size();
    v11 = (char *)v14 - ((MEMORY[0x1E0C80A78](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSMutableArray sortWithOptions:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSMutableArray sortWithOptions:usingComparator:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v9);
    objc_exception_throw(v13);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!cmptr)
    goto LABEL_6;
LABEL_3:
  v8 = -[NSArray count](self, "count");
  if (v8 >= 2)
    -[NSMutableArray sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v8, opts, cmptr);
}

- (void)removeObject:(id)anObject
{
  uint64_t v3;
  NSUInteger v5;
  id v6;
  NSUInteger v7;

  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  v5 = -[NSArray count](self, "count");
  v6 = anObject;
  if (v5)
  {
    v7 = v5 - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v7) == anObject
        || objc_msgSend(anObject, "isEqual:"))
      {
        -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v7);
      }
      --v7;
    }
    while (v7 != -1);
  }

}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
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

  v7 = a4;
  length = a3.length;
  location = a3.location;
  v50[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a5)
      goto LABEL_3;
LABEL_27:
    v28 = _os_log_pack_size();
    v30 = (char *)&v47 - ((MEMORY[0x1E0C80A78](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136315138;
    *(_QWORD *)(v31 + 4) = "-[NSMutableArray sortRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSMutableArray sortRange:options:usingComparator:]");
    v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v30, v28);
    objc_exception_throw(v32);
  }
  if (!a5)
    goto LABEL_27;
LABEL_3:
  v11 = -[NSArray count](self, "count");
  v13 = v11;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (!v11)
    {
      v33 = _os_log_pack_size();
      v35 = (char *)&v47 - ((MEMORY[0x1E0C80A78](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
      v36 = _os_log_pack_fill();
      v37 = __os_log_helper_1_2_3_8_32_8_0_8_0(v36, (uint64_t)"-[NSMutableArray sortRange:options:usingComparator:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v37, "-[NSMutableArray sortRange:options:usingComparator:]", location, length);
      v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v35, v33);
      objc_exception_throw(v38);
    }
    v39 = _os_log_pack_size();
    v41 = (char *)&v47 - ((MEMORY[0x1E0C80A78](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    v42 = _os_log_pack_fill();
    v43 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v42, (uint64_t)"-[NSMutableArray sortRange:options:usingComparator:]", location, length, v13 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v43, "-[NSMutableArray sortRange:options:usingComparator:]", location, length, v13 - 1);
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
    v18 = -[NSArray getObjects:range:](self, "getObjects:range:", v17, location, length, v47);
    MEMORY[0x1E0C80A78](v18, v19);
    v21 = (char *)&v47 - v20;
    v22 = (char *)&v47 - v20;
    if (length > 0x1000)
      v22 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __52__NSMutableArray_sortRange_options_usingComparator___block_invoke;
    v49[3] = &unk_1E12E12E0;
    v49[4] = a5;
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
    -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length);
    if (v21 != v22)
      free(v22);
    free(v25);
    free(v47);
  }
}

- (void)addObjectsFromArray:(NSArray *)otherArray
{
  uint64_t v3;
  NSArray *v4;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  NSException *v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v4 = otherArray;
  v28 = *MEMORY[0x1E0C80C00];
  if (otherArray)
  {
    if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
    {
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray addObjectsFromArray:]");
      v6 = _CFAutoreleasePoolAddObject();
      CFLog(3, (uint64_t)CFSTR("%@"), v7, v8, v9, v10, v11, v12, v6);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = +[NSArray array](NSMutableArray, "array");
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v4);
              -[NSArray addObject:](v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            }
            v15 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          }
          while (v15);
        }
        v4 = v13;
      }
    }
  }
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!v4)
      goto LABEL_15;
  }
  else if (!v4)
  {
    goto LABEL_15;
  }
  if ((_NSIsNSArray((uint64_t)v4) & 1) == 0)
  {
    v18 = _os_log_pack_size();
    v20 = &v23[-((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0)];
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSMutableArray addObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray addObjectsFromArray:]");
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
    objc_exception_throw(v22);
  }
LABEL_15:
  -[NSMutableArray insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", v4, 0, -[NSArray count](v4, "count"), -[NSArray count](self, "count"));
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v35 + 4) = "-[NSMutableArray insertObjectsFromArray:range:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray insertObjectsFromArray:range:atIndex:]");
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
      v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v23, "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length);
      v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v21, v19);
      objc_exception_throw(v24);
    }
    v37 = v11;
    v38 = _os_log_pack_size();
    v40 = (char *)v51 - ((MEMORY[0x1E0C80A78](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = _os_log_pack_fill();
    v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v41, (uint64_t)"-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length, --v37);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v42, "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", location, length, v37);
    v43 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v40, v38);
    objc_exception_throw(v43);
  }
  v12 = -[NSArray count](self, "count");
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      v25 = _os_log_pack_size();
      v27 = (char *)v51 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = _os_log_pack_fill();
      *(_DWORD *)v28 = 136315394;
      *(_QWORD *)(v28 + 4) = "-[NSMutableArray insertObjectsFromArray:range:atIndex:]";
      *(_WORD *)(v28 + 12) = 2048;
      *(_QWORD *)(v28 + 14) = a5;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", a5);
      v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
      objc_exception_throw(v29);
    }
    v44 = v12;
    v45 = _os_log_pack_size();
    v47 = (char *)v51 - ((MEMORY[0x1E0C80A78](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
    v48 = _os_log_pack_fill();
    v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableArray insertObjectsFromArray:range:atIndex:]", a5, --v44);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v49, "-[NSMutableArray insertObjectsFromArray:range:atIndex:]", a5, v44);
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
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v17, length, a5);
  free(v18);
}

uint64_t __52__NSMutableArray_sortRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3));
}

uint64_t __44__NSMutableArray_sortUsingFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

id __36__NSMutableArray_sortUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(a2, *(SEL *)(a1 + 32));
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  NSSet *v17;
  NSSet *v18;
  NSUInteger v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  NSException *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  _QWORD v38[2];

  length = a5.length;
  location = a5.location;
  v9 = a3.length;
  v10 = a3.location;
  v38[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  v12 = -[NSArray count](self, "count");
  v13 = v12;
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (v12)
    {
      v20 = _os_log_pack_size();
      v21 = (char *)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      v31 = _os_log_pack_fill();
      v32 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v31, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9, v13 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v32, "-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9, v13 - 1);
    }
    else
    {
      v20 = _os_log_pack_size();
      v21 = (char *)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = _os_log_pack_fill();
      v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v23, "-[NSMutableArray removeObjectsInRange:inArray:range:]", v10, v9);
    }
    v33 = _CFAutoreleasePoolAddObject();
    v34 = v21;
    v35 = v20;
LABEL_26:
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v33, 0, v34, v35));
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v28 = _os_log_pack_size();
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSMutableArray removeObjectsInRange:inArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray removeObjectsInRange:inArray:range:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v38 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
    objc_exception_throw(v30);
  }
  v14 = objc_msgSend(a4, "count");
  v15 = v14;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v14 < location + length)
  {
    if (v14)
    {
      v24 = _os_log_pack_size();
      v25 = (char *)v38 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
      v36 = _os_log_pack_fill();
      v37 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length, v15 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v37, "-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length, v15 - 1);
    }
    else
    {
      v24 = _os_log_pack_size();
      v25 = (char *)v38 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
      v26 = _os_log_pack_fill();
      v27 = __os_log_helper_1_2_3_8_32_8_0_8_0(v26, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v27, "-[NSMutableArray removeObjectsInRange:inArray:range:]", location, length);
    }
    v33 = _CFAutoreleasePoolAddObject();
    v34 = v25;
    v35 = v24;
    goto LABEL_26;
  }
  v16 = (void *)_CFAutoreleasePoolPush();
  v17 = +[NSSet setWithArray:range:copyItems:](NSSet, "setWithArray:range:copyItems:", a4, location, length, 0);
  if (v9)
  {
    v18 = v17;
    v19 = v9 - 1;
    do
    {
      if (-[NSSet containsObject:](v18, "containsObject:", -[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + v19)))
      {
        -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v19);
      }
      --v19;
    }
    while (v19 != -1);
  }
  _CFAutoreleasePoolPop(v16);
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMutableArray;
  return (id)objc_msgSend(-[NSArray sortedArrayFromRange:options:usingComparator:](&v6, sel_sortedArrayFromRange_options_usingComparator_, a3.location, a3.length, a4, a5), "copy");
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr)
      goto LABEL_3;
LABEL_6:
    v7 = _os_log_pack_size();
    v9 = (char *)v12 - ((MEMORY[0x1E0C80A78](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSMutableArray sortUsingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSMutableArray sortUsingComparator:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v7);
    objc_exception_throw(v11);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (!cmptr)
    goto LABEL_6;
LABEL_3:
  v6 = -[NSArray count](self, "count");
  if (v6 >= 2)
    -[NSMutableArray sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, v6, 0, cmptr);
}

- (void)removeObjectsInArray:(NSArray *)otherArray
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!otherArray)
      goto LABEL_4;
  }
  else if (!otherArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v8 = (char *)v11 - ((MEMORY[0x1E0C80A78](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "-[NSMutableArray removeObjectsInArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray removeObjectsInArray:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
LABEL_4:
  -[NSMutableArray removeObjectsInRange:inArray:range:](self, "removeObjectsInRange:inArray:range:", 0, -[NSArray count](self, "count"), otherArray, 0, -[NSArray count](otherArray, "count"));
}

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v53 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]");
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
    *(_QWORD *)(v29 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v31 = _os_log_pack_size();
    v33 = (char *)v55 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136315138;
    *(_QWORD *)(v34 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]");
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v35);
  }
  v8 = -[NSArray count](self, "count");
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
        *(_QWORD *)(v40 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
        *(_WORD *)(v40 + 12) = 2048;
        *(_QWORD *)(v40 + 14) = v36;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty array"), "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v36);
        v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v39, v37);
        objc_exception_throw(v41);
      }
      v42 = _os_log_pack_size();
      v44 = (char *)v55 - ((MEMORY[0x1E0C80A78](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
      v45 = _os_log_pack_fill();
      v46 = __os_log_helper_1_2_3_8_32_8_0_8_0(v45, (uint64_t)"-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v36, v11 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v46, "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v36, v11 - 1);
      v47 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v44, v42);
      objc_exception_throw(v47);
    }
  }
  v12 = -[NSArray count](objects, "count");
  v13 = -[NSIndexSet count](indexes, "count");
  if (v12 != v13)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of array (%lu) differs from count of index set (%lu)"), "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]", v12, v13);
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
    -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v23, v24, &v19[8 * v21], v24);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (indexes)
      goto LABEL_3;
LABEL_12:
    v14 = _os_log_pack_size();
    v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableArray removeObjectsAtIndexes:]");
    goto LABEL_14;
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (!indexes)
    goto LABEL_12;
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableArray removeObjectsAtIndexes:]");
LABEL_14:
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v18);
  }
  v6 = -[NSArray count](self, "count");
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
        v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray removeObjectsAtIndexes:]", v19, v22);
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v23, "-[NSMutableArray removeObjectsAtIndexes:]", v19, v22);
      }
      else
      {
        *(_DWORD *)v21 = 136315394;
        *(_QWORD *)(v21 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
        *(_WORD *)(v21 + 12) = 2048;
        *(_QWORD *)(v21 + 14) = v19;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty array"), "-[NSMutableArray removeObjectsAtIndexes:]", v19);
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
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v12, v13);
      --v11;
    }
    while (v11 != -1);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v53 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray insertObjects:atIndexes:]");
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
    *(_QWORD *)(v29 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableArray insertObjects:atIndexes:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v31 = _os_log_pack_size();
    v33 = (char *)v55 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136315138;
    *(_QWORD *)(v34 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableArray insertObjects:atIndexes:]");
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v35);
  }
  v8 = -[NSArray count](self, "count");
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
        *(_QWORD *)(v40 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
        *(_WORD *)(v40 + 12) = 2048;
        *(_QWORD *)(v40 + 14) = v36;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty array"), "-[NSMutableArray insertObjects:atIndexes:]", v36);
        v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v39, v37);
        objc_exception_throw(v41);
      }
      v42 = _os_log_pack_size();
      v44 = (char *)v55 - ((MEMORY[0x1E0C80A78](v42, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
      v45 = _os_log_pack_fill();
      v46 = __os_log_helper_1_2_3_8_32_8_0_8_0(v45, (uint64_t)"-[NSMutableArray insertObjects:atIndexes:]", v36, v11 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v46, "-[NSMutableArray insertObjects:atIndexes:]", v36, v11 - 1);
      v47 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v44, v42);
      objc_exception_throw(v47);
    }
  }
  v12 = -[NSArray count](objects, "count");
  v13 = -[NSIndexSet count](indexes, "count");
  if (v12 != v13)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of array (%lu) differs from count of index set (%lu)"), "-[NSMutableArray insertObjects:atIndexes:]", v12, v13);
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
    -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", &v19[8 * v21], v24, v23);
    v21 += v25;
  }
  free(v20);
}

- (void)removeObjectIdenticalTo:(id)anObject
{
  uint64_t v3;
  NSUInteger v5;
  id v6;
  NSUInteger v7;

  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  v5 = -[NSArray count](self, "count");
  v6 = anObject;
  if (v5)
  {
    v7 = v5 - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v7) == anObject)
        -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v7);
      --v7;
    }
    while (v7 != -1);
  }

}

- (void)removeAllObjects
{
  uint64_t v2;
  NSUInteger v4;
  NSUInteger v5;

  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  v4 = -[NSArray count](self, "count");
  if (v4)
  {
    v5 = v4 - 1;
    do
      -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v5--);
    while (v5 != -1);
  }
}

- (NSMutableArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  NSMutableArray *v7;
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
    *(_QWORD *)(v14 + 4) = "-[NSMutableArray initWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableArray initWithObjects:count:]", a4);
    goto LABEL_12;
  }
  if (a4 >> 61)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSMutableArray initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableArray initWithObjects:count:]", a4);
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
        *(_QWORD *)(v10 + 4) = "-[NSMutableArray initWithObjects:count:]";
        *(_WORD *)(v10 + 12) = 2048;
        *(_QWORD *)(v10 + 14) = i;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableArray initWithObjects:count:]", i);
        v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
        objc_exception_throw(v11);
      }
    }
  }
  v7 = -[NSMutableArray initWithCapacity:](self, "initWithCapacity:", a4);
  -[NSMutableArray insertObjects:count:atIndex:](v7, "insertObjects:count:atIndex:", a3, a4, 0);
  return v7;
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSException *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  double v26;
  NSException *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a4)
  {
    v16 = _os_log_pack_size();
    v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315394;
    *(_QWORD *)(v18 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(_QWORD *)(v18 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableArray insertObjects:count:atIndex:]", a4);
    goto LABEL_19;
  }
LABEL_4:
  if (a4 >> 61)
  {
    v16 = _os_log_pack_size();
    v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableArray insertObjects:count:atIndex:]", a4);
LABEL_19:
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v16);
    objc_exception_throw(v20);
  }
  if (a4)
  {
    v10 = 0;
    do
    {
      if (!a3[v10])
      {
        v13 = _os_log_pack_size();
        v14 = _os_log_pack_fill();
        *(_DWORD *)v14 = 136315394;
        *(_QWORD *)(v14 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
        *(_WORD *)(v14 + 12) = 2048;
        *(_QWORD *)(v14 + 14) = v10;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableArray insertObjects:count:atIndex:]", v10);
        v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
        objc_exception_throw(v15);
      }
      ++v10;
    }
    while (a4 != v10);
  }
  v11 = -[NSArray count](self, "count");
  if ((a5 & 0x8000000000000000) != 0 || v11 < a5)
  {
    if (v11)
    {
      v24 = v11;
      v21 = _os_log_pack_size();
      v22 = (char *)v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = _os_log_pack_fill();
      v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSMutableArray insertObjects:count:atIndex:]", a5, --v24);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v26, "-[NSMutableArray insertObjects:count:atIndex:]", a5, v24);
    }
    else
    {
      v21 = _os_log_pack_size();
      v22 = (char *)v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = _os_log_pack_fill();
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)(v23 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
      *(_WORD *)(v23 + 12) = 2048;
      *(_QWORD *)(v23 + 14) = a5;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray insertObjects:count:atIndex:]", a5);
    }
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v22, v21);
    objc_exception_throw(v27);
  }
  for (; a4; --a4)
  {
    v12 = (uint64_t)*a3++;
    -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v12, a5++);
  }
}

- (id)arrayByAddingObjectsFromArray:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  id *v11;
  id *v12;
  unint64_t v13;
  id v14;
  NSArray *v15;
  CFStringRef v17;
  NSException *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSException *v23;
  size_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v19 = _os_log_pack_size();
    v21 = (char *)&v24 - ((MEMORY[0x1E0C80A78](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136315138;
    *(_QWORD *)(v22 + 4) = "-[NSMutableArray arrayByAddingObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray arrayByAddingObjectsFromArray:]");
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v21, v19);
    objc_exception_throw(v23);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = objc_msgSend(a3, "count");
  v7 = -[NSArray count](self, "count");
  v8 = v7 + v6;
  if ((v7 + v6) >> 60)
  {
    v17 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7 + v6);
    v18 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v17, 0);
    CFRelease(v17);
    objc_exception_throw(v18);
  }
  v9 = v7;
  v24 = 0;
  if (v8 <= 1)
    v10 = 1;
  else
    v10 = v7 + v6;
  v11 = (id *)_CFCreateArrayStorage(v10, 0, &v24);
  if (v9)
    -[NSArray getObjects:range:](self, "getObjects:range:", v11, 0, v9, v24, v25);
  if (v6)
    objc_msgSend(a3, "getObjects:range:", &v11[v9], 0, v6);
  if (v11)
  {
    if (v8)
    {
      v12 = v11;
      v13 = v8;
      do
      {
        v14 = *v12++;
        --v13;
      }
      while (v13);
    }
    v15 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v11, v8, v8);
  }
  else
  {
    v15 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v8);
  }
  return v15;
}

- (void)setArray:(NSArray *)otherArray
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSException *v18;
  CFStringRef v19;
  NSException *v20;
  size_t v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!otherArray)
      goto LABEL_4;
  }
  else if (!otherArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v16 = (char *)v21 - ((MEMORY[0x1E0C80A78](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSMutableArray setArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray setArray:]");
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v16, v14);
    objc_exception_throw(v18);
  }
LABEL_4:
  if (self != (NSMutableArray *)otherArray)
  {
    v6 = -[NSArray count](self, "count");
    v7 = -[NSArray count](otherArray, "count");
    v9 = v7;
    if (v7 >> 60)
    {
      v19 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
      v20 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v19, 0);
      CFRelease(v19);
      objc_exception_throw(v20);
    }
    if (v7 <= 1)
      v7 = 1;
    v10 = MEMORY[0x1E0C80A78](v7, v8);
    v12 = (char *)v21 - v11;
    v21[0] = 0;
    if (v9 >= 0x101)
    {
      v12 = (char *)_CFCreateArrayStorage(v10, 0, v21);
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    -[NSArray getObjects:range:](otherArray, "getObjects:range:", v12, 0, v9, v21[0]);
    -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", 0, v6, v12, v9);
    free(v13);
  }
}

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
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

  length = range.length;
  location = range.location;
  v38[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (!otherArray)
      goto LABEL_4;
  }
  else if (!otherArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)v38 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
LABEL_4:
  v9 = -[NSArray count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v18 = _os_log_pack_size();
      v20 = (char *)v38 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v22, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length);
      v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
      objc_exception_throw(v23);
    }
    v31 = _os_log_pack_size();
    v33 = (char *)v38 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    v35 = v10 - 1;
    v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v34, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length, v35);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v36, "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]", location, length, v35);
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v37);
  }
  v11 = -[NSArray count](otherArray, "count");
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
  -[NSArray getObjects:range:](otherArray, "getObjects:range:", v16, 0, v13, v38[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)addObject:(id)anObject
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (anObject)
      goto LABEL_3;
LABEL_5:
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableArray addObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableArray addObject:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (!anObject)
    goto LABEL_5;
LABEL_3:
  -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", anObject, -[NSArray count](self, "count"));
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a4)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[NSMutableArray addObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableArray addObjects:count:]", a4);
    goto LABEL_15;
  }
LABEL_4:
  if (a4 >> 61)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSMutableArray addObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableArray addObjects:count:]", a4);
LABEL_15:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v16);
  }
  if (a4)
  {
    v8 = 0;
    do
    {
      if (!a3[v8])
      {
        v9 = _os_log_pack_size();
        v10 = _os_log_pack_fill();
        *(_DWORD *)v10 = 136315394;
        *(_QWORD *)(v10 + 4) = "-[NSMutableArray addObjects:count:]";
        *(_WORD *)(v10 + 12) = 2048;
        *(_QWORD *)(v10 + 14) = v8;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableArray addObjects:count:]", v8);
        v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
        objc_exception_throw(v11);
      }
      ++v8;
    }
    while (a4 != v8);
  }
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", a3, a4, -[NSArray count](self, "count"));
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v15 + 4) = "-[NSMutableArray addObjectsFromArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray addObjectsFromArray:range:]");
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
      v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSMutableArray addObjectsFromArray:range:]", location, length, --v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v19, "-[NSMutableArray addObjectsFromArray:range:]", location, length, v17);
    }
    else
    {
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableArray addObjectsFromArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v13, "-[NSMutableArray addObjectsFromArray:range:]", location, length);
    }
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v20);
  }
  -[NSMutableArray insertObjectsFromArray:range:atIndex:](self, "insertObjectsFromArray:range:atIndex:", a3, location, length, -[NSArray count](self, "count"));
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v15 + 4) = "-[NSMutableArray addObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray addObjectsFromOrderedSet:range:]");
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
      v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length, --v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v19, "-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length, v17);
    }
    else
    {
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v13, "-[NSMutableArray addObjectsFromOrderedSet:range:]", location, length);
    }
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v20);
  }
  -[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, location, length, -[NSArray count](self, "count"));
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v9 + 4) = "-[NSMutableArray addObjectsFromOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray addObjectsFromOrderedSet:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
LABEL_4:
  -[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:](self, "insertObjectsFromOrderedSet:range:atIndex:", a3, 0, objc_msgSend(a3, "count"), -[NSArray count](self, "count"));
}

- (void)addObjectsFromSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v7 + 4) = "-[NSMutableArray addObjectsFromSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableArray addObjectsFromSet:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
LABEL_4:
  -[NSMutableArray insertObjectsFromSet:atIndex:](self, "insertObjectsFromSet:atIndex:", a3, -[NSArray count](self, "count"));
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
  uint64_t v4;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  id v11;
  id v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  double v27;
  id v28[2];

  v28[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v8 = -[NSArray count](self, "count");
  if ((idx1 & 0x8000000000000000) != 0 || v8 <= idx1)
  {
    if (v8)
    {
      v19 = v8;
      v13 = _os_log_pack_size();
      v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      v21 = __os_log_helper_1_2_3_8_32_8_0_8_0(v20, (uint64_t)"-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx1, --v19);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v21, "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx1, v19);
    }
    else
    {
      v13 = _os_log_pack_size();
      v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      v15 = _os_log_pack_fill();
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)(v15 + 4) = "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(_QWORD *)(v15 + 14) = idx1;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx1);
    }
    v22 = _CFAutoreleasePoolAddObject();
    v23 = v14;
    v24 = v13;
LABEL_22:
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v22, 0, v23, v24));
  }
  v9 = -[NSArray count](self, "count");
  if ((idx2 & 0x8000000000000000) != 0 || v9 <= idx2)
  {
    if (v9)
    {
      v25 = v9;
      v16 = _os_log_pack_size();
      v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      v26 = _os_log_pack_fill();
      v27 = __os_log_helper_1_2_3_8_32_8_0_8_0(v26, (uint64_t)"-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx2, --v25);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v27, "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx2, v25);
    }
    else
    {
      v16 = _os_log_pack_size();
      v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = _os_log_pack_fill();
      *(_DWORD *)v18 = 136315394;
      *(_QWORD *)(v18 + 4) = "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v18 + 12) = 2048;
      *(_QWORD *)(v18 + 14) = idx2;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]", idx2);
    }
    v22 = _CFAutoreleasePoolAddObject();
    v23 = v17;
    v24 = v16;
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
    v28[0] = -[NSArray objectAtIndex:](self, "objectAtIndex:", idx2);
    v11 = -[NSArray objectAtIndex:](self, "objectAtIndex:", v10);
    v12 = v28[0];
    -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", idx2, v11);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v10, v28[0]);

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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v27 + 4) = "-[NSMutableArray insertObjectsFromArray:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray insertObjectsFromArray:atIndex:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v8 = -[NSArray count](self, "count");
  v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      v17 = _os_log_pack_size();
      v19 = (char *)v36 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v20 + 4) = "-[NSMutableArray insertObjectsFromArray:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(_QWORD *)(v20 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray insertObjectsFromArray:atIndex:]", a4);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
      objc_exception_throw(v21);
    }
    v29 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    v33 = v9 - 1;
    v34 = __os_log_helper_1_2_3_8_32_8_0_8_0(v32, (uint64_t)"-[NSMutableArray insertObjectsFromArray:atIndex:]", a4, v33);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v34, "-[NSMutableArray insertObjectsFromArray:atIndex:]", a4, v33);
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
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v15, v12, a4);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v35 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]");
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
      v23 = __os_log_helper_1_2_3_8_32_8_0_8_0(v22, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v23, "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length);
      v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v21, v19);
      objc_exception_throw(v24);
    }
    v37 = v11;
    v38 = _os_log_pack_size();
    v40 = (char *)v51 - ((MEMORY[0x1E0C80A78](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = _os_log_pack_fill();
    v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v41, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length, --v37);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v42, "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", location, length, v37);
    v43 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v40, v38);
    objc_exception_throw(v43);
  }
  v12 = -[NSArray count](self, "count");
  if ((a5 & 0x8000000000000000) != 0 || v12 < a5)
  {
    if (!v12)
    {
      v25 = _os_log_pack_size();
      v27 = (char *)v51 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = _os_log_pack_fill();
      *(_DWORD *)v28 = 136315394;
      *(_QWORD *)(v28 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]";
      *(_WORD *)(v28 + 12) = 2048;
      *(_QWORD *)(v28 + 14) = a5;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", a5);
      v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
      objc_exception_throw(v29);
    }
    v44 = v12;
    v45 = _os_log_pack_size();
    v47 = (char *)v51 - ((MEMORY[0x1E0C80A78](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
    v48 = _os_log_pack_fill();
    v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v48, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", a5, --v44);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v49, "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]", a5, v44);
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
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v17, length, a5);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v27 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v8 = -[NSArray count](self, "count");
  v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      v17 = _os_log_pack_size();
      v19 = (char *)v36 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v20 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(_QWORD *)(v20 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]", a4);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
      objc_exception_throw(v21);
    }
    v29 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    v33 = v9 - 1;
    v34 = __os_log_helper_1_2_3_8_32_8_0_8_0(v32, (uint64_t)"-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]", a4, v33);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v34, "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]", a4, v33);
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
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v15, v12, a4);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v27 + 4) = "-[NSMutableArray insertObjectsFromSet:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableArray insertObjectsFromSet:atIndex:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v8 = -[NSArray count](self, "count");
  v9 = v8;
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (!v8)
    {
      v17 = _os_log_pack_size();
      v19 = (char *)v36 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v20 + 4) = "-[NSMutableArray insertObjectsFromSet:atIndex:]";
      *(_WORD *)(v20 + 12) = 2048;
      *(_QWORD *)(v20 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray insertObjectsFromSet:atIndex:]", a4);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
      objc_exception_throw(v21);
    }
    v29 = _os_log_pack_size();
    v31 = (char *)v36 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    v33 = v9 - 1;
    v34 = __os_log_helper_1_2_3_8_32_8_0_8_0(v32, (uint64_t)"-[NSMutableArray insertObjectsFromSet:atIndex:]", a4, v33);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v34, "-[NSMutableArray insertObjectsFromSet:atIndex:]", a4, v33);
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
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v15, v12, a4);
  free(v16);
}

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  uint64_t v4;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  unint64_t v14;
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_17:
    v23 = _os_log_pack_size();
    v25 = (char *)v58 - ((MEMORY[0x1E0C80A78](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    v26 = _os_log_pack_fill();
    *(_DWORD *)v26 = 136315138;
    *(_QWORD *)(v26 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableArray moveObjectsAtIndexes:toIndex:]");
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v25, v23);
    objc_exception_throw(v27);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a3)
    goto LABEL_17;
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v28 = _os_log_pack_size();
    v30 = (char *)v58 - ((MEMORY[0x1E0C80A78](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136315138;
    *(_QWORD *)(v31 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableArray moveObjectsAtIndexes:toIndex:]");
    v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v30, v28);
    objc_exception_throw(v32);
  }
  v8 = -[NSArray count](self, "count");
  v9 = objc_msgSend(0, "count");
  v10 = objc_msgSend(a3, "lastIndex");
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
        *(_QWORD *)(v37 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
        *(_WORD *)(v37 + 12) = 2048;
        *(_QWORD *)(v37 + 14) = v33;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty array"), "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", v33);
        v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
        objc_exception_throw(v38);
      }
      v39 = _os_log_pack_size();
      v41 = (char *)v58 - ((MEMORY[0x1E0C80A78](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
      v42 = _os_log_pack_fill();
      v43 = __os_log_helper_1_2_3_8_32_8_0_8_0(v42, (uint64_t)"-[NSMutableArray moveObjectsAtIndexes:toIndex:]", v33, v11 - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v43, "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", v33, v11 - 1);
      v44 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v41, v39);
      objc_exception_throw(v44);
    }
  }
  v12 = -[NSArray count](self, "count");
  v13 = objc_msgSend(a3, "countOfIndexesInRange:", 0, a4);
  v14 = v12 - v13;
  if ((a4 & 0x8000000000000000) != 0 || v14 < a4)
  {
    if (v12 == v13)
    {
      v45 = _os_log_pack_size();
      v47 = (char *)v58 - ((MEMORY[0x1E0C80A78](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0);
      v48 = _os_log_pack_fill();
      *(_DWORD *)v48 = 136315394;
      *(_QWORD *)(v48 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v48 + 12) = 2048;
      *(_QWORD *)(v48 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", a4);
      v49 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v47, v45);
      objc_exception_throw(v49);
    }
    v52 = _os_log_pack_size();
    v54 = (char *)v58 - ((MEMORY[0x1E0C80A78](v52, v53) + 15) & 0xFFFFFFFFFFFFFFF0);
    v55 = _os_log_pack_fill();
    v56 = __os_log_helper_1_2_3_8_32_8_0_8_0(v55, (uint64_t)"-[NSMutableArray moveObjectsAtIndexes:toIndex:]", a4, v14 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v56, "-[NSMutableArray moveObjectsAtIndexes:toIndex:]", a4, v14 - 1);
    v57 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v54, v52);
    objc_exception_throw(v57);
  }
  v15 = -[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", a3);
  -[NSMutableArray removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", a3);
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
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v21, v18, a4);
  free(v22);
}

- (void)removeFirstObject
{
  uint64_t v2;

  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  if (-[NSArray count](self, "count"))
    -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", 0);
}

- (void)removeLastObject
{
  uint64_t v2;
  NSUInteger v4;
  NSUInteger v5;

  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  v4 = -[NSArray count](self, "count");
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!v4)
      return;
    goto LABEL_5;
  }
  if (v4)
    v5 = v4 - 1;
  else
    v5 = 0;
  -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v5);
  if (v4)
LABEL_5:
    -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v4 - 1);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  v7 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v7 < location + length)
  {
    if (v7)
    {
      v12 = v7;
      v8 = _os_log_pack_size();
      v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectsInRange:]", location, length, --v12);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v14, "-[NSMutableArray removeObjectsInRange:]", location, length, v12);
    }
    else
    {
      v8 = _os_log_pack_size();
      v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      v10 = _os_log_pack_fill();
      v11 = __os_log_helper_1_2_3_8_32_8_0_8_0(v10, (uint64_t)"-[NSMutableArray removeObjectsInRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v11, "-[NSMutableArray removeObjectsInRange:]", location, length);
    }
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v15);
  }
  for (; length; --length)
    -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", location);
}

- (void)removeObject:(id)anObject inRange:(NSRange)range
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  id v9;
  NSUInteger v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  NSUInteger v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  id v19[2];

  length = range.length;
  location = range.location;
  v19[0] = anObject;
  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v8 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      v15 = v8;
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v16, (uint64_t)"-[NSMutableArray removeObject:inRange:]", location, length, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v17, "-[NSMutableArray removeObject:inRange:]", location, length, v15);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSMutableArray removeObject:inRange:]", location, length);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v18);
  }
  v9 = v19[0];
  if (length)
  {
    v10 = location - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + length) == v19[0]
        || objc_msgSend(v19[0], "isEqual:"))
      {
        -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v10 + length);
      }
      --length;
    }
    while (length);
  }

}

- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  id v9;
  NSUInteger v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  NSUInteger v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  id v19[2];

  length = range.length;
  location = range.location;
  v19[0] = anObject;
  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v8 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      v15 = v8;
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v16, (uint64_t)"-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v17, "-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length, v15);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSMutableArray removeObjectIdenticalTo:inRange:]", location, length);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v18);
  }
  v9 = v19[0];
  if (length)
  {
    v10 = location - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + length) == v19[0])
        -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v10 + length);
      --length;
    }
    while (length);
  }

}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v20 = v9;
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = _os_log_pack_fill();
      v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:]", location, length, --v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v23, "-[NSMutableArray removeObjectsInRange:inArray:]", location, length, v20);
    }
    else
    {
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSMutableArray removeObjectsInRange:inArray:]", location, length);
    }
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v24);
  }
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v25 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSMutableArray removeObjectsInRange:inArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray removeObjectsInRange:inArray:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  -[NSMutableArray removeObjectsInRange:inArray:range:](self, "removeObjectsInRange:inArray:range:", location, length, a4, 0, objc_msgSend(a4, "count"));
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    v17 = (char *)v25 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSMutableArray removeObjectsInArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableArray removeObjectsInArray:range:]");
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
      v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsInArray:range:]", location, length, --v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v23, "-[NSMutableArray removeObjectsInArray:range:]", location, length, v20);
    }
    else
    {
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectsInArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSMutableArray removeObjectsInArray:range:]", location, length);
    }
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v24);
  }
  -[NSMutableArray removeObjectsInRange:inArray:range:](self, "removeObjectsInRange:inArray:range:", 0, -[NSArray count](self, "count"), a3, location, length);
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  v12 = -[NSArray count](self, "count");
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v12 < v10 + v9)
  {
    if (v12)
    {
      v26 = v12;
      v15 = _os_log_pack_size();
      v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v27 = _os_log_pack_fill();
      v28 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v27, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9, --v26);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v28, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9, v26);
    }
    else
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v18, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", v10, v9);
    }
    v29 = _CFAutoreleasePoolAddObject();
    v30 = v16;
    v31 = v15;
LABEL_26:
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v29, 0, v30, v31));
  }
  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    v23 = _os_log_pack_size();
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136315138;
    *(_QWORD *)(v24 + 4) = "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]");
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
      v34 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v33, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length, --v32);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v34, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length, v32);
    }
    else
    {
      v19 = _os_log_pack_size();
      v20 = (char *)v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v22, "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]", location, length);
    }
    v29 = _CFAutoreleasePoolAddObject();
    v30 = v20;
    v31 = v19;
    goto LABEL_26;
  }
  if (v9)
  {
    v14 = v9 - 1;
    do
    {
      if (objc_msgSend(a4, "containsObject:inRange:", -[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + v14), location, length))-[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v14);
      --v14;
    }
    while (v14 != -1);
  }
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v20 = v9;
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = _os_log_pack_fill();
      v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length, --v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v23, "-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length, v20);
    }
    else
    {
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSMutableArray removeObjectsInRange:inOrderedSet:]", location, length);
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
    *(_QWORD *)(v18 + 4) = "-[NSMutableArray removeObjectsInRange:inOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray removeObjectsInRange:inOrderedSet:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  -[NSMutableArray removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", location, length, a4, 0, objc_msgSend(a4, "count"));
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v18 + 4) = "-[NSMutableArray removeObjectsInOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray removeObjectsInOrderedSet:range:]");
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
      v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, (uint64_t)"-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length, --v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v23, "-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length, v20);
    }
    else
    {
      v10 = _os_log_pack_size();
      v12 = (char *)v25 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSMutableArray removeObjectsInOrderedSet:range:]", location, length);
    }
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v24);
  }
  -[NSMutableArray removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, -[NSArray count](self, "count"), a3, location, length);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v9 + 4) = "-[NSMutableArray removeObjectsInOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray removeObjectsInOrderedSet:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
LABEL_4:
  -[NSMutableArray removeObjectsInRange:inOrderedSet:range:](self, "removeObjectsInRange:inOrderedSet:range:", 0, -[NSArray count](self, "count"), a3, 0, objc_msgSend(a3, "count"));
}

- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  NSUInteger v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  _QWORD v22[2];

  length = a3.length;
  location = a3.location;
  v22[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v18 = v9;
      v11 = _os_log_pack_size();
      v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSMutableArray removeObjectsInRange:inSet:]", location, length, --v18);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v20, "-[NSMutableArray removeObjectsInRange:inSet:]", location, length, v18);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSMutableArray removeObjectsInRange:inSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSMutableArray removeObjectsInRange:inSet:]", location, length);
    }
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v21);
  }
  if (a4 && (_NSIsNSSet((uint64_t)a4) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSMutableArray removeObjectsInRange:inSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableArray removeObjectsInRange:inSet:]");
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
    objc_exception_throw(v17);
  }
  if (length)
  {
    v10 = length - 1;
    do
    {
      if (objc_msgSend(a4, "containsObject:", -[NSArray objectAtIndex:](self, "objectAtIndex:", location + v10)))-[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
      --v10;
    }
    while (v10 != -1);
  }
}

- (void)removeObjectsInSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    v8 = (char *)v11 - ((MEMORY[0x1E0C80A78](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "-[NSMutableArray removeObjectsInSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableArray removeObjectsInSet:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
LABEL_4:
  -[NSMutableArray removeObjectsInRange:inSet:](self, "removeObjectsInRange:inSet:", 0, -[NSArray count](self, "count"), a3);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_12:
    v18 = _os_log_pack_size();
    v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315138;
    *(_QWORD *)(v20 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  if (!a3)
    goto LABEL_12;
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v18 = _os_log_pack_size();
    v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }
  if (!a5)
  {
    v18 = _os_log_pack_size();
    v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136315138;
    *(_QWORD *)(v22 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
LABEL_15:
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v19, v18);
    objc_exception_throw(v23);
  }
  v11 = a4 & 0xAFFFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0)
    v11 = a4;
  v12 = v11 | 0x5000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v11 | 0x5000000000000000, a3);
  IndexesPassingTest = __NSArrayGetIndexesPassingTest(self, (uint64_t)a5, v12, a3);
  v14 = objc_msgSend(IndexesPassingTest, "rangeCount");
  if (v14)
  {
    v15 = v14 - 1;
    do
    {
      v16 = objc_msgSend(IndexesPassingTest, "rangeAtIndex:", v15);
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v16, v17);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_10:
    v16 = _os_log_pack_size();
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSMutableArray removeObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableArray removeObjectsWithOptions:passingTest:]");
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
    objc_exception_throw(v18);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4)
    goto LABEL_10;
LABEL_3:
  v9 = a3 & 0xBFFFFFFFFFFFFFFELL;
  if ((a3 & 2) == 0)
    v9 = a3;
  v10 = v9 | 0x4000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v9 | 0x4000000000000000, 0);
  IndexesPassingTest = __NSArrayGetIndexesPassingTest(self, (uint64_t)a4, v10, 0);
  v12 = objc_msgSend(IndexesPassingTest, "rangeCount");
  if (v12)
  {
    v13 = v12 - 1;
    do
    {
      v14 = objc_msgSend(IndexesPassingTest, "rangeAtIndex:", v13);
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v14, v15);
      --v13;
    }
    while (v13 != -1);
  }
}

- (void)removeObjectsPassingTest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSException *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v3 = _os_log_pack_size();
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v4 + 4) = "-[NSMutableArray removeObjectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableArray removeObjectsPassingTest:]");
    v5 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    objc_exception_throw(v5);
  }
  -[NSMutableArray removeObjectsWithOptions:passingTest:](self, "removeObjectsWithOptions:passingTest:", 0, a3);
}

- (void)replaceObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  id v9;
  NSUInteger v10;
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
  id v22[2];

  length = a4.length;
  location = a4.location;
  v22[0] = a3;
  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!v22[0])
  {
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSMutableArray replaceObject:inRange:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableArray replaceObject:inRange:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    objc_exception_throw(v13);
  }
  v8 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      v18 = v8;
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSMutableArray replaceObject:inRange:]", location, length, --v18);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v20, "-[NSMutableArray replaceObject:inRange:]", location, length, v18);
    }
    else
    {
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSMutableArray replaceObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v17, "-[NSMutableArray replaceObject:inRange:]", location, length);
    }
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v21);
  }
  v9 = v22[0];
  if (length)
  {
    v10 = location - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + length) != v22[0]
        && objc_msgSend(v22[0], "isEqual:"))
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v10 + length, v22[0]);
      }
      --length;
    }
    while (length);
  }

}

- (void)replaceObject:(id)a3
{
  uint64_t v3;
  NSUInteger v5;
  id v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSException *v10;
  id v11[2];

  v11[0] = a3;
  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (!v11[0])
  {
    v8 = _os_log_pack_size();
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "-[NSMutableArray replaceObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableArray replaceObject:]");
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    objc_exception_throw(v10);
  }
  v5 = -[NSArray count](self, "count");
  v6 = v11[0];
  if (v5)
  {
    v7 = v5 - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v7) != v11[0]
        && objc_msgSend(v11[0], "isEqual:"))
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v7, v11[0]);
      }
      --v7;
    }
    while (v7 != -1);
  }

}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;
  const void **v14;
  id v15;
  unint64_t v16;
  NSUInteger v17;
  const void **v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSException *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSException *v37;
  NSUInteger v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  NSException *v42;
  _QWORD v43[2];

  length = a3.length;
  location = a3.location;
  v43[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  v11 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      v38 = v11;
      v26 = _os_log_pack_size();
      v28 = (char *)v43 - ((MEMORY[0x1E0C80A78](v26, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
      v40 = _os_log_pack_fill();
      v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length, --v38);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v41, "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length, v38);
    }
    else
    {
      v26 = _os_log_pack_size();
      v28 = (char *)v43 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v30, "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", location, length);
    }
    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v42);
  }
  if (!a4 && a5)
  {
    v31 = _os_log_pack_size();
    v33 = (char *)v43 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136315394;
    *(_QWORD *)(v34 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v34 + 12) = 2048;
    *(_QWORD *)(v34 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", a5);
    goto LABEL_37;
  }
  if (a5 >> 61)
  {
    v31 = _os_log_pack_size();
    v33 = (char *)v43 - ((MEMORY[0x1E0C80A78](v31, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136315394;
    *(_QWORD *)(v36 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v36 + 12) = 2048;
    *(_QWORD *)(v36 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", a5);
LABEL_37:
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v37);
  }
  if (a5)
  {
    v12 = 0;
    do
    {
      if (!a4[v12])
      {
        v21 = _os_log_pack_size();
        v23 = (char *)v43 - ((MEMORY[0x1E0C80A78](v21, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
        v24 = _os_log_pack_fill();
        *(_DWORD *)v24 = 136315394;
        *(_QWORD *)(v24 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v24 + 12) = 2048;
        *(_QWORD *)(v24 + 14) = v12;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableArray replaceObjectsInRange:withObjects:count:]", v12);
        v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v23, v21);
        objc_exception_throw(v25);
      }
      ++v12;
    }
    while (a5 != v12);
    v13 = a5;
    v14 = a4;
    do
    {
      if (((unint64_t)*v14 & 0x8000000000000000) == 0)
        v15 = (id)*v14;
      ++v14;
      --v13;
    }
    while (v13);
  }
  if (length >= a5)
    v16 = a5;
  else
    v16 = length;
  if (v16)
  {
    v17 = location;
    v18 = a4;
    v19 = v16;
    do
    {
      v20 = (uint64_t)*v18++;
      -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v17++, v20);
      --v19;
    }
    while (v19);
  }
  if (length > a5)
  {
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v16 + location, length - v16);
    goto LABEL_27;
  }
  if (length >= a5)
  {
LABEL_27:
    if (!a5)
      return;
    goto LABEL_28;
  }
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", &a4[v16], a5 - v16, v16 + location);
  do
  {
LABEL_28:
    if (((unint64_t)*a4 & 0x8000000000000000) == 0)

    ++a4;
    --a5;
  }
  while (a5);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v37 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]");
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
      v24 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v24, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length);
      v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
      objc_exception_throw(v25);
    }
    v39 = v12;
    v40 = _os_log_pack_size();
    v42 = (char *)v53 - ((MEMORY[0x1E0C80A78](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
    v43 = _os_log_pack_fill();
    v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v43, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, --v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v44, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", location, length, v39);
    v45 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v42, v40);
    objc_exception_throw(v45);
  }
  v13 = -[NSArray count](self, "count");
  if ((v10 & 0x8000000000000000) != 0 || (v9 & 0x8000000000000000) != 0 || v13 < v10 + v9)
  {
    if (!v13)
    {
      v26 = _os_log_pack_size();
      v28 = (char *)v53 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v30, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9);
      v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v31);
    }
    v46 = v13;
    v47 = _os_log_pack_size();
    v49 = (char *)v53 - ((MEMORY[0x1E0C80A78](v47, v48) + 15) & 0xFFFFFFFFFFFFFFF0);
    v50 = _os_log_pack_fill();
    v51 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v50, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, --v46);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v51, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]", v10, v9, v46);
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
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", v10, v9, v18, length);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v29 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
LABEL_4:
  v9 = -[NSArray count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v18 = _os_log_pack_size();
      v20 = (char *)v38 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v22, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length);
      v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
      objc_exception_throw(v23);
    }
    v31 = _os_log_pack_size();
    v33 = (char *)v38 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    v35 = v10 - 1;
    v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v34, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v35);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v36, "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]", location, length, v35);
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
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(_QWORD *)(v29 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
LABEL_4:
  v9 = -[NSArray count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v18 = _os_log_pack_size();
      v20 = (char *)v38 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v22, "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length);
      v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
      objc_exception_throw(v23);
    }
    v31 = _os_log_pack_size();
    v33 = (char *)v38 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    v35 = v10 - 1;
    v36 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v34, (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length, v35);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v36, "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]", location, length, v35);
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
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", location, length, v16, v13);
  free(v17);
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (a3)
      goto LABEL_3;
LABEL_9:
    v9 = _os_log_pack_size();
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSMutableArray setObject:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableArray setObject:atIndex:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  if (!a3)
    goto LABEL_9;
LABEL_3:
  v8 = -[NSArray count](self, "count");
  if ((a4 & 0x8000000000000000) != 0 || v8 < a4)
  {
    if (v8)
    {
      v15 = v8;
      v12 = _os_log_pack_size();
      v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSMutableArray setObject:atIndex:]", a4, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v17, "-[NSMutableArray setObject:atIndex:]", a4, v15);
    }
    else
    {
      v12 = _os_log_pack_size();
      v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v14 = _os_log_pack_fill();
      *(_DWORD *)v14 = 136315394;
      *(_QWORD *)(v14 + 4) = "-[NSMutableArray setObject:atIndex:]";
      *(_WORD *)(v14 + 12) = 2048;
      *(_QWORD *)(v14 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSMutableArray setObject:atIndex:]", a4);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v18);
  }
  if (-[NSArray count](self, "count") == a4)
    -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", a3, a4);
  else
    -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", a4, a3);
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
  uint64_t v4;

  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  -[NSMutableArray setObject:atIndex:](self, "setObject:atIndex:", obj, idx);
}

- (void)setOrderedSet:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  CFStringRef v14;
  NSException *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSException *v20;
  size_t v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)v21 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)(v19 + 4) = "-[NSMutableArray setOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableArray setOrderedSet:]");
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
    objc_exception_throw(v20);
  }
LABEL_4:
  v6 = -[NSArray count](self, "count");
  v7 = objc_msgSend(a3, "count");
  v9 = v7;
  if (v7 >> 60)
  {
    v14 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
    v15 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v14, 0);
    CFRelease(v14);
    objc_exception_throw(v15);
  }
  if (v7 <= 1)
    v7 = 1;
  v10 = MEMORY[0x1E0C80A78](v7, v8);
  v12 = (char *)v21 - v11;
  v21[0] = 0;
  if (v9 >= 0x101)
  {
    v12 = (char *)_CFCreateArrayStorage(v10, 0, v21);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v12, 0, v9, v21[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", 0, v6, v12, v9);
  free(v13);
}

- (void)setSet:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  CFStringRef v14;
  NSException *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSException *v20;
  size_t v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)v21 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)(v19 + 4) = "-[NSMutableArray setSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableArray setSet:]");
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
    objc_exception_throw(v20);
  }
LABEL_4:
  v6 = -[NSArray count](self, "count");
  v7 = objc_msgSend(a3, "count");
  v9 = v7;
  if (v7 >> 60)
  {
    v14 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
    v15 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v14, 0);
    CFRelease(v14);
    objc_exception_throw(v15);
  }
  if (v7 <= 1)
    v7 = 1;
  v10 = MEMORY[0x1E0C80A78](v7, v8);
  v12 = (char *)v21 - v11;
  v21[0] = 0;
  if (v9 >= 0x101)
  {
    v12 = (char *)_CFCreateArrayStorage(v10, 0, v21);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a3, "getObjects:count:", v12, v9, v21[0]);
  -[NSMutableArray replaceObjectsInRange:withObjects:count:](self, "replaceObjectsInRange:withObjects:count:", 0, v6, v12, v9);
  free(v13);
}

- (void)sortUsingFunction:(void *)a3 context:(void *)a4 range:(_NSRange)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSException *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  double v16;
  NSUInteger v17;
  uint64_t v18;
  double v19;
  NSException *v20;
  _QWORD v22[7];

  length = a5.length;
  location = a5.location;
  v22[6] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a3)
      goto LABEL_3;
LABEL_10:
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: function pointer cannot be NULL"), "-[NSMutableArray sortUsingFunction:context:range:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v12);
  }
  if (!a3)
    goto LABEL_10;
LABEL_3:
  v11 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      v17 = v11;
      v13 = _os_log_pack_size();
      v14 = (char *)&v22[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = _os_log_pack_fill();
      v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSMutableArray sortUsingFunction:context:range:]", location, length, --v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v19, "-[NSMutableArray sortUsingFunction:context:range:]", location, length, v17);
    }
    else
    {
      v13 = _os_log_pack_size();
      v14 = (char *)&v22[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      v15 = _os_log_pack_fill();
      v16 = __os_log_helper_1_2_3_8_32_8_0_8_0(v15, (uint64_t)"-[NSMutableArray sortUsingFunction:context:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v16, "-[NSMutableArray sortUsingFunction:context:range:]", location, length);
    }
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v20);
  }
  if (length != 1)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __50__NSMutableArray_sortUsingFunction_context_range___block_invoke;
    v22[3] = &__block_descriptor_48_e11_q24__0_8_16l;
    v22[4] = a3;
    v22[5] = a4;
    -[NSMutableArray sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", location, length, 0, v22);
  }
}

uint64_t __50__NSMutableArray_sortUsingFunction_context_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
  objc_class *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_9();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_21(v4, v5);
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_9();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_21(v3, v4);
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
  objc_class *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_9();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_21(v4, v5);
}

- (NSMutableArray)initWithCapacity:(NSUInteger)numItems
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_9();
  __CFLookUpClass("NSMutableArray");
  OUTLINED_FUNCTION_1_13();
  __CFRequireConcreteImplementation(v3, v4);
}

@end
