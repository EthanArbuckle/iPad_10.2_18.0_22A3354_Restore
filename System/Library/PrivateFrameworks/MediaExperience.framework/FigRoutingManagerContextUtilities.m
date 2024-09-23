@implementation FigRoutingManagerContextUtilities

void __FigRoutingManagerContextUtilities_CopyRoutingContextUUID_block_invoke(uint64_t a1)
{
  int64_t Count;
  const void **v3;
  const void **v4;
  uint64_t v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  const void *v8;
  const void *v9;
  const void *v10;
  CFTypeRef v11;

  Count = FigCFDictionaryGetCount();
  v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (!v3)
    goto LABEL_10;
  v4 = v3;
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), 0, v3);
  if (Count < 1)
  {
LABEL_9:
    free(v4);
    goto LABEL_10;
  }
  v5 = 0;
  while (1)
  {
    v6 = (const __CFData *)v4[v5];
    if (v6)
      break;
LABEL_8:
    if (Count == ++v5)
      goto LABEL_9;
  }
  BytePtr = CFDataGetBytePtr(v6);
  v8 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  v9 = v8;
  if (*(const void **)(a1 + 40) != v8)
  {
    if (v8)
      CFRelease(v8);
    goto LABEL_8;
  }
  v10 = (const void *)*((_QWORD *)BytePtr + 1);
  if (v10)
  {
    v11 = CFRetain(v10);
    if (v9)
      goto LABEL_13;
  }
  else
  {
    v11 = 0;
    if (v9)
LABEL_13:
      CFRelease(v9);
  }
  free(v4);
  if (!v11)
  {
LABEL_10:
    **(_QWORD **)(a1 + 48) = 0;
    return;
  }
  **(_QWORD **)(a1 + 48) = CFRetain(v11);
  CFRelease(v11);
}

void __FigRoutingManagerContextUtilities_CopyActivatedEndpoints_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const __CFArray *v4;
  CFIndex Count;
  __CFArray *Mutable;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const void *Value;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 15);
    if (v4)
    {
      Count = CFArrayGetCount(v4);
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      if (Count >= 1)
      {
        for (i = 0; i != Count; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), i);
          Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_Endpoint"));
          if (Value)
            CFArrayAppendValue(Mutable, Value);
        }
      }
      if (Mutable)
        goto LABEL_9;
    }
    else
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
LABEL_9:
        **(_QWORD **)(a1 + 56) = CFRetain(Mutable);
        CFRelease(Mutable);
        return;
      }
    }
    **(_QWORD **)(a1 + 56) = 0;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

_DWORD *__FigRoutingManagerContextUtilities_IsContextVideoAndIndependent_block_invoke(uint64_t a1)
{
  _DWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*result == 5)
    {
      result = _routingContextUtilities_getLeaderWeakRef((uint64_t)result);
      if (!result)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_GetContextType_block_invoke(uint64_t a1)
{
  const UInt8 *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)result;
  else
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  return result;
}

void __FigRoutingManagerContextUtilities_CopyPickedEndpoints_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
    _routingContextUtilities_copyPickedEndpoints((uint64_t)ContextForUUIDFromDict, *(_QWORD **)(a1 + 56));
  else
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
}

void __FigRoutingManagerContextUtilities_CopyPickedEndpointAtIndex_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
    _routingContextUtilities_copyPickedEndpointAtIndex((uint64_t)ContextForUUIDFromDict, *(_QWORD *)(a1 + 56), *(_QWORD **)(a1 + 64));
  else
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemAudioContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 528);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

int *__FigRoutingManagerContextUtilities_GetContextString_block_invoke(uint64_t a1)
{
  int *result;

  result = (int *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (int *)routingContextUtilities_getFeatureString(*result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyEndpointsToDeactivateInfoAndUUIDsForPID_block_invoke(uint64_t a1)
{
  int64_t Count;
  const void **v3;
  const void **v4;
  CFDataRef *v5;
  const UInt8 *BytePtr;
  const UInt8 *v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  const void *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  __CFArray *v15;
  const void *ValueAtIndex;

  Count = FigCFDictionaryGetCount();
  v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (v3)
  {
    v4 = v3;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), 0, v3);
    if (Count >= 1)
    {
      v5 = (CFDataRef *)v4;
      do
      {
        if (*v5)
        {
          BytePtr = CFDataGetBytePtr(*v5);
          v7 = BytePtr;
          if (*(_DWORD *)BytePtr == 5)
          {
            if (*(_DWORD *)(a1 + 56) == 1)
              goto LABEL_14;
          }
          else if (*(_DWORD *)BytePtr == 6)
          {
            v8 = *(_DWORD *)(a1 + 56);
            v9 = v8 > 4;
            v10 = (1 << v8) & 0x16;
            if (!v9 && v10 != 0)
            {
LABEL_14:
              if (*((_DWORD *)BytePtr + 8) == *(_DWORD *)(a1 + 60))
              {
                v12 = (const void *)*((_QWORD *)BytePtr + 15);
                if (v12)
                {
                  v13 = (const __CFArray *)CFRetain(v12);
                  if (v13)
                  {
                    v14 = v13;
                    if (CFArrayGetCount(v13) >= 1)
                    {
                      v15 = *(__CFArray **)(a1 + 40);
                      ValueAtIndex = CFArrayGetValueAtIndex(v14, 0);
                      CFArrayAppendValue(v15, ValueAtIndex);
                      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), *((const void **)v7 + 1));
                    }
                    CFRelease(v14);
                  }
                }
              }
            }
          }
        }
        ++v5;
        --Count;
      }
      while (Count);
    }
    free(v4);
  }
}

_DWORD *__FigRoutingManagerContextUtilities_IsContextSystemMusicAndIndependent_block_invoke(uint64_t a1)
{
  _DWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*result == 3)
    {
      result = _routingContextUtilities_getLeaderWeakRef((uint64_t)result);
      if (!result)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpoints_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  CFTypeRef *v4;
  __CFArray *Mutable;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const void *Value;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = *(CFTypeRef **)(a1 + 56);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v6 = (const __CFArray *)*((_QWORD *)v3 + 14);
    if (v6)
    {
      Count = CFArrayGetCount(v6);
      if (Count >= 1)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 14), i);
          Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_Endpoint"));
          if (Value)
            CFArrayAppendValue(Mutable, Value);
        }
      }
    }
    if (Mutable)
    {
      *v4 = CFRetain(Mutable);
      CFRelease(Mutable);
    }
    else
    {
      *v4 = 0;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

void __FigRoutingManagerContextUtilities_CopyCachedSelectedRouteDescriptors_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  uint64_t v3;
  const __CFData *v4;
  const __CFData *v5;
  const UInt8 *BytePtr;
  CFTypeRef v7;
  CFTypeRef v8;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = (uint64_t)ContextForUUIDFromDict;
    if (_routingContextUtilities_getLeaderWeakRef((uint64_t)ContextForUUIDFromDict))
    {
      _routingContextUtilities_getLeaderWeakRef(v3);
      v4 = (const __CFData *)FigCFWeakReferenceHolderCopyReferencedObject();
      if (v4)
      {
        v5 = v4;
        BytePtr = CFDataGetBytePtr(v4);
        if (BytePtr)
        {
          v7 = (CFTypeRef)*((_QWORD *)BytePtr + 16);
          if (v7)
            v7 = CFRetain(v7);
          **(_QWORD **)(a1 + 56) = v7;
        }
        CFRelease(v5);
      }
    }
    else
    {
      v8 = *(CFTypeRef *)(v3 + 128);
      if (v8)
        v8 = CFRetain(v8);
      **(_QWORD **)(a1 + 56) = v8;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

uint64_t __FigRoutingManagerContextUtilities_CopyRoutingContextForContextUUID_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (uint64_t)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (result)
  {
    result = FigCFWeakReferenceHolderCopyReferencedObject();
    **(_QWORD **)(a1 + 48) = result;
  }
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemMirroringContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 536);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemMusicContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 544);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

void __FigRoutingManagerContextUtilities_CopySystemRoutingContext_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  CFDictionaryRef *v4;
  const void **v5;
  int v6;

  v2 = *(unsigned int *)(a1 + 48);
  v3 = *(uint64_t **)(a1 + 40);
  if (routingContextUtilities_getSharedContextUtilities_sContextUtilitiesStateSetupOnce != -1)
    dispatch_once(&routingContextUtilities_getSharedContextUtilities_sContextUtilitiesStateSetupOnce, &__block_literal_global_2);
  if (byte_1EE2B2EB0)
    v4 = (CFDictionaryRef *)&routingContextUtilities_getSharedContextUtilities_contextState;
  else
    v4 = 0;
  v5 = (const void **)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(v4[4 * v2 + 1], 0, v5);
  if (_routingContextUtilities_getContextFromWeakRef((uint64_t)*v5))
  {
    v6 = 0;
    *v3 = FigCFWeakReferenceHolderCopyReferencedObject();
  }
  else
  {
    v6 = -17420;
  }
  free(v5);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
}

void __FigRoutingManagerContextUtilities_CopyPickedIndividualEndpoints_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  uint64_t v6;
  const __CFAllocator *v7;
  const void *ValueAtIndex;
  uint64_t CMBaseObject;
  void (*v10)(uint64_t, uint64_t, const __CFAllocator *, CFArrayRef *);
  __CFArray *MutableCopy;
  CFTypeRef v12;
  const void *v13;
  __CFArray *v14;
  const __CFArray *v15;
  CFIndex FirstIndexOfValue;
  uint64_t v17;
  const void *v18;
  void *v19;
  const UInt8 *ContextForUUIDFromDict;
  const void *v21;
  CFIndex idx;
  const void *v23;
  CFArrayRef theArray;
  CFRange v25;
  CFRange v26;

  v2 = *(const __CFArray **)(a1 + 32);
  if (v2)
  {
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v4 = Count;
      v5 = 0;
      v6 = *MEMORY[0x1E0CA43D0];
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v5);
        if (ValueAtIndex && (FigEndpointAggregateGetClassID(), CMBaseObjectIsMemberOfClass()))
        {
          theArray = 0;
          CMBaseObject = FigEndpointGetCMBaseObject();
          v10 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                             + 48);
          if (v10)
            v10(CMBaseObject, v6, v7, &theArray);
          if (theArray)
          {
            MutableCopy = CFArrayCreateMutableCopy(v7, 0, theArray);
            if (theArray)
            {
              if (FigRoutingManagerIsEndpointOfSubtype((uint64_t)ValueAtIndex))
              {
                v12 = FigRoutingManagerCopyLocalAirPlayEndpoint();
                if (v12)
                {
                  v13 = v12;
                  if (!FigRoutingManagerIsClusterLocalEndpoint((uint64_t)v12))
                  {
                    v15 = theArray;
                    v25.length = CFArrayGetCount(theArray);
                    v25.location = 0;
                    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v15, v25, v13);
                    if (FirstIndexOfValue != -1)
                    {
                      idx = FirstIndexOfValue;
                      v17 = *(_QWORD *)(a1 + 40);
                      v18 = *(const void **)(v17 + 528);
                      if (v18)
                      {
                        v19 = (void *)CFRetain(v18);
                        v17 = *(_QWORD *)(a1 + 40);
                      }
                      else
                      {
                        v19 = 0;
                      }
                      v23 = 0;
                      ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(v17 + 480), v19);
                      _routingContextUtilities_copyPickedEndpointAtIndex((uint64_t)ContextForUUIDFromDict, 0, &v23);
                      v21 = v23;
                      if (v23)
                      {
                        if (FigRoutingManagerIsEndpointWHAGroupable((uint64_t)v23))
                          CFArraySetValueAtIndex(MutableCopy, idx, v21);
                        CFRelease(v21);
                      }
                      if (v19)
                        CFRelease(v19);
                    }
                  }
                  CFRelease(v13);
                }
              }
              v14 = *(__CFArray **)(a1 + 48);
              v26.length = CFArrayGetCount(theArray);
              v26.location = 0;
              CFArrayAppendArray(v14, MutableCopy, v26);
              if (theArray)
              {
                CFRelease(theArray);
                theArray = 0;
              }
            }
            if (MutableCopy)
              CFRelease(MutableCopy);
          }
        }
        else
        {
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), ValueAtIndex);
        }
        ++v5;
      }
      while (v4 != v5);
    }
  }
}

void __FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  _routingContextUtilities_postNotificationToContextAndItsFollowers(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const void **)(a1 + 56), *(const void **)(a1 + 64));
}

_QWORD *__FigRoutingManagerContextUtilities_Create_block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[5] + 488) = result[6];
  *(_QWORD *)(result[5] + 496) = result[4];
  return result;
}

void __FigRoutingManagerContextUtilities_AddContext_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  const __CFUUID *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const CFArrayCallBacks *v5;
  _QWORD *v6;
  const void *v7;
  CFTypeRef v8;
  CFTypeRef v9;
  CFTypeRef v10;
  __CFArray *v11;
  CFTypeRef v12;
  CFTypeRef v13;
  CFTypeRef v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef v17;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (dword_1EE2B3E28)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  FigCFDictionaryGetInt32IfPresent();
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = CFRetain(*(CFTypeRef *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16) = CFUUIDCreateString(v2, v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 48) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  **(_DWORD **)(a1 + 56) = *(_DWORD *)(a1 + 88);
  FigCFDictionaryGetBooleanIfPresent();
  v5 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 88) = CFArrayCreateMutable(v2, 0, MEMORY[0x1E0C9B378]);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 80) = CFArrayCreateMutable(v2, 0, v5);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 120) = CFArrayCreateMutable(v2, 0, v5);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 112) = CFArrayCreateMutable(v2, 0, v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 56) + 136) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 128) = CFArrayCreateMutable(v2, 0, v5);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 160) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 168) = 0;
  v6 = *(_QWORD **)(a1 + 56);
  v6[25] = 0;
  v6[22] = 0;
  v6[23] = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 192) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 208) = CFArrayCreateMutable(v2, 0, v5);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 64) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 64) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 56) + 152) = -1082130432;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 144) = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v7 = (const void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 80) + 32 * *(unsigned int *)(a1 + 88) + 8), *(const void **)(a1 + 32), v7);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 80) + 480), *(const void **)(a1 + 32), *(const void **)(a1 + 72));
  switch(*(_DWORD *)(a1 + 88))
  {
    case 1:
      v8 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v8)
        v8 = CFRetain(v8);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 528) = v8;
      if (v7)
        goto LABEL_43;
      goto LABEL_44;
    case 2:
      v9 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v9)
        v9 = CFRetain(v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 536) = v9;
      if (v7)
        goto LABEL_43;
      goto LABEL_44;
    case 3:
      v10 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v10)
        v10 = CFRetain(v10);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 544) = v10;
      if (v7)
        goto LABEL_43;
      goto LABEL_44;
    case 4:
      v11 = *(__CFArray **)(*(_QWORD *)(a1 + 80) + 616);
      if (v11)
        goto LABEL_21;
      goto LABEL_42;
    case 5:
      v11 = *(__CFArray **)(*(_QWORD *)(a1 + 80) + 608);
      if (!v11)
        goto LABEL_42;
      goto LABEL_21;
    case 6:
      v11 = *(__CFArray **)(*(_QWORD *)(a1 + 80) + 600);
      if (!v11)
        goto LABEL_42;
LABEL_21:
      CFArrayAppendValue(v11, *(const void **)(*(_QWORD *)(a1 + 56) + 8));
      if (!v7)
        goto LABEL_44;
      goto LABEL_43;
    case 9:
      v12 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v12)
        v12 = CFRetain(v12);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 560) = v12;
      if (!v7)
        goto LABEL_44;
      goto LABEL_43;
    case 0xA:
      v13 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v13)
        v13 = CFRetain(v13);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 576) = v13;
      if (!v7)
        goto LABEL_44;
      goto LABEL_43;
    case 0xB:
      v14 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v14)
        v14 = CFRetain(v14);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 568) = v14;
      if (!v7)
        goto LABEL_44;
      goto LABEL_43;
    case 0xC:
      v15 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v15)
        v15 = CFRetain(v15);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 552) = v15;
      if (!v7)
        goto LABEL_44;
      goto LABEL_43;
    case 0xD:
      v16 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v16)
        v16 = CFRetain(v16);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 584) = v16;
      goto LABEL_42;
    case 0xE:
      v17 = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 8);
      if (v17)
        v17 = CFRetain(v17);
      *(_QWORD *)(*(_QWORD *)(a1 + 80) + 592) = v17;
      if (!v7)
        goto LABEL_44;
      goto LABEL_43;
    default:
LABEL_42:
      if (v7)
LABEL_43:
        CFRelease(v7);
LABEL_44:
      if (v3)
        CFRelease(v3);
      return;
  }
}

void __FigRoutingManagerContextUtilities_ResetCurrentlyActivatingEndpointInfo_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  uint64_t v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v9;
  const __CFDictionary *Value;
  const void *v11;
  const void *v12;
  CFMutableDictionaryRef Mutable;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = (uint64_t)ContextForUUIDFromDict;
    v4 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 14);
    if (v4 && (Count = CFArrayGetCount(v4), Count >= 1))
    {
      v6 = Count;
      v7 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 112), v7);
        if (CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_Endpoint")) == *(const void **)(a1 + 56))
          break;
        if (v6 == ++v7)
          goto LABEL_7;
      }
      Value = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_ClientRouteChangeOptions"));
      v9 = Value;
      if (Value)
      {
        v11 = CFDictionaryGetValue(Value, CFSTR("clientRouteRequestID"));
        if (v11)
          v11 = CFRetain(v11);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
        v12 = CFDictionaryGetValue(v9, CFSTR("initiator"));
        if (v12)
          v9 = (const __CFDictionary *)CFRetain(v12);
        else
          v9 = 0;
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v3 + 112), v7);
    }
    else
    {
LABEL_7:
      v9 = 0;
    }
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    _routingContextUtilities_postNotificationToContextAndItsFollowers(v3, CFSTR("routeConfigUpdated"), Mutable);
    *(_BYTE *)(v3 + 136) = 1;
    if (Mutable)
      CFRelease(Mutable);
    if (v9)
      CFRelease(v9);
  }
}

void __FigRoutingManagerContextUtilities_ResetCurrentlyActivatingSubEndpointsInfo_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *Value;
  const __CFArray *v10;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  int v14;
  void *v15;
  const __CFDictionary *v16;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  v3 = ContextForUUIDFromDict;
  v4 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 14);
  if (v4)
  {
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v6 = Count;
      v7 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 14), v7);
        if (CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_Endpoint")) == *(const void **)(a1 + 56))
          break;
        if (v6 == ++v7)
          return;
      }
      Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_SubEndpoints"));
      if (!Value)
      {
        v14 = 0;
LABEL_22:
        CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v3 + 14), v7);
LABEL_23:
        if (v14)
          *((_BYTE *)v3 + 136) = 1;
        return;
      }
      v10 = Value;
      v11 = CFArrayGetCount(Value);
      if (v11 >= 1)
      {
        v12 = v11;
        v13 = 0;
        while (CFArrayGetValueAtIndex(v10, v13) != *(const void **)(a1 + 64))
        {
          if (v12 == ++v13)
            goto LABEL_15;
        }
        CFArrayRemoveValueAtIndex(v10, v13);
        if (*(_BYTE *)(a1 + 88) || *(_BYTE *)(a1 + 89))
        {
          v15 = *(void **)(a1 + 48);
          v16 = *(const __CFDictionary **)(a1 + 72);
LABEL_20:
          _routingContextUtilities_postRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(v15, v16);
          v14 = 1;
LABEL_21:
          if (CFArrayGetCount(v10))
            goto LABEL_23;
          goto LABEL_22;
        }
        if (!FigCFEqual())
          *((_BYTE *)v3 + 136) = 0;
        if (!CFArrayGetCount(v10))
        {
          v15 = *(void **)(a1 + 48);
          v16 = *(const __CFDictionary **)(a1 + 72);
          goto LABEL_20;
        }
      }
LABEL_15:
      v14 = 0;
      goto LABEL_21;
    }
  }
}

void __FigRoutingManagerContextUtilities_SaveCommChannelUUID_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const void *v4;
  const void *v5;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = (const void *)*((_QWORD *)ContextForUUIDFromDict + 13);
    v5 = *(const void **)(a1 + 56);
    *((_QWORD *)v3 + 13) = v5;
    if (v5)
      CFRetain(v5);
    if (v4)
      CFRelease(v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  _QWORD *v4;
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v6;
  const void *Value;
  CFTypeRef v8;
  uint64_t v9;
  const void *v10;
  dispatch_time_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t CMBaseObject;
  void (*v15)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  uint64_t valuePtr;
  CFNumberRef number;
  _QWORD block[7];

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  v3 = ContextForUUIDFromDict;
  v4 = (_QWORD *)MEMORY[0x1E0C9AE00];
  if (*(_QWORD *)(a1 + 56))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    CFArrayAppendValue(*((CFMutableArrayRef *)v3 + 14), Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  FigCFDictionaryGetInt32IfPresent();
  v6 = *(const __CFDictionary **)(a1 + 72);
  if (v6 && (Value = CFDictionaryGetValue(v6, CFSTR("clientRouteRequestID"))) != 0)
    v8 = CFRetain(Value);
  else
    v8 = 0;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 && !FigRoutingManagerIsEndpointOfType(v9))
  {
    v10 = *(const void **)(a1 + 56);
    if (v10)
      CFRetain(v10);
    if (v8)
      CFRetain(v8);
    v11 = dispatch_time(0, 60000000000);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(NSObject **)(v12 + 496);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_2;
    block[3] = &__block_descriptor_56_e5_v8__0l;
    block[4] = v12;
    block[5] = v8;
    block[6] = *(_QWORD *)(a1 + 56);
    dispatch_after(v11, v13, block);
  }
  _routingContextUtilities_postRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void **)(a1 + 48), *(const __CFDictionary **)(a1 + 72));
  if (v8)
    CFRelease(v8);
  if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 56)))
  {
    number = 0;
    CMBaseObject = FigEndpointGetCMBaseObject();
    v15 = *(void (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v15)
    {
      v15(CMBaseObject, *MEMORY[0x1E0CA43E0], *v4, &number);
      valuePtr = 0;
      if (number)
      {
        CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
        CFRelease(number);
        number = 0;
        if ((valuePtr & 0x10) != 0)
          return;
      }
    }
    else
    {
      valuePtr = 0;
    }
    FigRouteDiscoveryManagerLowerBTDiscoveryModeFromDetailed();
  }
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  const void *v4;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 504);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_3;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v6 = *(_OWORD *)(a1 + 40);
  MXDispatchSync((uint64_t)"FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_2", (uint64_t)"FigRoutingManagerContextUtilities.m", 1622, 0, 0, v2, (uint64_t)v5);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_3(uint64_t a1)
{
  _routingContextUtilities_checkActivationTimeout(*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
}

void __FigRoutingManagerContextUtilities_RemoveCurrentlyActivatingEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  uint64_t v3;
  CFMutableDictionaryRef RouteConfigUpdatedPayload;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = (uint64_t)ContextForUUIDFromDict;
    RouteConfigUpdatedPayload = routingContextUtilities_createRouteConfigUpdatedPayload(*(const __CFDictionary **)(a1 + 56));
    _routingContextUtilities_postNotificationToContextAndItsFollowers(v3, CFSTR("routeConfigUpdated"), RouteConfigUpdatedPayload);
    _routingContextUtilities_removeCurrentlyActivatingEndpointWithID(*(void **)(a1 + 48), *(const __CFString **)(a1 + 64));
    if (RouteConfigUpdatedPayload)
      CFRelease(RouteConfigUpdatedPayload);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingSubEndpoints_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const __CFAllocator *v4;
  CFMutableDictionaryRef Mutable;
  const __CFArray *v6;
  CFMutableArrayRef MutableCopy;
  CFMutableArrayRef v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const __CFDictionary *ValueAtIndex;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigCFDictionaryGetInt32IfPresent();
    v6 = *(const __CFArray **)(a1 + 64);
    if (v6)
      MutableCopy = CFArrayCreateMutableCopy(v4, 0, v6);
    else
      MutableCopy = CFArrayCreateMutable(v4, 0, MEMORY[0x1E0C9B378]);
    v8 = MutableCopy;
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    v9 = (const __CFArray *)*((_QWORD *)v3 + 14);
    if (v9 && (Count = CFArrayGetCount(v9), Count >= 1))
    {
      v11 = Count;
      v12 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 14), v12);
        if (CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_Endpoint")) == *(const void **)(a1 + 80))
          break;
        if (v11 == ++v12)
          goto LABEL_11;
      }
      FigCFDictionaryGetBooleanIfPresent();
      CFDictionarySetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_SubEndpoints"), v8);
    }
    else
    {
LABEL_11:
      CFArrayAppendValue(*((CFMutableArrayRef *)v3 + 14), Mutable);
    }
    _routingContextUtilities_postRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void **)(a1 + 48), *(const __CFDictionary **)(a1 + 56));
    if (v8)
      CFRelease(v8);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_SetPickedEndpoints_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  void *v10;
  const __CFDictionary *v11;
  const void *Value;
  const void *v13;
  CFTypeRef v14;
  const void *v15;
  int v16;
  CFIndex v17;
  const __CFArray *Count;
  const __CFDictionary *ValueAtIndex;
  const void *v20;
  uint64_t CMBaseObject;
  void (*v22)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *);
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  const void *v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFAllocator *alloc;
  CFTypeRef cf;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -17422;
    return;
  }
  if (*(_DWORD *)v2 == 13 || *(_DWORD *)v2 == 3)
  {
    FigRoutingContextUtilities_LogRouteDescriptors(*(const __CFArray **)(v2 + 128), *(const __CFArray **)(a1 + 64));
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v4 = *(const void **)(v2 + 72);
  v5 = *(const void **)(a1 + 72);
  *(_QWORD *)(v2 + 72) = v5;
  if (v5)
    CFRetain(v5);
  if (v4)
    CFRelease(v4);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v7 = *(const void **)(v6 + 128);
  v8 = *(const void **)(a1 + 64);
  *(_QWORD *)(v6 + 128) = v8;
  if (v8)
    CFRetain(v8);
  if (v7)
    CFRelease(v7);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!*(_QWORD *)(v9 + 72))
  {
    v10 = *(void **)(v9 + 96);
    if (v10)
      _routingContextUtilities_setLeaderUUIDForContext(*(void **)(a1 + 56), v10);
  }
  v11 = *(const __CFDictionary **)(a1 + 80);
  if (v11)
  {
    Value = CFDictionaryGetValue(v11, CFSTR("clientRouteRequestID"));
    if (Value)
      v13 = CFRetain(Value);
    else
      v13 = 0;
    v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("initiator"));
    if (v15)
      v14 = CFRetain(v15);
    else
      v14 = 0;
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  v16 = 0;
  v17 = 0;
  v28 = *MEMORY[0x1E0CA4258];
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    Count = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 112);
    if (Count)
      Count = (const __CFArray *)CFArrayGetCount(Count);
    if (v17 >= (uint64_t)Count)
      break;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)+ 112), v17);
    v20 = CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_Endpoint"));
    cf = 0;
    FigRoutingManagerLogEndpointID((uint64_t)CFSTR("currently activating endpoint:"), (uint64_t)v20, 0, 1);
    if (v20)
    {
      CMBaseObject = FigEndpointGetCMBaseObject();
      v22 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
      if (v22)
        v22(CMBaseObject, v28, alloc, &cf);
    }
    if (FigRoutingContextUtilities_DoesArrayOfEndpointsContainEndpoint(*(const __CFArray **)(a1 + 72), (uint64_t)v20))
    {
      if (v13)
      {
LABEL_37:
        if (!FigRoutingManagerIsEndpointOfType((uint64_t)v20))
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 112), v17--);
        _routingContextUtilities_removeCurrentlyActivatingEndpointWithID(*(void **)(a1 + 56), (const __CFString *)cf);
        _routingContextUtilities_notifyClientsOfChangeInPickedEndpoints(*(_QWORD *)(a1 + 88), (uint64_t)v13, (int)v14, *(void **)(a1 + 56));
        if (v13)
          CFRelease(v13);
        if (v14)
        {
          CFRelease(v14);
          v13 = 0;
          v14 = 0;
        }
        else
        {
          v13 = 0;
        }
        v16 = 1;
        goto LABEL_51;
      }
      v23 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_ClientRouteChangeOptions"));
      if (!v23)
      {
        v13 = 0;
        goto LABEL_37;
      }
      v24 = v23;
      v25 = CFDictionaryGetValue(v23, CFSTR("clientRouteRequestID"));
      if (v25)
      {
        v13 = CFRetain(v25);
        if (v14)
          goto LABEL_46;
      }
      else
      {
        v13 = 0;
        if (v14)
LABEL_46:
          CFRelease(v14);
      }
      v26 = CFDictionaryGetValue(v24, CFSTR("initiator"));
      if (v26)
        v14 = CFRetain(v26);
      else
        v14 = 0;
      goto LABEL_37;
    }
LABEL_51:
    if (cf)
      CFRelease(cf);
    ++v17;
  }
  if (!v16)
  {
    if (!v13)
    {
      if (v14)
        CFRelease(v14);
      v27 = MEMORY[0x194035214]();
      v13 = CFStringCreateWithFormat(alloc, 0, CFSTR("%lld"), v27);
      v14 = 0;
    }
    _routingContextUtilities_notifyClientsOfChangeInPickedEndpoints(*(_QWORD *)(a1 + 88), (uint64_t)v13, (int)v14, *(void **)(a1 + 56));
  }
  if (v13)
    CFRelease(v13);
  if (v14)
    CFRelease(v14);
}

void __FigRoutingManagerContextUtilities_AddActivatedEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  int v8;
  const __CFDictionary *ValueAtIndex;
  const void *Value;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  v3 = ContextForUUIDFromDict;
  v4 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 15);
  if (!v4)
    goto LABEL_14;
  Count = CFArrayGetCount(v4);
  if (!Count)
  {
    v4 = (const __CFArray *)*((_QWORD *)v3 + 15);
LABEL_14:
    CFArrayAppendValue(v4, *(const void **)(a1 + 56));
    return;
  }
  v6 = Count;
  if (Count < 1)
    goto LABEL_16;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), v7);
    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_Endpoint"));
    FigCFDictionaryGetInt64IfPresent();
    if (Value == *(const void **)(a1 + 64))
      break;
LABEL_9:
    if (v6 == ++v7)
    {
      if (v8)
        return;
      goto LABEL_16;
    }
  }
  if (!*(_QWORD *)(a1 + 72))
  {
    v8 = 1;
    goto LABEL_9;
  }
  FigCFDictionarySetValue();
  if (v8)
    return;
LABEL_16:
  CFArrayAppendValue(*((CFMutableArrayRef *)v3 + 15), *(const void **)(a1 + 56));
}

void __FigRoutingManagerContextUtilities_RemoveActivatedEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const __CFArray *v10;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 15);
    if (v4)
    {
      Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v6 = Count;
        v7 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), v7);
          Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_Endpoint"));
          FigCFDictionaryGetInt64IfPresent();
          if (Value == *(const void **)(a1 + 56) && !*(_QWORD *)(a1 + 64))
            break;
          if (v6 == ++v7)
            return;
        }
        if (!FigRoutingManagerIsEndpointOfType((uint64_t)Value)
          || (v10 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_SubEndpointsInfo"))) == 0|| !CFArrayGetCount(v10))
        {
          CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v3 + 15), v7);
        }
      }
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
}

const UInt8 *__FigRoutingManagerContextUtilities_GetPickingState_block_invoke(uint64_t a1)
{
  const UInt8 *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
    **(_DWORD **)(a1 + 56) = *((_DWORD *)result + 14);
  else
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_SetPickingState_block_invoke(uint64_t a1)
{
  const UInt8 *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
    *((_DWORD *)result + 14) = *(_DWORD *)(a1 + 56);
  else
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  return result;
}

_QWORD *__FigRoutingManagerContextUtilities_SetDefaultLeaderUUIDForContext_block_invoke(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    v3 = result;
    result = *(_QWORD **)(a1 + 56);
    if (result)
      result = CFRetain(result);
    v3[12] = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyAllAudioContexts_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  void *ValueAtIndex;
  const void *v7;
  const void *v8;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 616);
  if (v2)
  {
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 616), i);
        if (_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), ValueAtIndex))
        {
          v7 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
          if (v7)
          {
            v8 = v7;
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v7);
            CFRelease(v8);
          }
        }
      }
    }
  }
}

void __FigRoutingManagerContextUtilities_CopyPickedEndpointForRemoteControl_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  int v3;
  CFTypeRef v4;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  v3 = *(_DWORD *)ContextForUUIDFromDict;
  if (*(_DWORD *)ContextForUUIDFromDict == 9)
    goto LABEL_5;
  if (v3 == 7)
  {
    _routingContextUtilities_copyPickedEndpointAtIndex((uint64_t)ContextForUUIDFromDict, 0, *(_QWORD **)(a1 + 56));
    return;
  }
  if (v3 == 3)
  {
LABEL_5:
    v4 = (CFTypeRef)*((_QWORD *)ContextForUUIDFromDict + 8);
    if (v4)
      v4 = CFRetain(v4);
    **(_QWORD **)(a1 + 56) = v4;
  }
  else
  {
    **(_QWORD **)(a1 + 56) = 0;
  }
}

void __FigRoutingManagerContextUtilities_GetActivatedEndpointFeatures_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  int64_t v9;
  const void **v10;
  const void **v11;
  uint64_t j;
  const __CFData *v13;
  const UInt8 *BytePtr;
  const __CFArray *v15;
  CFIndex v16;
  CFIndex v17;
  CFIndex k;
  const __CFDictionary *v19;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 15);
    if (v4)
    {
      Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v6 = Count;
        for (i = 0; i != v6; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), i);
          if (CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_Endpoint")) == *(const void **)(a1 + 56))
            FigCFDictionaryGetInt64IfPresent();
        }
      }
    }
    if (!**(_QWORD **)(a1 + 64))
    {
      v9 = FigCFDictionaryGetCount();
      v10 = (const void **)malloc_type_calloc(v9, 8uLL, 0x80040B8603338uLL);
      if (v10)
      {
        v11 = v10;
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), 0, v10);
        if (v9 >= 1)
        {
          for (j = 0; j != v9; ++j)
          {
            v13 = (const __CFData *)v11[j];
            if (v13)
            {
              BytePtr = CFDataGetBytePtr(v13);
              v15 = (const __CFArray *)*((_QWORD *)BytePtr + 15);
              if (v15)
              {
                v16 = CFArrayGetCount(v15);
                if (v16 >= 1)
                {
                  v17 = v16;
                  for (k = 0; k != v17; ++k)
                  {
                    v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)BytePtr + 15), k);
                    if (CFDictionaryGetValue(v19, CFSTR("ActivatedEndpointsInfo_Endpoint")) == *(const void **)(a1 + 56))
                      FigCFDictionaryGetInt64IfPresent();
                  }
                }
              }
            }
          }
        }
        free(v11);
      }
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_GetActivationSeedForEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  int64_t v9;
  const void **v10;
  const void **v11;
  uint64_t j;
  const __CFData *v13;
  const UInt8 *BytePtr;
  const __CFArray *v15;
  CFIndex v16;
  CFIndex v17;
  CFIndex k;
  const __CFDictionary *v19;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 15);
    if (v4)
    {
      Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v6 = Count;
        for (i = 0; i != v6; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), i);
          if (CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_Endpoint")) == *(const void **)(a1 + 56))
            FigCFDictionaryGetInt64IfPresent();
        }
      }
    }
    if (!**(_QWORD **)(a1 + 64))
    {
      v9 = FigCFDictionaryGetCount();
      v10 = (const void **)malloc_type_calloc(v9, 8uLL, 0x80040B8603338uLL);
      if (v10)
      {
        v11 = v10;
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), 0, v10);
        if (v9 >= 1)
        {
          for (j = 0; j != v9; ++j)
          {
            v13 = (const __CFData *)v11[j];
            if (v13)
            {
              BytePtr = CFDataGetBytePtr(v13);
              v15 = (const __CFArray *)*((_QWORD *)BytePtr + 15);
              if (v15)
              {
                v16 = CFArrayGetCount(v15);
                if (v16 >= 1)
                {
                  v17 = v16;
                  for (k = 0; k != v17; ++k)
                  {
                    v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)BytePtr + 15), k);
                    if (CFDictionaryGetValue(v19, CFSTR("ActivatedEndpointsInfo_Endpoint")) == *(const void **)(a1 + 56))
                      FigCFDictionaryGetInt64IfPresent();
                  }
                }
              }
            }
          }
        }
        free(v11);
      }
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
}

_QWORD *__FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpointInfoAtIndex_block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  _QWORD *v4;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result
    && (v3 = *(_QWORD *)(a1 + 56), (v3 & 0x8000000000000000) == 0)
    && (v4 = result, (result = (_QWORD *)result[14]) != 0)
    && (result = (_QWORD *)CFArrayGetCount((CFArrayRef)result), v3 < (uint64_t)result))
  {
    result = CFArrayGetValueAtIndex((CFArrayRef)v4[14], *(_QWORD *)(a1 + 56));
    if (result)
      result = CFRetain(result);
    **(_QWORD **)(a1 + 64) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_RemoveCurrentlyActivatingEndpointInfoAtIndex_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  CFIndex v3;
  const UInt8 *v4;
  const __CFArray *v5;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if ((v3 & 0x8000000000000000) == 0)
    {
      v4 = ContextForUUIDFromDict;
      v5 = (const __CFArray *)*((_QWORD *)ContextForUUIDFromDict + 14);
      if (v5)
      {
        if (v3 < CFArrayGetCount(v5))
          CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v4 + 14), *(_QWORD *)(a1 + 56));
      }
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

void __FigRoutingManagerContextUtilities_AppendCurrentlyActivatingEndpointInfo_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
    CFArrayAppendValue(*((CFMutableArrayRef *)ContextForUUIDFromDict + 14), *(const void **)(a1 + 56));
  else
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
}

_QWORD *__FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpointsInfo_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (_QWORD *)result[14];
    if (result)
      result = CFRetain(result);
    **(_QWORD **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

uint64_t __FigRoutingManagerContextUtilities_CopyCurrentlyActivatingSubEndpoints_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;

  result = (uint64_t)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    v3 = result;
    result = *(_QWORD *)(result + 112);
    if (result)
    {
      result = CFArrayGetCount((CFArrayRef)result);
      if (result >= 1)
      {
        v4 = result;
        v5 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 112), v5);
          result = (uint64_t)CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_Endpoint"));
          if (result == *(_QWORD *)(a1 + 56))
            break;
          if (v4 == ++v5)
            return result;
        }
        result = (uint64_t)CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_SubEndpoints"));
        if (result)
          result = (uint64_t)CFRetain((CFTypeRef)result);
        **(_QWORD **)(a1 + 64) = result;
      }
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

_QWORD *__FigRoutingManagerContextUtilities_CopyActivatedEndpointsInfo_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (_QWORD *)result[15];
    if (result)
      result = CFRetain(result);
    **(_QWORD **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyRoutingContextUUIDForActivatedEndpoint_block_invoke(uint64_t a1)
{
  int64_t Count;
  const void **v3;
  const void **v4;
  uint64_t v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  const void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *Value;
  uint64_t v16;
  const void *v17;
  CFTypeRef cf;
  uint64_t valuePtr;

  Count = FigCFDictionaryGetCount();
  v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (v3)
  {
    v4 = v3;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), 0, v3);
    if (Count <= 0)
    {
      free(v4);
    }
    else
    {
      v5 = 0;
      cf = 0;
      do
      {
        v6 = (const __CFData *)v4[v5];
        if (v6)
        {
          BytePtr = CFDataGetBytePtr(v6);
          v8 = (const void *)*((_QWORD *)BytePtr + 15);
          if (v8)
          {
            v9 = (const __CFArray *)CFRetain(v8);
            if (v9)
            {
              v10 = v9;
              v11 = CFArrayGetCount(v9);
              if (v11 >= 1)
              {
                v12 = v11;
                v13 = 0;
                while (1)
                {
                  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v13);
                  if (CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_Endpoint")) == *(const void **)(a1 + 40))
                  {
                    Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_ActivationSeed"));
                    valuePtr = 0;
                    if (Value)
                    {
                      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
                      v16 = valuePtr;
                    }
                    else
                    {
                      v16 = 0;
                    }
                    if (v16 == *(_QWORD *)(a1 + 48))
                      break;
                  }
                  if (v12 == ++v13)
                    goto LABEL_15;
                }
                v17 = (const void *)*((_QWORD *)BytePtr + 1);
                if (v17)
                  cf = CFRetain(v17);
                else
                  cf = 0;
              }
LABEL_15:
              CFRelease(v10);
            }
          }
        }
        ++v5;
      }
      while (v5 != Count);
      free(v4);
      if (cf)
      {
        **(_QWORD **)(a1 + 56) = CFRetain(cf);
        CFRelease(cf);
        return;
      }
    }
  }
  **(_QWORD **)(a1 + 56) = 0;
}

void __FigRoutingManagerContextUtilities_RemoveContext_block_invoke(uint64_t a1)
{
  _DWORD *v2;
  int v3;
  uint64_t v4;
  const __CFArray *v5;
  CFIndex v6;
  CFIndex v7;
  CFMutableArrayRef *v8;
  uint64_t v9;
  const __CFArray *v10;
  CFIndex FirstIndexOfValue;
  uint64_t v12;
  const __CFArray *v13;
  CFIndex v14;
  const __CFData *v15;
  const __CFData *v16;
  CFRange v17;
  CFRange v18;
  CFRange v19;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 64) + 480), *(void **)(a1 + 72));
  v2 = *(_DWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -17420;
    return;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *v2;
  v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  switch(v3)
  {
    case 4:
      v9 = *(_QWORD *)(a1 + 64);
      v10 = *(const __CFArray **)(v9 + 616);
      if (v10)
      {
        v18.length = CFArrayGetCount(*(CFArrayRef *)(v9 + 616));
        v18.location = 0;
        FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v10, v18, *(const void **)(a1 + 72));
        if (FirstIndexOfValue != -1)
        {
          v7 = FirstIndexOfValue;
          v8 = (CFMutableArrayRef *)(*(_QWORD *)(a1 + 64) + 616);
          goto LABEL_15;
        }
      }
      break;
    case 6:
      v12 = *(_QWORD *)(a1 + 64);
      v13 = *(const __CFArray **)(v12 + 600);
      if (v13)
      {
        v19.length = CFArrayGetCount(*(CFArrayRef *)(v12 + 600));
        v19.location = 0;
        v14 = CFArrayGetFirstIndexOfValue(v13, v19, *(const void **)(a1 + 72));
        if (v14 != -1)
        {
          v7 = v14;
          v8 = (CFMutableArrayRef *)(*(_QWORD *)(a1 + 64) + 600);
          goto LABEL_15;
        }
      }
      break;
    case 5:
      v4 = *(_QWORD *)(a1 + 64);
      v5 = *(const __CFArray **)(v4 + 608);
      if (v5)
      {
        v17.length = CFArrayGetCount(*(CFArrayRef *)(v4 + 608));
        v17.location = 0;
        v6 = CFArrayGetFirstIndexOfValue(v5, v17, *(const void **)(a1 + 72));
        if (v6 != -1)
        {
          v7 = v6;
          v8 = (CFMutableArrayRef *)(*(_QWORD *)(a1 + 64) + 608);
LABEL_15:
          CFArrayRemoveValueAtIndex(*v8, v7);
        }
      }
      break;
  }
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 64)+ 32 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)+ 8), *(const void **)(a1 + 72)))
  {
    v15 = (const __CFData *)FigCFWeakReferenceHolderCopyReferencedObject();
    if (v15)
    {
      v16 = v15;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDataGetBytePtr(v15);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      CFRelease(v16);
    }
  }
}

void __FigRoutingManagerContextUtilities_RemoveContext_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  uint64_t v15;
  _QWORD *v16;
  const void *v17;
  const void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  const void *v23;
  NSObject *v24;
  const void *v25;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = *(const void **)(v2 + 64);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v4 = *(const void **)(v2 + 8);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 8) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v5 = *(const void **)(v2 + 16);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v6 = *(const void **)(v2 + 80);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v7 = *(const void **)(v2 + 88);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 88) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v8 = *(const void **)(v2 + 48);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 48) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v9 = *(const void **)(v2 + 72);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 72) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v10 = *(const void **)(v2 + 112);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 112) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v11 = *(const void **)(v2 + 120);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 120) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v12 = *(const void **)(v2 + 40);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 40) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v13 = *(const void **)(v2 + 128);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 128) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v14 = *(const void **)(v2 + 144);
  if (v14)
  {
    CFRelease(v14);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 144) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  *(_DWORD *)(v2 + 24) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 32) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 28) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 152) = -1082130432;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v16 = *(_QWORD **)(v15 + 24);
  v17 = (const void *)v16[21];
  if (v17)
  {
    CFRelease(v17);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 168) = 0;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD **)(v15 + 24);
  }
  v18 = (const void *)v16[20];
  if (v18)
  {
    CFRelease(v18);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 160) = 0;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD **)(v15 + 24);
  }
  v19 = v16[22];
  if (v19)
  {
    dispatch_source_cancel(v19);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD **)(v15 + 24);
    v20 = v16[22];
    if (v20)
    {
      dispatch_release(v20);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 176) = 0;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(_QWORD **)(v15 + 24);
    }
  }
  v21 = v16[23];
  if (v21)
  {
    dispatch_source_cancel(v21);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD **)(v15 + 24);
    v22 = v16[23];
    if (v22)
    {
      dispatch_release(v22);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 184) = 0;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(_QWORD **)(v15 + 24);
    }
  }
  v23 = (const void *)v16[25];
  if (v23)
  {
    CFRelease(v23);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 200) = 0;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD **)(v15 + 24);
  }
  v24 = v16[24];
  if (v24)
  {
    dispatch_release(v24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 192) = 0;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD **)(v15 + 24);
  }
  v25 = (const void *)v16[26];
  if (v25)
  {
    CFRelease(v25);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 208) = 0;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v15 + 24) = 0;
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 48)+ 32 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)+ 8), *(const void **)(a1 + 56));
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(const void **)(a1 + 56));
}

_QWORD *__FigRoutingManagerContextUtilities_CopyHijackID_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    result = (_QWORD *)result[2];
    if (result)
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_SetAggregateEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v5;
  const void *v6;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    if (dword_1EE2B3E28)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = (const void *)*((_QWORD *)v3 + 8);
    v6 = *(const void **)(a1 + 56);
    *((_QWORD *)v3 + 8) = v6;
    if (v6)
      CFRetain(v6);
    if (v5)
      CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

_QWORD *__FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpointAggregate_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (_QWORD *)result[8];
    if (result)
      result = CFRetain(result);
    **(_QWORD **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

_QWORD *__FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpoint_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (_QWORD *)result[8];
    if (result)
      result = CFRetain(result);
    **(_QWORD **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyNonControlPickedContexts_block_invoke(uint64_t a1)
{
  int64_t Count;
  const void **v3;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  const CFDictionaryKeyCallBacks *v6;
  const CFDictionaryValueCallBacks *v7;
  void **v8;
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  const void *v14;
  const __CFArray *v15;
  const void *v16;
  __CFDictionary **v17;

  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480));
  v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), v3, 0);
  if (Count >= 1)
  {
    v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v8 = (void **)v3;
    do
    {
      ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *v8);
      if (*(_DWORD *)ContextForUUIDFromDict != 7 && *(_DWORD *)ContextForUUIDFromDict != 9)
      {
        v11 = ContextForUUIDFromDict;
        v12 = CFDictionaryCreateMutable(v4, 0, v6, v7);
        v13 = v12;
        v14 = (const void *)*((_QWORD *)v11 + 9);
        if (v14)
          CFDictionarySetValue(v12, CFSTR("CurrentEndpoints"), v14);
        v15 = (const __CFArray *)*((_QWORD *)v11 + 14);
        if (v15 && CFArrayGetCount(v15) >= 1)
          CFDictionarySetValue(v13, CFSTR("CurrentlyActivatingEndpointsInfo"), *((const void **)v11 + 14));
        v16 = (const void *)*((_QWORD *)v11 + 15);
        if (v16)
          CFDictionarySetValue(v13, CFSTR("ActivatedEndpointsInfo"), v16);
        CFDictionarySetValue(Mutable, *((const void **)v11 + 1), v13);
        if (v13)
          CFRelease(v13);
      }
      ++v8;
      --Count;
    }
    while (Count);
  }
  v17 = *(__CFDictionary ***)(a1 + 40);
  if (v17)
  {
    *v17 = Mutable;
    free(v3);
  }
  else
  {
    free(v3);
    if (Mutable)
      CFRelease(Mutable);
  }
}

void __FigRoutingManagerContextUtilities_CopyAllRoutingContextUUIDs_block_invoke(uint64_t a1)
{
  __CFArray *Mutable;
  __CFArray *v3;
  _QWORD *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex i;
  const void *ValueAtIndex;
  const __CFArray *v16;
  CFIndex v17;
  CFIndex v18;
  CFIndex j;
  const void *v20;
  const __CFArray *v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex k;
  const void *v25;
  _QWORD *v26;
  CFTypeRef v27;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v3 = Mutable;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (const void *)v4[66];
  if (v5)
  {
    CFArrayAppendValue(Mutable, v5);
    v4 = *(_QWORD **)(a1 + 32);
  }
  v6 = (const void *)v4[67];
  if (v6)
  {
    CFArrayAppendValue(v3, v6);
    v4 = *(_QWORD **)(a1 + 32);
  }
  v7 = (const void *)v4[68];
  if (v7)
  {
    CFArrayAppendValue(v3, v7);
    v4 = *(_QWORD **)(a1 + 32);
  }
  v8 = (const void *)v4[74];
  if (v8)
  {
    CFArrayAppendValue(v3, v8);
    v4 = *(_QWORD **)(a1 + 32);
  }
  v9 = (const void *)v4[69];
  if (v9)
  {
    CFArrayAppendValue(v3, v9);
    v4 = *(_QWORD **)(a1 + 32);
  }
  v10 = (const void *)v4[72];
  if (v10)
  {
    CFArrayAppendValue(v3, v10);
    v4 = *(_QWORD **)(a1 + 32);
  }
  v11 = (const __CFArray *)v4[75];
  if (v11)
  {
    Count = CFArrayGetCount(v11);
    if (Count >= 1)
    {
      v13 = Count;
      for (i = 0; i != v13; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 600), i);
        CFArrayAppendValue(v3, ValueAtIndex);
      }
    }
  }
  v16 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 608);
  if (v16)
  {
    v17 = CFArrayGetCount(v16);
    if (v17 >= 1)
    {
      v18 = v17;
      for (j = 0; j != v18; ++j)
      {
        v20 = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 608), j);
        CFArrayAppendValue(v3, v20);
      }
    }
  }
  v21 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 616);
  if (v21)
  {
    v22 = CFArrayGetCount(v21);
    if (v22 >= 1)
    {
      v23 = v22;
      for (k = 0; k != v23; ++k)
      {
        v25 = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 616), k);
        CFArrayAppendValue(v3, v25);
      }
    }
  }
  v26 = *(_QWORD **)(a1 + 40);
  if (v26)
  {
    if (v3)
    {
      v27 = CFRetain(v3);
      v26 = *(_QWORD **)(a1 + 40);
    }
    else
    {
      v27 = 0;
    }
    *v26 = v27;
  }
  if (v3)
    CFRelease(v3);
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemRemoteDisplayContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 592);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySidePlayContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 552);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemRemotePoolContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 560);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemVideoContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 568);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemAudioInputContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 584);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopyAudioContextUUIDs_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 616);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopyPerAppSecondDisplayContextUUIDs_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 600);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

void __FigRoutingManagerContextUtilities_CopyArrayOfFollowerUUIDs_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  __CFArray *Mutable;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  const UInt8 *ContextFromWeakRef;
  const void *v11;
  __CFArray **v12;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v5 = (const __CFArray *)*((_QWORD *)v3 + 11);
    if (v5)
    {
      Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        v7 = Count;
        for (i = 0; i != v7; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 11), i);
          ContextFromWeakRef = _routingContextUtilities_getContextFromWeakRef((uint64_t)ValueAtIndex);
          if (ContextFromWeakRef)
          {
            v11 = (const void *)*((_QWORD *)ContextFromWeakRef + 1);
            if (v11)
              CFArrayAppendValue(Mutable, v11);
          }
        }
      }
    }
    v12 = *(__CFArray ***)(a1 + 56);
    if (v12)
    {
      *v12 = Mutable;
    }
    else if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

const UInt8 *__FigRoutingManagerContextUtilities_IsContextSidePlay_block_invoke(uint64_t a1)
{
  const UInt8 *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*(_DWORD *)result == 12)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_IsContextSystemAudio_block_invoke(uint64_t a1)
{
  const UInt8 *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*(_DWORD *)result == 1)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_IsContextSystemRemoteDisplay_block_invoke(uint64_t a1)
{
  const UInt8 *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*(_DWORD *)result == 14)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_UpdateRouteDescriptorForGivenContext_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const void *v4;
  const void *v5;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    if ((*(_DWORD *)ContextForUUIDFromDict | 2) == 3)
      FigRoutingContextUtilities_LogRouteDescriptors(*((const __CFArray **)ContextForUUIDFromDict + 16), *(const __CFArray **)(a1 + 56));
    v4 = (const void *)*((_QWORD *)v3 + 16);
    v5 = *(const void **)(a1 + 56);
    *((_QWORD *)v3 + 16) = v5;
    if (v5)
      CFRetain(v5);
    if (v4)
      CFRelease(v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

CFDictionaryRef *__FigRoutingManagerContextUtilities_GetMainVolumeScaleFactorForEndpointID_block_invoke(uint64_t a1)
{
  CFDictionaryRef *result;

  result = (CFDictionaryRef *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (CFDictionaryRef *)CFDictionaryGetValue(result[18], *(const void **)(a1 + 56));
    if (result)
      return (CFDictionaryRef *)CFNumberGetValue((CFNumberRef)result, kCFNumberFloat32Type, (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  return result;
}

void __FigRoutingManagerContextUtilities_SetMainVolumeScaleFactorForEndpointID_block_invoke(uint64_t a1)
{
  CFNumberRef v2;

  if (_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *(void **)(a1 + 40)))
  {
    v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat32Type, (const void *)(a1 + 56));
    FigCFDictionarySetValue();
    if (v2)
      CFRelease(v2);
  }
}

void __FigRoutingManagerContextUtilities_SetScreenEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v3;
  const void *v4;
  const void *v5;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    v3 = ContextForUUIDFromDict;
    v4 = *(const void **)(a1 + 48);
    v5 = (const void *)*((_QWORD *)v3 + 20);
    if (v4)
    {
      *((_QWORD *)v3 + 20) = v4;
      CFRetain(v4);
      if (v5)
        CFRelease(v5);
    }
    else if (v5)
    {
      CFRelease(*((CFTypeRef *)v3 + 20));
      *((_QWORD *)v3 + 20) = 0;
    }
  }
}

_QWORD *__FigRoutingManagerContextUtilities_CopyScreenEndpointUUID_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (_QWORD *)result[20];
    if (result)
    {
      result = CFRetain(result);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

void __FigRoutingManagerContextUtilities_SetAudioEndpoint_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const void *v3;
  const void *v4;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    v3 = (const void *)*((_QWORD *)ContextForUUIDFromDict + 21);
    v4 = *(const void **)(a1 + 48);
    *((_QWORD *)ContextForUUIDFromDict + 21) = v4;
    if (v4)
      CFRetain(v4);
    if (v3)
      CFRelease(v3);
  }
}

uint64_t __FigRoutingManagerContextUtilities_IsRoutedToLocalAirplayReceiver_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (uint64_t)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = FigCFEqual();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_StopDiscoveryTimer_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v2;
  NSObject *v3;
  const void *v4;
  NSObject *v5;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    v2 = ContextForUUIDFromDict;
    v3 = *((_QWORD *)ContextForUUIDFromDict + 23);
    if (v3)
      dispatch_source_cancel(v3);
    v4 = (const void *)*((_QWORD *)v2 + 25);
    if (v4)
    {
      CFRelease(v4);
      *((_QWORD *)v2 + 25) = 0;
    }
    v5 = *((_QWORD *)v2 + 24);
    if (v5)
    {
      dispatch_release(v5);
      *((_QWORD *)v2 + 24) = 0;
    }
  }
}

void __FigRoutingManagerContextUtilities_StopMirroringTimer_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const UInt8 *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  NSObject *v5;
  const void *v6;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    v2 = ContextForUUIDFromDict;
    if (*((_QWORD *)ContextForUUIDFromDict + 20))
    {
      if (dword_1EE2B3E28)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4 = *((_QWORD *)v2 + 22);
      if (v4)
      {
        dispatch_source_cancel(v4);
        v5 = *((_QWORD *)v2 + 22);
        if (v5)
        {
          dispatch_release(v5);
          *((_QWORD *)v2 + 22) = 0;
        }
      }
      v6 = (const void *)*((_QWORD *)v2 + 20);
      if (v6)
      {
        CFRelease(v6);
        *((_QWORD *)v2 + 20) = 0;
      }
    }
  }
}

void __FigRoutingManagerContextUtilities_CacheSupportedOutputChannelLayouts_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  const void *v3;
  const void *v4;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    v3 = (const void *)*((_QWORD *)ContextForUUIDFromDict + 26);
    v4 = *(const void **)(a1 + 48);
    *((_QWORD *)ContextForUUIDFromDict + 26) = v4;
    if (v4)
      CFRetain(v4);
    if (v3)
      CFRelease(v3);
  }
}

void __FigRoutingManagerContextUtilities_CopySupportedOutputChannelLayouts_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  uint64_t v3;
  const void *v4;
  const void *v5;

  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(const void **)(v3 + 24);
    v5 = (const void *)*((_QWORD *)ContextForUUIDFromDict + 26);
    *(_QWORD *)(v3 + 24) = v5;
    if (v5)
      CFRetain(v5);
    if (v4)
      CFRelease(v4);
  }
}

@end
