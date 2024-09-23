@implementation FigEndpointCreateCentral

void __FigEndpointCreateCentral_block_invoke(uint64_t a1, __int128 *a2, uint64_t *a3, __int128 *a4, int a5)
{
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  uint64_t DerivedStorage;
  uint64_t v17;
  uint64_t v18;
  uint64_t CMBaseObject;
  void (*v20)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v21;
  _BOOL4 v22;
  int v23;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v25;
  unsigned int v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  int v31;
  BOOL v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  __CFString **v37;
  uint64_t v38;
  NSObject *v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  int v43;
  CFPropertyListRef v44;
  BOOL v45;
  NSObject *v46;
  unsigned int v47;
  unsigned int v48;
  NSObject *v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  int v53;
  int v54;
  void *v55;
  NSObject *v56;
  unsigned int v57;
  unsigned int v58;
  int v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  unsigned int v64;
  unsigned int v65;
  int v66;
  int v67;
  NSObject *v68;
  unsigned int v69;
  unsigned int v70;
  NSObject *v71;
  unsigned int v72;
  unsigned int v73;
  NSObject *v74;
  unsigned int v75;
  unsigned int v76;
  uint64_t v78;
  const void *v79;
  const void *v80;
  CFIndex Count;
  CFIndex v82;
  CFIndex v83;
  uint64_t v84;
  const void *ValueAtIndex;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t, _QWORD, _OWORD *);
  const void *v88;
  const void *v89;
  CFIndex v90;
  CFIndex v91;
  CFIndex v92;
  uint64_t v93;
  const void *v94;
  uint64_t v95;
  void (*v96)(uint64_t, uint64_t, _QWORD, _OWORD *);
  __int16 v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  const void *v102;
  const void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  CFTypeRef cf;
  __int128 v110;
  __int128 v111;
  _OWORD v112[2];
  CFTypeRef v113[2];
  __int128 v114;
  _BYTE v115[28];
  int v116;
  uint64_t v117;
  _OWORD v118[2];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v8 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v8)
  {
    v9 = (const void *)v8;
    v105 = *a2;
    v106 = a2[1];
    v10 = *a3;
    v11 = *((_DWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 3);
    v104 = *((_OWORD *)a3 + 1);
    v13 = a4[1];
    v110 = *a4;
    v111 = v13;
    v112[0] = a4[2];
    *(_OWORD *)((char *)v112 + 12) = *(__int128 *)((char *)a4 + 44);
    v14 = *((_DWORD *)a4 + 15);
    v15 = *((_QWORD *)a4 + 8);
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!DerivedStorage)
      goto LABEL_231;
    v17 = DerivedStorage;
    cf = 0;
    if (a5)
    {
      central_HandleCarModeStateChange_cachedMainAudioEntity = 0;
      *(_BYTE *)(DerivedStorage + 3) = 1;
    }
    v18 = *MEMORY[0x1E0C9AE00];
    CMBaseObject = FigEndpointGetCMBaseObject();
    v20 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v20)
    {
      v20(CMBaseObject, *MEMORY[0x1E0CA4480], v18, &cf);
      v20 = (void (*)(uint64_t, _QWORD, uint64_t, CFTypeRef *))cf;
    }
    v21 = *MEMORY[0x1E0C9AE50];
    v22 = v20 == (void (*)(uint64_t, _QWORD, uint64_t, CFTypeRef *))*MEMORY[0x1E0C9AE50];
    v118[0] = v105;
    v118[1] = v106;
    *(_QWORD *)&v107 = v10;
    *((_QWORD *)&v107 + 1) = __PAIR64__(v12, v11);
    v98 = v12;
    v108 = v104;
    *(_OWORD *)v113 = v110;
    v114 = v111;
    *(_OWORD *)v115 = v112[0];
    *(_OWORD *)&v115[12] = *(_OWORD *)((char *)v112 + 12);
    v116 = v14;
    v117 = v15;
    v23 = FigStarkModeChangeGetActions(v118, &v107, (int *)v113, v22);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (a5 && (v23 & 0x10000) != 0)
    {
      if (dword_1EE2B3FA8)
      {
        LODWORD(v107) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v25 = v107;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT))
          v26 = v25;
        else
          v26 = v25 & 0xFFFFFFFE;
        if (v26)
        {
          LODWORD(v118[0]) = 136315138;
          *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigRoutingManagerSendCarPlayDisableBluetoothCommand();
      *(_BYTE *)(v17 + 1) = 1;
      CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("MakeStarkPortRoutableForPlayingSession"), v21);
      CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("NowPlayingAppShouldResumeForCarPlay"), v21);
    }
    if (a5 && (v23 & 1) != 0)
    {
      if (dword_1EE2B3FA8)
      {
        LODWORD(v107) = 0;
        v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v28 = v107;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          v29 = v28;
        else
          v29 = v28 & 0xFFFFFFFE;
        if (v29)
        {
          LODWORD(v118[0]) = 136315138;
          *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v113[0] = 0;
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToBorrowStarkMainAudio"), v18, (uint64_t)v113))v30 = 0;
      else
        v30 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToTakeStarkMainAudio"), v18, (uint64_t)v113))v31 = 0;
      else
        v31 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      v32 = (v30 | v31) != 0;
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("CurrentPlayingSessionIsRoutedViaCarBT"), v18, (uint64_t)v113))v33 = 0;
      else
        v33 = FigCFEqual();
      v34 = v32;
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      if (v14 != 1)
      {
        FigRoutingManagerSendCarPlayDisableBluetoothCommand();
        *(_BYTE *)(v17 + 1) = 1;
        if (v33)
        {
          v36 = *(void **)(v17 + 16);
          v37 = kCMSessionGlobalProperty_MakeStarkPortRoutableForPlayingSession;
        }
        else
        {
          if (v32)
            goto LABEL_59;
          v36 = *(void **)(v17 + 16);
          v37 = kCMSessionGlobalProperty_NowPlayingAppShouldResumeForCarPlay;
        }
        CMSessionSetProperty(v36, (uint64_t)*v37, v21);
        goto LABEL_59;
      }
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("CurrentPhoneCallIsRoutedViaCarBT"), v18, (uint64_t)v113))v35 = 0;
      else
        v35 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      if (v35)
      {
        FigRoutingManagerSendCarPlayDisableBluetoothCommand();
        v34 = 1;
        *(_BYTE *)(v17 + 1) = 1;
        CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("MakeStarkPortRoutableForPlayingSession"), v21);
      }
      else
      {
        CMSessionBeginInterruption(*(void **)(v17 + 16));
      }
      v38 = *MEMORY[0x1E0C9AE40];
      CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("NowPlayingAppShouldResumeForCarPlay"), *MEMORY[0x1E0C9AE40]);
      if (!v34)
      {
        CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("NowPlayingAppShouldResumeForCarPlay"), v38);
        CMSessionBeginInterruption(*(void **)(v17 + 16));
      }
    }
LABEL_59:
    if (!a5 || (v23 & 0x20000) == 0)
      goto LABEL_87;
    if (dword_1EE2B3FA8)
    {
      LODWORD(v107) = 0;
      v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v40 = v107;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        v41 = v40;
      else
        v41 = v40 & 0xFFFFFFFE;
      if (v41)
      {
        LODWORD(v118[0]) = 136315138;
        *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v113[0] = 0;
    if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToTakeStarkMainAudio"), v18, (uint64_t)v113))v42 = 0;
    else
      v42 = FigCFEqual();
    if (v113[0])
    {
      CFRelease(v113[0]);
      v113[0] = 0;
    }
    if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("CurrentPlayingSessionIsRoutedViaCarBT"), v18, (uint64_t)v113))v43 = 0;
    else
      v43 = FigCFEqual();
    if (v113[0])
    {
      CFRelease(v113[0]);
      v113[0] = 0;
    }
    FigRoutingManagerSendCarPlayDisableBluetoothCommand();
    *(_BYTE *)(v17 + 1) = 1;
    if (v43)
    {
      CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("MakeStarkPortRoutableForPlayingSession"), v21);
    }
    else if (!v42)
    {
      goto LABEL_82;
    }
    CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("NowPlayingAppShouldResumeForCarPlay"), *MEMORY[0x1E0C9AE40]);
    LOBYTE(v42) = 1;
LABEL_82:
    CMSessionBeginInterruption(*(void **)(v17 + 16));
    v44 = CMSMNP_CopyNowPlayingAppWasPlayingUponCarPlayDisconnectFromDisk();
    v45 = (v42 & 1) == 0 && FigCFEqual() != 0;
    *(_BYTE *)(v17 + 2) = v45;
    if (v44)
      CFRelease(v44);
LABEL_87:
    if (a5 && (v23 & 2) != 0)
    {
      if (dword_1EE2B3FA8)
      {
        LODWORD(v107) = 0;
        v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v47 = v107;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          v48 = v47;
        else
          v48 = v47 & 0xFFFFFFFE;
        if (v48)
        {
          LODWORD(v118[0]) = 136315138;
          *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigRoutingManagerSendCarPlayDisableBluetoothCommand();
      *(_BYTE *)(v17 + 1) = 1;
      CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("NowPlayingAppShouldResumeForCarPlay"), *MEMORY[0x1E0C9AE40]);
      CMSessionBeginInterruption(*(void **)(v17 + 16));
    }
    if (a5 && (v23 & 4) != 0)
    {
      if (dword_1EE2B3FA8)
      {
        LODWORD(v107) = 0;
        v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v50 = v107;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          v51 = v50;
        else
          v51 = v50 & 0xFFFFFFFE;
        if (v51)
        {
          LODWORD(v118[0]) = 136315138;
          *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v113[0] = 0;
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToBorrowStarkMainAudio"), v18, (uint64_t)v113))v52 = 0;
      else
        v52 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToTakeStarkMainAudio"), v18, (uint64_t)v113))v53 = 0;
      else
        v53 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("CurrentPlayingSessionIsRoutedViaCarBT"), v18, (uint64_t)v113))v54 = 0;
      else
        v54 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      FigRoutingManagerSendCarPlayDisableBluetoothCommand();
      *(_BYTE *)(v17 + 1) = 1;
      v55 = *(void **)(v17 + 16);
      if (v54 || v52 || v53)
      {
        CMSessionSetProperty(v55, (uint64_t)CFSTR("MakeStarkPortRoutableForPlayingSession"), v21);
        if ((v23 & 0x10) == 0)
          goto LABEL_160;
        goto LABEL_133;
      }
      CMSessionSetProperty(v55, (uint64_t)CFSTR("NowPlayingAppShouldResumeForCarPlay"), *MEMORY[0x1E0C9AE40]);
      CMSessionBeginInterruption(*(void **)(v17 + 16));
    }
    else if (!a5 && (v23 & 8) != 0)
    {
      if (FigEndpointCentralEntityHoldsResource((uint64_t)v9, (uint64_t)CFSTR("Car"), (uint64_t)CFSTR("MainAudio")))CMSessionBeginInterruption(*(void **)(v17 + 16));
      if (!*(_BYTE *)(v17 + 1))
      {
        FigRoutingManagerSendCarPlayDisableBluetoothCommand();
        *(_BYTE *)(v17 + 1) = 1;
        if ((v23 & 0x10) == 0)
          goto LABEL_160;
        goto LABEL_133;
      }
    }
    if ((v23 & 0x10) == 0)
      goto LABEL_160;
LABEL_133:
    if (dword_1EE2B3FA8)
    {
      LODWORD(v107) = 0;
      v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v57 = v107;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        v58 = v57;
      else
        v58 = v57 & 0xFFFFFFFE;
      if (v58)
      {
        LODWORD(v118[0]) = 136315138;
        *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSessionEndInterruption(*(void **)(v17 + 16), CFSTR("resumable.carMainAudioUnborrowed"));
    if (!*(_BYTE *)(v17 + 1))
    {
      FigRoutingManagerSendCarPlayDisableBluetoothCommand();
      *(_BYTE *)(v17 + 1) = 1;
    }
    *(_QWORD *)&v107 = 0;
    if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToBorrowStarkMainAudio"), v18, (uint64_t)&v107))v59 = 0;
    else
      v59 = FigCFEqual();
    if ((_QWORD)v107)
    {
      CFRelease((CFTypeRef)v107);
      *(_QWORD *)&v107 = 0;
    }
    if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToTakeStarkMainAudio"), v18, (uint64_t)&v107))v60 = 0;
    else
      v60 = FigCFEqual();
    if ((_QWORD)v107)
    {
      CFRelease((CFTypeRef)v107);
      *(_QWORD *)&v107 = 0;
    }
    if (v59 | v60)
    {
      v61 = *MEMORY[0x1E0C9AE40];
    }
    else
    {
      if (!*(_BYTE *)(v17 + 2))
        goto LABEL_160;
      v61 = v21;
      if (dword_1EE2B3FA8)
      {
        v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v61 = v21;
      }
    }
    CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("NowPlayingAppShouldResumeForCarPlay"), v61);
    *(_BYTE *)(v17 + 2) = 0;
LABEL_160:
    if ((v23 & 0x20) != 0)
    {
      if (dword_1EE2B3FA8)
      {
        LODWORD(v107) = 0;
        v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v64 = v107;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          v65 = v64;
        else
          v65 = v64 & 0xFFFFFFFE;
        if (v65)
        {
          LODWORD(v118[0]) = 136315138;
          *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v113[0] = 0;
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToBorrowStarkMainAudio"), v18, (uint64_t)v113))v66 = 0;
      else
        v66 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      if (CMSessionCopyProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("iOSWillRequestToTakeStarkMainAudio"), v18, (uint64_t)v113))v67 = 0;
      else
        v67 = FigCFEqual();
      if (v113[0])
      {
        CFRelease(v113[0]);
        v113[0] = 0;
      }
      if (v67 | v66)
        CMSessionEndInterruption(*(void **)(v17 + 16), CFSTR("resumable.carMainAudioUnborrowed"));
      if (!*(_BYTE *)(v17 + 1))
      {
        FigRoutingManagerSendCarPlayDisableBluetoothCommand();
        *(_BYTE *)(v17 + 1) = 1;
      }
    }
    if ((v23 & 0x4000) != 0)
    {
      CMSessionMgrInterruptVoiceAssistantIfCarSupportsAuxStream();
      if ((v23 & 0x800) == 0)
      {
LABEL_184:
        if ((v23 & 0x1000) == 0)
          goto LABEL_185;
        goto LABEL_196;
      }
    }
    else if ((v23 & 0x800) == 0)
    {
      goto LABEL_184;
    }
    if (dword_1EE2B3FA8)
    {
      LODWORD(v107) = 0;
      v68 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v69 = v107;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        v70 = v69;
      else
        v70 = v69 & 0xFFFFFFFE;
      if (v70)
      {
        LODWORD(v118[0]) = 136315138;
        *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("MakeStarkPortRoutableForPlayingSession"), v21);
    if ((v23 & 0x1000) == 0)
    {
LABEL_185:
      if ((v23 & 0x8000) == 0)
        goto LABEL_214;
      goto LABEL_204;
    }
LABEL_196:
    if (dword_1EE2B3FA8)
    {
      LODWORD(v107) = 0;
      v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v72 = v107;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        v73 = v72;
      else
        v73 = v72 & 0xFFFFFFFE;
      if (v73)
      {
        LODWORD(v118[0]) = 136315138;
        *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("MakeStarkPortRoutableForPhoneCall"), v21);
    if ((v23 & 0x8000) == 0)
    {
LABEL_214:
      if (v11 == 1 && v98 == 2)
        v78 = v21;
      else
        v78 = *MEMORY[0x1E0C9AE40];
      CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("StarkMainAudioIsOwnedByiOSButBorrowedByCar"), v78);
      if (v11 != central_HandleCarModeStateChange_cachedMainAudioEntity)
      {
        if (v11 == 2 || v11 == 1)
        {
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterPostNotification();
        }
        central_HandleCarModeStateChange_cachedMainAudioEntity = v11;
      }
      if ((v23 & 0x40) != 0)
      {
        v79 = (const void *)FigEndpointUtility_CopyEndpointType();
        v80 = (const void *)FigEndpointUtility_CopyEndpointTransportType();
        v113[0] = 0;
        FigEndpointCopyStreamsForTypeAndSubType();
        if (v113[0])
        {
          v97 = v23;
          v99 = v21;
          v102 = v9;
          Count = CFArrayGetCount((CFArrayRef)v113[0]);
          if (Count >= 1)
          {
            v82 = Count;
            v83 = 0;
            v84 = *MEMORY[0x1E0CA47C8];
            do
            {
              *(_QWORD *)&v118[0] = 0;
              ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v113[0], v83);
              v86 = FigEndpointStreamGetCMBaseObject();
              v87 = *(void (**)(uint64_t, uint64_t, _QWORD, _OWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
              if (v87)
                v87(v86, v84, 0, v118);
              if (FigCFEqual())
                CMScreenSuspendStream(ValueAtIndex, v79, v80, CFSTR("ModeChange:CarHasScreen"));
              if (*(_QWORD *)&v118[0])
                CFRelease(*(CFTypeRef *)&v118[0]);
              ++v83;
            }
            while (v82 != v83);
          }
          v21 = v99;
          v9 = v102;
          LOWORD(v23) = v97;
          if (v113[0])
            CFRelease(v113[0]);
        }
        if (v79)
          CFRelease(v79);
        if (v80)
          CFRelease(v80);
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
        if ((v23 & 0x80) == 0)
        {
LABEL_227:
          if ((v23 & 0x2000) == 0)
            goto LABEL_228;
          goto LABEL_267;
        }
      }
      else if ((v23 & 0x80) == 0)
      {
        goto LABEL_227;
      }
      v88 = (const void *)FigEndpointUtility_CopyEndpointType();
      v89 = (const void *)FigEndpointUtility_CopyEndpointTransportType();
      v113[0] = 0;
      FigEndpointCopyStreamsForTypeAndSubType();
      if (v113[0])
      {
        v100 = v21;
        v103 = v9;
        v90 = CFArrayGetCount((CFArrayRef)v113[0]);
        if (v90 >= 1)
        {
          v91 = v90;
          v92 = 0;
          v93 = *MEMORY[0x1E0CA47C8];
          do
          {
            *(_QWORD *)&v118[0] = 0;
            v94 = CFArrayGetValueAtIndex((CFArrayRef)v113[0], v92);
            v95 = FigEndpointStreamGetCMBaseObject();
            v96 = *(void (**)(uint64_t, uint64_t, _QWORD, _OWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
            if (v96)
              v96(v95, v93, 0, v118);
            if (FigCFEqual())
              CMScreenResumeStream(v94, v88, v89, CFSTR("ModeChange:iOSHasScreen"));
            if (*(_QWORD *)&v118[0])
              CFRelease(*(CFTypeRef *)&v118[0]);
            ++v92;
          }
          while (v91 != v92);
        }
        v21 = v100;
        v9 = v103;
        if (v113[0])
          CFRelease(v113[0]);
      }
      if (v88)
        CFRelease(v88);
      if (v89)
        CFRelease(v89);
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
      if ((v23 & 0x2000) == 0)
      {
LABEL_228:
        if ((v23 & 0x100) == 0)
          goto LABEL_229;
        goto LABEL_268;
      }
LABEL_267:
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
      if ((v23 & 0x100) == 0)
      {
LABEL_229:
        if ((v23 & 0x400) != 0)
LABEL_230:
          CMSessionSetProperty(*(void **)(v17 + 16), (uint64_t)CFSTR("CarSpeechStateChanged"), v21);
LABEL_231:
        CFRelease(v9);
        return;
      }
LABEL_268:
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
      if ((v23 & 0x400) == 0)
        goto LABEL_231;
      goto LABEL_230;
    }
LABEL_204:
    if (dword_1EE2B3FA8)
    {
      LODWORD(v107) = 0;
      v74 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v75 = v107;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        v76 = v75;
      else
        v76 = v75 & 0xFFFFFFFE;
      if (v76)
      {
        LODWORD(v118[0]) = 136315138;
        *(_QWORD *)((char *)v118 + 4) = "central_HandleCarModeStateChange";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!a5 && !*(_BYTE *)(v17 + 1))
    {
      FigRoutingManagerSendCarPlayDisableBluetoothCommand();
      *(_BYTE *)(v17 + 1) = 1;
    }
    goto LABEL_214;
  }
}

@end
