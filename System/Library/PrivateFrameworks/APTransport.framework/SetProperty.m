@implementation SetProperty

void __httpconnection_SetProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  uint64_t DerivedStorage;
  CFTypeID v5;
  CFTypeID v6;
  CFTypeID v7;
  uint64_t v8;
  int v9;
  CFTypeID v10;
  CFTypeID v11;
  const void *v12;
  CFTypeID v13;
  CFTypeID v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _BYTE v18[28];
  int v19;

  v2 = (const void *)a1[6];
  v3 = (const void *)a1[7];
  v19 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(v2, CFSTR("TransportDevice")))
  {
    if (!*(_BYTE *)(DerivedStorage + 224))
    {
      if (v3)
      {
        v5 = CFGetTypeID(v3);
        if (v5 == APTransportDeviceGetTypeID())
        {
          *(_QWORD *)(DerivedStorage + 248) = CFRetain(v3);
          goto LABEL_33;
        }
      }
      goto LABEL_31;
    }
LABEL_30:
    APSLogErrorAt();
    v9 = -72321;
LABEL_32:
    v19 = v9;
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("RemoteNetworkIPAddress")))
  {
    if (v3)
    {
      v6 = CFGetTypeID(v3);
      if (v6 == APSNetworkAddressGetTypeID())
      {
        APSNetworkAddressGetSocketAddr();
        *(_OWORD *)(DerivedStorage + 164) = *(_OWORD *)v18;
        *(_OWORD *)(DerivedStorage + 176) = *(_OWORD *)&v18[12];
        goto LABEL_33;
      }
    }
    goto LABEL_31;
  }
  if (CFEqual(v2, CFSTR("RemoteNetworkPort")))
  {
    *(_DWORD *)(DerivedStorage + 192) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("BoundInterfaceIndex")))
  {
    *(_DWORD *)(DerivedStorage + 196) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("ConnectedSocket")))
  {
    if (!*(_BYTE *)(DerivedStorage + 224))
      goto LABEL_30;
    if (v3)
    {
      v7 = CFGetTypeID(v3);
      if (v7 == APTransportSocketGetTypeID())
      {
        *(_DWORD *)(DerivedStorage + 248) = APTransportSocketGetSocket((uint64_t)v3);
        goto LABEL_33;
      }
    }
LABEL_31:
    APSLogErrorAt();
    v9 = -72322;
    goto LABEL_32;
  }
  if (CFEqual(v2, CFSTR("DACPID")))
  {
    *(_QWORD *)(DerivedStorage + 328) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("DACPRemoteID")))
  {
    *(_DWORD *)(DerivedStorage + 336) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("DoNotWakeDevice")))
  {
    *(_BYTE *)(DerivedStorage + 340) = CFGetInt64() != 0;
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("PackageSendTimeout")))
  {
    *(_DWORD *)(DerivedStorage + 344) = CFGetInt64Ranged();
    v8 = *(_QWORD *)(DerivedStorage + 264);
    if (*(_BYTE *)(DerivedStorage + 256))
    {
      if (v8)
        HTTPConnectionSetTimeout();
    }
    else if (v8)
    {
      HTTPClientSetTimeout();
    }
    if (gLogCategory_APTransportConnectionHTTP <= 40
      && (gLogCategory_APTransportConnectionHTTP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("SessionUUID")))
  {
    if (v3)
    {
      v10 = CFGetTypeID(v3);
      if (v10 == CFUUIDGetTypeID())
      {
        *(_QWORD *)(DerivedStorage + 128) = CFRetain(v3);
        goto LABEL_33;
      }
    }
    goto LABEL_31;
  }
  if (CFEqual(v2, CFSTR("UserName")))
  {
    if (v3)
    {
      v11 = CFGetTypeID(v3);
      if (v11 != CFStringGetTypeID())
        goto LABEL_31;
      v12 = *(const void **)(DerivedStorage + 352);
      *(_QWORD *)(DerivedStorage + 352) = v3;
      goto LABEL_53;
    }
    v12 = *(const void **)(DerivedStorage + 352);
    *(_QWORD *)(DerivedStorage + 352) = 0;
    goto LABEL_60;
  }
  if (CFEqual(v2, CFSTR("Password")))
  {
    if (v3)
    {
      v13 = CFGetTypeID(v3);
      if (v13 != CFStringGetTypeID())
        goto LABEL_31;
      v12 = *(const void **)(DerivedStorage + 360);
      *(_QWORD *)(DerivedStorage + 360) = v3;
LABEL_53:
      CFRetain(v3);
      goto LABEL_60;
    }
    v12 = *(const void **)(DerivedStorage + 360);
    *(_QWORD *)(DerivedStorage + 360) = 0;
LABEL_60:
    if (v12)
      CFRelease(v12);
    goto LABEL_33;
  }
  if (CFEqual(v2, CFSTR("UseRFC2617DigestAuth")))
  {
    *(_BYTE *)(DerivedStorage + 368) = CFGetInt64() != 0;
    goto LABEL_33;
  }
  if (!CFEqual(v2, CFSTR("UserAgent")))
  {
    v9 = -12784;
    goto LABEL_32;
  }
  if (v3)
  {
    v14 = CFGetTypeID(v3);
    if (v14 != CFStringGetTypeID())
      goto LABEL_31;
  }
  v17 = *(void **)(DerivedStorage + 32);
  v16 = (_QWORD *)(DerivedStorage + 32);
  v15 = v17;
  if (v17)
  {
    free(v15);
    *v16 = 0;
  }
  if (v3)
    ASPrintF();
LABEL_33:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v19;
}

uint64_t __tcpconnection_SetProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  _BYTE *DerivedStorage;
  _BYTE *v5;
  CFTypeID v6;
  uint64_t result;
  int v8;
  _BYTE v9[28];
  int v10;

  v3 = (const void *)a1[6];
  v2 = (const void *)a1[7];
  v10 = 0;
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    APSLogErrorAt();
    v10 = -12785;
  }
  else
  {
    v5 = DerivedStorage;
    if (CFEqual(v3, CFSTR("PackageType")))
    {
      if (FigCFEqual())
      {
        *((_QWORD *)v5 + 26) = APTransportPackageTCPGetPayloadSize;
        *((_QWORD *)v5 + 27) = APTransportPackageTCPCreateWithBBuf;
        *((_QWORD *)v5 + 28) = APTransportPackageTCPCreate;
        *((_QWORD *)v5 + 29) = APTransportPackageTCPCreateWithMessageSize;
        APTransportPackageTCPGetHeaderSize((_DWORD *)v5 + 50);
        goto LABEL_16;
      }
      if (FigCFEqual())
      {
        *((_QWORD *)v5 + 26) = APTPackageMusicDataGetPayloadSize;
        *((_QWORD *)v5 + 27) = APTPackageMusicDataCreateWithBBuf;
        *((_QWORD *)v5 + 28) = APTPackageMusicDataCreate;
        *((_QWORD *)v5 + 29) = APTPackageMusicDataCreateWithMessageSize;
        APTPackageMusicDataGetHeaderSize((_DWORD *)v5 + 50);
        goto LABEL_16;
      }
      if (FigCFEqual())
      {
        *((_QWORD *)v5 + 26) = 0;
        *((_QWORD *)v5 + 27) = 0;
        *((_QWORD *)v5 + 28) = APTransportPackageRTPCreate;
        *((_QWORD *)v5 + 29) = APTransportPackageRTPCreateWithMessageSize;
        goto LABEL_16;
      }
      if (gLogCategory_APTransportConnectionTCP <= 90
        && (gLogCategory_APTransportConnectionTCP != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = -12780;
      goto LABEL_30;
    }
    if (CFEqual(v3, CFSTR("RemoteNetworkIPAddress")))
    {
      if (!*((_QWORD *)v5 + 19))
      {
        if (v2)
        {
          v6 = CFGetTypeID(v2);
          if (v6 == APSNetworkAddressGetTypeID())
          {
            APSNetworkAddressGetSocketAddr();
            *(_OWORD *)(v5 + 92) = *(_OWORD *)v9;
            *(_OWORD *)(v5 + 104) = *(_OWORD *)&v9[12];
LABEL_15:
            SockAddrSetPort();
            goto LABEL_16;
          }
        }
      }
    }
    else if (CFEqual(v3, CFSTR("RemoteNetworkPort")))
    {
      if (!*((_QWORD *)v5 + 19))
      {
        *((_DWORD *)v5 + 30) = CFGetInt64();
        goto LABEL_15;
      }
    }
    else
    {
      if (!CFEqual(v3, CFSTR("BoundInterfaceIndex")))
      {
        v8 = -12784;
LABEL_30:
        v10 = v8;
        goto LABEL_16;
      }
      if (!*((_QWORD *)v5 + 19))
      {
        *((_DWORD *)v5 + 31) = CFGetInt64();
        goto LABEL_16;
      }
    }
    APSLogErrorAt();
    v10 = -72322;
  }
  APSSignalErrorAt();
LABEL_16:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v10;
  result = FigCFEqual();
  if (!(_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  return result;
}

uint64_t __stream_SetProperty_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t DerivedStorage;
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  int v8;

  v2 = a1[6];
  v3 = a1[7];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    result = APSLogErrorAt();
    v8 = -16617;
    goto LABEL_7;
  }
  CMBaseObject = APTransportConnectionGetCMBaseObject(*(_QWORD *)(DerivedStorage + 40));
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v6)
  {
    v8 = -12782;
LABEL_6:
    result = APSLogErrorAt();
    goto LABEL_7;
  }
  result = v6(CMBaseObject, v2, v3);
  v8 = result;
  if ((_DWORD)result)
    goto LABEL_6;
LABEL_7:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v8;
  return result;
}

void __tcpunbufnw_SetProperty_block_invoke(uint64_t a1)
{
  tcpunbufnwGuts_connectionReceivePackages(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
