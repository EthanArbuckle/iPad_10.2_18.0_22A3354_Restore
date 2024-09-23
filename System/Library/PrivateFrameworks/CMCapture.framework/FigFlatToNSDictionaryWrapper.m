@implementation FigFlatToNSDictionaryWrapper

- (void)dealloc
{
  OpaqueFigFlatDictionary *flatDictionary;
  OpaqueFigFlatDictionaryKeySpec *keySpec;
  void (**deallocatorBlock)(void);
  objc_super v6;

  flatDictionary = self->_flatDictionary;
  if (flatDictionary)
    CFRelease(flatDictionary);
  keySpec = self->_keySpec;
  if (keySpec)
    CFRelease(keySpec);
  deallocatorBlock = (void (**)(void))self->_deallocatorBlock;
  if (deallocatorBlock)
  {
    if (self->_exportedKeySpec)
    {
      deallocatorBlock[2]();
      deallocatorBlock = (void (**)(void))self->_deallocatorBlock;
    }
    if (self->_dictionaryBacking)
    {
      deallocatorBlock[2]();
      deallocatorBlock = (void (**)(void))self->_deallocatorBlock;
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)FigFlatToNSDictionaryWrapper;
  -[FigFlatToNSDictionaryWrapper dealloc](&v6, sel_dealloc);
}

- (id)initLazilyWithFlatDictionaryBacking:(void *)a3 exportedKeySpec:(void *)a4 deallocatorBlock:(id)a5
{
  FigFlatToNSDictionaryWrapper *v5;
  FigFlatToNSDictionaryWrapper *v9;
  objc_super v11;

  v5 = 0;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        v11.receiver = self;
        v11.super_class = (Class)FigFlatToNSDictionaryWrapper;
        v9 = -[FigFlatToNSDictionaryWrapper init](&v11, sel_init);
        v5 = v9;
        if (v9)
        {
          v9->_dictionaryBacking = a3;
          v9->_exportedKeySpec = a4;
          v9->_deallocatorBlock = (id)objc_msgSend(a5, "copy");
          v5->_lazyInitializationMutex._os_unfair_lock_opaque = 0;
        }
      }
    }
  }
  return v5;
}

- (FigFlatToNSDictionaryWrapper)initWithFlatDictionary:(OpaqueFigFlatDictionary *)a3 keySpec:(OpaqueFigFlatDictionaryKeySpec *)a4
{
  FigFlatToNSDictionaryWrapper *v4;
  objc_super v8;

  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      v8.receiver = self;
      v8.super_class = (Class)FigFlatToNSDictionaryWrapper;
      v4 = -[FigFlatToNSDictionaryWrapper init](&v8, sel_init);
      if (v4)
      {
        v4->_flatDictionary = (OpaqueFigFlatDictionary *)CFRetain(a3);
        v4->_keySpec = (OpaqueFigFlatDictionaryKeySpec *)CFRetain(a4);
        v4->_keySpace = FigFlatDictionaryKeySpecGetKeySpace((uint64_t)a4);
        v4->_lazyInitializationMutex._os_unfair_lock_opaque = 0;
      }
    }
  }
  return v4;
}

- (FigFlatToNSDictionaryWrapper)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("*** FigFlatToNSDictionaryWrapper instances cannot be explicitly initialized by clients."), 0));
}

- (BOOL)_ensureFlatDictionaryIsInitialized
{
  uint64_t v2;
  const __CFAllocator *v3;
  uint64_t v4;
  _BOOL8 v5;

  if (!a1)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = FigFlatDictionaryKeySpecReconstructFromBinary((const __CFAllocator *)*MEMORY[0x1E0C9AE00], *(int **)(a1 + 40));
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 8) = FigFlatDictionaryCreateFromBacking((uint64_t)v3, v3, v4, *(_DWORD **)(a1 + 32));
    *(_DWORD *)(a1 + 24) = FigFlatDictionaryKeySpecGetKeySpace(*(_QWORD *)(a1 + 16));
    v2 = *(_QWORD *)(a1 + 8);
  }
  v5 = v2 != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  return v5;
}

- (unint64_t)count
{
  int8x8_t v3;

  if (-[FigFlatToNSDictionaryWrapper _ensureFlatDictionaryIsInitialized]((uint64_t)self))
    return FigFlatDictionaryGetCountOfKeysWithValues((uint64_t)self->_flatDictionary, v3);
  else
    return 0;
}

- (id)objectForKey:(id)a3
{
  id result;
  id v6;
  void *v7;
  double v8;
  char *v9;
  const __CFAllocator *v10;
  char *v11;
  CMTime time;
  CMTime v13;
  uint64_t v14;
  CGRect v15;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[FigFlatToNSDictionaryWrapper _ensureFlatDictionaryIsInitialized]((uint64_t)self))
    return 0;
  result = (id)objc_msgSend(a3, "cStringUsingEncoding:", objc_msgSend(a3, "fastestEncoding"));
  if (result)
  {
    result = (id)FigFlatDictionaryKeyLookupFromIdentifier(self->_keySpace, (uint64_t)result);
    if (result)
    {
      v6 = result;
      switch(FigFlatDictionaryKeyGetValueType((uint64_t)result))
      {
        case 1u:
          result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", FigFlatDictionaryGetBool((uint64_t)self->_flatDictionary, (uint64_t)v6, 0));
          break;
        case 2u:
          result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", FigFlatDictionaryGetInt16((uint64_t)self->_flatDictionary, (uint64_t)v6, 0));
          break;
        case 3u:
          result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigFlatDictionaryGetInt32((uint64_t)self->_flatDictionary, (uint64_t)v6, 0));
          break;
        case 4u:
          result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", FigFlatDictionaryGetInt64((uint64_t)self->_flatDictionary, (uint64_t)v6, 0));
          break;
        case 5u:
          v7 = (void *)MEMORY[0x1E0CB37E8];
          *(float *)&v8 = FigFlatDictionaryGetFloat32((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          result = (id)objc_msgSend(v7, "numberWithFloat:", v8);
          break;
        case 6u:
          result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", FigFlatDictionaryGetFloat64((uint64_t)self->_flatDictionary, (uint64_t)v6, 0));
          break;
        case 7u:
          LODWORD(v13.value) = 0;
          FigFlatDictionaryGetStringSize((uint64_t)self->_flatDictionary, (uint64_t)v6, &v13, 0);
          if ((LODWORD(v13.value) - 1024) <= 0xFFFFFC00)
            return 0;
          v9 = (char *)&time - ((LODWORD(v13.value) + 15) & 0x1FFFFFFF0);
          LODWORD(time.value) = v13.value;
          FigFlatDictionaryGetString((uint64_t)self->_flatDictionary, (uint64_t)v6, 0, v9, (unsigned int *)&time);
          result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
          break;
        case 8u:
          LODWORD(v13.value) = 0;
          FigFlatDictionaryGetDataSize((uint64_t)self->_flatDictionary, (uint64_t)v6, (int *)&v13, 0);
          if ((LODWORD(v13.value) - 1024) <= 0xFFFFFC00)
            return 0;
          v11 = (char *)&time - ((LODWORD(v13.value) + 15) & 0x1FFFFFFF0);
          LODWORD(time.value) = v13.value;
          FigFlatDictionaryGetData((uint64_t)self->_flatDictionary, (uint64_t)v6, 0, v11, (unsigned int *)&time);
          result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, LODWORD(time.value));
          break;
        case 9u:
          result = -[FigFlatToNSDictionaryWrapper arrayForFlatDictionaryArrayDataKey:]((uint64_t)self, (uint64_t)v6);
          break;
        case 0xAu:
          memset(&v13, 0, sizeof(v13));
          FigFlatDictionaryGetCMTime((uint64_t)self->_flatDictionary, (uint64_t)v6, 0, &v13);
          v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          time = v13;
          result = CMTimeCopyAsDictionary(&time, v10);
          break;
        case 0xBu:
          v15.origin.x = FigFlatDictionaryGetCGRect((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          result = CGRectCreateDictionaryRepresentation(v15);
          break;
        default:
          return 0;
      }
    }
  }
  return result;
}

- (void)arrayForFlatDictionaryArrayDataKey:(uint64_t)a1
{
  int ArrayDataType;
  void *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;
  unint64_t v9;
  __int16 *v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  double *v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int *v26;
  double v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  CMTime *v31;
  const __CFAllocator *v32;
  uint64_t v33;
  CMTime time;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  ArrayDataType = FigFlatDictionaryGetArrayDataType(*(_QWORD *)(a1 + 8), a2);
  v36 = 0;
  FigFlatDictionaryGetDataSize(*(_QWORD *)(a1 + 8), a2, (int *)&v36, 0);
  v5 = 0;
  switch(ArrayDataType)
  {
    case 1:
      v6 = v36;
      if ((int)v36 < 1)
        goto LABEL_38;
      v7 = (unsigned __int8 *)&time - ((v36 + 15) & 0x1FFFFFFF0);
      FigFlatDictionaryGetData(*(_QWORD *)(a1 + 8), a2, 0, v7, &v36);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      do
      {
        v8 = *v7++;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8));
        --v6;
      }
      while (v6);
      break;
    case 2:
      if (v36 < 2)
        goto LABEL_38;
      v9 = (unint64_t)v36 >> 1;
      v10 = (__int16 *)((char *)&time - ((2 * v9 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(_QWORD *)(a1 + 8), a2, 0, v10, &v36);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (v9 <= 1)
        v11 = 1;
      else
        v11 = v9;
      do
      {
        v12 = *v10++;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v12));
        --v11;
      }
      while (v11);
      break;
    case 3:
      if (v36 < 4)
        goto LABEL_38;
      v17 = (unint64_t)v36 >> 2;
      v18 = (unsigned int *)((char *)&time - ((4 * v17 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(_QWORD *)(a1 + 8), a2, 0, v18, &v36);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (v17 <= 1)
        v19 = 1;
      else
        v19 = v17;
      do
      {
        v20 = *v18++;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20));
        --v19;
      }
      while (v19);
      break;
    case 4:
      if (v36 < 8)
        goto LABEL_38;
      v21 = (unint64_t)v36 >> 3;
      v22 = (CMTimeValue *)((char *)&time.value - ((8 * v21 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(_QWORD *)(a1 + 8), a2, 0, v22, &v36);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (v21 <= 1)
        v23 = 1;
      else
        v23 = v21;
      do
      {
        v24 = *v22++;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24));
        --v23;
      }
      while (v23);
      break;
    case 5:
      if (v36 < 4)
        goto LABEL_38;
      v25 = (unint64_t)v36 >> 2;
      v26 = (int *)((char *)&time - ((4 * v25 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(_QWORD *)(a1 + 8), a2, 0, v26, &v36);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (v25 <= 1)
        v28 = 1;
      else
        v28 = v25;
      do
      {
        v29 = *v26++;
        LODWORD(v27) = v29;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27));
        --v28;
      }
      while (v28);
      break;
    case 6:
      if (v36 < 8)
        goto LABEL_38;
      v13 = (unint64_t)v36 >> 3;
      v14 = (double *)((char *)&time.value - ((8 * v13 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(_QWORD *)(a1 + 8), a2, 0, v14, &v36);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (v13 <= 1)
        v15 = 1;
      else
        v15 = v13;
      do
      {
        v16 = *v14++;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16));
        --v15;
      }
      while (v15);
      break;
    case 10:
      if (v36 >= 0x18)
      {
        v30 = v36 / 0x18;
        v31 = (CMTime *)((char *)&time - ((24 * (v36 / 0x18) + 15) & 0x3FFFFFFF0));
        FigFlatDictionaryGetData(*(_QWORD *)(a1 + 8), a2, 0, v31, &v36);
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v32 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        if (v30 <= 1)
          v33 = 1;
        else
          v33 = v30;
        do
        {
          time = *v31;
          objc_msgSend(v5, "addObject:", CMTimeCopyAsDictionary(&time, v32));
          ++v31;
          --v33;
        }
        while (v33);
      }
      else
      {
LABEL_38:
        v5 = (void *)MEMORY[0x1E0C9AA60];
      }
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)keyEnumerator
{
  if (!-[FigFlatToNSDictionaryWrapper _ensureFlatDictionaryIsInitialized]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return -[FigFlatToNSDictionaryWrapperKeyEnumerator initWithFlatDictionary:]([FigFlatToNSDictionaryWrapperKeyEnumerator alloc], "initWithFlatDictionary:", self->_flatDictionary);
}

@end
