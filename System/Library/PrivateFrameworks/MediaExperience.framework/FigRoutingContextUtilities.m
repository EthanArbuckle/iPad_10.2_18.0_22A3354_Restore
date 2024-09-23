@implementation FigRoutingContextUtilities

void *__FigRoutingContextUtilities_IsFollowingAnotherContext_block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (void *)_routingContextUtilities_getLeaderWeakRef((uint64_t)result);
    if (result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

void __FigRoutingContextUtilities_CopyLeaderUUIDForContext_block_invoke(uint64_t a1)
{
  const UInt8 *ContextForUUIDFromDict;
  uint64_t v3;
  const __CFData *v4;
  const __CFData *v5;
  const UInt8 *BytePtr;
  CFTypeRef v7;
  _QWORD *v8;
  CFTypeRef v9;

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
          v7 = (CFTypeRef)*((_QWORD *)BytePtr + 1);
          if (v7)
            v7 = CFRetain(v7);
          **(_QWORD **)(a1 + 56) = v7;
        }
        CFRelease(v5);
      }
    }
    v8 = *(_QWORD **)(a1 + 56);
    if (!*v8)
    {
      v9 = *(CFTypeRef *)(v3 + 8);
      if (v9)
      {
        v9 = CFRetain(v9);
        v8 = *(_QWORD **)(a1 + 56);
      }
      *v8 = v9;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17420;
  }
}

const UInt8 *__FigRoutingContextUtilities_SetLeaderUUIDForContext_block_invoke(uint64_t a1)
{
  const UInt8 *result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _routingContextUtilities_setLeaderUUIDForContext(*(void **)(a1 + 48), *(void **)(a1 + 56));
  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 64) + 480), *(void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __FigRoutingContextUtilities_UnfollowUUIDFromLeader_block_invoke(uint64_t a1)
{
  const void *LeaderWeakRef;
  const UInt8 *ContextFromWeakRef;
  uint64_t v4;
  BOOL v5;
  const UInt8 *v6;
  CFIndex IndexOfFollower;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 480), *(void **)(a1 + 56));
  LeaderWeakRef = _routingContextUtilities_getLeaderWeakRef(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  ContextFromWeakRef = _routingContextUtilities_getContextFromWeakRef((uint64_t)LeaderWeakRef);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v4)
    v5 = ContextFromWeakRef == 0;
  else
    v5 = 1;
  if (v5)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -17420;
  }
  else
  {
    v6 = ContextFromWeakRef;
    IndexOfFollower = _routingContextUtilities_getIndexOfFollower((uint64_t)ContextFromWeakRef, v4);
    if ((IndexOfFollower & 0x8000000000000000) == 0)
      CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v6 + 11), IndexOfFollower);
    _routingContextUtilities_removeLeader(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
}

CFIndex __FigRoutingContextUtilities_GetIndexOfCurrentlyActivatingSubEndpoints_block_invoke(uint64_t a1)
{
  CFIndex result;
  CFIndex v3;
  CFIndex v4;
  const __CFArray *v5;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *Value;

  result = (CFIndex)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    v3 = result;
    v4 = 0;
    v5 = *(const __CFArray **)(a1 + 56);
    while (1)
    {
      result = *(_QWORD *)(v3 + 112);
      if (result)
        result = CFArrayGetCount((CFArrayRef)result);
      if (v4 >= result)
        break;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 112), v4);
      Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("CurrentlyActivatingEndpointsInfo_SubEndpoints"));
      result = MXCFArrayAreArrayContentsEqual(Value, v5);
      if ((_DWORD)result)
        goto LABEL_9;
      ++v4;
    }
    v4 = -1;
LABEL_9:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }
  return result;
}

int *__FigRoutingContextUtilities_CreateStateInfoStringForContext_block_invoke(uint64_t a1)
{
  int *result;
  int *v3;
  void *v4;
  const void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t CMBaseObject;
  void (*v18)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t Value;
  uint64_t v28;
  uint64_t v29;
  const __CFArray *v30;
  CFIndex v31;
  CFIndex Count;
  void *v33;
  uint64_t v34;
  CFMutableArrayRef Mutable;
  uint64_t v36;
  const __CFDictionary *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, id, uint64_t, CFTypeRef *);
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFTypeRef v46;
  CFTypeRef v47;
  uint64_t UInt64;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, id, uint64_t, CFTypeRef *);
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  id v58;
  void *v59;
  int *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  __CFArray *theArray;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id obj;
  id obja;
  CFTypeRef v72;
  CFTypeRef v73;
  CFTypeRef v74[2];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  CFTypeRef v78;
  CFTypeRef v79;
  CFTypeRef cf[2];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  result = (int *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[type: %@]\n"), routingContextUtilities_getFeatureString(*result));
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[uuid: %@]\n"), *((_QWORD *)v3 + 1));
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[hijackID: %@]\n"), *((_QWORD *)v3 + 2));
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[clientPID: %d]\n"), v3[6]);
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[avoidAuthPrompt: %hhu]\n"), *((unsigned __int8 *)v3 + 28));
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[routeSelectionClientPID: %d]\n"), v3[8]);
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[groupID: %@]\n"), *((_QWORD *)v3 + 5));
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[pickingState: %d]\n"), v3[14]);
    v4 = *(void **)(a1 + 32);
    v5 = (const void *)*((_QWORD *)v3 + 8);
    if (v5)
      v6 = (id)CFCopyDescription(v5);
    else
      v6 = CFSTR("NULL");
    objc_msgSend(v4, "appendFormat:", CFSTR("[aggregateEndpoint: %@]\n"), v6);
    v60 = v3;
    v61 = a1;
    v67 = *(void **)(a1 + 32);
    v7 = (void *)*((_QWORD *)v3 + 9);
    v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = v7;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v85;
      v12 = *MEMORY[0x1E0CA4258];
      v13 = *MEMORY[0x1E0C9AE00];
      v14 = *MEMORY[0x1E0CA4348];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v85 != v11)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
          cf[0] = 0;
          v74[0] = 0;
          CMBaseObject = FigEndpointGetCMBaseObject();
          v18 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
          if (v18)
            v18(CMBaseObject, v12, v13, cf);
          v19 = FigEndpointGetCMBaseObject();
          v20 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
          if (v20)
            v20(v19, v14, v13, v74);
          objc_msgSend(v8, "appendFormat:", CFSTR("endpoint: %@ endpointID: %@ endpointName: %@\n"), v16, cf[0], v74[0]);
          if (cf[0])
            CFRelease(cf[0]);
          if (v74[0])
            CFRelease(v74[0]);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
      }
      while (v10);
    }
    objc_msgSend(v67, "appendFormat:", CFSTR("[currentEndpoints: %@]\n"), v8);
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[defaultLeaderUUID: %@]\n"), *((_QWORD *)v60 + 12));
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[commChannelUUID: %@]\n"), *((_QWORD *)v60 + 13));
    v68 = *(void **)(v61 + 32);
    v21 = (void *)*((_QWORD *)v60 + 14);
    v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v85 != v25)
            objc_enumerationMutation(v21);
          Value = FigCFDictionaryGetValue();
          v28 = FigCFDictionaryGetValue();
          v29 = FigCFDictionaryGetValue();
          objc_msgSend(v22, "appendFormat:", CFSTR("endpoint: %@ clientRoutingContextUUID: %@ ClientRouteChangeOptions: %@ internalRouteChangeOptions:%@\r"), Value, v28, v29, FigCFDictionaryGetValue());
          v30 = (const __CFArray *)FigCFDictionaryGetValue();
          v31 = 0;
          if (v30)
          {
LABEL_26:
            Count = CFArrayGetCount(v30);
            goto LABEL_28;
          }
          while (1)
          {
            Count = 0;
LABEL_28:
            if (v31 >= Count)
              break;
            objc_msgSend(v22, "appendFormat:", CFSTR("\tsubEndpoint: %@\r"), CFArrayGetValueAtIndex(v30, v31++));
            if (v30)
              goto LABEL_26;
          }
        }
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
      }
      while (v24);
    }
    objc_msgSend(v68, "appendFormat:", CFSTR("[currentlyActivatingEndpointsInfo: %@]\n"), v22);
    v59 = *(void **)(v61 + 32);
    v33 = (void *)*((_QWORD *)v60 + 15);
    v34 = *MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    *(_OWORD *)cf = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v62 = v33;
    v65 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", cf, v88, 16);
    if (v65)
    {
      v63 = *(_QWORD *)v81;
      obja = (id)*MEMORY[0x1E0CA4348];
      v69 = *MEMORY[0x1E0CA4258];
      theArray = Mutable;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v81 != v63)
            objc_enumerationMutation(v62);
          v66 = v36;
          v37 = (const __CFDictionary *)*((_QWORD *)cf[1] + v36);
          v38 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v39 = FigCFDictionaryGetValue();
          v40 = FigCFDictionaryGetValue();
          FigCFDictionaryGetValue();
          FigCFDictionaryGetValue();
          v41 = (void *)CFDictionaryGetValue(v37, CFSTR("ActivatedEndpointsInfo_SubEndpointsInfo"));
          v78 = 0;
          v79 = 0;
          if (v39)
          {
            v42 = FigEndpointGetCMBaseObject();
            v43 = *(void (**)(uint64_t, id, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
            if (v43)
              v43(v42, obja, v34, &v79);
            v44 = FigEndpointGetCMBaseObject();
            v45 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48);
            if (v45)
              v45(v44, v69, v34, &v78);
          }
          v47 = v78;
          v46 = v79;
          UInt64 = FigCFNumberGetUInt64();
          objc_msgSend(v38, "appendFormat:", CFSTR("<endpoint %p endpointName: %@ endpointID %@ activationSeed %llu transportType: %@ endpointFeatures: %llu>\r"), v39, v46, v47, UInt64, v40, FigCFNumberGetUInt64());
          if (v79)
          {
            CFRelease(v79);
            v79 = 0;
          }
          if (v78)
          {
            CFRelease(v78);
            v78 = 0;
          }
          v76 = 0u;
          v77 = 0u;
          *(_OWORD *)v74 = 0u;
          v75 = 0u;
          v49 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", v74, &v84, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v75;
            do
            {
              for (k = 0; k != v50; ++k)
              {
                if (*(_QWORD *)v75 != v51)
                  objc_enumerationMutation(v41);
                v53 = FigCFDictionaryGetValue();
                FigCFDictionaryGetValue();
                v72 = 0;
                v73 = 0;
                if (v53)
                {
                  v54 = FigEndpointGetCMBaseObject();
                  v55 = *(void (**)(uint64_t, id, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
                  if (v55)
                    v55(v54, obja, v34, &v73);
                  v56 = FigEndpointGetCMBaseObject();
                  v57 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
                  if (v57)
                    v57(v56, v69, v34, &v72);
                }
                objc_msgSend(v38, "appendFormat:", CFSTR("\t<subEndpoint %p subEndpointName: %@ subEndpointID %@ activationSeed %llu>\r"), v53, v73, v72, FigCFNumberGetUInt64());
                if (v73)
                {
                  CFRelease(v73);
                  v73 = 0;
                }
                if (v72)
                  CFRelease(v72);
              }
              v50 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", v74, &v84, 16);
            }
            while (v50);
          }
          Mutable = theArray;
          CFArrayAppendValue(theArray, v38);

          v36 = v66 + 1;
        }
        while (v66 + 1 != v65);
        v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", cf, v88, 16);
      }
      while (v65);
    }
    v58 = (id)-[__CFArray componentsJoinedByString:](Mutable, "componentsJoinedByString:", CFSTR("\n"));
    if (Mutable)
      CFRelease(Mutable);
    objc_msgSend(v59, "appendFormat:", CFSTR("[activatedEndpointsInfo: %@]\n"), v58);
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[currentPickedRouteDescriptors: %@]\n"), *((_QWORD *)v60 + 16));
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[multiRouteSelectionSucceeded: %hhu]\n"), *((unsigned __int8 *)v60 + 136));
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[scaleFactorsForEndpoints: %@]\n"), *((_QWORD *)v60 + 18));
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[mainVolume: %f]\n"), *((float *)v60 + 38));
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[cachedScreenEndpointID: %@]\n"), *((_QWORD *)v60 + 20));
    objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[cachedAudioEndpointID: %@]\n"), *((_QWORD *)v60 + 21));
    return (int *)objc_msgSend(*(id *)(v61 + 32), "appendFormat:", CFSTR("[supportedOutputChannelLayouts: %@]\n"), *((_QWORD *)v60 + 26));
  }
  return result;
}

@end
