@implementation FigRemote

pthread_mutex_t *__FigRemote_LookUpServerTimeoutPort_block_invoke()
{
  pthread_mutex_t *result;

  result = FigSimpleMutexCreate();
  qword_1ECDA8A38 = (uint64_t)result;
  return result;
}

dispatch_queue_t __FigRemote_InterpretMachErrorForTimeout_block_invoke()
{
  int AppIntegerValue;
  int v1;
  dispatch_queue_t result;
  Boolean keyExistsAndHasValidFormat;

  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigRPCTimeoutServerTrace[1], CFSTR("rpctimeoutserver_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 0, 0, gFigRPCTimeoutServerTrace);
  fig_note_initialize_category_with_default_work_cf((uint64_t)algn_1ECDA8498, CFSTR("rpctimeoutserver_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 0, 0, &qword_1ECDA8490);
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("rpc_timeout"), CFSTR("com.apple.coremedia"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v1 = 1000 * AppIntegerValue;
    if (!AppIntegerValue)
      v1 = 0x7FFFFFFF;
    sTimeoutValueFromPreference = v1;
  }
  result = dispatch_queue_create("RPCTimeoutKillingQueue", 0);
  sServerKillingQueue = (uint64_t)result;
  return result;
}

uint64_t __FigRemote_InterpretMachErrorForTimeout_block_invoke_2(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  BOOL v3;

  if (sMessageSentSuccessfully)
  {
    v1 = result;
    FigRemote_LookUpServerTimeoutPort();
    gFigRemoteCommonTimeout = 0x7FFFFFFF;
    if (*(_QWORD *)(v1 + 32))
      v2 = 1;
    else
      v2 = sSuccessfulMessageServerToken == 0;
    if (v2
      || ((result = FigRemote_HandleServerTimeout_WithExtraInfo(sSuccessfulMessageServerToken, *(_QWORD *)(v1 + 40), *(const __CFString **)(v1 + 48)), (_DWORD)result)? (v3 = (_DWORD)result == -16521): (v3 = 1), v3))
    {
      result = FigRemote_HandleServerTimeout_WithExtraInfo(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(const __CFString **)(v1 + 48));
    }
    sSuccessfulMessageServerToken = 0;
    sMessageSentSuccessfully = 0;
  }
  return result;
}

uint64_t __FigRemote_CreateSerializedAtomDataBlockBufferForFormatDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  const opaqueCMFormatDescription *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8[2];
  __int128 v9;
  __int128 v10;
  int v11;

  v5 = *(const opaqueCMFormatDescription **)(a1 + 32);
  v11 = 0;
  v10 = 0u;
  v9 = 0u;
  v8[0] = a2;
  v8[1] = a3;
  result = FigNEAtomWriterBeginAtom((uint64_t)v8, 1717859171);
  if (!(_DWORD)result)
  {
    result = (uint64_t)sbufAtom_appendFormatDescriptionAtomGuts(v5, v8);
    if (!(_DWORD)result)
    {
      result = FigNEAtomWriterEndAtom((uint64_t)v8);
      if (a4)
      {
        if (!(_DWORD)result)
        {
          v7 = *((_QWORD *)&v10 + 1);
          if (*((_QWORD *)&v10 + 1) == 8)
            v7 = 0;
          *a4 = v7;
        }
      }
    }
  }
  return result;
}

uint64_t __FigRemote_CreateSerializedAtomDataBlockBufferForPixelBuffer_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sbufAtom_createSerializedDataForPixelBuffer(*(void **)(a1 + 32), 0, 0, a2, a3, a4);
}

uint64_t __FigRemote_CreateSerializedAtomDataBlockBufferForKeyValuePair_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  const __CFString *v5;
  __CFString *v6;
  uint64_t result;
  uint64_t v10;
  uint64_t v11[2];
  __int128 v12;
  __int128 v13;
  int v14;

  v5 = *(const __CFString **)(a1 + 32);
  v6 = *(__CFString **)(a1 + 40);
  v14 = 0;
  v13 = 0u;
  v12 = 0u;
  v11[0] = a2;
  v11[1] = a3;
  result = sbufAtom_appendKeyValuePairAtom(v5, 0, v6, v11);
  if ((_DWORD)result != -12572 && a4 != 0 && (_DWORD)result == 0)
  {
    v10 = *((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1) == 8)
      v10 = 0;
    *a4 = v10;
  }
  return result;
}

CFIndex __FigRemote_CreateSerializedAtomDataBlockBufferForCFType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  __CFString *v5;
  CFIndex result;
  uint64_t v9;
  uint64_t v10[2];
  __int128 v11;
  __int128 v12;
  int v13;

  v5 = *(__CFString **)(a1 + 32);
  v13 = 0;
  v12 = 0u;
  v11 = 0u;
  v10[0] = a2;
  v10[1] = a3;
  result = sbufAtom_appendCFTypeAtom(v5, 0, v10);
  if ((_DWORD)result != -12572 && a4 != 0 && (_DWORD)result == 0)
  {
    v9 = *((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1) == 8)
      v9 = 0;
    *a4 = v9;
  }
  return result;
}

CFIndex __FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForCFType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sbufAtom_createSerializedDataWithFlagsForCFType(*(__CFString **)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3, a4);
}

void __FigRemote_GetKnownNeroKeysForLightningAdapters_block_invoke()
{
  CFIndex Count;
  CFIndex v1;
  CFIndex v2;
  const void *ValueAtIndex;
  BOOL v4;

  FigRemote_GetKnownNeroKeysForLightningAdapters_neroKeys = (uint64_t)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
  if (sKnownSBufKeysArray)
  {
    Count = CFArrayGetCount((CFArrayRef)sKnownSBufKeysArray);
    v1 = Count - 1;
    if (Count >= 1)
    {
      v2 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)sKnownSBufKeysArray, v2);
        CFSetAddValue((CFMutableSetRef)FigRemote_GetKnownNeroKeysForLightningAdapters_neroKeys, ValueAtIndex);
        if (CFEqual(ValueAtIndex, CFSTR("hvcC")))
          v4 = 1;
        else
          v4 = v1 == v2;
        ++v2;
      }
      while (!v4);
    }
  }
  CFSetAddValue((CFMutableSetRef)FigRemote_GetKnownNeroKeysForLightningAdapters_neroKeys, CFSTR("TransportStreamEncryptionInitData"));
}

@end
