@implementation APMediaSenderStart

void __APMediaSenderStart_block_invoke(uint64_t a1)
{
  int v2;
  intptr_t v3;
  int v4;
  CFMutableDictionaryRef v5;
  int v6;
  CFTypeID v7;
  CFTypeID v8;
  CFMutableDictionaryRef v9;
  CFTypeID v10;
  CFTypeID v11;
  int v12;
  __CFDictionary *TestInfoDictionary;
  void *v14;
  const __CFAllocator *v15;
  int v16;
  __CFDictionary *Mutable;
  const void *v18;
  int v19;
  int v20;
  CFMutableDictionaryRef v21;
  int v22;
  unsigned int v23;
  dispatch_time_t v24;
  NSObject *v25;
  dispatch_time_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, _QWORD, _QWORD);
  int v29;
  unsigned int v30;
  dispatch_time_t v31;
  const void *v32;
  const void *v33;
  uint64_t v34;
  uint64_t CMBaseObject;
  uint64_t (*v36)(uint64_t, _QWORD, uint64_t);
  int v37;
  uint64_t v38;
  void (*v39)(uint64_t, _OWORD *);
  int v40;
  int v41;
  int StreamOfType;
  int v43;
  int v44;
  int v45;
  const void *v46;
  uint64_t v47;
  NSObject *v48;
  _QWORD block[5];
  int v50;
  _OWORD v51[4];
  CFTypeRef v52;
  CFTypeRef cf;
  CFArrayRef theArray;
  uint64_t v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  uint64_t *v58;
  const void *v59;
  CFTypeRef v60;
  CFTypeRef v61;
  const void *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;

  v2 = *(_DWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(v3 + 168) = v2;
  if (*(_DWORD *)(a1 + 60))
    v4 = *(_DWORD *)(a1 + 60);
  else
    v4 = 30;
  *(_DWORD *)(v3 + 172) = v4;
  v5 = *(CFMutableDictionaryRef *)(a1 + 48);
  v6 = *(_DWORD *)(a1 + 64);
  v52 = 0;
  cf = 0;
  memset(v51, 0, sizeof(v51));
  if (!v5)
  {
    v12 = -6705;
LABEL_112:
    APSLogErrorAt();
    goto LABEL_113;
  }
  if (*(_BYTE *)(v3 + 182))
  {
    v12 = -6709;
LABEL_64:
    APSLogErrorAt();
    v5 = 0;
    goto LABEL_113;
  }
  if ((v2 & 3) == 0)
  {
    v12 = -6705;
    goto LABEL_64;
  }
  switch(v6)
  {
    case 0:
      v7 = CFGetTypeID(v5);
      if (v7 != CFStringGetTypeID())
      {
        v12 = -6705;
        goto LABEL_63;
      }
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v63 = 0;
      v64 = &v63;
      v65 = 0x2000000000;
      v66 = 0;
      v61 = 0;
      v62 = 0;
      v60 = 0;
      TestInfoDictionary = (__CFDictionary *)APAdvertiserInfoCreateTestInfoDictionary();
      CFDictionarySetValue(TestInfoDictionary, (const void *)*MEMORY[0x24BDFD600], v5);
      v14 = (void *)CFDictionaryCopyCString();
      if (*((_DWORD *)v64 + 6))
      {
        APSLogErrorAt();
        Mutable = 0;
        v21 = 0;
        goto LABEL_68;
      }
      TextToHardwareAddressScalar();
      v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v16 = APAdvertiserInfoCreate();
      *((_DWORD *)v64 + 6) = v16;
      if (v16)
      {
        APSLogErrorAt();
        Mutable = 0;
LABEL_157:
        v21 = 0;
        goto LABEL_68;
      }
      theArray = (CFArrayRef)MEMORY[0x24BDAC760];
      v55 = 0x40000000;
      v56 = __createEndpointForNetworkAddress_block_invoke;
      v57 = &unk_25075CB50;
      v58 = &v63;
      v59 = v62;
      CFDictionaryApplyBlock();
      Mutable = CFDictionaryCreateMutable(v15, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetInt64();
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDFD610], v62);
      v18 = (const void *)*MEMORY[0x24BDBD270];
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDFD618], (const void *)*MEMORY[0x24BDBD270]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDFD620], v18);
      v19 = APSNetworkAddressCreateWithString();
      *((_DWORD *)v64 + 6) = v19;
      if (v19 || (v20 = APTransportDeviceCreateWithNetworkAddress(), (*((_DWORD *)v64 + 6) = v20) != 0))
      {
        APSLogErrorAt();
        goto LABEL_157;
      }
      v21 = CFDictionaryCreateMutable(v15, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v22 = APEndpointCreateWithTransportDevice();
      *((_DWORD *)v64 + 6) = v22;
      if (v22)
      {
        APSLogErrorAt();
      }
      else if (gLogCategory_AirPlaySenderKit <= 50
             && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
LABEL_68:
      free(v14);
      if (TestInfoDictionary)
        CFRelease(TestInfoDictionary);
      if (Mutable)
        CFRelease(Mutable);
      if (v21)
        CFRelease(v21);
      if (v62)
        CFRelease(v62);
      if (v61)
        CFRelease(v61);
      if (v60)
        CFRelease(v60);
      v12 = *((_DWORD *)v64 + 6);
      _Block_object_dispose(&v63, 8);
      if (v12)
        goto LABEL_63;
      v5 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v32 = (const void *)*MEMORY[0x24BDBD270];
      CFDictionarySetValue(v5, (const void *)*MEMORY[0x24BE03160], (const void *)*MEMORY[0x24BDBD270]);
      if ((*(_BYTE *)(v3 + 168) & 1) != 0)
      {
        CFDictionarySetValue(v5, (const void *)*MEMORY[0x24BE03148], v32);
        CFDictionarySetValue(v5, (const void *)*MEMORY[0x24BDC0E20], (const void *)*MEMORY[0x24BDC1158]);
        CFDictionarySetValue(v5, (const void *)*MEMORY[0x24BE03158], *(const void **)(v3 + 48));
        v33 = *(const void **)(v3 + 104);
        if (v33)
          CFDictionarySetValue(v5, (const void *)*MEMORY[0x24BE03150], v33);
      }
      if ((*(_BYTE *)(v3 + 168) & 2) != 0)
      {
        if (!*(_DWORD *)(v3 + 72))
        {
          v12 = -6705;
          goto LABEL_112;
        }
        if (*(_BYTE *)(v3 + 180))
          CFDictionarySetValue(v5, (const void *)*MEMORY[0x24BDC0E20], (const void *)*MEMORY[0x24BDC1158]);
      }
      v34 = *(_QWORD *)(v3 + 112);
      if (v34)
      {
        CMBaseObject = FigEndpointGetCMBaseObject();
        v36 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (!v36)
        {
          v12 = -12782;
          goto LABEL_112;
        }
        v37 = v36(CMBaseObject, *MEMORY[0x24BDC11C0], v34);
        if (v37)
        {
          v12 = v37;
          goto LABEL_112;
        }
      }
      memset((char *)&v51[1] + 8, 0, 40);
      *(_QWORD *)&v51[0] = v3;
      *((_QWORD *)&v51[0] + 1) = sender_handleAuthRequiredCallback;
      *(_QWORD *)&v51[1] = sender_handleEndpointFailure;
      v38 = *(_QWORD *)(v3 + 40);
      v39 = *(void (**)(uint64_t, _OWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v39)
        v39(v38, v51);
      v40 = FigEndpointActivateSync();
      if (v40)
      {
        v12 = v40;
        goto LABEL_112;
      }
      v41 = *(_DWORD *)(v3 + 168);
      if ((v41 & 1) != 0)
      {
        StreamOfType = FigEndpointCopyFirstStreamOfType();
        if (StreamOfType)
        {
          v12 = StreamOfType;
          goto LABEL_112;
        }
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        v43 = FigEndpointStreamResume();
        if (v43)
        {
          v12 = v43;
          goto LABEL_112;
        }
        v41 = *(_DWORD *)(v3 + 168);
      }
      if ((v41 & 2) != 0)
      {
        v44 = FigEndpointCopyFirstStreamOfType();
        if (v44)
        {
          v12 = v44;
          goto LABEL_112;
        }
        v45 = AudioSBufSourceCreate((uint64_t)v52, v3 + 64, 0, (uint64_t *)(v3 + 56));
        if (v45)
        {
          v12 = v45;
          goto LABEL_112;
        }
      }
      v12 = 0;
      *(_BYTE *)(v3 + 182) = 1;
LABEL_113:
      sender_stopDiscovery(v3);
      if (cf)
        CFRelease(cf);
      if (v52)
        CFRelease(v52);
      if (v5)
        CFRelease(v5);
      if (v12)
      {
        if (gLogCategory_AirPlaySenderKit <= 90
          && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        sender_stopInternal(v3, 0);
        APSLogErrorAt();
      }
      else if (gLogCategory_AirPlaySenderKit <= 50
             && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 176) = v12;
      v46 = *(const void **)(a1 + 48);
      if (v46)
        CFRelease(v46);
      v47 = *(_QWORD *)(a1 + 32);
      if (v47)
      {
        v48 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = __APMediaSenderStart_block_invoke_2;
        block[3] = &unk_25075CA68;
        block[4] = v47;
        v50 = v12;
        dispatch_async(v48, block);
      }
      return;
    case 1:
      v11 = CFGetTypeID(v5);
      if (v11 != CFStringGetTypeID())
      {
        v12 = -6705;
        goto LABEL_63;
      }
      if (gLogCategory_AirPlaySenderKit > 50)
      {
        v9 = 0;
        goto LABEL_43;
      }
      if (gLogCategory_AirPlaySenderKit != -1)
      {
        v9 = 0;
        goto LABEL_24;
      }
      v9 = 0;
      if (_LogCategory_Initialize())
        goto LABEL_24;
      goto LABEL_43;
    case 2:
      v8 = CFGetTypeID(v5);
      if (v8 != CFStringGetTypeID())
      {
        v12 = -6705;
        goto LABEL_63;
      }
      if (gLogCategory_AirPlaySenderKit > 50)
      {
        v9 = 0;
        goto LABEL_43;
      }
      if (gLogCategory_AirPlaySenderKit != -1)
      {
        v9 = 0;
        goto LABEL_24;
      }
      v9 = 0;
      if (_LogCategory_Initialize())
        goto LABEL_24;
      goto LABEL_43;
    case 3:
      v10 = CFGetTypeID(v5);
      if (v10 != CFDictionaryGetTypeID())
      {
        v12 = -6705;
        goto LABEL_63;
      }
      if (gLogCategory_AirPlaySenderKit > 50)
        goto LABEL_32;
      if (gLogCategory_AirPlaySenderKit != -1)
      {
        v9 = v5;
LABEL_24:
        LogPrintF();
        goto LABEL_43;
      }
      if (_LogCategory_Initialize())
      {
        v9 = v5;
        goto LABEL_24;
      }
LABEL_32:
      v9 = v5;
LABEL_43:
      if (sender_startDiscovery_once != -1)
        dispatch_once(&sender_startDiscovery_once, &__block_literal_global_45);
      v23 = *(_DWORD *)(v3 + 172);
      if ((v23 & 0x80000000) != 0)
        v24 = -1;
      else
        v24 = dispatch_time(0, 1000000000 * v23);
      while (1)
      {
        v25 = sender_startDiscovery_activationSema;
        v26 = dispatch_time(0, 1000000000);
        if (!dispatch_semaphore_wait(v25, v26))
          break;
        if (v24 <= dispatch_time(0, 0))
        {
          v12 = -6722;
          goto LABEL_62;
        }
        if (*(_BYTE *)(v3 + 181))
        {
          v12 = -6723;
LABEL_62:
          APSLogErrorAt();
          goto LABEL_63;
        }
      }
      *(_QWORD *)(v3 + 160) = sender_startDiscovery_activationSema;
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
      if (v9)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
        if (gLogCategory_AirPlaySenderKit > 50
          || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_83;
        }
      }
      else
      {
        v27 = *(_QWORD *)(v3 + 32);
        v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (!v28)
        {
          v12 = -12782;
          goto LABEL_62;
        }
        v29 = v28(v27, *MEMORY[0x24BDC0E60], 0);
        if (v29)
        {
          v12 = v29;
          goto LABEL_62;
        }
        if (gLogCategory_AirPlaySenderKit > 50
          || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
        {
LABEL_83:
          theArray = 0;
          v30 = *(_DWORD *)(v3 + 172);
          if ((v30 & 0x80000000) != 0)
            v31 = -1;
          else
            v31 = dispatch_time(0, 1000000000 * v30);
          while (1)
          {
            if (v31 <= dispatch_time(0, 0))
            {
              v12 = -6722;
              goto LABEL_139;
            }
            if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v3 + 152), v31))
            {
              v12 = -6722;
              goto LABEL_139;
            }
            if (*(_BYTE *)(v3 + 181))
              break;
            FigEndpointManagerCopyEndpointsForType();
          }
          v12 = -6723;
LABEL_139:
          APSLogErrorAt();
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterRemoveListener();
LABEL_63:
          APSLogErrorAt();
          goto LABEL_64;
        }
      }
      LogPrintF();
      goto LABEL_83;
    default:
      v12 = -6705;
      goto LABEL_63;
  }
}

uint64_t __APMediaSenderStart_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

@end
