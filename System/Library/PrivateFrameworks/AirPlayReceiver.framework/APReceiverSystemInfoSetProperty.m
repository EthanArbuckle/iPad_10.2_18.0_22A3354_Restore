@implementation APReceiverSystemInfoSetProperty

void __APReceiverSystemInfoSetProperty_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  __CFString *v3;
  const __CFString *v4;
  const void *v5;
  int v6;
  CFTypeID v7;
  CFTypeID v8;
  CFTypeID v9;
  const void *v10;
  double v11;
  CFTypeID v12;
  int Value;
  char v14;
  CFTypeID v15;
  const __CFString *v16;
  const void *SInt32;
  const void *v18;
  const void *v19;
  const void *v20;
  CFTypeID v21;
  int v22;
  char v23;
  CFTypeID v24;
  int v25;
  int v26;
  CFTypeID v27;
  int v28;
  char v29;
  CFTypeID v30;
  int v31;
  char v32;
  NSObject *v33;
  dispatch_source_t v34;
  NSObject *v35;
  dispatch_time_t v36;
  CFTypeID v37;
  int v38;
  char v39;
  CFTypeID v40;
  int v41;
  char v42;
  CFTypeID v43;
  CGSize *v44;
  CFTypeID v45;
  CFTypeID v46;
  CFTypeID v47;
  CFTypeID v48;
  int v49;
  char v50;
  CFTypeID v51;
  int v52;
  int v53;
  int v54;
  CFTypeID v55;
  const void *v56;
  CGSize size;

  v2 = a1[5];
  v3 = (__CFString *)a1[6];
  v4 = (const __CFString *)a1[7];
  if (gLogCategory_APReceiverSystemInfo <= 30
    && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (CFEqual(v3, CFSTR("Passcode")))
  {
    if (!v4)
    {
      LODWORD(v5) = 0;
      *(_BYTE *)(v2 + 434) = 0;
      goto LABEL_28;
    }
    LODWORD(v5) = -72021;
LABEL_110:
    APSLogErrorAt();
    goto LABEL_28;
  }
  if (!CFEqual(v3, CFSTR("Password")))
  {
    if (CFEqual(v3, CFSTR("DeviceName")))
    {
      if (v4)
      {
        size.width = 0.0;
        LODWORD(v5) = CFStringCopyUTF8CString();
        if (!(_DWORD)v5)
        {
          CUSetSystemName();
          sysInfo_setDeviceName(v2);
          free(*(void **)&size.width);
          goto LABEL_28;
        }
        goto LABEL_110;
      }
      goto LABEL_101;
    }
    if (CFEqual(v3, CFSTR("VolumeDB")))
    {
      if (!v4 || (v7 = CFGetTypeID(v4), v7 != CFNumberGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      if (gLogCategory_APReceiverSystemInfo <= 40
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFGetDouble();
      LODWORD(v5) = 0;
      *(float *)&v11 = v11;
      *(_DWORD *)(v2 + 688) = LODWORD(v11);
      goto LABEL_28;
    }
    if (CFEqual(v3, CFSTR("IsMuted")))
    {
      if (!v4 || (v8 = CFGetTypeID(v4), v8 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      if (gLogCategory_APReceiverSystemInfo <= 40
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      LODWORD(v5) = 0;
      *(_BYTE *)(v2 + 713) = *MEMORY[0x24BDBD270] == (_QWORD)v4;
      goto LABEL_28;
    }
    if (CFEqual(v3, CFSTR("DenyInterruptions")))
    {
      if (v4)
      {
        v9 = CFGetTypeID(v4);
        if (v9 != CFBooleanGetTypeID())
        {
          LODWORD(v5) = -72021;
          goto LABEL_110;
        }
      }
      if (!FigCFEqual())
      {
        v10 = *(const void **)(v2 + 88);
        *(_QWORD *)(v2 + 88) = v4;
        if (v4)
          CFRetain(v4);
        if (v10)
          CFRelease(v10);
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
      }
      goto LABEL_101;
    }
    if (CFEqual(v3, CFSTR("SupportsSenderUIEvents")))
    {
      if (!v4 || (v12 = CFGetTypeID(v4), v12 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      Value = CFBooleanGetValue((CFBooleanRef)v4);
      if (*(unsigned __int8 *)(v2 + 683) != Value)
      {
        v14 = Value;
        if (gLogCategory_APReceiverSystemInfo <= 50
          && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        LODWORD(v5) = 0;
        *(_BYTE *)(v2 + 683) = v14;
        goto LABEL_28;
      }
      goto LABEL_101;
    }
    if (v3 == CFSTR("VolumeControlTypeEx") || v3 && CFEqual(v3, CFSTR("VolumeControlTypeEx")))
    {
      if (!v4 || (v15 = CFGetTypeID(v4), v15 != CFNumberGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      v16 = *(const __CFString **)(v2 + 704);
      if (v16 == v4 || v16 && CFEqual(v16, v4))
        goto LABEL_101;
      FigCFNumberGetSInt32();
      APSVolumeControlTypeFromEx();
      SInt32 = (const void *)FigCFNumberCreateSInt32();
      if (!SInt32)
      {
        APSLogErrorAt();
        LODWORD(v5) = -6728;
        goto LABEL_28;
      }
      v18 = SInt32;
      v19 = *(const void **)(v2 + 696);
      *(_QWORD *)(v2 + 696) = SInt32;
      CFRetain(SInt32);
      if (v19)
        CFRelease(v19);
      v20 = *(const void **)(v2 + 704);
      *(_QWORD *)(v2 + 704) = v4;
      CFRetain(v4);
      if (v20)
        CFRelease(v20);
LABEL_69:
      CFRelease(v18);
      goto LABEL_100;
    }
    if (CFEqual(v3, CFSTR("ReceiverDeviceIsPlaying")))
    {
      if (!v4 || (v21 = CFGetTypeID(v4), v21 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      v22 = CFBooleanGetValue((CFBooleanRef)v4);
      if (*(unsigned __int8 *)(v2 + 226) == v22)
        goto LABEL_101;
      v23 = v22;
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v2 + 226) = v23;
LABEL_100:
      sysInfo_updateAdvertiserInfoAndNotify(v2, (uint64_t)CFSTR("AdvertisingParameterChanged"));
      goto LABEL_101;
    }
    if (CFEqual(v3, CFSTR("ReceiverSessionIsActive")))
    {
      if (!v4 || (v24 = CFGetTypeID(v4), v24 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      v25 = CFBooleanGetValue((CFBooleanRef)v4);
      if (*(unsigned __int8 *)(v2 + 225) == v25)
        goto LABEL_101;
      v26 = v25;
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v2 + 225) = v26;
      if (!*(_BYTE *)(v2 + 130))
        sysInfo_updateNonMRSourcedSilentPrimaryStatusIfNeeded(v2);
      sysInfo_updateAPGroupInfo(v2);
      if (*(_BYTE *)(v2 + 480))
      {
        v33 = *(NSObject **)(v2 + 552);
        if (v26)
        {
          if (v33)
          {
            dispatch_source_cancel(*(dispatch_source_t *)(v2 + 552));
            dispatch_release(v33);
            *(_QWORD *)(v2 + 552) = 0;
          }
        }
        else
        {
          if (v33)
          {
            dispatch_source_cancel(*(dispatch_source_t *)(v2 + 552));
            dispatch_release(v33);
            *(_QWORD *)(v2 + 552) = 0;
          }
          v34 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(v2 + 16));
          *(_QWORD *)(v2 + 552) = v34;
          if (v34)
          {
            CFRetain((CFTypeRef)v2);
            dispatch_set_context(*(dispatch_object_t *)(v2 + 552), (void *)v2);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v2 + 552), (dispatch_function_t)sysInfo_updatePINTimerFired);
            dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v2 + 552), (dispatch_function_t)sysInfo_updatePINTimerCanceled);
            v35 = *(NSObject **)(v2 + 552);
            v36 = dispatch_time(0, 30000000000);
            dispatch_source_set_timer(v35, v36, 0x7FFFFFFFFFFFFFFFuLL, 0x3B9ACA00uLL);
            dispatch_resume(*(dispatch_object_t *)(v2 + 552));
          }
          else
          {
            APSLogErrorAt();
          }
        }
      }
      goto LABEL_100;
    }
    if (CFEqual(v3, CFSTR("SecondHopEligibleSenderSessionIsActive")))
    {
      if (!v4 || (v27 = CFGetTypeID(v4), v27 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      v28 = CFBooleanGetValue((CFBooleanRef)v4);
      if (*(unsigned __int8 *)(v2 + 224) == v28)
        goto LABEL_101;
      v29 = v28;
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v2 + 224) = v29;
      goto LABEL_131;
    }
    if (CFEqual(v3, CFSTR("UsePTPClock")))
    {
      if (!v4 || (v30 = CFGetTypeID(v4), v30 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      v31 = CFBooleanGetValue((CFBooleanRef)v4);
      if (*(unsigned __int8 *)(v2 + 311) == v31)
        goto LABEL_101;
      v32 = v31;
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v2 + 311) = v32;
      goto LABEL_100;
    }
    if (CFEqual(v3, CFSTR("CanRecordScreenStream")))
    {
      if (!v4 || (v37 = CFGetTypeID(v4), v37 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      v38 = CFBooleanGetValue((CFBooleanRef)v4);
      if (*(unsigned __int8 *)(v2 + 681) != v38)
      {
        v39 = v38;
        if (gLogCategory_APReceiverSystemInfo <= 50
          && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        LODWORD(v5) = 0;
        *(_BYTE *)(v2 + 681) = v39;
        goto LABEL_28;
      }
      goto LABEL_101;
    }
    if (CFEqual(v3, CFSTR("ScreenDemoMode")))
    {
      if (!v4 || (v40 = CFGetTypeID(v4), v40 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      v41 = CFBooleanGetValue((CFBooleanRef)v4);
      if (*(unsigned __int8 *)(v2 + 682) == v41)
        goto LABEL_101;
      v42 = v41;
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v2 + 682) = v42;
      goto LABEL_100;
    }
    if (CFEqual(v3, CFSTR("DisplaySizeOverride")))
    {
      size = (CGSize)*MEMORY[0x24BDBF148];
      if (v4)
      {
        v43 = CFGetTypeID(v4);
        if (v43 == CFDictionaryGetTypeID() && CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)v4, &size))
        {
          if (size.width == *(double *)(v2 + 608) && size.height == *(double *)(v2 + 616))
            goto LABEL_101;
          v44 = (CGSize *)(v2 + 608);
          if (gLogCategory_APReceiverSystemInfo > 50
            || gLogCategory_APReceiverSystemInfo == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_189;
          }
LABEL_163:
          LogPrintF();
LABEL_189:
          *v44 = size;
          goto LABEL_101;
        }
      }
      goto LABEL_249;
    }
    if (CFEqual(v3, CFSTR("DisplaySizeMaxOverride")))
    {
      size = (CGSize)*MEMORY[0x24BDBF148];
      if (v4)
      {
        v45 = CFGetTypeID(v4);
        if (v45 == CFDictionaryGetTypeID() && CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)v4, &size))
        {
          if (size.width == *(double *)(v2 + 624) && size.height == *(double *)(v2 + 632))
            goto LABEL_101;
          v44 = (CGSize *)(v2 + 624);
          if (gLogCategory_APReceiverSystemInfo > 50
            || gLogCategory_APReceiverSystemInfo == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_189;
          }
          goto LABEL_163;
        }
      }
LABEL_249:
      APSLogErrorAt();
      LODWORD(v5) = -72021;
      goto LABEL_28;
    }
    if (CFEqual(v3, CFSTR("DisplayHDRModeOverride")))
    {
      if (v4)
      {
        v46 = CFGetTypeID(v4);
        if (v46 != CFStringGetTypeID())
        {
          LODWORD(v5) = -72021;
          goto LABEL_110;
        }
      }
      if (!FigCFEqual())
      {
        if (gLogCategory_APReceiverSystemInfo <= 50
          && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v5 = *(const void **)(v2 + 640);
        *(_QWORD *)(v2 + 640) = v4;
        if (v4)
          CFRetain(v4);
        if (!v5)
          goto LABEL_28;
        CFRelease(v5);
      }
      goto LABEL_101;
    }
    if (CFEqual(v3, CFSTR("RoutingContextID")))
    {
      if (!v4 || (v47 = CFGetTypeID(v4), v47 != CFStringGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      if (*(_BYTE *)(v2 + 130))
      {
        if (FigCFEqual())
          goto LABEL_101;
        if (gLogCategory_APReceiverSystemInfo <= 50
          && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v56 = *(const void **)(v2 + 136);
        *(_QWORD *)(v2 + 136) = v4;
        CFRetain(v4);
        if (v56)
          CFRelease(v56);
LABEL_131:
        sysInfo_updateAPGroupInfo(v2);
        goto LABEL_100;
      }
LABEL_256:
      APSLogErrorAt();
      LODWORD(v5) = -72023;
      goto LABEL_28;
    }
    if (CFEqual(v3, CFSTR("IsSilentPrimary")))
    {
      if (!v4 || (v48 = CFGetTypeID(v4), v48 != CFBooleanGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      if (*(_BYTE *)(v2 + 130))
      {
        v49 = CFBooleanGetValue((CFBooleanRef)v4);
        if (v49 == *(unsigned __int8 *)(v2 + 305))
          goto LABEL_101;
        v50 = v49;
        if (gLogCategory_APReceiverSystemInfo <= 50
          && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        *(_BYTE *)(v2 + 305) = v50;
        goto LABEL_100;
      }
      goto LABEL_256;
    }
    if (!CFEqual(v3, CFSTR("IsClusterLeader")))
    {
      if (!CFEqual(v3, CFSTR("audioCapabilities")))
      {
        LODWORD(v5) = -72022;
        if (gLogCategory_APReceiverSystemInfo <= 50
          && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_28;
      }
      if (!v4 || (v55 = CFGetTypeID(v4), v55 != CFDictionaryGetTypeID()))
      {
        LODWORD(v5) = -72021;
        goto LABEL_110;
      }
      if (!FigCFEqual())
      {
        if (gLogCategory_APReceiverSystemInfo <= 50
          && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v18 = *(const void **)(v2 + 72);
        *(_QWORD *)(v2 + 72) = v4;
        CFRetain(v4);
        if (!v18)
          goto LABEL_100;
        goto LABEL_69;
      }
LABEL_101:
      LODWORD(v5) = 0;
      goto LABEL_28;
    }
    if (!v4 || (v51 = CFGetTypeID(v4), v51 != CFBooleanGetTypeID()))
    {
      LODWORD(v5) = -72021;
      goto LABEL_110;
    }
    if (!*(_QWORD *)(v2 + 176) || *(_DWORD *)(v2 + 248))
    {
      if (*(_QWORD *)(v2 + 256))
      {
        v52 = *(_DWORD *)(v2 + 248);
        if (!v52)
          goto LABEL_207;
        if (v52 == 1)
        {
          LODWORD(v5) = -72021;
          goto LABEL_110;
        }
      }
      APSLogErrorAt();
      LODWORD(v5) = -72025;
      goto LABEL_28;
    }
LABEL_207:
    v53 = CFBooleanGetValue((CFBooleanRef)v4);
    if (v53 == *(unsigned __int8 *)(v2 + 306))
      goto LABEL_101;
    v54 = v53;
    if (gLogCategory_APReceiverSystemInfo <= 50
      && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(v2 + 306) = v54;
    APSSettingsSetValue();
    if (v54)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
    goto LABEL_100;
  }
  if (!v4)
  {
    LODWORD(v5) = -72021;
    goto LABEL_110;
  }
  if (!CFStringGetCString(v4, (char *)(v2 + 481), 64, 0x8000100u))
  {
    LODWORD(v5) = -72021;
    goto LABEL_110;
  }
  if (*(_BYTE *)(v2 + 480))
  {
    LODWORD(v5) = 0;
    v6 = 3;
  }
  else if (*(_BYTE *)(v2 + 481))
  {
    LODWORD(v5) = 0;
    v6 = 2;
  }
  else
  {
    if (!*(_BYTE *)(v2 + 433))
    {
      LODWORD(v5) = 0;
      *(_DWORD *)(v2 + 428) = 0;
      goto LABEL_28;
    }
    LODWORD(v5) = 0;
    v6 = 1;
  }
  *(_DWORD *)(v2 + 428) = v6;
LABEL_28:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = (_DWORD)v5;
}

@end
