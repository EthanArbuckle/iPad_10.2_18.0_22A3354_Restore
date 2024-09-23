@implementation AuthenticateEndpoint

void __mfiMutualAuth_AuthenticateEndpoint_block_invoke(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t DerivedStorage;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  int v8;
  const __CFAllocator **v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  CFTypeRef v14;
  const __CFAllocator *v15;
  const __CFAllocator *v16;
  OpaqueCMBlockBuffer *v17;
  uint64_t v18;
  CFDataRef v19;
  CFDataRef v20;
  int v21;
  int v22;
  int v23;
  int v24;
  const void *v25;
  const void *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  const __CFAllocator *v31;
  __CFDictionary *Mutable;
  int v33;
  uint64_t v34;
  const __CFAllocator *v35;
  int TransformedMessage;
  int v37;
  OpaqueCMBlockBuffer *v38;
  uint64_t v39;
  int v40;
  CFDataRef v41;
  CFDataRef v42;
  int v43;
  int v44;
  const void *v45;
  const void *v46;
  int v47;
  OSStatus DataPointer;
  const __CFData *v49;
  int v50;
  const UInt8 *BytePtr;
  size_t Length;
  const __CFData *v53;
  uint64_t i;
  uint64_t v55;
  const __CFData *v56;
  uint64_t v57;
  CFTypeRef cf[6];
  size_t lengthAtOffsetOut[6];
  char *dataPointerOut[6];
  size_t v61;
  char *v62;
  OpaqueCMBlockBuffer *v63;
  OpaqueCMBlockBuffer *v64;
  OpaqueCMBlockBuffer *v65;

  v1 = a1;
  v2 = *(char **)(a1 + 40);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v65 = 0;
  v4 = 0x1EF904000uLL;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  MEMORY[0x1CAA400CC](*(_QWORD *)(v5 + 104));
  mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 1);
  MEMORY[0x1CAA400E4](*(_QWORD *)(v5 + 104));
  v6 = *(_QWORD *)(v5 + 8);
  v7 = (const void *)MEMORY[0x1E0C809B0];
  dataPointerOut[0] = (char *)MEMORY[0x1E0C809B0];
  dataPointerOut[1] = (char *)0x40000000;
  dataPointerOut[2] = (char *)__mfiMutualAuth_initMFi4_block_invoke;
  dataPointerOut[3] = (char *)&__block_descriptor_tmp_21;
  dataPointerOut[4] = v2;
  dataPointerOut[5] = (char *)v5;
  v8 = APAccTransportClientEndpointActivate(v6, 14, 1, (uint64_t)dataPointerOut);
  v9 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
  v57 = v1;
  if (v8)
  {
    v22 = v8;
LABEL_165:
    APSLogErrorAt();
    APSLogErrorAt();
    v14 = 0;
    goto LABEL_74;
  }
  v10 = *(_QWORD *)(v5 + 8);
  lengthAtOffsetOut[0] = (size_t)v7;
  lengthAtOffsetOut[1] = 0x40000000;
  lengthAtOffsetOut[2] = (size_t)__mfiMutualAuth_initMFi4_block_invoke_2;
  lengthAtOffsetOut[3] = (size_t)&__block_descriptor_tmp_25;
  lengthAtOffsetOut[4] = v5;
  lengthAtOffsetOut[5] = (size_t)v2;
  v11 = APAccTransportClientEndpointSetAuthStatusHandler(v10, (uint64_t)lengthAtOffsetOut);
  if (v11)
  {
    v22 = v11;
    goto LABEL_165;
  }
  v12 = *(_QWORD *)(v5 + 8);
  cf[0] = v7;
  cf[1] = (CFTypeRef)0x40000000;
  cf[2] = __mfiMutualAuth_initMFi4_block_invoke_3;
  cf[3] = &__block_descriptor_tmp_28;
  cf[4] = v2;
  cf[5] = (CFTypeRef)v5;
  v13 = APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler(v12, (uint64_t)cf);
  if (v13)
  {
    v22 = v13;
    goto LABEL_165;
  }
  v14 = 0;
  v15 = *v9;
  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  while (1)
  {
    if (v14)
      CFRelease(v14);
    v17 = v65;
    v18 = CMBaseObjectGetDerivedStorage();
    dataPointerOut[0] = 0;
    lengthAtOffsetOut[0] = 0;
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v17)
    {
      MEMORY[0x1CAA400CC](*(_QWORD *)(v18 + 104));
      if (*(_DWORD *)(v18 + 120) != 2)
      {
        MEMORY[0x1CAA400E4](*(_QWORD *)(v18 + 104));
        APSLogErrorAt();
        v14 = 0;
        v22 = -71803;
        goto LABEL_66;
      }
      mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 1);
      MEMORY[0x1CAA400E4](*(_QWORD *)(v18 + 104));
      CMBlockBufferGetDataPointer(v17, 0, lengthAtOffsetOut, 0, dataPointerOut);
      if (!dataPointerOut[0] || !lengthAtOffsetOut[0])
      {
        APSLogErrorAt();
        v14 = 0;
        v22 = -71804;
        goto LABEL_66;
      }
      v19 = CFDataCreateWithBytesNoCopy(v15, (const UInt8 *)dataPointerOut[0], lengthAtOffsetOut[0], v16);
      if (!v19)
      {
        APSLogErrorAt();
        v14 = 0;
        v22 = -71800;
        goto LABEL_66;
      }
      v20 = v19;
      if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
        && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v21 = APAccTransportClientEndpointForwardData(*(_QWORD *)(v18 + 8), (uint64_t)v20);
      if (v21)
      {
        v22 = v21;
        APSLogErrorAt();
        v23 = 0;
        v14 = 0;
LABEL_49:
        CFRelease(v20);
        goto LABEL_50;
      }
    }
    else
    {
      if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
        && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v20 = 0;
    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v18 + 88), 0xFFFFFFFFFFFFFFFFLL);
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    MEMORY[0x1CAA400CC](*(_QWORD *)(v18 + 104));
    v14 = 0;
    v24 = *(_DWORD *)(v18 + 120);
    if ((v24 - 3) < 2)
    {
      v23 = 1;
LABEL_47:
      v22 = 0;
LABEL_48:
      MEMORY[0x1CAA400E4](*(_QWORD *)(v18 + 104));
      if (!v20)
        goto LABEL_50;
      goto LABEL_49;
    }
    if (v24 != 2)
    {
      v23 = 0;
      v22 = -71803;
      goto LABEL_48;
    }
    v25 = *(const void **)(v18 + 112);
    if (v25)
    {
      v14 = CFRetain(v25);
      v26 = *(const void **)(v18 + 112);
      if (v26)
      {
        CFRelease(v26);
        v23 = 0;
        *(_QWORD *)(v18 + 112) = 0;
      }
      else
      {
        v23 = 0;
      }
      goto LABEL_47;
    }
    APSLogErrorAt();
    v23 = 0;
    v14 = 0;
    v22 = -71802;
    if (v20)
      goto LABEL_49;
LABEL_50:
    if (v22)
    {
      v4 = 0x1EF904000;
LABEL_66:
      MEMORY[0x1CAA400CC](*(_QWORD *)(v18 + 104));
      mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 4);
      MEMORY[0x1CAA400E4](*(_QWORD *)(v18 + 104));
LABEL_67:
      APSLogErrorAt();
      v9 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
      goto LABEL_74;
    }
    if (v23)
      break;
    if (v65)
    {
      CFRelease(v65);
      v65 = 0;
    }
    v22 = mfiMutualAuth_sendMessageMFi4((uint64_t)v2, v14, 0);
    v4 = 0x1EF904000uLL;
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 20
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v22)
      goto LABEL_67;
  }
  MEMORY[0x1CAA400CC](*(_QWORD *)(DerivedStorage + 104));
  v9 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
  if (*(_DWORD *)(DerivedStorage + 120) == 3)
  {
    v22 = 0;
    v4 = 0x1EF904000;
  }
  else
  {
    v4 = 0x1EF904000uLL;
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 90
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v22 = -71802;
  }
  MEMORY[0x1CAA400E4](*(_QWORD *)(DerivedStorage + 104));
LABEL_74:
  if (v65)
    CFRelease(v65);
  if (v14)
    CFRelease(v14);
  v27 = *(_DWORD *)(v4 + 3440);
  if (v22)
  {
    if (v27 <= 90 && (v27 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v22 == 200403)
      v28 = -71145;
    else
      v28 = -71802;
    MEMORY[0x1CAA400CC](*(_QWORD *)(DerivedStorage + 104));
    mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 4);
    MEMORY[0x1CAA400E4](*(_QWORD *)(DerivedStorage + 104));
  }
  else
  {
    if (v27 <= 50 && (v27 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v28 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = v28;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24))
    return;
  v29 = *(_QWORD *)(v1 + 40);
  v30 = CMBaseObjectGetDerivedStorage();
  cf[0] = 0;
  v64 = 0;
  v65 = 0;
  v63 = 0;
  v31 = *v9;
  Mutable = CFDictionaryCreateMutable(v31, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v61 = 0;
  v62 = 0;
  v33 = *(_DWORD *)(v4 + 3440);
  if (v33 <= 50 && (v33 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  CFDictionarySetValue(Mutable, CFSTR("X-Apple-PairingTranscript"), CFSTR("1"));
  v34 = v30 + 24;
  v35 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  v56 = CFDataCreateWithBytesNoCopy(v31, (const UInt8 *)(v30 + 24), 32, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  TransformedMessage = mfiMutualAuth_createTransformedMessage(v29, 0, v56, cf);
  if (TransformedMessage)
  {
    v40 = TransformedMessage;
LABEL_168:
    APSLogErrorAt();
    v38 = 0;
LABEL_174:
    v49 = 0;
LABEL_177:
    v53 = v56;
    goto LABEL_138;
  }
  v37 = mfiMutualAuth_sendMessageMFi4(v29, cf[0], (uint64_t)Mutable);
  if (v37)
  {
    v40 = v37;
    goto LABEL_168;
  }
  v55 = v30;
  v38 = v63;
  v39 = CMBaseObjectGetDerivedStorage();
  dataPointerOut[0] = 0;
  lengthAtOffsetOut[0] = 0;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v38)
  {
    APSLogErrorAt();
    v40 = -71801;
    goto LABEL_127;
  }
  MEMORY[0x1CAA400CC](*(_QWORD *)(v39 + 104));
  if (*(_DWORD *)(v39 + 124))
  {
    MEMORY[0x1CAA400E4](*(_QWORD *)(v39 + 104));
    APSLogErrorAt();
    v38 = 0;
    v40 = -71803;
    goto LABEL_127;
  }
  mfiMutualAuth_setAndLogSecureTunnelState(v29, 5);
  MEMORY[0x1CAA400E4](*(_QWORD *)(v39 + 104));
  CMBlockBufferGetDataPointer(v38, 0, lengthAtOffsetOut, 0, dataPointerOut);
  if (!dataPointerOut[0] || !lengthAtOffsetOut[0])
  {
    APSLogErrorAt();
    v38 = 0;
    v40 = -71804;
    goto LABEL_127;
  }
  v41 = CFDataCreateWithBytesNoCopy(v31, (const UInt8 *)dataPointerOut[0], lengthAtOffsetOut[0], v35);
  if (!v41)
  {
    APSLogErrorAt();
    v38 = 0;
    v40 = -71800;
    goto LABEL_127;
  }
  v42 = v41;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v43 = APAccTransportClientEndpointForwardData(*(_QWORD *)(v39 + 8), (uint64_t)v42);
  if (v43)
  {
    v40 = v43;
    APSLogErrorAt();
LABEL_182:
    CFRelease(v42);
    v38 = 0;
    goto LABEL_127;
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v39 + 88), 0xFFFFFFFFFFFFFFFFLL);
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  MEMORY[0x1CAA400CC](*(_QWORD *)(v39 + 104));
  v44 = *(_DWORD *)(v39 + 124);
  if (v44 != 6)
  {
    v38 = 0;
    v40 = -71803;
    goto LABEL_124;
  }
  v45 = *(const void **)(v39 + 112);
  if (!v45)
  {
    APSLogErrorAt();
    v40 = -71802;
    v1 = v57;
    goto LABEL_182;
  }
  v38 = (OpaqueCMBlockBuffer *)CFRetain(v45);
  v46 = *(const void **)(v39 + 112);
  if (v46)
  {
    CFRelease(v46);
    *(_QWORD *)(v39 + 112) = 0;
  }
  mfiMutualAuth_setAndLogSecureTunnelState(v29, 0);
  v40 = 0;
LABEL_124:
  MEMORY[0x1CAA400E4](*(_QWORD *)(v39 + 104));
  CFRelease(v42);
  if (v44 == 6)
  {
    v1 = v57;
    goto LABEL_128;
  }
  v1 = v57;
LABEL_127:
  MEMORY[0x1CAA400CC](*(_QWORD *)(v39 + 104));
  mfiMutualAuth_setAndLogSecureTunnelState(v29, 7);
  MEMORY[0x1CAA400E4](*(_QWORD *)(v39 + 104));
  if (v40)
  {
    APSLogErrorAt();
    v49 = 0;
    v30 = v55;
    v53 = v56;
    goto LABEL_138;
  }
LABEL_128:
  v30 = v55;
  v47 = mfiMutualAuth_sendMessageMFi4(v29, v38, (uint64_t)Mutable);
  if (v47)
  {
    v40 = v47;
LABEL_173:
    APSLogErrorAt();
    goto LABEL_174;
  }
  DataPointer = CMBlockBufferGetDataPointer(v64, 0, &v61, 0, &v62);
  if (DataPointer)
  {
    v40 = DataPointer;
    goto LABEL_173;
  }
  v49 = CFDataCreateWithBytesNoCopy(v31, (const UInt8 *)v62, v61, v35);
  v50 = mfiMutualAuth_createTransformedMessage(v29, 1, v49, (CFTypeRef *)&v65);
  if (v50)
  {
    v40 = v50;
    APSLogErrorAt();
    goto LABEL_177;
  }
  if (CFDataGetLength(v65) != 32
    || (BytePtr = CFDataGetBytePtr(v65), Length = CFDataGetLength(v65),
                                         memcmp((const void *)(v55 + 56), BytePtr, Length)))
  {
    APSLogErrorAt();
    v40 = -71145;
    goto LABEL_177;
  }
  v53 = v56;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v40 = 0;
LABEL_138:
  if (cf[0])
    CFRelease(cf[0]);
  if (v53)
    CFRelease(v53);
  if (v64)
    CFRelease(v64);
  if (v65)
    CFRelease(v65);
  if (v49)
    CFRelease(v49);
  if (v63)
    CFRelease(v63);
  if (v38)
    CFRelease(v38);
  if (Mutable)
    CFRelease(Mutable);
  for (i = 0; i != 64; ++i)
    *(_BYTE *)(v34 + i) = 0;
  if (v40)
  {
    MEMORY[0x1CAA400CC](*(_QWORD *)(v30 + 104));
    mfiMutualAuth_setAndLogSecureTunnelState(v29, 7);
    MEMORY[0x1CAA400E4](*(_QWORD *)(v30 + 104));
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = v40;
}

@end
