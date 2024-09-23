@implementation APReceiverSystemInfoCopyProperty

void __APReceiverSystemInfoCopyProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  const __CFBoolean *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString **v6;
  const __CFString *v7;
  int v8;
  const __CFString **v9;
  int v10;
  const __CFString *v11;
  const __CFString *Int64;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFAllocator *v16;
  CFTypeID v17;
  int Value;
  int v19;
  char valuePtr[1028];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (const void *)a1[7];
  v3 = (const __CFBoolean *)a1[8];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[5] + 8);
  v19 = 0;
  if (gLogCategory_APReceiverSystemInfo <= 30
    && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (CFEqual(v2, CFSTR("AirPlayGroupPublicName")))
  {
    if (*(_QWORD *)(v4 + 256))
    {
      v6 = (const __CFString **)(v4 + 288);
      goto LABEL_13;
    }
    if (*(_QWORD *)(v4 + 176))
    {
      v6 = (const __CFString **)(v4 + 208);
LABEL_13:
      v7 = *v6;
      if (!*v6)
        goto LABEL_40;
      goto LABEL_28;
    }
LABEL_40:
    v8 = -72025;
    goto LABEL_41;
  }
  if (CFEqual(v2, CFSTR("AirPlayGroupID")))
  {
    v7 = *(const __CFString **)(v4 + 144);
    if (!v7)
    {
      APSLogErrorAt();
      v8 = -72023;
LABEL_41:
      v19 = v8;
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  if (CFEqual(v2, CFSTR("IsAirPlayGroupLeader")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 153);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("GroupContainsDiscoverableLeader")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 152);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("IsSilentPrimary")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 305);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("ReceiverSessionIsActive")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 225);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("ReceiverDeviceIsPlaying")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 226);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("SystemPairingIdentity")))
  {
    v7 = *(const __CFString **)(v4 + 456);
    if (!v7)
      goto LABEL_40;
    goto LABEL_28;
  }
  if (CFEqual(v2, CFSTR("LocalRouteInfo")))
  {
    v7 = *(const __CFString **)(v4 + 232);
    if (!v7)
      goto LABEL_40;
    goto LABEL_28;
  }
  if (CFEqual(v2, CFSTR("TightSyncUUID")))
  {
    v7 = *(const __CFString **)(v4 + 176);
    if (!v7)
      goto LABEL_40;
LABEL_28:
    v11 = (const __CFString *)CFRetain(v7);
LABEL_29:
    Int64 = v11;
LABEL_30:
    *(_QWORD *)(v5 + 24) = Int64;
    v19 = 0;
    goto LABEL_31;
  }
  if (CFEqual(v2, CFSTR("IsTightSyncGroupLeader")))
  {
    if (!*(_QWORD *)(v4 + 176) || !*(_BYTE *)(v4 + 184))
    {
      v9 = (const __CFString **)MEMORY[0x24BDBD268];
      goto LABEL_27;
    }
LABEL_45:
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
LABEL_27:
    v7 = *v9;
    goto LABEL_28;
  }
  if (CFEqual(v2, CFSTR("TightSyncGroupLeaderUUID")))
  {
    v7 = *(const __CFString **)(v4 + 192);
    if (!v7)
      goto LABEL_40;
    goto LABEL_28;
  }
  if (CFEqual(v2, CFSTR("ClusterUUID")))
  {
    v13 = *(const __CFString **)(v4 + 176);
    v14 = *(const __CFString **)(v4 + 256);
LABEL_52:
    if (!((unint64_t)v13 | (unint64_t)v14))
      goto LABEL_40;
    if (v14)
      v7 = v14;
    else
      v7 = v13;
    goto LABEL_28;
  }
  if (CFEqual(v2, CFSTR("ClusterType")))
  {
    v15 = *(_QWORD *)(v4 + 256);
    if (*(_QWORD *)(v4 + 176))
    {
      if (!v15)
      {
        v7 = CFSTR("ClusterType_StereoPair");
        goto LABEL_28;
      }
    }
    else if (!v15)
    {
      goto LABEL_40;
    }
    if (*(_DWORD *)(v4 + 248) == 1)
      v7 = CFSTR("ClusterType_HT");
    else
      v7 = CFSTR("ClusterType_Generic");
    goto LABEL_28;
  }
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (CFEqual(v2, CFSTR("ClusterSize")))
  {
    *(_DWORD *)valuePtr = 0;
    if (*(_QWORD *)(v4 + 256))
    {
      *(_DWORD *)valuePtr = *(_QWORD *)(v4 + 240);
    }
    else if (*(_QWORD *)(v4 + 176))
    {
      *(_DWORD *)valuePtr = 2;
    }
    v11 = (const __CFString *)CFNumberCreate(v16, kCFNumberSInt32Type, valuePtr);
    goto LABEL_29;
  }
  if (CFEqual(v2, CFSTR("IsClusterLeader")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 306);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("ClusterLeaderUUID")))
  {
    v13 = *(const __CFString **)(v4 + 192);
    v14 = *(const __CFString **)(v4 + 264);
    goto LABEL_52;
  }
  if (CFEqual(v2, CFSTR("ParentGroupID")))
  {
    v7 = *(const __CFString **)(v4 + 160);
    if (!v7)
      goto LABEL_40;
    goto LABEL_28;
  }
  if (CFEqual(v2, CFSTR("ParentGroupContainsDiscoverableLeader")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 168);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("ParentGroupLeaderSupportsRelay")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 169);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("AccessControlType")))
  {
    Int64 = (const __CFString *)CFNumberCreateInt64();
    if (Int64)
      goto LABEL_30;
LABEL_86:
    APSLogErrorAt();
    v8 = -72020;
    goto LABEL_41;
  }
  if (CFEqual(v2, CFSTR("AccessControlLevelHK")))
  {
    Int64 = (const __CFString *)CFNumberCreate(v16, kCFNumberIntType, (const void *)(v4 + 320));
    if (Int64)
      goto LABEL_30;
    goto LABEL_86;
  }
  if (CFEqual(v2, CFSTR("EnableHKAccessControl")))
  {
    v9 = (const __CFString **)MEMORY[0x24BDBD270];
    v10 = *(unsigned __int8 *)(v4 + 310);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("BluetoothAddress")))
  {
    v7 = *(const __CFString **)(v4 + 720);
    if (!v7)
      goto LABEL_40;
    goto LABEL_28;
  }
  if (!CFEqual(v2, CFSTR("Passcode")))
  {
    if (CFEqual(v2, CFSTR("Password")))
    {
      Int64 = CFStringCreateWithCString(v16, (const char *)(v4 + 481), 0x8000100u);
      if (Int64)
        goto LABEL_30;
      goto LABEL_86;
    }
    if (CFEqual(v2, CFSTR("SecurityMode")))
    {
      Int64 = (const __CFString *)CFNumberCreate(v16, kCFNumberSInt32Type, (const void *)(v4 + 428));
      if (Int64)
        goto LABEL_30;
      goto LABEL_86;
    }
    if (CFEqual(v2, CFSTR("IsPINRequiredForPairing")))
    {
      v9 = (const __CFString **)MEMORY[0x24BDBD270];
      v10 = *(unsigned __int8 *)(v4 + 433);
      goto LABEL_25;
    }
    if (CFEqual(v2, CFSTR("IsPairingRequiredForAllClients")))
    {
      v9 = (const __CFString **)MEMORY[0x24BDBD270];
      v10 = *(unsigned __int8 *)(v4 + 432);
      goto LABEL_25;
    }
    if (CFEqual(v2, CFSTR("IsPINRequiredForEverySession")))
    {
      v9 = (const __CFString **)MEMORY[0x24BDBD270];
      v10 = *(unsigned __int8 *)(v4 + 480);
      goto LABEL_25;
    }
    if (CFEqual(v2, CFSTR("IsP2PAllowed")))
    {
      v9 = (const __CFString **)MEMORY[0x24BDBD270];
      v10 = *(unsigned __int8 *)(v4 + 408);
      goto LABEL_25;
    }
    if (CFEqual(v2, CFSTR("RestrictToInfraAdvertising")))
    {
      v9 = (const __CFString **)MEMORY[0x24BDBD270];
      v10 = *(unsigned __int8 *)(v4 + 409);
      goto LABEL_25;
    }
    if (CFEqual(v2, CFSTR("IsPairingRequiredForP2PClients")))
    {
      v9 = (const __CFString **)MEMORY[0x24BDBD270];
      v10 = *(unsigned __int8 *)(v4 + 410);
      goto LABEL_25;
    }
    if (CFEqual(v2, CFSTR("VolumeDB")))
    {
      Int64 = (const __CFString *)CFNumberCreate(v16, kCFNumberFloat32Type, (const void *)(v4 + 688));
      if (Int64)
        goto LABEL_30;
      goto LABEL_86;
    }
    if (CFEqual(v2, CFSTR("VolumeControlType")))
    {
      v7 = *(const __CFString **)(v4 + 696);
      if (v7)
        goto LABEL_28;
    }
    else
    {
      if (!CFEqual(v2, CFSTR("VolumeControlTypeEx")))
      {
        if (CFEqual(v2, CFSTR("IsMuted")))
        {
          v9 = (const __CFString **)MEMORY[0x24BDBD270];
          v10 = *(unsigned __int8 *)(v4 + 713);
        }
        else if (CFEqual(v2, CFSTR("SupportRelativeVolumeTesting")))
        {
          v9 = (const __CFString **)MEMORY[0x24BDBD270];
          v10 = *(unsigned __int8 *)(v4 + 712);
        }
        else
        {
          if (CFEqual(v2, CFSTR("audioJackStatus")))
          {
            v7 = CFSTR("connected");
            goto LABEL_28;
          }
          if (CFEqual(v2, CFSTR("skewCompensation")))
            goto LABEL_45;
          if (CFEqual(v2, CFSTR("AdvertiserInfo")))
          {
            v7 = *(const __CFString **)(v4 + 56);
            if (v7)
              goto LABEL_28;
            goto LABEL_126;
          }
          if (CFEqual(v2, CFSTR("IsAirPlayEnabled")))
          {
            v9 = (const __CFString **)MEMORY[0x24BDBD270];
            v10 = *(unsigned __int8 *)(v4 + 64);
          }
          else
          {
            if (CFEqual(v2, CFSTR("DenyInterruptions")))
            {
              v7 = *(const __CFString **)(v4 + 88);
              if (v7)
                goto LABEL_28;
              v9 = (const __CFString **)MEMORY[0x24BDBD270];
              v10 = *(unsigned __int8 *)(v4 + 80);
              goto LABEL_25;
            }
            if (CFEqual(v2, CFSTR("OverscanOverride")))
            {
              Int64 = (const __CFString *)CFNumberCreate(v16, kCFNumberIntType, (const void *)(v4 + 676));
              if (Int64)
                goto LABEL_30;
              goto LABEL_86;
            }
            if (CFEqual(v2, CFSTR("DisplayUUID")))
            {
              Int64 = CFSTR("e5f7a68d-7b0f-4305-984b-974f677a150b");
              CFRetain(CFSTR("e5f7a68d-7b0f-4305-984b-974f677a150b"));
              v19 = 0;
              goto LABEL_30;
            }
            if (CFEqual(v2, CFSTR("TimeoutDataSeconds")))
            {
              Int64 = (const __CFString *)CFNumberCreate(v16, kCFNumberIntType, (const void *)(v4 + 564));
              if (Int64)
                goto LABEL_30;
              goto LABEL_86;
            }
            if (!CFEqual(v2, CFSTR("QoSDisabled")))
            {
              if (CFEqual(v2, CFSTR("DeviceID")))
              {
                HardwareAddressToCString();
                v11 = CFStringCreateWithCString(v16, valuePtr, 0x8000100u);
                goto LABEL_29;
              }
              if (gLogCategory_APReceiverSystemInfo <= 50
                && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              goto LABEL_126;
            }
            v9 = (const __CFString **)MEMORY[0x24BDBD270];
            v10 = *(unsigned __int8 *)(v4 + 560);
          }
        }
LABEL_25:
        if (!v10)
          v9 = (const __CFString **)MEMORY[0x24BDBD268];
        goto LABEL_27;
      }
      v7 = *(const __CFString **)(v4 + 704);
      if (v7)
        goto LABEL_28;
    }
LABEL_126:
    Int64 = 0;
    goto LABEL_30;
  }
  if (v3 && (v17 = CFGetTypeID(v3), v17 == CFBooleanGetTypeID()))
    Value = CFBooleanGetValue(v3);
  else
    Value = 1;
  Int64 = sysInfo_copyPasscodeString(v4, Value, v16, &v19);
  if (!v19)
    goto LABEL_30;
  APSLogErrorAt();
  if (Int64)
    CFRelease(Int64);
LABEL_31:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v19;
}

@end
