@implementation EstablishCurrentPrimaryItem

void __fpic_EstablishCurrentPrimaryItem_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  BOOL v5;
  const void *value;
  uint64_t v7;
  uint64_t FigBaseObject;
  uint64_t (*v9)(uint64_t, const __CFString *, uint64_t, CMTime *);
  int v10;
  BOOL v11;
  int v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t DerivedStorage;
  uint64_t PrimaryPlayerAndCopyWrapper;
  const void *v18;
  uint64_t v19;
  CFTypeRef v20;
  uint64_t (*v21)(const void *, CFTypeRef *);
  int v22;
  CFTypeRef v23;
  BOOL v24;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int (*v26)(CFTypeRef, const __CFString *, CMTime *, _QWORD, _QWORD);
  BOOL v27;
  unsigned int (*v28)(const void *, CFTypeRef *);
  uint64_t CMBaseObject;
  void (*v30)(uint64_t, const __CFString *, uint64_t, uint64_t);
  uint64_t v31;
  void (*v32)(uint64_t, const __CFString *, uint64_t, CFTypeRef *);
  uint64_t v33;
  void (*v34)(uint64_t, const __CFString *, uint64_t, CFTypeRef *);
  const void *v35;
  CFTypeRef v36;
  uint64_t v37;
  void (*v38)(uint64_t, const __CFString *, uint64_t, CFTypeRef *);
  const void *v39;
  CFTypeRef v40;
  NSObject *v41;
  unsigned int (*v42)(uint64_t, float *);
  uint64_t v43;
  uint64_t v44;
  const void *v45;
  const __CFArray *v46;
  CFIndex v47;
  CFIndex v48;
  __CFString *ValueAtIndex;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFArray *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int (*v57)(uint64_t, CFTypeRef *);
  __int16 *v58;
  __int16 v59;
  uint64_t v60;
  int v61;
  NSObject *v62;
  unsigned int v63;
  unsigned int v64;
  CMTimeFlags v65;
  float v66;
  CFTypeRef cf;
  CFTypeRef v68;
  CFTypeRef v69;
  CFTypeRef v70;
  CMTime v71;
  CFTypeRef v72[2];
  uint64_t v73;
  CMTime v74[5];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v2 = *(const void **)(a1 + 40);
  v3 = *(const void **)(*(_QWORD *)(a1 + 48) + 152);
  if (v2 != v3 && v3 != 0)
  {
    fpic_DisengageFromPrimaryItem(*(const void **)(a1 + 56), *(_QWORD *)(a1 + 64), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    v2 = *(const void **)(a1 + 40);
    v3 = *(const void **)(*(_QWORD *)(a1 + 48) + 152);
  }
  if (v2)
    v5 = v2 == v3;
  else
    v5 = 1;
  if (v5)
    goto LABEL_101;
  value = (const void *)*MEMORY[0x1E0C9AE40];
  v74[0].value = *MEMORY[0x1E0C9AE40];
  v7 = *MEMORY[0x1E0C9AE00];
  FigBaseObject = FigPlaybackItemGetFigBaseObject(v2);
  v9 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48);
  if (!v9
    || ((v10 = v9(FigBaseObject, CFSTR("BasicsReadyForInspection"), v7, v74), value = (const void *)v74[0].value, !v10)
      ? (v11 = *MEMORY[0x1E0C9AE50] == v74[0].value)
      : (v11 = 0),
        !v11))
  {
    v12 = 0;
    if (!value)
      goto LABEL_17;
    goto LABEL_16;
  }
  v72[0] = 0;
  v21 = *(uint64_t (**)(const void *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
  if (v21)
  {
    v22 = v21(v2, v72);
    v23 = v72[0];
    if (v22)
      v24 = 1;
    else
      v24 = v72[0] == 0;
    if (v24)
    {
      v12 = 0;
    }
    else
    {
      LODWORD(v71.value) = 0;
      v26 = *(unsigned int (**)(CFTypeRef, const __CFString *, CMTime *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (v26)
      {
        if (v26(v23, CFSTR("MediaSelectionArray"), &v71, 0, 0))
          v27 = 0;
        else
          v27 = LODWORD(v71.value) == 2;
        v12 = v27;
      }
      else
      {
        v12 = 0;
      }
      v23 = v72[0];
    }
    if (v23)
      CFRelease(v23);
  }
  else
  {
    v12 = 0;
  }
  value = (const void *)v74[0].value;
  if (v74[0].value)
LABEL_16:
    CFRelease(value);
LABEL_17:
  v2 = *(const void **)(a1 + 40);
  if (v12)
  {
    v13 = *(const void **)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    v71.value = 0;
    PrimaryPlayerAndCopyWrapper = fpic_GetPrimaryPlayerAndCopyWrapper((uint64_t)v13, &v71);
    v69 = 0;
    v70 = 0;
    cf = 0;
    v68 = 0;
    v66 = 1.0;
    v18 = *(const void **)(DerivedStorage + 152);
    if (v18 != v2)
    {
      v19 = PrimaryPlayerAndCopyWrapper;
      if (v18)
        fpic_DisengageFromPrimaryItem(v13, v14, (CFTypeRef *)(v15 + 24));
      *(_QWORD *)(DerivedStorage + 1020) = 0;
      *(_OWORD *)(DerivedStorage + 1000) = 0u;
      if (v2)
        v20 = CFRetain(v2);
      else
        v20 = 0;
      *(_QWORD *)(DerivedStorage + 152) = v20;
      if (dword_1EE2A33C8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v28 = *(unsigned int (**)(const void *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
      if (v28 && !v28(v2, &cf) && cf)
      {
        CMBaseObject = FigAssetGetCMBaseObject(cf);
        v30 = *(void (**)(uint64_t, const __CFString *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
        if (v30)
          v30(CMBaseObject, CFSTR("assetProperty_InstanceUUID"), v7, DerivedStorage + 160);
        if (cf)
          CFRelease(cf);
      }
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      v31 = FigPlaybackItemGetFigBaseObject(v2);
      v32 = *(void (**)(uint64_t, const __CFString *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
      if (v32)
        v32(v31, CFSTR("Timebase"), v7, &v70);
      v33 = FigPlaybackItemGetFigBaseObject(v2);
      v34 = *(void (**)(uint64_t, const __CFString *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
      if (v34)
        v34(v33, CFSTR("SelectedMediaArray"), v7, &v69);
      v35 = *(const void **)(DerivedStorage + 984);
      v36 = v69;
      *(_QWORD *)(DerivedStorage + 984) = v69;
      if (v36)
        CFRetain(v36);
      if (v35)
        CFRelease(v35);
      v37 = FigPlaybackItemGetFigBaseObject(v2);
      v38 = *(void (**)(uint64_t, const __CFString *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
      if (v38)
        v38(v37, CFSTR("CoordinationIdentifier"), v7, &v68);
      v39 = *(const void **)(DerivedStorage + 168);
      v40 = v68;
      *(_QWORD *)(DerivedStorage + 168) = v68;
      if (v40)
        CFRetain(v40);
      if (v39)
        CFRelease(v39);
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      if (v70)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        FigNotificationCenterAddWeakListener();
        CMNotificationCenterGetDefaultLocalCenter();
        FigNotificationCenterAddWeakListener();
        *(_QWORD *)(DerivedStorage + 1048) = CFRetain(v70);
        CFRelease(v70);
      }
      else
      {
        v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v42 = *(unsigned int (**)(uint64_t, float *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
      if (v42 && !v42(v19, &v66) && v66 > 0.0)
        *(float *)(DerivedStorage + 712) = v66;
      v43 = *(_QWORD *)(DerivedStorage + 152);
      CMBaseObjectGetDerivedStorage();
      v44 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v44)
      {
        v45 = (const void *)v44;
        v46 = (const __CFArray *)FigCFDictionaryCopyArrayOfKeys();
        v47 = 0;
        while (1)
        {
          v48 = v46 ? CFArrayGetCount(v46) : 0;
          if (v47 >= v48)
            break;
          ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(v46, v47);
          v50 = CMBaseObjectGetDerivedStorage();
          v51 = 0;
          if (ValueAtIndex && ValueAtIndex != CFSTR("DummyItem"))
            v51 = (*(uint64_t (**)(const void *, const void *, __CFString *))(v50 + 72))(v13, v45, ValueAtIndex);
          ++v47;
          if (v51 == v43)
          {
            v52 = CMBaseObjectGetDerivedStorage();
            v53 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(v52 + 176), ValueAtIndex);
            if (!v46)
              goto LABEL_83;
            goto LABEL_82;
          }
        }
        ValueAtIndex = 0;
        v53 = 0;
        if (!v46)
          goto LABEL_83;
LABEL_82:
        CFRelease(v46);
LABEL_83:
        CFRelease(v45);
        if (v53 && CFArrayGetCount(v53) >= 1)
        {
          FigCFArrayAppendArray();
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(DerivedStorage + 176), ValueAtIndex);
          if (dword_1EE2A33C8)
          {
            v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          fpic_PostNotification(DerivedStorage, (uint64_t)CFSTR("fpiEventsDidChange"), v13, 0);
        }
      }
      fpic_UpdatePlaybackItemEventList((uint64_t)v13, *(_QWORD *)(DerivedStorage + 152));
      fpic_ReplaceNetworkURLsWithOfflineURLs(v13, v14);
      if (v68)
        CFRelease(v68);
    }
    if (v69)
      CFRelease(v69);
    if (v71.value)
      CFRelease((CFTypeRef)v71.value);
    fpic_SwapToInterstitialPlayerLayerIfPrerollDetected(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v2 = *(const void **)(a1 + 40);
  }
LABEL_101:
  if (v2)
    CFRelease(v2);
  v55 = *(_QWORD *)(a1 + 48);
  v56 = *(_QWORD *)(v55 + 152);
  if (v56)
  {
    if (!*(_BYTE *)(v55 + 974))
    {
      *(_OWORD *)v72 = *MEMORY[0x1E0CA2E18];
      v73 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v57 = *(unsigned int (**)(uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v57)
      {
        if (!v57(v56, v72) && (BYTE4(v72[1]) & 1) != 0)
        {
          if ((BYTE4(v72[1]) & 0x10) != 0)
          {
            memset(v74, 0, 24);
            fpic_GetSeekableRange(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 152), 0, v74, &v71);
            v60 = *(_QWORD *)(a1 + 48);
            if ((v74[0].flags & 1) == 0)
            {
              v61 = *(unsigned __int8 *)(v60 + 974);
LABEL_115:
              if (v61 && dword_1EE2A33C8 >= 2)
              {
                LODWORD(v70) = 0;
                LOBYTE(v69) = 0;
                v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v63 = v70;
                if (os_log_type_enabled(v62, (os_log_type_t)v69))
                  v64 = v63;
                else
                  v64 = v63 & 0xFFFFFFFE;
                if (v64)
                {
                  v65 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 973);
                  LODWORD(v71.value) = 136315394;
                  *(CMTimeValue *)((char *)&v71.value + 4) = (CMTimeValue)"fpic_EstablishCurrentPrimaryItem_block_invoke";
                  LOWORD(v71.flags) = 1024;
                  *(CMTimeFlags *)((char *)&v71.flags + 2) = v65;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              return;
            }
            v58 = (__int16 *)(v60 + 973);
            v59 = 257;
          }
          else
          {
            v58 = (__int16 *)(*(_QWORD *)(a1 + 48) + 973);
            v59 = 256;
          }
          *v58 = v59;
          v61 = 1;
          goto LABEL_115;
        }
      }
    }
  }
}

@end
