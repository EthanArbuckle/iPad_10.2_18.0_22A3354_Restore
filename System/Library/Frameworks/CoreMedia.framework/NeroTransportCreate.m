@implementation NeroTransportCreate

void __NeroTransportCreate_block_invoke(uint64_t a1, int a2, CMBlockBufferRef theBuffer)
{
  uint64_t v5;
  size_t DataLength;
  size_t v7;
  char *v8;
  int v9;
  const void *v10;
  unsigned int v11;
  size_t v12;
  unsigned int *v13;
  unsigned int *v14;
  CMBlockBufferRef v15;
  uint64_t v16;
  const void *v17;
  pthread_mutex_t *v18;
  CFTypeRef v19;
  uint64_t v20;
  const void *v21;
  int v22;
  unint64_t v23;
  size_t v24;
  _QWORD *Value;
  _QWORD *v26;
  CMBlockBufferRef v27;
  NSObject *v28;
  size_t v29;
  int v30;
  CMBlockBufferRef v31;
  _QWORD *v32;
  CFTypeRef v33;
  unsigned int v34;
  NSObject *v35;
  int v36;
  CMBlockBufferRef v37;
  char *v38;
  uint64_t context;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  const void *v44;
  _QWORD *v45;
  CMBlockBufferRef v46;
  unint64_t v47;
  int v48;
  int v49;
  CMBlockBufferRef blockBufferOut;

  switch(a2)
  {
    case 2:
      FigSimpleMutexLock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 24));
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(const void **)(v16 + 88);
      if (v17)
      {
        CFRelease(v17);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
        v16 = *(_QWORD *)(a1 + 32);
      }
      *(_BYTE *)(v16 + 72) = 0;
      context = 1684628836;
      v40 = v16;
      v41 = 0;
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v16 + 32), (CFDictionaryApplierFunction)ft_callAsyncHandlerForObjectRecordApplier, &context);
      FigSimpleMutexUnlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 24));
      FigSimpleMutexLock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 48));
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 56), (CFDictionaryApplierFunction)ft_signalReplySemaphoreApplier, *(void **)(a1 + 32));
      v18 = *(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 48);
      goto LABEL_26;
    case 1:
      FigSimpleMutexLock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 24));
      if (theBuffer)
        v19 = CFRetain(theBuffer);
      else
        v19 = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v19;
      v20 = *(_QWORD *)(a1 + 32);
      *(_BYTE *)(v20 + 72) = 1;
      context = 1651470958;
      v40 = v20;
      v41 = (void (*)(uint64_t))theBuffer;
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v20 + 32), (CFDictionaryApplierFunction)ft_callAsyncHandlerForObjectRecordApplier, &context);
      v18 = *(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 24);
LABEL_26:
      FigSimpleMutexUnlock(v18);
      return;
    case 0:
      v5 = *(_QWORD *)(a1 + 32);
      v38 = 0;
      if (CMBlockBufferGetDataLength(theBuffer) >= 8)
      {
        DataLength = CMBlockBufferGetDataLength(theBuffer);
        if (CMBlockBufferIsRangeContiguous(theBuffer, 0, DataLength))
        {
          if (!CMBlockBufferGetDataPointer(theBuffer, 0, 0, 0, &v38))
          {
            v7 = CMBlockBufferGetDataLength(theBuffer);
            v8 = v38;
            if (v7 == *(_DWORD *)v38)
            {
              v9 = *((_DWORD *)v38 + 1);
              if (v9 == 1937337955)
              {
                if (*((_QWORD *)v38 + 1) == 1)
                  v21 = 0;
                else
                  v21 = (const void *)*((_QWORD *)v38 + 1);
                v22 = *((_DWORD *)v38 + 4);
                v23 = *(_QWORD *)(v38 + 20);
                blockBufferOut = 0;
                v24 = CMBlockBufferGetDataLength(theBuffer);
                FigSimpleMutexLock(*(pthread_mutex_t **)(v5 + 24));
                Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v5 + 32), v21);
                if (Value)
                {
                  v26 = Value;
                  if (Value[3])
                  {
                    if (v24 == 28
                      || !CMBlockBufferCreateWithBufferReference((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theBuffer, 0x1CuLL, v24 - 28, 0, &blockBufferOut))
                    {
                      CFRetain((CFTypeRef)v5);
                      if (blockBufferOut)
                      {
                        CFRetain(blockBufferOut);
                        v27 = blockBufferOut;
                      }
                      else
                      {
                        v27 = 0;
                      }
                      v36 = *(_DWORD *)v26;
                      v35 = v26[1];
                      context = MEMORY[0x1E0C809B0];
                      v40 = 0x40000000;
                      v41 = __ft_didReceiveSyncPackage_block_invoke;
                      v42 = &__block_descriptor_tmp_20_1;
                      v43 = v5;
                      v44 = v21;
                      v48 = v36;
                      v49 = v22;
                      v45 = v26;
                      v46 = v27;
                      v47 = v23;
                      goto LABEL_47;
                    }
                  }
                }
LABEL_48:
                FigSimpleMutexUnlock(*(pthread_mutex_t **)(v5 + 24));
                v37 = blockBufferOut;
                if (!blockBufferOut)
                  return;
LABEL_53:
                CFRelease(v37);
                return;
              }
              if (v9 != 1919970425)
              {
                if (v9 != 1634957678)
                  return;
                if (*((_QWORD *)v38 + 1) == 1)
                  v10 = 0;
                else
                  v10 = (const void *)*((_QWORD *)v38 + 1);
                v11 = *((_DWORD *)v38 + 4);
                blockBufferOut = 0;
                v12 = CMBlockBufferGetDataLength(theBuffer);
                FigSimpleMutexLock(*(pthread_mutex_t **)(v5 + 24));
                v13 = (unsigned int *)CFDictionaryGetValue(*(CFDictionaryRef *)(v5 + 32), v10);
                if (v13)
                {
                  v14 = v13;
                  if (v12 == 20
                    || !CMBlockBufferCreateWithBufferReference((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theBuffer, 0x14uLL, v12 - 20, 0, &blockBufferOut))
                  {
                    CFRetain((CFTypeRef)v5);
                    if (blockBufferOut)
                    {
                      CFRetain(blockBufferOut);
                      v15 = blockBufferOut;
                    }
                    else
                    {
                      v15 = 0;
                    }
                    v34 = *v14;
                    v35 = *((_QWORD *)v14 + 1);
                    context = MEMORY[0x1E0C809B0];
                    v40 = 0x40000000;
                    v41 = __ft_didReceiveAsyncPackage_block_invoke;
                    v42 = &__block_descriptor_tmp_18_0;
                    v43 = v5;
                    v44 = v10;
                    v47 = __PAIR64__(v11, v34);
                    v45 = v14;
                    v46 = v15;
LABEL_47:
                    dispatch_async(v35, &context);
                    goto LABEL_48;
                  }
                }
                goto LABEL_48;
              }
              v28 = *((_QWORD *)v38 + 1);
              context = 0;
              v29 = CMBlockBufferGetDataLength(theBuffer);
              blockBufferOut = 0;
              if (v29 == 20
                || !CMBlockBufferCreateWithBufferReference((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theBuffer, 0x14uLL, v29 - 20, 0, (CMBlockBufferRef *)&context))
              {
                FigSimpleMutexLock(*(pthread_mutex_t **)(v5 + 48));
                if (!CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(v5 + 56), v28, (const void **)&blockBufferOut)
                  || blockBufferOut)
                {
                  FigSimpleMutexUnlock(*(pthread_mutex_t **)(v5 + 48));
                }
                else
                {
                  v30 = *((_DWORD *)v8 + 4);
                  v31 = (CMBlockBufferRef)context;
                  v32 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
                  *(_DWORD *)v32 = v30;
                  if (v31)
                    v33 = CFRetain(v31);
                  else
                    v33 = 0;
                  v32[1] = v33;
                  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 56), v28, v32);
                  FigSimpleMutexUnlock(*(pthread_mutex_t **)(v5 + 48));
                  dispatch_semaphore_signal(v28);
                }
              }
              v37 = (CMBlockBufferRef)context;
              if (context)
                goto LABEL_53;
            }
          }
        }
      }
      break;
  }
}

@end
