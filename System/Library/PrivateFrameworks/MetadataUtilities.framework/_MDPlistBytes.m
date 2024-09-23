@implementation _MDPlistBytes

- (void)dealloc
{
  CFLog();
  __break(1u);
}

- (void)enumerateQueryResults:(unint64_t)a3 stringCache:(id *)a4 usingBlock:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v6 = 0;
  do
  {
    v7 = v6 + 1;
    v8 = -[_MDPlistBytes enumerateQueryResults:attributeSize:stringCache:usingBlock:](self, "enumerateQueryResults:attributeSize:stringCache:usingBlock:");
    v6 = v7;
  }
  while (v8);
}

- (BOOL)enumerateQueryResults:(unint64_t)a3 attributeSize:(unint64_t)a4 stringCache:(id *)a5 usingBlock:(id)a6
{
  __CFString *v9;
  _OWORD v12[4];
  uint64_t (*v13)(uint64_t, uint64_t *);
  CFTypeRef (*v14)(CFTypeRef, uint64_t, uint64_t *);
  uint64_t (*v15)(uint64_t);
  $865E03C8118FFBAC5CA03B3027037A1C *v16;
  _QWORD v17[3];
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17[0] = 0;
  v19 = 0;
  v17[1] = a6;
  v17[2] = a4;
  v18 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  v13 = _QueryResultsBeginArray;
  v14 = _QueryResultsValue;
  memset(v12, 0, sizeof(v12));
  v15 = _QueryResultsEndArray;
  v16 = a5;
  v9 = _MDPlistBytesCopyPlistAtIndexWithCallbacksAndAllocator(*MEMORY[0x1E0C9AE00], (uint64_t)self, a3, (uint64_t)v12, (char *)v17);
  if (v9)
    CFRelease(v9);
  free(v18);
  return BYTE1(v19) && v19 == 0;
}

- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 trusted:(unsigned __int8)a5 deallocator:(id)a6
{
  int v7;
  _MDPlistBytes *v10;
  _MDPlistBytes *v11;
  void *v12;
  CFTypeRef v13;
  objc_super v15;
  uint64_t v16;

  v7 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)_MDPlistBytes;
  v10 = -[_MDPlistBytes init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    if (a3)
    {
      if (a4 - 16 > 0x6FFFFFF0)
      {
        *((_WORD *)v10 + 16) = 617;
      }
      else
      {
        v10->_byteVector = (unint64_t)a3;
        v10->_byteVectorCnt = a4;
        v10->_byteVectorCapacity = a4;
        if (a6)
          v12 = _Block_copy(a6);
        else
          v12 = 0;
        v11->_deallocator = v12;
        _maybeSwapPlistBytes((uint64_t)v11, v7 != 0);
      }
    }
    else
    {

      if (qword_1EE5C9530 != -1)
        dispatch_once(&qword_1EE5C9530, &__block_literal_global_113);
      v13 = CFRetain((CFTypeRef)qword_1EE5C9528);
      return (_MDPlistBytes *)CFMakeCollectable(v13);
    }
  }
  return v11;
}

+ (__MDPlistBytes)createArrayPlistBytesUsingBlock:(id)a3
{
  __MDPlistBytes *result;

  result = +[_MDMutablePlistBytes createArrayPlistBytesUsingBlock:](_MDMutablePlistBytes, "createArrayPlistBytesUsingBlock:", a3);
  if (result)
    *((_BYTE *)result + 34) &= ~1u;
  return result;
}

+ (__MDPlistBytes)createDictionaryPlistBytesUsingBlock:(id)a3
{
  __MDPlistBytes *result;

  result = +[_MDMutablePlistBytes createDictionaryPlistBytesUsingBlock:](_MDMutablePlistBytes, "createDictionaryPlistBytesUsingBlock:", a3);
  if (result)
    *((_BYTE *)result + 34) &= ~1u;
  return result;
}

+ (__MDPlistBytes)createPlistBytes:(id)a3
{
  _MDMutablePlistBytes *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = -[_MDMutablePlistBytes initWithCapacity:useMalloc:]([_MDMutablePlistBytes alloc], "initWithCapacity:useMalloc:", 0, 0);
  if (!v4)
    +[_MDPlistBytes createPlistBytes:].cold.1(0, v5, v6);
  v7 = (uint64_t)v4;
  CFRetain(v4);

  if (_MDPlistBytesBeginPlist(v7) && __MDPlistBytesAddObject(v7, (const __CFString *)a3))
    _MDPlistBytesEndPlist(v7);
  *(_BYTE *)(v7 + 34) &= ~1u;
  return (__MDPlistBytes *)v7;
}

+ (__MDPlistBytes)emptyArrayPlistBytes
{
  if (qword_1EE5C9488 != -1)
    dispatch_once(&qword_1EE5C9488, &__block_literal_global_10);
  return (__MDPlistBytes *)_MergedGlobals;
}

+ (__MDPlistBytes)emptyDictionaryPlistBytes
{
  if (qword_1EE5C9498 != -1)
    dispatch_once(&qword_1EE5C9498, &__block_literal_global_4_0);
  return (__MDPlistBytes *)qword_1EE5C9490;
}

+ (void)enumerateObjectsFromPlistBytes:(char *)a3 count:(unsigned int)a4 shouldDeallocate:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL4 v7;
  uint64_t v8;
  _MDPlistBytes *v10;
  void *v11;
  _MDPlistBytes *v12;
  void *v13;

  if (!a3)
  {
    if (qword_1EE5C9530 == -1)
    {
      v13 = (void *)CFRetain((CFTypeRef)qword_1EE5C9528);
      if (!v13)
        return;
    }
    else
    {
      dispatch_once(&qword_1EE5C9530, &__block_literal_global_113);
      v13 = (void *)CFRetain((CFTypeRef)qword_1EE5C9528);
      if (!v13)
        return;
    }
LABEL_8:
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", a6);
    CFRelease(v13);
    return;
  }
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = [_MDPlistBytes alloc];
  if (v7)
    v11 = &__block_literal_global_98;
  else
    v11 = 0;
  v12 = -[_MDPlistBytes initWithByteVector:count:trusted:deallocator:](v10, "initWithByteVector:count:trusted:deallocator:", a3, v8, 0, v11);
  v13 = v12;
  if (v12)
    CFRetain(v12);

  if (v13)
    goto LABEL_8;
}

+ (__MDPlistBytes)nullObjectPlistBytes
{
  if (qword_1EE5C94A8 != -1)
    dispatch_once(&qword_1EE5C94A8, &__block_literal_global_6);
  return (__MDPlistBytes *)qword_1EE5C94A0;
}

- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 shouldDeallocate:(BOOL)a5
{
  void *v5;

  if (a5)
    v5 = &__block_literal_global_98;
  else
    v5 = 0;
  return -[_MDPlistBytes initWithByteVector:count:deallocator:](self, "initWithByteVector:count:deallocator:", a3, *(_QWORD *)&a4, v5);
}

- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 deallocator:(id)a5
{
  return -[_MDPlistBytes initWithByteVector:count:trusted:deallocator:](self, "initWithByteVector:count:trusted:deallocator:", a3, *(_QWORD *)&a4, 0, a5);
}

- (unint64_t)_cfTypeID
{
  if (qword_1EE5C94B0 != -1)
    dispatch_once(&qword_1EE5C94B0, &__block_literal_global_7_0);
  return qword_1EE5C94B8;
}

- (id)description
{
  __CFString *v2;

  v2 = __MDPlistBytesCopyDebugDescription((uint64_t)self);
  return (id)(id)CFMakeCollectable(v2);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  size_t byteVectorCnt;
  const void *v9;

  v5 = objc_msgSend(a3, "_cfTypeID");
  v6 = v5;
  if (qword_1EE5C94B0 == -1)
  {
    if (v5 != qword_1EE5C94B8)
      return 0;
  }
  else
  {
    dispatch_once(&qword_1EE5C94B0, &__block_literal_global_7_0);
    if (v6 != qword_1EE5C94B8)
      return 0;
  }
  byteVectorCnt = self->_byteVectorCnt;
  if (a3 && !*((_WORD *)a3 + 16))
  {
    if ((_DWORD)byteVectorCnt != *((_DWORD *)a3 + 4))
      return 0;
    v9 = (const void *)*((_QWORD *)a3 + 1);
  }
  else
  {
    if ((_DWORD)byteVectorCnt)
      return 0;
    v9 = 0;
  }
  return memcmp((const void *)self->_byteVector, v9, byteVectorCnt) == 0;
}

- (__CFData)copyData
{
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)self->_byteVector, self->_byteVectorCnt);
}

- (__CFData)copyDataWithBytesNoCopy
{
  return CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)self->_byteVector, self->_byteVectorCnt, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

- (void)dumpUIDs
{
  NSObject *v3;
  int uidCount;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  _BYTE v10[14];
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = _MDLogForCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uidCount = self->_uidCount;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v10 = self;
    *(_WORD *)&v10[8] = 1024;
    *(_DWORD *)&v10[10] = uidCount;
    _os_log_impl(&dword_1A09DA000, v3, OS_LOG_TYPE_DEFAULT, "_MDPlistBytes:%p UID Count: %d", buf, 0x12u);
  }
  if (self->_uidCount >= 1)
  {
    v5 = 0;
    do
    {
      v6 = self->_uidVector[v5];
      v7 = self->_wrapperPtr[v6 & 0xFFFFFF];
      v8 = _MDLogForCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110400;
        *(_DWORD *)v10 = v5;
        *(_WORD *)&v10[4] = 2048;
        *(_QWORD *)&v10[6] = v6;
        v11 = 1024;
        v12 = BYTE3(v6);
        v13 = 1024;
        v14 = HIDWORD(v6);
        v15 = 1024;
        v16 = v6 & 0xFFFFFF;
        v17 = 2048;
        v18 = v7;
        _os_log_impl(&dword_1A09DA000, v8, OS_LOG_TYPE_DEFAULT, "   desc[%d]: 0x%16.16llx tag: %2.2x var: 0x%4.4x qc: 0x%4.4x 0x%16.16llx", buf, 0x2Eu);
      }
      ++v5;
    }
    while (v5 < self->_uidCount);
  }
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  uint64_t v10;

  v5 = 0;
  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v6 = *MEMORY[0x1E0C9AE00];
  do
  {
    v7 = _MDPlistBytesCopyPlistAtIndexWithCallbacksAndAllocator(v6, (uint64_t)self, v5, (uint64_t)&_kMDPlistBytesDeserializationCallbacks, sel_enumerateObjectsUsingBlock_);
    if (!v7)
      break;
    v8 = v7;
    (*((void (**)(id, __CFString *, uint64_t, char *))a3 + 2))(a3, v7, v5, &v9);
    CFRelease(v8);
    ++v5;
  }
  while (!v9);
}

+ (void)createPlistBytes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7_0("_MDPlistBytesCreateMutable", "_MDPlistBytes.c", a3, "pb");
}

@end
