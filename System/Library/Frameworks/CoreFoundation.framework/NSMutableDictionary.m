@implementation NSMutableDictionary

- (void)__addObject:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_7:
    v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSMutableDictionary __addObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableDictionary __addObject:forKey:]");
    goto LABEL_9;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3)
    goto LABEL_7;
LABEL_3:
  if (!a4)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary __addObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[NSMutableDictionary __addObject:forKey:]");
LABEL_9:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v12);
  }
  if (!-[NSDictionary objectForKey:](self, "objectForKey:", a4))
    -[NSMutableDictionary __setObject:forKey:](self, "__setObject:forKey:", a3, a4);
}

- (void)removeObjectsForKeys:(NSArray *)keyArray
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
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
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!keyArray)
      goto LABEL_4;
  }
  else if (!keyArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)keyArray) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary removeObjectsForKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSMutableDictionary removeObjectsForKeys:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](keyArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(keyArray);
        -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](keyArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
}

+ (NSMutableDictionary)dictionaryWithCapacity:(NSUInteger)numItems
{
  return (NSMutableDictionary *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:", numItems);
}

- (void)setDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
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
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!otherDictionary)
      goto LABEL_4;
  }
  else if (!otherDictionary)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary setDictionary:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: dictionary argument is not an NSDictionary"), "-[NSMutableDictionary setDictionary:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  if (self != (NSMutableDictionary *)otherDictionary)
  {
    -[NSMutableDictionary removeAllObjects](self, "removeAllObjects");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](otherDictionary, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(otherDictionary);
          -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", -[NSDictionary objectForKey:](otherDictionary, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](otherDictionary, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v7);
    }
  }
}

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
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
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!otherDictionary)
      goto LABEL_4;
  }
  else if (!otherDictionary)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary addEntriesFromDictionary:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: dictionary argument is not an NSDictionary"), "-[NSMutableDictionary addEntriesFromDictionary:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  if (self != (NSMutableDictionary *)otherDictionary)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](otherDictionary, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(otherDictionary);
          -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", -[NSDictionary objectForKey:](otherDictionary, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](otherDictionary, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v7);
    }
  }
}

- (void)setObject:(id)obj forKeyedSubscript:(id)key
{
  uint64_t v4;

  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (obj)
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", obj, key);
  else
    -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", key);
}

+ (NSMutableDictionary)dictionaryWithSharedKeySet:(id)keyset
{
  uint64_t v7;
  NSException *v8;
  uint64_t v9;
  uint64_t v10;

  if (!keyset)
  {
    v9 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: keyset cannot be nil"), v9);
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = __CFExceptionProem((objc_class *)a1, a2);
    v10 = objc_opt_class();
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: keyset must be an object created by +sharedKeySetForKeys: instead of '%@'"), v7, v10);
LABEL_8:
    v8 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v8);
  }
  if (objc_msgSend(keyset, "isEmpty"))
    return +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
  else
    return (NSMutableDictionary *)+[NSSharedKeyDictionary sharedKeyDictionaryWithKeySet:](NSSharedKeyDictionary, "sharedKeyDictionaryWithKeySet:", keyset);
}

- (void)replaceObject:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_8:
    v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSMutableDictionary replaceObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableDictionary replaceObject:forKey:]");
    goto LABEL_10;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3)
    goto LABEL_8;
LABEL_3:
  if (!a4)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary replaceObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[NSMutableDictionary replaceObject:forKey:]");
LABEL_10:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v12);
  }
  if (-[NSDictionary objectForKey:](self, "objectForKey:", a4))
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_7:
    v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSMutableDictionary addObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableDictionary addObject:forKey:]");
    goto LABEL_9;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3)
    goto LABEL_7;
LABEL_3:
  if (!a4)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary addObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[NSMutableDictionary addObject:forKey:]");
LABEL_9:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v12);
  }
  if (!-[NSDictionary objectForKey:](self, "objectForKey:", a4))
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

- (void)addObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a5)
    goto LABEL_22;
LABEL_4:
  if (a5 >> 61)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[NSMutableDictionary addObjects:forKeys:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableDictionary addObjects:forKeys:count:]", a5);
    goto LABEL_23;
  }
  if (!a5)
    return;
  v10 = 0;
  do
  {
    if (!a3[v10])
    {
LABEL_19:
      v11 = _os_log_pack_size();
      v12 = _os_log_pack_fill();
      *(_DWORD *)v12 = 136315394;
      *(_QWORD *)(v12 + 4) = "-[NSMutableDictionary addObjects:forKeys:count:]";
      *(_WORD *)(v12 + 12) = 2048;
      *(_QWORD *)(v12 + 14) = v10;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableDictionary addObjects:forKeys:count:]", v10);
      v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
      objc_exception_throw(v13);
    }
    ++v10;
  }
  while (a5 != v10);
  if (!a4)
  {
LABEL_22:
    v14 = _os_log_pack_size();
    v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315394;
    *(_QWORD *)(v17 + 4) = "-[NSMutableDictionary addObjects:forKeys:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(_QWORD *)(v17 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableDictionary addObjects:forKeys:count:]", a5);
LABEL_23:
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v18);
  }
  v10 = 0;
  do
  {
    if (!a4[v10])
      goto LABEL_19;
    ++v10;
  }
  while (a5 != v10);
  do
  {
    if (!-[NSDictionary objectForKey:](self, "objectForKey:", *a4))
      -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", *a3, *a4);
    ++a3;
    ++a4;
    --a5;
  }
  while (a5);
}

- (void)addObjects:(id)a3 forKeys:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSMutableDictionary addObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: objects argument is not an NSArray"), "-[NSMutableDictionary addObjects:forKeys:]");
    goto LABEL_16;
  }
LABEL_4:
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSMutableDictionary addObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: keys argument is not an NSArray"), "-[NSMutableDictionary addObjects:forKeys:]");
LABEL_16:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v17);
  }
  v8 = objc_msgSend(a3, "count");
  v9 = objc_msgSend(a4, "count");
  if (v8 != v9)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of objects (%lu) differs from count of keys (%lu)"), "-[NSMutableDictionary addObjects:forKeys:]", v8, v9);
  v10 = objc_msgSend(a3, "count");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
      -[NSMutableDictionary addObject:forKey:](self, "addObject:forKey:", objc_msgSend(a3, "objectAtIndex:", i), objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)invert
{
  uint64_t v2;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
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
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableDictionary);
  v4 = -[NSDictionary allKeys](self, "allKeys");
  v5 = -[NSDictionary allValues](self, "allValues");
  -[NSMutableDictionary removeAllObjects](self, "removeAllObjects");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), -[NSArray objectAtIndex:](v5, "objectAtIndex:", v8 + v10));
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v8 += v10;
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
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableDictionary);
  v4 = -[NSDictionary count](self, "count");
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
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v9, v6, v15[0]);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v12 = -[NSDictionary countForKey:](self, "countForKey:", *(_QWORD *)&v9[8 * i]) + 1;
      while (--v12)
        -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", *(_QWORD *)&v9[8 * i]);
    }
  }
  free(v10);
}

- (void)removeEntriesInDictionary:(id)a3
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
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary removeEntriesInDictionary:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: dictionary argument is not an NSDictionary"), "-[NSMutableDictionary removeEntriesInDictionary:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  if (self == a3)
  {
    objc_msgSend(a3, "removeAllObjects");
  }
  else
  {
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
          -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v7);
    }
  }
}

- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  char v6;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _QWORD v18[7];
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_12:
    v14 = _os_log_pack_size();
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSMutableDictionary removeEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableDictionary removeEntriesWithOptions:passingTest:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)&v18[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
    objc_exception_throw(v16);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a4)
    goto LABEL_12;
LABEL_3:
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4);
  v9 = +[NSSet set](NSMutableSet, "set");
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v28 = 0;
  v24 = 850045857;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__NSMutableDictionary_removeEntriesWithOptions_passingTest___block_invoke;
  v18[3] = &unk_1E12E6320;
  v18[5] = a4;
  v18[6] = &v24;
  v18[4] = v9;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v18);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v11);
  }
}

uint64_t __60__NSMutableDictionary_removeEntriesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
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

- (void)removeEntriesPassingTest:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (a3)
      goto LABEL_3;
LABEL_5:
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSMutableDictionary removeEntriesPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSMutableDictionary removeEntriesPassingTest:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  -[NSMutableDictionary removeEntriesWithOptions:passingTest:](self, "removeEntriesWithOptions:passingTest:", 0, a3);
}

- (void)removeKeysForObject:(id)a3
{
  uint64_t v3;
  NSArray *v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  v6 = +[NSArray array](NSMutableArray, "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(self);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (-[NSDictionary objectForKey:](self, "objectForKey:", v11) == a3)
          -[NSArray addObject:](v6, "addObject:", v11);
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v8);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v13);
  }
}

- (void)replaceObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSException *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a5)
    goto LABEL_20;
LABEL_4:
  if (a5 >> 61)
  {
    v17 = _os_log_pack_size();
    v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableDictionary replaceObjects:forKeys:count:]", a5);
    goto LABEL_21;
  }
  if (!a5)
    return;
  v10 = 0;
  do
  {
    if (!a3[v10])
    {
LABEL_17:
      v14 = _os_log_pack_size();
      v15 = _os_log_pack_fill();
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)(v15 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:count:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(_QWORD *)(v15 + 14) = v10;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableDictionary replaceObjects:forKeys:count:]", v10);
      v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
      objc_exception_throw(v16);
    }
    ++v10;
  }
  while (a5 != v10);
  if (!a4)
  {
LABEL_20:
    v17 = _os_log_pack_size();
    v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableDictionary replaceObjects:forKeys:count:]", a5);
LABEL_21:
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v17);
    objc_exception_throw(v21);
  }
  v10 = 0;
  do
  {
    if (!a4[v10])
      goto LABEL_17;
    ++v10;
  }
  while (a5 != v10);
  do
  {
    v12 = (uint64_t)*a3++;
    v11 = v12;
    v13 = (uint64_t)*a4++;
    -[NSMutableDictionary replaceObject:forKey:](self, "replaceObject:forKey:", v11, v13);
    --a5;
  }
  while (a5);
}

- (void)replaceObjects:(id)a3 forKeys:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: objects argument is not an NSArray"), "-[NSMutableDictionary replaceObjects:forKeys:]");
    goto LABEL_16;
  }
LABEL_4:
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: keys argument is not an NSArray"), "-[NSMutableDictionary replaceObjects:forKeys:]");
LABEL_16:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v17);
  }
  v8 = objc_msgSend(a3, "count");
  v9 = objc_msgSend(a4, "count");
  if (v8 != v9)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of objects (%lu) differs from count of keys (%lu)"), "-[NSMutableDictionary replaceObjects:forKeys:]", v8, v9);
  v10 = objc_msgSend(a3, "count");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
      -[NSMutableDictionary replaceObject:forKey:](self, "replaceObject:forKey:", objc_msgSend(a3, "objectAtIndex:", i), objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)setEntriesFromDictionary:(id)a3
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
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSMutableDictionary setEntriesFromDictionary:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: dictionary argument is not an NSDictionary"), "-[NSMutableDictionary setEntriesFromDictionary:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v10);
    objc_exception_throw(v12);
  }
LABEL_4:
  if (self != a3)
  {
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
          -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v7);
    }
  }
}

- (void)setObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSException *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (a5)
    goto LABEL_20;
LABEL_4:
  if (a5 >> 61)
  {
    v17 = _os_log_pack_size();
    v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[NSMutableDictionary setObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableDictionary setObjects:forKeys:count:]", a5);
    goto LABEL_21;
  }
  if (!a5)
    return;
  v10 = 0;
  do
  {
    if (!a3[v10])
    {
LABEL_17:
      v14 = _os_log_pack_size();
      v15 = _os_log_pack_fill();
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)(v15 + 4) = "-[NSMutableDictionary setObjects:forKeys:count:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(_QWORD *)(v15 + 14) = v10;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableDictionary setObjects:forKeys:count:]", v10);
      v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
      objc_exception_throw(v16);
    }
    ++v10;
  }
  while (a5 != v10);
  if (!a4)
  {
LABEL_20:
    v17 = _os_log_pack_size();
    v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "-[NSMutableDictionary setObjects:forKeys:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableDictionary setObjects:forKeys:count:]", a5);
LABEL_21:
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v17);
    objc_exception_throw(v21);
  }
  v10 = 0;
  do
  {
    if (!a4[v10])
      goto LABEL_17;
    ++v10;
  }
  while (a5 != v10);
  do
  {
    v12 = (uint64_t)*a3++;
    v11 = v12;
    v13 = (uint64_t)*a4++;
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v11, v13);
    --a5;
  }
  while (a5);
}

- (void)setObjects:(id)a3 forKeys:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3)
      goto LABEL_4;
  }
  else if (!a3)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[NSMutableDictionary setObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: objects argument is not an NSArray"), "-[NSMutableDictionary setObjects:forKeys:]");
    goto LABEL_16;
  }
LABEL_4:
  if (a4 && (_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSMutableDictionary setObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: keys argument is not an NSArray"), "-[NSMutableDictionary setObjects:forKeys:]");
LABEL_16:
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v15);
  }
  v8 = objc_msgSend(a3, "count");
  v9 = objc_msgSend(a4, "count");
  if (v8 != v9)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of objects (%lu) differs from count of keys (%lu)"), "-[NSMutableDictionary setObjects:forKeys:]", v8, v9);
  if (v8)
  {
    for (i = 0; i != v8; ++i)
      -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", objc_msgSend(a3, "objectAtIndex:", i), objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)__setObject:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_3;
LABEL_8:
    v14 = _os_log_pack_size();
    v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSMutableDictionary __setObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSMutableDictionary __setObject:forKey:]");
    goto LABEL_10;
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3)
    goto LABEL_8;
LABEL_3:
  if (!a4)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSMutableDictionary __setObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[NSMutableDictionary __setObject:forKey:]");
LABEL_10:
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v18);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    CFLog(3, (uint64_t)CFSTR("*** CFDictionarySetValue(): attempt to use this function to set a key which is not copyable into a non-CFDictionary via toll-free bridging"), v8, v9, v10, v11, v12, v13, v19);
  -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

- (NSMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  unint64_t v5;
  const void **v6;
  const void **v7;
  uint64_t i;
  NSMutableDictionary *j;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSException *v21;
  _QWORD v22[2];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a5)
    goto LABEL_19;
  if (a5 >> 61)
  {
    v17 = _os_log_pack_size();
    v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[NSMutableDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSMutableDictionary initWithObjects:forKeys:count:]", v5);
    goto LABEL_20;
  }
  if (!a5)
    return -[NSMutableDictionary initWithCapacity:](self, "initWithCapacity:", 0);
  for (i = 0; i != a5; ++i)
  {
    if (!a3[i])
    {
LABEL_16:
      v14 = _os_log_pack_size();
      v15 = _os_log_pack_fill();
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)(v15 + 4) = "-[NSMutableDictionary initWithObjects:forKeys:count:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(_QWORD *)(v15 + 14) = i;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[NSMutableDictionary initWithObjects:forKeys:count:]", i);
      v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
      objc_exception_throw(v16);
    }
  }
  if (!a4)
  {
LABEL_19:
    v17 = _os_log_pack_size();
    v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "-[NSMutableDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSMutableDictionary initWithObjects:forKeys:count:]", v5);
LABEL_20:
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v17);
    objc_exception_throw(v21);
  }
  for (i = 0; i != a5; ++i)
  {
    if (!a4[i])
      goto LABEL_16;
  }
  for (j = -[NSMutableDictionary initWithCapacity:](self, "initWithCapacity:", a5); v5; --v5)
  {
    v11 = (uint64_t)*v7++;
    v10 = v11;
    v12 = (uint64_t)*v6++;
    -[NSMutableDictionary setObject:forKey:](j, "setObject:forKey:", v10, v12);
  }
  return j;
}

- (void)removeObjectForKey:(id)aKey
{
  objc_class *v4;

  v4 = __CFLookUpClass("NSMutableDictionary");
  OUTLINED_FUNCTION_0_12(v4, (uint64_t)self);
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
  objc_class *v5;

  v5 = __CFLookUpClass("NSMutableDictionary");
  OUTLINED_FUNCTION_0_12(v5, (uint64_t)self);
}

- (NSMutableDictionary)initWithCapacity:(NSUInteger)numItems
{
  objc_class *v4;

  v4 = __CFLookUpClass("NSMutableDictionary");
  __CFRequireConcreteImplementation(v4, (uint64_t)self);
}

@end
