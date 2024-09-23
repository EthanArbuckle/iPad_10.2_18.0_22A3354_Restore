@implementation NSKeyedArchiver

- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4
{
  char v5;
  const __CFString *v6;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  CFTypeRef v16;
  uint64_t v17;
  CFTypeID v18;
  unint64_t v19;
  void *v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v20);
  }
  v6 = (const __CFString *)a4;
  if (a4 && CFStringGetLength((CFStringRef)a4) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (const __CFString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  v8 = (void *)objc_opt_new();
  _CFArraySetCapacity();
  -[NSMutableArray addObject:](self->_containers, "addObject:", v8);
  ++self->_estimatedCount;

  v9 = atomic_load(&self->_flags);
  atomic_store(v9 | 1, &self->_flags);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(a3);
        _encodeObject((uint64_t)self, &stru_1E0F56070, *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13++), 0);
      }
      while (v11 != v13);
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v11);
  }
  v14 = -[NSMutableArray count](self->_containers, "count") - 1;
  if (v14 < 0)
    v15 = 0;
  else
    v15 = (const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_containers, "objectAtIndexedSubscript:", v14);
  v16 = CFRetain(v15);
  v17 = -[NSMutableArray count](self->_containers, "count");
  -[NSMutableArray removeObjectAtIndex:](self->_containers, "removeObjectAtIndex:", v17 - 1);
  if (v17 - 1 >= 1)
  {
    v18 = CFGetTypeID((CFTypeRef)-[NSMutableArray objectAtIndexedSubscript:](self->_containers, "objectAtIndexedSubscript:", v17 - 2));
    v19 = atomic_load(&self->_flags);
    atomic_store(v19 & 0xFFFFFFFFFFFFFFFELL | (v18 == 19), &self->_flags);
  }
  addValueToTopContainerE((uint64_t)self, v6, v16);
  CFRelease(v16);
}

- (BOOL)requiresSecureCoding
{
  unint64_t v2;

  v2 = atomic_load(&self->_flags);
  return (v2 >> 2) & 1;
}

+ (NSString)classNameForClass:(Class)cls
{
  NSString *Value;

  os_unfair_lock_lock(&_MergedGlobals_41);
  if (qword_1ECD09678)
    Value = (NSString *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD09678, cls);
  else
    Value = 0;
  os_unfair_lock_unlock(&_MergedGlobals_41);
  return Value;
}

- (NSString)classNameForClass:(Class)cls
{
  NSString *result;

  result = (NSString *)self->_classNameMap;
  if (result)
    return (NSString *)CFDictionaryGetValue((CFDictionaryRef)result, cls);
  return result;
}

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  char v5;
  BOOL v8;
  __CFSet *visited;
  void *v10;
  void *value[2];

  value[1] = *(void **)MEMORY[0x1E0C80C00];
  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot replace")), 0);
    objc_exception_throw(v10);
  }
  if (a3 != a4)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[NSKeyedArchiverDelegate archiver:willReplaceObject:withObject:](self->_delegate, "archiver:willReplaceObject:withObject:", self, a3, a4);
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent(self->_objRefMap, a3, (const void **)value))
      v8 = LODWORD(value[0]) == 0xFFFFFFFFLL;
    else
      v8 = 1;
    if (!v8)
    {
      CFDictionaryRemoveValue(self->_objRefMap, a3);
      CFDictionarySetValue(self->_objRefMap, a4, value[0]);
    }
  }
  if (!self->_replacementMap)
  {
    self->_replacementMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0);
    _CFDictionarySetCapacity();
  }
  visited = self->_visited;
  if (!visited)
  {
    self->_visited = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0);
    _CFSetSetCapacity();
    visited = self->_visited;
  }
  CFSetAddValue(visited, a3);
  if (a3 != a4)
    CFDictionarySetValue(self->_replacementMap, a3, a4);
}

- (void)encodeInt32:(int32_t)value forKey:(NSString *)key
{
  char v5;
  NSString *v6;
  void *v8;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v6 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0) == 36)
    v6 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  _encodeInt32((uint64_t)self, v6, value);
}

- (void)encodeDouble:(double)value forKey:(NSString *)key
{
  char v5;
  NSString *v6;
  void *v8;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v6 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0) == 36)
    v6 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  _encodeDouble((uint64_t)self, v6, value);
}

- (void)_encodePropertyList:(id)a3 forKey:(id)a4
{
  char v5;
  const __CFString *v6;
  void *v8;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v6 = (const __CFString *)a4;
  if (a4 && CFStringGetLength((CFStringRef)a4) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (const __CFString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  addValueToTopContainerE((uint64_t)self, v6, a3);
}

- (void)encodeFloat:(float)value forKey:(NSString *)key
{
  char v5;
  NSString *v6;
  void *v8;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v6 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0) == 36)
    v6 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  _encodeFloat((uint64_t)self, v6, value);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeBool:(BOOL)value forKey:(NSString *)key
{
  char v5;
  NSString *v6;
  _BOOL4 v7;
  const void **v8;
  void *v9;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v9);
  }
  v6 = key;
  v7 = value;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0) == 36)
    v6 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  v8 = (const void **)MEMORY[0x1E0C9AE50];
  if (!v7)
    v8 = (const void **)MEMORY[0x1E0C9AE40];
  addValueToTopContainerE((uint64_t)self, v6, *v8);
}

- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key
{
  char v6;
  NSString *v7;
  NSString *v10;
  void *v11;
  const __CFString *v12;

  v6 = atomic_load(&self->_flags);
  if ((v6 & 2) != 0)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more"));
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = CFSTR("NSInvalidArchiveOperationException");
    goto LABEL_11;
  }
  v7 = key;
  if (!bytes && length)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: argument inconsistency: bytes pointer is null but length (%ld) is not zero"), _NSMethodExceptionProem((objc_class *)self, a2), length);
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (const __CFString *)*MEMORY[0x1E0C99778];
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, 0));
  }
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v7, 0) == 36)
    v7 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v7);
  _encodeBytes((uint64_t)self, bytes, length, v7);
}

- (void)encodeInt64:(int64_t)value forKey:(NSString *)key
{
  char v5;
  NSString *v6;
  void *v8;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v6 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0) == 36)
    v6 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  _encodeInt64((uint64_t)self, v6, value);
}

+ (NSData)archivedDataWithRootObject:(id)object requiringSecureCoding:(BOOL)requiresSecureCoding error:(NSError *)error
{
  void *v6;
  NSData *v7;

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initRequiringSecureCoding:", requiresSecureCoding);
  objc_msgSend(v6, "encodeObject:forKey:", object, CFSTR("root"));
  v7 = (NSData *)objc_msgSend(v6, "encodedData");
  objc_msgSend(v6, "finishEncoding");

  return v7;
}

- (void)encodeObject:(id)object forKey:(NSString *)key
{
  char v5;
  NSString *v6;
  void *v8;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v6 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0) == 36)
    v6 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  _encodeObject((uint64_t)self, v6, object, 0);
}

- (void)dealloc
{
  char v3;
  NSObject *v5;
  unint64_t cacheSize;
  uint64_t v7;
  unsigned int v8;
  const __CFKeyedArchiverUID *v9;
  const __CFKeyedArchiverUID **cache;
  void *stream;
  __CFDictionary *objRefMap;
  __CFDictionary *replacementMap;
  __CFDictionary *classNameMap;
  __CFDictionary *conditionals;
  __CFDictionary *classes;
  __CFSet *visited;
  objc_super v19;
  uint8_t buf[4];
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load(&self->_flags);
  if ((v3 & 2) == 0)
  {
    v5 = _NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = _NSMethodExceptionProem((objc_class *)self, a2);
      _os_log_error_impl(&dword_1817D9000, v5, OS_LOG_TYPE_ERROR, "%@: warning: NSKeyedArchiver deallocated without having had -finishEncoding called on it.", buf, 0xCu);
    }
  }
  cacheSize = self->_cacheSize;
  if (cacheSize)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = self->_cache[v7];
      if (v9)
      {
        CFRelease(v9);
        cacheSize = self->_cacheSize;
      }
      v7 = v8;
    }
    while (cacheSize > v8++);
  }
  cache = self->_cache;
  if (cache)
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], cache);
  stream = self->_stream;
  if (stream)
    CFRelease(stream);

  objRefMap = self->_objRefMap;
  if (objRefMap)
    CFRelease(objRefMap);
  replacementMap = self->_replacementMap;
  if (replacementMap)
    CFRelease(replacementMap);
  classNameMap = self->_classNameMap;
  if (classNameMap)
    CFRelease(classNameMap);
  conditionals = self->_conditionals;
  if (conditionals)
    CFRelease(conditionals);
  classes = self->_classes;
  if (classes)
    CFRelease(classes);
  visited = self->_visited;
  if (visited)
    CFRelease(visited);
  v19.receiver = self;
  v19.super_class = (Class)NSKeyedArchiver;
  -[NSKeyedArchiver dealloc](&v19, sel_dealloc);
}

- (NSData)encodedData
{
  char v3;

  if ((_NSIsNSData() & 1) == 0)
    return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = atomic_load(&self->_flags);
  if ((v3 & 2) == 0)
    -[NSKeyedArchiver finishEncoding](self, "finishEncoding");
  return (NSData *)self->_stream;
}

- (void)finishEncoding
{
  char v2;
  unint64_t v5;
  const __CFAllocator *v6;
  CFNumberRef v7;
  __CFDictionary *Mutable;
  objc_class *v9;
  NSString *v10;
  const void *ValueAtIndex;
  uint64_t XMLDataWithExtras;
  const __CFData *v13;
  CFTypeID v14;
  CFTypeID TypeID;
  __CFData *stream;
  const UInt8 *BytePtr;
  CFIndex Length;
  void *v19;
  int valuePtr;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  valuePtr = 100000;
  v2 = atomic_load(&self->_flags);
  if ((v2 & 2) == 0)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[NSKeyedArchiverDelegate archiverWillFinish:](self->_delegate, "archiverWillFinish:", self);
    v5 = atomic_load(&self->_flags);
    atomic_store(v5 | 2, &self->_flags);
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
    Mutable = CFDictionaryCreateMutable(v6, 8, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    CFDictionarySetValue(Mutable, CFSTR("$archiver"), v10);
    CFDictionarySetValue(Mutable, CFSTR("$version"), v7);
    CFDictionarySetValue(Mutable, CFSTR("$objects"), self->_objects);
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)self->_containers, 0);
    CFDictionarySetValue(Mutable, CFSTR("$top"), ValueAtIndex);
    CFRelease(v7);
    self->_estimatedCount += 12;
    if (-[NSKeyedArchiver outputFormat](self, "outputFormat") == NSPropertyListXMLFormat_v1_0)
    {
      XMLDataWithExtras = _CFPropertyListCreateXMLDataWithExtras();
      if (!XMLDataWithExtras)
      {
        v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: could not create XML data"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
        objc_exception_throw(v19);
      }
      v13 = (const __CFData *)XMLDataWithExtras;
      v14 = CFGetTypeID(self->_stream);
      TypeID = CFDataGetTypeID();
      stream = (__CFData *)self->_stream;
      BytePtr = CFDataGetBytePtr(v13);
      Length = CFDataGetLength(v13);
      if (v14 == TypeID)
        CFDataAppendBytes(stream, BytePtr, Length);
      else
        CFWriteStreamWrite(stream, BytePtr, Length);
      CFRelease(v13);
    }
    else if (-[NSKeyedArchiver outputFormat](self, "outputFormat") == NSPropertyListBinaryFormat_v1_0)
    {
      __CFBinaryPlistWriteToStreamWithOptions();
    }
    CFRelease(Mutable);
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSKeyedArchiverDelegate archiverDidFinish:](self->_delegate, "archiverDidFinish:", self);
    }
  }
}

- (NSPropertyListFormat)outputFormat
{
  unint64_t v2;

  v2 = atomic_load(&self->_flags);
  return v2 >> 16;
}

- (NSKeyedArchiver)initRequiringSecureCoding:(BOOL)requiresSecureCoding
{
  _BOOL8 v3;
  NSKeyedArchiver *v4;

  v3 = requiresSecureCoding;
  v4 = -[NSKeyedArchiver init](self, "init");
  -[NSKeyedArchiver setRequiresSecureCoding:](v4, "setRequiresSecureCoding:", v3);
  return v4;
}

- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = atomic_load(&self->_flags);
  v4 = v3 & 0xFFFFFFFFFFFFFFFBLL;
  v5 = 4;
  if (!requiresSecureCoding)
    v5 = 0;
  atomic_store(v4 | v5, &self->_flags);
}

- (id)_initWithOutput:(id)a3
{
  void *v4;
  unint64_t v5;
  CFDictionaryKeyCallBacks keyCallBacks;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_stream = (void *)CFRetain(a3);
  atomic_store(0xC80000uLL, &self->_flags);
  self->_delegate = 0;
  self->_containers = 0;
  self->_objects = 0;
  self->_objRefMap = 0;
  self->_replacementMap = 0;
  self->_classNameMap = 0;
  self->_conditionals = 0;
  self->_classes = 0;
  self->_visited = 0;
  self->_cache = 0;
  self->_cacheSize = 0;
  self->_estimatedCount = 0;
  self->_containers = (NSMutableArray *)objc_opt_new();
  self->_objects = (NSMutableArray *)objc_opt_new();
  _CFArraySetCapacity();
  -[NSMutableArray addObject:](self->_objects, "addObject:", CFSTR("$null"));
  keyCallBacks.version = 0;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)__karetain;
  keyCallBacks.release = (CFDictionaryReleaseCallBack)__karelease;
  memset(&keyCallBacks.copyDescription, 0, 24);
  self->_objRefMap = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
  _CFDictionarySetCapacity();
  self->_conditionals = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
  v4 = (void *)objc_opt_new();
  _CFDictionarySetCapacity();
  -[NSMutableArray addObject:](self->_containers, "addObject:", v4);
  ++self->_estimatedCount;

  v5 = atomic_load(&self->_flags);
  atomic_store(v5 & 0xFFFFFFFFFFFFFFFELL, &self->_flags);
  self->_genericKey = 0;
  return self;
}

- (NSKeyedArchiver)init
{
  return (NSKeyedArchiver *)-[NSKeyedArchiver _initWithOutput:](self, "_initWithOutput:", (id)objc_opt_new());
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSKeyedArchiverDelegate *)delegate;
}

- (void)encodeInt:(int)value forKey:(NSString *)key
{
  char v5;
  CFNumberRef v7;
  void *v8;
  int valuePtr;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  valuePtr = value;
  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)key, 0) == 36)
    key = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", key);
  addValueToTopContainerE((uint64_t)self, key, v7);
  CFRelease(v7);
}

- (void)setClassName:(NSString *)codedName forClass:(Class)cls
{
  __CFDictionary *classNameMap;

  classNameMap = self->_classNameMap;
  if (!classNameMap)
  {
    classNameMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, MEMORY[0x1E0C9B3A0]);
    self->_classNameMap = classNameMap;
  }
  if (codedName)
    CFDictionarySetValue(classNameMap, cls, codedName);
  else
    CFDictionaryRemoveValue(classNameMap, cls);
}

+ (NSData)archivedDataWithRootObject:(id)rootObject
{
  NSData *v5;
  void *v6;
  id v7;

  v5 = (NSData *)(id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithLength:", 0);
  v6 = (void *)MEMORY[0x186DA8F78]();
  v7 = (id)objc_msgSend(objc_allocWithZone((Class)a1), "initForWritingWithMutableData:", v5);
  objc_msgSend(v7, "encodeObject:forKey:", rootObject, CFSTR("root"));
  objc_msgSend(v7, "finishEncoding");
  objc_autoreleasePoolPop(v6);
  return v5;
}

+ (void)initialize
{
  if (NSKeyedArchiver == a1)
  {
    if (getenv("NSWarnAboutOldStyleArchiverMethods"))
      _warnArchiverCompat = 1;
    +[NSKeyedArchiver setClassName:forClass:](NSKeyedArchiver, "setClassName:forClass:", CFSTR("NSLocalTimeZone"), objc_lookUpClass("__NSLocalTimeZone"));
    +[NSKeyedArchiver setClassName:forClass:](NSKeyedArchiver, "setClassName:forClass:", CFSTR("NSLocalTimeZone"), objc_lookUpClass("__NSLocalTimeZoneI"));
  }
}

+ (void)setClassName:(NSString *)codedName forClass:(Class)cls
{
  __CFDictionary *Mutable;

  os_unfair_lock_lock(&_MergedGlobals_41);
  Mutable = (__CFDictionary *)qword_1ECD09678;
  if (!qword_1ECD09678)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, MEMORY[0x1E0C9B3A0]);
    qword_1ECD09678 = (uint64_t)Mutable;
  }
  if (codedName)
    CFDictionarySetValue(Mutable, cls, codedName);
  else
    CFDictionaryRemoveValue(Mutable, cls);
  os_unfair_lock_unlock(&_MergedGlobals_41);
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  NSString *v8;
  char v9;
  int v10;
  unsigned int v11;
  const char *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  NSString *v16;
  void *v17;
  const __CFString *v18;
  NSString *v19;

  if (_warnArchiverCompat == 1)
  {
    v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v8);
  }
  v9 = atomic_load(&self->_flags);
  if ((v9 & 2) != 0)
  {
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more"));
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = CFSTR("NSInvalidArchiveOperationException");
    goto LABEL_21;
  }
  if (!a3 || !a4)
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: null type or address pointer"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_20:
    v16 = v19;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = (const __CFString *)*MEMORY[0x1E0C99778];
LABEL_21:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v16, 0));
  }
  v10 = *(unsigned __int8 *)a3;
  if (v10 != 91)
  {
    if (v10 != 123)
    {
      _compatEncodeValueOfObjCType((objc_class *)self, (char)v10, (double *)a4, a2);
      return;
    }
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: this archiver cannot encode structs"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_20;
  }
  v13 = *((unsigned __int8 *)a3 + 1);
  v12 = a3 + 1;
  v11 = v13;
  if (v13 - 48 > 9)
    goto LABEL_17;
  v14 = 0;
  do
  {
    v14 = 10 * v14 + v11 - 48;
    v15 = *(unsigned __int8 *)++v12;
    v11 = v15;
  }
  while (v15 - 48 < 0xA);
  if (!v14)
  {
LABEL_17:
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: array count is missing or zero"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_20;
  }
  if (v11 == 93)
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: array type is missing"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_20;
  }
  -[NSKeyedArchiver encodeArrayOfObjCType:count:at:](self, "encodeArrayOfObjCType:count:at:", v12);
}

- (void)encodeConditionalObject:(id)object forKey:(NSString *)key
{
  char v5;
  NSString *v6;
  void *v8;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v8);
  }
  v6 = key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex((CFStringRef)v6, 0) == 36)
    v6 = (NSString *)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v6);
  _encodeObject((uint64_t)self, v6, object, 1);
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  NSString *v8;
  char v9;
  unint64_t genericKey;
  NSString *v11;
  void *v12;

  if (_warnArchiverCompat == 1)
  {
    v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v8);
  }
  v9 = atomic_load(&self->_flags);
  if ((v9 & 2) != 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v12);
  }
  genericKey = self->_genericKey;
  self->_genericKey = genericKey + 1;
  if (genericKey > 0x27)
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%ld"), genericKey);
  else
    v11 = (NSString *)generic_keys[genericKey];
  _encodeBytes((uint64_t)self, (const UInt8 *)a3, a4, v11);
}

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path
{
  void *v7;
  __CFWriteStream *v8;
  int v9;
  CFStreamStatus Status;
  char v11;
  BOOL v12;
  id v13;
  CFStreamStatus v14;
  void *v16;
  NSString *v17[2];

  v17[1] = *(NSString **)MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x186DA8F78](a1, a2);
  v16 = 0;
  v17[0] = 0;
  if (_NSCreateTemporaryFile(path, v17, 0, &v16, 0))
  {
    v8 = CFWriteStreamCreateWithFile(0, (CFURLRef)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17[0], 0));
    v9 = CFWriteStreamOpen(v8);
    Status = CFWriteStreamGetStatus(v8);
    v11 = 0;
    if (v9)
      v12 = Status == kCFStreamStatusOpen;
    else
      v12 = 0;
    if (v12)
    {
      v13 = (id)objc_msgSend(objc_allocWithZone((Class)a1), "_initWithOutput:", v8);
      objc_msgSend(v13, "encodeObject:forKey:", rootObject, CFSTR("root"));
      objc_msgSend(v13, "finishEncoding");
      v14 = CFWriteStreamGetStatus(v8);
      CFWriteStreamClose(v8);
      if (v14 == kCFStreamStatusError)
        v11 = 0;
      else
        v11 = _NSMoveTemporaryFileToDestination(v17[0], path);
    }
    _NSCleanupTemporaryDirectory(v16);
  }
  else
  {
    v11 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v11;
}

- (void)_setBlobForCurrentObject:(id)a3
{
  uint64_t v5;

  v5 = -[NSMutableArray count](self->_containers, "count") - 1;
  -[NSMutableArray addObject:](self->_containers, "addObject:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->_containers, "removeObjectAtIndex:", v5);
}

- (id)_blobForCurrentObject
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_containers, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_containers, "count") - 1);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSKeyedArchiver;
  return -[NSKeyedArchiver description](&v3, sel_description);
}

- (BOOL)_allowsValueCoding
{
  return 1;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setOutputFormat:(NSPropertyListFormat)outputFormat
{
  unsigned __int16 v3;
  void *v4;

  if (outputFormat != NSPropertyListXMLFormat_v1_0 && outputFormat != NSPropertyListBinaryFormat_v1_0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid format (%ld)"), _NSMethodExceptionProem((objc_class *)self, a2), outputFormat), 0);
    objc_exception_throw(v4);
  }
  v3 = atomic_load(&self->_flags);
  atomic_store(((_DWORD)outputFormat << 16) | (unint64_t)v3, &self->_flags);
}

- (void)encodeObject:(id)a3
{
  NSString *v6;
  char v7;
  unint64_t genericKey;
  NSString *v9;
  void *v10;

  if (_warnArchiverCompat == 1)
  {
    v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v6);
  }
  v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v10);
  }
  genericKey = self->_genericKey;
  self->_genericKey = genericKey + 1;
  if (genericKey > 0x27)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%ld"), genericKey);
  else
    v9 = (NSString *)generic_keys[genericKey];
  _encodeObject((uint64_t)self, v9, a3, 0);
}

- (void)encodeConditionalObject:(id)a3
{
  NSString *v6;
  char v7;
  unint64_t genericKey;
  NSString *v9;
  void *v10;

  if (_warnArchiverCompat == 1)
  {
    v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v6);
  }
  v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more")), 0);
    objc_exception_throw(v10);
  }
  genericKey = self->_genericKey;
  self->_genericKey = genericKey + 1;
  if (genericKey > 0x27)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%ld"), genericKey);
  else
    v9 = (NSString *)generic_keys[genericKey];
  _encodeObject((uint64_t)self, v9, a3, 1);
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  NSString *v6;
  char v7;
  uint64_t *v8;
  NSString *v10;
  NSString *v11;
  void *v12;
  const __CFString *v13;
  uint64_t *v14;
  uint64_t v15;

  if (_warnArchiverCompat == 1)
  {
    v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v6);
  }
  v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more"), 0);
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = CFSTR("NSInvalidArchiveOperationException");
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v11, 0));
  }
  if (!a3)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: null types pointer"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_10:
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (const __CFString *)*MEMORY[0x1E0C99778];
    goto LABEL_11;
  }
  v14 = &v15;
  if (*a3)
  {
    while (1)
    {
      v8 = v14++;
      if (!*v8)
        break;
      -[NSKeyedArchiver encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", a3);
      if (!*(unsigned __int8 *)++a3)
        return;
    }
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: null address pointer"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_10;
  }
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  NSString *v10;
  char v11;
  int v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSString *v19;
  uint64_t v20;

  if (_warnArchiverCompat == 1)
  {
    v10 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v10);
  }
  v11 = atomic_load(&self->_flags);
  if ((v11 & 2) != 0)
  {
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: archive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot encode anything more"));
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = CFSTR("NSInvalidArchiveOperationException");
    goto LABEL_17;
  }
  if (!a3 || !a5)
  {
    v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    v18 = CFSTR("%@: null type or address pointer");
LABEL_15:
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19, v20);
    goto LABEL_16;
  }
  if (!a4)
  {
    v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    v18 = CFSTR("%@: count is zero");
    goto LABEL_15;
  }
  v12 = *(unsigned __int8 *)a3;
  if (v12 == 40 || v12 == 123 || v12 == 91)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unsupported type \"%s\" for array encoding"), _NSMethodExceptionProem((objc_class *)self, a2), a3);
LABEL_16:
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = (const __CFString *)*MEMORY[0x1E0C99778];
LABEL_17:
    objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, 0));
  }
  v13 = (void *)objc_msgSend(objc_allocWithZone((Class)_NSKeyedCoderOldStyleArray), "initWithObjCType:count:at:", *a3, a4, a5);
  -[NSKeyedArchiver encodeObject:](self, "encodeObject:", v13);

}

- (int64_t)versionForClassName:(id)a3
{
  Class v3;

  v3 = NSClassFromString((NSString *)a3);
  if (v3)
    return -[objc_class version](v3, "version");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unsigned)systemVersion
{
  return 2000;
}

@end
