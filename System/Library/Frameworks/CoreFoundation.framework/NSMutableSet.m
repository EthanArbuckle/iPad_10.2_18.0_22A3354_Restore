@implementation NSMutableSet

- (void)addObjectsFromArray:(NSArray *)array
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  NSException *v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v4 = array;
  v25 = *MEMORY[0x1E0C80C00];
  if (array)
  {
    objc_lookUpClass("NSArray");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableSet addObjectsFromArray:]");
      v6 = _CFAutoreleasePoolAddObject();
      CFLog(3, (uint64_t)CFSTR("%@"), v7, v8, v9, v10, v11, v12, v6);
      objc_lookUpClass("NSSet");
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = -[NSArray allObjects](v4, "allObjects");
    }
  }
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!v4)
      goto LABEL_8;
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  if ((_NSIsNSArray((uint64_t)v4) & 1) == 0)
  {
    v17 = _os_log_pack_size();
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSMutableSet addObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableSet addObjectsFromArray:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v20[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)], v17);
    objc_exception_throw(v19);
  }
LABEL_8:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v4);
        -[NSMutableSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v14);
  }
}

- (void)intersectSet:(NSSet *)otherSet
{
  uint64_t v3;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  NSException *v39;
  CFStringRef v40;
  NSException *v41;
  uint64_t v42;
  uint64_t *v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  size_t v54[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet)
      goto LABEL_17;
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(otherSet);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
      }
      v15 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
    }
    while (v15);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      v35 = _os_log_pack_size();
      v37 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
      v38 = _os_log_pack_fill();
      *(_DWORD *)v38 = 136315138;
      *(_QWORD *)(v38 + 4) = "-[NSMutableSet intersectSet:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableSet intersectSet:]");
      v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
      objc_exception_throw(v39);
    }
  }
LABEL_17:
  if (otherSet != (NSSet *)self)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v18 = 0;
    v20 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v51 != v21)
            objc_enumerationMutation(self);
          v18 += -[NSSet countForObject:](self, "countForObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
        }
        v20 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
      }
      while (v20);
      if (v18 >> 60)
      {
        v40 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v18);
        v41 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v40, 0);
        CFRelease(v40);
        objc_exception_throw(v41);
      }
    }
    if (v18 <= 1)
      v23 = 1;
    else
      v23 = v18;
    v24 = MEMORY[0x1E0C80A78](v23, v19);
    v26 = (uint64_t *)((char *)&v42 - v25);
    v54[0] = 0;
    if (v18 >= 0x101)
    {
      v26 = (uint64_t *)_CFCreateArrayStorage(v24, 0, v54);
      v43 = v26;
    }
    else
    {
      v43 = 0;
    }
    v42 = (uint64_t)&v42;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v27 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
    v28 = v26;
    if (v27)
    {
      v29 = *(_QWORD *)v46;
      v28 = v26;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(self);
          v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
          v32 = -[NSSet countForObject:](otherSet, "countForObject:", v31);
          v33 = -[NSSet countForObject:](self, "countForObject:", v31);
          v34 = v33 - v32;
          if (v33 > v32)
          {
            do
            {
              *v28++ = v31;
              --v34;
            }
            while (v34);
          }
        }
        v27 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
      }
      while (v27);
    }
    while (v26 < v28)
      -[NSMutableSet removeObject:](self, "removeObject:", *v26++);
    free(v43);
  }
}

- (void)minusSet:(NSSet *)otherSet
{
  uint64_t v3;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  NSException *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet)
      goto LABEL_17;
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(otherSet);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v16);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      v26 = _os_log_pack_size();
      v28 = &v31[-((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0)];
      v29 = _os_log_pack_fill();
      *(_DWORD *)v29 = 136315138;
      *(_QWORD *)(v29 + 4) = "-[NSMutableSet minusSet:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableSet minusSet:]");
      v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v30);
    }
  }
LABEL_17:
  if (otherSet == (NSSet *)self)
  {
    -[NSMutableSet removeAllObjects](self, "removeAllObjects");
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(otherSet);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          v24 = -[NSSet countForObject:](otherSet, "countForObject:", v23);
          if (v24)
          {
            v25 = v24;
            do
            {
              --v25;
              -[NSMutableSet removeObject:](self, "removeObject:", v23);
            }
            while (v25);
          }
        }
        v20 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      }
      while (v20);
    }
  }
}

- (void)unionSet:(NSSet *)otherSet
{
  uint64_t v3;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSUInteger v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t j;
  unint64_t v26;
  CFStringRef v27;
  NSException *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSException *v33;
  size_t v34[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet)
      goto LABEL_17;
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(otherSet);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v15 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v15);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      v29 = _os_log_pack_size();
      v31 = (char *)v34 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
      v32 = _os_log_pack_fill();
      *(_DWORD *)v32 = 136315138;
      *(_QWORD *)(v32 + 4) = "-[NSMutableSet unionSet:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableSet unionSet:]");
      v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
      objc_exception_throw(v33);
    }
  }
LABEL_17:
  v18 = -[NSSet count](otherSet, "count");
  v20 = v18;
  if (v18 >> 60)
  {
    v27 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v18);
    v28 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v27, 0);
    CFRelease(v27);
    objc_exception_throw(v28);
  }
  if (v18 <= 1)
    v18 = 1;
  v21 = MEMORY[0x1E0C80A78](v18, v19);
  v23 = (char *)v34 - v22;
  v34[0] = 0;
  if (v20 >= 0x101)
  {
    v23 = (char *)_CFCreateArrayStorage(v21, 0, v34);
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  -[NSSet getObjects:count:](otherSet, "getObjects:count:", v23, v20, v34[0]);
  if (v20)
  {
    for (j = 0; j != v20; ++j)
    {
      v26 = -[NSSet countForObject:](otherSet, "countForObject:", *(_QWORD *)&v23[8 * j]) + 1;
      while (--v26)
        -[NSMutableSet addObject:](self, "addObject:", *(_QWORD *)&v23[8 * j]);
    }
  }
  free(v24);
}

+ (NSMutableSet)setWithCapacity:(NSUInteger)numItems
{
  return (NSMutableSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:", numItems);
}

- (id)setByAddingObjectsFromArray:(id)a3
{
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  NSSet *v15;
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
    *(_QWORD *)(v22 + 4) = "-[NSMutableSet setByAddingObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableSet setByAddingObjectsFromArray:]");
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v21, v19);
    objc_exception_throw(v23);
  }
  v5 = objc_msgSend(a3, "count");
  v6 = -[NSSet count](self, "count");
  v8 = v6 + v5;
  if ((v6 + v5) >> 60)
  {
    v17 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6 + v5);
    v18 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v17, 0);
    CFRelease(v17);
    objc_exception_throw(v18);
  }
  v9 = v6;
  if (v8 <= 1)
    v10 = 1;
  else
    v10 = v6 + v5;
  v11 = MEMORY[0x1E0C80A78](v10, v7);
  v13 = (char *)&v24 - v12;
  v24 = 0;
  if (v8 >= 0x101)
  {
    v13 = (char *)_CFCreateArrayStorage(v11, 0, &v24);
    v14 = v13;
    if (!v9)
      goto LABEL_12;
    goto LABEL_11;
  }
  v14 = 0;
  if (v9)
LABEL_11:
    -[NSSet getObjects:count:](self, "getObjects:count:", v13, v9, v24, v25);
LABEL_12:
  if (v5)
    objc_msgSend(a3, "getObjects:range:", &v13[8 * v9], 0, v5);
  v15 = +[NSSet setWithObjects:count:](NSSet, "setWithObjects:count:", v13, v8, v24);
  free(v14);
  return v15;
}

- (id)setByAddingObjectsFromSet:(id)a3
{
  id v3;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  NSSet *v27;
  CFStringRef v29;
  NSException *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSException *v35;
  size_t v36[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
    {
      v6 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v7, v8, v9, v10, v11, v12, v6);
    }
    v13 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v3);
          objc_msgSend(v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
      }
      while (v14);
    }
    v3 = v13;
    if (v3)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v3) & 1) == 0)
      {
        v31 = _os_log_pack_size();
        v33 = (char *)v36 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
        v34 = _os_log_pack_fill();
        *(_DWORD *)v34 = 136315138;
        *(_QWORD *)(v34 + 4) = "-[NSMutableSet setByAddingObjectsFromSet:]";
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableSet setByAddingObjectsFromSet:]");
        v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
        objc_exception_throw(v35);
      }
    }
  }
  v17 = objc_msgSend(v3, "count");
  v18 = -[NSSet count](self, "count");
  v20 = v18;
  v21 = v18 + v17;
  if ((v18 + v17) >> 60)
  {
    v29 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v18 + v17);
    v30 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v29, 0);
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  if (v21 <= 1)
    v22 = 1;
  else
    v22 = v18 + v17;
  v23 = MEMORY[0x1E0C80A78](v22, v19);
  v25 = (char *)v36 - v24;
  v36[0] = 0;
  if (v21 >= 0x101)
  {
    v25 = (char *)_CFCreateArrayStorage(v23, 0, v36);
    v26 = v25;
    if (!v20)
      goto LABEL_25;
    goto LABEL_24;
  }
  v26 = 0;
  if (v20)
LABEL_24:
    -[NSSet getObjects:count:](self, "getObjects:count:", v25, v20, v36[0]);
LABEL_25:
  if (v17)
    objc_msgSend(v3, "getObjects:count:", &v25[8 * v20], v17);
  v27 = +[NSSet setWithObjects:count:](NSSet, "setWithObjects:count:", v25, v21, v36[0]);
  free(v26);
  return v27;
}

- (void)setObject:(id)a3
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_9:
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[NSMutableSet setObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableSet setObject:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  if (!a3)
    goto LABEL_9;
LABEL_3:
  v6 = -[NSSet member:](self, "member:", a3);
  if (v6 != a3)
  {
    if (v6)
      -[NSMutableSet removeObject:](self, "removeObject:", v6);
    -[NSMutableSet addObject:](self, "addObject:", a3);
  }
}

- (void)setSet:(NSSet *)otherSet
{
  uint64_t v3;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  NSException *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet)
      goto LABEL_17;
  }
  else if (!otherSet)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(otherSet);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v16);
  }
  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      v26 = _os_log_pack_size();
      v28 = &v31[-((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0)];
      v29 = _os_log_pack_fill();
      *(_DWORD *)v29 = 136315138;
      *(_QWORD *)(v29 + 4) = "-[NSMutableSet setSet:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableSet setSet:]");
      v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v30);
    }
  }
LABEL_17:
  if (otherSet != (NSSet *)self)
  {
    -[NSMutableSet removeAllObjects](self, "removeAllObjects");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(otherSet);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          v24 = -[NSSet countForObject:](otherSet, "countForObject:", v23);
          if (v24)
          {
            v25 = v24;
            do
            {
              --v25;
              -[NSMutableSet addObject:](self, "addObject:", v23);
            }
            while (v25);
          }
        }
        v20 = -[NSSet countByEnumeratingWithState:objects:count:](otherSet, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      }
      while (v20);
    }
  }
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a4)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSMutableSet addObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableSet addObjects:count:]", a4);
    goto LABEL_16;
  }
LABEL_4:
  if (a4 >> 61)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[NSMutableSet addObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableSet addObjects:count:]", a4);
LABEL_16:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v17);
  }
  if (a4)
  {
    v8 = 0;
    do
    {
      if (!a3[v8])
      {
        v10 = _os_log_pack_size();
        v11 = _os_log_pack_fill();
        *(_DWORD *)v11 = 136315394;
        *(_QWORD *)(v11 + 4) = "-[NSMutableSet addObjects:count:]";
        *(_WORD *)(v11 + 12) = 2048;
        *(_QWORD *)(v11 + 14) = v8;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableSet addObjects:count:]", v8);
        v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
        objc_exception_throw(v12);
      }
      ++v8;
    }
    while (a4 != v8);
    do
    {
      v9 = (uint64_t)*a3++;
      -[NSMutableSet addObject:](self, "addObject:", v9);
      --a4;
    }
    while (a4);
  }
}

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  CFStringRef v22;
  NSException *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  double v34;
  NSException *v35;
  size_t v36[2];

  length = a4.length;
  location = a4.location;
  v36[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    *(_QWORD *)(v27 + 4) = "-[NSMutableSet addObjectsFromArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableSet addObjectsFromArray:range:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v9 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v16 = _os_log_pack_size();
      v18 = (char *)v36 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_3_8_32_8_0_8_0(v19, (uint64_t)"-[NSMutableSet addObjectsFromArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty set"), v20, "-[NSMutableSet addObjectsFromArray:range:]", location, length);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
      objc_exception_throw(v21);
    }
    v29 = v9;
    v30 = _os_log_pack_size();
    v32 = (char *)v36 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    v34 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v33, (uint64_t)"-[NSMutableSet addObjectsFromArray:range:]", location, length, --v29);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v34, "-[NSMutableSet addObjectsFromArray:range:]", location, length, v29);
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v35);
  }
  if (length >> 60)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (length <= 1)
    v11 = 1;
  else
    v11 = length;
  v12 = MEMORY[0x1E0C80A78](v11, v10);
  v14 = (char *)v36 - v13;
  v36[0] = 0;
  if (length >= 0x101)
  {
    v14 = (char *)_CFCreateArrayStorage(v12, 0, v36);
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v14, location, length, v36[0]);
  -[NSMutableSet addObjects:count:](self, "addObjects:count:", v14, length);
  free(v15);
}

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  CFStringRef v22;
  NSException *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  double v34;
  NSException *v35;
  size_t v36[2];

  length = a4.length;
  location = a4.location;
  v36[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    *(_QWORD *)(v27 + 4) = "-[NSMutableSet addObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet addObjectsFromOrderedSet:range:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v9 = objc_msgSend(a3, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      v16 = _os_log_pack_size();
      v18 = (char *)v36 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_3_8_32_8_0_8_0(v19, (uint64_t)"-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty set"), v20, "-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length);
      v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
      objc_exception_throw(v21);
    }
    v29 = v9;
    v30 = _os_log_pack_size();
    v32 = (char *)v36 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    v34 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v33, (uint64_t)"-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length, --v29);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v34, "-[NSMutableSet addObjectsFromOrderedSet:range:]", location, length, v29);
    v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v35);
  }
  if (length >> 60)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (length <= 1)
    v11 = 1;
  else
    v11 = length;
  v12 = MEMORY[0x1E0C80A78](v11, v10);
  v14 = (char *)v36 - v13;
  v36[0] = 0;
  if (length >= 0x101)
  {
    v14 = (char *)_CFCreateArrayStorage(v12, 0, v36);
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v14, location, length, v36[0]);
  -[NSMutableSet addObjects:count:](self, "addObjects:count:", v14, length);
  free(v15);
}

- (void)addObjectsFromOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableSet addObjectsFromOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet addObjectsFromOrderedSet:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        -[NSMutableSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
}

- (void)addObjectsFromSet:(id)a3
{
  uint64_t v3;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  NSException *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_17;
  }
  else if (!a3)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(a3);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v16);
  }
  a3 = v14;
  if (a3)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
    {
      v23 = _os_log_pack_size();
      v25 = &v28[-((MEMORY[0x1E0C80A78](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0)];
      v26 = _os_log_pack_fill();
      *(_DWORD *)v26 = 136315138;
      *(_QWORD *)(v26 + 4) = "-[NSMutableSet addObjectsFromSet:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableSet addObjectsFromSet:]");
      v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v25, v23);
      objc_exception_throw(v27);
    }
  }
LABEL_17:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(a3);
        -[NSMutableSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v20);
  }
}

- (void)intersectOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  CFStringRef v29;
  NSException *v30;
  uint64_t v31;
  uint64_t *v32;
  size_t v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    v26 = (char *)&v32 - ((MEMORY[0x1E0C80A78](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)(v27 + 4) = "-[NSMutableSet intersectOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet intersectOrderedSet:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
LABEL_4:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(self);
        v8 += -[NSSet countForObject:](self, "countForObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    }
    while (v7);
    if (v8 >> 60)
    {
      v29 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v8);
      v30 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v29, 0);
      CFRelease(v29);
      objc_exception_throw(v30);
    }
    if (v8 <= 1)
      v12 = 1;
    else
      v12 = v8;
    v13 = MEMORY[0x1E0C80A78](v12, v11);
    v15 = (uint64_t *)((char *)&v32 - v14);
    v33 = 0;
    if (v8 >= 0x101)
    {
      v15 = (uint64_t *)_CFCreateArrayStorage(v13, 0, &v33);
      v32 = v15;
    }
    else
    {
      v32 = 0;
    }
  }
  else
  {
    MEMORY[0x1E0C80A78](0, v6);
    v15 = &v31;
    v32 = 0;
    v33 = 0;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v35, v34, 16, v32, v33);
  v17 = v15;
  if (v16)
  {
    v18 = *(_QWORD *)v36;
    v17 = v15;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(self);
        v20 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        v21 = objc_msgSend(a3, "countForObject:", v20);
        v22 = -[NSSet countForObject:](self, "countForObject:", v20);
        v23 = v22 - v21;
        if (v22 > v21)
        {
          do
          {
            *v17++ = v20;
            --v23;
          }
          while (v23);
        }
      }
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v16);
  }
  while (v15 < v17)
    -[NSMutableSet removeObject:](self, "removeObject:", *v15++);
  free(v32);
}

- (void)minusOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSMutableSet minusOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet minusOrderedSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
LABEL_4:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(a3, "countForObject:", v10);
        if (v11)
        {
          v12 = v11;
          do
          {
            --v12;
            -[NSMutableSet removeObject:](self, "removeObject:", v10);
          }
          while (v12);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v7);
  }
}

- (void)removeAllObjects
{
  uint64_t v2;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t i;
  unint64_t v12;
  CFStringRef v13;
  NSException *v14;
  size_t v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableSet);
  v4 = -[NSSet count](self, "count");
  v6 = v4;
  if (v4 >> 60)
  {
    v13 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v4);
    v14 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v13, 0);
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  if (v4 <= 1)
    v4 = 1;
  v7 = MEMORY[0x1E0C80A78](v4, v5);
  v9 = (char *)v15 - v8;
  v15[0] = 0;
  if (v6 >= 0x101)
  {
    v9 = (char *)_CFCreateArrayStorage(v7, 0, v15);
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  -[NSSet getObjects:count:](self, "getObjects:count:", v9, v6, v15[0]);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v12 = -[NSSet countForObject:](self, "countForObject:", *(_QWORD *)&v9[8 * i]) + 1;
      while (--v12)
        -[NSMutableSet removeObject:](self, "removeObject:", *(_QWORD *)&v9[8 * i]);
    }
  }
  free(v10);
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
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
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    *(_QWORD *)(v15 + 4) = "-[NSMutableSet removeObjectsInArray:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableSet removeObjectsInArray:range:]");
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
      v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSMutableSet removeObjectsInArray:range:]", location, length, --v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v19, "-[NSMutableSet removeObjectsInArray:range:]", location, length, v17);
    }
    else
    {
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableSet removeObjectsInArray:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty set"), v13, "-[NSMutableSet removeObjectsInArray:range:]", location, length);
    }
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v20);
  }
  for (; length; --length)
    -[NSMutableSet removeObject:](self, "removeObject:", objc_msgSend(a3, "objectAtIndex:", location++));
}

- (void)removeObjectsInArray:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableSet removeObjectsInArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableSet removeObjectsInArray:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        -[NSMutableSet removeObject:](self, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
}

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
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
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    *(_QWORD *)(v15 + 4) = "-[NSMutableSet removeObjectsInOrderedSet:range:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet removeObjectsInOrderedSet:range:]");
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
      v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length, --v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v19, "-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length, v17);
    }
    else
    {
      v10 = _os_log_pack_size();
      v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty set"), v13, "-[NSMutableSet removeObjectsInOrderedSet:range:]", location, length);
    }
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v20);
  }
  for (; length; --length)
    -[NSMutableSet removeObject:](self, "removeObject:", objc_msgSend(a3, "objectAtIndex:", location++));
}

- (void)removeObjectsInOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableSet removeObjectsInOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet removeObjectsInOrderedSet:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        -[NSMutableSet removeObject:](self, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
}

- (void)removeObjectsInSet:(id)a3
{
  uint64_t v3;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  NSException *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_17;
  }
  else if (!a3)
  {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(a3);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v16);
  }
  a3 = v14;
  if (a3)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
    {
      v23 = _os_log_pack_size();
      v25 = &v28[-((MEMORY[0x1E0C80A78](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0)];
      v26 = _os_log_pack_fill();
      *(_DWORD *)v26 = 136315138;
      *(_QWORD *)(v26 + 4) = "-[NSMutableSet removeObjectsInSet:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSMutableSet removeObjectsInSet:]");
      v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v25, v23);
      objc_exception_throw(v27);
    }
  }
LABEL_17:
  if (a3 == self)
  {
    -[NSMutableSet removeAllObjects](self, "removeAllObjects");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(a3);
          -[NSMutableSet removeObject:](self, "removeObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
        }
        v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      }
      while (v20);
    }
  }
}

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  char v6;
  char v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSException *v18;
  _QWORD v20[7];
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_12:
    v14 = _os_log_pack_size();
    v16 = (char *)&v20[-1] - ((MEMORY[0x1E0C80A78](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSMutableSet removeObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableSet removeObjectsWithOptions:passingTest:]");
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v16, v14);
    objc_exception_throw(v18);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
  if (!a4)
    goto LABEL_12;
LABEL_3:
  v8 = v6 & 0xFD;
  v9 = +[NSSet set](NSMutableSet, "set");
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v30 = 0;
  v26 = 850045857;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__NSMutableSet_removeObjectsWithOptions_passingTest___block_invoke;
  v20[3] = &unk_1E1079338;
  v20[5] = a4;
  v20[6] = &v26;
  v20[4] = v9;
  __NSSetEnumerate(self, v8, (uint64_t)v20);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        -[NSMutableSet removeObject:](self, "removeObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v11);
  }
}

uint64_t __53__NSMutableSet_removeObjectsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
    return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
  }
  return result;
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
    *(_QWORD *)(v4 + 4) = "-[NSMutableSet removeObjectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableSet removeObjectsPassingTest:]");
    v5 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    objc_exception_throw(v5);
  }
  -[NSMutableSet removeObjectsWithOptions:passingTest:](self, "removeObjectsWithOptions:passingTest:", 0, a3);
}

- (void)replaceObject:(id)a3
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_8:
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[NSMutableSet replaceObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableSet replaceObject:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  if (!a3)
    goto LABEL_8;
LABEL_3:
  v6 = -[NSSet member:](self, "member:", a3);
  if (v6 != a3)
  {
    if (v6)
    {
      -[NSMutableSet removeObject:](self, "removeObject:", v6);
      -[NSMutableSet addObject:](self, "addObject:", a3);
    }
  }
}

- (void)setArray:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableSet setArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableSet setArray:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  -[NSMutableSet removeAllObjects](self, "removeAllObjects");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        -[NSMutableSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
}

- (void)setOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSMutableSet setOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet setOrderedSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
LABEL_4:
  -[NSMutableSet removeAllObjects](self, "removeAllObjects");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(a3, "countForObject:", v10);
        if (v11)
        {
          v12 = v11;
          do
          {
            --v12;
            -[NSMutableSet addObject:](self, "addObject:", v10);
          }
          while (v12);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v7);
  }
}

- (void)unionOrderedSet:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSMutableSet unionOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSMutableSet unionOrderedSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
LABEL_4:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(a3, "countForObject:", v10);
        if (v11)
        {
          v12 = v11;
          do
          {
            --v12;
            -[NSMutableSet addObject:](self, "addObject:", v10);
          }
          while (v12);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v7);
  }
}

- (NSMutableSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  const void **v5;
  uint64_t i;
  NSMutableSet *j;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  _QWORD v18[2];

  v4 = a4;
  v5 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSMutableSet initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = v4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableSet initWithObjects:count:]", v4);
    goto LABEL_15;
  }
  if (a4 >> 61)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[NSMutableSet initWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = v4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableSet initWithObjects:count:]", v4);
LABEL_15:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v17);
  }
  if (!a4)
    return -[NSMutableSet initWithCapacity:](self, "initWithCapacity:", 0);
  for (i = 0; i != a4; ++i)
  {
    if (!a3[i])
    {
      v10 = _os_log_pack_size();
      v11 = _os_log_pack_fill();
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)(v11 + 4) = "-[NSMutableSet initWithObjects:count:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(_QWORD *)(v11 + 14) = i;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableSet initWithObjects:count:]", i);
      v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
      objc_exception_throw(v12);
    }
  }
  for (j = -[NSMutableSet initWithCapacity:](self, "initWithCapacity:", a4); v4; --v4)
  {
    v8 = (uint64_t)*v5++;
    -[NSMutableSet addObject:](j, "addObject:", v8);
  }
  return j;
}

- (void)addObject:(id)object
{
  objc_class *v4;

  v4 = __CFLookUpClass("NSMutableSet");
  OUTLINED_FUNCTION_0(v4, (uint64_t)self);
}

- (void)removeObject:(id)object
{
  objc_class *v4;

  v4 = __CFLookUpClass("NSMutableSet");
  OUTLINED_FUNCTION_0(v4, (uint64_t)self);
}

- (NSMutableSet)initWithCapacity:(NSUInteger)numItems
{
  objc_class *v4;

  v4 = __CFLookUpClass("NSMutableSet");
  __CFRequireConcreteImplementation(v4, (uint64_t)self);
}

@end
