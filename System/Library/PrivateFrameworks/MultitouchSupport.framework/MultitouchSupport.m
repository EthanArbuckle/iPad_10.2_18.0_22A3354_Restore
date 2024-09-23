uint64_t MTDeviceSetReport(uint64_t a1, int a2, uint64_t a3, signed int a4)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    if (a4 <= 512)
    {
      if (*(_DWORD *)(a1 + 212))
        return mt_DeviceSetReportViaDriver(a1, a2, a3, a4);
      else
        return mt_DeviceSetReportViaDriverLegacyUSB(a1, a2, a3, a4);
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

uint64_t MTDevicePowerSetState(io_service_t *a1, int a2)
{
  __int128 v4;
  char v5;
  __int128 v6;
  unsigned int v7;
  _DWORD __b[129];
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE outputStruct[516];
  int inputStruct;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41 = v4;
  v42 = v4;
  v39 = v4;
  v40 = v4;
  v37 = v4;
  v38 = v4;
  v35 = v4;
  v36 = v4;
  v33 = v4;
  v34 = v4;
  v31 = v4;
  v32 = v4;
  v29 = v4;
  v30 = v4;
  v27 = v4;
  v28 = v4;
  v26 = v4;
  v25 = v4;
  v24 = v4;
  v23 = v4;
  v22 = v4;
  v21 = v4;
  v20 = v4;
  v19 = v4;
  v18 = v4;
  v17 = v4;
  v16 = v4;
  v15 = v4;
  v14 = v4;
  v13 = v4;
  v12 = v4;
  v11 = v4;
  memset(__b, 170, sizeof(__b));
  v10 = 4;
  if (!a2)
  {
    v5 = 0;
LABEL_6:
    LOBYTE(v11) = v5;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v75 = v6;
    v76 = v6;
    v73 = v6;
    v74 = v6;
    v71 = v6;
    v72 = v6;
    v69 = v6;
    v70 = v6;
    v67 = v6;
    v68 = v6;
    v65 = v6;
    v66 = v6;
    v63 = v6;
    v64 = v6;
    v61 = v6;
    v62 = v6;
    v60 = v6;
    v59 = v6;
    v58 = v6;
    v57 = v6;
    v56 = v6;
    v55 = v6;
    v54 = v6;
    v53 = v6;
    v52 = v6;
    v51 = v6;
    v50 = v6;
    v49 = v6;
    v48 = v6;
    v47 = v6;
    v46 = v6;
    v45 = v6;
    memset(outputStruct, 170, sizeof(outputStruct));
    inputStruct = 12;
    MTDeviceIssueDriverRequest(a1, &inputStruct, outputStruct);
    v7 = MTDeviceIssueDriverRequest(a1, &v10, __b);
    MTDeviceUpdateUILockState((uint64_t)a1, 1);
    goto LABEL_8;
  }
  if (a2 != 2)
  {
    if (a2 != 1)
      return 3758097090;
    v5 = 1;
    goto LABEL_6;
  }
  LOBYTE(v11) = 2;
  v7 = MTDeviceIssueDriverRequest(a1, &v10, __b);
LABEL_8:
  if (v7)
    return v7;
  else
    return __b[0];
}

uint64_t MTDeviceIssueDriverRequest(io_service_t *a1, void *inputStruct, void *outputStruct)
{
  uint64_t v3;
  unsigned int v7;
  BOOL v8;
  int v9;
  mach_port_t v11;
  size_t v13;
  mach_timespec_t outputStructCnt;
  io_connect_t connect;

  v3 = 3758097090;
  if (a1 && inputStruct && outputStruct)
  {
    v7 = a1[53];
    v8 = v7 > 4;
    v9 = (1 << v7) & 0x16;
    if (v8 || v9 == 0)
    {
      return 3758097095;
    }
    else
    {
      v11 = a1[5];
      if (v11)
      {
        outputStructCnt = (mach_timespec_t)516;
        return IOConnectCallStructMethod(v11, 4u, inputStruct, 0x204uLL, outputStruct, (size_t *)&outputStructCnt);
      }
      else
      {
        connect = 0;
        outputStructCnt = (mach_timespec_t)5;
        if (IOServiceWaitQuiet(a1[4], &outputStructCnt) == -536870186)
          printf("MT Error: service still busy after %d seconds\n", outputStructCnt.tv_sec);
        v3 = IOServiceOpen(a1[4], *MEMORY[0x24BDAEC58], 0, &connect);
        if (!(_DWORD)v3)
        {
          v13 = 516;
          v3 = IOConnectCallStructMethod(connect, 4u, inputStruct, 0x204uLL, outputStruct, &v13);
        }
        IOServiceClose(connect);
      }
    }
  }
  return v3;
}

void mt_HandleMultitouchFrame(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  if (a2)
    __memcpy_chk();
  kdebug_trace();
  if (a2 && (_DWORD)a3 && !*(_BYTE *)(a1 + 135))
  {
    if (*(_QWORD *)(a1 + 5664))
    {
      *(_BYTE *)(a1 + 5676) = 0;
      mach_absolute_time();
    }
    if (*(_QWORD *)(a1 + 2224))
      mt_ApplyBinaryFilters(a1, a2, a3, a4);
    else
      mt_ProcessMultitouchFrame(a1, a2, a3);
    if (*(_QWORD *)(a1 + 5664))
    {
      if (*(_BYTE *)(a1 + 5676))
      {
        mach_absolute_time();
        work_interval_join();
        work_interval_notify();
        work_interval_leave();
      }
    }
  }
}

void mt_DequeueMultitouchDataMachPortCallBack(CFMachPortRef port, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  IOReturn v7;
  uint32_t dataSize;

  if (a4)
  {
    v5 = *(_QWORD *)a4;
    while (!*(_BYTE *)(v5 + 2040))
    {
      if (!CFMachPortIsValid(port) || !IODataQueueDataAvailable(*(IODataQueueMemory **)(a4 + 24)))
        break;
      dataSize = *(_DWORD *)(v5 + 384);
      v7 = IODataQueueDequeue(*(IODataQueueMemory **)(a4 + 24), *(void **)(a4 + 8), &dataSize);
      if (v7 == -536870181)
      {
        IODataQueueDequeue(*(IODataQueueMemory **)(a4 + 24), 0, 0);
      }
      else if (!v7)
      {
        mt_HandleMultitouchFrame(v5, *(unsigned __int8 **)(a4 + 8), dataSize, *(_DWORD *)(v5 + 384));
      }
    }
  }
}

uint64_t mt_DeviceSetReportViaDriver(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  io_connect_t v8;
  io_service_t v9;
  mach_timespec_t waitTime;
  size_t outputStructCnt;
  io_connect_t connect;
  char outputStruct;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[19];
  unsigned int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  if (!a1)
    return 3758097101;
  *(_DWORD *)&v46[15] = -1431655766;
  outputStructCnt = 520;
  outputStruct = a2;
  if (a4 > 0x200)
  {
    puts("Too many bytes for the report to be set");
    return 3758097128;
  }
  v47 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  *(_OWORD *)v46 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  __memmove_chk();
  v8 = *(_DWORD *)(a1 + 20);
  connect = v8;
  if (v8)
  {
    v4 = IOConnectCallStructMethod(v8, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
    if (!(_DWORD)v4)
      return v4;
    goto LABEL_13;
  }
  v9 = *(_DWORD *)(a1 + 16);
  waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(v9, &waitTime) == -536870186)
    printf("MT Error: service still busy after %d seconds\n", waitTime.tv_sec);
  if (!IOServiceOpen(v9, *MEMORY[0x24BDAEC58], 0, &connect))
    v4 = IOConnectCallStructMethod(connect, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  IOServiceClose(connect);
  if ((_DWORD)v4)
  {
LABEL_13:
    if (!gMT_BE_LESS_VERBOSE)
      printf("Error 0x%08X setting report 0x%02X with length %d\n", v4, a2, a4);
  }
  return v4;
}

void mt_ProcessMultitouchFrame(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void (*v29)(uint64_t, uint64_t, _QWORD);
  uint64_t j;
  void (*v31)(uint64_t, uint64_t, _QWORD);
  uint64_t k;
  void (*v33)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD);
  unsigned int v34;
  unsigned int v35;
  uint64_t m;
  void (*v37)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD);
  void (*v38)(uint64_t, uint64_t, _QWORD);
  int v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, _QWORD);
  uint64_t i10;
  void (*v44)(uint64_t, uint64_t, _QWORD);
  uint64_t n;
  void (*v46)(uint64_t, uint64_t, _QWORD);
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i9;
  void (*v54)(uint64_t, uint64_t, _QWORD);
  uint64_t v55;
  uint64_t i11;
  void (*v57)(uint64_t, uint64_t, _QWORD);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  int v64;
  uint64_t v65;
  uint64_t ii;
  void (*v67)(uint64_t, uint64_t, _QWORD);
  uint64_t jj;
  void (*v69)(uint64_t, uint64_t, _QWORD);
  uint64_t kk;
  void (*v71)(uint64_t, uint64_t, _QWORD);
  uint64_t mm;
  void (*v73)(uint64_t, uint64_t, _QWORD);
  uint64_t nn;
  void (*v75)(uint64_t, uint64_t, _QWORD);
  uint64_t i1;
  void (*v77)(uint64_t, uint64_t, _QWORD);
  uint64_t i2;
  void (*v79)(uint64_t, uint64_t, _QWORD);
  uint64_t i3;
  void (*v81)(uint64_t, uint64_t, _QWORD);
  uint64_t i4;
  void (*v83)(uint64_t, uint64_t, _QWORD);
  uint64_t i5;
  void (*v85)(uint64_t, uint64_t, _QWORD);
  uint64_t i6;
  void (*v87)(uint64_t, uint64_t, _QWORD);
  uint64_t i7;
  void (*v89)(uint64_t, uint64_t, _QWORD);
  uint64_t i8;
  void (*v91)(uint64_t, uint64_t, _QWORD);
  unsigned int v92;
  unsigned __int16 v93;
  uint8_t buf[40];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  if (!a2 || !(_DWORD)a3)
    return;
  v6 = (unsigned __int8 *)(a1 + 5648);
  v7 = *(_QWORD *)(a1 + 392);
  MTProcessedFrameInit(a1);
  mt_PostFullFrameCallbacks(a1, (uint64_t)a2, a3);
  ParsedMultitouchFrameRepInitialize(v7);
  *(_WORD *)(v7 + 30) = *(_DWORD *)(a1 + 88);
  *(_WORD *)(v7 + 28) = *(_DWORD *)(a1 + 84);
  *(_WORD *)(v7 + 32) = *(_WORD *)(a1 + 364);
  v8 = *a2;
  v9 = v6[7];
  if (v6[7])
  {
    if (*v6 == (_DWORD)v8)
      goto LABEL_9;
    v10 = 0;
    do
    {
      v11 = v10;
      if (v9 - 1 == v10)
        break;
      v12 = *(unsigned __int8 *)(a1 + 5649 + v10++);
    }
    while (v12 != (_DWORD)v8);
    if (v11 + 1 < v9)
    {
LABEL_9:
      v13 = (uint64_t)(a2 + 1);
      v14 = (a3 - 1);
LABEL_10:
      mt_PostExternalMessage(a1, v13, v8, v14);
      goto LABEL_98;
    }
  }
  if (*a2 <= 0x72u)
  {
    switch(*a2)
    {
      case '$':
      case '%':
      case '&':
        MTParse_CompactBinaryPath(a2, a3, v7, (__MTDevice *)a1);
        if ((v15 & 1) != 0)
          goto LABEL_59;
        goto LABEL_98;
      case '\'':
      case ')':
        if ((MTParse_CompactV3orV5BinaryPath(a2, a3, v7, a1) & 1) != 0)
          goto LABEL_59;
        goto LABEL_98;
      case '(':
        if (MTParse_CompactV4BinaryPath(a2, a3, v7, a1))
          goto LABEL_59;
        goto LABEL_98;
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
      case '/':
      case '0':
        goto LABEL_40;
      case '1':
        if ((MTParse_CompactV7BinaryPath(a2, a3, v7, a1) & 1) != 0)
          goto LABEL_59;
        goto LABEL_98;
      case '2':
        if ((MTParse_CompactV8BinaryPath(a2, a3, v7, a1) & 1) != 0)
          goto LABEL_59;
        goto LABEL_98;
      case '3':
        if (MTParse_CompactV9BinaryPath((uint64_t)a2, a3, v7, a1))
          goto LABEL_59;
        goto LABEL_98;
      case '4':
        if (MTParse_CompactV10BinaryPath((uint64_t)a2, a3, v7, (__MTDevice *)a1))
          goto LABEL_59;
        goto LABEL_98;
      default:
        if ((v8 - 67) < 3)
        {
          if ((MTParse_BinaryPathOrImage(a2, a3, v7, (__MTDevice *)a1) & 1) != 0)
            goto LABEL_59;
          goto LABEL_98;
        }
        if ((_DWORD)v8 != 90)
          goto LABEL_40;
        if (!MTParse_SABinary((uint64_t)a2, a3, v7, a1))
          goto LABEL_98;
        goto LABEL_59;
    }
  }
  if (*a2 <= 0xC4u)
  {
    switch(*a2)
    {
      case 's':
      case 't':
        if ((MTParse_V3BinaryPathOrImage(a2, a3, v7, (__MTDevice *)a1) & 1) != 0)
          goto LABEL_59;
        break;
      case 'u':
      case 'v':
      case 'w':
        if ((MTParse_V4PrecisePathAndImage(a2, a3, v7, (__MTDevice *)a1) & 1) != 0)
          goto LABEL_59;
        break;
      case 'x':
        if ((MTParse_SensorImage(a2, a3, v7, (__MTDevice *)a1) & 1) != 0)
          goto LABEL_59;
        break;
      case 'y':
        if ((MTParse_HostPathAndImage(a2, a3, v7) & 1) != 0)
          goto LABEL_59;
        break;
      default:
        goto LABEL_40;
    }
    goto LABEL_98;
  }
  if ((v8 - 197) < 2)
  {
    if ((MTProcess_0xC5_Data(a2, a3, (MTParsedMultitouchFrameRep_t *)v7, (__MTDevice *)a1) & 1) != 0)
      goto LABEL_59;
  }
  else
  {
    if ((_DWORD)v8 == 204 || (_DWORD)v8 == 206)
    {
      if ((MTProcess_0xCC_Data(a2, a3, v7, a1) & 1) == 0)
        goto LABEL_98;
LABEL_59:
      mt_CheckForTimestampErrors(a1, *(_DWORD *)v7);
      if (!*(_QWORD *)(a1 + 152))
      {
        if (*(_BYTE *)(a1 + 133))
          mt_CachePropertiesForDevice(a1);
        else
          mt_InitializeAlgorithmsForDevice(a1, v19, v20, v21, v22, v23, v24, v25);
      }
      mt_UpdateDeviceOrientation(a1, 2 * *(unsigned __int8 *)(v7 + 53), 0);
      v26 = *(unsigned __int8 *)(v7 + 16);
      if (v26 >= *(unsigned __int8 *)(a1 + 176))
        v27 = *(_QWORD *)(a1 + 168);
      else
        v27 = *(_QWORD *)(a1 + 168) + 256;
      *(_QWORD *)(a1 + 168) = v27 & 0xFFFFFFFFFFFFFF00 | v26;
      *(_BYTE *)(a1 + 176) = v26;
      if (*(unsigned __int8 *)(a1 + 210) != *(unsigned __int8 *)(v7 + 55))
      {
        if (*(_BYTE *)(v7 + 55))
        {
          if (*(_BYTE *)(a1 + 1224))
          {
            for (i = 0; i != 32; i += 8)
            {
              v29 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i + 1192);
              if (v29)
                v29(a1, 29, *(_QWORD *)(a1 + i + 1232));
            }
          }
        }
        else if (*(_BYTE *)(a1 + 1224))
        {
          for (j = 0; j != 32; j += 8)
          {
            v31 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + j + 1192);
            if (v31)
              v31(a1, 30, *(_QWORD *)(a1 + j + 1232));
          }
        }
        *(_BYTE *)(a1 + 210) = *(_BYTE *)(v7 + 55);
      }
      mt_PostLegacyFrameHeaderCallbacks(a1, v7);
      mt_PostButtonStateCallbacks(a1, *(unsigned __int8 *)(v7 + 52));
      if (*(_BYTE *)(a1 + 1080))
      {
        for (k = 0; k != 32; k += 8)
        {
          v33 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))(a1 + k + 1048);
          if (v33)
            v33(a1, *(_QWORD *)(a1 + 168), a3, 1, *(_QWORD *)(a1 + k + 1088));
        }
      }
      mt_PostForceCentroidCallbacks(a1, v7);
      if (!*(_QWORD *)(a1 + 152))
      {
        puts("Algorithms uninitialized!");
        goto LABEL_92;
      }
      if (*(_BYTE *)(v7 + 39))
      {
LABEL_92:
        if (*(_BYTE *)(a1 + 1080))
        {
          for (m = 0; m != 32; m += 8)
          {
            v37 = *(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(a1 + m + 1048);
            if (v37)
              v37(a1, *(_QWORD *)(a1 + 168), a3, 0, *(_QWORD *)(a1 + m + 1088));
          }
        }
        *(_DWORD *)(a1 + 180) = *(_QWORD *)v7;
        goto LABEL_98;
      }
      v34 = *(unsigned __int8 *)(v7 + 8);
      if (v34 > 0x73)
      {
        if (v34 == 116 || v34 == 204 || v34 == 206)
          goto LABEL_90;
      }
      else
      {
        v35 = v34 - 36;
        if (v35 <= 0x20 && ((1 << v35) & 0x10000E03DLL) != 0)
        {
LABEL_90:
          mtalg_ProcessPathFrame(a1, v7, *(_QWORD *)(a1 + 168), *(_QWORD *)v7);
          goto LABEL_92;
        }
      }
      if (!*(_BYTE *)(v7 + 11) || *(_BYTE *)(v7 + 12))
      {
        mtalg_ProcessImageFrame(a1, v7, *(__int16 **)(v7 + 40), *(_QWORD *)(a1 + 168), *(_QWORD *)v7);
        goto LABEL_92;
      }
      goto LABEL_90;
    }
LABEL_40:
    if (a3 >= 2 && (_DWORD)v8 == 64)
    {
      if (a3 < 3 || a2[1])
      {
        switch(a2[1])
        {
          case 1u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (n = 0; n != 32; n += 8)
              {
                v46 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + n + 1192);
                if (v46)
                  v46(a1, 1, *(_QWORD *)(a1 + n + 1232));
              }
            }
            break;
          case 2u:
            *(_DWORD *)(a1 + 2064) = 0;
            *(_QWORD *)(a1 + 2056) = 0;
            *(_BYTE *)(a1 + 2068) = 0;
            *(_DWORD *)(a1 + 180) = 0;
            *(_BYTE *)(a1 + 176) = 0;
            mt_CachePropertiesForDevice(a1);
            if (*(_BYTE *)(a1 + 1224))
            {
              for (ii = 0; ii != 32; ii += 8)
              {
                v67 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + ii + 1192);
                if (v67)
                  v67(a1, 5, *(_QWORD *)(a1 + ii + 1232));
              }
            }
            break;
          case 3u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (jj = 0; jj != 32; jj += 8)
              {
                v69 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + jj + 1192);
                if (v69)
                  v69(a1, 6, *(_QWORD *)(a1 + jj + 1232));
              }
            }
            goto LABEL_196;
          case 4u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (kk = 0; kk != 32; kk += 8)
              {
                v71 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + kk + 1192);
                if (v71)
                  v71(a1, 7, *(_QWORD *)(a1 + kk + 1232));
              }
            }
            break;
          case 5u:
            *(_QWORD *)(a1 + 184) = 0;
            if (*(_BYTE *)(a1 + 1224))
            {
              for (mm = 0; mm != 32; mm += 8)
              {
                v73 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + mm + 1192);
                if (v73)
                  v73(a1, 8, *(_QWORD *)(a1 + mm + 1232));
              }
            }
LABEL_196:
            mt_FlushInternalStateForDevice(a1);
            break;
          case 6u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (nn = 0; nn != 32; nn += 8)
              {
                v75 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + nn + 1192);
                if (v75)
                  v75(a1, 14, *(_QWORD *)(a1 + nn + 1232));
              }
            }
            break;
          case 7u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i1 = 0; i1 != 32; i1 += 8)
              {
                v77 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i1 + 1192);
                if (v77)
                  v77(a1, 15, *(_QWORD *)(a1 + i1 + 1232));
              }
            }
            break;
          case 8u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i2 = 0; i2 != 32; i2 += 8)
              {
                v79 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i2 + 1192);
                if (v79)
                  v79(a1, 12, *(_QWORD *)(a1 + i2 + 1232));
              }
            }
            break;
          case 9u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i3 = 0; i3 != 32; i3 += 8)
              {
                v81 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i3 + 1192);
                if (v81)
                  v81(a1, 13, *(_QWORD *)(a1 + i3 + 1232));
              }
            }
            break;
          case 0xAu:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i4 = 0; i4 != 32; i4 += 8)
              {
                v83 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i4 + 1192);
                if (v83)
                  v83(a1, 16, *(_QWORD *)(a1 + i4 + 1232));
              }
            }
            break;
          case 0xBu:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i5 = 0; i5 != 32; i5 += 8)
              {
                v85 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i5 + 1192);
                if (v85)
                  v85(a1, 17, *(_QWORD *)(a1 + i5 + 1232));
              }
            }
            break;
          case 0xEu:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i6 = 0; i6 != 32; i6 += 8)
              {
                v87 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i6 + 1192);
                if (v87)
                  v87(a1, 32, *(_QWORD *)(a1 + i6 + 1232));
              }
            }
            break;
          case 0xFu:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i7 = 0; i7 != 32; i7 += 8)
              {
                v89 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i7 + 1192);
                if (v89)
                  v89(a1, 33, *(_QWORD *)(a1 + i7 + 1232));
              }
            }
            break;
          case 0x10u:
            if (*(_BYTE *)(a1 + 1224))
            {
              for (i8 = 0; i8 != 32; i8 += 8)
              {
                v91 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i8 + 1192);
                if (v91)
                  v91(a1, 34, *(_QWORD *)(a1 + i8 + 1232));
              }
            }
            break;
          default:
            goto LABEL_98;
        }
      }
      else if (*(_BYTE *)(a1 + 1224))
      {
        v16 = 0;
        v17 = a2[2];
        do
        {
          v18 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + v16 + 1192);
          if (v18)
            v18(a1, v17, *(_QWORD *)(a1 + v16 + 1232));
          v16 += 8;
        }
        while (v16 != 32);
      }
      goto LABEL_98;
    }
    if ((_DWORD)v8 != 80)
    {
      if (a3 >= 2 && (_DWORD)v8 == 96)
      {
        v39 = a2[1];
        if (*(_BYTE *)(a1 + 1224))
        {
          v40 = 0;
          v41 = (v39 + 300);
          do
          {
            v42 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + v40 + 1192);
            if (v42)
              v42(a1, v41, *(_QWORD *)(a1 + v40 + 1232));
            v40 += 8;
          }
          while (v40 != 32);
          v39 = a2[1];
        }
        if (v39 == 2)
        {
          *(_DWORD *)(a1 + 2064) = 0;
          *(_QWORD *)(a1 + 2056) = 0;
          *(_BYTE *)(a1 + 2068) = 0;
          *(_DWORD *)(a1 + 180) = 0;
          *(_QWORD *)(a1 + 184) = 0;
          mt_CachePropertiesForDevice(a1);
          if (*(_BYTE *)(a1 + 1224))
          {
            for (i9 = 0; i9 != 32; i9 += 8)
            {
              v54 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i9 + 1192);
              if (v54)
                v54(a1, 5, *(_QWORD *)(a1 + i9 + 1232));
            }
          }
        }
        else if (v39 == 1)
        {
          if (*(_BYTE *)(a1 + 1224))
          {
            for (i10 = 0; i10 != 32; i10 += 8)
            {
              v44 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i10 + 1192);
              if (v44)
                v44(a1, 6, *(_QWORD *)(a1 + i10 + 1232));
            }
          }
        }
        else if (a3 >= 3 && v39 == 48)
        {
          v55 = a2[2] ? 35 : 36;
          if (*(_BYTE *)(a1 + 1224))
          {
            for (i11 = 0; i11 != 32; i11 += 8)
            {
              v57 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + i11 + 1192);
              if (v57)
                v57(a1, v55, *(_QWORD *)(a1 + i11 + 1232));
            }
          }
        }
        goto LABEL_98;
      }
      if (*a2 > 0x7Fu)
      {
        if ((_DWORD)v8 != 128)
        {
          if ((_DWORD)v8 == 129)
          {
            *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
            if (MTParse_HIDOffTableHeightReport((uint64_t)a2, a3, (uint64_t)buf))
              mt_PostOffTableHeightCallbacks(a1, *(unsigned int *)&buf[4], 0, 0xFFFFFFFFLL);
            goto LABEL_98;
          }
          if ((_DWORD)v8 != 130)
            goto LABEL_169;
          *(_QWORD *)&v47 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)buf = v47;
          *(_OWORD *)&buf[16] = v47;
          if (!MTParse_HIDRelativePointerV2Report((uint64_t)a2, a3, (uint64_t)buf))
            goto LABEL_98;
          mt_PostTrackingCallbacks(a1, *(unsigned int *)&buf[8], *(unsigned int *)&buf[12], *(unsigned __int16 *)&buf[2]);
          v48 = *(unsigned int *)&buf[8];
          v49 = *(unsigned int *)&buf[12];
          v50 = *(unsigned int *)&buf[4];
          v51 = *(_QWORD *)&buf[24];
          v52 = a1;
LABEL_166:
          mt_PostRelativePointerCallbacks(v52, v48, v49, v50, v51);
          goto LABEL_98;
        }
        memset(buf, 170, 24);
        if (!MTParse_HIDRelativePointerReport((uint64_t)a2, a3, (uint64_t)buf))
          goto LABEL_98;
        mt_PostTrackingCallbacks(a1, *(unsigned int *)&buf[8], *(unsigned int *)&buf[12], *(unsigned __int16 *)&buf[2]);
        v62 = *(unsigned int *)&buf[8];
        v61 = *(unsigned int *)&buf[12];
        v60 = *(unsigned int *)&buf[4];
        v51 = mach_absolute_time();
        v52 = a1;
        v48 = v62;
        v49 = v61;
      }
      else
      {
        if ((_DWORD)v8 != 2)
        {
          if ((_DWORD)v8 == 82)
          {
            MTParse_TimestampSync(a2, a3, a1);
            goto LABEL_98;
          }
          if ((_DWORD)v8 == 83)
          {
            *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
            v93 = -21846;
            v92 = -1431655766;
            if (MTParse_ExternalMessage((uint64_t)a2, a3, buf, &v93, &v92))
            {
              v13 = *(_QWORD *)buf;
              v8 = v93;
              v14 = v92;
              goto LABEL_10;
            }
            goto LABEL_98;
          }
LABEL_169:
          if (*(_BYTE *)(a1 + 133))
            mt_CachePropertiesForDevice(a1);
          v63 = MTLoggingFramework();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            v64 = *a2;
            v65 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)&buf[4] = v64;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = a3;
            *(_WORD *)&buf[14] = 2048;
            *(_QWORD *)&buf[16] = v65;
            _os_log_impl(&dword_21A1DE000, v63, OS_LOG_TYPE_DEBUG, "Data packet with format 0x%02X length %u. Ignoring... (deviceID 0x%llX)", buf, 0x18u);
          }
          goto LABEL_98;
        }
        memset(buf, 170, 6);
        if (!MTParse_HIDMouseReport(a2, a3, buf))
          goto LABEL_98;
        mt_PostTrackingCallbacks(a1, (char)buf[2], (char)buf[3], 400);
        v58 = (char)buf[2];
        v59 = (char)buf[3];
        v60 = buf[1];
        v51 = mach_absolute_time();
        v52 = a1;
        v48 = v58;
        v49 = v59;
      }
      v50 = v60;
      goto LABEL_166;
    }
  }
LABEL_98:
  v38 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 1768);
  if (v38)
  {
    if ((*(_DWORD *)(a1 + 2004) & *(_DWORD *)(a1 + 2240)) != 0)
      v38(a1, a1 + 2240, *(_QWORD *)(a1 + 1808));
  }
}

uint64_t mt_PostFullFrameCallbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t i;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, _QWORD);

  v5 = result;
  if ((*(_BYTE *)(result + 2004) & 1) != 0)
  {
    *(_DWORD *)(result + 2240) |= 1u;
    *(_QWORD *)(result + 2248) = a2;
    *(_DWORD *)(result + 2256) = a3;
  }
  if (*(_BYTE *)(result + 1152))
  {
    for (i = 0; i != 32; i += 8)
    {
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v5 + i + 1120);
      if (v7)
        result = v7(v5, a2, a3, *(_QWORD *)(v5 + i + 1160));
    }
  }
  return result;
}

void ParsedMultitouchFrameRepInitialize(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 48);
  bzero((void *)a1, 0x678uLL);
  *(_QWORD *)(a1 + 40) = v2;
  *(_DWORD *)(a1 + 48) = v3;
}

double MTProcessedFrameInit(uint64_t a1)
{
  double result;

  *(_DWORD *)(a1 + 2240) = 0;
  *(_QWORD *)(a1 + 2248) = 0;
  *(_DWORD *)(a1 + 2256) = 0;
  *(_DWORD *)(a1 + 2284) = 0;
  *(_QWORD *)(a1 + 2260) = 0;
  *(_OWORD *)(a1 + 2268) = 0u;
  bzero((void *)(a1 + 2296), 0xC00uLL);
  result = 0.0;
  *(_OWORD *)(a1 + 5632) = 0u;
  *(_DWORD *)(a1 + 2288) = 0;
  *(_DWORD *)(a1 + 5368) = 0;
  return result;
}

BOOL MTParse_SABinary(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v6;
  unint64_t v7;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v4 = 0;
  v16[0] = a3;
  v16[1] = a4;
  v12 = 0;
  v13 = v16;
  v10 = a1 + 1;
  v11 = a2 - 1;
  v14 = 0xAAAAAAAAAAAAAA00;
  v15 = 0;
  if (v11 >= 2)
  {
    if (*(_BYTE *)(a1 + 1) != 1 || *(_BYTE *)(a1 + 2) != 2)
      return 0;
    v4 = 0;
    *(_WORD *)(a3 + 82) = 540;
    *(_BYTE *)(a3 + 80) = 90;
    *(_BYTE *)(a3 + 8) = 90;
    *(_BYTE *)(a3 + 15) = 2;
    *(_WORD *)(a3 + 62) = *(_WORD *)(a3 + 102);
    *(_BYTE *)(a3 + 64) = *(_BYTE *)(a3 + 104);
    *(_WORD *)(a3 + 66) = *(_WORD *)(a3 + 98);
    *(_DWORD *)(a3 + 68) = *(unsigned __int16 *)(a3 + 100);
    *(_BYTE *)(a3 + 72) = *(_BYTE *)(a3 + 96);
    *(_BYTE *)(a3 + 36) = 16;
    v6 = *(_DWORD *)(a3 + 88);
    *(_DWORD *)(a3 + 73) = v6;
    *(_BYTE *)(a3 + 52) = 0;
    *(_BYTE *)(a3 + 54) = v6;
    *(_BYTE *)(a3 + 11) = 0;
    *(_BYTE *)(a3 + 12) = *(_WORD *)(a3 + 94) != 0;
    *(_BYTE *)(a3 + 113) = 0;
    if ((unint64_t)(a2 - 7) <= 0xFFFFFFFFFFFFFFFBLL)
    {
      v7 = *(unsigned __int16 *)(a1 + 5);
      if (a2 - 7 < v7)
        return 0;
      v4 = 0;
      v12 = v7 + 6;
      if (v7 >= 0x10 && *(_WORD *)(a1 + 3) == 0x2000)
      {
        v4 = *(unsigned int *)(a1 + 15);
        if (*(_QWORD *)(a1 + 7) || (_DWORD)v4)
        {
          v9 = *(_QWORD *)(a1 + 7) / 0x3E8uLL;
          *(_DWORD *)(a3 + 84) = v9;
          *(_BYTE *)(a3 + 81) = v4;
          *(_BYTE *)(a3 + 16) = v4;
          *(_QWORD *)a3 = v9;
          if (SABinaryParser::parseInjExtData((uint64_t)&v10, (uint64_t (*)(uint64_t, unsigned __int8 *, char *))MTParse_SABinary::$_1::__invoke, (uint64_t (*)(_QWORD, unsigned __int8 *, unsigned __int8 *))MTParse_SABinary::$_2::__invoke, 0))return *(_BYTE *)(a3 + 11) != 0;
          return 0;
        }
      }
    }
  }
  return v4;
}

__CFArray *MTDeviceCreateList()
{
  __CFArray *Mutable;
  __CFArray *ListForDriverType;
  const __CFArray *v2;
  __CFArray *v3;
  const __CFArray *v4;
  CFRange v6;
  CFRange v7;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 25, MEMORY[0x24BDBD690]);
  ListForDriverType = __MTDeviceCreateListForDriverType(2u);
  if (ListForDriverType)
  {
    v2 = ListForDriverType;
    if (CFArrayGetCount(ListForDriverType) >= 1)
    {
      v6.length = CFArrayGetCount(v2);
      v6.location = 0;
      CFArrayAppendArray(Mutable, v2, v6);
    }
    CFRelease(v2);
  }
  v3 = __MTDeviceCreateListForDriverType(4u);
  if (v3)
  {
    v4 = v3;
    if (CFArrayGetCount(v3) >= 1)
    {
      v7.length = CFArrayGetCount(v4);
      v7.location = 0;
      CFArrayAppendArray(Mutable, v4, v7);
    }
    CFRelease(v4);
  }
  return Mutable;
}

__CFArray *__MTDeviceCreateListForDriverType(unsigned int a1)
{
  __CFArray *Mutable;
  const char *v3;
  const __CFDictionary *v4;
  kern_return_t MatchingServices;
  io_object_t v6;
  io_object_t v7;
  uint64_t v8;
  _DWORD *v9;
  io_iterator_t existing;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 25, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    existing = -1431655766;
    if (a1 > 4)
      v3 = "UnknownMultiouchDriverType";
    else
      v3 = off_24DC7DC58[a1];
    v4 = IOServiceMatching(v3);
    if (v4)
    {
      MatchingServices = IOServiceGetMatchingServices(0, v4, &existing);
      if (MatchingServices)
      {
        printf("IOServiceGetMatchingServices() returned 0x%08X\n", MatchingServices);
      }
      else
      {
        v6 = IOIteratorNext(existing);
        if (v6)
        {
          v7 = v6;
          do
          {
            v8 = MTDeviceCreateFromService(v7);
            if (v8)
            {
              v9 = (_DWORD *)v8;
              if (*(_BYTE *)(v8 + 133))
                mt_CachePropertiesForDevice(v8);
              if (v9[16])
                CFArrayAppendValue(Mutable, v9);
              CFRelease(v9);
            }
            IOObjectRelease(v7);
            v7 = IOIteratorNext(existing);
          }
          while (v7);
        }
        IOObjectRelease(existing);
      }
    }
    else
    {
      puts("IOServiceMatching() returned a NULL dictionary.");
    }
  }
  return Mutable;
}

__CFArray *MTDeviceCreateListFromDeviceUsagePairs(const __CFArray *a1)
{
  CFIndex Count;
  __CFArray *List;
  const __CFArray *v4;
  __CFArray *Mutable;
  CFIndex v6;
  CFIndex v7;
  CFIndex i;
  io_registry_entry_t *ValueAtIndex;
  io_registry_entry_t *v10;
  io_registry_entry_t v11;
  const __CFArray *CFProperty;
  const __CFArray *v13;
  CFIndex v14;
  CFIndex v15;
  const void *v16;
  const __CFAllocator *allocator;
  CFRange v19;

  if (!a1)
    return 0;
  Count = CFArrayGetCount(a1);
  List = MTDeviceCreateList();
  v4 = List;
  if (!Count)
    return List;
  if (!List)
    return 0;
  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v6 = CFArrayGetCount(v4);
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = (io_registry_entry_t *)CFArrayGetValueAtIndex(v4, i);
        if (ValueAtIndex)
        {
          v10 = ValueAtIndex;
          v11 = ValueAtIndex[4];
          if (v11)
          {
            CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(v11, CFSTR("DeviceUsagePairs"), allocator, 0);
            if (CFProperty)
            {
              v13 = CFProperty;
              if (Count >= 1)
              {
                v14 = 0;
                while (1)
                {
                  v15 = CFArrayGetCount(v13);
                  v16 = CFArrayGetValueAtIndex(a1, v14);
                  v19.location = 0;
                  v19.length = v15;
                  if (CFArrayContainsValue(v13, v19, v16))
                    break;
                  if (Count == ++v14)
                    goto LABEL_16;
                }
                CFArrayAppendValue(Mutable, v10);
              }
LABEL_16:
              CFRelease(v13);
            }
          }
        }
      }
    }
  }
  CFRelease(v4);
  return Mutable;
}

uint64_t MTDeviceGetService(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t MTDeviceCreateFromService(io_object_t a1)
{
  uint64_t v2;
  int v3;
  const __CFAllocator *v4;
  const __CFString *CFProperty;
  const __CFString *v6;
  CFTypeID v7;
  int v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  BOOL v12;

  if (!a1)
    return 0;
  v2 = MTDeviceCreate(a1);
  if (IOObjectConformsTo(a1, "AppleMultitouchSPI"))
  {
    v3 = 2;
  }
  else if (IOObjectConformsTo(a1, "AppleUSBMultitouchDriver"))
  {
    v3 = 1;
  }
  else if (IOObjectConformsTo(a1, "AppleMultitouchDevice"))
  {
    v3 = 4;
  }
  else if (IOObjectConformsTo(a1, "AppleMultitouchDummy"))
  {
    v3 = 3;
  }
  else if (IOObjectConformsTo(a1, "MultitouchDriver"))
  {
    v3 = 0;
  }
  else
  {
    v3 = 255;
  }
  *(_DWORD *)(v2 + 212) = v3;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a1, CFSTR("Transport"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v6 = CFProperty;
  if (!CFProperty || (v7 = CFGetTypeID(CFProperty), v7 != CFStringGetTypeID()))
  {
    if (IOObjectConformsTo(a1, "AppleMultitouchSPI"))
    {
      v8 = 2;
    }
    else if (IOObjectConformsTo(a1, "AppleUSBMultitouchDriver"))
    {
      v8 = 1;
    }
    else if (IOObjectConformsTo(a1, "AppleMultitouchDevice"))
    {
      v8 = 4;
    }
    else if (IOObjectConformsTo(a1, "AppleMultitouchDummy"))
    {
      v8 = 3;
    }
    else if (IOObjectConformsTo(a1, "MultitouchDriver"))
    {
      v8 = 0;
    }
    else
    {
      v8 = 255;
    }
    if (!v6)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (CFStringCompare(v6, CFSTR("SPI"), 0))
  {
    if (CFStringCompare(v6, CFSTR("USB"), 0) == kCFCompareEqualTo)
    {
      v8 = 1;
      goto LABEL_41;
    }
    if (CFStringCompare(v6, CFSTR("Bluetooth"), 0) == kCFCompareEqualTo
      || CFStringCompare(v6, CFSTR("BluetoothLowEnergy"), 0) == kCFCompareEqualTo)
    {
      v8 = 4;
      goto LABEL_41;
    }
    if (CFStringCompare(v6, CFSTR("SPU"), 0))
    {
      if (CFStringCompare(v6, CFSTR("Dummy"), 0))
      {
        if (CFStringCompare(v6, CFSTR("Dummy Network"), 0))
        {
          if (CFStringCompare(v6, CFSTR("Dummy Playback"), 0))
            v8 = 255;
          else
            v8 = 6;
        }
        else
        {
          v8 = 5;
        }
      }
      else
      {
        v8 = 6;
      }
      goto LABEL_41;
    }
  }
  v8 = 2;
LABEL_41:
  CFRelease(v6);
LABEL_42:
  *(_DWORD *)(v2 + 216) = v8;
  if (CFPreferencesGetAppBooleanValue(CFSTR("Recording"), CFSTR("com.apple.MultitouchSupport"), 0) == 1 || !geteuid())
    *(_QWORD *)(v2 + 2104) = dispatch_semaphore_create(1);
  if (*(_DWORD *)(v2 + 212) == 3)
  {
    v12 = 0;
    if (mt_ServiceGetBoolProperty(*(_DWORD *)(v2 + 16), CFSTR("FramePumperPresent"), &v12) || !v12)
    {
      CFRelease((CFTypeRef)v2);
      v2 = 0;
    }
  }
  v9 = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("Multitouch Subdevice ID"), v4, 0);
  if (v9)
  {
    v10 = v9;
    CFNumberGetValue(v9, kCFNumberSInt8Type, (void *)(v2 + 2152));
    CFRelease(v10);
  }
  return v2;
}

uint64_t MTDeviceGetGUID(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 3758097090;
  if (*(_BYTE *)(a1 + 133))
    mt_CachePropertiesForDevice(a1);
  result = 0;
  *a2 = *(_QWORD *)(a1 + 64);
  return result;
}

CFStringRef mt_CreateSavedNameForDevice(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;

  if (!a1)
  {
    v2 = 0;
    v3 = 0;
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("0x%016qX,0x%x"), v3, v2);
  }
  if (!*(_BYTE *)(a1 + 133))
  {
    v2 = *(unsigned int *)(a1 + 72);
    goto LABEL_8;
  }
  mt_CachePropertiesForDevice(a1);
  v2 = *(unsigned int *)(a1 + 72);
  if (!*(_BYTE *)(a1 + 133))
  {
LABEL_8:
    v3 = *(_QWORD *)(a1 + 64);
    goto LABEL_9;
  }
  mt_CachePropertiesForDevice(a1);
  v3 = *(_QWORD *)(a1 + 64);
  if (*(_BYTE *)(a1 + 133))
    mt_CachePropertiesForDevice(a1);
LABEL_9:
  v4 = *(_DWORD *)(a1 + 216);
  if (v4 <= 6 && ((1 << v4) & 0x68) != 0)
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("0x%016qX"), v3);
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("0x%016qX,0x%x"), v3, v2);
}

uint64_t MTDeviceGetFamilyID(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = *(_DWORD *)(a1 + 72);
  }
  return result;
}

uint64_t MTDeviceGetDeviceID(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = *(_QWORD *)(a1 + 64);
  }
  return result;
}

uint64_t MTDeviceGetTransportMethod(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = *(_DWORD *)(a1 + 216);
  }
  return result;
}

const void *MTDeviceCreateDefault()
{
  __CFArray *List;
  const __CFArray *v1;
  const __CFString *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  const void *ValueAtIndex;
  CFIndex v6;
  CFStringRef SavedNameForDevice;
  CFIndex v9;
  CFStringRef v10;
  _BYTE *v11;
  int v12;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  _BYTE *v17;
  CFRange v18;
  CFRange v19;

  List = MTDeviceCreateList();
  if (List)
  {
    v1 = List;
    if (CFArrayGetCount(List) < 1)
    {
      ValueAtIndex = 0;
      goto LABEL_21;
    }
    v2 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("DefaultDevice"), CFSTR("com.apple.MultitouchSupport"));
    v3 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("DisabledDevices"), CFSTR("com.apple.MultitouchSupport"));
    v4 = v3;
    if (v2)
    {
      if (v3)
      {
        v18.length = CFArrayGetCount(v3);
        v18.location = 0;
        if (CFArrayContainsValue(v4, v18, v2))
        {
          puts("(the specified Default device is Disabled)");
          ValueAtIndex = 0;
LABEL_18:
          CFRelease(v2);
          goto LABEL_19;
        }
      }
      if (CFArrayGetCount(v1) >= 1)
      {
        v6 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v1, v6);
          SavedNameForDevice = mt_CreateSavedNameForDevice((uint64_t)ValueAtIndex);
          if (CFStringCompare(v2, SavedNameForDevice, 1uLL))
          {
            CFRelease(SavedNameForDevice);
          }
          else
          {
            CFRetain(ValueAtIndex);
            CFRelease(SavedNameForDevice);
            if (ValueAtIndex)
              goto LABEL_17;
          }
          ++v6;
        }
        while (CFArrayGetCount(v1) > v6);
      }
      puts("(the specified Default device could not be found)");
LABEL_16:
      ValueAtIndex = 0;
LABEL_17:
      if (v2)
        goto LABEL_18;
    }
    else
    {
      if (v3 && CFArrayGetCount(v3))
      {
        if (CFArrayGetCount(v1) < 1)
        {
          ValueAtIndex = 0;
          goto LABEL_20;
        }
        v9 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v1, v9);
          v10 = mt_CreateSavedNameForDevice((uint64_t)ValueAtIndex);
          v19.length = CFArrayGetCount(v4);
          v19.location = 0;
          v11 = CFArrayContainsValue(v4, v19, v10) ? 0 : ValueAtIndex;
          v12 = v11[2152];
          CFRelease(v10);
          if (!v12 && v11 != 0)
            break;
          if (CFArrayGetCount(v1) <= ++v9)
            goto LABEL_16;
        }
        v17 = v11;
      }
      else
      {
        Count = CFArrayGetCount(v1);
        if (Count < 1)
        {
          ValueAtIndex = 0;
          goto LABEL_19;
        }
        v15 = Count;
        v16 = 0;
        while (1)
        {
          v17 = CFArrayGetValueAtIndex(v1, v16);
          if (!v17[2152])
            break;
          if (++v16 >= v15)
            goto LABEL_16;
        }
        ValueAtIndex = v17;
      }
      CFRetain(v17);
    }
LABEL_19:
    if (v4)
LABEL_20:
      CFRelease(v4);
LABEL_21:
    CFRelease(v1);
    return ValueAtIndex;
  }
  return 0;
}

_DWORD *MTDeviceCreateFromGUID(int a1)
{
  __CFArray *List;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  _DWORD *ValueAtIndex;
  _DWORD *v8;

  List = MTDeviceCreateList();
  if (!List)
    return 0;
  v3 = List;
  Count = CFArrayGetCount(List);
  if (Count < 1)
  {
LABEL_9:
    v8 = 0;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      if (ValueAtIndex)
      {
        v8 = ValueAtIndex;
        if (*((_BYTE *)ValueAtIndex + 133))
          mt_CachePropertiesForDevice((uint64_t)ValueAtIndex);
        if (v8[16] == a1)
          break;
      }
      if (v5 == ++v6)
        goto LABEL_9;
    }
    CFRetain(v8);
  }
  CFRelease(v3);
  return v8;
}

uint64_t mt_DeviceCreateFromDeviceID(uint64_t a1, int a2)
{
  const __CFAllocator *v3;
  CFNumberRef v4;
  CFNumberRef v5;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  io_object_t v10;
  uint64_t v11;
  io_object_t v12;
  io_iterator_t existing;
  uint64_t valuePtr;

  valuePtr = a1;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  if (v4)
  {
    v5 = v4;
    existing = 0;
    Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v7 = Mutable;
      v8 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v8)
      {
        v9 = v8;
        CFDictionarySetValue(v8, CFSTR("Multitouch ID"), v5);
        if (a2)
          CFDictionarySetValue(v9, CFSTR("MTHIDDevice"), (const void *)*MEMORY[0x24BDBD270]);
        CFDictionarySetValue(v7, CFSTR("IOPropertyMatch"), v9);
        CFRelease(v9);
        if (!IOServiceGetMatchingServices(0, v7, &existing))
        {
          while (1)
          {
            v12 = IOIteratorNext(existing);
            if (!v12)
              break;
            v10 = v12;
            v11 = MTDeviceCreateFromService(v12);
            IOObjectRelease(v10);
            if (v11)
              goto LABEL_11;
          }
          v11 = 0;
LABEL_11:
          IOObjectRelease(existing);
          goto LABEL_15;
        }
      }
      else
      {
        CFRelease(v7);
      }
    }
    v11 = 0;
LABEL_15:
    CFRelease(v5);
    return v11;
  }
  return 0;
}

uint64_t MTDeviceCreateFromDeviceID(uint64_t a1)
{
  return mt_DeviceCreateFromDeviceID(a1, 0);
}

uint64_t mt_DeviceGetBoolProperty(uint64_t a1, const __CFString *a2, BOOL *a3)
{
  if (a1 && a2 && a3)
    return mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), a2, a3);
  else
    return 3758097090;
}

void MTDeviceRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

BOOL MTDeviceIsAvailable()
{
  const void *Default;
  const void *v1;

  Default = MTDeviceCreateDefault();
  v1 = Default;
  if (Default)
    CFRelease(Default);
  return v1 != 0;
}

uint64_t mt_ParseExternalMessageIDs(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  uint64_t result;
  uint64_t v6;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID v9;

  v4 = CFGetTypeID(cf);
  result = CFArrayGetTypeID();
  if (v4 == result)
  {
    result = CFArrayGetCount((CFArrayRef)cf);
    if (result <= 7)
    {
      v6 = result;
      if (result < 1)
      {
LABEL_8:
        *(_BYTE *)(a1 + 5655) = v6;
      }
      else
      {
        v7 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)cf, v7);
          v9 = CFGetTypeID(ValueAtIndex);
          result = CFNumberGetTypeID();
          if (v9 != result)
            break;
          result = CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt8Type, (void *)(a1 + 5648 + v7));
          if (!(_DWORD)result)
            break;
          if (v6 == ++v7)
            goto LABEL_8;
        }
      }
    }
  }
  return result;
}

void mt_CachePropertiesForDevice(uint64_t a1)
{
  const void *v2;
  uint64_t *v3;
  _DWORD *v4;
  int Int32Property;
  _BOOL4 v6;
  _DWORD *v7;
  uint64_t v8;
  const void *v9;
  int BoolProperty;
  BOOL v11;
  void *v12;
  __int128 v13;
  void *v14;
  __int128 v15;
  const void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  CFTypeRef cf;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  BOOL v36;
  BOOL v37;
  BOOL v38;
  int v39;
  int v40;
  BOOL v41;
  int v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  uint64_t v52;
  int v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v53 = 0;
    v2 = *(const void **)(a1 + 152);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 152) = 0;
    }
    *(_BYTE *)(a1 + 2232) = 1;
    v3 = (uint64_t *)(a1 + 64);
    if (mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), CFSTR("Multitouch ID"), (_QWORD *)(a1 + 64)))
      *v3 = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("Family ID"), (_DWORD *)(a1 + 72)))
      *(_DWORD *)(a1 + 72) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("bcdVersion"), (_DWORD *)(a1 + 76)))
      *(_DWORD *)(a1 + 76) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("ExpectedVersion"), (_DWORD *)(a1 + 80)))
      *(_DWORD *)(a1 + 80) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("Sensor Rows"), (_DWORD *)(a1 + 84)))
      *(_DWORD *)(a1 + 84) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("Sensor Columns"), (_DWORD *)(a1 + 88)))
      *(_DWORD *)(a1 + 88) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("Endianness"), (_DWORD *)(a1 + 100)))
      *(_DWORD *)(a1 + 100) = 1;
    v4 = (_DWORD *)(a1 + 92);
    Int32Property = mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("Sensor Surface Width"), (_DWORD *)(a1 + 92));
    v6 = Int32Property != 0;
    if (Int32Property)
      *v4 = 5000;
    v7 = (_DWORD *)(a1 + 96);
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("Sensor Surface Height"), (_DWORD *)(a1 + 96)))
    {
      *v7 = 7500;
      v6 = 1;
    }
    v52 = 0;
    if (!mt_ServiceGetStringProperty(*(_DWORD *)(a1 + 16), CFSTR("Multitouch Serial Number"), &v52))
    {
      v8 = v52;
      if (v52)
      {
        v9 = *(const void **)(a1 + 104);
        if (v9)
        {
          CFRelease(v9);
          v8 = v52;
        }
        *(_QWORD *)(a1 + 104) = v8;
      }
    }
    v51 = 0;
    BoolProperty = mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("Driver is Ready"), &v51);
    v11 = v51;
    if (BoolProperty)
      v11 = 1;
    *(_BYTE *)(a1 + 134) = v11;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("parser-type"), (_DWORD *)(a1 + 2072)))
      *(_DWORD *)(a1 + 2072) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("parser-options"), (_DWORD *)(a1 + 2076)))
      *(_DWORD *)(a1 + 2076) = 0;
    v50 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("MTHIDDevice"), &v50))
      *(_BYTE *)(a1 + 2080) = v50;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("touch-size-id"), (_DWORD *)(a1 + 2084)))
      *(_DWORD *)(a1 + 2084) = 0;
    v49 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("MT Built-In"), &v49))
      *(_BYTE *)(a1 + 2088) = v49;
    v48 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("MaintainPowerInUILock"), &v48))
      *(_BYTE *)(a1 + 114) = v48;
    v47 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("PowerControlSupported"), &v47))
      *(_BYTE *)(a1 + 115) = v47;
    v46 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("SupportTapToWake"), &v46))
      *(_BYTE *)(a1 + 116) = v46;
    v45 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("SupportTouchReadyNotification"), &v45))
      *(_BYTE *)(a1 + 117) = v45;
    v44 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("ShouldSkipFaceDetectionMode"), &v44))
      *(_BYTE *)(a1 + 129) = v44;
    v43 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("FirstPowerOffSuppressed"), &v43))
      *(_BYTE *)(a1 + 119) = v43;
    v42 = 0;
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("SATelemetryReportID"), &v42))
      *(_BYTE *)(a1 + 5677) = v42;
    v41 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("ContextualPower"), &v41))
      *(_BYTE *)(a1 + 118) = v41;
    v40 = 0;
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("ResetOnLockMs"), &v40))
      *(_DWORD *)(a1 + 120) = v40;
    v39 = 0;
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("ResetOnUnlockMs"), &v39))
      *(_DWORD *)(a1 + 124) = v39;
    v38 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("ShouldResetOnButton"), &v38))
      *(_BYTE *)(a1 + 128) = v38;
    v37 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("AlwaysNeedsVelocityCalculated"), &v37))
      *(_BYTE *)(a1 + 130) = v37;
    v36 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("ShouldDispatchNormalizedVelocity"), &v36))
      *(_BYTE *)(a1 + 131) = v36;
    v35 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("ShouldDispatchRelativeCoordinates"), &v35))*(_BYTE *)(a1 + 132) = v35;
    v34 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("ActuationSupported"), &v34))
      *(_BYTE *)(a1 + 24) = v34;
    v33 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("ForceSupported"), &v33))
      *(_BYTE *)(a1 + 40) = v33;
    v32 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("WirelessChargingNotificationSupported"), &v32))*(_BYTE *)(a1 + 42) = v32;
    v31 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("USBChargingNotificationSupported"), &v31))
      *(_BYTE *)(a1 + 43) = v31;
    cf = 0;
    if (!mt_DeviceCopyArrayProperty(a1, CFSTR("ExternalMessageIDs"), &cf) && cf)
    {
      mt_ParseExternalMessageIDs(a1, cf);
      CFRelease(cf);
    }
    if (mt_ServiceCFPropertyExists(*(_DWORD *)(a1 + 16), CFSTR("SupportsSilentClick"))
      && mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), CFSTR("SupportsSilentClick"), (BOOL *)(a1 + 41)))
    {
      *(_BYTE *)(a1 + 41) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("MinDigitizerPressureValue"), (_DWORD *)(a1 + 44)))*(_DWORD *)(a1 + 44) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("AccurateMaxDigitizerPressureValue"), (_DWORD *)(a1 + 48)))*(_DWORD *)(a1 + 48) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("ExtendedMaxDigitizerPressureValue"), (_DWORD *)(a1 + 52)))*(_DWORD *)(a1 + 52) = 0;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("MaxHoverHeight"), (_DWORD *)(a1 + 56)))
      *(_DWORD *)(a1 + 56) = 0;
    v29 = 0;
    v28 = 0;
    v27 = 0;
    v26 = 0;
    v25 = 0;
    v24 = 0;
    mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("Sensor Region Descriptor"), (UInt8 **)&v29, &v28);
    MTParseSensorRegionsReport((unsigned __int8 *)v29, v28, (char *)(a1 + 220), 20);
    mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("Sensor Surface Descriptor"), (UInt8 **)&v25, &v24);
    if ((MTParseSensorSurfaceDescriptor((uint64_t)v25, v24, a1 + 368, a1) & 1) != 0)
    {
      if (v6)
        *(_QWORD *)v4 = *(_QWORD *)(a1 + 368);
    }
    else
    {
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 92);
      *(_QWORD *)(a1 + 376) = 0;
    }
    mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("Sensor Region Param"), (UInt8 **)&v27, &v26);
    if ((MTParseSensorRegionParam((unsigned __int16 *)v27, v26, (_WORD *)(a1 + 360), a1) & 1) == 0)
    {
      *(_DWORD *)(a1 + 360) = 0;
      *(_WORD *)(a1 + 364) = 255;
    }
    if (v29)
      free(v29);
    if (v27)
      free(v27);
    if (v25)
      free(v25);
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("WANTS_FRAMES_IGNORED"), &v53))
    {
      if (CFPreferencesGetAppBooleanValue(CFSTR("NoBrick"), CFSTR("com.apple.MultitouchSupport"), 0))
      {
        *(_BYTE *)(a1 + 135) = 0;
      }
      else
      {
        *(_BYTE *)(a1 + 135) = 1;
        puts("Multitouch: Ignoring frames from device!");
      }
    }
    if (CFPreferencesGetAppBooleanValue(CFSTR("BrickDevice"), CFSTR("com.apple.MultitouchSupport"), 0) == 1)
    {
      *(_BYTE *)(a1 + 135) = 1;
      puts("Multitouch: Ignoring frames from device!");
    }
    v23 = 0;
    v22 = 0;
    if (!mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("AnimationThresholds"), (UInt8 **)&v23, &v22))
    {
      v12 = v23;
      if (v22 == 20)
      {
        v13 = *(_OWORD *)v23;
        *(_DWORD *)(a1 + 2172) = *((_DWORD *)v23 + 4);
        *(_OWORD *)(a1 + 2156) = v13;
      }
      free(v12);
    }
    v23 = 0;
    v22 = 0;
    if (!mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("ActivationThresholds"), (UInt8 **)&v23, &v22))
    {
      v14 = v23;
      if (v22 == 20)
      {
        v15 = *(_OWORD *)v23;
        *(_DWORD *)(a1 + 2192) = *((_DWORD *)v23 + 4);
        *(_OWORD *)(a1 + 2176) = v15;
      }
      free(v14);
    }
    v21 = 0;
    if (!mt_DeviceCopyDictionaryProperty(a1, CFSTR("MultipleFirmwaresConfig"), &v21))
    {
      v16 = *(const void **)(a1 + 5680);
      if (v16)
        CFRelease(v16);
      *(_QWORD *)(a1 + 5680) = v21;
    }
    *(_BYTE *)(a1 + 133) = 0;
    if (v6)
    {
      v17 = MTLoggingFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *v4;
        v19 = *v7;
        v20 = *v3;
        *(_DWORD *)buf = 134218496;
        v55 = v18;
        v56 = 2048;
        v57 = v19;
        v58 = 2048;
        v59 = v20;
        _os_log_impl(&dword_21A1DE000, v17, OS_LOG_TYPE_ERROR, "Sensor Surface dimensions not provided. Using defaults or getting from descriptor (%lu x %lu) (deviceID 0x%llX)", buf, 0x20u);
      }
    }
  }
}

void mt_TerminateAlgorithmsForDevice(uint64_t a1)
{
  const void *v2;

  if (a1)
  {
    v2 = *(const void **)(a1 + 152);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 152) = 0;
    }
    *(_BYTE *)(a1 + 2232) = 1;
  }
}

uint64_t mt_DeviceGetInt64Property(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  if (a1 && a2 && a3)
    return mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), a2, a3);
  else
    return 3758097090;
}

uint64_t mt_DeviceGetInt32Property(uint64_t a1, const __CFString *a2, _DWORD *a3)
{
  if (a1 && a2 && a3)
    return mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), a2, a3);
  else
    return 3758097090;
}

uint64_t mt_DeviceGetStringProperty(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  if (a1 && a2 && a3)
    return mt_ServiceGetStringProperty(*(_DWORD *)(a1 + 16), a2, a3);
  else
    return 3758097090;
}

uint64_t mt_DeviceCopyArrayProperty(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  uint64_t result;
  io_registry_entry_t v6;
  CFTypeRef CFProperty;
  const void *v8;
  CFTypeID v9;

  result = 3758097090;
  if (a1)
  {
    if (a3)
    {
      if (a2)
      {
        v6 = *(_DWORD *)(a1 + 16);
        if (v6)
        {
          CFProperty = IORegistryEntryCreateCFProperty(v6, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          *a3 = 0;
          if (CFProperty)
          {
            v8 = CFProperty;
            v9 = CFGetTypeID(CFProperty);
            if (v9 == CFArrayGetTypeID())
            {
              result = 0;
              *a3 = v8;
              return result;
            }
            CFRelease(v8);
          }
          return 3758097084;
        }
      }
    }
  }
  return result;
}

uint64_t mt_DeviceCFPropertyExists(uint64_t a1, const __CFString *a2)
{
  if (a1 && a2)
    return mt_ServiceCFPropertyExists(*(_DWORD *)(a1 + 16), a2);
  else
    return 0;
}

uint64_t mt_DeviceGetSensorRegionDescriptor(uint64_t a1, UInt8 **a2, _DWORD *a3)
{
  if (a1 && a2 && a3)
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("Sensor Region Descriptor"), a2, a3);
  else
    return 3758097090;
}

uint64_t mt_DeviceGetSensorSurfaceDescriptor(uint64_t a1, UInt8 **a2, _DWORD *a3)
{
  if (a1 && a2 && a3)
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("Sensor Surface Descriptor"), a2, a3);
  else
    return 3758097090;
}

uint64_t mt_DeviceGetSensorRegionParam(uint64_t a1, UInt8 **a2, _DWORD *a3)
{
  if (a1 && a2 && a3)
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), CFSTR("Sensor Region Param"), a2, a3);
  else
    return 3758097090;
}

uint64_t mt_DeviceGetDataProperty(uint64_t a1, const __CFString *a2, UInt8 **a3, _DWORD *a4)
{
  if (a1 && a2 && a3 && a4)
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), a2, a3, a4);
  else
    return 3758097090;
}

uint64_t mt_DeviceCopyDictionaryProperty(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  uint64_t result;
  io_registry_entry_t v6;
  CFTypeRef CFProperty;
  const void *v8;
  CFTypeID v9;

  result = 3758097090;
  if (a1 && a2 && a3)
  {
    v6 = *(_DWORD *)(a1 + 16);
    if (v6)
    {
      CFProperty = IORegistryEntryCreateCFProperty(v6, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      *a3 = 0;
      if (CFProperty)
      {
        v8 = CFProperty;
        v9 = CFGetTypeID(CFProperty);
        if (v9 == CFDictionaryGetTypeID())
        {
          result = 0;
          *a3 = v8;
          return result;
        }
        CFRelease(v8);
      }
      return 3758097084;
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t MTDeviceStart(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint32_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  CFTypeRef *v15;
  pthread_t v17;
  io_connect_t connect;
  _BYTE buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097090;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      return 3758097109;
    }
    else
    {
      *(_DWORD *)(a1 + 160) = a2;
      if ((a2 & 0x10000000) != 0)
        gMT_BE_LESS_VERBOSE = 1;
      if (*(_BYTE *)(a1 + 133))
        mt_CachePropertiesForDevice(a1);
      if (!*(_DWORD *)(a1 + 72) && (*(_BYTE *)(a1 + 163) & 0x40) == 0)
      {
        MTDeviceForcePropertiesRecache((io_service_t *)a1);
        mt_CachePropertiesForDevice(a1);
        if (!*(_DWORD *)(a1 + 72))
        {
          if (*(_BYTE *)(a1 + 133))
            mt_CachePropertiesForDevice(a1);
          v4 = MTLoggingFramework();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            v5 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v5;
            _os_log_impl(&dword_21A1DE000, v4, OS_LOG_TYPE_ERROR, "familyID is invalid, even after AMD re-fetching properties (deviceID 0x%llX)", buf, 0xCu);
          }
        }
      }
      connect = 0;
      *(_QWORD *)buf = 5;
      if (IOServiceWaitQuiet(*(_DWORD *)(a1 + 16), (mach_timespec_t *)buf) == -536870186)
        printf("MT Error: service still busy after %d seconds\n", *(_DWORD *)buf);
      if (*(_DWORD *)(a1 + 212) == 4)
        v6 = (*(unsigned __int8 *)(a1 + 163) << 25 >> 31) & 0x464C5452;
      else
        v6 = 0;
      v2 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x24BDAEC58], v6, &connect);
      if (!(_DWORD)v2)
      {
        *(_DWORD *)(a1 + 20) = connect;
        if (!*(_QWORD *)(a1 + 152))
          mt_InitializeAlgorithmsForDevice(a1, v7, v8, v9, v10, v11, v12, v13);
        v14 = *(_DWORD *)(a1 + 160);
        if ((v14 & 1) == 0)
        {
          *(_BYTE *)(a1 + 2040) = 0;
          if ((v14 & 0x20000000) == 0)
          {
            *(_DWORD *)(a1 + 160) = v14 | 0x20000000;
            v17 = 0;
            v15 = (CFTypeRef *)malloc_type_calloc(0x10uLL, 1uLL, 0xCB32A5F7uLL);
            *v15 = (CFTypeRef)a1;
            v15[1] = MTDeviceCreateMultitouchRunLoopSource((__CFMachPort *)a1);
            CFRetain((CFTypeRef)a1);
            if (pthread_create(&v17, 0, (void *(__cdecl *)(void *))mt_ThreadedMTEntry, v15))
            {
              CFRelease(*v15);
              CFRelease(v15[1]);
              free(v15);
            }
          }
        }
      }
    }
  }
  return v2;
}

BOOL MTDeviceIsRunning(_BOOL8 result)
{
  if (result)
    return *(_DWORD *)(result + 20) != 0;
  return result;
}

uint64_t MTDeviceForcePropertiesRecache(io_service_t *a1)
{
  uint64_t v1;
  io_service_t v3;
  uint32_t v5;
  mach_port_t v6;
  uint32_t v8;
  uint32_t outputCnt[2];
  io_connect_t connect;

  v1 = 3758097090;
  if (a1)
  {
    v3 = a1[53];
    if (v3)
    {
      if (v3 != 4 && v3 != 1)
        return 3758097095;
      v5 = 9;
    }
    else
    {
      v5 = 22;
    }
    v6 = a1[5];
    if (v6)
    {
      outputCnt[0] = 0;
      return IOConnectCallScalarMethod(v6, v5, 0, 0, 0, outputCnt);
    }
    else
    {
      connect = 0;
      *(_QWORD *)outputCnt = 5;
      if (IOServiceWaitQuiet(a1[4], (mach_timespec_t *)outputCnt) == -536870186)
        printf("MT Error: service still busy after %d seconds\n", outputCnt[0]);
      v1 = IOServiceOpen(a1[4], *MEMORY[0x24BDAEC58], 0, &connect);
      if (!(_DWORD)v1)
      {
        v8 = 0;
        v1 = IOConnectCallScalarMethod(connect, v5, 0, 0, 0, &v8);
      }
      IOServiceClose(connect);
    }
  }
  return v1;
}

uint64_t mt_InitializeAlgorithmsForDevice(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  if (result)
  {
    v8 = result;
    result = mtalg_CreateAlgLibraryForDevice(result, *(unsigned int *)(result + 84), *(_DWORD *)(result + 88), *(unsigned int *)(result + 72), result + 220, 20, *(__int16 *)(result + 364), a8, *(_QWORD *)(result + 368), *(_QWORD *)(result + 376));
    *(_QWORD *)(v8 + 152) = result;
  }
  return result;
}

__CFMachPort *MTDeviceCreateMultitouchRunLoopSource(__CFMachPort *a1)
{
  __CFMachPort *result;

  result = MTDeviceCreateMultitouchMachPort(a1);
  if (result)
    return CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], result, 0);
  return result;
}

void mt_ThreadedMTEntry(_QWORD *a1)
{
  _QWORD *v2;
  __CFRunLoopSource *v3;
  __CFRunLoop *Current;

  v2 = (_QWORD *)*a1;
  v3 = (__CFRunLoopSource *)a1[1];
  v2[256] = CFRunLoopGetCurrent();
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v3, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  CFRelease(v3);
  CFRunLoopRun();
  CFRelease(v2);
  free(a1);
}

uint64_t MTDeviceStop(uint64_t a1)
{
  uint64_t result;
  __CFRunLoop *Current;
  __CFRunLoop *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  result = 3758097090;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      if (*(_QWORD *)(a1 + 2032))
        mt_DeviceUnregisterForHotplugNotifications(a1);
      *(_BYTE *)(a1 + 2040) = 1;
      if (*(_QWORD *)(a1 + 2048))
      {
        Current = CFRunLoopGetCurrent();
        v4 = *(__CFRunLoop **)(a1 + 2048);
        if (Current == v4)
        {
          CFRunLoopStop(Current);
        }
        else
        {
          v9 = 0;
          v10 = &v9;
          v11 = 0x2000000000;
          v12 = 0;
          v5 = (const void *)*MEMORY[0x24BDBD598];
          v8[0] = MEMORY[0x24BDAC760];
          v8[1] = 0x40000000;
          v8[2] = __MTDeviceStop_block_invoke;
          v8[3] = &unk_24DC7DBD0;
          v8[4] = &v9;
          v8[5] = a1;
          CFRunLoopPerformBlock(v4, v5, v8);
          CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 2048));
          while (!*((_BYTE *)v10 + 24))
            usleep(0x3E8u);
          _Block_object_dispose(&v9, 8);
        }
        *(_QWORD *)(a1 + 2048) = 0;
      }
      if (*(_QWORD *)(a1 + 2016))
      {
        mt_StopDequeueOfMultitouchDataFromDevice(a1);
        *(_QWORD *)(a1 + 2016) = 0;
      }
      v6 = *(unsigned int *)(a1 + 20);
      if (*(_QWORD *)(a1 + 2200))
      {
        MEMORY[0x22073CCBC](v6, 0, *MEMORY[0x24BDAEC58]);
        *(_QWORD *)(a1 + 2200) = 0;
        *(_QWORD *)(a1 + 2208) = 0;
        LODWORD(v6) = *(_DWORD *)(a1 + 20);
      }
      if ((_DWORD)v6)
      {
        IOServiceClose(v6);
        *(_DWORD *)(a1 + 20) = 0;
      }
      if (*(_BYTE *)(a1 + 2096))
        MTDeviceEndRecording(a1);
      v7 = *(const void **)(a1 + 152);
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)(a1 + 152) = 0;
      }
      result = 0;
      *(_BYTE *)(a1 + 2232) = 1;
      *(_WORD *)(a1 + 133) = 1;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

void mt_DeviceUnregisterForHotplugNotifications(uint64_t a1)
{
  __CFRunLoopSource *v2;

  v2 = *(__CFRunLoopSource **)(a1 + 2032);
  if (v2)
  {
    CFRunLoopSourceInvalidate(v2);
    CFRelease(*(CFTypeRef *)(a1 + 2032));
    *(_QWORD *)(a1 + 2032) = 0;
  }
}

CFMachPortRef MTDeviceCreateMultitouchMachPort(CFMachPortRef result)
{
  uint64_t v1;
  unsigned int MaxPacketSizeByKey;
  unsigned int v3;
  unsigned int *v4;
  void *v5;
  uint64_t NotificationPort;
  ipc_space_t *v7;
  uint64_t v8;
  uint32_t v9;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t v12;
  uint64_t v13;
  CFMachPortContext context;

  if (result)
  {
    v1 = (uint64_t)result;
    if (*((_DWORD *)result + 5)
      && *((_DWORD *)result + 4)
      && !*((_QWORD *)result + 252)
      && (*((_BYTE *)result + 163) & 0x20) != 0)
    {
      MaxPacketSizeByKey = _MTDeviceGetMaxPacketSizeByKey((uint64_t)result, CFSTR("Max Injection Packet Size"), 0);
      v3 = _MTDeviceGetMaxPacketSizeByKey(v1, CFSTR("Max Packet Size"), 4096);
      if (MaxPacketSizeByKey > v3)
        v3 = MaxPacketSizeByKey;
      *(_DWORD *)(v1 + 384) = v3;
      if (*(_QWORD *)(v1 + 392))
      {
        ParsedMultitouchFrameRepDestroy(*(_QWORD **)(v1 + 392));
        v3 = *(_DWORD *)(v1 + 384);
      }
      *(_QWORD *)(v1 + 392) = MT_ParsedMultitouchFrameRepCreate(v3);
      v4 = (unsigned int *)malloc_type_malloc(0x28uLL, 0x1030040C0747FF5uLL);
      *(_OWORD *)v4 = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_QWORD *)v4 + 4) = 0;
      v5 = malloc_type_malloc(*(unsigned int *)(v1 + 384), 0xB32D588uLL);
      *(_QWORD *)(v1 + 136) = v5;
      *(_QWORD *)v4 = v1;
      *((_QWORD *)v4 + 1) = v5;
      v4[4] = *(_DWORD *)(v1 + 20);
      context.version = 0;
      context.info = v4;
      memset(&context.retain, 0, 24);
      if (v5)
      {
        bzero(v5, *(unsigned int *)(v1 + 384));
        v12 = 0;
        v13 = 0;
        NotificationPort = IODataQueueAllocateNotificationPort();
        v7 = (ipc_space_t *)MEMORY[0x24BDAEC58];
        if ((_DWORD)NotificationPort)
        {
          if (MEMORY[0x22073CCB0](v4[4], 0, NotificationPort, 0))
          {
            printf("IOConnectSetNotificationPort returned %d\n");
          }
          else if (MEMORY[0x22073CC98](v4[4], 0, *v7, &v13, &v12, 1))
          {
            printf("IOConnectMapMemory returned %d\n");
          }
          else
          {
            v8 = v12;
            *((_QWORD *)v4 + 3) = v13;
            *((_QWORD *)v4 + 4) = v8;
            if ((*(_BYTE *)(v1 + 160) & 1) != 0
              || ((input = 1, outputCnt = 0, *(_DWORD *)(v1 + 212)) ? (v9 = 0) : (v9 = 21),
                  !IOConnectCallScalarMethod(v4[4], v9, &input, 1u, 0, &outputCnt)))
            {
              LOBYTE(input) = -86;
              result = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], NotificationPort, (CFMachPortCallBack)mt_DequeueMultitouchDataMachPortCallBack, &context, (Boolean *)&input);
              if (input == 1)
              {
                printf("CFMachPortCreateWithPort returned a re-used CFMachPort for port %d\n");
              }
              else if (result)
              {
                *(_QWORD *)(v1 + 2016) = result;
                return result;
              }
            }
            else
            {
              printf("IOConnectMethodScalarIScalarO/IOConnectCallScalarMethod returned %d\n");
            }
          }
        }
        else
        {
          puts("IODataQueueAllocateNotificationPort returned a NULL mach_port_t");
        }
        free(v4);
        mach_port_mod_refs(*v7, NotificationPort, 1u, -1);
      }
    }
    return 0;
  }
  return result;
}

uint64_t MTDeviceGetMaxPacketSize(uint64_t a1)
{
  unsigned int MaxPacketSizeByKey;
  uint64_t result;

  MaxPacketSizeByKey = _MTDeviceGetMaxPacketSizeByKey(a1, CFSTR("Max Injection Packet Size"), 0);
  LODWORD(result) = _MTDeviceGetMaxPacketSizeByKey(a1, CFSTR("Max Packet Size"), 4096);
  if (MaxPacketSizeByKey <= result)
    return result;
  else
    return MaxPacketSizeByKey;
}

NSObject *MTDeviceCreateMultitouchDispatchSource(__CFMachPort *a1, NSObject *a2)
{
  __CFMachPort *MultitouchMachPort;
  mach_port_t Port;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[5];

  MultitouchMachPort = MTDeviceCreateMultitouchMachPort(a1);
  if (!MultitouchMachPort)
    return 0;
  Port = CFMachPortGetPort(MultitouchMachPort);
  v6 = dispatch_source_create(MEMORY[0x24BDAC9E0], Port, 0, a2);
  v7 = v6;
  if (v6)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __MTDeviceCreateMultitouchDispatchSource_block_invoke;
    handler[3] = &__block_descriptor_tmp_123;
    handler[4] = a1;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v7);
  }
  return v7;
}

uint64_t MTDeviceGetPeripheralRunLoopSource()
{
  return 0;
}

void mt_DeviceRegisterForHotplugNotifications(_QWORD *a1, __CFRunLoop *a2, const __CFString *a3)
{
  IONotificationPort *v6;
  CFRunLoopSourceRef RunLoopSource;
  const __CFAllocator *v8;
  CFNumberRef v9;
  const CFDictionaryKeyCallBacks *v10;
  const CFDictionaryValueCallBacks *v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  __CFDictionary *v14;
  BOOL v15;
  io_iterator_t iterator;
  io_iterator_t notification;

  iterator = -1431655766;
  notification = -1431655766;
  v6 = IONotificationPortCreate(0);
  RunLoopSource = IONotificationPortGetRunLoopSource(v6);
  a1[254] = CFRetain(RunLoopSource);
  CFRunLoopAddSource(a2, RunLoopSource, a3);
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, a1 + 8);
  v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable(v8, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = CFDictionaryCreateMutable(v8, 1, v10, v11);
  v14 = v13;
  if (v9)
    v15 = Mutable == 0;
  else
    v15 = 1;
  if (v15 || v13 == 0)
  {
    if (!v9)
    {
      if (!Mutable)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    CFDictionarySetValue(v13, CFSTR("Multitouch ID"), v9);
    CFDictionarySetValue(Mutable, CFSTR("IOPropertyMatch"), v14);
    CFRetain(Mutable);
    if (!IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", Mutable, (IOServiceMatchingCallback)mt_HotPlugMatchingDeviceAdded, a1, &notification))
    {
      CFRetain(Mutable);
      if (!IOServiceAddMatchingNotification(v6, "IOServiceTerminate", Mutable, (IOServiceMatchingCallback)mt_HotPlugMatchingDeviceRemoved, a1, &iterator))
      {
        mt_HotPlugMatchingDeviceAdded(0, notification);
        mt_HotPlugMatchingDeviceRemoved(0, iterator);
      }
    }
  }
  CFRelease(v9);
  if (Mutable)
LABEL_11:
    CFRelease(Mutable);
LABEL_12:
  if (v14)
    CFRelease(v14);
}

uint64_t mt_HotPlugMatchingDeviceAdded(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  io_service_t v5;
  task_port_t *v6;
  __CFMachPort *MultitouchRunLoopSource;
  __CFRunLoopSource *v8;
  __CFRunLoop *Current;
  mach_timespec_t waitTime;
  io_connect_t connect;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = (task_port_t *)MEMORY[0x24BDAEC58];
    do
    {
      if (a1 && !*(_DWORD *)(a1 + 16) && !*(_DWORD *)(a1 + 20))
      {
        connect = 0;
        waitTime = (mach_timespec_t)5;
        if (IOServiceWaitQuiet(v5, &waitTime) == -536870186)
          printf("MT Error: service still busy after %d seconds\n", waitTime.tv_sec);
        if (!IOServiceOpen(v5, *v6, 0, &connect))
        {
          *(_DWORD *)(a1 + 16) = v5;
          IOObjectRetain(v5);
          *(_DWORD *)(a1 + 20) = connect;
          *(_QWORD *)(a1 + 2056) = 0;
          *(_DWORD *)(a1 + 2064) = 0;
          *(_BYTE *)(a1 + 2068) = 0;
          *(_DWORD *)(a1 + 180) = 0;
          *(_QWORD *)(a1 + 184) = 0;
          mt_CachePropertiesForDevice(a1);
          mt_PostNotificationEvent(a1, 5);
          MultitouchRunLoopSource = MTDeviceCreateMultitouchRunLoopSource((__CFMachPort *)a1);
          if (MultitouchRunLoopSource)
          {
            v8 = MultitouchRunLoopSource;
            Current = CFRunLoopGetCurrent();
            CFRunLoopAddSource(Current, v8, *(CFRunLoopMode *)(a1 + 2024));
            CFRelease(v8);
          }
        }
      }
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

uint64_t mt_HotPlugMatchingDeviceRemoved(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  io_object_t v5;
  _QWORD *v6;
  unsigned int *v7;
  uint64_t v8;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = (_QWORD *)(a1 + 2200);
    v7 = (unsigned int *)MEMORY[0x24BDAEC58];
    do
    {
      if (a1)
      {
        v8 = *(unsigned int *)(a1 + 20);
        if ((_DWORD)v8)
        {
          if (*(_QWORD *)(a1 + 2016))
          {
            mt_StopDequeueOfMultitouchDataFromDevice(a1);
            *(_QWORD *)(a1 + 2016) = 0;
            v8 = *(unsigned int *)(a1 + 20);
          }
          if (*v6)
          {
            MEMORY[0x22073CCBC](v8, 0, *v7);
            *v6 = 0;
            *(_QWORD *)(a1 + 2208) = 0;
            LODWORD(v8) = *(_DWORD *)(a1 + 20);
          }
          IOServiceClose(v8);
          *(_DWORD *)(a1 + 20) = 0;
          IOObjectRelease(*(_DWORD *)(a1 + 16));
          *(_DWORD *)(a1 + 16) = 0;
        }
      }
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

uint64_t MTDeviceScheduleOnRunLoop(uint64_t a1, __CFRunLoop *a2, const __CFString *a3)
{
  uint64_t result;
  __CFMachPort *MultitouchRunLoopSource;
  __CFRunLoopSource *v8;

  result = 3758097090;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      if (*(_DWORD *)(a1 + 16) && !*(_QWORD *)(a1 + 2016) && (*(_BYTE *)(a1 + 163) & 0x20) != 0)
      {
        MultitouchRunLoopSource = MTDeviceCreateMultitouchRunLoopSource((__CFMachPort *)a1);
        if (MultitouchRunLoopSource)
        {
          v8 = MultitouchRunLoopSource;
          *(_QWORD *)(a1 + 2024) = a3;
          mt_DeviceRegisterForHotplugNotifications((_QWORD *)a1, a2, a3);
          CFRunLoopAddSource(a2, v8, a3);
          CFRelease(v8);
          return 0;
        }
        else
        {
          return 3758097084;
        }
      }
      else
      {
        return 3758096385;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t MTActuatorCreateFromDeviceID(uint64_t a1)
{
  const __CFAllocator *v1;
  CFNumberRef v2;
  CFNumberRef v3;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  io_object_t v8;
  uint64_t v9;
  io_object_t v10;
  io_iterator_t existing;
  uint64_t valuePtr;

  valuePtr = a1;
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  if (v2)
  {
    v3 = v2;
    existing = 0;
    Mutable = CFDictionaryCreateMutable(v1, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v5 = Mutable;
      v6 = CFDictionaryCreateMutable(v1, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v6)
      {
        v7 = v6;
        CFDictionarySetValue(v6, CFSTR("Multitouch Actuator ID"), v3);
        CFDictionarySetValue(v5, CFSTR("IOPropertyMatch"), v7);
        CFRelease(v7);
        if (!IOServiceGetMatchingServices(0, v5, &existing))
        {
          while (1)
          {
            v10 = IOIteratorNext(existing);
            if (!v10)
              break;
            v8 = v10;
            v9 = MTActuatorCreate(v10, 0);
            IOObjectRelease(v8);
            if (v9)
              goto LABEL_9;
          }
          v9 = 0;
LABEL_9:
          IOObjectRelease(existing);
          goto LABEL_13;
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
    v9 = 0;
LABEL_13:
    CFRelease(v3);
    return v9;
  }
  return 0;
}

uint64_t MTActuatorCreateFromService(io_object_t a1)
{
  if (a1)
    return MTActuatorCreate(a1, 0);
  else
    return 0;
}

uint64_t MTDeviceSupportsActuation(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 24) != 0;
  }
  return result;
}

uint64_t MTDeviceGetMTActuator(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 133))
    mt_CachePropertiesForDevice(a1);
  if (!*(_BYTE *)(a1 + 24))
    return 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    v3 = MTActuatorCreateFromDeviceID(*(_QWORD *)(a1 + 64));
    if (v3)
    {
      v2 = v3;
      MTActuatorSetMTDevice(v3, a1);
      *(_QWORD *)(a1 + 32) = v2;
    }
    else
    {
      return *(_QWORD *)(a1 + 32);
    }
  }
  return v2;
}

uint64_t MTActuatorGetService(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t MTActuatorGetMTDevice(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t MTActuatorOpen(uint64_t a1, int a2)
{
  uint64_t v2;
  mach_timespec_t waitTime;
  io_connect_t connect;

  v2 = 3758097090;
  if (a1)
  {
    connect = 0;
    waitTime = (mach_timespec_t)5;
    if (*(_DWORD *)(a1 + 20))
      return MTActuatorChangeHostClickControl(a1, 1u);
    *(_DWORD *)(a1 + 24) = a2;
    if (IOServiceWaitQuiet(*(_DWORD *)(a1 + 16), &waitTime) == -536870186)
      printf("MTActuator Error: service still busy after %d seconds\n", waitTime.tv_sec);
    v2 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x24BDAEC58], 0, &connect);
    if (!(_DWORD)v2)
    {
      *(_DWORD *)(a1 + 20) = connect;
      if (*(_BYTE *)(a1 + 48))
      {
        mt_CachePropertiesForActuator(a1);
        MTActuatorLoadActuations(a1);
      }
      return MTActuatorRequestHostClickControl(a1);
    }
  }
  return v2;
}

BOOL MTActuatorIsOpen(_BOOL8 result)
{
  if (result)
    return *(_DWORD *)(result + 20) != 0;
  return result;
}

uint64_t MTActuatorReclaimHostClickControl(uint64_t a1)
{
  return MTActuatorChangeHostClickControl(a1, 1u);
}

uint64_t mt_CachePropertiesForActuator(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)(a1 + 56);
  if (mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), CFSTR("Multitouch Actuator ID"), (_QWORD *)(a1 + 56)))*v2 = 0;
  if (mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), CFSTR("Transport"), (_QWORD *)(a1 + 64)))
    *(_DWORD *)(a1 + 64) = 0;
  result = mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("ActuatorRevision"), (_DWORD *)(a1 + 68));
  if ((_DWORD)result)
    *(_DWORD *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

uint64_t MTActuatorRequestHostClickControl(uint64_t a1)
{
  uint64_t v1;
  mach_port_t v2;
  uint64_t v3;
  uint64_t input;

  v1 = 3758097090;
  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 20);
    if (v2)
    {
      input = 1;
      v3 = IOConnectCallScalarMethod(v2, 0, &input, 1u, 0, 0);
      v1 = v3;
      if ((_DWORD)v3)
        printf("MTActuator Error: Could not request host click control. Status = 0x%08x\n", v3);
    }
    else
    {
      return 3758097101;
    }
  }
  return v1;
}

uint64_t MTActuatorChangeHostClickControl(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  mach_port_t v3;
  uint64_t v4;
  uint64_t input;

  v2 = 3758097090;
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 20);
    if (v3)
    {
      input = a2;
      v4 = IOConnectCallScalarMethod(v3, 5u, &input, 1u, 0, 0);
      v2 = v4;
      if ((_DWORD)v4)
        printf("MTActuator Error: Could not reclaim host click control. Status = 0x%08x\n", v4);
    }
    else
    {
      return 3758097101;
    }
  }
  return v2;
}

uint64_t MTActuatorHandoffHostClickControl(uint64_t a1)
{
  return MTActuatorChangeHostClickControl(a1, 0);
}

uint64_t MTActuatorClose(uint64_t a1)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      IOServiceClose(*(_DWORD *)(a1 + 20));
      result = 0;
      *(_DWORD *)(a1 + 20) = 0;
      *(_BYTE *)(a1 + 48) = 1;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t MTActuatorGetDeviceID(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 48))
      mt_CachePropertiesForActuator(a1);
    result = 0;
    *a2 = *(_QWORD *)(a1 + 56);
  }
  return result;
}

uint64_t MTActuatorGetTransportMethod(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 48))
      mt_CachePropertiesForActuator(a1);
    result = 0;
    *a2 = *(_DWORD *)(a1 + 64);
  }
  return result;
}

uint64_t MTActuatorIssueDriverRequest(uint64_t a1, void *inputStruct, void *outputStruct)
{
  uint64_t v3;
  mach_port_t v7;
  size_t v9;
  mach_timespec_t outputStructCnt;
  io_connect_t connect;

  v3 = 3758097090;
  if (a1 && inputStruct && outputStruct)
  {
    v7 = *(_DWORD *)(a1 + 20);
    if (v7)
    {
      outputStructCnt = (mach_timespec_t)516;
      return IOConnectCallStructMethod(v7, 4u, inputStruct, 0x204uLL, outputStruct, (size_t *)&outputStructCnt);
    }
    else
    {
      connect = 0;
      outputStructCnt = (mach_timespec_t)5;
      if (IOServiceWaitQuiet(*(_DWORD *)(a1 + 16), &outputStructCnt) == -536870186)
        printf("MT Error: service still busy after %d seconds\n", outputStructCnt.tv_sec);
      v3 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x24BDAEC58], 0, &connect);
      if (!(_DWORD)v3)
      {
        v9 = 516;
        v3 = IOConnectCallStructMethod(connect, 4u, inputStruct, 0x204uLL, outputStruct, &v9);
      }
      IOServiceClose(connect);
    }
  }
  return v3;
}

uint64_t MTActuatorSetSystemActuationsEnabled(uint64_t a1, char a2)
{
  __int128 v3;
  uint64_t result;
  io_service_t *v5;
  _DWORD v6[129];
  int inputStruct;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v3;
  v39 = v3;
  result = 3758097086;
  v36 = v3;
  v37 = v3;
  v34 = v3;
  v35 = v3;
  v32 = v3;
  v33 = v3;
  v30 = v3;
  v31 = v3;
  v28 = v3;
  v29 = v3;
  v26 = v3;
  v27 = v3;
  v24 = v3;
  v25 = v3;
  v23 = v3;
  v22 = v3;
  v21 = v3;
  v20 = v3;
  v19 = v3;
  v18 = v3;
  v17 = v3;
  v16 = v3;
  v15 = v3;
  v14 = v3;
  v13 = v3;
  v12 = v3;
  v11 = v3;
  v10 = v3;
  v9 = v3;
  v8 = v3;
  inputStruct = 13;
  LOBYTE(v8) = a2;
  if (a1)
  {
    v5 = *(io_service_t **)(a1 + 32);
    if (v5)
    {
      memset(v6, 170, sizeof(v6));
      result = MTActuatorIssueDriverRequest(a1, &inputStruct, v6);
      if (!(_DWORD)result)
      {
        result = v6[0];
        if (!v6[0])
        {
          mt_PostNotificationEventToDriver(v5, 27);
          return 0;
        }
      }
    }
  }
  return result;
}

BOOL MTActuatorGetSystemActuationsEnabled(uint64_t a1)
{
  __int128 v2;
  int v3;
  _DWORD v5[129];
  int inputStruct;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37 = v2;
  v38 = v2;
  v35 = v2;
  v36 = v2;
  v33 = v2;
  v34 = v2;
  v31 = v2;
  v32 = v2;
  v29 = v2;
  v30 = v2;
  v27 = v2;
  v28 = v2;
  v25 = v2;
  v26 = v2;
  v23 = v2;
  v24 = v2;
  v22 = v2;
  v21 = v2;
  v20 = v2;
  v19 = v2;
  v18 = v2;
  v17 = v2;
  v16 = v2;
  v15 = v2;
  v14 = v2;
  v13 = v2;
  v12 = v2;
  v11 = v2;
  v10 = v2;
  v9 = v2;
  v8 = v2;
  v7 = v2;
  memset(v5, 170, sizeof(v5));
  inputStruct = 14;
  v3 = MTActuatorIssueDriverRequest(a1, &inputStruct, v5);
  return !(v3 | v5[0]) && LOBYTE(v5[1]) != 0;
}

uint64_t mt_ServiceCFPropertyExists(io_registry_entry_t entry, const __CFString *a2)
{
  uint64_t result;

  result = 0;
  if (entry && a2)
  {
    result = (uint64_t)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (result)
    {
      CFRelease((CFTypeRef)result);
      return 1;
    }
  }
  return result;
}

uint64_t mt_ServiceGetInt32Property(io_registry_entry_t entry, const __CFString *a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  const __CFNumber *CFProperty;
  const __CFNumber *v8;
  CFTypeID v9;
  int valuePtr;

  v4 = 3758097084;
  result = 3758097090;
  if (entry && a2 && a3)
  {
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v8 = CFProperty;
      v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        if (CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr) == 1)
        {
          v4 = 0;
          *a3 = valuePtr;
        }
      }
      CFRelease(v8);
      return v4;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ServiceGetInt64Property(io_registry_entry_t entry, const __CFString *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  const __CFNumber *CFProperty;
  const __CFNumber *v8;
  CFTypeID v9;
  uint64_t valuePtr;

  v4 = 3758097084;
  result = 3758097090;
  if (entry && a2 && a3)
  {
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v8 = CFProperty;
      v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        if (CFNumberGetValue(v8, kCFNumberSInt64Type, &valuePtr) == 1)
        {
          v4 = 0;
          *a3 = valuePtr;
        }
      }
      CFRelease(v8);
      return v4;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ServiceGetDataProperty(io_registry_entry_t entry, const __CFString *a2, UInt8 **a3, _DWORD *a4)
{
  uint64_t v5;
  uint64_t result;
  const __CFData *CFProperty;
  const __CFData *v10;
  CFTypeID v11;
  size_t Length;
  CFRange v13;

  v5 = 3758097084;
  result = 3758097090;
  if (entry && a2 && a3 && a4)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v10 = CFProperty;
      v11 = CFGetTypeID(CFProperty);
      if (v11 == CFDataGetTypeID())
      {
        Length = CFDataGetLength(v10);
        *a3 = (UInt8 *)malloc_type_malloc(Length, 0x6340D677uLL);
        v13.length = CFDataGetLength(v10);
        v13.location = 0;
        CFDataGetBytes(v10, v13, *a3);
        v5 = 0;
        *a4 = CFDataGetLength(v10);
      }
      CFRelease(v10);
      return v5;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ServiceGetStringProperty(io_registry_entry_t entry, const __CFString *a2, _QWORD *a3)
{
  uint64_t result;
  CFTypeRef CFProperty;
  const void *v7;
  CFTypeID v8;

  result = 3758097090;
  if (entry && a2 && a3)
  {
    CFProperty = IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      v8 = CFGetTypeID(CFProperty);
      if (v8 == CFStringGetTypeID())
      {
        result = 0;
        *a3 = v7;
        return result;
      }
      *a3 = 0;
      CFRelease(v7);
    }
    else
    {
      *a3 = 0;
    }
    return 3758097084;
  }
  return result;
}

uint64_t mt_ServiceGetBoolProperty(io_registry_entry_t entry, const __CFString *a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t result;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v8;
  CFTypeID v9;

  v4 = 3758097084;
  result = 3758097090;
  if (entry && a2 && a3)
  {
    CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v8 = CFProperty;
      v9 = CFGetTypeID(CFProperty);
      if (v9 == CFBooleanGetTypeID())
      {
        v4 = 0;
        *a3 = CFBooleanGetValue(v8) != 0;
      }
      CFRelease(v8);
      return v4;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ActuatorCFPropertyExists(uint64_t a1, const __CFString *a2)
{
  return mt_ServiceCFPropertyExists(*(_DWORD *)(a1 + 16), a2);
}

uint64_t mt_ActuatorGetInt32Property(uint64_t a1, const __CFString *a2, _DWORD *a3)
{
  return mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t mt_ActuatorGetInt64Property(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  return mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t mt_ActuatorGetDataProperty(uint64_t a1, const __CFString *a2, UInt8 **a3, _DWORD *a4)
{
  return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), a2, a3, a4);
}

uint64_t mt_ActuatorGetStringProperty(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  return mt_ServiceGetStringProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t mt_ActuatorGetBoolProperty(uint64_t a1, const __CFString *a2, BOOL *a3)
{
  return mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t MTDeviceIsOpaqueSurface(uint64_t a1)
{
  if (a1)
    return mtalg_IsOpaqueSurface(a1);
  return a1;
}

uint64_t MTDeviceGetVersion(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = *(_DWORD *)(a1 + 76);
  }
  return result;
}

uint64_t MTDeviceHasExpectedVersion(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    v2 = *(_DWORD *)(v1 + 80);
    return !v2 || *(_DWORD *)(v1 + 76) == v2;
  }
  return result;
}

uint64_t MTDeviceGetSensorDimensions(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2 | a3)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    if (a2)
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 84);
    result = 0;
    if (a3)
      *(_DWORD *)a3 = *(_DWORD *)(a1 + 88);
  }
  return result;
}

uint64_t MTDeviceGetSensorSurfaceDimensions(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2 | a3)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    if (a2)
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 92);
    result = 0;
    if (a3)
      *(_DWORD *)a3 = *(_DWORD *)(a1 + 96);
  }
  return result;
}

uint64_t MTDeviceGetSerialNumber(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = *(_QWORD *)(a1 + 104);
  }
  return result;
}

uint64_t MTDeviceGetDriverType(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = *(_DWORD *)(a1 + 212);
  }
  return result;
}

uint64_t MTDeviceDriverIsReady(uint64_t result)
{
  uint64_t v1;
  int v2;
  int BoolProperty;
  BOOL v4;
  BOOL v5;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    if (*(_BYTE *)(v1 + 134))
    {
      v2 = 1;
    }
    else
    {
      v5 = 0;
      BoolProperty = mt_ServiceGetBoolProperty(*(_DWORD *)(v1 + 16), CFSTR("Driver is Ready"), &v5);
      v4 = v5;
      if (BoolProperty)
        v4 = 1;
      *(_BYTE *)(v1 + 134) = v4;
      if (v4)
      {
        mt_CachePropertiesForDevice(v1);
        v2 = *(unsigned __int8 *)(v1 + 134);
      }
      else
      {
        v2 = 0;
      }
    }
    return v2 != 0;
  }
  return result;
}

uint64_t MTDeviceGetSensorRegionMaxTypes(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = 20;
  }
  return result;
}

uint64_t MTDeviceGetSensorRegionOfType(uint64_t a1, _DWORD *a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v7;
  int *v8;
  int v9;
  int v10;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    if (a3 > 0x13)
    {
      return 3758097136;
    }
    else
    {
      v7 = a1 - a3 + 8 * a3;
      v9 = *(unsigned __int8 *)(v7 + 220);
      v8 = (int *)(v7 + 220);
      result = 3758097136;
      if (v9 == a3)
      {
        result = 0;
        v10 = *v8;
        *(_DWORD *)((char *)a2 + 3) = *(int *)((char *)v8 + 3);
        *a2 = v10;
      }
    }
  }
  return result;
}

uint64_t MTDeviceGetThresholdsForSensorRegionOfType(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v7;

  v3 = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    if (a3 == 1)
    {
      v3 = 0;
      v7 = *(_DWORD *)(a1 + 360);
      *(_WORD *)(a2 + 4) = *(_WORD *)(a1 + 364);
      *(_DWORD *)a2 = v7;
    }
    else
    {
      return 3758097136;
    }
  }
  return v3;
}

uint64_t MTAlg_DeviceGetSensorRegionArray(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2 && a3)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a3 = 20;
    *a2 = a1 + 220;
  }
  return result;
}

uint64_t MTDeviceGetParserType(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(unsigned int *)(v1 + 2072);
  }
  return result;
}

uint64_t MTDeviceGetParserOptions(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(unsigned int *)(v1 + 2076);
  }
  return result;
}

uint64_t MTDeviceIsMTHIDDevice(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 2080) != 0;
  }
  return result;
}

uint64_t MTDeviceGetTouchSizeIdentifier(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(unsigned int *)(v1 + 2084);
  }
  return result;
}

uint64_t MTDeviceIsBuiltIn(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 2088) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsWirelessChargingNotification(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 42) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsUSBChargingNotification(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 43) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsForce(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 40) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsSilentClick(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    result = 0;
    *a2 = *(_BYTE *)(a1 + 41);
  }
  return result;
}

uint64_t MTDeviceGetMinDigitizerPressureValue(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(unsigned int *)(v1 + 44);
  }
  return result;
}

uint64_t MTDeviceGetAccurateMaxDigitizerPressureValue(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(unsigned int *)(v1 + 48);
  }
  return result;
}

uint64_t MTDeviceGetExtendedMaxDigitizerPressureValue(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(unsigned int *)(v1 + 52);
  }
  return result;
}

uint64_t MTDeviceGetMaxHoverHeightValue(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(unsigned int *)(v1 + 56);
  }
  return result;
}

uint64_t MTDeviceShouldDispatchNormalizedVelocity(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 131) != 0;
  }
  return result;
}

uint64_t MTDeviceShouldDispatchRelativeCoordinates(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_BYTE *)(v1 + 132) != 0;
  }
  return result;
}

void MTDeviceForcePropertiesRecacheForAll()
{
  __CFArray *List;
  const __CFArray *v1;
  int Count;
  CFIndex v3;
  uint64_t v4;
  io_service_t *ValueAtIndex;

  List = MTDeviceCreateList();
  if (List)
  {
    v1 = List;
    if (CFArrayGetCount(List) >= 1)
    {
      Count = CFArrayGetCount(v1);
      if (Count >= 1)
      {
        v3 = 0;
        v4 = Count;
        do
        {
          ValueAtIndex = (io_service_t *)CFArrayGetValueAtIndex(v1, v3);
          MTDeviceForcePropertiesRecache(ValueAtIndex);
          ++v3;
        }
        while (v4 != v3);
      }
    }
    CFRelease(v1);
  }
}

uint64_t MTDeviceEnableBinaryFilters(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *BinaryFilters;

  v2 = 3758097090;
  if (a1)
  {
    BinaryFilters = *(NSObject **)(a1 + 2224);
    if ((a2 & 1) != 0)
    {
      if (!BinaryFilters)
      {
        *(_BYTE *)(a1 + 2232) = 0;
        BinaryFilters = mt_CreateBinaryFilters(a1);
        *(_QWORD *)(a1 + 2224) = BinaryFilters;
      }
      *(_BYTE *)(a1 + 2216) = a2;
      if (BinaryFilters)
        return 0;
      else
        return 3758097095;
    }
    else
    {
      if (BinaryFilters)
      {
        CFRelease(BinaryFilters);
        *(_QWORD *)(a1 + 2224) = 0;
      }
      v2 = 0;
      *(_BYTE *)(a1 + 2216) = a2;
    }
  }
  return v2;
}

uint64_t MTDeviceSetBinaryFiltersProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 2224))
    {
      mt_SetBinaryFiltersProperty(a1, a2, a3);
      return 0;
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

uint64_t MTDeviceGetMultipleFirmwaresConfig(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 133))
      mt_CachePropertiesForDevice(result);
    return *(_QWORD *)(v1 + 5680);
  }
  return result;
}

uint64_t MTAlg_GetAlgLibStateRef(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 152);
  return result;
}

double MTAbsoluteTimeGetCurrent()
{
  uint64_t v0;
  mach_timebase_info info;

  info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  v0 = mach_absolute_time();
  mach_timebase_info(&info);
  return (double)v0 / 1000000000.0 * (double)(info.numer / info.denom);
}

unint64_t mt_GetTimeDifference_ms(double a1, double a2)
{
  return (unint64_t)((a2 - a1) * 1000.0);
}

unint64_t mt_GetTimeStamp_ms(uint64_t a1)
{
  double Current;
  double v3;

  Current = MTAbsoluteTimeGetCurrent();
  if (a1)
  {
    v3 = *(double *)(a1 + 144);
  }
  else
  {
    v3 = *(double *)&mt_GetTimeStamp_ms_globalStartTime;
    if (*(double *)&mt_GetTimeStamp_ms_globalStartTime == 0.0)
    {
      mt_GetTimeStamp_ms_globalStartTime = *(_QWORD *)&Current;
      v3 = Current;
    }
  }
  return (unint64_t)((Current - v3) * 1000.0);
}

uint64_t MTDeviceGetForceThresholdForMotion(uint64_t a1, _DWORD *a2, _DWORD *a3, unsigned int a4)
{
  uint64_t result;
  int v9;
  uint64_t v10;

  result = 3758097090;
  if (a1 && a2 && a3 && a4 <= 4)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    v9 = *(_DWORD *)(a1 + 4 * a4 + 2156);
    if (v9 && (v10 = a1 + 4 * a4, *(_DWORD *)(v10 + 2176)))
    {
      result = 0;
      *a2 = v9;
      *a3 = *(_DWORD *)(v10 + 2176);
    }
    else
    {
      return 3758096385;
    }
  }
  return result;
}

BOOL MTDeviceIsAlive(_BOOL8 result)
{
  io_service_t *v1;
  __int128 v2;
  int v3;
  _DWORD v4[129];
  int inputStruct;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = (io_service_t *)result;
    *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v36 = v2;
    v37 = v2;
    v34 = v2;
    v35 = v2;
    v32 = v2;
    v33 = v2;
    v30 = v2;
    v31 = v2;
    v28 = v2;
    v29 = v2;
    v26 = v2;
    v27 = v2;
    v24 = v2;
    v25 = v2;
    v22 = v2;
    v23 = v2;
    v21 = v2;
    v20 = v2;
    v19 = v2;
    v18 = v2;
    v17 = v2;
    v16 = v2;
    v15 = v2;
    v14 = v2;
    v13 = v2;
    v12 = v2;
    v11 = v2;
    v10 = v2;
    v9 = v2;
    v8 = v2;
    v7 = v2;
    v6 = v2;
    memset(v4, 170, sizeof(v4));
    inputStruct = 0;
    v3 = MTDeviceIssueDriverRequest(v1, &inputStruct, v4);
    return (v3 | v4[0]) == 0;
  }
  return result;
}

uint64_t MTDeviceGetSubdeviceID(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  if (!a1)
    return 3758097090;
  if (*(_BYTE *)(a1 + 133))
    mt_CachePropertiesForDevice(a1);
  result = 0;
  *a2 = *(_BYTE *)(a1 + 2152);
  return result;
}

uint64_t MTDeviceGetDeviceTimestampOffset(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 3758097090;
  result = 0;
  *a2 = *(_QWORD *)(a1 + 184);
  return result;
}

uint64_t MTDeviceCopyDeviceUsagePairs(uint64_t a1, _QWORD *a2)
{
  if (a1)
    return mt_DeviceCopyArrayProperty(a1, CFSTR("DeviceUsagePairs"), a2);
  else
    return 3758097090;
}

uint64_t MTDeviceSetGenerateRingCentroid(uint64_t result, char a2)
{
  *(_BYTE *)(result + 2153) = a2;
  return result;
}

uint64_t MTDeviceGetGenerateRingCentroid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2153);
}

uint64_t MTDeviceSetDisableTipCentroid(uint64_t result, char a2)
{
  *(_BYTE *)(result + 2154) = a2;
  return result;
}

uint64_t MTDeviceGetDisableTipCentroid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2154);
}

uint64_t MTDeviceGetDriverMaxPacketSize(uint64_t a1)
{
  return _MTDeviceGetMaxPacketSizeByKey(a1, CFSTR("Max Packet Size"), 4096);
}

uint64_t _MTDeviceGetMaxPacketSizeByKey(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  io_registry_entry_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v6;
  CFTypeID v7;
  int Value;
  int valuePtr;

  if (!a1)
    return 0;
  v3 = *(_DWORD *)(a1 + 16);
  if (!v3)
    return 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = CFGetTypeID(CFProperty);
    if (v7 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      Value = CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr > 511 && Value == 1)
        a3 = valuePtr;
      else
        a3 = a3;
    }
    CFRelease(v6);
  }
  return a3;
}

uint64_t MTDeviceGetInjectionMaxPacketSize(uint64_t a1)
{
  return _MTDeviceGetMaxPacketSizeByKey(a1, CFSTR("Max Injection Packet Size"), 0);
}

uint64_t MTDeviceSetInjectionMaxPacketSize(io_service_t *a1, int a2)
{
  __int128 v4;
  uint64_t result;
  _DWORD v6[129];
  int inputStruct;
  char v8;
  char v9;
  char v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[28];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v42[12] = v4;
  v41 = v4;
  *(_OWORD *)v42 = v4;
  v39 = v4;
  v40 = v4;
  v37 = v4;
  v38 = v4;
  v35 = v4;
  v36 = v4;
  v33 = v4;
  v34 = v4;
  v31 = v4;
  v32 = v4;
  v29 = v4;
  v30 = v4;
  v28 = v4;
  v27 = v4;
  v26 = v4;
  v25 = v4;
  v24 = v4;
  v23 = v4;
  v22 = v4;
  v21 = v4;
  v20 = v4;
  v19 = v4;
  v18 = v4;
  v17 = v4;
  v16 = v4;
  v15 = v4;
  v14 = v4;
  v13 = v4;
  v12 = v4;
  memset(v6, 170, sizeof(v6));
  inputStruct = 19;
  v8 = HIBYTE(a2);
  v9 = BYTE2(a2);
  v10 = BYTE1(a2);
  v11 = a2;
  LODWORD(result) = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if ((_DWORD)result)
    return result;
  else
    return v6[0];
}

uint64_t MTDeviceGetSATelemetryReportID(uint64_t result)
{
  if (result)
    return *(unsigned __int8 *)(result + 5677);
  return result;
}

BOOL MTDeviceSupportsTapToWake(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 116) != 0;
  return result;
}

BOOL MTDeviceSupportsTouchReadyNotification(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 117) != 0;
  return result;
}

BOOL MTDeviceNeedsFirstPowerOffSuppressed(_BOOL8 result)
{
  if (result)
    return (*(_DWORD *)(result + 72) - 93) <= 1
        && !*(_BYTE *)(result + 42)
        && *(_BYTE *)(result + 119) == 0;
  return result;
}

uint64_t MTDeviceNotifyFirstPowerOffSuppressed(uint64_t a1)
{
  if (!a1)
    return 3758097090;
  *(_BYTE *)(a1 + 119) = 1;
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), CFSTR("FirstPowerOffSuppressed"), (CFTypeRef)*MEMORY[0x24BDBD270]);
}

BOOL MTDeviceUseContextualPower(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 118) != 0;
  return result;
}

uint64_t MTDeviceGetResetOnLockMs(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 120);
  return result;
}

uint64_t MTDeviceGetResetOnUnlockMs(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 124);
  return result;
}

BOOL MTDeviceShouldResetOnButton(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 128) != 0;
  return result;
}

BOOL MTDeviceShouldSkipFaceDetectionMode(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 129) != 0;
  return result;
}

uint64_t MTDeviceUpdateUILockState(uint64_t result, int a2)
{
  io_service_t *v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  char v6;

  v2 = (io_service_t *)result;
  if (*(_BYTE *)(result + 112))
  {
    v3 = *(unsigned __int8 *)(result + 113);
    *(_BYTE *)(result + 112) = 1;
    *(_BYTE *)(result + 113) = a2;
    if (v3 == a2)
      return result;
  }
  else
  {
    *(_BYTE *)(result + 112) = 1;
    *(_BYTE *)(result + 113) = a2;
  }
  v4 = a2 == 0;
  if (a2)
    v5 = 3;
  else
    v5 = 4;
  if (v4)
    v6 = 104;
  else
    v6 = 103;
  mt_PostNotificationEvent(result, v5);
  return mt_PostNotificationEventToDriver(v2, v6);
}

BOOL MTDevicePowerControlSupported(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 115) != 0;
  return result;
}

uint64_t MTDevicePowerSetEnabled(io_service_t *a1, int a2)
{
  int v2;

  if (a2)
    v2 = 2;
  else
    v2 = 0;
  return MTDevicePowerSetState(a1, v2);
}

uint64_t MTDeviceUpdatePowerStatistics(io_service_t *a1)
{
  __int128 v2;
  uint64_t result;
  BOOL v4;
  _DWORD v5[129];
  int inputStruct;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37 = v2;
  v38 = v2;
  v35 = v2;
  v36 = v2;
  v33 = v2;
  v34 = v2;
  v31 = v2;
  v32 = v2;
  v29 = v2;
  v30 = v2;
  v27 = v2;
  v28 = v2;
  v25 = v2;
  v26 = v2;
  v23 = v2;
  v24 = v2;
  v22 = v2;
  v21 = v2;
  v20 = v2;
  v19 = v2;
  v18 = v2;
  v17 = v2;
  v16 = v2;
  v15 = v2;
  v14 = v2;
  v13 = v2;
  v12 = v2;
  v11 = v2;
  v10 = v2;
  v9 = v2;
  v8 = v2;
  v7 = v2;
  memset(v5, 170, sizeof(v5));
  inputStruct = 12;
  LODWORD(result) = MTDeviceIssueDriverRequest(a1, &inputStruct, v5);
  if (v5[0])
    v4 = (_DWORD)result == 0;
  else
    v4 = 0;
  if (v4)
    return v5[0];
  else
    return result;
}

uint64_t MTDevicePowerGetEnabled(io_service_t *a1, BOOL *a2)
{
  uint64_t result;
  int v4;

  v4 = -1431655766;
  result = MTDevicePowerGetState(a1, &v4);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = v4 == 2;
  }
  return result;
}

uint64_t MTDevicePowerGetState(io_service_t *a1, _DWORD *a2)
{
  __int128 v4;
  uint64_t result;
  _DWORD v6[129];
  int inputStruct;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v4;
  v39 = v4;
  v36 = v4;
  v37 = v4;
  v34 = v4;
  v35 = v4;
  v32 = v4;
  v33 = v4;
  v30 = v4;
  v31 = v4;
  v28 = v4;
  v29 = v4;
  v26 = v4;
  v27 = v4;
  v24 = v4;
  v25 = v4;
  v23 = v4;
  v22 = v4;
  v21 = v4;
  v20 = v4;
  v19 = v4;
  v18 = v4;
  v17 = v4;
  v16 = v4;
  v15 = v4;
  v14 = v4;
  v13 = v4;
  v12 = v4;
  v11 = v4;
  v10 = v4;
  v9 = v4;
  v8 = v4;
  memset(v6, 170, sizeof(v6));
  inputStruct = 3;
  result = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if (!(_DWORD)result)
  {
    result = v6[0];
    if (a2)
    {
      if (!v6[0])
      {
        if (LOBYTE(v6[1]) > 2u)
        {
          return 3758096385;
        }
        else
        {
          result = 0;
          *a2 = LOBYTE(v6[1]);
        }
      }
    }
  }
  return result;
}

uint64_t mt_RecursiveMakeDirectory(const char *a1, mode_t a2, uid_t a3, gid_t a4, int a5)
{
  size_t v10;
  size_t v11;
  int v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  timespec v16;
  uint64_t v17;
  stat v19;
  char __b[1024];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "%s", a1);
  v10 = strlen(__b);
  if (v10 >= 2)
  {
    v11 = v10;
    v12 = 0;
    for (i = 1; v11 != i; ++i)
    {
      if (__b[i] == 47)
      {
        if (v12 >= a5)
        {
          __b[i] = 0;
          v14 = mkdir(__b, a2);
          if ((_DWORD)v14)
          {
            v15 = v14;
            if (*__error() != 17)
              return v15;
          }
          v16.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v16.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&v19.st_blksize = v16;
          *(timespec *)v19.st_qspare = v16;
          v19.st_birthtimespec = v16;
          *(timespec *)&v19.st_size = v16;
          v19.st_mtimespec = v16;
          v19.st_ctimespec = v16;
          *(timespec *)&v19.st_uid = v16;
          v19.st_atimespec = v16;
          *(timespec *)&v19.st_dev = v16;
          v17 = stat(__b, &v19);
          if ((_DWORD)v17)
            return v17;
          if (v19.st_uid != a3 || v19.st_gid != a4)
          {
            v17 = chown(__b, a3, a4);
            if ((_DWORD)v17)
              return v17;
          }
          __b[i] = 47;
        }
        else
        {
          ++v12;
        }
      }
    }
  }
  return 0;
}

uint64_t MTDeviceUpdateDynamicCalibration(uint64_t a1)
{
  uint64_t v1;
  timespec v2;
  uint64_t v3;
  int v4;
  int v5;
  timespec v6;
  gid_t st_gid;
  const __CFAllocator *v8;
  const __CFString *v9;
  const __CFURL *v10;
  __CFWriteStream *v11;
  __CFWriteStream *v12;
  stat v14;
  stat v15;
  CFPropertyListRef v16;

  v16 = 0;
  v1 = mt_DeviceCopyDictionaryProperty(a1, CFSTR("Dynamic Calibration"), &v16);
  if (v16)
  {
    v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v15.st_blksize = v2;
    *(timespec *)v15.st_qspare = v2;
    v3 = 3758097086;
    v15.st_birthtimespec = v2;
    *(timespec *)&v15.st_size = v2;
    v15.st_mtimespec = v2;
    v15.st_ctimespec = v2;
    *(timespec *)&v15.st_uid = v2;
    v15.st_atimespec = v2;
    *(timespec *)&v15.st_dev = v2;
    if (!stat("/var/mobile/Library/Application Support/Multitouch/", &v15)
      || !stat("/var/mobile/Library/", &v15)
      && (!mt_RecursiveMakeDirectory("/var/mobile/Library/Application Support/Multitouch/", 0x1C0u, v15.st_uid, v15.st_gid, 3)|| *__error() == 17))
    {
      v4 = open("/var/mobile/Library/Application Support/Multitouch/multitouch.dycal", 512, 420);
      if ((v4 & 0x80000000) == 0)
      {
        v5 = v4;
        v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(timespec *)&v14.st_blksize = v6;
        *(timespec *)v14.st_qspare = v6;
        v14.st_birthtimespec = v6;
        *(timespec *)&v14.st_size = v6;
        v14.st_mtimespec = v6;
        v14.st_ctimespec = v6;
        *(timespec *)&v14.st_uid = v6;
        v14.st_atimespec = v6;
        *(timespec *)&v14.st_dev = v6;
        if (!fstat(v4, &v14))
        {
          if (v14.st_uid == v15.st_uid)
          {
            st_gid = v15.st_gid;
            if (v14.st_gid == v15.st_gid)
            {
LABEL_13:
              if (fcntl(v5, 64, 4))
              {
                v3 = 3758097095;
              }
              else
              {
                close(v5);
                v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
                v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "/var/mobile/Library/Application Support/Multitouch/multitouch.dycal", 0);
                v10 = CFURLCreateWithFileSystemPath(v8, v9, kCFURLPOSIXPathStyle, 0);
                v11 = CFWriteStreamCreateWithFile(v8, v10);
                v3 = 3758097085;
                if (v9)
                {
                  if (v10)
                  {
                    v12 = v11;
                    if (v11)
                    {
                      if (CFWriteStreamOpen(v11))
                      {
                        CFPropertyListWrite(v16, v12, kCFPropertyListXMLFormat_v1_0, 0, 0);
                        CFWriteStreamClose(v12);
                      }
                      else
                      {
                        v1 = 3758097101;
                      }
                      CFRelease(v12);
                      CFRelease(v9);
                      CFRelease(v10);
                      v3 = v1;
                    }
                  }
                }
              }
              goto LABEL_22;
            }
          }
          else
          {
            st_gid = v15.st_gid;
          }
          if (!chown("/var/mobile/Library/Application Support/Multitouch/multitouch.dycal", v15.st_uid, st_gid))
            goto LABEL_13;
        }
      }
    }
LABEL_22:
    CFRelease(v16);
    return v3;
  }
  return v1;
}

uint64_t MTDeviceSetParserEnabled(io_service_t *a1, char a2)
{
  __int128 v4;
  uint64_t result;
  _DWORD v6[129];
  int inputStruct;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v4;
  v39 = v4;
  v36 = v4;
  v37 = v4;
  v34 = v4;
  v35 = v4;
  v32 = v4;
  v33 = v4;
  v30 = v4;
  v31 = v4;
  v28 = v4;
  v29 = v4;
  v26 = v4;
  v27 = v4;
  v24 = v4;
  v25 = v4;
  v23 = v4;
  v22 = v4;
  v21 = v4;
  v20 = v4;
  v19 = v4;
  v18 = v4;
  v17 = v4;
  v16 = v4;
  v15 = v4;
  v14 = v4;
  v13 = v4;
  v12 = v4;
  v11 = v4;
  v10 = v4;
  v9 = v4;
  v8 = v4;
  memset(v6, 170, sizeof(v6));
  inputStruct = 17;
  LOBYTE(v8) = a2;
  result = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if (!(_DWORD)result)
  {
    result = v6[0];
    if (!v6[0])
    {
      mt_PostNotificationEventToDriver(a1, 26);
      return 0;
    }
  }
  return result;
}

uint64_t MTDeviceGetParserEnabled(io_service_t *a1, BOOL *a2)
{
  __int128 v4;
  uint64_t result;
  unsigned int v6;
  _DWORD v7[129];
  int inputStruct;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39 = v4;
  v40 = v4;
  v37 = v4;
  v38 = v4;
  v35 = v4;
  v36 = v4;
  v33 = v4;
  v34 = v4;
  v31 = v4;
  v32 = v4;
  v29 = v4;
  v30 = v4;
  v27 = v4;
  v28 = v4;
  v25 = v4;
  v26 = v4;
  v24 = v4;
  v23 = v4;
  v22 = v4;
  v21 = v4;
  v20 = v4;
  v19 = v4;
  v18 = v4;
  v17 = v4;
  v16 = v4;
  v15 = v4;
  v14 = v4;
  v13 = v4;
  v12 = v4;
  v11 = v4;
  v10 = v4;
  v9 = v4;
  memset(v7, 170, sizeof(v7));
  inputStruct = 18;
  LODWORD(result) = MTDeviceIssueDriverRequest(a1, &inputStruct, v7);
  v6 = v7[0];
  if (a2 && !(_DWORD)result && !v7[0])
    *a2 = LOBYTE(v7[1]) == 1;
  if ((_DWORD)result)
    return result;
  else
    return v6;
}

uint64_t MTDeviceSetSystemForceResponseEnabled(io_service_t *a1, char a2)
{
  __int128 v4;
  uint64_t result;
  _DWORD v6[129];
  int inputStruct;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v4;
  v39 = v4;
  v36 = v4;
  v37 = v4;
  v34 = v4;
  v35 = v4;
  v32 = v4;
  v33 = v4;
  v30 = v4;
  v31 = v4;
  v28 = v4;
  v29 = v4;
  v26 = v4;
  v27 = v4;
  v24 = v4;
  v25 = v4;
  v23 = v4;
  v22 = v4;
  v21 = v4;
  v20 = v4;
  v19 = v4;
  v18 = v4;
  v17 = v4;
  v16 = v4;
  v15 = v4;
  v14 = v4;
  v13 = v4;
  v12 = v4;
  v11 = v4;
  v10 = v4;
  v9 = v4;
  v8 = v4;
  memset(v6, 170, sizeof(v6));
  inputStruct = 15;
  LOBYTE(v8) = a2;
  result = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if (!(_DWORD)result)
  {
    result = v6[0];
    if (!v6[0])
    {
      mt_PostNotificationEventToDriver(a1, 28);
      return 0;
    }
  }
  return result;
}

BOOL MTDeviceGetSystemForceResponseEnabled(io_service_t *a1)
{
  __int128 v2;
  int v3;
  _DWORD v5[129];
  int inputStruct;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37 = v2;
  v38 = v2;
  v35 = v2;
  v36 = v2;
  v33 = v2;
  v34 = v2;
  v31 = v2;
  v32 = v2;
  v29 = v2;
  v30 = v2;
  v27 = v2;
  v28 = v2;
  v25 = v2;
  v26 = v2;
  v23 = v2;
  v24 = v2;
  v22 = v2;
  v21 = v2;
  v20 = v2;
  v19 = v2;
  v18 = v2;
  v17 = v2;
  v16 = v2;
  v15 = v2;
  v14 = v2;
  v13 = v2;
  v12 = v2;
  v11 = v2;
  v10 = v2;
  v9 = v2;
  v8 = v2;
  v7 = v2;
  memset(v5, 170, sizeof(v5));
  inputStruct = 16;
  v3 = MTDeviceIssueDriverRequest(a1, &inputStruct, v5);
  return !(v3 | v5[0]) && LOBYTE(v5[1]) != 0;
}

uint64_t MTDeviceEnableWorkIntervalNotification(uint64_t a1)
{
  uint64_t v1;
  mach_timebase_info v4;
  int v5;

  v1 = 3758097084;
  if (!a1)
    return 3758097090;
  if (*(_QWORD *)(a1 + 5664))
    return 3758097109;
  v5 = -1431655766;
  if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), CFSTR("FrameProcessingTimeoutUs"), &v5))
    return 3758097095;
  v4 = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info(&v4);
  *(_QWORD *)(a1 + 5656) = 1000 * v5 * (unint64_t)v4.denom / v4.numer;
  if (!work_interval_create())
    return 0;
  *(_QWORD *)(a1 + 5664) = 0;
  return v1;
}

uint64_t MTDeviceNotifyWorkInterval(uint64_t a1, int a2)
{
  uint64_t result;

  if (!a1)
    return 3758097090;
  result = 0;
  *(_DWORD *)(a1 + 5672) = a2;
  *(_BYTE *)(a1 + 5676) = 1;
  return result;
}

void _MTDriverAppendIOReporterChannelsToResetInfo()
{
  uint64_t v0;
  const void *v1;

  v0 = IOReportCopyChannelsForDriver();
  if (v0)
  {
    v1 = (const void *)v0;
    if ((int)IOReportGetChannelCount() >= 1)
      IOReportCreateSubscription();
    CFRelease(v1);
  }
}

__CFArray *MTDriverCreateResetInfo()
{
  uint64_t v0;
  const __CFAllocator *v1;
  char v2;
  const __CFString *v3;
  const CFDictionaryKeyCallBacks *v4;
  char v5;
  const char *v6;
  const __CFDictionary *v7;
  uint64_t MatchingService;
  io_registry_entry_t ChildServiceWithProperty;
  io_registry_entry_t v10;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v12;
  CFStringRef v13;
  CFStringRef v14;
  const __CFString *v15;
  uint64_t i;
  const __CFString *v17;
  CFTypeRef CFProperty;
  const void *v19;
  CFTypeRef v20;
  __CFArray *theArray;

  theArray = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (theArray)
  {
    v0 = 0;
    v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v2 = 1;
    v3 = CFSTR("ResetCount");
    v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    do
    {
      v5 = v2;
      v6 = kRootDriverNames[v0];
      v7 = IOServiceNameMatching(v6);
      if (v7)
      {
        MatchingService = IOServiceGetMatchingService(0, v7);
        ChildServiceWithProperty = findChildServiceWithProperty(MatchingService, v3);
        if (ChildServiceWithProperty)
        {
          v10 = ChildServiceWithProperty;
          Mutable = CFDictionaryCreateMutable(v1, 0, v4, MEMORY[0x24BDBD6B0]);
          if (Mutable)
          {
            v12 = Mutable;
            v13 = CFStringCreateWithCString(0, v6, 0x8000100u);
            if (v13)
            {
              v14 = v13;
              v15 = v3;
              CFDictionarySetValue(v12, CFSTR("Name"), v13);
              for (i = 0; i != 24; i += 8)
              {
                v17 = *(const __CFString **)((char *)&off_24DC7DC40 + i);
                CFProperty = IORegistryEntryCreateCFProperty(v10, v17, v1, 0);
                if (CFProperty)
                {
                  v19 = CFProperty;
                  CFDictionarySetValue(v12, v17, CFProperty);
                  CFRelease(v19);
                }
              }
              _MTDriverAppendIOReporterChannelsToResetInfo();
              v20 = CFRetain(v12);
              CFRelease(v14);
              v3 = v15;
              v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
            }
            else
            {
              v20 = 0;
            }
            CFRelease(v12);
            IOObjectRelease(v10);
            if (v20)
            {
              CFArrayAppendValue(theArray, v20);
              CFRelease(v20);
            }
          }
          else
          {
            IOObjectRelease(v10);
          }
        }
      }
      v2 = 0;
      v0 = 1;
    }
    while ((v5 & 1) != 0);
  }
  return theArray;
}

uint64_t findChildServiceWithProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t v3;
  CFTypeRef CFProperty;
  const void *v6;
  uint64_t ChildServiceWithProperty;
  uint64_t v8;
  io_iterator_t iterator;

  v3 = 0;
  iterator = 0;
  if ((_DWORD)a1 && a2)
  {
    CFProperty = IORegistryEntryCreateCFProperty(a1, a2, 0, 0);
    if (CFProperty)
    {
      v6 = CFProperty;
      IOObjectRetain(a1);
      v3 = a1;
    }
    else
    {
      if (!MEMORY[0x22073CDA0](a1, "IOService", &iterator))
      {
        while (1)
        {
          v8 = IOIteratorNext(iterator);
          if (!(_DWORD)v8)
            break;
          ChildServiceWithProperty = findChildServiceWithProperty(v8, a2);
          if ((_DWORD)ChildServiceWithProperty)
          {
            v3 = ChildServiceWithProperty;
            v6 = 0;
            goto LABEL_10;
          }
        }
      }
      v6 = 0;
      v3 = 0;
    }
LABEL_10:
    if (iterator)
    {
      IOObjectRelease(iterator);
      iterator = 0;
    }
    if (v6)
      CFRelease(v6);
  }
  if ((_DWORD)a1)
    IOObjectRelease(a1);
  return v3;
}

uint64_t MTDeviceGetResetCount(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  char i;
  char v5;
  const __CFDictionary *v6;
  uint64_t MatchingService;
  io_registry_entry_t ChildServiceWithProperty;
  io_object_t v9;
  const __CFNumber *CFProperty;
  int Value;
  int valuePtr;

  v3 = 0;
  for (i = 1; ; i = 0)
  {
    v5 = i;
    v6 = IOServiceNameMatching(kRootDriverNames[v3]);
    if (v6)
    {
      MatchingService = IOServiceGetMatchingService(0, v6);
      ChildServiceWithProperty = findChildServiceWithProperty(MatchingService, CFSTR("ResetCount"));
      if (ChildServiceWithProperty)
      {
        v9 = ChildServiceWithProperty;
        CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(ChildServiceWithProperty, CFSTR("ResetCount"), 0, 0);
        IOObjectRelease(v9);
        if (CFProperty)
        {
          valuePtr = 0;
          Value = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
          CFRelease(CFProperty);
          if (Value)
          {
            if ((valuePtr & 0x80000000) == 0)
              break;
          }
        }
      }
    }
    v3 = 1;
    if ((v5 & 1) == 0)
      return 3758097136;
  }
  if (a2)
    *a2 = valuePtr;
  return 0;
}

uint64_t MTSwapInt16DeviceToHost(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  v2 = __rev16(a2);
  if (*(_DWORD *)(a1 + 100) == 1)
    return a2;
  else
    return v2;
}

uint64_t MTSwapInt16PtrDeviceToHost(uint64_t result, unsigned __int16 *a2)
{
  unsigned int v2;
  unsigned __int16 v3;

  v2 = bswap32(*a2) >> 16;
  if (*(_DWORD *)(result + 100) == 1)
    v3 = *a2;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t MTSwapInt16HostToDevice(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  v2 = __rev16(a2);
  if (*(_DWORD *)(a1 + 100) == 1)
    return a2;
  else
    return v2;
}

uint64_t MTSwapInt16PtrHostToDevice(uint64_t result, unsigned __int16 *a2)
{
  unsigned int v2;
  unsigned __int16 v3;

  v2 = bswap32(*a2) >> 16;
  if (*(_DWORD *)(result + 100) == 1)
    v3 = *a2;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t MTSwapInt32DeviceToHost(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  v2 = bswap32(a2);
  if (*(_DWORD *)(a1 + 100) == 1)
    return a2;
  else
    return v2;
}

uint64_t MTSwapInt32PtrDeviceToHost(uint64_t result, unsigned int *a2)
{
  unsigned int v2;
  unsigned int v3;

  v2 = bswap32(*a2);
  if (*(_DWORD *)(result + 100) == 1)
    v3 = *a2;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

uint64_t MTSwapInt32HostToDevice(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  v2 = bswap32(a2);
  if (*(_DWORD *)(a1 + 100) == 1)
    return a2;
  else
    return v2;
}

uint64_t MTSwapInt32PtrHostToDevice(uint64_t result, unsigned int *a2)
{
  unsigned int v2;
  unsigned int v3;

  v2 = bswap32(*a2);
  if (*(_DWORD *)(result + 100) == 1)
    v3 = *a2;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

NSObject *mt_CreateBinaryFilters(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  unint64_t v67;
  NSObject *v68;
  void *v69;
  objc_class *v70;
  id v71;
  void *v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  const char *v78;
  uint64_t v79;
  uint32_t v80;
  NSObject *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  const char *v85;
  uint32_t v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  const char *v102;
  uint32_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  NSObject *v108;
  uint64_t v109;
  NSObject *v110;
  int v111;
  uint64_t v112;
  NSObject *v114;
  int v115;
  NSObject *v116;
  const char *v117;
  NSObject *v118;
  void *v119;
  NSObject *v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  id obj;
  void *v129;
  void *v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  unint64_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  const __CFString *v150;
  void *v151;
  uint8_t v152[128];
  uint8_t v153[4];
  uint64_t v154;
  __int16 v155;
  uint64_t v156;
  _BYTE buf[24];
  void *v158;
  id v159;
  uint64_t v160;
  uint64_t v161;

  v161 = *MEMORY[0x24BDAC8D0];
  v145 = 0xAAAAAAAAAAAAAAAALL;
  if (mt_DeviceCopyArrayProperty(a1, CFSTR("BinaryFilters"), &v145))
  {
    v1 = 0;
    v145 = 0;
  }
  else
  {
    v1 = (void *)v145;
  }
  if (objc_msgSend(v1, "count"))
  {
    v2 = objc_opt_new();
    v3 = 0x24BDBC000uLL;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/MultitouchPlugins"), 1);
    if (v4)
    {
      v5 = objc_opt_new();
      v6 = v5;
      if (v5)
      {
        v118 = v5;
        v119 = v1;
        v7 = a1;
        +[MTAHTSupport getInterfaceInServiceTree:](MTAHTSupport, "getInterfaceInServiceTree:", MTDeviceGetService(a1));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = v2;
        v120 = v2;
        v126 = v4;
        if (!v8)
        {
          if (!a1)
          {
            MTLoggingFramework();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A1DE000, v12, OS_LOG_TYPE_ERROR, "MTDevice doesn't have an AHTInterface", buf, 2u);
            }
            v13 = 0;
            v14 = v119;
            v10 = v120;
            goto LABEL_70;
          }
          v14 = v1;
          if (*(_BYTE *)(a1 + 133))
            mt_CachePropertiesForDevice(a1);
          MTLoggingFramework();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v7 = a1;
            v29 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v29;
            _os_log_impl(&dword_21A1DE000, v12, OS_LOG_TYPE_ERROR, "MTDevice doesn't have an AHTInterface (deviceID 0x%llX)", buf, 0xCu);
            v13 = 0;
            goto LABEL_71;
          }
LABEL_69:
          v13 = 0;
LABEL_70:
          v7 = a1;
          goto LABEL_71;
        }
        objc_msgSend(v8, "getBootLoader");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
LABEL_9:
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __mt_CreateGetPropertyBlock_block_invoke;
          v158 = &unk_24DC7DCC8;
          v159 = v11;
          v160 = v7;
          v12 = v11;
          v13 = (void *)MEMORY[0x22073D28C](buf);

          v14 = v119;
LABEL_71:

          if (v13)
            v39 = v13;
          else
            v39 = &__block_literal_global;
          v140 = MEMORY[0x22073D28C](v39);

          v40 = (void *)objc_opt_new();
          LODWORD(v146) = -1431655766;
          if (!MTDeviceGetVersion(v7, &v146))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@0x%08X"), CFSTR("MTFW-"), v146);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v41);

          }
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", CFSTR("/System/Library/Extensions/AppleMultitouchSPI.kext/PlugIns/MultitouchHID.plugin/"));
          v43 = v42;
          v24 = v140;
          if (v42)
          {
            objc_msgSend(v42, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MultitouchHID.plugin-"), v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v45);

              v24 = v140;
            }

          }
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/MultitouchSupport.framework/"));
          if (v46)
          {
            objc_msgSend(v43, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MultitouchSupport.framework-"), v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v48);

            }
            v24 = v140;
          }
          if (objc_msgSend(v40, "count"))
          {
            v49 = v40;
          }
          else
          {
            if (a1)
            {
              if (*(_BYTE *)(a1 + 133))
                mt_CachePropertiesForDevice(a1);
              MTLoggingFramework();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                v51 = *(_QWORD *)(a1 + 64);
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v51;
                _os_log_impl(&dword_21A1DE000, v50, OS_LOG_TYPE_ERROR, "No versions could be retrieved (deviceID 0x%llX)", buf, 0xCu);
              }

              v49 = 0;
            }
            else
            {
              MTLoggingFramework();
              v116 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21A1DE000, v116, OS_LOG_TYPE_ERROR, "No versions could be retrieved", buf, 2u);
              }

              v49 = 0;
              v14 = v119;
              v10 = v120;
            }
            v24 = v140;
          }

          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          obj = v14;
          v52 = a1;
          v127 = v49;
          v134 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
          v2 = v10;
          if (v134)
          {
            v53 = 0x24BDBC000uLL;
            v133 = *(_QWORD *)v142;
            do
            {
              v54 = 0;
              do
              {
                if (*(_QWORD *)v142 != v133)
                  objc_enumerationMutation(obj);
                v55 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v54);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v150 = CFSTR("Name");
                  v151 = v55;
                  objc_msgSend(*(id *)(v53 + 3696), "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = (void *)objc_msgSend(v57, "mutableCopy");

                  if (!v49)
                    goto LABEL_103;
LABEL_102:
                  v58 = (void *)objc_msgSend(v49, "mutableCopy");
                  objc_msgSend(v56, "setObject:forKey:", v58, CFSTR("Versions"));

                  goto LABEL_103;
                }
                v56 = (void *)objc_msgSend(v55, "mutableCopy");
                if (v49)
                  goto LABEL_102;
LABEL_103:
                v59 = v4;
                v60 = v56;
                v138 = (id)v24;
                objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("Name"));
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v137 = v59;
                if (!v61)
                {
                  v63 = 0;
                  v52 = a1;
                  goto LABEL_128;
                }
                v136 = v61;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.plugin"), v61);
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = (void *)objc_msgSend(objc_alloc(*(Class *)(v3 + 3912)), "initWithString:relativeToURL:", v135, v59);
                v63 = 0;
                v52 = a1;
                if (objc_msgSend(v62, "checkResourceIsReachableAndReturnError:", 0))
                {
                  v131 = v54;
                  v64 = v62;
                  v65 = v60;
                  v132 = v138;
                  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithURL:", v64);
                  v129 = v65;
                  v130 = v62;
                  if (objc_msgSend(v66, "load"))
                  {
                    v67 = v3;
                    v68 = v2;
                    v69 = v66;
                    v70 = (objc_class *)objc_msgSend(v66, "principalClass");
                    if ((-[objc_class conformsToProtocol:](v70, "conformsToProtocol:", &unk_2550D0830) & 1) != 0)
                    {
                      v71 = [v70 alloc];
                      v54 = v131;
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                      {
                        v63 = (id)objc_msgSend(v71, "initWithInfo:getProperty:", v65, v132);
                        v52 = a1;
                        v72 = v69;
                        v2 = v68;
                        v3 = v67;
                        v4 = v126;
                        goto LABEL_113;
                      }
                      v122 = v71;
                      v87 = v65;
                      v88 = v132;
                      v125 = v87;
                      objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("PropertyNames"));
                      v89 = objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v124 = (void *)v89;
                      v52 = a1;
                      v72 = v69;
                      v123 = v64;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v90 = objc_opt_new();
                        if (v90)
                        {
                          v91 = v90;
                          v121 = v60;
                          v148 = 0u;
                          v149 = 0u;
                          v146 = 0u;
                          v147 = 0u;
                          v92 = v124;
                          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v146, buf, 16);
                          if (!v93)
                            goto LABEL_160;
                          v94 = v93;
                          v95 = *(_QWORD *)v147;
                          while (1)
                          {
                            v96 = 0;
                            do
                            {
                              if (*(_QWORD *)v147 != v95)
                                objc_enumerationMutation(v92);
                              v97 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * v96);
                              (*(void (**)(id, uint64_t))(v24 + 16))(v88, v97);
                              v98 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v98)
                              {
                                -[NSObject setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", v98, v97);
                                goto LABEL_155;
                              }
                              if (v52)
                              {
                                if (*(_BYTE *)(v52 + 133))
                                  mt_CachePropertiesForDevice(v52);
                                MTLoggingFramework();
                                v99 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                                  goto LABEL_154;
                                v100 = *(_QWORD *)(a1 + 64);
                                *(_DWORD *)v153 = 138543618;
                                v154 = v97;
                                v155 = 2048;
                                v156 = v100;
                                v101 = v99;
                                v102 = "Could not retrieve the property %{public}@ (deviceID 0x%llX)";
                                v103 = 22;
                              }
                              else
                              {
                                MTLoggingFramework();
                                v99 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                                  goto LABEL_154;
                                *(_DWORD *)v153 = 138543362;
                                v154 = v97;
                                v101 = v99;
                                v102 = "Could not retrieve the property %{public}@";
                                v103 = 12;
                              }
                              _os_log_impl(&dword_21A1DE000, v101, OS_LOG_TYPE_ERROR, v102, v153, v103);
LABEL_154:

                              v52 = a1;
LABEL_155:

                              ++v96;
                              v24 = v140;
                            }
                            while (v94 != v96);
                            v72 = v69;
                            v104 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v146, buf, 16);
                            v94 = v104;
                            if (!v104)
                            {
LABEL_160:

                              objc_msgSend(v125, "setObject:forKeyedSubscript:", v91, CFSTR("Properties"));
                              v2 = v120;
                              v4 = v126;
                              v3 = 0x24BDBC000;
                              v60 = v121;
                              v54 = v131;
                              goto LABEL_173;
                            }
                          }
                        }
                        if (a1)
                        {
                          v2 = v68;
                          if (*(_BYTE *)(a1 + 133))
                            mt_CachePropertiesForDevice(a1);
                          MTLoggingFramework();
                          v106 = objc_claimAutoreleasedReturnValue();
                          v3 = v67;
                          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                          {
                            v107 = *(_QWORD *)(a1 + 64);
                            *(_DWORD *)buf = 134217984;
                            *(_QWORD *)&buf[4] = v107;
                            _os_log_impl(&dword_21A1DE000, v106, OS_LOG_TYPE_ERROR, "Could not allocate properties dict (deviceID 0x%llX)", buf, 0xCu);
                          }

                          v91 = 0;
                          v52 = a1;
                          goto LABEL_172;
                        }
                        MTLoggingFramework();
                        v108 = objc_claimAutoreleasedReturnValue();
                        v2 = v68;
                        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_21A1DE000, v108, OS_LOG_TYPE_ERROR, "Could not allocate properties dict", buf, 2u);
                        }

                        v91 = 0;
                        v52 = a1;
                      }
                      else
                      {
                        if (a1)
                        {
                          v2 = v68;
                          if (*(_BYTE *)(a1 + 133))
                            mt_CachePropertiesForDevice(a1);
                          MTLoggingFramework();
                          v91 = objc_claimAutoreleasedReturnValue();
                          v3 = v67;
                          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
                          {
                            v105 = *(_QWORD *)(a1 + 64);
                            *(_DWORD *)buf = 134217984;
                            *(_QWORD *)&buf[4] = v105;
                            _os_log_impl(&dword_21A1DE000, v91, OS_LOG_TYPE_DEBUG, "No property names to read (deviceID 0x%llX)", buf, 0xCu);
                          }
                          goto LABEL_172;
                        }
                        MTLoggingFramework();
                        v91 = objc_claimAutoreleasedReturnValue();
                        v2 = v68;
                        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_21A1DE000, v91, OS_LOG_TYPE_DEBUG, "No property names to read", buf, 2u);
                        }
                      }
                      v3 = v67;
LABEL_172:
                      v4 = v126;
LABEL_173:

                      v63 = (id)objc_msgSend(v122, "initWithInfo:", v125);
                      v64 = v123;
LABEL_113:

                      v73 = v64;
                      if (v63)
                      {
                        if (v52)
                        {
                          if (*(_BYTE *)(v52 + 133))
                            mt_CachePropertiesForDevice(v52);
                          MTLoggingFramework();
                          v74 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                          {
                            v75 = *(_QWORD *)(v52 + 64);
                            *(_DWORD *)buf = 138543618;
                            *(_QWORD *)&buf[4] = v73;
                            *(_WORD *)&buf[12] = 2048;
                            *(_QWORD *)&buf[14] = v75;
                            v76 = v74;
                            v77 = OS_LOG_TYPE_INFO;
                            v78 = "Created binary filter from %{public}@ (deviceID 0x%llX)";
                            goto LABEL_124;
                          }
LABEL_126:

                          v49 = v127;
                          v62 = v130;
                          goto LABEL_127;
                        }
                        MTLoggingFramework();
                        v74 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                          goto LABEL_126;
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)&buf[4] = v73;
                        v76 = v74;
                        v77 = OS_LOG_TYPE_INFO;
                        v78 = "Created binary filter from %{public}@";
LABEL_180:
                        v80 = 12;
                      }
                      else
                      {
                        if (!v52)
                        {
                          MTLoggingFramework();
                          v74 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                            goto LABEL_126;
                          *(_DWORD *)buf = 138543362;
                          *(_QWORD *)&buf[4] = v73;
                          v76 = v74;
                          v77 = OS_LOG_TYPE_ERROR;
                          v78 = "Couldn't create binary filter from %{public}@";
                          goto LABEL_180;
                        }
                        if (*(_BYTE *)(v52 + 133))
                          mt_CachePropertiesForDevice(v52);
                        MTLoggingFramework();
                        v74 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                          goto LABEL_126;
                        v79 = *(_QWORD *)(v52 + 64);
                        *(_DWORD *)buf = 138543618;
                        *(_QWORD *)&buf[4] = v73;
                        *(_WORD *)&buf[12] = 2048;
                        *(_QWORD *)&buf[14] = v79;
                        v76 = v74;
                        v77 = OS_LOG_TYPE_ERROR;
                        v78 = "Couldn't create binary filter from %{public}@ (deviceID 0x%llX)";
LABEL_124:
                        v80 = 22;
                      }
                      _os_log_impl(&dword_21A1DE000, v76, v77, v78, buf, v80);
                      goto LABEL_126;
                    }
                    v52 = a1;
                    v63 = -[MTBinaryFilterLegacy initFromURL:device:]([MTBinaryFilterLegacy alloc], "initFromURL:device:", v64, a1);
                    v72 = v66;
                    v2 = v68;
                    v3 = v67;
                    v4 = v126;
                  }
                  else
                  {
                    v63 = 0;
                    v72 = v66;
                  }
                  v54 = v131;
                  goto LABEL_113;
                }
LABEL_127:

                v61 = v136;
LABEL_128:

                if (v63)
                {
                  mt_UpdateMaxPacketSize(v52, v63);
                  -[NSObject addObject:](v2, "addObject:", v63);
                  goto LABEL_137;
                }
                if (v52)
                {
                  if (*(_BYTE *)(v52 + 133))
                    mt_CachePropertiesForDevice(v52);
                  MTLoggingFramework();
                  v81 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                    goto LABEL_136;
                  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("Name"));
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  v83 = *(_QWORD *)(a1 + 64);
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v82;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v83;
                  v84 = v81;
                  v85 = "Cannot create filter %{public}@ (deviceID 0x%llX)";
                  v86 = 22;
                }
                else
                {
                  MTLoggingFramework();
                  v81 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                    goto LABEL_136;
                  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("Name"));
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)&buf[4] = v82;
                  v84 = v81;
                  v85 = "Cannot create filter %{public}@";
                  v86 = 12;
                }
                _os_log_impl(&dword_21A1DE000, v84, OS_LOG_TYPE_ERROR, v85, buf, v86);

LABEL_136:
                v52 = a1;
LABEL_137:

                ++v54;
                v53 = 0x24BDBC000;
              }
              while (v54 != v134);
              v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
              v134 = v109;
            }
            while (v109);
          }

          if ((unint64_t)-[NSObject count](v2, "count") < 0xB)
          {
            v6 = v118;
            if (-[NSObject count](v2, "count"))
              v19 = v2;
            else
              v19 = 0;
            v1 = v119;
          }
          else
          {
            v6 = v118;
            if (v52)
            {
              if (*(_BYTE *)(v52 + 133))
                mt_CachePropertiesForDevice(a1);
              MTLoggingFramework();
              v110 = objc_claimAutoreleasedReturnValue();
              v1 = v119;
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
              {
                v111 = -[NSObject count](v2, "count");
                v112 = *(_QWORD *)(a1 + 64);
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v111;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = 10;
                *(_WORD *)&buf[14] = 2048;
                *(_QWORD *)&buf[16] = v112;
                _os_log_impl(&dword_21A1DE000, v110, OS_LOG_TYPE_ERROR, "Too many filters. Found %u, max supported: %u (deviceID 0x%llX)", buf, 0x18u);
              }

              v19 = 0;
            }
            else
            {
              MTLoggingFramework();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                v115 = -[NSObject count](v2, "count");
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v115;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = 10;
                _os_log_impl(&dword_21A1DE000, v114, OS_LOG_TYPE_ERROR, "Too many filters. Found %u, max supported: %u", buf, 0xEu);
              }

              v19 = 0;
              v6 = v118;
              v1 = v119;
              v4 = v126;
              v49 = v127;
              v24 = v140;
            }
          }

          goto LABEL_200;
        }
        if (a1)
        {
          if (*(_BYTE *)(a1 + 133))
            mt_CachePropertiesForDevice(a1);
          MTLoggingFramework();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = a1;
            v32 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v32;
            _os_log_impl(&dword_21A1DE000, v30, OS_LOG_TYPE_DEFAULT, "AHTInterface doesn't have an AHTBootloader. Trying with AHTDevice (deviceID 0x%llX)", buf, 0xCu);
            goto LABEL_54;
          }
        }
        else
        {
          MTLoggingFramework();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21A1DE000, v30, OS_LOG_TYPE_DEFAULT, "AHTInterface doesn't have an AHTBootloader. Trying with AHTDevice", buf, 2u);
          }
          v10 = v2;
        }
        v31 = a1;
LABEL_54:

        +[MTAHTSupport getDeviceInServiceTree:](MTAHTSupport, "getDeviceInServiceTree:", MTDeviceGetService(v31));
        v33 = objc_claimAutoreleasedReturnValue();
        v12 = v33;
        if (v33)
        {
          -[NSObject getBootLoader](v33, "getBootLoader");
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v11 = (void *)v34;

            v7 = a1;
            goto LABEL_9;
          }
          if (a1)
          {
            v14 = v119;
            if (*(_BYTE *)(a1 + 133))
              mt_CachePropertiesForDevice(a1);
            MTLoggingFramework();
            v35 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              goto LABEL_68;
            v38 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v38;
            v37 = "AHTDevice doesn't have an AHTBootloader (deviceID 0x%llX)";
            goto LABEL_67;
          }
          MTLoggingFramework();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v117 = "AHTDevice doesn't have an AHTBootloader";
            goto LABEL_213;
          }
        }
        else
        {
          if (v31)
          {
            v14 = v119;
            if (*(_BYTE *)(v31 + 133))
              mt_CachePropertiesForDevice(a1);
            MTLoggingFramework();
            v35 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              goto LABEL_68;
            v36 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v36;
            v37 = "MTDevice doesn't have an AHTDevice (deviceID 0x%llX)";
LABEL_67:
            _os_log_impl(&dword_21A1DE000, v35, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
LABEL_68:

            goto LABEL_69;
          }
          MTLoggingFramework();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v117 = "MTDevice doesn't have an AHTDevice";
LABEL_213:
            _os_log_impl(&dword_21A1DE000, v35, OS_LOG_TYPE_ERROR, v117, buf, 2u);
          }
        }
        v14 = v119;
        v10 = v120;
        goto LABEL_68;
      }
      if (a1)
      {
        if (*(_BYTE *)(a1 + 133))
          mt_CachePropertiesForDevice(a1);
        MTLoggingFramework();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        v25 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v25;
        v26 = "Cannot allocate bundles (deviceID 0x%llX)";
        v27 = v24;
        v28 = 12;
      }
      else
      {
        MTLoggingFramework();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        *(_WORD *)buf = 0;
        v26 = "Cannot allocate bundles";
        v27 = v24;
        v28 = 2;
      }
      _os_log_impl(&dword_21A1DE000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
LABEL_30:
      v19 = 0;
LABEL_200:

      goto LABEL_201;
    }
    if (a1)
    {
      if (*(_BYTE *)(a1 + 133))
        mt_CachePropertiesForDevice(a1);
      MTLoggingFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      v20 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v20;
      v21 = "Cannot create URL from default path (deviceID 0x%llX)";
      v22 = v6;
      v23 = 12;
    }
    else
    {
      MTLoggingFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v21 = "Cannot create URL from default path";
      v22 = v6;
      v23 = 2;
    }
    _os_log_impl(&dword_21A1DE000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
LABEL_23:
    v19 = 0;
LABEL_201:

    goto LABEL_202;
  }
  if (a1)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    MTLoggingFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    v15 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v15;
    v16 = "No binary filters found (deviceID 0x%llX)";
    v17 = v2;
    v18 = 12;
  }
  else
  {
    MTLoggingFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v16 = "No binary filters found";
    v17 = v2;
    v18 = 2;
  }
  _os_log_impl(&dword_21A1DE000, v17, OS_LOG_TYPE_DEBUG, v16, buf, v18);
LABEL_16:
  v19 = 0;
LABEL_202:

  return v19;
}

void mt_UpdateMaxPacketSize(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  int v20;
  int v21;
  __int16 v22;
  _WORD v23[11];

  *(_QWORD *)&v23[7] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "maxFrameSize");
  if (v4 <= MTDeviceGetDriverMaxPacketSize(a1))
    goto LABEL_16;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    MTLoggingFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_msgSend(v3, "maxFrameSize");
      v7 = *(_QWORD *)(a1 + 64);
      v20 = 67109376;
      v21 = v6;
      v22 = 2048;
      *(_QWORD *)v23 = v7;
      v8 = "Setting a max injection packet size of %u (deviceID 0x%llX)";
      v9 = v5;
      v10 = 18;
LABEL_7:
      _os_log_impl(&dword_21A1DE000, v9, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v20, v10);
    }
  }
  else
  {
    MTLoggingFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v20 = 67109120;
      v21 = objc_msgSend(v3, "maxFrameSize");
      v8 = "Setting a max injection packet size of %u";
      v9 = v5;
      v10 = 8;
      goto LABEL_7;
    }
  }

  v11 = MTDeviceSetInjectionMaxPacketSize((io_service_t *)a1, objc_msgSend(v3, "maxFrameSize"));
  if (v11)
  {
    v12 = v11;
    if (a1)
    {
      if (*(_BYTE *)(a1 + 133))
        mt_CachePropertiesForDevice(a1);
      MTLoggingFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v14 = objc_msgSend(v3, "maxFrameSize");
      v15 = *(_QWORD *)(a1 + 64);
      v20 = 67109632;
      v21 = v14;
      v22 = 1024;
      *(_DWORD *)v23 = v12;
      v23[2] = 2048;
      *(_QWORD *)&v23[3] = v15;
      v16 = "Error setting max injection packet size to %u: 0x%08X (deviceID 0x%llX)";
      v17 = v13;
      v18 = 24;
    }
    else
    {
      MTLoggingFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v19 = objc_msgSend(v3, "maxFrameSize");
      v20 = 67109376;
      v21 = v19;
      v22 = 1024;
      *(_DWORD *)v23 = v12;
      v16 = "Error setting max injection packet size to %u: 0x%08X";
      v17 = v13;
      v18 = 14;
    }
    _os_log_impl(&dword_21A1DE000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v20, v18);
LABEL_15:

  }
LABEL_16:

}

void mt_ApplyBinaryFilters(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 2232))
  {
    *(_BYTE *)(a1 + 2232) = 0;
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    MTLoggingFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 134217984;
      v21 = v9;
      _os_log_impl(&dword_21A1DE000, v8, OS_LOG_TYPE_INFO, "Resetting Binary Filters (deviceID 0x%llX)", buf, 0xCu);
    }

    v10 = *(id *)(a1 + 2224);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v15, "reset");
          mt_UpdateMaxPacketSize(a1, v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
      }
      while (v12);
    }

  }
  kdebug_trace();
  mt_ApplyBinaryFilter(a1, 0, a2, a3, a4, 1);
}

void mt_ApplyBinaryFilter(uint64_t a1, unsigned int a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  id v11;
  void *v12;
  _QWORD v13[5];
  char v14;
  unsigned int v15;
  unsigned int v16;
  unsigned __int8 *v17;

  v17 = a3;
  v15 = a5;
  v16 = a4;
  v11 = *(id *)(a1 + 2224);
  if (objc_msgSend(v11, "count") == a2)
  {
    if ((_DWORD)a6)
      kdebug_trace();
    mt_ProcessMultitouchFrame(a1, a3, a4);
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __mt_ApplyBinaryFilter_block_invoke;
    v13[3] = &__block_descriptor_41_e14_v24__0_8I16I20l;
    v14 = a2;
    v13[4] = a1;
    objc_msgSend(v12, "filterFrame:size:maxSize:extraFrame:", &v17, &v16, &v15, v13);
    kdebug_trace();
    if (v16)
    {
      mt_ApplyBinaryFilter(a1, (a2 + 1), v17, v16, v15, a6);
    }
    else if ((_DWORD)a6)
    {
      kdebug_trace();
    }

  }
}

void mt_SetBinaryFiltersProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 133))
      mt_CachePropertiesForDevice(a1);
    MTLoggingFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v23 = a2;
      v24 = 2114;
      v25 = a3;
      v26 = 2048;
      v27 = v7;
      v8 = "Setting Binary Filters property %{public}@ = %{public}@ (deviceID 0x%llX)";
      v9 = v6;
      v10 = 32;
LABEL_6:
      _os_log_impl(&dword_21A1DE000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    MTLoggingFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v23 = a2;
      v24 = 2114;
      v25 = a3;
      v8 = "Setting Binary Filters property %{public}@ = %{public}@";
      v9 = v6;
      v10 = 22;
      goto LABEL_6;
    }
  }

  v11 = *(id *)(a1 + 2224);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "setProperty:withValue:", a2, a3);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

uint64_t MTSet16BitScalingRange(uint64_t result, unsigned int a2)
{
  if (a2 > result)
  {
    gMT16BitConversionRange = result;
    word_2550CF67A = a2;
  }
  return result;
}

__int16 *mt_Scale8BitBufferTo16BitRange(__int16 *result, int a2, int a3)
{
  uint64_t v3;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      *result = *result * a3 / 256;
      ++result;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t mt_Scale16BitRangeTo8Bits(uint64_t result, int a2, int a3, int a4, int a5)
{
  __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 *v8;

  if (a2 >= 1)
  {
    v5 = (__int16 *)(result + 134);
    v6 = 1;
    do
    {
      if (a3 >= 1)
      {
        v7 = (a3 + 1) - 1;
        v8 = v5;
        do
        {
          *v8 = ((*v8 - a4) * (65280 / (a5 - a4))) >> 8;
          ++v8;
          --v7;
        }
        while (v7);
      }
      ++v6;
      v5 += 66;
    }
    while (v6 != a2 + 1);
  }
  return result;
}

uint64_t mt_UncompressTouchpadCodecV1Force(void *a1, uint64_t a2, unint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t i;
  unsigned int v18;
  unsigned __int16 v19;
  unsigned int v20;
  unsigned int v21;
  NSObject *v22;
  _DWORD v23[2];
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  *a7 = 0;
  if (a3 > 0xF)
  {
    *a7 = 16;
    bzero(a1, 2 * a5 * a4);
    for (i = 0; i != 4; ++i)
    {
      v18 = ((3 * a5) >> 1) - 1;
      v19 = a5;
      switch((char)i)
      {
        case 0:
          v18 = (3 * a5) >> 1;
          v19 = 2 * a5 - 4;
          break;
        case 1:
          break;
        case 2:
          v19 = 0;
          LOWORD(v18) = (a5 >> 1) - 1;
          break;
        case 3:
          v18 = a5 >> 1;
          v19 = a5 - 4;
          break;
        default:
          v22 = MTLoggingFramework();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            return 3758096385;
          LOWORD(v23[0]) = 0;
          v9 = "Invalid force sensor index\n";
          v10 = v22;
          v11 = 2;
          goto LABEL_4;
      }
      v20 = *(_DWORD *)(a2 + 4 * i);
      if (a6)
      {
        v21 = (unsigned __int16)v18;
      }
      else
      {
        *((_WORD *)a1 + (unsigned __int16)v18) = v20 >> 8;
        *((_WORD *)a1 + v19 + 2) = HIWORD(v20);
        v21 = v19 + 3;
      }
      *((_WORD *)a1 + v21) = v20;
    }
    return 0;
  }
  else
  {
    v7 = a3;
    v8 = MTLoggingFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109376;
      v23[1] = v7;
      v24 = 1024;
      v25 = 16;
      v9 = "Uncompressed image buffer(%u) was too small to handle expected number of force bytes(%u)\n";
      v10 = v8;
      v11 = 14;
LABEL_4:
      _os_log_impl(&dword_21A1DE000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)v23, v11);
    }
    return 3758096385;
  }
}

uint64_t mt_UncompressTouchpadCodecV1Touch(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4, unsigned int a5)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __int16 v16;
  uint8_t buf[2];

  v9 = touchpadCodecCreate((unsigned __int16)a5, a4, 16, 0, 0);
  if (v9)
  {
    v10 = touchpadCodecDecodeImage((uint64_t)v9, a1, 2 * a5, a2, a3);
    v11 = 0;
    if (!v10)
    {
      v11 = 3758097084;
      v12 = MTLoggingFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 0;
        v13 = "Touchpad codec v1 failed to decode the provided image\n";
        v14 = (uint8_t *)&v16;
LABEL_7:
        _os_log_impl(&dword_21A1DE000, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
      }
    }
  }
  else
  {
    v11 = 3758097084;
    v12 = MTLoggingFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Touchpad codec v1 failed to create codec\n";
      v14 = buf;
      goto LABEL_7;
    }
  }
  return v11;
}

uint64_t mt_UncompressTouchpadCodecV1Image(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, unsigned int a6, int a7)
{
  uint64_t result;
  unsigned int v9;
  unsigned int v13;

  result = 3758097085;
  v9 = a5 - 2;
  if (a5 < 2)
    return 3758097090;
  if (a2 >= 2 * (unint64_t)(a6 * a5))
  {
    v13 = 0;
    result = mt_UncompressTouchpadCodecV1Force((void *)(a1 + 2 * v9 * a6), a3, a4, 2, a6, a7, &v13);
    if (!(_DWORD)result)
      return mt_UncompressTouchpadCodecV1Touch(a1, a3 + v13, a4 - v13, v9, a6);
  }
  return result;
}

double alg_InitTimeState(uint64_t a1, int a2)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 20) = 12000 / a2;
  *(_DWORD *)(a1 + 24) = 12000 / a2;
  *(_DWORD *)(a1 + 28) = ((10923 * (__int16)(12000 / a2)) >> 21) + ((10923 * (__int16)(12000 / a2)) >> 31);
  return result;
}

_DWORD *alg_UpdateTimeState(_DWORD *result, int a2, int a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v3 = result[1];
  *result = v3;
  result[1] = a2;
  v4 = result[3];
  result[3] = a3;
  result[4] = v4;
  result[2] = a2 - v3;
  if (v3 && (v5 = a3 - v4, v5 >= 3))
  {
    result[5] = 12 * v5;
    v6 = 16 * v5;
  }
  else
  {
    v7 = result[6];
    result[5] = v7 * (a2 - v3);
    v6 = v7 / 192;
  }
  result[7] = v6;
  return result;
}

uint64_t mtalg_LibraryGetTypeID()
{
  uint64_t result;

  result = __kmtalg_LibraryTypeID;
  if (!__kmtalg_LibraryTypeID)
  {
    pthread_once(&__mtalgLibraryTypeInit, (void (*)(void))__mtalgLibraryRegister);
    return __kmtalg_LibraryTypeID;
  }
  return result;
}

uint64_t __mtalgLibraryRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kmtalg_LibraryTypeID = result;
  return result;
}

uint64_t mtalg_CreateAlgLibraryForDevice(uint64_t a1, size_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t Instance;
  uint64_t v17;
  uint64_t v18;

  if (!a1)
    return 0;
  if (!__kmtalg_LibraryTypeID)
    pthread_once(&__mtalgLibraryTypeInit, (void (*)(void))__mtalgLibraryRegister);
  Instance = _CFRuntimeCreateInstance();
  v18 = Instance;
  if (Instance)
  {
    mt_InitImagerGridAndTimeState(Instance + 24, a2, a3, a4, a5, a6, a7, v17, a9, a10);
    mt_InitPathLifeCycles(v18);
  }
  return v18;
}

void mt_InitImagerGridAndTimeState(uint64_t a1, size_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  int v12;
  int v13;
  uint64_t v15;
  __int16 v16;
  char v17;
  int v19[2];

  v12 = a4;
  v13 = a2;
  memset(v19, 170, 7);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  v15 = a1 + 464;
  *(_OWORD *)(a1 + 480) = 0u;
  mt_FillDefaultMultitouchRegion(a2, a3, a5, a4, (uint64_t)v19);
  if (a7 >= 1)
    v16 = a7;
  else
    v16 = 256;
  alg_InitSurfaceGrid(a1, v12, v19, (int *)(a5 + 84), (int *)(a5 + 91), v16);
  alg_InitTimeState(v15, 60);
  if (WORD2(a10) || (_DWORD)a10 || HIWORD(a10))
  {
    *(_WORD *)(a1 + 354) = a10;
    *(_WORD *)(a1 + 352) = WORD2(a10);
    *(_WORD *)(a1 + 356) = HIWORD(a10);
    *(_WORD *)(a1 + 358) = WORD1(a10);
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  *(_BYTE *)(a1 + 459) = v17;
  if (!gMT_BE_LESS_VERBOSE)
    printf("*** %s (0x%lx) family*** (%2d cols X %2d rows)\n", *(const char **)(a1 + 32), *(unsigned int *)(a1 + 24), a3, v13);
}

size_t mt_FillDefaultMultitouchRegion(size_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v8;
  int *v9;
  int v10;
  int v11;

  v8 = result;
  if ((int)result > 64 || a2 >= 65)
  {
    result = fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Image Buffer from device (%dx%d) larger than host arrays (%dx%d)!\n", result, a2, 64, 64);
    if (v8 >= 65)
      mt_FillDefaultMultitouchRegion_cold_1();
    if (a2 >= 65)
      mt_FillDefaultMultitouchRegion_cold_2();
  }
  if (!a3)
    result = fwrite("WARNING:  No Multitouch Device image regions specified!\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v10 = *(unsigned __int8 *)(a3 + 7);
  v9 = (int *)(a3 + 7);
  if (v10 == 1)
  {
    v11 = *v9;
    *(_DWORD *)(a5 + 3) = *(int *)((char *)v9 + 3);
    *(_DWORD *)a5 = v11;
  }
  else
  {
    *(_WORD *)a5 = 1;
    *(_WORD *)(a5 + 3) = 1;
    *(_BYTE *)(a5 + 2) = v8;
    *(_BYTE *)(a5 + 5) = a2;
    *(_BYTE *)(a5 + 6) = 0;
  }
  return result;
}

uint64_t mt_ForwardPathFrame(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  MTAlg_IssueOpticalProximityCallback(a1, *(__int16 *)(a2 + 62));
  MTAlg_IssueInputDetectionStateCallback(a1, *(_DWORD *)(a2 + 68), *(__int16 *)(a2 + 62), *(__int16 *)(a2 + 66));
  MTAlg_IssueFarfieldProximityCallback(a1, *(__int16 *)(a2 + 66), *(__int16 *)(a2 + 66));
  return mt_ForwardBinaryContacts(a1, (_BYTE *)a2, a3, a4);
}

uint64_t mt_ExpandImageAndForward(uint64_t a1, __int16 *a2, uint64_t a3, uint64_t a4)
{
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;

  v8 = *(__int16 *)(a3 + 14);
  v9 = *(unsigned __int16 *)(a3 + 12);
  v10 = v9 + v8;
  v11 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    v12 = *(unsigned int *)(a3 + 4);
  }
  else if (*(_BYTE *)(a3 + 17))
  {
    if (*(_BYTE *)(a3 + 16) == 8)
    {
      mt_Scale8BitBufferTo16BitRange(a2, *(unsigned __int16 *)(a3 + 10) * *(unsigned __int16 *)(a3 + 8), (__int16)v9);
      v11 = *(_DWORD *)a3;
      v12 = 66562;
    }
    else
    {
      v11 = 0;
      if (*(_BYTE *)(a3 + 18))
        v12 = 65794;
      else
        v12 = 258;
    }
  }
  else
  {
    v11 = 0;
    v10 = 34816;
    v8 = 30720;
    v12 = 66;
  }
  mtp_ForwardDeviceImageBuffer(a1, a2, *(_WORD *)(a3 + 8), *(_WORD *)(a3 + 10), a4, v11, v12, v8, v10, 1);
  return v12;
}

void __mtalgLibraryInit(uint64_t a1)
{
  if (a1)
    bzero((void *)(a1 + 16), 0x4EF8uLL);
}

uint64_t MTDeviceGetTypeID()
{
  uint64_t result;

  result = __kMTDeviceTypeID;
  if (!__kMTDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit, (void (*)(void))__MTDeviceRegister);
    return __kMTDeviceTypeID;
  }
  return result;
}

uint64_t __MTDeviceRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kMTDeviceTypeID = result;
  return result;
}

uint64_t MTDeviceCreate(io_object_t a1)
{
  const __CFAllocator *v2;
  uint64_t Instance;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!__kMTDeviceTypeID)
    pthread_once(&__deviceTypeInit, (void (*)(void))__MTDeviceRegister);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
    {
      IOObjectRetain(a1);
      *(_DWORD *)(Instance + 16) = a1;
    }
    *(_BYTE *)(Instance + 41) = 1;
    *(_BYTE *)(Instance + 135) = 0;
    *(_BYTE *)(Instance + 114) = 0;
    *(_WORD *)(Instance + 130) = 0;
    *(_BYTE *)(Instance + 132) = 0;
    *(double *)(Instance + 144) = MTAbsoluteTimeGetCurrent();
    *(_QWORD *)(Instance + 104) = CFStringCreateWithCString(v2, "", 0x600u);
    *(_DWORD *)(Instance + 384) = 0;
    *(_QWORD *)(Instance + 392) = 0;
  }
  return Instance;
}

void *MT_ParsedMultitouchFrameRepCreate(unsigned int a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = malloc_type_malloc(0x678uLL, 0x10100404899599CuLL);
  if (v2)
  {
    v3 = malloc_type_malloc(a1, 0x9803198FuLL);
    if (v3)
    {
      v4 = v3;
      bzero(v2, 0x678uLL);
      *((_QWORD *)v2 + 5) = v4;
      *((_DWORD *)v2 + 12) = a1;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return v2;
}

void ParsedMultitouchFrameRepDestroy(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)a1[5];
    if (v2)
      free(v2);
    free(a1);
  }
}

double __MTDeviceInit(uint64_t a1)
{
  double Current;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  char **v6;
  uint64_t v7;
  double result;

  if (a1)
  {
    bzero((void *)(a1 + 16), 0x1628uLL);
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 136) = 0;
    Current = MTAbsoluteTimeGetCurrent();
    *(_OWORD *)(a1 + 220) = 0u;
    *(double *)(a1 + 144) = Current;
    *(_DWORD *)(a1 + 160) = 0;
    *(_QWORD *)(a1 + 168) = 0;
    *(_BYTE *)(a1 + 176) = 0;
    *(_DWORD *)(a1 + 180) = 0;
    *(_QWORD *)(a1 + 184) = 0;
    *(_QWORD *)(a1 + 212) = 0xFF000000FFLL;
    *(_QWORD *)(a1 + 192) = 0xFFFFFFFF00000000;
    *(_QWORD *)(a1 + 200) = 0;
    *(_DWORD *)(a1 + 207) = 0;
    *(_OWORD *)(a1 + 236) = 0u;
    *(_OWORD *)(a1 + 252) = 0u;
    *(_OWORD *)(a1 + 268) = 0u;
    *(_OWORD *)(a1 + 284) = 0u;
    *(_OWORD *)(a1 + 300) = 0u;
    *(_OWORD *)(a1 + 316) = 0u;
    *(_OWORD *)(a1 + 332) = 0u;
    *(_WORD *)(a1 + 133) = 1;
    *(_OWORD *)(a1 + 344) = 0u;
    bzero((void *)(a1 + 400), 0x650uLL);
    v3 = 0;
    do
    {
      *(_DWORD *)(a1 + 400 + 4 * v3 + 1500) = 0;
      v4 = a1 + 400 + 8 * v3;
      *(_QWORD *)(v4 + 1560) = 0;
      v5 = malloc_type_malloc(0xFAuLL, 0xB32C598BuLL);
      *(_QWORD *)(v4 + 1560) = v5;
      if (v5)
      {
        v6 = (char **)(v4 + 1560);
        *(_OWORD *)((char *)v5 + 234) = 0u;
        v5[13] = 0u;
        v5[14] = 0u;
        v5[11] = 0u;
        v5[12] = 0u;
        v5[9] = 0u;
        v5[10] = 0u;
        v5[7] = 0u;
        v5[8] = 0u;
        v5[5] = 0u;
        v5[6] = 0u;
        v5[3] = 0u;
        v5[4] = 0u;
        v5[1] = 0u;
        v5[2] = 0u;
        *v5 = 0u;
        v7 = v3 + 1;
        snprintf(*v6, 8uLL, "Channel %d", v3 + 1);
      }
      else
      {
        v7 = v3 + 1;
      }
      *(_QWORD *)(a1 + 8 * v3 + 1920) = 0x40C000003F800000;
      v3 = v7;
    }
    while (v7 != 5);
    *(_BYTE *)(a1 + 2000) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 2048) = 0u;
    *(_QWORD *)(a1 + 2016) = 0;
    *(_QWORD *)(a1 + 2032) = 0;
    *(_QWORD *)(a1 + 2024) = 0;
    *(_BYTE *)(a1 + 2040) = 0;
    *(_DWORD *)(a1 + 2064) = 0;
    *(_BYTE *)(a1 + 2068) = 0;
    *(_DWORD *)(a1 + 2092) = 0;
    *(_BYTE *)(a1 + 2096) = 0;
    *(_QWORD *)(a1 + 2104) = 0;
    *(_DWORD *)(a1 + 2112) = -1;
    *(_WORD *)(a1 + 2153) = 0;
    *(_OWORD *)(a1 + 2120) = 0u;
    *(_OWORD *)(a1 + 2136) = 0u;
  }
  return result;
}

void __MTDeviceRelease(uint64_t a1)
{
  io_object_t v2;
  uint64_t v3;
  const void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  __CFRunLoopSource *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;

  if (a1)
  {
    MTDeviceStop(a1);
    v2 = *(_DWORD *)(a1 + 16);
    if (v2)
    {
      IOObjectRelease(v2);
      *(_DWORD *)(a1 + 16) = 0;
    }
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      MTActuatorSetMTDevice(v3, 0);
      CFRelease(*(CFTypeRef *)(a1 + 32));
      *(_QWORD *)(a1 + 32) = 0;
    }
    v4 = *(const void **)(a1 + 104);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 104) = 0;
    }
    v5 = *(_QWORD **)(a1 + 392);
    if (v5)
    {
      ParsedMultitouchFrameRepDestroy(v5);
      *(_QWORD *)(a1 + 392) = 0;
    }
    v6 = 0;
    v7 = a1 + 1960;
    do
    {
      v8 = *(void **)(v7 + v6);
      if (v8)
      {
        free(v8);
        *(_QWORD *)(v7 + v6) = 0;
      }
      v6 += 8;
    }
    while (v6 != 40);
    v9 = *(const void **)(a1 + 152);
    if (v9)
    {
      CFRelease(v9);
      *(_QWORD *)(a1 + 152) = 0;
    }
    v10 = *(const void **)(a1 + 2224);
    if (v10)
    {
      CFRelease(v10);
      *(_QWORD *)(a1 + 2224) = 0;
    }
    v11 = *(const void **)(a1 + 2016);
    if (v11)
    {
      CFRelease(v11);
      *(_QWORD *)(a1 + 2016) = 0;
    }
    v12 = *(__CFRunLoopSource **)(a1 + 2032);
    if (v12)
    {
      CFRunLoopSourceInvalidate(v12);
      CFRelease(*(CFTypeRef *)(a1 + 2032));
      *(_QWORD *)(a1 + 2032) = 0;
    }
    v13 = *(NSObject **)(a1 + 2104);
    if (v13)
    {
      dispatch_release(v13);
      *(_QWORD *)(a1 + 2104) = 0;
    }
    v14 = 0;
    v15 = a1 + 5376;
    do
    {
      MTImageInfoRelease(*(void **)(v15 + v14));
      *(_QWORD *)(v15 + v14) = 0;
      v14 += 8;
    }
    while (v14 != 256);
    if (*(_QWORD *)(a1 + 5664))
    {
      work_interval_destroy();
      *(_QWORD *)(a1 + 5664) = 0;
    }
    v16 = *(const void **)(a1 + 5680);
    if (v16)
    {
      CFRelease(v16);
      *(_QWORD *)(a1 + 5680) = 0;
    }
  }
}

uint64_t mtalg_ProcessPathFrame(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
  {
    alg_UpdateTimeState((_DWORD *)(result + 488), a3, a4);
    return mt_ForwardPathFrame(a1, a2, a3, a4);
  }
  return result;
}

uint64_t mtalg_ProcessImageFrame(uint64_t a1, uint64_t a2, __int16 *a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v11;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
  {
    v11 = result + 488;
    alg_UpdateTimeState((_DWORD *)(result + 488), a4, a5);
    if (*(_BYTE *)(a2 + 11) && *(_BYTE *)(a2 + 12))
      mt_ForwardPathFrame(a1, a2, a4, a5);
    else
      MTAlg_IssueOpticalProximityCallback(a1, *(__int16 *)(a2 + 62));
    return mt_ExpandImageAndForward(a1, a3, a2 + 20, v11);
  }
  return result;
}

float Ypos2Erow_float(int a1, uint64_t a2)
{
  return (float)(*(unsigned __int8 *)(a2 + 2) - 1)
       - (float)((float)((float)a1 * (float)*(__int16 *)(a2 + 52)) / (float)(100 * *(_DWORD *)(a2 + 48)));
}

float Xpos2Ecol_float(int a1, uint64_t a2)
{
  return (float)(*(unsigned __int8 *)(a2 + 5) - 1)
       - (float)((float)((float)a1 * (float)*(__int16 *)(a2 + 60)) / (float)(100 * *(_DWORD *)(a2 + 56)));
}

uint64_t Ypos2Brow(int a1, uint64_t a2)
{
  return (*(__int16 *)(a2 + 52) * a1 / (100 * *(_DWORD *)(a2 + 48)) + 1);
}

uint64_t Xpos2Bcol(int a1, uint64_t a2)
{
  return (*(__int16 *)(a2 + 60) * a1 / (100 * *(_DWORD *)(a2 + 56)) + 1);
}

uint64_t alg_ClipPosPointToScreenEdge(int a1, unsigned __int16 *a2)
{
  unsigned __int16 v2;
  int v3;

  v2 = a1;
  v3 = a1 >> 16;
  if ((__int16)a1 >= (__int16)*a2)
    v2 = *a2;
  if ((__int16)a2[1] > (__int16)a1)
    v2 = a2[1];
  if (v3 >= (__int16)a2[2])
    LOWORD(v3) = a2[2];
  if ((__int16)a2[3] > a1 >> 16)
    LOWORD(v3) = a2[3];
  return v2 | ((unsigned __int16)v3 << 16);
}

uint64_t alg_DeriveExtrapolationGain(int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 89;
  if ((a1 - 96) >= 8)
  {
    v3 = a1 - 112;
    if (v3 > 0x30 || ((1 << v3) & 0x1000000030001) == 0)
      return 51;
  }
  return result;
}

uint64_t alg_ComputeMinDistToSideElectrodes(uint64_t a1, __int16 a2, int a3)
{
  int v3;

  if ((__int16)(a2 - *(_WORD *)(a1 + 362)) >= (__int16)(*(_WORD *)(a1 + 360) - a2))
    v3 = (__int16)(*(_WORD *)(a1 + 360) - a2);
  else
    v3 = (__int16)(a2 - *(_WORD *)(a1 + 362));
  if (v3 < 0 && a3)
    v3 = ((__int16)v3 << 8) / *(_DWORD *)(a1 + 64);
  return (__int16)v3;
}

uint64_t alg_ComputeMinDistToTopBottomElectrodes(uint64_t a1, int a2, int a3)
{
  int v3;

  if ((__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2)) >= (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366)))
    v3 = (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366));
  else
    v3 = (__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2));
  if (v3 < 0 && a3)
    v3 = ((__int16)v3 << 8) / *(_DWORD *)(a1 + 68);
  return (__int16)v3;
}

uint64_t alg_FindSwipeEdgeType(uint64_t a1, int a2, int a3, int a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v9;
  int v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;

  if ((__int16)(a2 - *(_WORD *)(a1 + 362)) >= (__int16)(*(_WORD *)(a1 + 360) - a2))
    v4 = (__int16)(*(_WORD *)(a1 + 360) - a2);
  else
    v4 = (__int16)(a2 - *(_WORD *)(a1 + 362));
  if (v4 < 0)
    v4 = ((__int16)v4 << 8) / *(_DWORD *)(a1 + 64);
  v5 = (__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2));
  if (v5 >= (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366)))
    v5 = (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366));
  if (v5 < 0)
    v5 = ((__int16)v5 << 8) / *(_DWORD *)(a1 + 68);
  if ((__int16)v4 >= (__int16)v5)
  {
    v9 = (a2 >> 16) - *(__int16 *)(a1 + 366);
    v10 = *(__int16 *)(a1 + 364) - (a2 >> 16);
    if (a4 < 1 || v9 >= v10)
    {
      if (v9 > v10)
      {
        v14 = __OFSUB__(a4, 1);
        v13 = a4 - 1 < 0;
      }
      else
      {
        v14 = 0;
        v13 = 0;
      }
      if (v13 != v14)
        return 2;
      else
        return 4;
    }
    else
    {
      return 3;
    }
  }
  else
  {
    v6 = (__int16)a2 - *(__int16 *)(a1 + 362);
    v7 = *(__int16 *)(a1 + 360) - (__int16)a2;
    if (a3 < 1 || v6 >= v7)
    {
      if (v6 > v7)
      {
        v12 = __OFSUB__(a3, 1);
        v11 = a3 - 1 < 0;
      }
      else
      {
        v12 = 0;
        v11 = 0;
      }
      if (v11 != v12)
        return 1;
      else
        return 4;
    }
    else
    {
      return 0;
    }
  }
}

uint64_t alg_ComputeMinDistToEdges(uint64_t a1, int a2, __int16 a3)
{
  int v3;
  int v4;

  if ((a3 & 0xC) == 0)
  {
    LOWORD(v3) = 0x7FFF;
    goto LABEL_11;
  }
  if ((__int16)(a2 - *(_WORD *)(a1 + 362)) >= (__int16)(*(_WORD *)(a1 + 360) - a2))
    v3 = (__int16)(*(_WORD *)(a1 + 360) - a2);
  else
    v3 = (__int16)(a2 - *(_WORD *)(a1 + 362));
  if (v3 < 0)
  {
    v3 = ((__int16)v3 << 8) / *(_DWORD *)(a1 + 64);
    if ((a3 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((a3 & 1) != 0)
LABEL_10:
    LOWORD(v3) = *(_WORD *)(a1 + 346) + v3;
LABEL_11:
  if ((a3 & 0x30) != 0)
  {
    if ((__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2)) >= (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366)))
      v4 = (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366));
    else
      v4 = (__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2));
    if (v4 < 0)
    {
      v4 = ((__int16)v4 << 8) / *(_DWORD *)(a1 + 68);
      if ((a3 & 1) == 0)
      {
LABEL_17:
        if ((a3 & 0x100) == 0)
          goto LABEL_18;
LABEL_21:
        v3 = (int)hypot((double)(__int16)v3, (double)(__int16)v4);
        return (__int16)v3;
      }
    }
    else if ((a3 & 1) == 0)
    {
      goto LABEL_17;
    }
    LOWORD(v4) = *(_WORD *)(a1 + 348) + v4;
    if ((a3 & 0x100) != 0)
      goto LABEL_21;
  }
  else
  {
    LOWORD(v4) = 0x7FFF;
    if ((a3 & 0x100) != 0)
      goto LABEL_21;
  }
LABEL_18:
  if ((__int16)v3 >= (__int16)v4)
    LOWORD(v3) = v4;
  return (__int16)v3;
}

uint64_t alg_InitRowColXYConvert(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t i;
  uint64_t v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  uint64_t result;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  __int16 v25;

  v2 = 0;
  v3 = 100 * *(_DWORD *)(a1 + 48);
  v4 = *(__int16 *)(a1 + 52);
  v5 = v3 * ~*(_DWORD *)(a1 + 72);
  do
  {
    *(_WORD *)(a1 + 212 + v2) = v5 / v4;
    v5 += v3;
    v2 += 2;
  }
  while (v2 != 132);
  v6 = 100 * *(_DWORD *)(a1 + 56);
  v7 = *(__int16 *)(a1 + 60);
  v8 = v6 * ~*(_DWORD *)(a1 + 76);
  for (i = 80; i != 212; i += 2)
  {
    *(_WORD *)(a1 + i) = v8 / v7;
    v8 += v6;
  }
  v10 = *(unsigned __int8 *)(a1 + 5);
  v25 = *(_WORD *)(a1 + 2 * *(unsigned __int8 *)(a1 + 2) + 212);
  *(_WORD *)(a1 + 364) = v25;
  v11 = *(_WORD *)(a1 + 214);
  *(_WORD *)(a1 + 366) = v11;
  v12 = *(_WORD *)(a1 + 2 * v10 + 80);
  *(_WORD *)(a1 + 360) = v12;
  v13 = *(_WORD *)(a1 + 82);
  *(_WORD *)(a1 + 362) = v13;
  v14 = *(_DWORD *)(a1 + 24);
  v15 = v14 - 87;
  if ((v14 - 87) >= 6)
  {
    v17 = 373;
    v16 = 343;
    switch(v14)
    {
      case 20:
      case 21:
        v16 = 384;
        v17 = 384;
        break;
      case 23:
        break;
      case 25:
        v17 = 340;
        v16 = 448;
        break;
      case 26:
        v17 = 330;
        break;
      default:
        v16 = 256;
        v17 = 256;
        break;
    }
  }
  else
  {
    v16 = 512;
    v17 = 512;
  }
  v18 = v6 / v7;
  result = alg_DeriveExtrapolationGain(v14);
  if (v15 >= 6)
    v20 = 384;
  else
    v20 = 424;
  v21 = (((_DWORD)result * v20) & 0xFF00u) / (((unsigned __int16)(result * v20) >> 8) | 0x100u);
  v22 = v18 * v21;
  *(_DWORD *)(a1 + 64) = v16;
  *(_DWORD *)(a1 + 68) = v17;
  v23 = (__int16)((int)(v3 / v4 * v21) / 256) * v17 / 256;
  *(_WORD *)(a1 + 348) = v23;
  *(_WORD *)(a1 + 350) = v23;
  v24 = (__int16)(v22 / 256) * v16 / 256;
  *(_WORD *)(a1 + 346) = v24;
  *(_WORD *)(a1 + 344) = v24;
  if (!*(_BYTE *)(a1 + 459))
  {
    *(_WORD *)(a1 + 356) = v25 + v23;
    *(_WORD *)(a1 + 358) = v11 - v23;
    *(_WORD *)(a1 + 352) = v12 + v24;
    *(_WORD *)(a1 + 354) = v13 - v24;
  }
  return result;
}

uint64_t alg_InitZephyrPlatformSpecifics(uint64_t result)
{
  int v1;
  BOOL v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  int v10;
  __int16 v11;
  __int16 v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;

  v1 = *(_DWORD *)(result + 24);
  switch(v1)
  {
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
      *(_QWORD *)(result + 32) = "Recognized";
      *(_BYTE *)(result + 457) = 1;
      *(_QWORD *)(result + 40) = 0x1D4C00001388;
      *(_DWORD *)(result + 48) = 36;
      *(_WORD *)(result + 52) = 7;
      *(_DWORD *)(result + 56) = 56;
      v12 = 11;
      goto LABEL_52;
    case 85:
    case 86:
    case 93:
    case 94:
    case 95:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
LABEL_20:
      *(_BYTE *)(result + 457) = 1;
      *(_QWORD *)(result + 40) = 0x1D4C00001388;
      *(_DWORD *)(result + 48) = 36;
      *(_WORD *)(result + 52) = 7;
      *(_DWORD *)(result + 56) = 56;
      *(_WORD *)(result + 60) = 11;
      *(_QWORD *)(result + 32) = "Recognized";
      return result;
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
      *(_QWORD *)(result + 32) = "Recognized";
      *(_BYTE *)(result + 457) = 1;
      v5 = v1 - 89;
      if ((v1 - 89) > 3)
      {
        v11 = 150;
        v10 = 749;
        LOWORD(v9) = 92;
        v8 = 409;
        v7 = 8900;
        v6 = 5000;
      }
      else
      {
        v6 = dword_21A1FCE50[v5];
        v7 = dword_21A1FCE60[v5];
        v8 = dword_21A1FCE70[v5];
        v9 = 0xA0064000A0064uLL >> (16 * v5);
        v10 = dword_21A1FCE80[v5];
        v11 = 25;
      }
      *(_DWORD *)(result + 40) = v6;
      *(_DWORD *)(result + 44) = v7;
      *(_DWORD *)(result + 48) = v8;
      *(_WORD *)(result + 52) = v9;
      *(_DWORD *)(result + 56) = v10;
      *(_WORD *)(result + 60) = v11;
      return result;
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 128:
    case 129:
LABEL_2:
      *(_QWORD *)(result + 32) = "Recognized";
      v2 = (v1 - 96) < 8 || v1 == 160;
      *(_BYTE *)(result + 457) = v2;
      *(_BYTE *)(result + 458) = 1;
      if (v1 <= 127)
      {
        v3 = 7600;
        switch(v1)
        {
          case 'a':
            v4 = 0x12DE00002742;
            goto LABEL_36;
          case 'b':
          case 'c':
          case 'e':
            goto LABEL_43;
          case 'd':
            *(_QWORD *)(result + 40) = 0x186A00002904;
            v15 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                    - 1
                                    + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
            *(_DWORD *)(result + 72) = 0;
            *(_DWORD *)(result + 76) = v15;
LABEL_46:
            LOWORD(v1) = 10;
            v24 = 57;
LABEL_47:
            *(_DWORD *)(result + 48) = v24;
            *(_WORD *)(result + 52) = v1;
            goto LABEL_48;
          case 'f':
            *(_QWORD *)(result + 40) = 0x1A7F00002BA2;
            v16 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                    - 1
                                    + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
            *(_DWORD *)(result + 72) = 0;
            *(_DWORD *)(result + 76) = v16;
LABEL_49:
            *(_DWORD *)(result + 48) = 539;
            *(_WORD *)(result + 52) = 100;
            goto LABEL_50;
          case 'g':
            *(_QWORD *)(result + 40) = 0x1DB000002904;
            v17 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                    - 1
                                    + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
            *(_DWORD *)(result + 72) = 0;
            *(_DWORD *)(result + 76) = v17;
LABEL_44:
            *(_DWORD *)(result + 48) = 60;
            *(_WORD *)(result + 52) = 10;
            goto LABEL_45;
          default:
            goto LABEL_42;
        }
      }
      if (v1 == 128)
      {
        v4 = 0x2AF8000032C8;
LABEL_36:
        *(_QWORD *)(result + 40) = v4;
        v21 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                - 1
                                + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
        *(_DWORD *)(result + 72) = 0;
        *(_DWORD *)(result + 76) = v21;
LABEL_37:
        *(_DWORD *)(result + 48) = 242;
        *(_WORD *)(result + 52) = 47;
        if (v1 > 128)
        {
          v12 = 100;
          v25 = 513;
        }
        else if ((v1 - 99) < 2)
        {
LABEL_48:
          v12 = 100;
          v25 = 501;
        }
        else if (v1 == 102)
        {
LABEL_50:
          v12 = 100;
          v25 = 493;
        }
        else
        {
LABEL_45:
          v12 = 41;
          v25 = 212;
        }
        goto LABEL_51;
      }
      if (v1 == 129)
      {
        v4 = 0x2B2000003CF0;
        goto LABEL_36;
      }
      if (v1 != 160)
      {
LABEL_42:
        v3 = 6300;
LABEL_43:
        *(_DWORD *)(result + 40) = 10500;
        *(_DWORD *)(result + 44) = v3;
        v22 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                - 1
                                + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
        *(_DWORD *)(result + 72) = 0;
        *(_DWORD *)(result + 76) = v22;
        v23 = v1 - 99;
        v1 = 8;
        v24 = 47;
        switch(v23)
        {
          case 0:
            goto LABEL_47;
          case 1:
            goto LABEL_46;
          case 2:
          case 4:
            goto LABEL_44;
          case 3:
            goto LABEL_49;
          default:
            goto LABEL_37;
        }
      }
      *(_QWORD *)(result + 40) = 0xE3800000D84;
      v13 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                              - 1
                              + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
      *(_DWORD *)(result + 72) = 0;
      *(_DWORD *)(result + 76) = v13;
      *(_DWORD *)(result + 48) = 44;
      *(_WORD *)(result + 52) = 10;
      v12 = 10;
      v25 = 49;
LABEL_51:
      *(_DWORD *)(result + 56) = v25;
LABEL_52:
      *(_WORD *)(result + 60) = v12;
      return result;
    case 112:
      *(_QWORD *)(result + 32) = "Recognized";
      *(_WORD *)(result + 457) = 257;
      *(_QWORD *)(result + 40) = 0x236000001420;
      v14 = *(unsigned __int8 *)(result + 5) - 1;
      *(_DWORD *)(result + 72) = 0;
      *(_DWORD *)(result + 76) = (unsigned __int16)((v14 + ((unsigned __int16)(v14 & 0x8000) >> 15)) >> 1);
      *(_DWORD *)(result + 48) = 242;
      *(_WORD *)(result + 52) = 47;
      *(_DWORD *)(result + 56) = 212;
      v12 = 41;
      goto LABEL_52;
    default:
      switch(v1)
      {
        case 17:
          *(_QWORD *)(result + 32) = "Recognized";
          *(_QWORD *)(result + 40) = 0x399900004CCCLL;
          goto LABEL_26;
        case 18:
          *(_QWORD *)(result + 32) = "Recognized";
          v18 = *(unsigned __int8 *)(result + 5) - 1 + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15);
          v19 = *(unsigned __int8 *)(result + 2) - 1;
          *(_QWORD *)(result + 40) = 0x69780000A7F8;
          *(_DWORD *)(result + 72) = (unsigned __int16)((v19 + ((unsigned __int16)(v19 & 0x8000) >> 15)) >> 1);
          *(_DWORD *)(result + 76) = (unsigned __int16)(v18 >> 1);
LABEL_26:
          *(_DWORD *)(result + 48) = 139;
          *(_WORD *)(result + 52) = 28;
          *(_DWORD *)(result + 56) = 104;
          v12 = 21;
          goto LABEL_52;
        case 19:
          *(_QWORD *)(result + 32) = "Recognized";
          v20 = 0x4CCC00003999;
          goto LABEL_30;
        case 20:
          *(_QWORD *)(result + 32) = "Recognized";
          *(_QWORD *)(result + 40) = 0x3E6600002ECCLL;
          *(_DWORD *)(result + 48) = 126;
          *(_WORD *)(result + 52) = 25;
          *(_DWORD *)(result + 56) = 91;
          v12 = 18;
          goto LABEL_52;
        case 21:
          *(_QWORD *)(result + 32) = "Recognized";
          v20 = 0x4CC900003999;
LABEL_30:
          *(_QWORD *)(result + 40) = v20;
          *(_DWORD *)(result + 48) = 104;
          *(_WORD *)(result + 52) = 21;
          *(_DWORD *)(result + 56) = 139;
          v12 = 28;
          break;
        case 22:
        case 24:
          goto LABEL_20;
        case 23:
          *(_QWORD *)(result + 32) = "Recognized";
          *(_QWORD *)(result + 40) = 0x667300004CCCLL;
          *(_DWORD *)(result + 48) = 4127;
          v12 = 1000;
          *(_WORD *)(result + 52) = 1000;
          v25 = 4121;
          goto LABEL_51;
        case 25:
          *(_QWORD *)(result + 32) = "Recognized";
          *(_QWORD *)(result + 40) = 0x4CCA00003998;
          *(_DWORD *)(result + 48) = 41298;
          v12 = 10000;
          *(_WORD *)(result + 52) = 10000;
          v25 = 41196;
          goto LABEL_51;
        case 26:
          *(_QWORD *)(result + 32) = "Recognized";
          *(_QWORD *)(result + 40) = 0x3E6600002ECCLL;
          *(_DWORD *)(result + 48) = 40320;
          v12 = 10000;
          *(_WORD *)(result + 52) = 10000;
          v25 = 40450;
          goto LABEL_51;
        default:
          if (v1 != 160)
            goto LABEL_20;
          goto LABEL_2;
      }
      goto LABEL_52;
  }
}

uint64_t alg_InitGridPitchAndEdgeOptions(uint64_t a1)
{
  int v1;
  __int16 v2;
  unsigned int v3;
  BOOL v4;
  char v5;

  *(_WORD *)(a1 + 368) = 413;
  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 - 19) > 7)
    v2 = 9;
  else
    v2 = word_21A1FCE90[v1 - 19];
  *(_WORD *)(a1 + 370) = v2;
  *(_BYTE *)(a1 + 455) = *(_BYTE *)(a1 + 458);
  *(_BYTE *)(a1 + 454) = v1 == 112;
  *(_BYTE *)(a1 + 456) = ((v1 - 87) < 0x1A) & (0x200003Fu >> (v1 - 87));
  *(_BYTE *)(a1 + 453) = (v1 - 87) < 6;
  v3 = v1 - 27;
  if (*(_BYTE *)(a1 + 457))
    v4 = 1;
  else
    v4 = v3 >= 0xFFFFFFFC;
  v5 = !v4;
  *(_BYTE *)(a1 + 452) = v5;
  return alg_InitRowColXYConvert(a1);
}

uint64_t alg_InitPathTrackingParams(uint64_t result, int a2, int a3)
{
  unsigned int v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  int v7;
  unsigned int v8;
  __int16 v9;

  v3 = a2 & 0xFFFFFFFE;
  if ((a2 & 0xFFFFFFFE) == 0x80)
    v4 = 64;
  else
    v4 = 23;
  if (v3 == 128)
    v5 = 38;
  else
    v5 = 12;
  *(_WORD *)result = v4;
  *(_WORD *)(result + 2) = v5;
  *(_QWORD *)(result + 4) = 0x1E007900790099;
  *(_WORD *)(result + 12) = 40;
  if (a2 == 112)
    v6 = 9;
  else
    v6 = 12;
  *(_WORD *)(result + 16) = v6;
  if (a2 == 112)
    v7 = 399;
  else
    v7 = 1536;
  *(_DWORD *)(result + 20) = v7;
  *(_DWORD *)(result + 24) = 179;
  *(_WORD *)(result + 28) = 1;
  if (a3)
  {
    *(_WORD *)(result + 16) = 12;
    *(_QWORD *)(result + 20) = 563;
  }
  if (a2 == 128)
  {
    *(_QWORD *)(result + 32) = 0x258000F00000082;
    *(_WORD *)(result + 40) = 430;
    *(_BYTE *)(result + 43) = 0;
    *(_WORD *)(result + 6) = 217;
    return result;
  }
  *(_QWORD *)(result + 32) = 0x258000F00000066;
  *(_WORD *)(result + 40) = 430;
  v8 = a2 - 23;
  if ((a2 - 23) > 3)
  {
    *(_BYTE *)(result + 43) = 0;
    if (a2 == 112)
    {
      *(_DWORD *)(result + 4) = 12058841;
      *(_WORD *)(result + 40) = 440;
      *(_DWORD *)(result + 36) = 40632420;
      return result;
    }
  }
  else
  {
    *(_BYTE *)(result + 43) = 1;
  }
  if ((a2 - 128) <= 0x20 && ((1 << (a2 + 0x80)) & 0x100000003) != 0)
  {
    if (a2 == 129)
      v9 = 140;
    else
      v9 = 217;
    if (a2 == 160)
      v9 = 102;
    *(_WORD *)(result + 6) = v9;
LABEL_29:
    if (v8 >= 4)
      return result;
    goto LABEL_30;
  }
  if (v3 == 20)
  {
    *(_DWORD *)(result + 38) = 28181065;
    goto LABEL_29;
  }
  if (v8 > 3)
    return result;
LABEL_30:
  *(_WORD *)(result + 4) = 184;
  *(_DWORD *)(result + 38) = 26214900;
  return result;
}

uint64_t alg_InitSurfaceGrid(uint64_t a1, int a2, int *a3, int *a4, int *a5, __int16 a6)
{
  int v7;
  int v8;
  int v9;

  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 24) = a2;
  if (a3)
  {
    v7 = *a3;
    *(_DWORD *)(a1 + 3) = *(int *)((char *)a3 + 3);
    *(_DWORD *)a1 = v7;
  }
  if (a4)
  {
    v8 = *a4;
    *(_DWORD *)(a1 + 10) = *(int *)((char *)a4 + 3);
    *(_DWORD *)(a1 + 7) = v8;
  }
  if (a5)
  {
    v9 = *a5;
    *(_DWORD *)(a1 + 17) = *(int *)((char *)a5 + 3);
    *(_DWORD *)(a1 + 14) = v9;
  }
  *(_WORD *)(a1 + 386) = a6;
  *(_WORD *)(a1 + 392) = a6;
  *(_WORD *)(a1 + 398) = a6;
  *(_WORD *)(a1 + 404) = a6;
  *(_WORD *)(a1 + 380) = a6;
  alg_InitZephyrPlatformSpecifics(a1);
  alg_InitGridPitchAndEdgeOptions(a1);
  return alg_InitPathTrackingParams(a1 + 408, *(_DWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 458));
}

uint64_t MTDeviceGetReport(uint64_t a1, int a2, void *a3, unsigned int a4, _DWORD *a5)
{
  if (!a1)
    return 3758097090;
  if (*(_DWORD *)(a1 + 212))
    return mt_DeviceGetReportViaDriver(a1, a2, a3, a4, a5);
  return mt_DeviceGetReportViaDriverLegacyUSB(a1, a2, a3, a4, a5);
}

uint64_t MTDeviceSetZephyrParameter(uint64_t a1, int a2, char a3)
{
  char v4;

  v4 = a3;
  return MTDeviceSetReport(a1, a2, (uint64_t)&v4, 1);
}

uint64_t MTDeviceGetCriticalErrors(uint64_t a1, _DWORD *a2)
{
  uint64_t Report;
  uint64_t v6;

  Report = 3758097090;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      Report = MTDeviceGetReport(a1, 127, (char *)&v6 + 4, 4u, &v6);
      if (!(_DWORD)Report && (_DWORD)v6 == 4)
        *a2 = MTSwapInt32DeviceToHost(a1, HIDWORD(v6));
    }
  }
  return Report;
}

uint64_t MTDeviceGetOpenRows(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  int v6;
  int v7;

  v2 = 3758097095;
  if (!a2)
    return 3758097090;
  if (MTDeviceHasExpectedVersion(a1))
  {
    v7 = -1431655766;
    if (!mt_DeviceGetInt32Property(a1, CFSTR("OpenRowsReportID"), &v7))
    {
      v6 = 0;
      *a2 = 0;
      return MTDeviceGetReport(a1, v7, a2, 8u, &v6);
    }
  }
  return v2;
}

uint64_t MTActuatorGetReport(uint64_t a1, char a2, void *a3, int a4, _DWORD *a5)
{
  if (a1)
    return mt_ActuatorGetReportViaDriver(a1, a2, a3, a4, a5);
  else
    return 3758097090;
}

uint64_t MTActuatorSetReport(uint64_t a1, char a2, uint64_t a3, signed int a4)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    if (a4 <= 512)
      return mt_ActuatorSetReportViaDriver(a1, a2, a3, a4);
    else
      return 3758097095;
  }
  return result;
}

uint64_t MTActuatorSetWaveform(uint64_t a1, char a2, uint64_t a3, signed int a4)
{
  uint64_t v8;

  v8 = 3758097090;
  kdebug_trace();
  if (!a1)
    return v8;
  if (a4 > 512)
    return 3758097095;
  return mt_ActuatorSetWaveformViaDriver(a1, a2, a3, a4);
}

uint64_t MTDeviceSetHostOperationState(uint64_t a1, char a2)
{
  char v3;

  v3 = a2;
  return MTDeviceSetReport(a1, 113, (uint64_t)&v3, 1);
}

uint64_t MTDeviceGetHostOperationState(uint64_t a1)
{
  int Report;
  unsigned __int8 v2;
  char v4;

  v4 = -86;
  Report = MTDeviceGetReport(a1, 113, &v4, 1u, 0);
  v2 = v4;
  if (Report)
    return 0;
  return v2;
}

uint64_t MTDeviceSendExternalMessage(uint64_t a1, const void *a2, __int16 a3, size_t a4, size_t a5)
{
  size_t v9;
  size_t v10;
  _WORD *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4 + 6;
  if (a5)
  {
    v10 = a5;
    if (v9 > a5)
      return 3758097121;
    MEMORY[0x24BDAC7A8]();
    v12 = (_WORD *)((char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  }
  else
  {
    MEMORY[0x24BDAC7A8]();
    v12 = (_WORD *)((char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (!v9)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v10 = v9;
  }
  memset(v12, 170, v10);
LABEL_9:
  *v12 = 595;
  v12[1] = a4;
  v12[2] = a3;
  memcpy(v12 + 3, a2, a4);
  bzero((char *)v12 + v9, v10 - v9);
  return MTDeviceSetReport(a1, 98, (uint64_t)v12, v10);
}

void mt_StopDequeueOfMultitouchDataFromDevice(uint64_t a1)
{
  __CFMachPort *v2;
  _QWORD *info;
  mach_port_t Port;
  uint64_t v5;
  ipc_space_t *v6;
  void *v7;
  CFMachPortContext v8;

  if (a1)
  {
    v2 = *(__CFMachPort **)(a1 + 2016);
    if (v2)
    {
      memset(&v8, 0, sizeof(v8));
      CFMachPortGetContext(v2, &v8);
      CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 2016));
      info = v8.info;
      if (v8.info)
      {
        Port = CFMachPortGetPort(*(CFMachPortRef *)(a1 + 2016));
        v5 = info[3];
        v6 = (ipc_space_t *)MEMORY[0x24BDAEC58];
        if (v5)
          MEMORY[0x22073CCBC](*(unsigned int *)(a1 + 20), 0, *MEMORY[0x24BDAEC58]);
        if (Port)
          mach_port_mod_refs(*v6, Port, 1u, -1);
        v7 = *(void **)(a1 + 136);
        if (v7)
        {
          free(v7);
          *(_QWORD *)(a1 + 136) = 0;
        }
        CFRelease(*(CFTypeRef *)(a1 + 2016));
        *(_QWORD *)(a1 + 2016) = 0;
        free(v8.info);
      }
    }
  }
}

uint64_t mt_DeviceGetReportViaDriverLegacyUSB(uint64_t a1, int a2, void *a3, int a4, _DWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  size_t outputStructCnt;
  char outputStruct;
  _OWORD v14[31];
  _BYTE v15[19];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 3758097101;
  *(_DWORD *)&v15[15] = -1431655766;
  outputStructCnt = 520;
  outputStruct = a2;
  *(_OWORD *)v15 = 0u;
  memset(v14, 0, sizeof(v14));
  v16 = 0;
  v9 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 9u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  v10 = v9;
  if ((_DWORD)v9)
  {
    printf("Error 0x%08X getting report 0x%02X with length %d\n", v9, a2, a4);
  }
  else
  {
    if (a5)
      *a5 = v16;
    memmove(a3, v14, a4);
  }
  return v10;
}

uint64_t mt_DeviceSetReportViaDriverLegacyUSB(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v8;
  size_t outputStructCnt;
  char outputStruct;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[19];
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097101;
  if (a1)
  {
    *(_DWORD *)&v43[15] = -1431655766;
    outputStructCnt = 520;
    outputStruct = a2;
    if (a4 > 0x200)
    {
      puts("Too many bytes for the report to be set");
      return 3758097128;
    }
    else
    {
      v44 = a4;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      *(_OWORD *)v43 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      __memmove_chk();
      v8 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0xAu, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
      v4 = v8;
      if ((_DWORD)v8)
        printf("Error 0x%08X setting report 0x%02X with length %d\n", v8, a2, a4);
    }
  }
  return v4;
}

uint64_t mt_DeviceGetReportViaDriver(uint64_t a1, int a2, void *a3, unsigned int a4, _DWORD *a5)
{
  io_connect_t v9;
  uint64_t v10;
  io_service_t v11;
  kern_return_t v12;
  size_t v13;
  unsigned int v14;
  mach_timespec_t waitTime;
  size_t outputStructCnt;
  io_connect_t connect;
  char outputStruct;
  _OWORD v20[31];
  _BYTE v21[19];
  _DWORD __len[3];

  *(_QWORD *)&__len[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 3758097101;
  *(_DWORD *)&v21[15] = -1431655766;
  outputStructCnt = 520;
  outputStruct = a2;
  *(_OWORD *)v21 = 0u;
  memset(v20, 0, sizeof(v20));
  __len[0] = 0;
  v9 = *(_DWORD *)(a1 + 20);
  connect = v9;
  if (v9)
  {
    LODWORD(v10) = IOConnectCallStructMethod(v9, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  }
  else
  {
    v11 = *(_DWORD *)(a1 + 16);
    waitTime = (mach_timespec_t)5;
    if (IOServiceWaitQuiet(v11, &waitTime) == -536870186)
      printf("MT Error: service still busy after %d seconds\n", waitTime.tv_sec);
    v12 = IOServiceOpen(v11, *MEMORY[0x24BDAEC58], 0, &connect);
    LODWORD(v10) = -536870212;
    if (!v12)
      LODWORD(v10) = IOConnectCallStructMethod(connect, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
    IOServiceClose(connect);
  }
  v13 = __len[0];
  v14 = -536870181;
  if (__len[0] <= a4)
    v14 = 0;
  if ((_DWORD)v10)
    v10 = v10;
  else
    v10 = v14;
  if ((_DWORD)v10)
  {
    if (!gMT_BE_LESS_VERBOSE)
      printf("Error 0x%08X getting report 0x%02X with length %d\n", v10, a2, a4);
  }
  else
  {
    if (a5)
      *a5 = __len[0];
    memmove(a3, v20, v13);
  }
  return v10;
}

uint64_t mt_ActuatorGetReportViaDriver(uint64_t a1, char a2, void *a3, int a4, _DWORD *a5)
{
  uint64_t v5;
  io_connect_t v9;
  io_service_t v10;
  mach_timespec_t waitTime;
  size_t outputStructCnt;
  io_connect_t connect;
  char outputStruct;
  _OWORD v16[31];
  _BYTE v17[19];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = 3758097084;
  if (!a1)
    return 3758097090;
  *(_DWORD *)&v17[15] = -1431655766;
  outputStructCnt = 520;
  outputStruct = a2;
  *(_OWORD *)v17 = 0u;
  memset(v16, 0, sizeof(v16));
  v18 = 0;
  v9 = *(_DWORD *)(a1 + 20);
  connect = v9;
  if (v9)
  {
    v5 = IOConnectCallStructMethod(v9, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
    if ((_DWORD)v5)
      return v5;
    goto LABEL_11;
  }
  v10 = *(_DWORD *)(a1 + 16);
  waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(v10, &waitTime) == -536870186)
    printf("MTActuator Error: service still busy after %d seconds\n", waitTime.tv_sec);
  if (!IOServiceOpen(v10, *MEMORY[0x24BDAEC58], 0, &connect))
    v5 = IOConnectCallStructMethod(connect, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  IOServiceClose(connect);
  if (!(_DWORD)v5)
  {
LABEL_11:
    if (a5)
      *a5 = v18;
    memmove(a3, v16, a4);
  }
  return v5;
}

uint64_t mt_ActuatorSetReportViaDriver(uint64_t a1, char a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  io_connect_t v6;
  io_service_t v7;
  mach_timespec_t waitTime;
  size_t outputStructCnt;
  io_connect_t connect;
  char outputStruct;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[19];
  unsigned int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  if (!a1)
    return 3758097090;
  *(_DWORD *)&v44[15] = -1431655766;
  outputStructCnt = 520;
  outputStruct = a2;
  if (a4 > 0x200)
    return 3758097128;
  v45 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  *(_OWORD *)v44 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  __memmove_chk();
  v6 = *(_DWORD *)(a1 + 20);
  connect = v6;
  if (v6)
    return IOConnectCallStructMethod(v6, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  v7 = *(_DWORD *)(a1 + 16);
  waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(v7, &waitTime) == -536870186)
    printf("MTActuator Error: service still busy after %d seconds\n", waitTime.tv_sec);
  if (!IOServiceOpen(v7, *MEMORY[0x24BDAEC58], 0, &connect))
    v4 = IOConnectCallStructMethod(connect, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  IOServiceClose(connect);
  return v4;
}

uint64_t mt_ActuatorSetWaveformViaDriver(uint64_t a1, char a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  mach_port_t v5;
  _BYTE v9[516];
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097090;
  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      bzero(v9, 0x204uLL);
      if (a4 <= 0x200)
      {
        v9[0] = a2;
        v10 = a4;
        __memcpy_chk();
        return IOConnectCallStructMethod(v5, 6u, v9, 0x208uLL, 0, 0);
      }
      else
      {
        return 3758097128;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v4;
}

uint64_t MTDeviceDispatchRelativeMouseEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchButtonEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchScrollWheelEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchMomentumScrollStartStopEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchMomentumScrollEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchKeyboardEvent()
{
  return 3758097095;
}

uint64_t MTDeviceSetPickButtonShouldSendSecondaryClick()
{
  return 3758097095;
}

uint64_t MTDeviceInjectFrame(uint64_t a1, void *__src, int a3)
{
  uint64_t v4;
  void *v7;
  kern_return_t v8;
  kern_return_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  _BYTE v25[18];
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  if (!*(_DWORD *)(a1 + 20))
  {
    v4 = 3758097101;
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 212) != 4)
  {
    v4 = 3758097095;
    goto LABEL_24;
  }
  v7 = *(void **)(a1 + 2200);
  if (!v7)
  {
    v22 = -1;
    v23 = -1;
    v8 = MEMORY[0x22073CC98]();
    if (v8)
    {
      v9 = v8;
LABEL_13:
      if (*(_BYTE *)(a1 + 133))
        mt_CachePropertiesForDevice(a1);
      v10 = MTLoggingFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v25 = v9;
        *(_WORD *)&v25[4] = 2048;
        *(_QWORD *)&v25[6] = v11;
        _os_log_impl(&dword_21A1DE000, v10, OS_LOG_TYPE_ERROR, "Inject frame kernel operation failed with error %x (deviceID 0x%llX)", buf, 0x12u);
      }
      goto LABEL_24;
    }
    *(_QWORD *)(a1 + 2200) = v23;
    v12 = v22;
    *(_QWORD *)(a1 + 2208) = v22;
    if (v12 != *(_DWORD *)(a1 + 384))
    {
      if (*(_BYTE *)(a1 + 133))
        mt_CachePropertiesForDevice(a1);
      v13 = MTLoggingFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *(unsigned int *)(a1 + 384);
        v15 = *(_QWORD *)(a1 + 2208);
        v16 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v25 = v14;
        *(_WORD *)&v25[8] = 2048;
        *(_QWORD *)&v25[10] = v15;
        v26 = 2048;
        v27 = v16;
        _os_log_impl(&dword_21A1DE000, v13, OS_LOG_TYPE_ERROR, "Expecting %lu frame injection size, but driver allocated %lu (deviceID 0x%llX)", buf, 0x20u);
      }
    }
    v7 = *(void **)(a1 + 2200);
    if (!v7)
    {
      v4 = 3758097085;
      goto LABEL_24;
    }
  }
  if (!__src)
  {
    v4 = 3758097090;
    goto LABEL_24;
  }
  if (*(_QWORD *)(a1 + 2208) >= (unint64_t)a3)
  {
    memcpy(v7, __src, a3);
    input = a3;
    outputCnt = 0;
    v9 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xBu, &input, 1u, 0, &outputCnt);
    if (!v9)
      return 0;
    goto LABEL_13;
  }
  v4 = 3758097115;
LABEL_24:
  if (*(_BYTE *)(a1 + 133))
    mt_CachePropertiesForDevice(a1);
  v17 = MTLoggingFramework();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v25 = v4;
    *(_WORD *)&v25[4] = 2048;
    *(_QWORD *)&v25[6] = v18;
    _os_log_impl(&dword_21A1DE000, v17, OS_LOG_TYPE_ERROR, "Inject frame failed with error %x (deviceID 0x%llX)", buf, 0x12u);
  }
  return v4;
}

uint64_t MTLoggingFramework()
{
  if (MTLoggingFramework_onceToken != -1)
    dispatch_once(&MTLoggingFramework_onceToken, &__block_literal_global_0);
  return MTLoggingFramework___logObj;
}

uint64_t mt_CheckForTimestampErrors(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned __int16 v4;
  uint64_t i;
  uint64_t j;
  void (*v8)(uint64_t, uint64_t, _QWORD);
  __int128 v9;
  _BYTE __b[516];
  int inputStruct;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v2 = result;
  v44 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(result + 2056 + 4 * *(unsigned __int8 *)(result + 2068));
  v4 = *(unsigned __int8 *)(result + 2068)
     + 1
     - 3 * ((21846 * (*(unsigned __int8 *)(result + 2068) + 1)) >> 16);
  *(_BYTE *)(result + 2068) = v4;
  *(_DWORD *)(result + 2056 + 4 * v4) = a2;
  if (a2)
  {
    if (v3 <= a2)
      return result;
    puts("\nERROR: timestamps out of order (time travel, eh?)!");
    printf("last == %u, curr == %u\n", v3, a2);
  }
  else
  {
    puts("\nERROR: timestamp invalid!");
  }
  printf("timestamps: (most recent timestamp is at index %d\n\t", *(unsigned __int8 *)(v2 + 2068));
  for (i = 2056; i != 2068; i += 4)
    printf("0x%08X (%ums)  ", *(_DWORD *)(v2 + i), *(_DWORD *)(v2 + i));
  puts("\n");
  if (*(_BYTE *)(v2 + 1224))
  {
    for (j = 0; j != 32; j += 8)
    {
      v8 = *(void (**)(uint64_t, uint64_t, _QWORD))(v2 + j + 1192);
      if (v8)
        v8(v2, 2, *(_QWORD *)(v2 + j + 1232));
    }
  }
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42 = v9;
  v43 = v9;
  v40 = v9;
  v41 = v9;
  v38 = v9;
  v39 = v9;
  v36 = v9;
  v37 = v9;
  v34 = v9;
  v35 = v9;
  v32 = v9;
  v33 = v9;
  v30 = v9;
  v31 = v9;
  v28 = v9;
  v29 = v9;
  v27 = v9;
  v26 = v9;
  v25 = v9;
  v24 = v9;
  v23 = v9;
  v22 = v9;
  v21 = v9;
  v20 = v9;
  v19 = v9;
  v18 = v9;
  v17 = v9;
  v16 = v9;
  v15 = v9;
  v14 = v9;
  v13 = v9;
  v12 = v9;
  memset(__b, 170, sizeof(__b));
  inputStruct = 8;
  LOBYTE(v12) = 102;
  return MTDeviceIssueDriverRequest((io_service_t *)v2, &inputStruct, __b);
}

uint64_t mt_PostNotificationEvent(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t i;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD);

  if (*(_BYTE *)(result + 1224))
  {
    v3 = result;
    for (i = 0; i != 32; i += 8)
    {
      v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + i + 1192);
      if (v5)
        result = v5(v3, a2, *(_QWORD *)(v3 + i + 1232));
    }
  }
  return result;
}

uint64_t mt_PostNotificationEventToDriver(io_service_t *a1, char a2)
{
  __int128 v4;
  _BYTE v6[516];
  int inputStruct;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v4;
  v39 = v4;
  v36 = v4;
  v37 = v4;
  v34 = v4;
  v35 = v4;
  v32 = v4;
  v33 = v4;
  v30 = v4;
  v31 = v4;
  v28 = v4;
  v29 = v4;
  v26 = v4;
  v27 = v4;
  v24 = v4;
  v25 = v4;
  v23 = v4;
  v22 = v4;
  v21 = v4;
  v20 = v4;
  v19 = v4;
  v18 = v4;
  v17 = v4;
  v16 = v4;
  v15 = v4;
  v14 = v4;
  v13 = v4;
  v12 = v4;
  v11 = v4;
  v10 = v4;
  v9 = v4;
  v8 = v4;
  memset(v6, 170, sizeof(v6));
  inputStruct = 8;
  LOBYTE(v8) = a2;
  return MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
}

BOOL mt_IsExternalMessage(uint64_t a1, int a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v2 = *(unsigned __int8 *)(a1 + 5655);
  if (!*(_BYTE *)(a1 + 5655))
    return 0;
  if (*(unsigned __int8 *)(a1 + 5648) == a2)
    return 1;
  v4 = 0;
  do
  {
    v5 = v4;
    if (v2 - 1 == v4)
      break;
    v6 = *(unsigned __int8 *)(a1 + 5649 + v4++);
  }
  while (v6 != a2);
  return v5 + 1 < v2;
}

uint64_t mt_PostExternalMessage(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t i;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  *(_QWORD *)(result + 5632) = a2;
  *(_DWORD *)(result + 5640) = a4;
  *(_WORD *)(result + 5644) = a3;
  *(_DWORD *)(result + 2240) |= 0x10u;
  if (*(_BYTE *)(result + 1584))
  {
    v7 = result;
    for (i = 0; i != 32; i += 8)
    {
      v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v7 + i + 1552);
      if (v9)
        result = v9(v7, a2, a3, a4, *(_QWORD *)(v7 + i + 1592));
    }
  }
  return result;
}

uint64_t mt_FlushInternalStateForDevice(uint64_t a1)
{
  MTAlg_IssueInputDetectionStateCallback(a1, 0, 0, 0);
  mt_PostButtonStateCallbacks(a1, 0);
  return mt_PostOffTableHeightCallbacks(a1, 0, 0, 0xFFFFFFFFLL);
}

void mt_PostLegacyFrameHeaderCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void (*v4)(uint64_t, _OWORD *, uint64_t);
  uint64_t v5;
  _OWORD v6[2];
  _OWORD v7[2];

  if (*(_BYTE *)(a1 + 1296) || (*(_BYTE *)(a1 + 2004) & 2) != 0)
  {
    memset(v7, 170, 28);
    if (*(_BYTE *)(a2 + 9))
    {
      switch(*(_BYTE *)(a2 + 15))
      {
        case 0:
        case 1:
        case 2:
          MTConvert_CompactHeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 3:
        case 4:
        case 8:
          MTConvert_CompactV3HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 5:
          MTConvert_CompactV5HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 9:
          MTConvert_CompactV9HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 0xA:
          MTConvert_CompactV10HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        default:
          return;
      }
    }
    else
    {
      switch(*(_BYTE *)(a2 + 15))
      {
        case 0:
        case 1:
        case 2:
          v7[0] = *(_OWORD *)(a2 + 80);
          *(_OWORD *)((char *)v7 + 12) = *(_OWORD *)(a2 + 92);
          goto LABEL_14;
        case 3:
          MTConvert_V3HeaderToV2Header((uint64_t *)(a2 + 80), (uint64_t)v7);
          goto LABEL_14;
        case 4:
          MTConvert_V4HeaderToV2Header(a2 + 80, (uint64_t)v7);
LABEL_14:
          if ((*(_BYTE *)(a1 + 2004) & 2) != 0)
          {
            *(_DWORD *)(a1 + 2240) |= 2u;
            *(_OWORD *)(a1 + 2272) = *(_OWORD *)((char *)v7 + 12);
            *(_OWORD *)(a1 + 2260) = v7[0];
          }
          if (*(_BYTE *)(a1 + 1296))
          {
            for (i = 0; i != 32; i += 8)
            {
              v4 = *(void (**)(uint64_t, _OWORD *, uint64_t))(a1 + i + 1264);
              if (v4)
              {
                v5 = *(_QWORD *)(a1 + i + 1304);
                v6[0] = v7[0];
                *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)((char *)v7 + 12);
                v4(a1, v6, v5);
              }
            }
          }
          break;
        default:
          return;
      }
    }
  }
}

uint64_t mt_PostFrameProcessingEntryExitEvent(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t i;
  uint64_t (*v7)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD);

  if (*(_BYTE *)(result + 1080))
  {
    v5 = result;
    for (i = 0; i != 32; i += 8)
    {
      v7 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))(v5 + i + 1048);
      if (v7)
        result = v7(v5, *(_QWORD *)(v5 + 168), a2, a3, *(_QWORD *)(v5 + i + 1088));
    }
  }
  return result;
}

uint64_t mt_PostProcessedFrameCallbacks(uint64_t result)
{
  uint64_t (*v1)(uint64_t, uint64_t, _QWORD);

  v1 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 1768);
  if (v1)
  {
    if ((*(_DWORD *)(result + 2004) & *(_DWORD *)(result + 2240)) != 0)
      return v1(result, result + 2240, *(_QWORD *)(result + 1808));
  }
  return result;
}

uint64_t MTRegisterFrameProcessingEntryExitCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a2)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 1048))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 1048) = a2;
  *(_QWORD *)(v4 + 1088) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 1080) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterFrameProcessingEntryExitCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = 0;
  v3 = a1 + 1048;
  while (*(_QWORD *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1080) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterFullFrameCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a2)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 1120))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 1120) = a2;
  *(_QWORD *)(v4 + 1160) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 1152) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterFullFrameCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = 0;
  v3 = a1 + 1120;
  while (*(_QWORD *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1152) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterNotificationEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a2)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 1192))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 1192) = a2;
  *(_QWORD *)(v4 + 1232) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 1224) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterNotificationEventCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = 0;
  v3 = a1 + 1192;
  while (*(_QWORD *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1224) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterFrameHeaderCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a2)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 1264))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 1264) = a2;
  *(_QWORD *)(v4 + 1304) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 1296) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterFrameHeaderCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = 0;
  while (1)
  {
    v3 = a1 + 8 * v2;
    if (*(_QWORD *)(v3 + 1264) == a2)
      break;
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 1264) = 0;
  *(_QWORD *)(v3 + 1304) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1296) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterExternalMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a2)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 1552))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 1552) = a2;
  *(_QWORD *)(v4 + 1592) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 1584) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterExternalMessageCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = 0;
  while (1)
  {
    v3 = a1 + 8 * v2;
    if (*(_QWORD *)(v3 + 1552) == a2)
      break;
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 1552) = 0;
  *(_QWORD *)(v3 + 1592) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1584) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterProcessedFrameCallback(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  if (!a2 || *(_QWORD *)(a1 + 1768))
    return 0;
  *(_QWORD *)(a1 + 1768) = a2;
  *(_QWORD *)(a1 + 1808) = a5;
  *(_QWORD *)(a1 + 2004) = a3;
  *(_DWORD *)(a1 + 2012) = a4;
  return 1;
}

uint64_t MTUnregisterProcessedFrameCallback(uint64_t a1)
{
  *(_QWORD *)(a1 + 1768) = 0;
  *(_QWORD *)(a1 + 1808) = 0;
  *(_DWORD *)(a1 + 2012) = 0;
  *(_QWORD *)(a1 + 2004) = 0;
  return 1;
}

double MTParse_CompactBinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  unint64_t v4;
  BOOL v5;
  int v6;
  char v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned int v11;
  double result;

  v4 = (unint64_t)a1;
  if (a1)
    v5 = a2 <= 3;
  else
    v5 = 1;
  v6 = !v5;
  if (v6 == 1)
  {
    *((_QWORD *)a3 + 10) = 0;
    v7 = *(_BYTE *)v4;
    *((_BYTE *)a3 + 80) = *(_BYTE *)v4;
    v8 = *(_BYTE *)(v4 + 1);
    *((_BYTE *)a3 + 81) = v8;
    v9 = *(_BYTE *)(v4 + 2);
    *((_BYTE *)a3 + 82) = v9;
    v10 = *(_BYTE *)(v4 + 3);
    *((_BYTE *)a3 + 83) = v10;
    LODWORD(v4) = *(_DWORD *)(v4 + 4);
    v11 = bswap32(v4);
    if (a4->var21 == 1)
      v4 = v4;
    else
      v4 = v11;
    *((_DWORD *)a3 + 21) = v4;
    *((_BYTE *)a3 + 8) = v7;
    *((_BYTE *)a3 + 72) = v9;
    *((_BYTE *)a3 + 52) = v8;
    *((_BYTE *)a3 + 54) = v10;
    *(_QWORD *)a3 = v4;
    *((_BYTE *)a3 + 9) = 1;
    *((_BYTE *)a3 + 15) = 1;
    *((_BYTE *)a3 + 16) = a4->var45 + 1;
    *(_WORD *)((char *)a3 + 37) = 1;
    *((_BYTE *)a3 + 39) = 0;
    *((_WORD *)a3 + 31) = 0;
    *((_WORD *)a3 + 33) = 0;
    *((_DWORD *)a3 + 17) = 0;
    result = -1.55737508e-207;
    *(_DWORD *)((char *)a3 + 73) = -1795162112;
  }
  return result;
}

uint64_t MTCompactBinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  int v11;
  __int16 v12;
  __int16 v13;
  int v14;
  unsigned __int8 v15;

  v3 = 0;
  if (a1 && a2 && a3 >= 0xC)
  {
    v4 = a2[1];
    v5 = a2[3];
    v6 = (4 * a2[2]) | (v5 << 10) | (v4 >> 6);
    v7 = a2[7];
    v8 = a2[6] | ((v7 & 0xF) << 8);
    v9 = a2[4];
    v10 = a2[5];
    v11 = (v7 >> 4) | (16 * a2[8]);
    v12 = a2[9];
    v13 = a2[10];
    v14 = *a2 << 18;
    v15 = a2[11];
    *(_WORD *)(a1 + 8) = v8;
    *(_WORD *)(a1 + 10) = v11;
    *(_BYTE *)(a1 + 15) = v15;
    *(_WORD *)a1 = (int)(v14 | (v4 << 26)) >> 18;
    *(_WORD *)(a1 + 2) = (__int16)(4 * v6) >> 2;
    *(_WORD *)(a1 + 4) = (__int16)((4 * v5) & 0x3C0 | (v9 << 10)) >> 4;
    *(_WORD *)(a1 + 6) = (__int16)(v9 & 0xC0 | (v10 << 8)) >> 4;
    *(_WORD *)(a1 + 12) = (v12 << 6) & 0x3000 | (v13 << 14) | (32 * (v12 & 0x3F));
    *(_BYTE *)(a1 + 14) = v13 & 0xFC;
    return 12;
  }
  return v3;
}

void MTParse_CompactBinaryPath(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  char v6;
  int v8;
  unsigned __int8 v9;
  unsigned int v10;
  int var55;
  unsigned int v12;
  unint64_t v14;
  unsigned __int8 *v15;
  int8x8_t *v16;
  uint64_t v17;
  int v18;
  BOOL v20;
  int8x8_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  unsigned int v29;
  unsigned __int16 v30;
  unint64_t v31;
  unint64_t v32;

  v6 = a2;
  MTParse_CompactBinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if (v8)
  {
    v9 = v6 - 8;
    if (v6 != 8)
    {
      v10 = *(unsigned __int8 *)(a3 + 82);
      if (*(_BYTE *)(a3 + 82))
      {
        var55 = a4->var55;
        v12 = v9 / v10;
        if ((var55 == 6 || var55 == 3) && *(_BYTE *)(a3 + 8) == 37 && v12 > 0xC)
          v12 = 12;
        v14 = 0;
        v15 = a1 + 16;
        v16 = (int8x8_t *)(a3 + 144);
        v17 = v12;
        do
        {
          v31 = 0xAAAAAAAAAAAAAAAALL;
          v32 = 0xAAAAAAAAAAAAAAAALL;
          v18 = *(unsigned __int8 *)(a3 + 8);
          if (v18 == 37 && v17 >= 0xC)
          {
            MTCompactBinaryContactUnpack((uint64_t)&v31, v15 - 8, v17);
            v25 = WORD2(v32);
            v27 = HIBYTE(v32);
            v21 = (int8x8_t)v31;
            LOWORD(v22) = v32;
            LOWORD(v23) = WORD1(v32);
            v26 = BYTE6(v32);
          }
          else
          {
            if (v18 == 36)
            {
              if (v17 >= 0x10)
                goto LABEL_18;
            }
            else if (v18 == 38 && v17 > 0xF)
            {
LABEL_18:
              v20 = a4->var21 == 1;
              v21 = vbsl_s8((int8x8_t)vcltz_s16(vshl_n_s16(vdup_n_s16(v20), 0xFuLL)), *(int8x8_t *)(v15 - 8), vrev16_s8(*(int8x8_t *)(v15 - 8)));
              v31 = (unint64_t)v21;
              v22 = bswap32(*(unsigned __int16 *)v15) >> 16;
              if (v20)
                LOWORD(v22) = *(_WORD *)v15;
              LOWORD(v32) = v22;
              v23 = *((unsigned __int16 *)v15 + 1);
              v24 = bswap32(v23) >> 16;
              if (!v20)
                LOWORD(v23) = v24;
              WORD1(v32) = v23;
              v25 = v15[4] | ((v15[5] & 0xF) << 8) & 0xFFF | (v15[5] >> 4 << 12);
              WORD2(v32) = v15[4] | ((v15[5] & 0xF) << 8) & 0xFFF | (v15[5] >> 4 << 12);
              v26 = v15[6];
              BYTE6(v32) = v15[6];
              v27 = v15[7];
              HIBYTE(v32) = v15[7];
              goto LABEL_29;
            }
            v26 = 170;
            v21 = (int8x8_t)0xAAAAAAAAAAAAAAAALL;
            LOWORD(v23) = -21846;
            LOWORD(v22) = -21846;
            v27 = 170;
            v25 = 43690;
          }
LABEL_29:
          v16[-4].i8[4] = v25 >> 12;
          v16[-4].i8[5] = v27 & 0xF;
          v16[-4].i8[6] = v27 >> 4;
          v16[-4].i8[7] = 1;
          v16[-3] = v21;
          v16[-2].i16[0] = v22;
          v16[-2].i16[1] = v23;
          v16[-2].i16[2] = v26 << 8;
          v16[-2].i16[3] = v25 & 0xFFF;
          if (v18 == 38)
          {
            v29 = bswap32(*((unsigned __int16 *)v15 + 4)) >> 16;
            if (a4->var21 == 1)
              v30 = *((_WORD *)v15 + 4);
            else
              v30 = v29;
          }
          else
          {
            v30 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, v25 & 0xFFF, (__int16)v22, (__int16)v23);
            v10 = *(unsigned __int8 *)(a3 + 82);
          }
          v16[-1].i16[0] = v30;
          v16[-1].i16[1] = v30;
          v16[-1].i32[1] = 0;
          v16->i16[0] = 0;
          v16 = (int8x8_t *)((char *)v16 + 30);
          ++v14;
          v15 += v17;
        }
        while (v14 < v10);
      }
    }
    *(_BYTE *)(a3 + 8) = 36;
  }
}

uint64_t MTCompactV3HeaderUnpack(uint64_t a1, _BYTE *a2, unsigned int a3)
{
  uint64_t v3;

  v3 = 0;
  if (a1 && a2 && a3 >= 6)
  {
    *(_BYTE *)a1 = *a2;
    *(_BYTE *)(a1 + 1) = a2[1];
    *(_BYTE *)(a1 + 2) = a2[2];
    *(_BYTE *)(a1 + 3) = a2[3] & 3;
    *(_DWORD *)(a1 + 4) = (a2[3] >> 2) | (a2[4] << 6) | (a2[5] << 14);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV5HeaderUnpack(uint64_t a1, _BYTE *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  int v7;

  v3 = 0;
  if (a1 && a2 && a3 >= 6)
  {
    *(_BYTE *)a1 = *a2;
    v4 = a2[3] & 0xC;
    v5 = a2[1] | (((v4 >> 2) & 3) << 8);
    *(_WORD *)(a1 + 2) = a2[1] | (((v4 >> 2) & 3) << 8);
    v6 = a2[3] & 0x30;
    v7 = a2[2] | (((v6 >> 4) & 3) << 8);
    *(_WORD *)(a1 + 4) = a2[2] | (((v6 >> 4) & 3) << 8);
    if (v4 >= 8)
      *(_WORD *)(a1 + 2) = v5 | 0xFC00;
    if (v6 >= 0x20)
      *(_WORD *)(a1 + 4) = v7 | 0xFC00;
    *(_BYTE *)(a1 + 6) = a2[3] & 3;
    *(_DWORD *)(a1 + 8) = (a2[3] >> 6) | (4 * a2[4]) | (a2[5] << 10);
    return 12;
  }
  return v3;
}

uint64_t MTCompactV3orV5BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  __int16 v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  __int16 v8;

  v3 = 0;
  if (a1 && a2 && a3 == 8)
  {
    v4 = *a2 | ((a2[1] & 0xF) << 8);
    *(_WORD *)a1 = v4;
    v5 = (a2[1] >> 4) | (16 * a2[2]);
    *(_WORD *)(a1 + 2) = (a2[1] >> 4) | (16 * a2[2]);
    LODWORD(v6) = a2[3];
    LODWORD(v7) = a2[4];
    v8 = a2[5] & 0x3F;
    *(_WORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 10) = (a2[5] >> 6) & 0xF3 | (4 * (a2[6] & 3));
    *(_WORD *)(a1 + 12) = (a2[6] & 0xFC) << 7;
    *(_BYTE *)(a1 + 15) = (a2[7] >> 4) & 7;
    *(_BYTE *)(a1 + 14) = a2[7] & 0xF;
    *(_BYTE *)(a1 + 16) = a2[7] >> 7;
    *(_WORD *)a1 = (__int16)(16 * v4) >> 3;
    *(_WORD *)(a1 + 2) = ((__int16)(16 * v5) >> 3) + 4095;
    *(_WORD *)(a1 + 8) = 32 * v8;
    if ((_DWORD)v6)
    {
      if (v6 > 0x31)
      {
        if (v6 > 0xA9)
          v6 = (((unint64_t)((((_DWORD)v6 << 10) - 169984) * (uint64_t)(((_DWORD)v6 << 10) - 169984)) >> 12)
              + 958464) >> 10;
        else
          LODWORD(v6) = (((_DWORD)v6 << 21) + 629145600) >> 20;
      }
      else
      {
        LODWORD(v6) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v6 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v6 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v6;
    if ((_DWORD)v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0x95)
          v7 = (((87 * ((unint64_t)((((_DWORD)v7 << 10) - 141552) * (uint64_t)(((_DWORD)v7 << 10) - 141552)) >> 10)) >> 10)
              + 807152) >> 10;
        else
          LODWORD(v7) = (((_DWORD)v7 << 21) + 524288000) >> 20;
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v7 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v7 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v7;
    return 8;
  }
  return v3;
}

double MTParse_CompactV3BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  *(_BYTE *)(a2 + 8) = *(_BYTE *)a1;
  *(_BYTE *)(a2 + 52) = *(_BYTE *)(a1 + 3);
  *(_BYTE *)(a2 + 54) = 0;
  v3 = *(_DWORD *)(a1 + 4) & 0x3FFFFF;
  v4 = *(_DWORD *)(a3 + 180);
  v5 = v4 & 0x3FFFFF;
  v6 = v4 & 0xFFC00000 | v3;
  v7 = v6 + 0x400000;
  if (v3 >= v5)
    v7 = v6;
  *(_QWORD *)a2 = v7;
  *(_DWORD *)(a1 + 4) = v7;
  *(_BYTE *)(a2 + 9) = 1;
  *(_BYTE *)(a2 + 15) = 3;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(_BYTE *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

double MTParse_CompactV5BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  *(_BYTE *)(a2 + 8) = *(_BYTE *)a1;
  *(_BYTE *)(a2 + 52) = *(_BYTE *)(a1 + 6);
  *(_BYTE *)(a2 + 54) = 0;
  v3 = *(_DWORD *)(a1 + 8) & 0x3FFFF;
  v4 = *(_DWORD *)(a3 + 180);
  v5 = v4 & 0x3FFFF;
  v6 = v4 & 0xFFFC0000 | v3;
  v7 = v6 + 0x40000;
  if (v3 >= v5)
    v7 = v6;
  *(_QWORD *)a2 = v7;
  *(_DWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a2 + 9) = 1;
  *(_BYTE *)(a2 + 15) = 5;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(_BYTE *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

uint64_t MTParse_CompactV3orV5BinaryPath(_BYTE *a1, signed int a2, uint64_t a3, uint64_t a4)
{
  int v8;
  uint64_t result;
  int v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;
  __int16 v19;
  _QWORD v20[3];

  v8 = *a1;
  if (v8 == 39)
  {
    if (MTCompactV3HeaderUnpack(a3 + 80, a1, a2))
    {
      MTParse_CompactV3BinaryFrameHeader(a3 + 80, a3, a4);
      goto LABEL_8;
    }
    v8 = *a1;
  }
  if (v8 != 41)
    return 0;
  result = MTCompactV5HeaderUnpack(a3 + 80, a1, a2);
  if (!(_DWORD)result)
    return result;
  MTParse_CompactV5BinaryFrameHeader(a3 + 80, a3, a4);
LABEL_8:
  v10 = a2 - 6;
  if (a2 < 6)
    v10 = a2 + 1;
  v11 = v10 >> 3;
  *(_BYTE *)(a3 + 72) = v11;
  result = 1;
  *(_BYTE *)(a3 + 10) = 1;
  v12 = v11;
  if ((_BYTE)v11)
  {
    v13 = 0;
    v14 = a3 + 116;
    v15 = a1 + 6;
    do
    {
      memset(v20, 170, 18);
      if (MTCompactV3orV5BinaryContactUnpack((uint64_t)v20, v15, 8))
      {
        *(_BYTE *)v14 = BYTE2(v20[1]);
        *(_BYTE *)(v14 + 1) = HIBYTE(v20[1]);
        *(_BYTE *)(v14 + 2) = BYTE6(v20[1]);
        *(_BYTE *)(v14 + 3) = 1;
        *(_DWORD *)(v14 + 4) = v20[0];
        if (LOBYTE(v20[2]))
          *(_DWORD *)(v14 + 8) = -1;
        v16 = SWORD2(v20[0]);
        *(_WORD *)(v14 + 12) = WORD2(v20[0]);
        v17 = SHIWORD(v20[0]);
        *(_WORD *)(v14 + 14) = HIWORD(v20[0]);
        *(_WORD *)(v14 + 16) = WORD2(v20[1]);
        v18 = SLOWORD(v20[1]);
        *(_WORD *)(v14 + 18) = v20[1];
        v19 = mtalg_ComputeContactDensityFromRadii(a4, v18, v16, v17);
        *(_WORD *)(v14 + 20) = v19;
        *(_WORD *)(v14 + 22) = v19;
        *(_DWORD *)(v14 + 24) = 0;
        *(_WORD *)(v14 + 28) = 0;
        v12 = *(unsigned __int8 *)(a3 + 72);
      }
      ++v13;
      v15 += 8;
      v14 += 30;
    }
    while (v13 < v12);
    return 1;
  }
  return result;
}

uint64_t MTCompactV4HeaderUnpack(uint64_t a1, _BYTE *a2, unsigned int a3)
{
  uint64_t v3;

  v3 = 0;
  if (a1 && a2 && a3 >= 4)
  {
    *(_BYTE *)a1 = *a2;
    *(_BYTE *)(a1 + 1) = a2[1] & 1;
    *(_BYTE *)(a1 + 2) = (a2[1] & 2) != 0;
    *(_DWORD *)(a1 + 4) = (a2[1] >> 2) | (a2[2] << 6) | (a2[3] << 14);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV4BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  __int16 v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  __int16 v9;

  v3 = 0;
  if (a1 && a2 && a3 == 9)
  {
    v4 = *a2 | ((a2[1] & 0x1F) << 8);
    *(_WORD *)a1 = v4;
    v5 = (8 * a2[2]) & 0xE7FF | ((a2[3] & 3) << 11) | (a2[1] >> 5);
    *(_WORD *)(a1 + 2) = v5;
    v6 = a2[3] >> 2;
    *(_WORD *)(a1 + 18) = v6;
    LODWORD(v7) = a2[4];
    LODWORD(v8) = a2[5];
    v9 = a2[6] & 0x3F;
    *(_WORD *)(a1 + 8) = v9;
    *(_BYTE *)(a1 + 10) = (a2[6] >> 6) & 0xF3 | (4 * (a2[7] & 3));
    *(_WORD *)(a1 + 12) = (a2[7] & 0xFC) << 7;
    *(_BYTE *)(a1 + 15) = (a2[8] >> 4) & 7;
    *(_BYTE *)(a1 + 14) = a2[8] & 0xF;
    *(_BYTE *)(a1 + 16) = a2[8] >> 7;
    *(_WORD *)a1 = (__int16)(8 * v4) >> 2;
    *(_WORD *)(a1 + 2) = ((__int16)(8 * v5) >> 2) + 5000;
    *(_WORD *)(a1 + 18) = 8 * v6;
    *(_WORD *)(a1 + 8) = 32 * v9;
    if ((_DWORD)v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0xA9)
          v7 = (((unint64_t)((((_DWORD)v7 << 10) - 169984) * (uint64_t)(((_DWORD)v7 << 10) - 169984)) >> 12)
              + 958464) >> 10;
        else
          LODWORD(v7) = (((_DWORD)v7 << 21) + 629145600) >> 20;
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v7 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v7 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v7;
    if ((_DWORD)v8)
    {
      if (v8 > 0x31)
      {
        if (v8 > 0x95)
          v8 = (((87 * ((unint64_t)((((_DWORD)v8 << 10) - 141552) * (uint64_t)(((_DWORD)v8 << 10) - 141552)) >> 10)) >> 10)
              + 807152) >> 10;
        else
          LODWORD(v8) = (((_DWORD)v8 << 21) + 524288000) >> 20;
      }
      else
      {
        LODWORD(v8) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v8 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v8 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v8;
    return 8;
  }
  return v3;
}

double MTParse_CompactV4BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  *(_BYTE *)(a2 + 8) = *(_BYTE *)a1;
  *(_BYTE *)(a2 + 52) = *(_BYTE *)(a1 + 1);
  *(_BYTE *)(a2 + 53) = *(_BYTE *)(a1 + 2) != 0;
  *(_BYTE *)(a2 + 54) = 0;
  v3 = *(_DWORD *)(a1 + 4) & 0x3FFFFF;
  v4 = *(_DWORD *)(a3 + 180);
  v5 = v4 & 0x3FFFFF;
  v6 = v4 & 0xFFC00000 | v3;
  v7 = v6 + 0x400000;
  if (v3 >= v5)
    v7 = v6;
  *(_QWORD *)a2 = v7;
  *(_DWORD *)(a1 + 4) = v7;
  *(_BYTE *)(a2 + 9) = 1;
  *(_BYTE *)(a2 + 15) = 4;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(_BYTE *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

BOOL MTParse_CompactV4BinaryPath(_BYTE *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  unsigned int v10;
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  int v17;
  __int16 v18;
  _QWORD v20[3];

  v8 = a3 + 80;
  v9 = MTCompactV4HeaderUnpack(a3 + 80, a1, a2);
  if (v9)
  {
    MTParse_CompactV4BinaryFrameHeader(v8, a3, a4);
    v10 = ((int)(a2 - 4) / 9);
    *(_BYTE *)(a3 + 72) = (int)(a2 - 4) / 9;
    *(_BYTE *)(a3 + 10) = 1;
    if (((int)(a2 - 4) / 9) && v10 != 0)
    {
      v12 = 0;
      v13 = a3 + 116;
      v14 = a1 + 4;
      do
      {
        memset(v20, 170, 20);
        if (MTCompactV4BinaryContactUnpack((uint64_t)v20, v14, 9))
        {
          *(_BYTE *)v13 = BYTE2(v20[1]);
          *(_BYTE *)(v13 + 1) = HIBYTE(v20[1]);
          *(_BYTE *)(v13 + 2) = BYTE6(v20[1]);
          *(_BYTE *)(v13 + 3) = 1;
          *(_DWORD *)(v13 + 4) = v20[0];
          if (LOBYTE(v20[2]))
            *(_DWORD *)(v13 + 8) = -1;
          v15 = SWORD2(v20[0]);
          *(_WORD *)(v13 + 12) = WORD2(v20[0]);
          v16 = SHIWORD(v20[0]);
          *(_WORD *)(v13 + 14) = HIWORD(v20[0]);
          *(_WORD *)(v13 + 16) = WORD2(v20[1]);
          v17 = SLOWORD(v20[1]);
          *(_WORD *)(v13 + 18) = v20[1];
          v18 = mtalg_ComputeContactDensityFromRadii(a4, v17, v15, v16);
          *(_WORD *)(v13 + 20) = v18;
          *(_WORD *)(v13 + 22) = v18;
          *(_DWORD *)(v13 + 24) = 0;
          *(_WORD *)(v13 + 28) = 0;
          v10 = *(unsigned __int8 *)(a3 + 72);
        }
        ++v12;
        v14 += 9;
        v13 += 30;
      }
      while (v12 < v10);
    }
  }
  return v9 != 0;
}

uint64_t MTCompactV7HeaderUnpack(uint64_t a1, _BYTE *a2, unsigned int a3)
{
  uint64_t v3;

  v3 = 0;
  if (a1 && a2 && a3 >= 4)
  {
    *(_BYTE *)a1 = *a2;
    *(_BYTE *)(a1 + 1) = a2[1] & 1;
    *(_BYTE *)(a1 + 2) = (a2[1] & 2) != 0;
    *(_BYTE *)(a1 + 3) = (a2[1] & 4) != 0;
    *(_DWORD *)(a1 + 4) = (a2[1] >> 3) | (32 * a2[2]) | (a2[3] << 13);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV7BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  __int16 v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;

  v3 = 0;
  if (a1 && a2 && a3 == 9)
  {
    v4 = *a2 | ((a2[1] & 0x1F) << 8);
    *(_WORD *)a1 = v4;
    v5 = (8 * a2[2]) & 0xE7FF | ((a2[3] & 3) << 11) | (a2[1] >> 5);
    *(_WORD *)(a1 + 2) = v5;
    v6 = (a2[3] >> 2) & 7;
    *(_BYTE *)(a1 + 14) = (a2[3] >> 2) & 7;
    *(_BYTE *)(a1 + 15) = a2[3] >> 5;
    LODWORD(v7) = a2[4];
    LODWORD(v8) = a2[5];
    LODWORD(v9) = a2[6];
    LODWORD(v10) = a2[7];
    *(_BYTE *)(a1 + 10) = a2[8] & 0xF;
    *(_BYTE *)(a1 + 16) = (a2[8] & 0x10) != 0;
    v11 = a2[8] >> 5;
    *(_WORD *)(a1 + 12) = v11;
    *(_WORD *)a1 = (__int16)(8 * v4) >> 2;
    *(_WORD *)(a1 + 2) = ((__int16)(8 * v5) >> 2) + 5000;
    if (v6 == 7)
      *(_BYTE *)(a1 + 14) = 12;
    if ((_DWORD)v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0xA9)
          v7 = (((unint64_t)((((_DWORD)v7 << 10) - 169984) * (uint64_t)(((_DWORD)v7 << 10) - 169984)) >> 12)
              + 958464) >> 10;
        else
          LODWORD(v7) = (((_DWORD)v7 << 21) + 629145600) >> 20;
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v7 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v7 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v7;
    if ((_DWORD)v8)
    {
      if (v8 > 0x31)
      {
        if (v8 > 0x95)
          v8 = (((87 * ((unint64_t)((((_DWORD)v8 << 10) - 141552) * (uint64_t)(((_DWORD)v8 << 10) - 141552)) >> 10)) >> 10)
              + 807152) >> 10;
        else
          LODWORD(v8) = (((_DWORD)v8 << 21) + 524288000) >> 20;
      }
      else
      {
        LODWORD(v8) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v8 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v8 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v8;
    if ((_DWORD)v9)
    {
      if (v9 > 0x95)
        v9 = (((138 * ((unint64_t)((((_DWORD)v9 << 10) - 114670) * (uint64_t)(((_DWORD)v9 << 10) - 114670)) >> 10)) >> 10)
            + 1373544) >> 10;
      else
        LODWORD(v9) = (10485 * v9) >> 10;
    }
    *(_WORD *)(a1 + 8) = v9;
    if ((_DWORD)v10)
    {
      if ((v10 & 0x80) != 0)
        v10 = (((unint64_t)((((_DWORD)v10 << 10) - 98939) * (uint64_t)(((_DWORD)v10 << 10) - 98939)) >> 15)
             + 230011) >> 10;
      else
        LOWORD(v10) = 2 * v10;
    }
    *(_WORD *)(a1 + 18) = v10;
    *(_WORD *)(a1 + 12) = (_WORD)v11 << 12;
    return 8;
  }
  return v3;
}

uint64_t MTParse_CompactV7BinaryFrameHeader(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(a2 + 8) = *(_BYTE *)result;
  *(_BYTE *)(a2 + 52) = *(_BYTE *)(result + 1);
  *(_BYTE *)(a2 + 53) = *(_BYTE *)(result + 2) != 0;
  *(_BYTE *)(a2 + 54) = 0;
  v3 = *(_DWORD *)(result + 4) & 0x1FFFFF;
  v4 = *(_DWORD *)(a3 + 180);
  v5 = v4 & 0x1FFFFF;
  v6 = v4 & 0xFFE00000 | v3;
  v7 = v6 + 0x200000;
  if (v3 >= v5)
    v7 = v6;
  *(_QWORD *)a2 = v7;
  *(_DWORD *)(result + 4) = v7;
  *(_BYTE *)(a2 + 9) = 1;
  *(_BYTE *)(a2 + 15) = 4;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(_BYTE *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  *(_DWORD *)(a2 + 73) = -1795162112;
  *(_BYTE *)(a2 + 55) = *(_BYTE *)(result + 3) != 0;
  return result;
}

uint64_t MTParse_CompactV7BinaryPath(_BYTE *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  int v16;
  __int16 v17;
  _QWORD v19[3];

  if (*a1 != 49)
    return 0;
  v8 = a3 + 80;
  if (!MTCompactV7HeaderUnpack(a3 + 80, a1, a2))
    return 0;
  MTParse_CompactV7BinaryFrameHeader(v8, a3, a4);
  v9 = ((int)(a2 - 4) / 9);
  *(_BYTE *)(a3 + 72) = (int)(a2 - 4) / 9;
  v10 = 1;
  *(_BYTE *)(a3 + 10) = 1;
  if (v9)
  {
    v11 = 0;
    v12 = a3 + 116;
    v13 = a1 + 4;
    do
    {
      memset(v19, 170, 20);
      if (MTCompactV7BinaryContactUnpack((uint64_t)v19, v13, 9))
      {
        *(_BYTE *)v12 = BYTE2(v19[1]);
        *(_BYTE *)(v12 + 1) = HIBYTE(v19[1]);
        *(_BYTE *)(v12 + 2) = BYTE6(v19[1]);
        *(_BYTE *)(v12 + 3) = 1;
        *(_DWORD *)(v12 + 4) = v19[0];
        if (LOBYTE(v19[2]))
          *(_DWORD *)(v12 + 8) = -1;
        v14 = SWORD2(v19[0]);
        *(_WORD *)(v12 + 12) = WORD2(v19[0]);
        v15 = SHIWORD(v19[0]);
        *(_WORD *)(v12 + 14) = HIWORD(v19[0]);
        *(_WORD *)(v12 + 16) = WORD2(v19[1]);
        v16 = SLOWORD(v19[1]);
        *(_WORD *)(v12 + 18) = v19[1];
        v17 = mtalg_ComputeContactDensityFromRadii(a4, v16, v14, v15);
        *(_WORD *)(v12 + 20) = v17;
        *(_WORD *)(v12 + 22) = v17;
        *(_WORD *)(v12 + 26) = WORD1(v19[2]);
        *(_WORD *)(v12 + 28) = 0;
        v9 = *(unsigned __int8 *)(a3 + 72);
      }
      ++v11;
      v13 += 9;
      v12 += 30;
    }
    while (v11 < v9);
    return 1;
  }
  return v10;
}

uint64_t MTCompactV9HeaderUnpack(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  char v4;

  v3 = 0;
  if (a1 && a2 && a3 >= 7)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v4 = *(_BYTE *)(a2 + 1);
    *(_BYTE *)(a1 + 1) = *(_BYTE *)(a1 + 1) & 0xFC | v4 & 3;
    *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1) & 0xFC | v4 & 3;
    *(_DWORD *)(a1 + 2) = *(_DWORD *)(a2 + 2);
    *(_BYTE *)(a1 + 6) = *(_BYTE *)(a2 + 6);
    return 7;
  }
  return v3;
}

uint64_t MTCompactV9BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  __int16 v4;
  int v5;
  char v6;
  int v7;

  v3 = 0;
  if (a1 && a2 && a3 == 13)
  {
    v4 = a2[3] | ((a2[4] & 0xF) << 8);
    *(_WORD *)a1 = v4;
    if ((char)*a2 < 0)
      *(_WORD *)a1 = v4 | 0xF000;
    v5 = (a2[4] >> 4) | (16 * a2[5]);
    *(_WORD *)(a1 + 2) = (a2[4] >> 4) | (16 * a2[5]);
    if ((char)a2[2] < 0)
      *(_WORD *)(a1 + 2) = v5 | 0xF000;
    *(_WORD *)(a1 + 4) = a2[6] | ((a2[7] & 0xF) << 8);
    *(_WORD *)(a1 + 6) = (a2[7] >> 4) | (16 * a2[8]);
    *(_WORD *)(a1 + 8) = a2[10] | ((a2[11] & 0xF) << 8);
    *(_WORD *)(a1 + 10) = (a2[11] >> 4) | (16 * a2[12]);
    v6 = *a2 & 3;
    if (!v6)
      v6 = 4;
    *(_BYTE *)(a1 + 12) = v6;
    *(_WORD *)(a1 + 14) = (23860930 * (unint64_t)(a2[9] << 15)) >> 32;
    *(_BYTE *)(a1 + 16) = a2[1] & 0xF;
    *(_BYTE *)(a1 + 17) = (*a2 >> 2) & 7;
    *(_WORD *)(a1 + 18) = 0;
    v7 = (*a2 >> 5) & 1;
    *(_WORD *)(a1 + 18) = (*a2 & 0x20) != 0;
    if ((*a2 & 0x40) != 0)
      *(_WORD *)(a1 + 18) = v7 | 0x10;
    *(_WORD *)(a1 + 20) = (a2[1] >> 4) & 0xF | (16 * (a2[2] & 0x7F));
    return 7;
  }
  return v3;
}

double MTParse_CompactV9BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;

  *(_BYTE *)(a2 + 8) = *(_BYTE *)a1;
  *(_BYTE *)(a2 + 72) = *(_BYTE *)(a1 + 1) & 3;
  *(_DWORD *)(a2 + 68) = *(unsigned __int8 *)(a1 + 1) >> 2;
  *(_QWORD *)a2 = *(unsigned int *)(a1 + 2);
  *(_BYTE *)(a2 + 9) = 1;
  *(_BYTE *)(a2 + 15) = 9;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(_BYTE *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  result = -6.68887507e-198;
  *(_DWORD *)(a2 + 73) = -1761607680;
  return result;
}

BOOL MTParse_CompactV9BinaryPath(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  __int16 v12;
  unint64_t v13;
  _QWORD v15[3];

  v7 = MTCompactV9HeaderUnpack(a3 + 80, a1, a2);
  if (v7)
  {
    MTParse_CompactV9BinaryFrameHeader(a3 + 80, a3, a4);
    *(_BYTE *)(a3 + 10) = 1;
    v8 = *(unsigned __int8 *)(a3 + 72);
    if (*(_BYTE *)(a3 + 72))
    {
      v9 = a3 + 116;
      v10 = (unsigned __int8 *)(a1 + 7);
      do
      {
        memset(v15, 170, 22);
        if (MTCompactV9BinaryContactUnpack((uint64_t)v15, v10, 13))
        {
          *(_BYTE *)v9 = BYTE4(v15[1]);
          *(_BYTE *)(v9 + 1) = BYTE1(v15[2]);
          *(_BYTE *)(v9 + 2) = v15[2];
          v11 = HIDWORD(v15[0]);
          *(_DWORD *)(v9 + 4) = v15[0];
          *(_BYTE *)(v9 + 3) = 0;
          *(_DWORD *)(v9 + 12) = v11;
          *(_WORD *)(v9 + 16) = HIWORD(v15[1]);
          *(_WORD *)(v9 + 18) = v15[1];
          v12 = WORD1(v15[1]);
          *(_WORD *)(v9 + 20) = WORD1(v15[1]);
          *(_WORD *)(v9 + 22) = v12;
          *(_WORD *)(v9 + 24) = 0;
          HIDWORD(v13) = *(_DWORD *)((char *)&v15[2] + 2);
          LODWORD(v13) = *(_DWORD *)((char *)&v15[2] + 2);
          *(_DWORD *)(v9 + 26) = v13 >> 16;
        }
        v10 += 13;
        v9 += 30;
        --v8;
      }
      while (v8);
    }
  }
  return v7 != 0;
}

uint64_t MTCompactV8HeaderUnpack(uint64_t a1, _BYTE *a2, unsigned int a3)
{
  uint64_t v3;

  v3 = 0;
  if (a1 && a2 && a3 >= 4)
  {
    *(_BYTE *)a1 = *a2;
    *(_BYTE *)(a1 + 1) = a2[1] & 1;
    *(_DWORD *)(a1 + 4) = (a2[1] >> 1) | (a2[2] << 7);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV8BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3, unsigned int a4)
{
  uint64_t v4;
  __int16 v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  int v11;

  v4 = 0;
  if (a1 && a2 && a3 == 7)
  {
    v5 = *a2 | ((a2[1] & 0xF) << 8);
    *(_WORD *)a1 = v5;
    v6 = (a2[1] >> 4) | (16 * a2[2]);
    *(_WORD *)(a1 + 2) = (a2[1] >> 4) | (16 * a2[2]);
    LODWORD(v7) = a2[3];
    LODWORD(v8) = a2[4];
    LODWORD(v9) = a2[5];
    if ((a2[6] & 8) != 0)
      v10 = 1;
    else
      v10 = 2;
    *(_BYTE *)(a1 + 10) = v10;
    v11 = a2[6] >> 5;
    *(_WORD *)(a1 + 12) = v11;
    *(_BYTE *)(a1 + 15) = a2[6] & 7;
    *(_BYTE *)(a1 + 16) = (a2[6] & 0x10) != 0;
    *(_WORD *)(a1 + 20) = (a4 >> 2) & 3;
    *(_WORD *)a1 = ((__int16)(16 * v5) >> 3) + 2000;
    *(_WORD *)(a1 + 2) = ((__int16)(16 * v6) >> 3) + 2000;
    if ((_DWORD)v9)
    {
      if (v9 > 0x95)
        v9 = (((138 * ((unint64_t)((((_DWORD)v9 << 10) - 114670) * (uint64_t)(((_DWORD)v9 << 10) - 114670)) >> 10)) >> 10)
            + 1373544) >> 10;
      else
        LODWORD(v9) = (10485 * v9) >> 10;
    }
    *(_WORD *)(a1 + 8) = v9;
    *(_WORD *)(a1 + 12) = (_WORD)v11 << 12;
    if ((_DWORD)v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0xA9)
          v7 = (((unint64_t)((((_DWORD)v7 << 10) - 169984) * (uint64_t)(((_DWORD)v7 << 10) - 169984)) >> 12)
              + 958464) >> 10;
        else
          LODWORD(v7) = (((_DWORD)v7 << 21) + 629145600) >> 20;
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v7 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v7 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v7;
    if ((_DWORD)v8)
    {
      if (v8 > 0x31)
      {
        if (v8 > 0x95)
          v8 = (((87 * ((unint64_t)((((_DWORD)v8 << 10) - 141552) * (uint64_t)(((_DWORD)v8 << 10) - 141552)) >> 10)) >> 10)
              + 807152) >> 10;
        else
          LODWORD(v8) = (((_DWORD)v8 << 21) + 524288000) >> 20;
      }
      else
      {
        LODWORD(v8) = (((0xFFFFFFFD8
                                     * ((unint64_t)((((_DWORD)v8 << 10) - 76800)
                                                         * (uint64_t)(((_DWORD)v8 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v8;
    *(_BYTE *)(a1 + 14) = byte_21A1FCF10[a4 & 3];
    if (((a4 >> 2) & 3) >= 2)
      *(_WORD *)(a1 + 20) = (a4 >> 2) & 1 | 0x20;
    return 8;
  }
  return v4;
}

double MTParse_CompactV8BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double result;

  *(_BYTE *)(a2 + 8) = *(_BYTE *)a1;
  *(_BYTE *)(a2 + 52) = *(_BYTE *)(a1 + 1);
  *(_WORD *)(a2 + 53) = 0;
  v3 = (*(_DWORD *)(a3 + 180) & 0xFFFF8000 | *(_DWORD *)(a1 + 4) & 0x7FFF) + 0x8000;
  if ((*(_DWORD *)(a1 + 4) & 0x7FFFu) >= (*(_DWORD *)(a3 + 180) & 0x7FFFu))
    v3 = *(_DWORD *)(a3 + 180) & 0xFFFF8000 | *(_DWORD *)(a1 + 4) & 0x7FFF;
  *(_QWORD *)a2 = v3;
  *(_DWORD *)(a1 + 4) = v3;
  *(_BYTE *)(a2 + 9) = 1;
  *(_BYTE *)(a2 + 15) = 8;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(_BYTE *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

uint64_t MTParse_CompactV8BinaryPath(_BYTE *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  int v5;
  int v10;
  unsigned __int8 v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;
  __int16 v19;
  unsigned int v21;
  _QWORD v22[3];

  if (a1)
    v4 = a2 > 3;
  else
    v4 = 0;
  v5 = v4;
  v21 = v5;
  if (v5 == 1)
  {
    *(_BYTE *)(a3 + 80) = *a1;
    *(_BYTE *)(a3 + 81) = a1[1] & 1;
    *(_DWORD *)(a3 + 84) = (a1[1] >> 1) | (a1[2] << 7);
    MTParse_CompactV8BinaryFrameHeader(a3 + 80, a3, a4);
    v10 = (int)(a2 - 4) / 7;
    v11 = v10 <= 2u ? v10 : 2;
    *(_BYTE *)(a3 + 72) = v11;
    *(_BYTE *)(a3 + 10) = 1;
    if (v11)
    {
      v12 = 0;
      v13 = 0;
      v14 = a3 + 116;
      v15 = a1 + 4;
      do
      {
        memset(v22, 170, 22);
        if (MTCompactV8BinaryContactUnpack((uint64_t)v22, v15, 7, (a1[3] >> v12) & 0xF))
        {
          *(_BYTE *)v14 = BYTE2(v22[1]);
          *(_BYTE *)(v14 + 1) = HIBYTE(v22[1]);
          *(_BYTE *)(v14 + 2) = BYTE6(v22[1]);
          *(_BYTE *)(v14 + 3) = 1;
          *(_DWORD *)(v14 + 4) = v22[0];
          if (LOBYTE(v22[2]))
            *(_DWORD *)(v14 + 8) = -1;
          v16 = SWORD2(v22[0]);
          *(_WORD *)(v14 + 12) = WORD2(v22[0]);
          v17 = SHIWORD(v22[0]);
          *(_WORD *)(v14 + 14) = HIWORD(v22[0]);
          *(_WORD *)(v14 + 16) = WORD2(v22[1]);
          v18 = SLOWORD(v22[1]);
          *(_WORD *)(v14 + 18) = v22[1];
          v19 = mtalg_ComputeContactDensityFromRadii(a4, v18, v16, v17);
          *(_WORD *)(v14 + 20) = v19;
          *(_WORD *)(v14 + 22) = v19;
          *(_DWORD *)(v14 + 24) = 0;
          *(_WORD *)(v14 + 28) = WORD2(v22[2]);
          v11 = *(_BYTE *)(a3 + 72);
        }
        ++v13;
        v12 += 4;
        v15 += 7;
        v14 += 30;
      }
      while (v13 < v11);
    }
  }
  return v21;
}

uint64_t MTCompactV10HeaderUnpack(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  char v4;

  v3 = 0;
  if (a1 && a2 && a3 >= 0x11)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_DWORD *)(a1 + 1) = (*(unsigned __int16 *)(a2 + 1) | (*(unsigned __int8 *)(a2 + 3) << 16)) & 0xF0FFFFFF | ((*(_BYTE *)(a2 + 4) & 0xF) << 24);
    *(_QWORD *)(a1 + 5) = *(_QWORD *)(a2 + 5);
    v4 = *(_BYTE *)(a2 + 13);
    *(_BYTE *)(a1 + 13) = *(_BYTE *)(a1 + 13) & 0xF0 | v4 & 0xF;
    *(_BYTE *)(a1 + 13) = *(_BYTE *)(a2 + 13) & 0xF0 | v4 & 0xF;
    *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
    *(_BYTE *)(a1 + 15) = *(_BYTE *)(a2 + 15);
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    return 17;
  }
  return v3;
}

uint64_t MTCompactV10BinaryContactUnpack(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  char v4;

  v3 = 0;
  if (a1 && a2 && a3 >= 0x13)
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    *(_WORD *)(a1 + 2) = *(_WORD *)(a2 + 2);
    *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
    *(_WORD *)(a1 + 6) = *(unsigned __int8 *)(a2 + 5) | (*(unsigned __int8 *)(a2 + 7) << 8);
    *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
    *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
    v4 = *(_BYTE *)(a2 + 16);
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 16) & 0xF0 | v4 & 0xF;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16) & 0xF0 | v4 & 0xF;
    *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
    return 19;
  }
  return v3;
}

double MTParse_CompactV10BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  double result;

  *(_BYTE *)(a2 + 8) = *(_BYTE *)a1;
  *(_BYTE *)(a2 + 72) = *(_BYTE *)(a1 + 13) >> 4;
  *(_DWORD *)(a2 + 68) = 0;
  v3 = *(_DWORD *)(a3 + 180);
  v4 = ((3125 * (unint64_t)*(unsigned int *)(a1 + 1) * (unsigned __int128)0x68DB8BAC710CCuLL) >> 64)
     + 83886080 * (v3 / 0x5000000);
  if (v4 >= v3)
    v5 = ((3125 * (unint64_t)*(unsigned int *)(a1 + 1) * (unsigned __int128)0x68DB8BAC710CCuLL) >> 64)
       + 83886080 * (v3 / 0x5000000);
  else
    LODWORD(v5) = v4 + 83886080;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 9) = 1;
  *(_BYTE *)(a2 + 15) = 10;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(a3 + 176) + 1;
  *(_QWORD *)&result = 268;
  *(_DWORD *)(a2 + 36) = 268;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_BYTE *)(a2 + 73) = *(_BYTE *)(a1 + 14);
  *(_WORD *)(a2 + 74) = 1536;
  *(_BYTE *)(a2 + 76) = -105;
  *(_BYTE *)(a2 + 64) = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a2 + 11) = (*(_BYTE *)(a1 + 13) & 2) != 0;
  *(_BYTE *)(a2 + 12) = (*(_BYTE *)(a1 + 13) & 4) != 0;
  return result;
}

uint64_t MTParse_CompactV10BinaryPath(uint64_t a1, unsigned int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  unsigned int v13;
  unint64_t v14;
  _QWORD v15[3];

  result = MTCompactV10HeaderUnpack(a3 + 80, a1, a2);
  if ((_DWORD)result)
  {
    MTParse_CompactV10BinaryFrameHeader(a3 + 80, a3, (uint64_t)a4);
    *(_BYTE *)(a3 + 10) = 0;
    v8 = *(unsigned __int8 *)(a3 + 93);
    v9 = v8 >> 4;
    *(_BYTE *)(a3 + 72) = *(_BYTE *)(a3 + 93) >> 4;
    if (v8 >= 0x10)
    {
      if (v9 <= 1)
        v10 = 1;
      else
        v10 = v9;
      v11 = *(unsigned __int8 *)(a3 + 95) + a1 + 17;
      v12 = (_WORD *)(a3 + 144);
      do
      {
        memset(v15, 170, 19);
        if (MTCompactV10BinaryContactUnpack((uint64_t)v15, v11, 0x13u))
        {
          v13 = LOBYTE(v15[2]);
          *((_BYTE *)v12 - 28) = v15[2] & 0xF;
          *((_BYTE *)v12 - 27) = v13 >> 4;
          *(v12 - 13) = 2;
          *((_QWORD *)v12 - 3) = v15[0];
          *((_DWORD *)v12 - 4) = v15[1];
          *(v12 - 5) = WORD2(v15[1]);
          LOWORD(v13) = HIWORD(v15[1]);
          *(v12 - 4) = HIWORD(v15[1]);
          *(v12 - 3) = v13;
          *(v12 - 6) = 0;
          *((_DWORD *)v12 - 1) = 0;
          *v12 = *(_WORD *)((char *)&v15[2] + 1);
        }
        v11 += 19;
        v12 += 15;
        --v10;
      }
      while (v10);
    }
    v14 = *(_QWORD *)(a3 + 85);
    if (v14)
    {
      v14 = v14 / 0x3E8 - *(_QWORD *)a3;
      if (*(_QWORD *)(a3 + 85) / 0x3E8uLL == *(_QWORD *)a3)
        v14 = 1;
    }
    a4->var47 = v14;
    if (*(_BYTE *)(a3 + 12))
      return MTParse_BinaryImagePayload((unsigned __int8 *)(a1 + 17), *(unsigned __int8 *)(a3 + 95), (MTParsedMultitouchFrameRep_t *)a3, a4);
    else
      return 1;
  }
  return result;
}

uint64_t MTParse_BinaryImagePayload(unsigned __int8 *__src, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  void *v8;
  size_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int var21;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t result;
  uint64_t v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;

  v4 = *((unsigned __int8 *)a3 + 36);
  v5 = a4->var17 * a4->var18;
  v6 = *((unsigned int *)a3 + 12);
  if (v6 < vcvtps_u32_f32((float)(v5 * v4) * 0.125))
  {
    printf("Buffer too small to uncompress image to %d bytes! (Buffer is only %u)\n");
    return 0;
  }
  v7 = __src;
  if (v4 != 12)
  {
    if (v4 == 8)
    {
      if (!*((_BYTE *)a3 + 38))
      {
        if ((_DWORD)v5 != a2)
        {
          printf("Raw data only had %d 8-bit words! (expected %u)\n");
          return 0;
        }
        v8 = (void *)*((_QWORD *)a3 + 5);
        v9 = a2;
        goto LABEL_41;
      }
    }
    else
    {
      v10 = 0;
      v11 = *((unsigned __int8 *)a3 + 14);
      if (a2 >= 1 && *((_BYTE *)a3 + 14))
      {
        v7 = __src + 1;
        v10 = *__src;
        --a2;
      }
      if (a2 >= 0)
        v12 = a2;
      else
        v12 = a2 + 1;
      v13 = (v12 >> 1);
      if (a2 > 1)
      {
        var21 = a4->var21;
        v15 = v13;
        v16 = v7;
        do
        {
          v17 = *(unsigned __int16 *)v16;
          v18 = bswap32(v17) >> 16;
          if (var21 != 1)
            LOWORD(v17) = v18;
          *(_WORD *)v16 = v17;
          v16 += 2;
          --v15;
        }
        while (v15);
      }
      if (!*((_BYTE *)a3 + 38))
      {
        if (v11 && v10)
        {
          if (mt_UncompressTouchpadCodecV1Image(*((_QWORD *)a3 + 5), v6, (uint64_t)v7, a2, *((unsigned __int16 *)a3 + 14), *((unsigned __int16 *)a3 + 15), (*((unsigned __int8 *)a3 + 75) >> 2) & 1))
          {
            printf("Failed to decompress touchpad codec v1 compressed image. Failed with error(0x%X)\n");
            return 0;
          }
          return 1;
        }
        if ((_DWORD)v13 != (_DWORD)v5)
        {
          printf("Raw data only had %d 16-bit words! (expected %u)\n");
          return 0;
        }
        v8 = (void *)*((_QWORD *)a3 + 5);
        v9 = 2 * (int)v5;
LABEL_41:
        memcpy(v8, v7, v9);
        return 1;
      }
    }
LABEL_23:
    puts("Unsupported format RLECompressed");
    return 0;
  }
  if (*((_BYTE *)a3 + 38))
    goto LABEL_23;
  if ((unint64_t)((v5 & 1) + ((3 * v5) >> 1)) < a2)
  {
    printf("Raw data only had %d bytes! (expected %u)\n");
    return 0;
  }
  if (!(_DWORD)v5)
    return 1;
  v20 = 0;
  v21 = 0;
  v22 = *((_QWORD *)a3 + 5);
  result = 1;
  do
  {
    v23 = v7[v21];
    v24 = v21 + 1;
    v25 = v7[v24];
    v26 = (v23 >> 4) | (16 * v25);
    v21 += 2;
    v27 = v23 & 0xFFFFF0FF | ((v25 & 0xF) << 8);
    if ((v20 & 1) != 0)
    {
      v28 = v26;
    }
    else
    {
      v21 = v24;
      v28 = v27;
    }
    if (v28 >= 0x800)
      LOWORD(v28) = v28 | 0xF000;
    *(_WORD *)(v22 + 2 * v20++) = v28;
  }
  while (v5 != v20);
  return result;
}

BOOL MTParse_V3BinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  BOOL v5;
  _BOOL8 result;
  char v7;
  unsigned __int8 v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned int var21;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  __int16 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;

  if (a1)
    v5 = a2 <= 7;
  else
    v5 = 1;
  result = !v5;
  if (result)
  {
    *((_QWORD *)a3 + 10) = 0;
    *((_QWORD *)a3 + 11) = 0;
    *((_DWORD *)a3 + 26) = 0;
    *((_QWORD *)a3 + 12) = 0;
    v7 = *a1;
    *((_BYTE *)a3 + 80) = *a1;
    v8 = a1[1];
    *((_BYTE *)a3 + 81) = v8;
    v9 = a1[2];
    *((_BYTE *)a3 + 82) = v9;
    v10 = a1[3];
    *((_BYTE *)a3 + 83) = v10;
    var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    v13 = bswap32(v12);
    if (var21 == 1)
      v12 = v12;
    else
      v12 = v13;
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      v28 = 0;
      v19 = 0;
      v18 = 0;
      v20 = 0;
      LOWORD(v22) = 0;
      LOWORD(v24) = 0;
      v14 = 0;
    }
    else
    {
      *((_BYTE *)a3 + 88) = a1[8];
      *((_BYTE *)a3 + 89) = a1[9];
      v14 = a1[10];
      *((_BYTE *)a3 + 90) = v14;
      *((_BYTE *)a3 + 91) = a1[11];
      v15 = bswap32(*((unsigned __int16 *)a1 + 6)) >> 16;
      v16 = var21 == 1;
      if (var21 == 1)
        v17 = *((_WORD *)a1 + 6);
      else
        v17 = v15;
      *((_WORD *)a3 + 46) = v17;
      v18 = a1[14];
      *((_BYTE *)a3 + 94) = v18;
      v19 = a1[15];
      *((_BYTE *)a3 + 95) = v19;
      v20 = *((_DWORD *)a1 + 4);
      v21 = bswap32(v20);
      if (!v16)
        v20 = v21;
      *((_DWORD *)a3 + 24) = v20;
      v22 = *((unsigned __int16 *)a1 + 10);
      v23 = bswap32(v22) >> 16;
      if (!v16)
        LOWORD(v22) = v23;
      *((_WORD *)a3 + 50) = v22;
      v24 = *((unsigned __int16 *)a1 + 11);
      v25 = bswap32(v24) >> 16;
      if (!v16)
        LOWORD(v24) = v25;
      *((_WORD *)a3 + 51) = v24;
      v26 = *((unsigned __int16 *)a1 + 12);
      v27 = bswap32(v26) >> 16;
      if (!v16)
        LOWORD(v26) = v27;
      *((_WORD *)a3 + 52) = v26;
      v28 = *((_DWORD *)a3 + 22);
    }
    *((_BYTE *)a3 + 8) = v7;
    *((_BYTE *)a3 + 9) = 0;
    *((_BYTE *)a3 + 15) = v10;
    *((_BYTE *)a3 + 16) = v8;
    *((_BYTE *)a3 + 37) = (v14 & 4) != 0;
    *((_BYTE *)a3 + 38) = (v14 & 8) != 0;
    *((_BYTE *)a3 + 39) = v14 >> 7;
    *((_WORD *)a3 + 31) = v24;
    *((_WORD *)a3 + 33) = v22;
    *((_DWORD *)a3 + 17) = v20;
    *((_BYTE *)a3 + 72) = v18;
    *(_DWORD *)((char *)a3 + 73) = v28;
    *((_BYTE *)a3 + 55) = 1;
    *((_BYTE *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((_BYTE *)a3 + 52) = v19;
    *((_BYTE *)a3 + 54) = v28;
    *(_QWORD *)a3 = v12;
  }
  return result;
}

uint64_t MTParse_V3BinaryPathOrImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _WORD *v13;
  unsigned __int8 *v14;
  unsigned int var21;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;

  result = MTParse_V3BinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if ((_DWORD)result)
  {
    v9 = *(unsigned __int8 *)(a3 + 94);
    v10 = *(unsigned __int16 *)(a3 + 92);
    if (*(_BYTE *)(a3 + 94))
    {
      if (*(_WORD *)(a3 + 92) && !(unsigned __int16)(v10 % v9))
      {
        v11 = 0;
        v12 = (v10 / v9);
        v13 = (_WORD *)(a3 + 144);
        while (v12 > 0x13)
        {
          v14 = &a1[*(unsigned __int8 *)(a3 + 82) + v11 * v12];
          *((_BYTE *)v13 - 28) = *v14;
          *((_BYTE *)v13 - 27) = v14[1];
          *((_BYTE *)v13 - 26) = v14[2];
          *((_BYTE *)v13 - 25) = v14[3];
          var21 = a4->var21;
          v16 = *((unsigned __int16 *)v14 + 2);
          v17 = bswap32(v16) >> 16;
          if (var21 != 1)
            LOWORD(v16) = v17;
          *(v13 - 12) = v16;
          v18 = *((unsigned __int16 *)v14 + 3);
          v19 = bswap32(v18) >> 16;
          if (var21 != 1)
            LOWORD(v18) = v19;
          *(v13 - 11) = v18;
          v20 = *((unsigned __int16 *)v14 + 4);
          v21 = bswap32(v20) >> 16;
          if (var21 != 1)
            LOWORD(v20) = v21;
          *(v13 - 10) = v20;
          v22 = *((unsigned __int16 *)v14 + 5);
          v23 = bswap32(v22) >> 16;
          if (var21 != 1)
            LOWORD(v22) = v23;
          *(v13 - 9) = v22;
          v24 = *((unsigned __int16 *)v14 + 6);
          v25 = bswap32(v24) >> 16;
          if (var21 != 1)
            LOWORD(v24) = v25;
          *(v13 - 8) = v24;
          v26 = *((unsigned __int16 *)v14 + 7);
          v27 = bswap32(v26) >> 16;
          if (var21 != 1)
            LOWORD(v26) = v27;
          *(v13 - 7) = v26;
          v28 = *((unsigned __int16 *)v14 + 8);
          v29 = bswap32(v28) >> 16;
          if (var21 != 1)
            LOWORD(v28) = v29;
          *(v13 - 6) = v28;
          v30 = *((unsigned __int16 *)v14 + 9);
          v31 = bswap32(v30) >> 16;
          if (var21 != 1)
            LOWORD(v30) = v31;
          *(v13 - 5) = v30;
          if (v12 <= 0x15)
            goto LABEL_40;
          v32 = bswap32(*((unsigned __int16 *)v14 + 10)) >> 16;
          if (var21 == 1)
            v33 = *((_WORD *)v14 + 10);
          else
            v33 = v32;
          *(v13 - 4) = v33;
          if (v12 <= 0x17)
            goto LABEL_41;
          v34 = *((unsigned __int16 *)v14 + 11);
          v35 = bswap32(v34) >> 16;
          if (var21 != 1)
            LOWORD(v34) = v35;
          *(v13 - 3) = v34;
          if (v12 <= 0x19)
            goto LABEL_42;
          v36 = *((unsigned __int16 *)v14 + 12);
          v37 = bswap32(v36) >> 16;
          if (var21 != 1)
            LOWORD(v36) = v37;
          *(v13 - 2) = v36;
          if (v12 > 0x1B)
          {
            v38 = *((unsigned __int16 *)v14 + 13);
            v39 = bswap32(v38) >> 16;
            if (var21 != 1)
              LOWORD(v38) = v39;
            *(v13 - 1) = v38;
            if (v12 < 0x1E)
            {
              LOWORD(v40) = 0;
            }
            else
            {
              v40 = *((unsigned __int16 *)v14 + 14);
              v41 = bswap32(v40) >> 16;
              if (var21 != 1)
                LOWORD(v40) = v41;
            }
            goto LABEL_44;
          }
LABEL_43:
          LOWORD(v40) = 0;
          *(v13 - 1) = 0;
LABEL_44:
          *v13 = v40;
          v13 += 15;
          if (++v11 >= (unint64_t)v9)
            return 1;
        }
        LOWORD(v30) = *(v13 - 5);
        LOWORD(v24) = *(v13 - 8);
        LOWORD(v26) = *(v13 - 7);
LABEL_40:
        v33 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, (__int16)v30, (__int16)v24, (__int16)v26);
        *(v13 - 4) = v33;
        v9 = *(unsigned __int8 *)(a3 + 94);
LABEL_41:
        *(v13 - 3) = v33;
LABEL_42:
        *(v13 - 2) = 0;
        goto LABEL_43;
      }
      return 1;
    }
    if (!*(_WORD *)(a3 + 92))
      return 1;
    v42 = *(unsigned __int8 *)(a3 + 82);
    if ((int)(v42 + v10) <= a2)
      return MTParse_BinaryImagePayload(&a1[v42], v10, (MTParsedMultitouchFrameRep_t *)a3, a4);
    else
      return 0;
  }
  return result;
}

BOOL MTParse_V4BinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  BOOL v5;
  _BOOL8 result;
  char v7;
  unsigned __int8 v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned int var21;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  __int16 v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  int v34;

  if (a1)
    v5 = a2 <= 7;
  else
    v5 = 1;
  result = !v5;
  if (result)
  {
    *((_OWORD *)a3 + 5) = 0u;
    *((_OWORD *)a3 + 6) = 0u;
    v7 = *a1;
    *((_BYTE *)a3 + 80) = *a1;
    v8 = a1[1];
    *((_BYTE *)a3 + 81) = v8;
    v9 = a1[2];
    *((_BYTE *)a3 + 82) = v9;
    v10 = a1[3];
    *((_BYTE *)a3 + 83) = v10;
    var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    v13 = bswap32(v12);
    if (var21 == 1)
      v12 = v12;
    else
      v12 = v13;
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      v34 = 0;
      v27 = 0;
      LOBYTE(v17) = 0;
      v26 = 0;
      v28 = 0;
      LOWORD(v30) = 0;
      LOWORD(v33) = 0;
      v14 = 0;
    }
    else
    {
      *((_BYTE *)a3 + 88) = a1[8];
      *((_BYTE *)a3 + 89) = a1[9];
      v14 = a1[10];
      *((_BYTE *)a3 + 90) = v14;
      *((_BYTE *)a3 + 91) = a1[11];
      v15 = bswap32(*((unsigned __int16 *)a1 + 6)) >> 16;
      v16 = var21 == 1;
      if (var21 == 1)
        v17 = *((_WORD *)a1 + 6);
      else
        v17 = v15;
      *((_WORD *)a3 + 46) = v17;
      v18 = *((unsigned __int16 *)a1 + 7);
      v19 = bswap32(v18) >> 16;
      if (!v16)
        LOWORD(v18) = v19;
      *((_WORD *)a3 + 47) = v18;
      v20 = *((unsigned __int16 *)a1 + 8);
      v21 = bswap32(v20) >> 16;
      if (!v16)
        LOWORD(v20) = v21;
      *((_WORD *)a3 + 48) = v20;
      v22 = *((unsigned __int16 *)a1 + 9);
      v23 = bswap32(v22) >> 16;
      if (!v16)
        LOWORD(v22) = v23;
      *((_WORD *)a3 + 49) = v22;
      v24 = *((unsigned __int16 *)a1 + 10);
      v25 = bswap32(v24) >> 16;
      if (!v16)
        LOWORD(v24) = v25;
      *((_WORD *)a3 + 50) = v24;
      v26 = a1[22];
      *((_BYTE *)a3 + 102) = v26;
      v27 = a1[23];
      *((_BYTE *)a3 + 103) = v27;
      v28 = *((_DWORD *)a1 + 6);
      v29 = bswap32(v28);
      if (!v16)
        v28 = v29;
      *((_DWORD *)a3 + 26) = v28;
      v30 = *((unsigned __int16 *)a1 + 14);
      v31 = bswap32(v30) >> 16;
      if (!v16)
        LOWORD(v30) = v31;
      *((_WORD *)a3 + 54) = v30;
      v32 = *((unsigned __int16 *)a1 + 15);
      v33 = bswap32(v32) >> 16;
      if (v16)
        LOWORD(v33) = v32;
      *((_WORD *)a3 + 55) = v33;
      v34 = *((_DWORD *)a3 + 22);
    }
    *((_BYTE *)a3 + 8) = v7;
    *((_BYTE *)a3 + 9) = 0;
    *((_BYTE *)a3 + 15) = v10;
    *((_BYTE *)a3 + 16) = v8;
    *((_BYTE *)a3 + 37) = (v14 & 4) != 0;
    *((_BYTE *)a3 + 38) = (v14 & 8) != 0;
    *((_BYTE *)a3 + 39) = v14 >> 7;
    *((_WORD *)a3 + 31) = v33;
    *((_WORD *)a3 + 33) = v30;
    *((_DWORD *)a3 + 17) = v28;
    *((_BYTE *)a3 + 72) = v26;
    *(_DWORD *)((char *)a3 + 73) = v34;
    *((_BYTE *)a3 + 55) = v17 & 1;
    *((_BYTE *)a3 + 12) = (v17 & 4) != 0;
    *((_BYTE *)a3 + 11) = (v17 & 2) != 0;
    *((_BYTE *)a3 + 14) = (v14 & 0x40) != 0;
    *((_BYTE *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((_BYTE *)a3 + 52) = v27;
    *((_BYTE *)a3 + 54) = v34;
    *(_QWORD *)a3 = v12;
  }
  return result;
}

BOOL MTParse_PrecisePathPayload(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4, int a5, int a6, unsigned int a7, int a8)
{
  int v9;
  int v10;
  int v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  int32x2_t v18;
  char *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  float v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int var21;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  float v51;
  BOOL v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  NSObject *v60;
  unint64_t var13;
  uint8_t buf[4];
  unint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)a3 + 11))
    return a7 == 0;
  v9 = a8 ? 2 : 32;
  if (!a7)
    return a7 == 0;
  if (v9 < a5)
    return a7 == 0;
  if (a5 < 1)
    return a7 == 0;
  v10 = a6;
  if ((int)(a7 + a6) > a2 || a7 % a5)
    return a7 == 0;
  v14 = 0;
  v15 = (a7 / a5);
  v16 = (char *)a3 + 116;
  v17 = a5;
  v18 = vdup_n_s32(0x42C80000u);
  v19 = (char *)a3 + 116;
  do
  {
    if (a8)
      v20 = (unsigned int *)v19;
    else
      v20 = (unsigned int *)v16;
    memcpy(v20, &a1[(v10 + v15 * v14)], v15);
    v21 = v20[2];
    v22 = bswap32(v20[1]);
    if (a4->var21 == 1)
      v23 = v20[1];
    else
      v23 = v22;
    v20[1] = v23;
    v24 = bswap32(v21);
    if (a4->var21 == 1)
      v25 = v21;
    else
      v25 = v24;
    v20[2] = v25;
    v26 = v20[4];
    v27 = bswap32(v20[3]);
    if (a4->var21 == 1)
      v28 = v20[3];
    else
      v28 = v27;
    v20[3] = v28;
    v29 = bswap32(v26);
    if (a4->var21 == 1)
      v30 = v26;
    else
      v30 = v29;
    v20[4] = v30;
    v31 = v20[6];
    v32 = bswap32(v20[5]);
    if (a4->var21 == 1)
      v33 = *((float *)v20 + 5);
    else
      v33 = *(float *)&v32;
    *((float *)v20 + 5) = v33;
    v34 = bswap32(v31);
    if (a4->var21 == 1)
      v35 = v31;
    else
      v35 = v34;
    v20[6] = v35;
    v36 = v20[8];
    v37 = bswap32(v20[7]);
    if (a4->var21 == 1)
      v38 = v20[7];
    else
      v38 = v37;
    v20[7] = v38;
    v40 = v20[9];
    v39 = v20[10];
    v41 = bswap32(v39);
    if (a4->var21 != 1)
      v39 = v41;
    v20[10] = v39;
    v42 = bswap32(v36);
    if (a4->var21 == 1)
      v43 = v36;
    else
      v43 = v42;
    v20[8] = v43;
    v44 = bswap32(v40);
    if (a4->var21 == 1)
      v45 = v40;
    else
      v45 = v44;
    v20[9] = v45;
    var21 = a4->var21;
    v47 = *((unsigned __int16 *)v20 + 22);
    v48 = bswap32(v47) >> 16;
    if (var21 != 1)
      LOWORD(v47) = v48;
    *((_WORD *)v20 + 22) = v47;
    v49 = *((unsigned __int16 *)v20 + 23);
    v50 = bswap32(v49) >> 16;
    if (var21 != 1)
      LOWORD(v49) = v50;
    *((_WORD *)v20 + 23) = v49;
    if (a8)
    {
      v51 = v33;
      v52 = var21 == 1;
      v53 = *((_DWORD *)v19 + 12);
      v54 = *((_DWORD *)v19 + 13);
      v55 = bswap32(v53);
      if (!v52)
        v53 = v55;
      *((_DWORD *)v19 + 12) = v53;
      v56 = bswap32(v54);
      if (a4->var21 == 1)
        v57 = v54;
      else
        v57 = v56;
      *((_DWORD *)v19 + 13) = v57;
      v58 = bswap32(*((_DWORD *)v19 + 14));
      if (a4->var21 == 1)
        v59 = *((_DWORD *)v19 + 14);
      else
        v59 = v58;
      *((_DWORD *)v19 + 14) = v59;
      *((_BYTE *)a3 + 113) = 1;
      *((_WORD *)v20 + 22) = v47 | 0x1000;
      if (v19[2] != 7 && a4->var47)
      {
        if (a4->var37)
          mt_CachePropertiesForDevice((uint64_t)a4);
        v60 = MTLoggingFramework();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          var13 = a4->var13;
          *(_DWORD *)buf = 134217984;
          v65 = var13;
          _os_log_impl(&dword_21A1DE000, v60, OS_LOG_TYPE_DEFAULT, "Non tstamp-synced contact detected. Clearing device timestamp offset (deviceID 0x%llX)", buf, 0xCu);
        }
        a4->var47 = 0;
        v51 = *((float *)v20 + 5);
        v10 = a6;
      }
      if (v51 == 0.0 || *((float *)v20 + 6) == 0.0)
        *(int32x2_t *)(v20 + 5) = v18;
    }
    else
    {
      *((_BYTE *)a3 + 112) = 1;
    }
    ++v14;
    v19 += 60;
    v16 += 48;
    --v17;
  }
  while (v17);
  return 1;
}

BOOL MTParse_V4BinaryPathPayload(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4, unsigned int a5, int a6, unsigned int a7)
{
  BOOL v8;
  BOOL v9;
  int v13;
  unsigned int v14;
  _WORD *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int var21;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;

  if (!a7)
    return a7 == 0;
  v8 = !*((_BYTE *)a3 + 11) || (int)a5 < 1;
  v9 = !v8 && (int)(a7 + a6) <= a2;
  if (!v9 || a7 % a5)
    return a7 == 0;
  v13 = 0;
  v14 = (a7 / a5);
  v15 = (_WORD *)((char *)a3 + 144);
  v16 = a5;
  do
  {
    if (v14 <= 0x13)
    {
      LOWORD(v33) = *(v15 - 5);
      LOWORD(v27) = *(v15 - 8);
      LOWORD(v29) = *(v15 - 7);
LABEL_47:
      v36 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, (__int16)v33, (__int16)v27, (__int16)v29);
      *(v15 - 4) = v36;
LABEL_48:
      *(v15 - 3) = v36;
LABEL_49:
      *(v15 - 2) = 0;
LABEL_50:
      LOWORD(v43) = 0;
      *(v15 - 1) = 0;
      goto LABEL_51;
    }
    v17 = &a1[a6 + v14 * v13];
    *((_BYTE *)v15 - 28) = *v17;
    *((_BYTE *)v15 - 27) = v17[1];
    *((_BYTE *)v15 - 26) = v17[2];
    *((_BYTE *)v15 - 25) = v17[3];
    var21 = a4->var21;
    v19 = *((unsigned __int16 *)v17 + 2);
    v20 = bswap32(v19) >> 16;
    if (var21 != 1)
      LOWORD(v19) = v20;
    *(v15 - 12) = v19;
    v21 = *((unsigned __int16 *)v17 + 3);
    v22 = bswap32(v21) >> 16;
    if (var21 != 1)
      LOWORD(v21) = v22;
    *(v15 - 11) = v21;
    v23 = *((unsigned __int16 *)v17 + 4);
    v24 = bswap32(v23) >> 16;
    if (var21 != 1)
      LOWORD(v23) = v24;
    *(v15 - 10) = v23;
    v25 = *((unsigned __int16 *)v17 + 5);
    v26 = bswap32(v25) >> 16;
    if (var21 != 1)
      LOWORD(v25) = v26;
    *(v15 - 9) = v25;
    v27 = *((unsigned __int16 *)v17 + 6);
    v28 = bswap32(v27) >> 16;
    if (var21 != 1)
      LOWORD(v27) = v28;
    *(v15 - 8) = v27;
    v29 = *((unsigned __int16 *)v17 + 7);
    v30 = bswap32(v29) >> 16;
    if (var21 != 1)
      LOWORD(v29) = v30;
    *(v15 - 7) = v29;
    v31 = *((unsigned __int16 *)v17 + 8);
    v32 = bswap32(v31) >> 16;
    if (var21 != 1)
      LOWORD(v31) = v32;
    *(v15 - 6) = v31;
    v33 = *((unsigned __int16 *)v17 + 9);
    v34 = bswap32(v33) >> 16;
    if (var21 != 1)
      LOWORD(v33) = v34;
    *(v15 - 5) = v33;
    if (v14 <= 0x15)
      goto LABEL_47;
    v35 = bswap32(*((unsigned __int16 *)v17 + 10)) >> 16;
    if (var21 == 1)
      v36 = *((_WORD *)v17 + 10);
    else
      v36 = v35;
    *(v15 - 4) = v36;
    if (v14 <= 0x17)
      goto LABEL_48;
    v37 = *((unsigned __int16 *)v17 + 11);
    v38 = bswap32(v37) >> 16;
    if (var21 != 1)
      LOWORD(v37) = v38;
    *(v15 - 3) = v37;
    if (v14 <= 0x19)
      goto LABEL_49;
    v39 = *((unsigned __int16 *)v17 + 12);
    v40 = bswap32(v39) >> 16;
    if (var21 != 1)
      LOWORD(v39) = v40;
    *(v15 - 2) = v39;
    if (v14 <= 0x1B)
      goto LABEL_50;
    v41 = *((unsigned __int16 *)v17 + 13);
    v42 = bswap32(v41) >> 16;
    if (var21 != 1)
      LOWORD(v41) = v42;
    *(v15 - 1) = v41;
    if (v14 < 0x1E)
    {
      LOWORD(v43) = 0;
    }
    else
    {
      v43 = *((unsigned __int16 *)v17 + 14);
      v44 = bswap32(v43) >> 16;
      if (var21 != 1)
        LOWORD(v43) = v44;
    }
LABEL_51:
    *v15 = v43;
    v15 += 15;
    ++v13;
    --v16;
  }
  while (v16);
  return 1;
}

BOOL MTParse_GenerateRingCentroids(MTParsedMultitouchFrameRep_t *a1, __MTDevice *a2)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  _OWORD *v5;
  unsigned __int8 v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = *((unsigned __int8 *)a1 + 72);
  if (*((_BYTE *)a1 + 72))
  {
    v3 = 0;
    v4 = 0;
    v5 = (_OWORD *)((char *)a1 + 116);
    v6 = *((_BYTE *)a1 + 72);
    do
    {
      if (a2->var84)
      {
        v7 = (char *)v5;
      }
      else
      {
        *((_BYTE *)a1 + 72) = v6 + 1;
        if ((v6 + 1) > 2u)
          return v4;
        v7 = (char *)a1 + 60 * v6 + 116;
        v9 = v5[1];
        v8 = v5[2];
        v10 = *v5;
        *(_OWORD *)(v7 + 44) = *(_OWORD *)((char *)v5 + 44);
        *((_OWORD *)v7 + 1) = v9;
        *((_OWORD *)v7 + 2) = v8;
        *(_OWORD *)v7 = v10;
        *v7 = 1;
        ++v6;
      }
      ++v7[2];
      *(float32x2_t *)(v7 + 4) = vadd_f32(*(float32x2_t *)(v7 + 52), *(float32x2_t *)(v7 + 4));
      *((_DWORD *)v7 + 13) = 0;
      *((_DWORD *)v7 + 14) = 0;
      v4 = ++v3 >= v2;
      v5 = (_OWORD *)((char *)v5 + 60);
    }
    while (v2 != v3);
  }
  v4 = 1;
  *((_BYTE *)a1 + 10) = 1;
  return v4;
}

uint64_t MTParse_V4PrecisePathAndImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result;
  int v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  int v14;
  unsigned __int8 *v15;
  unsigned int var21;
  unsigned int v17;
  BOOL v18;
  __int16 v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v25;
  _BOOL4 RingCentroids;
  int v27;
  unsigned int v28;

  result = MTParse_V4BinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if (!(_DWORD)result)
    return result;
  v9 = *(unsigned __int8 *)(a3 + 94);
  v10 = *(unsigned __int16 *)(a3 + 96);
  v11 = *(unsigned __int8 *)(a3 + 82);
  v12 = v11 + v9;
  if (*(_BYTE *)(a3 + 94))
  {
    if (v9 == 6 && v12 <= a2)
    {
      v15 = &a1[v11];
      var21 = a4->var21;
      v17 = bswap32(*(unsigned __int16 *)v15) >> 16;
      v18 = var21 == 1;
      if (var21 == 1)
        v19 = *(_WORD *)v15;
      else
        v19 = v17;
      *(_WORD *)(a3 + 56) = v19;
      v20 = *((unsigned __int16 *)v15 + 1);
      v21 = bswap32(v20) >> 16;
      if (!v18)
        LOWORD(v20) = v21;
      *(_WORD *)(a3 + 58) = v20;
      v22 = *((unsigned __int16 *)v15 + 2);
      v23 = bswap32(v22) >> 16;
      if (!v18)
        LOWORD(v22) = v23;
      *(_WORD *)(a3 + 60) = v22;
      v14 = 1;
      *(_BYTE *)(a3 + 13) = 1;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 1;
  }
  v24 = *(unsigned __int16 *)(a3 + 98);
  v25 = *(unsigned __int8 *)(a3 + 80);
  if (v25 != 119)
  {
    if (v25 == 118)
    {
      RingCentroids = MTParse_PrecisePathPayload(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4, *(unsigned __int8 *)(a3 + 102), v12, v10, 0);
      goto LABEL_26;
    }
    if (v25 == 117)
    {
      RingCentroids = MTParse_V4BinaryPathPayload(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4, *(unsigned __int8 *)(a3 + 102), v12, v10);
LABEL_26:
      v27 = RingCentroids;
      goto LABEL_27;
    }
LABEL_24:
    v27 = 0;
    goto LABEL_27;
  }
  if (!MTParse_PrecisePathPayload(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4, *(unsigned __int8 *)(a3 + 102), v12, v10, 1))goto LABEL_24;
  if (a4->var83)
  {
    RingCentroids = MTParse_GenerateRingCentroids((MTParsedMultitouchFrameRep_t *)a3, a4);
    goto LABEL_26;
  }
  v27 = 1;
LABEL_27:
  if (*(_BYTE *)(a3 + 12) && v24 && v24 + (unsigned __int16)(v10 + v12) <= a2)
    v28 = MTParse_BinaryImagePayload(&a1[(unsigned __int16)(v10 + v12)], v24, (MTParsedMultitouchFrameRep_t *)a3, a4);
  else
    v28 = v24 == 0;
  if (v14)
    return v27 & v28;
  else
    return 0;
}

uint64_t MTParse_HostPathAndImage(_OWORD *a1, signed int a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  uint64_t v14;
  int16x8_t v15;
  int v16;
  int v17;
  int v18;
  int v19;

  if (a2 < 0x1C)
    return 0;
  v4 = *(_OWORD *)((char *)a1 + 12);
  *(_OWORD *)(a3 + 80) = *a1;
  *(_OWORD *)(a3 + 92) = v4;
  *(_BYTE *)(a3 + 8) = *(_BYTE *)(a3 + 80);
  *(_BYTE *)(a3 + 9) = 0;
  *(_BYTE *)(a3 + 15) = *(_BYTE *)(a3 + 83);
  *(_BYTE *)(a3 + 16) = *(_BYTE *)(a3 + 81);
  *(_WORD *)(a3 + 62) = *(_WORD *)(a3 + 102);
  *(_BYTE *)(a3 + 64) = *(_BYTE *)(a3 + 104);
  *(_WORD *)(a3 + 66) = *(_WORD *)(a3 + 98);
  *(_DWORD *)(a3 + 68) = *(unsigned __int16 *)(a3 + 100);
  v5 = *(unsigned __int8 *)(a3 + 96);
  v6 = *(_BYTE *)(a3 + 96) != 0;
  *(_BYTE *)(a3 + 72) = v5;
  v8 = *(unsigned int *)(a3 + 84);
  v7 = *(_DWORD *)(a3 + 88);
  *(_DWORD *)(a3 + 73) = v7;
  *(_DWORD *)(a3 + 36) = 272;
  *(_BYTE *)(a3 + 52) = 0;
  *(_BYTE *)(a3 + 54) = v7;
  *(_QWORD *)a3 = v8;
  *(_BYTE *)(a3 + 11) = v6;
  v9 = *(unsigned __int16 *)(a3 + 94);
  *(_BYTE *)(a3 + 12) = *(_WORD *)(a3 + 94) != 0;
  *(_BYTE *)(a3 + 113) = 1;
  if ((_DWORD)v5)
  {
    v10 = 0;
    v11 = 60 * v5;
    v12 = 124;
    v13 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    while (v12 <= a2)
    {
      v14 = a3 + v10;
      v15 = *(int16x8_t *)((char *)a1 + v12 - 80);
      *(int16x4_t *)v15.i8 = vmovn_s32((int32x4_t)v15);
      *(_DWORD *)(v14 + 116) = vmovn_s16(v15).u32[0];
      *(float32x4_t *)(v14 + 120) = vmulq_f32(*(float32x4_t *)((char *)a1 + v12 - 28), v13);
      *(float32x2_t *)(v14 + 136) = vmul_f32(*(float32x2_t *)((char *)a1 + v12 - 36), *(float32x2_t *)v13.f32);
      v16 = *(_DWORD *)((char *)a1 + v12 - 44);
      v17 = *(_DWORD *)((char *)a1 + v12 - 48);
      *(_DWORD *)(v14 + 144) = *(_DWORD *)((char *)a1 + v12 - 40);
      *(_DWORD *)(v14 + 148) = v17;
      v18 = *(_DWORD *)((char *)a1 + v12 - 8);
      *(_DWORD *)(v14 + 152) = *(_DWORD *)((char *)a1 + v12 - 4);
      *(_DWORD *)(v14 + 156) = v16;
      *(_WORD *)(v14 + 160) = *(_WORD *)((char *)a1 + v12 - 12);
      *(_DWORD *)(v14 + 164) = v18;
      *(_QWORD *)(v14 + 168) = 0;
      v10 += 60;
      v12 += 96;
      if (v11 == v10)
      {
        v19 = v12 - 96;
        goto LABEL_9;
      }
    }
    return 0;
  }
  v19 = 28;
LABEL_9:
  if (v19 + (int)v9 > a2)
    return 0;
  memcpy(*(void **)(a3 + 40), (char *)a1 + v19, v9);
  return 1;
}

BOOL MTParse_SensorImageHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  BOOL v5;
  _BOOL8 result;
  char v7;
  unsigned __int8 v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned int var21;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  __int16 v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;

  if (a1)
    v5 = a2 <= 7;
  else
    v5 = 1;
  result = !v5;
  if (result)
  {
    *((_OWORD *)a3 + 5) = 0u;
    *((_OWORD *)a3 + 6) = 0u;
    v7 = *a1;
    *((_BYTE *)a3 + 80) = *a1;
    v8 = a1[1];
    *((_BYTE *)a3 + 81) = v8;
    v9 = a1[2];
    *((_BYTE *)a3 + 82) = v9;
    v10 = a1[3];
    *((_BYTE *)a3 + 83) = v10;
    var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    v13 = bswap32(v12);
    if (var21 == 1)
      v12 = v12;
    else
      v12 = v13;
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      v32 = 0;
      v14 = 0;
      v17 = 0;
      LOWORD(v18) = 0;
      LOWORD(v26) = 0;
      LOWORD(v20) = 0;
      v31 = 0;
      v28 = 0;
    }
    else
    {
      *((_BYTE *)a3 + 88) = a1[8];
      *((_BYTE *)a3 + 89) = a1[9];
      v14 = a1[10];
      *((_BYTE *)a3 + 90) = v14;
      *((_BYTE *)a3 + 91) = a1[11];
      v15 = bswap32(*((unsigned __int16 *)a1 + 6)) >> 16;
      v16 = var21 == 1;
      if (var21 == 1)
        v17 = *((_WORD *)a1 + 6);
      else
        v17 = v15;
      *((_WORD *)a3 + 46) = v17;
      v18 = *((unsigned __int16 *)a1 + 7);
      v19 = bswap32(v18) >> 16;
      if (!v16)
        LOWORD(v18) = v19;
      *((_WORD *)a3 + 47) = v18;
      v20 = *((unsigned __int16 *)a1 + 8);
      v21 = bswap32(v20) >> 16;
      if (!v16)
        LOWORD(v20) = v21;
      *((_WORD *)a3 + 48) = v20;
      v22 = *((unsigned __int16 *)a1 + 9);
      v23 = bswap32(v22) >> 16;
      if (!v16)
        LOWORD(v22) = v23;
      *((_WORD *)a3 + 49) = v22;
      v24 = *((unsigned __int16 *)a1 + 10);
      v25 = bswap32(v24) >> 16;
      if (!v16)
        LOWORD(v24) = v25;
      *((_WORD *)a3 + 50) = v24;
      v26 = *((unsigned __int16 *)a1 + 11);
      v27 = bswap32(v26) >> 16;
      if (!v16)
        LOWORD(v26) = v27;
      *((_WORD *)a3 + 51) = v26;
      v28 = *((_DWORD *)a1 + 6);
      v29 = bswap32(v28);
      if (!v16)
        v28 = v29;
      *((_DWORD *)a3 + 26) = v28;
      v30 = *((_DWORD *)a1 + 7);
      v31 = bswap32(v30);
      if (v16)
        v31 = v30;
      *((_DWORD *)a3 + 27) = v31;
      v32 = *((_DWORD *)a3 + 22);
    }
    *((_BYTE *)a3 + 8) = v7;
    *((_BYTE *)a3 + 9) = 0;
    *((_BYTE *)a3 + 15) = v10;
    *((_BYTE *)a3 + 16) = v8;
    *((_DWORD *)a3 + 5) = v28;
    *((_DWORD *)a3 + 6) = v31;
    *((_WORD *)a3 + 17) = v20;
    *((_WORD *)a3 + 16) = v26;
    *((_WORD *)a3 + 15) = v18;
    *((_WORD *)a3 + 14) = v17;
    *((_BYTE *)a3 + 37) = (v14 & 4) != 0;
    *((_BYTE *)a3 + 38) = (v14 & 8) != 0;
    *((_BYTE *)a3 + 39) = v14 >> 7;
    *(_DWORD *)((char *)a3 + 73) = v32;
    *(_WORD *)((char *)a3 + 11) = 256;
    *((_BYTE *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((_BYTE *)a3 + 54) = v32;
    *(_QWORD *)a3 = v12;
  }
  return result;
}

uint64_t MTParse_SensorImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result;
  int v9;
  BOOL v10;
  uint64_t v11;

  result = MTParse_SensorImageHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if ((_DWORD)result)
  {
    v9 = *(unsigned __int16 *)(a3 + 98);
    if (*(_BYTE *)(a3 + 12))
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
      return v9 == 0;
    v11 = *(unsigned __int8 *)(a3 + 82);
    if ((int)v11 + v9 > a2)
      return v9 == 0;
    else
      return MTParse_BinaryImagePayload(&a1[v11], v9, (MTParsedMultitouchFrameRep_t *)a3, a4);
  }
  return result;
}

BOOL MTParse_BinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  BOOL v5;
  _BOOL8 result;
  int v7;
  unsigned __int8 v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int var21;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned __int8 v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned __int8 v24;
  __int16 v25;
  unsigned int v26;
  int v27;

  if (a1)
    v5 = a2 <= 7;
  else
    v5 = 1;
  result = !v5;
  if (result)
  {
    *((_QWORD *)a3 + 10) = 0;
    *((_QWORD *)a3 + 11) = 0;
    *((_DWORD *)a3 + 26) = 0;
    *((_QWORD *)a3 + 12) = 0;
    v7 = *a1;
    *((_BYTE *)a3 + 80) = v7;
    v8 = a1[1];
    *((_BYTE *)a3 + 81) = v8;
    v9 = a1[2];
    *((_BYTE *)a3 + 82) = v9;
    v10 = a1[3];
    *((_BYTE *)a3 + 83) = v10;
    var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    v13 = bswap32(v12);
    if (var21 == 1)
      v12 = v12;
    else
      v12 = v13;
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      v19 = 0;
      LOWORD(v22) = 0;
      LOWORD(v20) = 0;
      v24 = 0;
      v25 = 0;
      v14 = 0;
    }
    else
    {
      *((_BYTE *)a3 + 88) = a1[8];
      *((_BYTE *)a3 + 89) = a1[9];
      v14 = a1[10];
      *((_BYTE *)a3 + 90) = v14;
      *((_BYTE *)a3 + 91) = a1[11];
      v15 = *((unsigned __int16 *)a1 + 6);
      v16 = bswap32(v15) >> 16;
      if (var21 != 1)
        LOWORD(v15) = v16;
      *((_WORD *)a3 + 46) = v15;
      v17 = *((unsigned __int16 *)a1 + 7);
      v18 = bswap32(v17) >> 16;
      if (var21 != 1)
        LOWORD(v17) = v18;
      *((_WORD *)a3 + 47) = v17;
      if (v9 < 0x16)
      {
        v19 = 0;
        LOWORD(v22) = 0;
        LOWORD(v20) = 0;
      }
      else
      {
        v19 = a1[16];
        *((_BYTE *)a3 + 96) = v19;
        *((_BYTE *)a3 + 97) = a1[17];
        v20 = *((unsigned __int16 *)a1 + 9);
        v21 = bswap32(v20) >> 16;
        if (var21 != 1)
          LOWORD(v20) = v21;
        *((_WORD *)a3 + 49) = v20;
        if (v10 < 2)
        {
          LOWORD(v22) = 0;
        }
        else
        {
          v22 = *((unsigned __int16 *)a1 + 10);
          v23 = bswap32(v22) >> 16;
          if (var21 != 1)
            LOWORD(v22) = v23;
        }
        *((_WORD *)a3 + 50) = v22;
        if (v9 >= 0x18)
        {
          v26 = bswap32(*((unsigned __int16 *)a1 + 11)) >> 16;
          if (var21 == 1)
            v25 = *((_WORD *)a1 + 11);
          else
            v25 = v26;
          *((_WORD *)a3 + 51) = v25;
          if (v9 == 24)
          {
            v24 = 0;
          }
          else
          {
            v24 = a1[24];
            *((_BYTE *)a3 + 104) = v24;
          }
          goto LABEL_32;
        }
      }
      v24 = 0;
      v25 = 0;
    }
LABEL_32:
    *((_BYTE *)a3 + 8) = v7;
    *((_BYTE *)a3 + 9) = 0;
    *((_BYTE *)a3 + 15) = v10;
    *((_BYTE *)a3 + 16) = v8;
    *((_BYTE *)a3 + 37) = (v14 & 4) != 0;
    *((_BYTE *)a3 + 38) = (v14 & 8) != 0;
    *((_BYTE *)a3 + 39) = v14 >> 7;
    *((_WORD *)a3 + 31) = v25;
    *((_BYTE *)a3 + 64) = v24;
    *((_WORD *)a3 + 33) = v20;
    *((_DWORD *)a3 + 17) = (unsigned __int16)v22;
    *((_BYTE *)a3 + 72) = v19;
    v27 = *((_DWORD *)a3 + 22);
    *(_DWORD *)((char *)a3 + 73) = v27;
    *((_BYTE *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((_BYTE *)a3 + 52) = 0;
    *((_BYTE *)a3 + 54) = v27;
    *(_QWORD *)a3 = v12;
    *((_BYTE *)a3 + 12) = v7 == 69;
    *((_BYTE *)a3 + 11) = v7 == 69;
  }
  return result;
}

uint64_t MTParse_BinaryPathOrImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _WORD *i;
  unsigned __int8 *v14;
  unsigned int var21;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  __int16 v42;

  result = MTParse_BinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if ((_DWORD)result)
  {
    v9 = *(unsigned __int16 *)(a3 + 94);
    if (*(_WORD *)(a3 + 94) && (v10 = *(unsigned __int8 *)(a3 + 82), (int)v10 + v9 <= a2))
    {
      result = MTParse_BinaryImagePayload(&a1[v10], v9, (MTParsedMultitouchFrameRep_t *)a3, a4);
      v9 = *(unsigned __int16 *)(a3 + 94);
    }
    else
    {
      result = 0;
    }
    v11 = *(unsigned __int8 *)(a3 + 97);
    if (v9 + *(unsigned __int8 *)(a3 + 82) + *(unsigned __int8 *)(a3 + 96) * (int)v11 <= a2)
    {
      if (*(_BYTE *)(a3 + 96))
      {
        v12 = 0;
        for (i = (_WORD *)(a3 + 144); ; i += 15)
        {
          v14 = &a1[*(unsigned __int16 *)(a3 + 94) + *(unsigned __int8 *)(a3 + 82) + (_DWORD)v12 * (_DWORD)v11];
          if (v11 <= 0x13)
            break;
          *((_BYTE *)i - 28) = *v14;
          *((_BYTE *)i - 27) = v14[1];
          *((_BYTE *)i - 26) = v14[2];
          *((_BYTE *)i - 25) = v14[3];
          var21 = a4->var21;
          v16 = *((unsigned __int16 *)v14 + 2);
          v17 = bswap32(v16) >> 16;
          if (var21 != 1)
            LOWORD(v16) = v17;
          *(i - 12) = v16;
          v18 = *((unsigned __int16 *)v14 + 3);
          v19 = bswap32(v18) >> 16;
          if (var21 != 1)
            LOWORD(v18) = v19;
          *(i - 11) = v18;
          v20 = *((unsigned __int16 *)v14 + 4);
          v21 = bswap32(v20) >> 16;
          if (var21 != 1)
            LOWORD(v20) = v21;
          *(i - 10) = v20;
          v22 = *((unsigned __int16 *)v14 + 5);
          v23 = bswap32(v22) >> 16;
          if (var21 != 1)
            LOWORD(v22) = v23;
          *(i - 9) = v22;
          v24 = *((unsigned __int16 *)v14 + 6);
          v25 = bswap32(v24) >> 16;
          if (var21 != 1)
            LOWORD(v24) = v25;
          *(i - 8) = v24;
          v26 = *((unsigned __int16 *)v14 + 7);
          v27 = bswap32(v26) >> 16;
          if (var21 != 1)
            LOWORD(v26) = v27;
          *(i - 7) = v26;
          v28 = *((unsigned __int16 *)v14 + 8);
          v29 = bswap32(v28) >> 16;
          if (var21 != 1)
            LOWORD(v28) = v29;
          *(i - 6) = v28;
          v30 = *((unsigned __int16 *)v14 + 9);
          v31 = bswap32(v30) >> 16;
          if (var21 != 1)
            LOWORD(v30) = v31;
          *(i - 5) = v30;
          if (v11 < 0x16)
            goto LABEL_32;
          v32 = bswap32(*((unsigned __int16 *)v14 + 10)) >> 16;
          if (var21 == 1)
            v33 = *((_WORD *)v14 + 10);
          else
            v33 = v32;
          *(i - 4) = v33;
LABEL_33:
          if (v11 <= 0x17)
          {
            *(i - 3) = v33;
LABEL_47:
            *(i - 2) = 0;
            goto LABEL_48;
          }
          v34 = a4->var21;
          v35 = *((unsigned __int16 *)v14 + 11);
          v36 = bswap32(v35) >> 16;
          if (v34 != 1)
            LOWORD(v35) = v36;
          *(i - 3) = v35;
          if (v11 <= 0x19)
            goto LABEL_47;
          v37 = *((unsigned __int16 *)v14 + 12);
          v38 = bswap32(v37) >> 16;
          if (v34 != 1)
            LOWORD(v37) = v38;
          *(i - 2) = v37;
          if (v11 > 0x1B)
          {
            v39 = *((unsigned __int16 *)v14 + 13);
            v40 = bswap32(v39) >> 16;
            if (v34 != 1)
              LOWORD(v39) = v40;
            *(i - 1) = v39;
            if (v11 < 0x1E)
            {
              v42 = 0;
            }
            else
            {
              v41 = bswap32(*((unsigned __int16 *)v14 + 14)) >> 16;
              if (v34 == 1)
                v42 = *((_WORD *)v14 + 14);
              else
                v42 = v41;
            }
            goto LABEL_49;
          }
LABEL_48:
          v42 = 0;
          *(i - 1) = 0;
LABEL_49:
          *i = v42;
          if (++v12 >= (unint64_t)*(unsigned __int8 *)(a3 + 96))
            return 1;
        }
        LOWORD(v30) = *(i - 5);
        LOWORD(v24) = *(i - 8);
        LOWORD(v26) = *(i - 7);
LABEL_32:
        v33 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, (__int16)v30, (__int16)v24, (__int16)v26);
        *(i - 4) = v33;
        v11 = *(unsigned __int8 *)(a3 + 97);
        goto LABEL_33;
      }
      return 1;
    }
  }
  return result;
}

uint64_t MTParse_TimestampSync(const void *a1, unsigned int a2, uint64_t a3)
{
  size_t v5;
  uint64_t v7;
  _QWORD __dst[3];

  memset(__dst, 170, 20);
  if (a2 > 0x14)
    return 0;
  v5 = a2;
  bzero((char *)__dst + a2, 20 - a2);
  memcpy(__dst, a1, v5);
  if (BYTE1(__dst[0]) != 255)
    return 0;
  if (*(_QWORD *)((char *)&__dst[1] + 4))
  {
    v7 = *(_QWORD *)((char *)&__dst[1] + 4) - *(_QWORD *)((char *)__dst + 4);
    if (*(_QWORD *)((char *)&__dst[1] + 4) == *(_QWORD *)((char *)__dst + 4))
      v7 = 1;
    *(_QWORD *)(a3 + 184) = v7;
  }
  else
  {
    *(_QWORD *)(a3 + 184) = 0;
  }
  return 1;
}

uint64_t MTParse_ExternalMessage(uint64_t a1, int a2, _QWORD *a3, _WORD *a4, _DWORD *a5)
{
  unint64_t v5;
  __int16 v7;

  if ((*(_BYTE *)(a1 + 1) & 0xFE) != 2)
    return 0;
  v5 = *(unsigned __int16 *)(a1 + 2);
  if (a2 - 6 < v5)
    return 0;
  v7 = *(_WORD *)(a1 + 4);
  *a3 = a1 + 6;
  *a4 = v7;
  *a5 = v5;
  return 1;
}

uint64_t MTProcess_0xC5_Data(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  int v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int var21;
  unsigned int v14;
  BOOL v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  char v19;
  unsigned int v20;

  v8 = *a1;
  *((_BYTE *)a3 + 8) = v8;
  *((_BYTE *)a3 + 16) = a1[1];
  if (v8 == 198)
  {
    var21 = a4->var21;
    v14 = bswap32(*((unsigned __int16 *)a1 + 4)) >> 16;
    v15 = var21 == 1;
    if (var21 == 1)
      v16 = *((_WORD *)a1 + 4);
    else
      v16 = v14;
    *((_BYTE *)a3 + 37) = (v16 & 4) != 0;
    LODWORD(v17) = *((_DWORD *)a1 + 1);
    v18 = bswap32(v17);
    if (v15)
      v17 = v17;
    else
      v17 = v18;
    if ((v16 & 2) != 0)
      v19 = 16;
    else
      v19 = 8;
    *((_BYTE *)a3 + 36) = v19;
    *((_BYTE *)a3 + 38) = v16 & 1;
    *((_BYTE *)a3 + 39) = v16 < 0;
    *((_BYTE *)a3 + 52) = a1[2];
    *((_BYTE *)a3 + 54) = a1[3];
    *(_QWORD *)a3 = v17;
    v20 = a1[10];
  }
  else
  {
    if (v8 == 197)
    {
      *((_BYTE *)a3 + 37) = (a1[2] & 4) != 0;
      if ((a1[2] & 2) != 0)
        v9 = 16;
      else
        v9 = 8;
      *((_BYTE *)a3 + 36) = v9;
      *((_BYTE *)a3 + 38) = a1[2] & 1;
      *((_BYTE *)a3 + 39) = a1[2] >> 7;
      *((_BYTE *)a3 + 52) = a1[3];
      *((_BYTE *)a3 + 54) = a1[4];
      v10 = *(_DWORD *)(a1 + 6);
      v11 = bswap32(v10);
      if (a4->var21 == 1)
        v12 = v10;
      else
        v12 = v11;
      *(_QWORD *)a3 = v12;
    }
    else
    {
      printf("Unknown data format %x\n", v8);
    }
    v20 = 10;
  }
  return MTParse_BinaryImagePayload(&a1[v20], a2 - v20, a3, a4);
}

uint64_t MTProcess_0xCC_Data(unsigned __int8 *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  BOOL v19;
  unsigned int v20;
  unsigned int v21;
  __int16 v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unsigned __int16 *v26;
  int16x4_t *v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  BOOL v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  _WORD *v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;

  v4 = 0;
  if (!a1 || a2 < 10)
    return v4;
  *(_QWORD *)(a3 + 80) = 0;
  *(_QWORD *)(a3 + 88) = 0;
  *(_DWORD *)(a3 + 104) = 0;
  *(_QWORD *)(a3 + 96) = 0;
  v5 = 10;
  *(_BYTE *)(a3 + 82) = 10;
  v6 = *a1;
  *(_BYTE *)(a3 + 80) = v6;
  v7 = a1[1];
  *(_BYTE *)(a3 + 81) = v7;
  v8 = a1[2];
  v9 = a1[3];
  *(_BYTE *)(a3 + 96) = v9;
  if (v6 != 206)
  {
    LOBYTE(v10) = 0;
LABEL_10:
    v17 = *(_DWORD *)(a4 + 100);
    v18 = bswap32(*((unsigned __int16 *)a1 + 2)) >> 16;
    v19 = v17 == 1;
    if (v17 == 1)
      LOWORD(v15) = *((_WORD *)a1 + 2);
    else
      LOWORD(v15) = v18;
    v12 = *(_DWORD *)(a1 + 6);
    v20 = bswap32(v12);
    if (!v19)
      v12 = v20;
    goto LABEL_15;
  }
  v5 = a1[10];
  *(_BYTE *)(a3 + 82) = v5;
  v10 = a1[11];
  *(_BYTE *)(a3 + 83) = v10;
  if (v10 < 2)
    goto LABEL_10;
  v11 = *(_DWORD *)(a4 + 100);
  v12 = *((_DWORD *)a1 + 1);
  v13 = bswap32(v12);
  v14 = v11 == 1;
  if (v11 != 1)
    v12 = v13;
  v15 = *((unsigned __int16 *)a1 + 4);
  v16 = bswap32(v15) >> 16;
  if (!v14)
    LOWORD(v15) = v16;
LABEL_15:
  *(_DWORD *)(a3 + 84) = v12;
  *(_WORD *)(a3 + 102) = v15;
  *(_BYTE *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 9) = 0;
  *(_BYTE *)(a3 + 15) = v10;
  *(_BYTE *)(a3 + 16) = v7;
  *(_WORD *)(a3 + 36) = 264;
  *(_BYTE *)(a3 + 52) = v8;
  *(_BYTE *)(a3 + 54) = 0;
  *(_QWORD *)a3 = v12;
  *(_WORD *)(a3 + 62) = v15;
  *(_WORD *)(a3 + 66) = 0;
  *(_DWORD *)(a3 + 68) = 0;
  *(_BYTE *)(a3 + 72) = v9;
  *(_DWORD *)(a3 + 73) = 0;
  if (v5 >= 0x14)
  {
    v21 = bswap32(*((unsigned __int16 *)a1 + 8)) >> 16;
    if (*(_DWORD *)(a4 + 100) == 1)
      v22 = *((_WORD *)a1 + 8);
    else
      v22 = v21;
    *(_WORD *)(a3 + 98) = v22;
  }
  if (v5 + 32 * (_DWORD)v9 > a2)
    return 0;
  if ((_DWORD)v9)
  {
    v23 = 0;
    v24 = *(_DWORD *)(a4 + 100);
    v25 = 30 * v9;
    v26 = (unsigned __int16 *)&a1[v5 + 16];
    do
    {
      v27 = (int16x4_t *)(a3 + v23);
      v27[14].i8[4] = *((_BYTE *)v26 - 16);
      v27[14].i8[5] = *((_BYTE *)v26 - 15);
      v27[14].i8[6] = *((_BYTE *)v26 - 14);
      v27[14].i8[7] = *((_BYTE *)v26 - 13);
      v28 = *(_DWORD *)(a4 + 100);
      if (v6 == 204)
      {
        LOWORD(v29) = 0;
        v27[15] = vmovn_s32((int32x4_t)vshlq_u32((uint32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v28 == 1)), 0x1FuLL)), *(int8x16_t *)(v26 - 6), vrev32q_s8(*(int8x16_t *)(v26 - 6))), (uint32x4_t)xmmword_21A1FCF00));
        v27[17].i16[0] = 0;
      }
      else
      {
        v30 = *(v26 - 6);
        v31 = bswap32(v30) >> 16;
        v32 = v28 == 1;
        if (v28 != 1)
          LOWORD(v30) = v31;
        v27[15].i16[0] = v30;
        v33 = *(v26 - 5);
        v34 = bswap32(v33) >> 16;
        if (!v32)
          LOWORD(v33) = v34;
        v27[15].i16[1] = v33;
        v35 = *(v26 - 4);
        v36 = bswap32(v35) >> 16;
        if (!v32)
          LOWORD(v35) = v36;
        v27[15].i16[2] = v35;
        v37 = *(v26 - 3);
        v38 = bswap32(v37) >> 16;
        if (!v32)
          LOWORD(v37) = v38;
        v27[15].i16[3] = v37;
        v39 = *v26;
        v40 = bswap32(v39) >> 16;
        if (!v32)
          LOWORD(v39) = v40;
        v27[17].i16[0] = v39;
        v29 = bswap32(v26[1]) >> 16;
        if (v32)
          LOWORD(v29) = v26[1];
      }
      v41 = (_WORD *)(a3 + v23);
      *(_WORD *)(a3 + v23 + 140) = v29;
      v42 = v26[2];
      v43 = bswap32(v42) >> 16;
      if (v24 != 1)
        LOWORD(v42) = v43;
      v41[67] = v42;
      v44 = v26[3];
      v45 = bswap32(v44) >> 16;
      if (v24 != 1)
        LOWORD(v44) = v45;
      v41[69] = v44;
      v46 = v26[4];
      v47 = bswap32(v46) >> 16;
      if (v24 != 1)
        LOWORD(v46) = v47;
      v41[71] = v46;
      v48 = v26[5];
      v49 = bswap32(v48) >> 16;
      if (v24 != 1)
        LOWORD(v48) = v49;
      v41[66] = v48;
      v50 = v26[6];
      v51 = bswap32(v50) >> 16;
      if (v24 != 1)
        LOWORD(v50) = v51;
      v41[64] = v50;
      v52 = v26[7];
      v53 = bswap32(v52) >> 16;
      if (v24 != 1)
        LOWORD(v52) = v53;
      v41[65] = v52;
      v41[72] = 0;
      v23 += 30;
      v26 += 16;
    }
    while (v25 != v23);
  }
  return 1;
}

uint64_t MTParseSensorRegionsReport(unsigned __int8 *a1, int a2, char *a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;

  result = 0;
  if (a3)
  {
    if (a4 >= 1)
    {
      bzero(a3, 7 * a4);
      result = 0;
      if (a1)
      {
        if (a2 >= 1)
        {
          LODWORD(v9) = (a2 - 1) / 7u;
          result = 0;
          v9 = v9 >= *a1 ? *a1 : v9;
          if ((_DWORD)v9)
          {
            v10 = (char *)(a1 + 3);
            do
            {
              v11 = *(v10 - 2);
              if ((int)v11 < a4)
              {
                v12 = &a3[8 * v11 - v11];
                *v12 = v11;
                v12[1] = *(v10 - 1);
                v12[2] = *v10;
                v13 = v10[1];
                if (v13 <= 1)
                  LOBYTE(v13) = 1;
                v12[3] = v13;
                v12[4] = v10[2];
                v12[5] = v10[3];
                v12[6] = v10[4];
                result = (result + 1);
              }
              v10 += 7;
              --v9;
            }
            while (v9);
          }
        }
      }
    }
  }
  return result;
}

uint64_t MTParseSensorRegionParam(unsigned __int16 *a1, int a2, _WORD *a3, uint64_t a4)
{
  BOOL v4;
  BOOL v5;
  int v6;
  int v7;
  unsigned int v8;
  BOOL v9;
  __int16 v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  if (a1)
    v4 = a2 == 6;
  else
    v4 = 0;
  v5 = !v4 || a3 == 0;
  v6 = v5;
  if (!v5)
  {
    v7 = *(_DWORD *)(a4 + 100);
    v8 = bswap32(*a1) >> 16;
    v9 = v7 == 1;
    if (v7 == 1)
      v10 = *a1;
    else
      v10 = v8;
    *a3 = v10;
    v11 = a1[1];
    v12 = bswap32(v11) >> 16;
    if (!v9)
      LOWORD(v11) = v12;
    a3[1] = v11;
    v13 = a1[2];
    v14 = bswap32(v13) >> 16;
    if (!v9)
      LOWORD(v13) = v14;
    a3[2] = v13;
  }
  return v6 ^ 1u;
}

uint64_t MTParseSensorSurfaceDescriptor(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  BOOL v5;
  int v6;
  int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;

  if (a1)
    v4 = a2 == 16;
  else
    v4 = 0;
  v5 = !v4 || a3 == 0;
  v6 = v5;
  if (!v5)
  {
    v7 = *(_DWORD *)(a4 + 100);
    v8 = bswap32(*(_DWORD *)a1);
    v9 = v7 == 1;
    if (v7 == 1)
      v10 = *(_DWORD *)a1;
    else
      v10 = v8;
    *(_DWORD *)a3 = v10;
    v11 = *(_DWORD *)(a1 + 4);
    v12 = bswap32(v11);
    if (!v9)
      v11 = v12;
    *(_DWORD *)(a3 + 4) = v11;
    v13 = *(unsigned __int16 *)(a1 + 8);
    v14 = bswap32(v13) >> 16;
    if (!v9)
      LOWORD(v13) = v14;
    *(_WORD *)(a3 + 8) = v13;
    v15 = *(unsigned __int16 *)(a1 + 10);
    v16 = bswap32(v15) >> 16;
    if (!v9)
      LOWORD(v15) = v16;
    *(_WORD *)(a3 + 10) = v15;
    v17 = *(unsigned __int16 *)(a1 + 12);
    v18 = bswap32(v17) >> 16;
    if (!v9)
      LOWORD(v17) = v18;
    *(_WORD *)(a3 + 12) = v17;
    v19 = *(unsigned __int16 *)(a1 + 14);
    v20 = bswap32(v19) >> 16;
    if (!v9)
      LOWORD(v19) = v20;
    *(_WORD *)(a3 + 14) = v19;
  }
  return v6 ^ 1u;
}

uint64_t MTParse_HIDMouseReport(_BYTE *a1, int a2, _BYTE *a3)
{
  BOOL v3;
  BOOL v4;
  int v5;
  char v6;

  if (a1)
    v3 = a3 == 0;
  else
    v3 = 1;
  v4 = v3 || a2 < 4;
  v5 = v4;
  if (!v4)
  {
    *a3 = *a1;
    a3[1] = a1[1];
    a3[2] = a1[2];
    a3[3] = a1[3];
    if (a2 < 5)
    {
      v6 = 0;
      a3[4] = 0;
    }
    else
    {
      a3[4] = a1[4];
      v6 = a1[5];
    }
    a3[5] = v6;
  }
  return v5 ^ 1u;
}

uint64_t MTParse_HIDRelativePointerReport(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;

  v3 = 0;
  if (a2 >= 24 && a1 && a3)
  {
    *(_BYTE *)a3 = *(_BYTE *)a1;
    v4 = *(unsigned __int8 *)(a1 + 1);
    *(_BYTE *)(a3 + 1) = v4;
    if (v4 == 1)
    {
      v5 = *(unsigned __int16 *)(a1 + 2);
      *(_WORD *)(a3 + 2) = v5;
      *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 4);
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a3 + 12) = *(_DWORD *)(a1 + 12);
      *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a3 + 20) = *(_DWORD *)(a1 + 20);
      if (!v5)
        *(_WORD *)(a3 + 2) = 400;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t MTParse_HIDRelativePointerV2Report(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;

  v3 = 0;
  if (a2 >= 32 && a1 && a3)
  {
    *(_BYTE *)a3 = *(_BYTE *)a1;
    v4 = *(unsigned __int8 *)(a1 + 1);
    *(_BYTE *)(a3 + 1) = v4;
    if (v4 == 1)
    {
      v5 = *(unsigned __int16 *)(a1 + 2);
      *(_WORD *)(a3 + 2) = v5;
      *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 4);
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a3 + 12) = *(_DWORD *)(a1 + 12);
      *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a3 + 20) = *(_DWORD *)(a1 + 20);
      *(_QWORD *)(a3 + 24) = *(_QWORD *)(a1 + 24);
      if (!v5)
        *(_WORD *)(a3 + 2) = 400;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t MTParse_HIDOffTableHeightReport(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  int v5;

  result = 0;
  if (a2 >= 8 && a1 && a3)
  {
    *(_BYTE *)a3 = *(_BYTE *)a1;
    v5 = *(unsigned __int8 *)(a1 + 1);
    *(_BYTE *)(a3 + 1) = v5;
    if (v5 == 1)
    {
      *(_WORD *)(a3 + 2) = *(_WORD *)(a1 + 2);
      *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 4);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t MTConvert_V4HeaderToV2Header@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  unsigned int v3;

  *(_DWORD *)(a2 + 24) = -1431655766;
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  *(_WORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 14) = *(_WORD *)(result + 18);
  v2 = *(unsigned __int8 *)(result + 22);
  *(_BYTE *)(a2 + 16) = v2;
  if (v2)
    v3 = *(unsigned __int16 *)(result + 16) / v2;
  else
    LOBYTE(v3) = 96;
  *(_BYTE *)(a2 + 17) = v3;
  *(_WORD *)(a2 + 18) = *(_WORD *)(result + 28);
  *(_WORD *)(a2 + 20) = *(_DWORD *)(result + 24);
  *(_WORD *)(a2 + 22) = *(_WORD *)(result + 30);
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t *MTConvert_V3HeaderToV2Header@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  __int16 v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  v2 = 0;
  *(_DWORD *)(a2 + 24) = -1431655766;
  v3 = *result;
  *(_QWORD *)a2 = *result;
  *(_DWORD *)(a2 + 8) = *((_DWORD *)result + 2);
  *(_WORD *)(a2 + 12) = 0;
  if (v3 == 115)
    v2 = *((_WORD *)result + 6);
  *(_WORD *)(a2 + 14) = v2;
  v4 = *((unsigned __int8 *)result + 14);
  *(_BYTE *)(a2 + 16) = v4;
  if (v4)
    v5 = *((unsigned __int16 *)result + 6) / v4;
  else
    LOBYTE(v5) = 96;
  *(_BYTE *)(a2 + 17) = v5;
  *(_WORD *)(a2 + 18) = *((_WORD *)result + 10);
  *(_WORD *)(a2 + 20) = *((_DWORD *)result + 4);
  *(_WORD *)(a2 + 22) = *((_WORD *)result + 11);
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t MTConvert_CompactHeaderToV2Header@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(_BYTE *)a2 = *(_BYTE *)result;
  *(_WORD *)(a2 + 1) = 2048;
  *(_BYTE *)(a2 + 3) = 1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(result + 4);
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(result + 3);
  *(_WORD *)(a2 + 9) = 0;
  *(_BYTE *)(a2 + 11) = 4;
  *(_DWORD *)(a2 + 12) = 0;
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(result + 2);
  *(_BYTE *)(a2 + 17) = 16;
  *(_DWORD *)(a2 + 18) = 0;
  *(_DWORD *)(a2 + 21) = 0;
  return result;
}

double MTConvert_CompactV3HeaderToV2Header@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  *(_DWORD *)(a2 + 24) = -1431655766;
  *(_BYTE *)a2 = *(_BYTE *)a1;
  *(_WORD *)(a2 + 1) = 2048;
  *(_BYTE *)(a2 + 3) = 1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 4);
  result = 2.05226843e-289;
  *(_DWORD *)(a2 + 8) = 0x4000000;
  *(_DWORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 16) = 4608;
  *(_DWORD *)(a2 + 18) = 0;
  *(_DWORD *)(a2 + 21) = 0;
  return result;
}

double MTConvert_CompactV5HeaderToV2Header@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  *(_DWORD *)(a2 + 24) = -1431655766;
  *(_BYTE *)a2 = *(_BYTE *)a1;
  *(_WORD *)(a2 + 1) = 3072;
  *(_BYTE *)(a2 + 3) = 1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 8);
  result = 2.05226843e-289;
  *(_DWORD *)(a2 + 8) = 0x4000000;
  *(_DWORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 16) = 4608;
  *(_DWORD *)(a2 + 18) = 0;
  *(_DWORD *)(a2 + 21) = 0;
  return result;
}

double MTConvert_CompactV9HeaderToV2Header@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  unsigned int v3;

  *(_DWORD *)(a2 + 24) = -1431655766;
  *(_BYTE *)a2 = *(_BYTE *)a1;
  *(_WORD *)(a2 + 1) = 1792;
  *(_BYTE *)(a2 + 3) = 2;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 2);
  result = 2.05226843e-289;
  *(_DWORD *)(a2 + 8) = 0x4000000;
  *(_DWORD *)(a2 + 12) = 0;
  v3 = *(unsigned __int8 *)(a1 + 1);
  *(_BYTE *)(a2 + 16) = v3 & 3;
  *(_BYTE *)(a2 + 17) = 22;
  *(_WORD *)(a2 + 18) = 0;
  *(_WORD *)(a2 + 20) = v3 >> 2;
  *(_WORD *)(a2 + 22) = 0;
  *(_BYTE *)(a2 + 24) = *(_BYTE *)(a1 + 6);
  return result;
}

uint64_t MTConvert_CompactV10HeaderToV2Header@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(_BYTE *)a2 = *(_BYTE *)result;
  *(_WORD *)(a2 + 1) = 4352;
  *(_BYTE *)(a2 + 3) = 2;
  *(_DWORD *)(a2 + 4) = (3125 * (unint64_t)*(unsigned int *)(result + 1) * (unsigned __int128)0x68DB8BAC710CCuLL) >> 64;
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(result + 14);
  *(_WORD *)(a2 + 9) = 1536;
  *(_BYTE *)(a2 + 11) = 4;
  *(_WORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 14) = *(unsigned __int8 *)(result + 15);
  *(_BYTE *)(a2 + 16) = *(_BYTE *)(result + 13) >> 4;
  *(_BYTE *)(a2 + 17) = 19;
  *(_DWORD *)(a2 + 18) = 0;
  *(_WORD *)(a2 + 22) = 0;
  *(_BYTE *)(a2 + 24) = *(_BYTE *)(result + 16);
  return result;
}

uint64_t SABinaryParser::parseInjExtData(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, char *), uint64_t (*a3)(_QWORD, unsigned __int8 *, unsigned __int8 *), uint64_t (*a4)(_QWORD))
{
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 *v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int8 *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 <= v5)
    return 1;
  while (1)
  {
    v10 = (unsigned __int8 *)(*(_QWORD *)a1 + v5);
    v11 = (char)*v10;
    if ((v11 & 0x80000000) == 0)
    {
      if (v4 - v5 < 0x12)
        return 0;
      v12 = *v10;
      *(_QWORD *)(a1 + 16) = v5 + 18;
      if (v12 == 3)
      {
        if (a4 && (a4(*(_QWORD *)(a1 + 24)) & 1) == 0)
          return 0;
      }
      else
      {
        if (v4 - (v5 + 18) < 4)
          return 0;
        v19 = v5 + 22;
        *(_QWORD *)(a1 + 16) = v19;
        v20 = *((unsigned __int16 *)v10 + 10);
        if (v4 - v19 < v20)
          return 0;
        *(_QWORD *)(a1 + 16) = v19 + v20;
        if (v12 == 2)
        {
          if (a3)
          {
            result = a3(*(_QWORD *)(a1 + 24), v10, v10 + 22);
            if (!(_DWORD)result)
              return result;
          }
          goto LABEL_27;
        }
        if (v12 != 1)
          return 0;
        if (a2)
        {
          v17 = *(_QWORD *)(a1 + 24);
          v18 = (char *)(v10 + 22);
LABEL_20:
          if ((a2(v17, v10, v18) & 1) == 0)
            return 0;
          goto LABEL_27;
        }
      }
      goto LABEL_27;
    }
    v13 = *(_QWORD *)(a1 + 40);
    if (!v13)
      return 0;
    v14 = v11 & 0x7F;
    if (v14 >= *(unsigned __int8 *)(a1 + 32))
      return 0;
    v15 = (unsigned __int8 *)(v13 + 22 * v14);
    v16 = *((unsigned __int16 *)v15 + 10);
    if (v4 - v5 <= v16)
      return 0;
    *(_QWORD *)(a1 + 16) = v5 + v16 + 1;
    if (*v15 == 1)
    {
      if (!a2)
        goto LABEL_27;
      v17 = *(_QWORD *)(a1 + 24);
      v18 = (char *)(v10 + 1);
      v10 = v15;
      goto LABEL_20;
    }
    if (a3 && (a3(*(_QWORD *)(a1 + 24), v15, v10 + 1) & 1) == 0)
      return 0;
LABEL_27:
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(_QWORD *)(a1 + 16);
    if (v4 <= v5)
      return 1;
  }
}

uint64_t MTParse_SABinary::$_1::__invoke(uint64_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  int v4;
  int v5;

  v5 = *(unsigned __int16 *)(a2 + 18);
  v3 = a2 + 18;
  v4 = v5;
  if (v5 == 12293)
    return MTParse_SABinary_FireflyPaths(v3, a3, *a1, a1[1]);
  if (v4 == 12288)
    return MTParse_SABinary_Paths(v3, a3, *a1, (__MTDevice *)a1[1]);
  return 1;
}

BOOL MTParse_SABinary_Paths(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __MTDevice *a4)
{
  unsigned int v4;
  int v5;
  int v7;

  v4 = *(unsigned __int16 *)(a1 + 2);
  if (v4 < 4)
    return 0;
  v5 = *a2;
  if (((16 * ((3 * v5) & 0x3FF)) | 4u) > v4)
    return 0;
  *(_BYTE *)(a3 + 96) = v5;
  v7 = *((unsigned __int16 *)a2 + 1);
  *(_WORD *)(a3 + 100) = v7;
  *(_BYTE *)(a3 + 97) = 48;
  *(_BYTE *)(a3 + 72) = v5;
  *(_DWORD *)(a3 + 68) = v7;
  *(_BYTE *)(a3 + 11) = 1;
  return MTParse_PrecisePathPayload(a2 + 4, *(unsigned __int16 *)(a1 + 2) - 4, (MTParsedMultitouchFrameRep_t *)a3, a4, *a2, 0, 48 * v5, 0);
}

uint64_t MTParse_SABinary_FireflyPaths(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  int v8;
  unint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  int32x2_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  __int128 v22;
  __int128 v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  float v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  __int16 v49;
  __int16 v55;
  unsigned int v56;
  float v57;
  NSObject *v58;
  uint64_t v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = *(unsigned __int16 *)(a1 + 2);
  if (v4 < 4)
    return 0;
  v6 = *a2;
  if (((v6 << 6) | 4uLL) > v4)
    return 0;
  *(_BYTE *)(a3 + 96) = v6;
  v8 = *((unsigned __int16 *)a2 + 1);
  *(_WORD *)(a3 + 100) = v8;
  *(_BYTE *)(a3 + 97) = 60;
  *(_BYTE *)(a3 + 72) = v6;
  *(_DWORD *)(a3 + 68) = v8;
  *(_BYTE *)(a3 + 11) = 1;
  if (*a2 - 3 < 0xFFFFFFFE)
    return 0;
  v11 = 0;
  v12 = a3 + 116;
  v13 = (unsigned int *)(a2 + 64);
  v14 = vdup_n_s32(0x42C80000u);
  do
  {
    v15 = *(_QWORD *)(v13 - 3);
    v16 = *(v13 - 1);
    *(_DWORD *)(v12 + 56) = v16;
    *(_QWORD *)(v12 + 48) = v15;
    v17 = bswap32(v15);
    if (*(_DWORD *)(a4 + 100) != 1)
      LODWORD(v15) = v17;
    *(_DWORD *)(v12 + 48) = v15;
    v18 = bswap32(*(_DWORD *)(v12 + 52));
    if (*(_DWORD *)(a4 + 100) == 1)
      v19 = *(_DWORD *)(v12 + 52);
    else
      v19 = v18;
    *(_DWORD *)(v12 + 52) = v19;
    v20 = bswap32(v16);
    if (*(_DWORD *)(a4 + 100) == 1)
      v21 = v16;
    else
      v21 = v20;
    *(_DWORD *)(v12 + 56) = v21;
    v22 = *(_OWORD *)(v13 - 15);
    v23 = *(_OWORD *)(v13 - 7);
    *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 - 11);
    *(_OWORD *)(v12 + 32) = v23;
    *(_OWORD *)v12 = v22;
    v24 = *(_DWORD *)(v12 + 8);
    v25 = bswap32(*(_DWORD *)(v12 + 4));
    if (*(_DWORD *)(a4 + 100) == 1)
      v26 = *(_DWORD *)(v12 + 4);
    else
      v26 = v25;
    *(_DWORD *)(v12 + 4) = v26;
    v27 = bswap32(v24);
    if (*(_DWORD *)(a4 + 100) == 1)
      v28 = v24;
    else
      v28 = v27;
    *(_DWORD *)(v12 + 8) = v28;
    v29 = *(_DWORD *)(v12 + 16);
    v30 = bswap32(*(_DWORD *)(v12 + 12));
    if (*(_DWORD *)(a4 + 100) == 1)
      v31 = *(_DWORD *)(v12 + 12);
    else
      v31 = v30;
    *(_DWORD *)(v12 + 12) = v31;
    v32 = bswap32(v29);
    if (*(_DWORD *)(a4 + 100) == 1)
      v33 = v29;
    else
      v33 = v32;
    *(_DWORD *)(v12 + 16) = v33;
    v34 = *(_DWORD *)(v12 + 24);
    v35 = bswap32(*(_DWORD *)(v12 + 20));
    if (*(_DWORD *)(a4 + 100) == 1)
      v36 = *(float *)(v12 + 20);
    else
      v36 = *(float *)&v35;
    *(float *)(v12 + 20) = v36;
    v37 = bswap32(v34);
    if (*(_DWORD *)(a4 + 100) == 1)
      v38 = v34;
    else
      v38 = v37;
    *(_DWORD *)(v12 + 24) = v38;
    v39 = *(_DWORD *)(v12 + 32);
    v40 = bswap32(*(_DWORD *)(v12 + 28));
    if (*(_DWORD *)(a4 + 100) == 1)
      v41 = *(_DWORD *)(v12 + 28);
    else
      v41 = v40;
    *(_DWORD *)(v12 + 28) = v41;
    v43 = *(_DWORD *)(v12 + 36);
    v42 = *(_DWORD *)(v12 + 40);
    v44 = bswap32(v42);
    if (*(_DWORD *)(a4 + 100) != 1)
      v42 = v44;
    *(_DWORD *)(v12 + 40) = v42;
    v45 = bswap32(v39);
    if (*(_DWORD *)(a4 + 100) == 1)
      v45 = v39;
    *(_DWORD *)(v12 + 32) = v45;
    v46 = bswap32(v43);
    if (*(_DWORD *)(a4 + 100) == 1)
      v47 = v43;
    else
      v47 = v46;
    *(_DWORD *)(v12 + 36) = v47;
    v48 = bswap32(*(unsigned __int16 *)(v12 + 44)) >> 16;
    if (*(_DWORD *)(a4 + 100) == 1)
      v49 = *(_WORD *)(v12 + 44);
    else
      v49 = v48;
    _S0 = *v13;
    __asm { FCVT            H0, S0 }
    v55 = _S0;
    v56 = bswap32(_S0) >> 16;
    if (!_ZF)
      v55 = v56;
    *(_WORD *)(v12 + 46) = v55;
    *(_BYTE *)(a3 + 113) = 1;
    *(_WORD *)(v12 + 44) = v49 | 0x1000;
    v57 = v36;
    if (*(_BYTE *)(v12 + 2) != 7 && *(_QWORD *)(a4 + 184))
    {
      if (*(_BYTE *)(a4 + 133))
        mt_CachePropertiesForDevice(a4);
      v58 = MTLoggingFramework();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = *(_QWORD *)(a4 + 64);
        *(_DWORD *)buf = 134217984;
        v61 = v59;
        _os_log_impl(&dword_21A1DE000, v58, OS_LOG_TYPE_DEFAULT, "Non tstamp-synced contact detected. Clearing device timestamp offset (deviceID 0x%llX)", buf, 0xCu);
      }
      *(_QWORD *)(a4 + 184) = 0;
      v57 = *(float *)(v12 + 20);
    }
    if (v57 == 0.0 || *(float *)(v12 + 24) == 0.0)
      *(int32x2_t *)(v12 + 20) = v14;
    ++v11;
    v12 += 60;
    v13 += 16;
  }
  while (v11 < *a2);
  return 1;
}

uint64_t MTParse_SABinary::$_2::__invoke(uint64_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  int v4;
  int v5;

  v5 = *(unsigned __int16 *)(a2 + 18);
  v3 = a2 + 18;
  v4 = v5;
  if (v5 == 12293)
    return MTParse_SABinary_FireflyPaths(v3, a3, *a1, a1[1]);
  if (v4 == 12288)
    return MTParse_SABinary_Paths(v3, a3, *a1, (__MTDevice *)a1[1]);
  return 1;
}

uint64_t MTRegisterMultitouchImageCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *i;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  for (i = (_QWORD *)(a1 + 1336); *i; ++i)
  {
    if (++v2 == 4)
      return 0;
  }
  *i = a2;
  i[5] = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1368) |= 1 << v2;
  *(_QWORD *)((char *)i + 532) = 0x1000000000002;
  return v4;
}

uint64_t MTRegisterImageCallback(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;

  if (!a1)
    return 0;
  v4 = 0;
  for (i = a1 + 1336; *(_QWORD *)i; i += 8)
  {
    if (++v4 == 4)
      return 0;
  }
  *(_QWORD *)i = a2;
  *(_QWORD *)(i + 40) = 0;
  v6 = 1;
  *(_BYTE *)(a1 + 1368) |= 1 << v4;
  *(_DWORD *)(i + 532) = a3;
  *(_DWORD *)(i + 536) = a4;
  return v6;
}

uint64_t MTRegisterImageCallbackWithRefcon(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t i;
  uint64_t v7;

  if (!a1)
    return 0;
  v5 = 0;
  for (i = a1 + 1336; *(_QWORD *)i; i += 8)
  {
    if (++v5 == 4)
      return 0;
  }
  *(_QWORD *)i = a2;
  *(_QWORD *)(i + 40) = a5;
  v7 = 1;
  *(_BYTE *)(a1 + 1368) |= 1 << v5;
  *(_DWORD *)(i + 532) = a3;
  *(_DWORD *)(i + 536) = a4;
  return v7;
}

uint64_t MTUnregisterImageCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  if (a1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = a1 + 8 * v2;
      if (*(_QWORD *)(v4 + 1336) == a2)
      {
        *(_QWORD *)(v4 + 1336) = 0;
        v3 = 1;
        *(_BYTE *)(a1 + 1368) &= ~(1 << v2);
        *(_QWORD *)(v4 + 1868) = 0;
      }
      ++v2;
    }
    while (v2 != 4);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t MTAlg_IssueImageCallbacks(uint64_t result, const void *a2, __int128 *a3)
{
  uint64_t v5;
  __int16 *v6;
  uint64_t i;
  uint64_t (*v8)(uint64_t, const void *, __int128 *, _QWORD);
  uint64_t v9;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        if (*(_BYTE *)(result + 1368) || (*(_BYTE *)(result + 2004) & 8) != 0)
        {
          result = mtalg_FillinValidPixelRange(result, (uint64_t)a3);
          if ((*(_BYTE *)(v5 + 2004) & 8) != 0)
          {
            v9 = *(_QWORD *)(v5 + 2008);
            result = mt_ImageDescriptorMatchesFilter((uint64_t)a3, (int *)&v9);
            if ((_DWORD)result)
            {
              v6 = MTImageInfoCreate(a3, *(__int16 **)(v5 + 5376 + 8 * *(unsigned int *)(v5 + 5368)));
              *(_QWORD *)(v5 + 5376 + 8 * *(unsigned int *)(v5 + 5368)) = v6;
              *(_DWORD *)(v5 + 2240) |= 8u;
              result = (uint64_t)memcpy(v6 + 20, a2, 2 * v6[9] * (uint64_t)v6[8]);
              ++*(_DWORD *)(v5 + 5368);
            }
          }
          if (*(_BYTE *)(v5 + 1368))
          {
            for (i = 0; i != 32; i += 8)
            {
              v8 = *(uint64_t (**)(uint64_t, const void *, __int128 *, _QWORD))(v5 + i + 1336);
              if (v8)
              {
                result = mt_ImageDescriptorMatchesFilter((uint64_t)a3, (int *)(v5 + i + 1868));
                if ((_DWORD)result)
                  result = v8(v5, a2, a3, *(_QWORD *)(v5 + i + 1376));
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL mt_ImageDescriptorMatchesFilter(uint64_t a1, int *a2)
{
  int v2;
  _BOOL4 v4;
  int v5;
  BOOL v6;

  v2 = *a2;
  v4 = *a2 == 2147483646 || v2 == 254;
  v5 = *(_DWORD *)(a1 + 20);
  v6 = v5 == 2147483646 || v2 == 2147483646;
  if (!v6 && v2 != 254)
    return (v5 & v2) != 0 && (a2[1] & *(_DWORD *)(a1 + 24)) != 0;
  return v5 == 2147483646 && v4;
}

__int16 *MTImageInfoCreate(__int128 *a1, __int16 *a2)
{
  __int128 v3;
  __int128 v4;

  if (!a1)
    return 0;
  if (a2 && a2[9] * a2[8] >= *((__int16 *)a1 + 9) * *((__int16 *)a1 + 8)
    || (free(a2),
        (a2 = (__int16 *)malloc_type_malloc(2 * *((__int16 *)a1 + 8) * (uint64_t)*((__int16 *)a1 + 9) + 40, 0x95035B00uLL)) != 0))
  {
    v3 = *a1;
    v4 = a1[1];
    *((_QWORD *)a2 + 4) = *((_QWORD *)a1 + 4);
    *(_OWORD *)a2 = v3;
    *((_OWORD *)a2 + 1) = v4;
  }
  return a2;
}

double MTEasyInstallPrintCallbacks(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t v7;
  uint64_t (**v8)(uint64_t, uint64_t, uint64_t *);
  uint64_t v9;
  uint64_t (**v10)(uint64_t, uint64_t, uint64_t *);
  double result;
  uint64_t v12;
  uint64_t (**v13)(uint64_t, uint64_t, uint64_t *);
  uint64_t v14;
  uint64_t (**v15)(uint64_t, uint64_t, uint64_t *);
  uint64_t v16;
  uint64_t (**v17)(uint64_t, uint64_t, uint64_t *);

  if (a4)
  {
    if (!a1)
      goto LABEL_33;
    v7 = 0;
    v8 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v8)
    {
      ++v7;
      ++v8;
      if (v7 == 4)
        goto LABEL_6;
    }
    *v8 = MTImagePrintCallback;
    v8[5] = 0;
    *(_BYTE *)(a1 + 1368) |= 1 << v7;
    *(_QWORD *)&result = 0x1000000002;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v8 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x1000000002;
  }
  else
  {
LABEL_6:
    if (!a1)
      goto LABEL_13;
  }
  if (a3)
  {
    v9 = 0;
    v10 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v10)
    {
      ++v9;
      ++v10;
      if (v9 == 4)
        goto LABEL_13;
    }
    *v10 = MTImagePrintCallback;
    v10[5] = 0;
    *(_BYTE *)(a1 + 1368) |= 1 << v9;
    *(_QWORD *)&result = 0x27FFFFFFELL;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v10 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x27FFFFFFELL;
  }
LABEL_13:
  if (a5)
  {
    if (!a1)
      goto LABEL_33;
    v12 = 0;
    v13 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v13)
    {
      ++v12;
      ++v13;
      if (v12 == 4)
        goto LABEL_21;
    }
    *v13 = MTImagePrintCallback;
    v13[5] = 0;
    *(_BYTE *)(a1 + 1368) |= 1 << v12;
    *(_QWORD *)&result = 0x1000000000002;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v13 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x1000000000002;
  }
LABEL_21:
  if (a1 && a6)
  {
    v14 = 0;
    v15 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v15)
    {
      ++v14;
      ++v15;
      if (v14 == 4)
        goto LABEL_26;
    }
    *v15 = MTImagePrintCallback;
    v15[5] = 0;
    *(_BYTE *)(a1 + 1368) |= 1 << v14;
    result = 2.22507386e-308;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v15 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x10000000000002;
  }
  else
  {
LABEL_26:
    if (!a1)
      goto LABEL_33;
  }
  if (!a7)
  {
LABEL_33:
    if (!a2)
      return result;
    goto LABEL_34;
  }
  v16 = 0;
  v17 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
  while (*v17)
  {
    ++v16;
    ++v17;
    if (v16 == 4)
      goto LABEL_33;
  }
  *v17 = MTImagePrintCallback;
  v17[5] = 0;
  *(_BYTE *)(a1 + 1368) |= 1 << v16;
  result = 2.84809454e-306;
  *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v17 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x80000000000002;
  if (a2)
LABEL_34:
    MTRegisterPathCallback(a1, (uint64_t)MTPathPrintCallback);
  return result;
}

uint64_t MTImagePrintCallback(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t result;
  int v8;
  uint64_t v9;

  v4 = *a3;
  v5 = MTGetImageRegionName(*((_DWORD *)a3 + 5));
  v6 = MTGetImageProcessingStepName(*((_DWORD *)a3 + 6));
  result = printf("\nImage #%lu '%s %s': %d X %d  Timestamp: %.3f s\n", v4, v5, v6, *((__int16 *)a3 + 8), *((__int16 *)a3 + 9), *((double *)a3 + 1));
  if (*((__int16 *)a3 + 9) >= 1)
  {
    v8 = 0;
    do
    {
      if (*((__int16 *)a3 + 8) >= 1)
      {
        v9 = 0;
        do
        {
          if ((*((_DWORD *)a3 + 6) - 16) > 0x30)
            printf("%3d ");
          else
            printf("%4x ");
          ++v9;
        }
        while ((int)v9 < *((__int16 *)a3 + 8));
      }
      result = putchar(10);
      ++v8;
    }
    while (v8 < *((__int16 *)a3 + 9));
  }
  return result;
}

const char *MTGetImageRegionName(int a1)
{
  const char *result;

  result = "AllRegions";
  if (a1 <= 511)
  {
    if (a1 <= 7)
    {
      if (a1 == 2)
        return "Multitouch";
      if (a1 == 4)
        return "Force";
      return "Unknown";
    }
    if (a1 == 8)
      return "Optical";
    if (a1 != 254)
    {
      if (a1 == 256)
        return "CommonMode";
      return "Unknown";
    }
  }
  else
  {
    if (a1 < 0x10000)
    {
      switch(a1)
      {
        case 0x200:
          return "NoiseSPA";
        case 0x1000:
          return "StylusX";
        case 0x2000:
          return "StylusY";
      }
      return "Unknown";
    }
    if (a1 == 0x10000)
      return "OrbCore";
    if (a1 == 0x40000)
      return "OrbCrashpad";
    if (a1 != 2147483646)
      return "Unknown";
  }
  return result;
}

const char *MTGetImageProcessingStepName(int a1)
{
  if (a1 > 4095)
  {
    if (a1 >= 0x100000)
    {
      if (a1 == 0x100000)
        return "Smoothed";
      if (a1 == 0x800000)
        return "Patches";
    }
    else
    {
      if (a1 == 4096)
        return "NoiseAdded";
      if (a1 == 0x10000)
        return "Clipped";
    }
  }
  else if (a1 > 255)
  {
    if (a1 == 256)
      return "Baselined";
    if (a1 == 1024)
      return "Scaled8bit";
  }
  else
  {
    if (a1 == 16)
      return "IsBaseline";
    if (a1 == 64)
      return "Unbaselined";
  }
  return "? Step";
}

uint64_t MTPrintImageRegionDescriptors(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;
  unsigned int v10;

  v10 = 0;
  v9 = 0;
  result = MTAlg_DeviceGetSensorRegionArray(a1, &v9, &v10);
  if (!(_DWORD)result)
  {
    printf("Raw Image Buffer %d X %d has sensor regions:\n", *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 88));
    v3 = v10;
    if (v10)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        v6 = v9;
        v7 = *(unsigned __int8 *)(v9 + v4);
        if (*(_BYTE *)(v9 + v4))
        {
          v8 = MTGetImageRegionName(1 << v7);
          printf("\tType %d (%s): start_row=%d rows=%d row_skip=%d : start_col=%d cols=%d hardware_coloffset=%d\n", v7, v8, *(unsigned __int8 *)(v6 + v4 + 1), *(unsigned __int8 *)(v6 + v4 + 2), *(unsigned __int8 *)(v6 + v4 + 3), *(unsigned __int8 *)(v6 + v4 + 4), *(unsigned __int8 *)(v6 + v4 + 5), *(unsigned __int8 *)(v6 + v4 + 6));
          v3 = v10;
        }
        ++v5;
        v4 += 7;
      }
      while (v5 < v3);
    }
    return putchar(10);
  }
  return result;
}

uint64_t MTRegisterForceCentroidCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  while (1)
  {
    v3 = a1 + 8 * v2;
    if (!*(_QWORD *)(v3 + 1480))
      break;
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 1480) = a2;
  *(_QWORD *)(v3 + 1520) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1512) |= 1 << v2;
  return v4;
}

uint64_t MTRegisterForceCentroidCallbackWithRefcon(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 1480))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 1480) = a2;
  *(_QWORD *)(v4 + 1520) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 1512) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterForceCentroidCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  v3 = a1 + 1480;
  while (*(_QWORD *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1512) &= ~(1 << v2);
  return v4;
}

BOOL MTAlg_AlwaysNeedsVelocityCalculated(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 130) != 0;
  return result;
}

float MTSurface_mmToPixels(uint64_t a1, float a2, double a3, float a4, double a5, float a6)
{
  float v9;
  float v10;

  mtalg_getSurfaceBounds_mm(a1);
  return a4 + (float)((float)(a2 - v9) * (float)(a6 / v10));
}

void mt_PostForceCentroidCallbacks(uint64_t a1, uint64_t a2)
{
  __n128 v3;
  uint64_t i;
  void (*v5)(uint64_t, _OWORD *, _QWORD, __n128);
  _OWORD v6[2];
  unint64_t v7;

  if (a1)
  {
    if (*(_BYTE *)(a2 + 13))
    {
      v6[0] = xmmword_21A1FCF58;
      v6[1] = unk_21A1FCF68;
      v7 = 0xAAAAAAAAFFFFFFFFLL;
      *(_QWORD *)&v6[0] = *(unsigned int *)(a1 + 168);
      *((double *)v6 + 1) = (double)*(unint64_t *)a2;
      v3.n128_f32[0] = mtalg_ConvertBinaryForceCentroidToMTFC(a1, *(unsigned int *)(a2 + 56) | ((unint64_t)*(unsigned __int16 *)(a2 + 60) << 32), (float *)v6);
      if (*(_BYTE *)(a1 + 1512))
      {
        for (i = 0; i != 32; i += 8)
        {
          v5 = *(void (**)(uint64_t, _OWORD *, _QWORD, __n128))(a1 + i + 1480);
          if (v5)
            v5(a1, v6, *(_QWORD *)(a1 + i + 1520), v3);
        }
      }
    }
  }
}

float MTContact_getCentroidPixel(uint64_t a1, float a2, double a3, float a4)
{
  return a2 + (float)(*(float *)(a1 + 32) * a4);
}

float MTContact_getEllipseEccentricity(uint64_t a1)
{
  float result;
  float v2;
  float v3;

  result = 1.0;
  if (a1)
  {
    v2 = *(float *)(a1 + 60);
    v3 = *(float *)(a1 + 64);
    if (v3 <= 6.0)
    {
      if (v2 > 6.0)
        return v2 / 6.0;
    }
    else
    {
      return v2 / v3;
    }
  }
  return result;
}

float MTContact_getEllipseOrientationDegrees(uint64_t a1)
{
  if (a1)
    return *(float *)(a1 + 56) * 180.0 / 3.14159265;
  else
    return 0.0;
}

float MTContact_getEllipseMeanRadius(uint64_t a1)
{
  if (a1)
    return sqrtf(*(float *)(a1 + 60) * *(float *)(a1 + 64));
  else
    return 0.0;
}

float MTContact_getEllipseMajorAxisRadius(uint64_t a1)
{
  if (a1)
    return *(float *)(a1 + 60);
  else
    return 0.0;
}

float MTContact_getEllipseMajorAxisVector(uint64_t a1)
{
  double v1;

  if (!a1)
    return 0.0;
  v1 = *(float *)(a1 + 60);
  return __sincos_stret(*(float *)(a1 + 56)).__cosval * v1;
}

float MTContact_getEllipseMinorAxisRadius(uint64_t a1)
{
  if (a1)
    return *(float *)(a1 + 64);
  else
    return 0.0;
}

float MTContact_getEllipseMinorAxisVector(uint64_t a1)
{
  double v1;

  if (!a1)
    return 0.0;
  v1 = *(float *)(a1 + 60);
  return __sincos_stret(*(float *)(a1 + 56) + 1.57079633).__cosval * v1;
}

uint64_t MTRegisterContactFrameCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  while (1)
  {
    v3 = a1 + 8 * v2;
    if (!*(_QWORD *)(v3 + 400))
      break;
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 400) = a2;
  *(_QWORD *)(v3 + 440) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 432) |= 1 << v2;
  return v4;
}

uint64_t MTRegisterContactFrameCallbackWithRefcon(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 400))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 400) = a2;
  *(_QWORD *)(v4 + 440) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 432) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterContactFrameCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  v3 = a1 + 400;
  while (*(_QWORD *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 432) &= ~(1 << v2);
  return v4;
}

uint64_t MTAlg_IssueContactFrameCallbacks(uint64_t result, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t i;
  uint64_t (*v8)(uint64_t, _BYTE *, uint64_t, uint64_t, _QWORD, double);
  _BYTE __dst[3072];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    if (*(_BYTE *)(result + 432))
    {
      memcpy(__dst, &unk_21A1FCF80, sizeof(__dst));
      result = MTGetPathFrame(v3, (uint64_t)__dst);
      v6 = result;
      if ((int)result > 0 || *(int *)(v3 + 1840) >= 1)
      {
        for (i = 0; i != 32; i += 8)
        {
          v8 = *(uint64_t (**)(uint64_t, _BYTE *, uint64_t, uint64_t, _QWORD, double))(v3 + i + 400);
          if (v8)
            result = v8(v3, __dst, v6, a2, *(_QWORD *)(v3 + i + 440), a3);
        }
      }
      *(_DWORD *)(v3 + 1840) = v6;
    }
  }
  return result;
}

uint64_t MTGetPathFrame(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int i;
  uint64_t PathLifeCycle;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v2 = 0;
  if (a1 && a2)
  {
    v2 = 0;
    for (i = 0; i != 32; ++i)
    {
      PathLifeCycle = mtalg_getPathLifeCycle(a1, i);
      if (PathLifeCycle
        && (*(float *)(PathLifeCycle + 56) > 0.0 || (*(_DWORD *)(PathLifeCycle + 28) - 1) <= 6))
      {
        v7 = (_OWORD *)(a2 + 96 * (int)v2);
        v2 = (v2 + 1);
        v8 = *(_OWORD *)(PathLifeCycle + 24);
        *v7 = *(_OWORD *)(PathLifeCycle + 8);
        v7[1] = v8;
        v9 = *(_OWORD *)(PathLifeCycle + 40);
        v10 = *(_OWORD *)(PathLifeCycle + 56);
        v11 = *(_OWORD *)(PathLifeCycle + 88);
        v7[4] = *(_OWORD *)(PathLifeCycle + 72);
        v7[5] = v11;
        v7[2] = v9;
        v7[3] = v10;
      }
    }
  }
  return v2;
}

BOOL MTContact_isActive(uint64_t a1)
{
  return *(float *)(a1 + 48) > 0.0 || (*(_DWORD *)(a1 + 20) - 1) < 6;
}

uint64_t MTRegisterPathCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  v3 = a1 + 472;
  while (*(_QWORD *)(v3 + 8 * v2))
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = a2;
  v4 = 1;
  *(_BYTE *)(a1 + 504) |= 1 << v2;
  return v4;
}

uint64_t MTRegisterPathCallbackWithRefcon(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = a1 + 8 * v3;
    if (!*(_QWORD *)(v4 + 1624))
      break;
    if (++v3 == 4)
      return 0;
  }
  *(_QWORD *)(v4 + 1624) = a2;
  *(_QWORD *)(v4 + 1664) = a3;
  v5 = 1;
  *(_BYTE *)(a1 + 1656) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterPathCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  v3 = a1 + 472;
  while (*(_QWORD *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 504) &= ~(1 << v2);
  return v4;
}

uint64_t MTUnregisterPathCallbackWithRefcon(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0;
  v3 = a1 + 1624;
  while (*(_QWORD *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4)
      return 0;
  }
  *(_QWORD *)(v3 + 8 * v2) = 0;
  v4 = 1;
  *(_BYTE *)(a1 + 1656) &= ~(1 << v2);
  return v4;
}

uint64_t MTPathPrintCallback(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4;
  const char *v6;
  float v7;
  float v8;
  double v9;
  double v10;
  float v11;
  double v12;
  float v13;
  uint64_t result;

  v4 = *(_DWORD *)(a4 + 24);
  if (v4 <= 0xE)
  {
    if (a3 <= 7)
      v6 = mt_PathStageNames[a3];
    else
      v6 = "INVALID      ";
    v7 = *(float *)(a4 + 60);
    v8 = *(float *)(a4 + 64);
    v9 = v7;
    v10 = v8;
    if (v8 <= 6.0)
    {
      v11 = 1.0;
      if (v7 <= 6.0)
        goto LABEL_9;
      v8 = 6.0;
    }
    v11 = v7 / v8;
LABEL_9:
    v12 = v11;
    v13 = *(float *)(a4 + 56) * 180.0 / 3.14159265;
    result = printf("F%3ld @%.3f P%d %s H%d F%d(%5.9fX, %5.9fY)mm(%5.9fX, %5.9fY) %3.2fZTot %3.2fZDen %3.0fg %5.2fMR/%5.2fmR=%4.2f %4.1fdeg %4.1fdeg flags:0x%04X(%5.2fvx, %5.2fvy)-> %5.2fmm/s\n", *(_QWORD *)a4, *(double *)(a4 + 8), a2, v6, *(_DWORD *)(a4 + 28), v4, *(float *)(a4 + 68), *(float *)(a4 + 72), *(float *)(a4 + 32), *(float *)(a4 + 36), *(float *)(a4 + 48), *(float *)(a4 + 92), *(float *)(a4 + 52), v9, v10, v12, v13,
               *(float *)(a4 + 88) * 180.0 / 3.14159265,
               *(unsigned __int16 *)(a4 + 84),
               *(float *)(a4 + 76),
               *(float *)(a4 + 80),
               sqrt((float)((float)(*(float *)(a4 + 80) * *(float *)(a4 + 80))
                          + (float)(*(float *)(a4 + 76) * *(float *)(a4 + 76)))));
    if (!a3)
      return putchar(10);
  }
  return result;
}

const char *MTGetPathStageName(unsigned int a1)
{
  if (a1 <= 7)
    return mt_PathStageNames[a1];
  else
    return "INVALID      ";
}

uint64_t MTAlg_IssuePathCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  unsigned int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, __int128 *);
  void (*v18)(uint64_t, uint64_t, uint64_t, __int128 *, _QWORD);

  if (!*(_BYTE *)(a1 + 504) && !*(_BYTE *)(a1 + 1656) && (*(_BYTE *)(a1 + 2004) & 4) == 0)
    return 0;
  if ((*(_BYTE *)(a1 + 2004) & 4) != 0)
  {
    *(_DWORD *)(a1 + 2240) |= 4u;
    v9 = *(_DWORD *)(a1 + 2288);
    *(_DWORD *)(a1 + 2288) = v9 + 1;
    v10 = a1 + 2240 + 96 * v9;
    v11 = *a4;
    *(_OWORD *)(v10 + 72) = a4[1];
    *(_OWORD *)(v10 + 56) = v11;
    v12 = a4[2];
    v13 = a4[3];
    v14 = a4[4];
    *(_OWORD *)(v10 + 136) = a4[5];
    *(_OWORD *)(v10 + 120) = v14;
    *(_OWORD *)(v10 + 104) = v13;
    *(_OWORD *)(v10 + 88) = v12;
  }
  v15 = 0;
  v16 = 0;
  do
  {
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t, __int128 *))(a1 + v15 + 472);
    if (v17)
    {
      v17(a1, a2, a3, a4);
      v16 = 1;
    }
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t, __int128 *, _QWORD))(a1 + v15 + 1624);
    if (v18)
    {
      v18(a1, a2, a3, a4, *(_QWORD *)(a1 + v15 + 1664));
      v16 = 1;
    }
    v15 += 8;
  }
  while (v15 != 32);
  return v16 & 1;
}

__n128 MTPath_getTouchdownContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  v5 = *(_OWORD *)(PathLifeCycle + 152);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 136);
  *(_OWORD *)(a3 + 48) = v5;
  v6 = *(_OWORD *)(PathLifeCycle + 184);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 168);
  *(_OWORD *)(a3 + 80) = v6;
  result = *(__n128 *)(PathLifeCycle + 104);
  v8 = *(_OWORD *)(PathLifeCycle + 120);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

__n128 MTPath_getMakeContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  v5 = *(_OWORD *)(PathLifeCycle + 248);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 232);
  *(_OWORD *)(a3 + 48) = v5;
  v6 = *(_OWORD *)(PathLifeCycle + 216);
  *(_OWORD *)a3 = *(_OWORD *)(PathLifeCycle + 200);
  *(_OWORD *)(a3 + 16) = v6;
  result = *(__n128 *)(PathLifeCycle + 264);
  v8 = *(_OWORD *)(PathLifeCycle + 280);
  *(__n128 *)(a3 + 64) = result;
  *(_OWORD *)(a3 + 80) = v8;
  return result;
}

__n128 MTPath_getProximityPeakContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  v5 = *(_OWORD *)(PathLifeCycle + 344);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 328);
  *(_OWORD *)(a3 + 48) = v5;
  v6 = *(_OWORD *)(PathLifeCycle + 376);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 360);
  *(_OWORD *)(a3 + 80) = v6;
  result = *(__n128 *)(PathLifeCycle + 296);
  v8 = *(_OWORD *)(PathLifeCycle + 312);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

__n128 MTPath_getBreakContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  v5 = *(_OWORD *)(PathLifeCycle + 440);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 424);
  *(_OWORD *)(a3 + 48) = v5;
  v6 = *(_OWORD *)(PathLifeCycle + 472);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 456);
  *(_OWORD *)(a3 + 80) = v6;
  result = *(__n128 *)(PathLifeCycle + 392);
  v8 = *(_OWORD *)(PathLifeCycle + 408);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

__n128 MTPath_getLiftoffContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  v5 = *(_OWORD *)(PathLifeCycle + 536);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 520);
  *(_OWORD *)(a3 + 48) = v5;
  v6 = *(_OWORD *)(PathLifeCycle + 568);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 552);
  *(_OWORD *)(a3 + 80) = v6;
  result = *(__n128 *)(PathLifeCycle + 488);
  v8 = *(_OWORD *)(PathLifeCycle + 504);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

float MTPath_getPositionBounds_mm(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (PathLifeCycle)
    return *(float *)(PathLifeCycle + 584);
  else
    return 0.0;
}

float MTPath_getMaxSpeed_mm_s(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (PathLifeCycle)
    return *(float *)(PathLifeCycle + 600);
  else
    return 0.0;
}

float MTPath_getMaxPressure(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (PathLifeCycle)
    return *(float *)(PathLifeCycle + 604);
  else
    return 0.0;
}

float MTPath_getMaxProximity(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (PathLifeCycle)
    return *(float *)(PathLifeCycle + 608);
  else
    return 0.0;
}

float MTPath_getMaxEccentricity(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle;

  PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (PathLifeCycle)
    return *(float *)(PathLifeCycle + 612);
  else
    return 0.0;
}

uint64_t MTZephyrCaptureBaseline(uint64_t a1)
{
  return MTDeviceSetZephyrParameter(a1, 160, 1);
}

uint64_t MTZephyrDeriveImagingParams(uint64_t a1, char a2)
{
  return MTDeviceSetZephyrParameter(a1, 176, a2);
}

uint64_t MTZephyrSetInputDetectionControl(uint64_t a1, int8x8_t *a2, int32x2_t a3, int32x2_t a4)
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  a3.i32[0] = 1;
  a4.i32[0] = *(_DWORD *)(a1 + 100);
  v5[0] = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(a4, a3), 0), *a2, vrev16_s8(*a2));
  return MTDeviceSetReport(a1, 191, (uint64_t)v5, 8);
}

int32x2_t MTZephyrGetInputDetectionControl(uint64_t a1, int8x8_t *a2)
{
  int32x2_t result;
  int32x2_t v5;
  int v6;
  int8x8_t v7[2];

  v7[1] = *(int8x8_t *)MEMORY[0x24BDAC8D0];
  v7[0] = (int8x8_t)0xAAAAAAAAAAAAAAAALL;
  v6 = -1431655766;
  if (!MTDeviceGetReport(a1, 191, v7, 8u, &v6) && v6 == 8)
  {
    result.i32[0] = 1;
    v5.i32[0] = *(_DWORD *)(a1 + 100);
    result = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v5, result), 0), v7[0], vrev16_s8(v7[0]));
    *a2 = (int8x8_t)result;
  }
  return result;
}

uint64_t MTZephyrSetNoiseThresholdAndRange(uint64_t a1, int a2, unsigned int a3, unsigned int a4, __int16 a5)
{
  int v5;
  unsigned int v6;
  BOOL v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  _WORD v12[3];

  v5 = *(_DWORD *)(a1 + 100);
  v6 = bswap32(a3) >> 16;
  v7 = v5 == 1;
  if (v5 == 1)
    v8 = a3;
  else
    v8 = v6;
  v12[0] = v8;
  v9 = bswap32(a4) >> 16;
  if (v7)
    LOWORD(v9) = a4;
  v12[1] = v9;
  v10 = __rev16(a5);
  if (v7)
    v10 = a5;
  v12[2] = v10;
  return MTDeviceSetReport(a1, a2, (uint64_t)v12, 6);
}

uint64_t MTZephyrSetAdditiveCompensationParams(uint64_t a1, uint64_t a2)
{
  int32x4_t v2;
  int32x4_t v3;
  int8x16_t v4;
  int8x16_t v6;
  int8x16_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(int32x4_t *)(a2 + 16);
  v6 = *(int8x16_t *)a2;
  v3 = (int32x4_t)v6;
  v7 = (int8x16_t)v2;
  v2.i32[0] = 1;
  v3.i32[0] = *(_DWORD *)(a1 + 100);
  v4 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v3, v2), 0);
  v6 = vbslq_s8(v4, v6, vrev16q_s8(v6));
  v7 = vbslq_s8(v4, v7, vrev16q_s8(v7));
  return MTDeviceSetReport(a1, 178, (uint64_t)&v6, 32);
}

uint64_t MTZephyrRequestBaselinedRLE8(uint64_t a1)
{
  MTDeviceSetZephyrParameter(a1, 163, 1);
  MTDeviceSetZephyrParameter(a1, 164, 0);
  return MTDeviceSetZephyrParameter(a1, 165, 1);
}

uint64_t MTZephyrRequestBaselined16(uint64_t a1, char a2)
{
  MTDeviceSetZephyrParameter(a1, 163, a2);
  MTDeviceSetZephyrParameter(a1, 164, 1);
  return MTDeviceSetZephyrParameter(a1, 165, 1);
}

uint64_t MTZephyrRequestUnBaselinedRaw16(uint64_t a1)
{
  MTDeviceSetZephyrParameter(a1, 163, 0);
  MTDeviceSetZephyrParameter(a1, 164, 1);
  return MTDeviceSetZephyrParameter(a1, 165, 0);
}

uint64_t MTZephyrRequestRaw16ForCalibration(uint64_t a1)
{
  return MTDeviceSetZephyrParameter(a1, 65, 130);
}

uint64_t MTZephyrSetCalibrationCookie(uint64_t a1, char a2)
{
  return MTDeviceSetZephyrParameter(a1, 64, a2);
}

uint64_t MTZephyrSetRFBuniversal(uint64_t a1, char a2)
{
  return MTDeviceSetZephyrParameter(a1, 71, a2);
}

uint64_t MTZephyrGetRFBuniversal(uint64_t a1, void *a2)
{
  int v3;

  v3 = 0;
  return MTDeviceGetReport(a1, 71, a2, 1u, &v3);
}

uint64_t MTZephyrSetRowCalibTable(uint64_t a1, int a2, const char *a3, unsigned __int8 *a4, int a5, int a6)
{
  uint64_t v9;
  __int128 v10;
  _OWORD *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _BYTE *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v22;
  uint64_t v23;
  _OWORD v25[7];
  unint64_t v26;
  uint64_t v27;

  v9 = 0;
  v27 = *MEMORY[0x24BDAC8D0];
  v26 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[5] = v10;
  v25[6] = v10;
  v23 = a6;
  v25[3] = v10;
  v25[4] = v10;
  v25[1] = v10;
  v25[2] = v10;
  v25[0] = v10;
  v22 = a6;
  v11 = v25;
  v12 = a4;
  do
  {
    if (a3)
      printf("\nStoring freq%d %s: ", v9, a3);
    if (a6 >= 1)
    {
      v13 = v22;
      v14 = v12;
      v15 = v11;
      do
      {
        v16 = a5;
        if (a4)
          v16 = *v14;
        *v15 = v16;
        if (a3)
          printf("%2u ", v16);
        ++v15;
        ++v14;
        --v13;
      }
      while (v13);
    }
    ++v9;
    v11 = (_OWORD *)((char *)v11 + v23);
    v12 += 40;
  }
  while (v9 != 3);
  if (a3)
    printf("\n ");
  v17 = MTDeviceSetReport(a1, a2, (uint64_t)v25, 3 * a6);
  v18 = v17;
  if ((_DWORD)v17)
    printf("(error 0x%x setting report)\n", v17);
  return v18;
}

uint64_t MTZephyrGetRowCalibTable(uint64_t a1, int a2, const char *a3, _BYTE *a4, int a5)
{
  __int128 v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  _BYTE *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  unsigned int Report;
  _OWORD v20[7];
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
    printf("Querying %s table\n", a3);
  v21 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[5] = v10;
  v20[6] = v10;
  v20[3] = v10;
  v20[4] = v10;
  v20[1] = v10;
  v20[2] = v10;
  v20[0] = v10;
  Report = MTDeviceGetReport(a1, a2, v20, 3 * a5, 0);
  if (a5 <= 40 && a4 && !Report)
  {
    v11 = 0;
    v12 = (unsigned __int8 *)v20;
    do
    {
      if (a3)
        printf("\nFound freq%d %s: ", v11, a3);
      if (a5 >= 1)
      {
        v13 = a5;
        v14 = a4;
        v15 = v12;
        do
        {
          v17 = *v15++;
          v16 = v17;
          *v14 = v17;
          if (a3)
            printf("%2u ", v16);
          ++v14;
          --v13;
        }
        while (v13);
      }
      ++v11;
      v12 += a5;
      a4 += 40;
    }
    while (v11 != 3);
  }
  return Report;
}

uint64_t MTZephyrSetColCalibTable(uint64_t a1, int a2, uint64_t a3)
{
  return MTDeviceSetReport(a1, a2, a3, 54);
}

uint64_t MTZephyrGetColCalibTable(uint64_t a1, int a2, void *a3)
{
  int v4;

  v4 = 64;
  return MTDeviceGetReport(a1, a2, a3, 0x40u, &v4);
}

uint64_t MTZephyrSetPhantomACDMIDCalib(uint64_t a1, uint64_t a2)
{
  return MTDeviceSetReport(a1, 203, a2, 4);
}

uint64_t MTZephyrGetPhantomACDMIDCalib(uint64_t a1, void *a2)
{
  int v3;

  v3 = 0;
  return MTDeviceGetReport(a1, 203, a2, 4u, &v3);
}

uint64_t MTZephyrGetPhantomACDMIDColumnSamples(uint64_t a1, int a2, _WORD *a3, int a4)
{
  _WORD *v5;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v12;

  v5 = a3;
  v12 = 0;
  MTDeviceGetReport(a1, a2, a3, 2 * a4, &v12);
  if (a4 >= 1)
  {
    v7 = *(_DWORD *)(a1 + 100);
    v8 = a4;
    do
    {
      v9 = (unsigned __int16)*v5;
      v10 = bswap32(v9) >> 16;
      if (v7 != 1)
        LOWORD(v9) = v10;
      *v5++ = v9;
      --v8;
    }
    while (v8);
  }
  return 0;
}

uint64_t MTZephyrGetPhantomACDMIDCookie(uint64_t a1, void *a2)
{
  int v3;

  v3 = 0;
  return MTDeviceGetReport(a1, 204, a2, 1u, &v3);
}

uint64_t MTZephyrSetDemodTable(uint64_t a1, uint64_t a2, signed int a3)
{
  if (a3 <= 512)
    return MTDeviceSetReport(a1, 78, a2, a3);
  printf("Error:  table length (%d) cannot exceed %d!\n", a3, 512);
  return 0;
}

uint64_t MTZephyrGetDemodTable(uint64_t a1, void *a2, unsigned int *a3)
{
  uint64_t result;
  unsigned int v5;
  unsigned int v6;

  v6 = 0;
  if ((int)*a3 > 512)
  {
    printf("Error:  table length (%d) cannot exceed %d!\n", *a3, 512);
    v5 = 0;
    result = 0;
  }
  else
  {
    result = MTDeviceGetReport(a1, 78, a2, *a3, &v6);
    v5 = v6;
  }
  *a3 = v5;
  return result;
}

uint64_t MTZephyrWriteLookupTable(uint64_t a1)
{
  char v2;

  v2 = -86;
  return MTDeviceSetReport(a1, 79, (uint64_t)&v2, 1);
}

uint64_t MTZephyrRequestDemodulationStimCount()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  signed int v4;
  _BYTE *v5;
  BOOL v6;
  char v8;
  _BYTE v9[496];
  _BYTE v10[480];
  _BYTE v11[464];
  _BYTE v12[432];
  _BYTE v13[400];
  _BYTE v14[368];
  _BYTE v15[336];
  _BYTE v16[304];
  _BYTE __dst[272];
  _OWORD v18[16];
  _OWORD v19[15];
  _OWORD v20[13];
  _OWORD v21[11];
  uint64_t v22;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v22 = *MEMORY[0x24BDAC8D0];
  v21[8] = xmmword_21A1FDC00;
  v21[9] = unk_21A1FDC10;
  v21[10] = xmmword_21A1FDC20;
  v21[4] = xmmword_21A1FDBC0;
  v21[5] = unk_21A1FDBD0;
  v21[6] = xmmword_21A1FDBE0;
  v21[7] = unk_21A1FDBF0;
  v21[0] = xmmword_21A1FDB80;
  v21[1] = unk_21A1FDB90;
  v21[2] = xmmword_21A1FDBA0;
  v21[3] = unk_21A1FDBB0;
  v20[9] = unk_21A1FDCC0;
  v20[10] = xmmword_21A1FDCD0;
  v20[11] = unk_21A1FDCE0;
  v20[12] = xmmword_21A1FDCF0;
  v20[5] = unk_21A1FDC80;
  v20[6] = xmmword_21A1FDC90;
  v20[7] = unk_21A1FDCA0;
  v20[8] = xmmword_21A1FDCB0;
  v20[1] = unk_21A1FDC40;
  v20[2] = xmmword_21A1FDC50;
  v20[3] = unk_21A1FDC60;
  v20[4] = xmmword_21A1FDC70;
  v19[12] = xmmword_21A1FDDC0;
  v19[13] = unk_21A1FDDD0;
  v19[14] = xmmword_21A1FDDE0;
  v20[0] = xmmword_21A1FDC30;
  v19[8] = xmmword_21A1FDD80;
  v19[9] = unk_21A1FDD90;
  v19[10] = xmmword_21A1FDDA0;
  v19[11] = unk_21A1FDDB0;
  v19[4] = xmmword_21A1FDD40;
  v19[5] = unk_21A1FDD50;
  v19[6] = xmmword_21A1FDD60;
  v19[7] = unk_21A1FDD70;
  v19[0] = xmmword_21A1FDD00;
  v19[1] = unk_21A1FDD10;
  v19[2] = xmmword_21A1FDD20;
  v19[3] = unk_21A1FDD30;
  v18[12] = xmmword_21A1FDEB0;
  v18[13] = unk_21A1FDEC0;
  v18[14] = xmmword_21A1FDED0;
  v18[15] = unk_21A1FDEE0;
  v18[8] = xmmword_21A1FDE70;
  v18[9] = unk_21A1FDE80;
  v18[10] = xmmword_21A1FDE90;
  v18[11] = unk_21A1FDEA0;
  v18[4] = xmmword_21A1FDE30;
  v18[5] = unk_21A1FDE40;
  v18[6] = xmmword_21A1FDE50;
  v18[7] = unk_21A1FDE60;
  v18[0] = xmmword_21A1FDDF0;
  v18[1] = unk_21A1FDE00;
  v18[2] = xmmword_21A1FDE10;
  v18[3] = unk_21A1FDE20;
  memcpy(__dst, &unk_21A1FDEF0, sizeof(__dst));
  memcpy(v16, &unk_21A1FE000, sizeof(v16));
  memcpy(v15, &unk_21A1FE130, sizeof(v15));
  memcpy(v14, &unk_21A1FE280, sizeof(v14));
  memcpy(v13, &unk_21A1FE3F0, sizeof(v13));
  memcpy(v12, &unk_21A1FE580, sizeof(v12));
  memcpy(v11, &unk_21A1FE730, sizeof(v11));
  memcpy(v10, &unk_21A1FE900, sizeof(v10));
  v4 = 496;
  v5 = v9;
  memcpy(v9, &unk_21A1FEAE0, sizeof(v9));
  if ((int)v2 <= 31)
  {
    if ((_DWORD)v2 == 31)
    {
      v5 = v10;
      v4 = 480;
    }
    else if ((int)v2 <= 29)
    {
      if ((int)v2 <= 27)
      {
        if ((int)v2 <= 25)
        {
          if ((int)v2 <= 23)
          {
            if ((int)v2 <= 21)
            {
              if ((int)v2 <= 19)
              {
                if ((int)v2 <= 17)
                {
                  if ((_DWORD)v2 == 17)
                  {
                    v5 = v18;
                    v4 = 256;
                  }
                  else if ((int)v2 <= 15)
                  {
                    v6 = (int)v2 <= 13;
                    if ((int)v2 <= 13)
                      v2 = 12;
                    else
                      v2 = 14;
                    if (v6)
                      v4 = 176;
                    else
                      v4 = 208;
                    if (v6)
                      v5 = v21;
                    else
                      v5 = v20;
                  }
                  else
                  {
                    v5 = v19;
                    v4 = 240;
                    v2 = 16;
                  }
                }
                else
                {
                  v5 = __dst;
                  v4 = 272;
                  v2 = 18;
                }
              }
              else
              {
                v5 = v16;
                v4 = 304;
                v2 = 20;
              }
            }
            else
            {
              v5 = v15;
              v4 = 336;
              v2 = 22;
            }
          }
          else
          {
            v5 = v14;
            v4 = 368;
            v2 = 24;
          }
        }
        else
        {
          v5 = v13;
          v4 = 400;
          v2 = 26;
        }
      }
      else
      {
        v5 = v12;
        v4 = 432;
        v2 = 28;
      }
    }
    else
    {
      v5 = v11;
      v4 = 464;
      v2 = 30;
    }
  }
  else
  {
    v2 = 32;
  }
  MTZephyrSetDemodTable(v3, (uint64_t)v5, v4);
  v8 = -86;
  MTDeviceSetReport(v3, 79, (uint64_t)&v8, 1);
  return v2;
}

uint64_t mt_PostButtonStateCallbacks(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t i;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, _QWORD);

  if (result)
  {
    v3 = result;
    v4 = *(_DWORD *)(result + 200);
    if (v4 != (_DWORD)a2)
    {
      if (*(_BYTE *)(result + 648))
      {
        for (i = 0; i != 32; i += 8)
        {
          v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v3 + i + 616);
          if (v6)
            result = v6(v3, a2, *(unsigned int *)(v3 + 200), *(_QWORD *)(v3 + i + 656));
        }
        v4 = *(_DWORD *)(v3 + 200);
      }
      if ((v4 & ~(_DWORD)a2) != 0)
      {
        result = mt_PostNotificationEvent(v3, 17);
        v4 = *(_DWORD *)(v3 + 200);
      }
      if ((a2 & ~v4) != 0)
        result = mt_PostNotificationEvent(v3, 16);
      *(_DWORD *)(v3 + 200) = a2;
    }
  }
  return result;
}

uint64_t MTRegisterButtonStateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 0;
    while (1)
    {
      v5 = a1 + 8 * v4;
      if (!*(_QWORD *)(v5 + 616))
        break;
      if (++v4 == 4)
        return 0;
    }
    *(_QWORD *)(v5 + 616) = a2;
    *(_QWORD *)(v5 + 656) = a3;
    v3 = 1;
    *(_BYTE *)(a1 + 648) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterButtonStateCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    v4 = a1 + 616;
    while (*(_QWORD *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(v4 + 8 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 648) &= ~(1 << v3);
  }
  return v2;
}

uint64_t mt_PostTrackingCallbacks(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t i;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  if (a3 | a2)
  {
    v4 = result;
    if (result)
    {
      if (*(_BYTE *)(result + 720))
      {
        for (i = 0; i != 32; i += 8)
        {
          v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v4 + i + 688);
          if (v9)
            result = v9(v4, a2, a3, a4, *(_QWORD *)(v4 + i + 728));
        }
      }
    }
  }
  return result;
}

uint64_t mt_PostRelativePointerCallbacks(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t i;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  if (result)
  {
    v5 = result;
    if (*(_BYTE *)(result + 1728))
    {
      for (i = 0; i != 32; i += 8)
      {
        v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v5 + i + 1696);
        if (v11)
          result = v11(v5, a2, a3, a4, a5, *(_QWORD *)(v5 + i + 1736));
      }
    }
  }
  return result;
}

uint64_t MTRegisterRelativePointerCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 0;
    while (1)
    {
      v5 = a1 + 8 * v4;
      if (!*(_QWORD *)(v5 + 1696))
        break;
      if (++v4 == 4)
        return 0;
    }
    *(_QWORD *)(v5 + 1696) = a2;
    *(_QWORD *)(v5 + 1736) = a3;
    v3 = 1;
    *(_BYTE *)(a1 + 1728) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterRelativePointerCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    v4 = a1 + 1696;
    while (*(_QWORD *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(v4 + 8 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 1728) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTRegisterTrackingCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 0;
    while (1)
    {
      v5 = a1 + 8 * v4;
      if (!*(_QWORD *)(v5 + 688))
        break;
      if (++v4 == 4)
        return 0;
    }
    *(_QWORD *)(v5 + 688) = a2;
    *(_QWORD *)(v5 + 728) = a3;
    v3 = 1;
    *(_BYTE *)(a1 + 720) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterTrackingCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    v4 = a1 + 688;
    while (*(_QWORD *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(v4 + 8 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 720) &= ~(1 << v3);
  }
  return v2;
}

uint64_t mt_PostOffTableHeightCallbacks(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t i;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  if (result)
  {
    v5 = result;
    if (*(_DWORD *)(result + 204) != (_DWORD)a2)
    {
      if (*(_BYTE *)(result + 792))
      {
        for (i = 0; i != 32; i += 8)
        {
          v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v5 + i + 760);
          if (v9)
            result = v9(v5, a2, a3, a4, *(_QWORD *)(v5 + i + 800));
        }
      }
      *(_DWORD *)(v5 + 204) = a2;
    }
  }
  return result;
}

uint64_t MTRegisterOffTableHeightCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 0;
    while (1)
    {
      v5 = a1 + 8 * v4;
      if (!*(_QWORD *)(v5 + 760))
        break;
      if (++v4 == 4)
        return 0;
    }
    *(_QWORD *)(v5 + 760) = a2;
    *(_QWORD *)(v5 + 800) = a3;
    v3 = 1;
    *(_BYTE *)(a1 + 792) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterOffTableHeightCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    v4 = a1 + 760;
    while (*(_QWORD *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(v4 + 8 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 792) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTRegisterOpticalProximityChangedCallback(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 0;
    while (*(_QWORD *)(a1 + 1844 + 8 * v4 - 1012))
    {
      if (++v4 == 4)
        return 0;
    }
    *(_QWORD *)(a1 + 1844 + 8 * v4 - 1012) = a2;
    *(_WORD *)(a1 + 1844 + 2 * v4) = a3;
    v3 = 1;
    *(_BYTE *)(a1 + 864) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterOpticalProximityChangedCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    while (*(_QWORD *)(a1 + 1844 + 8 * v3 - 1012) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(a1 + 1844 + 8 * v3 - 1012) = 0;
    *(_WORD *)(a1 + 1844 + 2 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 864) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTAlg_IssueOpticalProximityCallback(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  float v4;
  float v5;
  uint64_t i;
  uint64_t (*v7)(uint64_t, uint64_t);
  unsigned int v8;
  uint64_t v9;
  float v10;
  float v11;

  if (result)
  {
    v3 = result;
    v4 = *(float *)(result + 1852);
    v5 = v4 * 0.875 + (double)(int)a2 * 0.125;
    *(float *)(result + 1852) = v5;
    if (*(_BYTE *)(result + 864))
    {
      for (i = 0; i != 4; ++i)
      {
        v7 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * i + 832);
        if (v7)
        {
          v8 = *(unsigned __int16 *)(v3 + 2 * i + 1844);
          v9 = a2;
          if (*(_WORD *)(v3 + 2 * i + 1844))
          {
            v10 = (float)v8;
            if (v4 <= (float)v8 || (v11 = *(float *)(v3 + 1852), v11 >= v10))
            {
              if (v4 >= v10)
                continue;
              v11 = *(float *)(v3 + 1852);
              if (v11 <= v10)
                continue;
            }
            v9 = (int)v11;
          }
          result = v7(v3, v9);
        }
      }
    }
  }
  return result;
}

uint64_t MTRegisterFarfieldProximityChangedCallback(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 0;
    while (*(_QWORD *)(a1 + 1856 + 8 * v4 - 952))
    {
      if (++v4 == 4)
        return 0;
    }
    *(_QWORD *)(a1 + 1856 + 8 * v4 - 952) = a2;
    *(_WORD *)(a1 + 1856 + 2 * v4) = a3;
    v3 = 1;
    *(_BYTE *)(a1 + 936) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterFarfieldProximityChangedCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    while (*(_QWORD *)(a1 + 1856 + 8 * v3 - 952) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(a1 + 1856 + 8 * v3 - 952) = 0;
    *(_WORD *)(a1 + 1856 + 2 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 936) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTAlg_IssueFarfieldProximityCallback(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;
  float v4;
  uint64_t i;
  uint64_t (*v7)(uint64_t, uint64_t);
  unsigned int v8;
  uint64_t v9;
  float v10;
  float v11;

  if (result)
  {
    v3 = result;
    v4 = *(float *)(result + 1864);
    *(float *)(result + 1864) = (float)a2;
    if (*(_BYTE *)(result + 936))
    {
      for (i = 0; i != 4; ++i)
      {
        v7 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * i + 904);
        if (v7)
        {
          v8 = *(unsigned __int16 *)(v3 + 2 * i + 1856);
          v9 = a3;
          if (*(_WORD *)(v3 + 2 * i + 1856))
          {
            v10 = (float)v8;
            if (v4 <= (float)v8 || (v11 = *(float *)(v3 + 1864), v11 >= v10))
            {
              if (v4 >= v10)
                continue;
              v11 = *(float *)(v3 + 1864);
              if (v11 <= v10)
                continue;
            }
            v9 = (int)v11;
          }
          result = v7(v3, v9);
        }
      }
    }
  }
  return result;
}

uint64_t MTRegisterInputDetectionCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 0;
    while (1)
    {
      v5 = a1 + 8 * v4;
      if (!*(_QWORD *)(v5 + 976))
        break;
      if (++v4 == 4)
        return 0;
    }
    *(_QWORD *)(v5 + 976) = a2;
    *(_QWORD *)(v5 + 1016) = a3;
    v3 = 1;
    *(_BYTE *)(a1 + 1008) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterInputDetectionCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    v4 = a1 + 976;
    while (*(_QWORD *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(v4 + 8 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 1008) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTDeviceSetInputDetectionCallbackTriggerMask(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 196) = a2;
  return result;
}

uint64_t MTAlg_IssueInputDetectionStateCallback(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  if (result)
  {
    v4 = result;
    v5 = *(_DWORD *)(result + 196) & a2;
    if (*(_DWORD *)(result + 192) != (_DWORD)v5)
    {
      if (*(_BYTE *)(result + 1008))
      {
        for (i = 0; i != 32; i += 8)
        {
          v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v4 + i + 976);
          if (v9)
            result = v9(v4, v5, a3, a4, *(_QWORD *)(v4 + i + 1016));
        }
      }
      *(_DWORD *)(v4 + 192) = v5;
    }
  }
  return result;
}

uint64_t MTInputDetectionSetEnabled(uint64_t result, __int16 a2)
{
  if (result)
    return mt_SetDetectableInputTypes(result, a2);
  return result;
}

uint64_t MTSetDetectableAndSuppressingInputs(uint64_t a1, __int16 a2, __int16 a3, __int16 a4, __int16 a5)
{
  int v5;
  __int16 v6;
  BOOL v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  signed int v12;
  _WORD v14[4];

  if (!a1)
    return 3758097090;
  v5 = *(_DWORD *)(a1 + 100);
  v6 = __rev16(a2);
  v7 = v5 == 1;
  if (v5 == 1)
    v8 = a2;
  else
    v8 = v6;
  v14[0] = v8;
  v9 = __rev16(a3);
  if (v7)
    v9 = a3;
  v14[1] = v9;
  v10 = __rev16(a4);
  if (v7)
    v10 = a4;
  v14[2] = v10;
  v11 = __rev16(a5);
  if (v7)
    v11 = a5;
  v14[3] = v11;
  if (*(_BYTE *)(a1 + 114))
    v12 = 8;
  else
    v12 = 4;
  return MTDeviceSetReport(a1, 191, (uint64_t)v14, v12);
}

uint64_t MTSetDetectableInputs(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  __int16 v5;
  __int16 v6;
  signed int v7;
  unint64_t v8;

  if (!a1)
    return 3758097090;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  result = MTDeviceGetReport(a1, 191, &v8, 8u, 0);
  if (!(_DWORD)result)
  {
    v5 = __rev16(a2);
    if (*(_DWORD *)(a1 + 100) == 1)
      v6 = a2;
    else
      v6 = v5;
    LOWORD(v8) = v6;
    if (*(_BYTE *)(a1 + 114))
      v7 = 8;
    else
      v7 = 4;
    return MTDeviceSetReport(a1, 191, (uint64_t)&v8, v7);
  }
  return result;
}

uint64_t MTGetDetectableInputs(uint64_t a1)
{
  unsigned int v3;
  unint64_t v5;

  if (a1)
  {
    v5 = 0xAAAAAAAAAAAAAAAALL;
    if (MTDeviceGetReport(a1, 191, &v5, 8u, 0))
    {
      return 0;
    }
    else
    {
      v3 = bswap32((unsigned __int16)v5) >> 16;
      if (*(_DWORD *)(a1 + 100) == 1)
        return (unsigned __int16)v5;
      else
        return (unsigned __int16)v3;
    }
  }
  else
  {
    return 0;
  }
}

uint64_t MTSetInputsThatSuppressFingers(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  __int16 v5;
  __int16 v6;
  signed int v7;
  unint64_t v8;

  if (!a1)
    return 3758097090;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  result = MTDeviceGetReport(a1, 191, &v8, 8u, 0);
  if (!(_DWORD)result)
  {
    v5 = __rev16(a2);
    if (*(_DWORD *)(a1 + 100) == 1)
      v6 = a2;
    else
      v6 = v5;
    WORD1(v8) = v6;
    if (*(_BYTE *)(a1 + 114))
      v7 = 8;
    else
      v7 = 4;
    return MTDeviceSetReport(a1, 191, (uint64_t)&v8, v7);
  }
  return result;
}

uint64_t MTGetInputsThatSuppressFingers(uint64_t a1)
{
  unsigned int v3;
  unint64_t v5;

  if (a1)
  {
    v5 = 0xAAAAAAAAAAAAAAAALL;
    if (MTDeviceGetReport(a1, 191, &v5, 8u, 0))
    {
      return 0;
    }
    else
    {
      v3 = bswap32(WORD1(v5)) >> 16;
      if (*(_DWORD *)(a1 + 100) == 1)
        return (unsigned __int16)WORD1(v5);
      else
        return (unsigned __int16)v3;
    }
  }
  else
  {
    return 0;
  }
}

uint64_t MTDeviceSetFaceDetectionModeEnabled(uint64_t a1, char a2)
{
  if (a1 && !MTDeviceShouldSkipFaceDetectionMode(a1))
    return MTDeviceSetZephyrParameter(a1, 175, a2);
  else
    return 0;
}

uint64_t MTDeviceSetInputDetectionMode(uint64_t a1, int a2)
{
  return MTDeviceSetInputDetectionModeForOrientation(a1, a2, 0);
}

uint64_t MTDeviceSetInputDetectionModeForOrientation(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  char v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  _BOOL4 v22;

  if (!a1)
    return 3758097090;
  kdebug_trace();
  v6 = 3758096385;
  if (a2 > 252)
  {
    if (a2 == 253)
    {
      v18 = *(unsigned __int8 *)(a1 + 114) << 12;
      v19 = a1;
      v20 = 4096;
    }
    else
    {
      if (a2 != 254)
      {
        if (a2 == 255)
        {
          mt_PostNotificationEvent(a1, 23);
          mt_PostNotificationEventToDriver((io_service_t *)a1, 123);
          v6 = 0;
        }
        goto LABEL_48;
      }
      v18 = *(unsigned __int8 *)(a1 + 114) << 12;
      v19 = a1;
      v20 = 4097;
    }
    v6 = MTSetDetectableAndSuppressingInputs(v19, v20, 9, v18, 0);
    mt_PostNotificationEvent(a1, 31);
    mt_PostNotificationEventToDriver((io_service_t *)a1, 131);
  }
  else
  {
    switch(a2)
    {
      case 0:
        if ((a3 - 3) >= 2)
          v7 = 413;
        else
          v7 = 409;
        v8 = 9;
        v6 = MTSetDetectableAndSuppressingInputs(a1, v7, 9, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        v9 = 109;
        goto LABEL_37;
      case 1:
        if ((a3 - 3) >= 2)
          v10 = 477;
        else
          v10 = 473;
        v6 = MTSetDetectableAndSuppressingInputs(a1, v10, 73, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        v9 = 110;
        v8 = 10;
        goto LABEL_37;
      case 2:
        if ((a3 - 3) >= 2)
          v11 = -32355;
        else
          v11 = -32359;
        v6 = MTSetDetectableAndSuppressingInputs(a1, v11, 32777, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        v9 = 120;
        v8 = 20;
        goto LABEL_37;
      case 3:
        if ((a3 - 3) >= 2)
          v12 = 2461;
        else
          v12 = 2457;
        v6 = MTSetDetectableAndSuppressingInputs(a1, v12, 9, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        v9 = 121;
        v8 = 21;
        goto LABEL_37;
      case 4:
        if ((a3 - 3) >= 2)
          v13 = 2525;
        else
          v13 = 2521;
        v6 = MTSetDetectableAndSuppressingInputs(a1, v13, 73, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        v9 = 122;
        v8 = 22;
        goto LABEL_37;
      case 5:
        if ((a3 - 3) >= 2)
          v14 = 927;
        else
          v14 = 923;
        v6 = MTSetDetectableAndSuppressingInputs(a1, v14, 523, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        v9 = 124;
        v8 = 24;
        goto LABEL_37;
      case 6:
        if ((a3 - 3) >= 2)
          v15 = 2975;
        else
          v15 = 2971;
        v6 = MTSetDetectableAndSuppressingInputs(a1, v15, 523, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        v9 = 125;
        v8 = 25;
LABEL_37:
        mt_PostNotificationEvent(a1, v8);
        mt_PostNotificationEventToDriver((io_service_t *)a1, v9);
        if (!(_DWORD)v6)
        {
          v17 = a2 == 4 || (a2 - 1) < 2;
          v6 = MTDeviceSetFaceDetectionModeEnabled(a1, v17);
        }
        break;
      default:
        break;
    }
  }
LABEL_48:
  v22 = a2 == 253 || (a2 & 0xFFFE) == 254;
  MTDeviceUpdateUILockState(a1, v22);
  return v6;
}

uint64_t MTDeviceSetTouchMode(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  __int16 v7;
  char v8;
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  _BOOL4 v16;

  kdebug_trace();
  v6 = 3758096385;
  if (a2 > 252)
  {
    if (a2 == 253)
    {
      v12 = *(unsigned __int8 *)(a1 + 114) << 12;
      v13 = a1;
      v14 = 4096;
    }
    else
    {
      if (a2 != 254)
      {
        if (a2 == 255)
        {
          mt_PostNotificationEvent(a1, 23);
          mt_PostNotificationEventToDriver((io_service_t *)a1, 123);
          v6 = 0;
        }
        goto LABEL_26;
      }
      v12 = *(unsigned __int8 *)(a1 + 114) << 12;
      v13 = a1;
      v14 = 4097;
    }
    v6 = MTSetDetectableAndSuppressingInputs(v13, v14, 9, v12, 0);
    mt_PostNotificationEvent(a1, 31);
    mt_PostNotificationEventToDriver((io_service_t *)a1, 131);
    goto LABEL_26;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      if ((a3 - 3) >= 2)
        v11 = -31841;
      else
        v11 = -31845;
      v6 = MTSetDetectableAndSuppressingInputs(a1, v11, 523, *(unsigned __int8 *)(a1 + 114) << 12, 0);
      v9 = 25;
      v8 = 25;
    }
    else
    {
      if (a2 != 2)
        goto LABEL_26;
      if ((a3 - 3) >= 2)
        v7 = -32355;
      else
        v7 = -32359;
      v6 = MTSetDetectableAndSuppressingInputs(a1, v7, 32777, *(unsigned __int8 *)(a1 + 114) << 12, 0);
      v8 = 110;
      v9 = 10;
    }
  }
  else
  {
    if ((a3 - 3) >= 2)
      v10 = -32355;
    else
      v10 = -32359;
    v6 = MTSetDetectableAndSuppressingInputs(a1, v10, 9, *(unsigned __int8 *)(a1 + 114) << 12, 0);
    v9 = 21;
    v8 = 21;
  }
  mt_PostNotificationEvent(a1, v9);
  mt_PostNotificationEventToDriver((io_service_t *)a1, v8);
  if (!(_DWORD)v6)
    v6 = MTDeviceSetFaceDetectionModeEnabled(a1, a2 == 2);
LABEL_26:
  v16 = a2 == 253 || (a2 & 0xFFFE) == 254;
  MTDeviceUpdateUILockState(a1, v16);
  return v6;
}

uint64_t mt_UpdateDeviceOrientation(uint64_t result, int a2, int a3)
{
  char v3;
  uint64_t v4;

  if (*(unsigned __int16 *)(result + 208) != a2)
  {
    *(_WORD *)(result + 208) = a2;
    if (a2 == 2)
    {
      if (a3)
      {
        v3 = 19;
        return mt_PostNotificationEventToDriver((io_service_t *)result, v3);
      }
      v4 = 119;
      return mt_PostNotificationEvent(result, v4);
    }
    if (!a2)
    {
      if (a3)
      {
        v3 = 118;
        return mt_PostNotificationEventToDriver((io_service_t *)result, v3);
      }
      v4 = 18;
      return mt_PostNotificationEvent(result, v4);
    }
  }
  return result;
}

uint64_t MTDeviceSetSurfaceOrientation(uint64_t a1, int a2)
{
  uint64_t result;
  char v5;
  char v6;

  result = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a2 != 2)
        return 3758097095;
      v5 = 2;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;
    result = MTDeviceSetReport(a1, 220, (uint64_t)&v6, 1);
    if (!(_DWORD)result)
    {
      mt_UpdateDeviceOrientation(a1, a2, 1);
      return 0;
    }
  }
  return result;
}

uint64_t MTDeviceSetSurfaceOrientationMode(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v4 = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a2 != 1)
        return 3758097095;
      v5 = 1;
    }
    else
    {
      v5 = 2;
    }
    v8 = v2;
    v9 = v3;
    v7 = v5;
    return MTDeviceSetReport(a1, 221, (uint64_t)&v7, 1);
  }
  return v4;
}

uint64_t mt_PostStatisticsChannelEvent(uint64_t result)
{
  uint64_t v1;
  uint64_t i;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, float, float);

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 1440))
    {
      for (i = 0; i != 32; i += 8)
      {
        v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, float, float))(v1 + i + 1408);
        if (v3)
          result = v3(v1, 5, v1 + 1900, *(float *)(v1 + i + 1920), *(float *)(v1 + i + 1924));
      }
    }
  }
  return result;
}

uint64_t mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc(uint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  if (result)
  {
    if ((a4 & 1) == 0)
      return mt_PostStatisticsChannelEvent(result);
  }
  return result;
}

uint64_t mt_InitializeStatisticsChannelState(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 2000))
    {
      result = MTRegisterFrameProcessingEntryExitCallback(result, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(_BYTE *)(v1 + 2000) = 1;
    }
  }
  return result;
}

uint64_t MTRegisterStatisticsChannelCallback(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = 0;
  if (a1 && a2)
  {
    if (!*(_BYTE *)(a1 + 2000))
    {
      MTRegisterFrameProcessingEntryExitCallback(a1, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(_BYTE *)(a1 + 2000) = 1;
    }
    v5 = 0;
    v6 = a1 + 1408;
    while (*(_QWORD *)(v6 + 8 * v5) != a2)
    {
      if (++v5 == 4)
        return 0;
    }
    *(_QWORD *)(v6 + 8 * v5) = 0;
    result = 1;
    *(_BYTE *)(a1 + 1440) |= 1 << v5;
  }
  return result;
}

uint64_t MTUnregisterStatisticsChannelCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = 0;
    v4 = a1 + 1408;
    while (*(_QWORD *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4)
        return 0;
    }
    *(_QWORD *)(v4 + 8 * v3) = 0;
    v2 = 1;
    *(_BYTE *)(a1 + 1440) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTStatisticsChannelGetValues(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (result && a2)
  {
    v7 = result;
    if (!*(_BYTE *)(result + 2000))
    {
      result = MTRegisterFrameProcessingEntryExitCallback(result, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(_BYTE *)(v7 + 2000) = 1;
    }
    v8 = 0;
    if (a2 >= 5)
      v9 = 5;
    else
      v9 = a2;
    v10 = v7 + 1900;
    do
    {
      if (a3)
        *(_DWORD *)(a3 + 4 * v8) = *(_DWORD *)(v10 + 4 * v8);
      if (a4)
        *(_QWORD *)(a4 + 8 * v8) = *(_QWORD *)(v10 + 8 * v8 + 20);
      ++v8;
    }
    while (v9 != v8);
  }
  return result;
}

uint64_t MTStatisticsChannelGetName(uint64_t result, int a2)
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if (!*(_BYTE *)(result + 2000))
    {
      MTRegisterFrameProcessingEntryExitCallback(result, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(_BYTE *)(v3 + 2000) = 1;
    }
    if ((a2 - 6) >= 0xFFFFFFFB)
      return *(_QWORD *)(v3 + 8 * (a2 - 1) + 1960);
    else
      return 0;
  }
  return result;
}

uint64_t MTGetGenericParameterValue()
{
  return 0;
}

uint64_t lsqrt(unsigned int a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  v1 = 0;
  v2 = 0;
  v3 = 16;
  do
  {
    v4 = 2 * v1;
    v5 = __PAIR64__(v2, a1) >> 30;
    a1 *= 4;
    v6 = (2 * v1) | 1;
    v1 = 2 * v1 + 2;
    if (v6 > v5)
    {
      v6 = 0;
      v1 = v4;
    }
    v2 = v5 - v6;
    --v3;
  }
  while (v3);
  return (unsigned __int16)(v1 >> 1);
}

BOOL MTSetCallModeForFrameworkNotDevice(uint64_t a1, int a2)
{
  uint64_t AlgLibStateRef;
  __int16 v4;
  __int16 v5;

  AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  if (AlgLibStateRef)
  {
    if (a2)
      v4 = 989;
    else
      v4 = 413;
    if (a2)
      v5 = 73;
    else
      v5 = 9;
    *(_WORD *)(AlgLibStateRef + 392) = v4;
    *(_WORD *)(AlgLibStateRef + 394) = v5;
  }
  return AlgLibStateRef != 0;
}

uint64_t mt_SetDetectableInputTypes(uint64_t result, __int16 a2)
{
  if (result)
  {
    result = MTAlg_GetAlgLibStateRef(result);
    if (result)
      *(_WORD *)(result + 392) = a2;
  }
  return result;
}

uint64_t plalgs_GetDetectableInputTypes(uint64_t a1)
{
  uint64_t result;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
    return *(unsigned __int16 *)(result + 392);
  return result;
}

uint64_t mt_SetSuppressableInputTypes(uint64_t a1, __int16 a2)
{
  uint64_t result;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
    *(_WORD *)(result + 394) = a2;
  return result;
}

uint64_t mt_GetSuppressableInputTypes(uint64_t a1)
{
  uint64_t result;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
    return *(unsigned __int16 *)(result + 394);
  return result;
}

uint64_t _mthid_anyAvailableDevice()
{
  return _mthid_anyAvailableDeviceOfType(0);
}

uint64_t _mthid_anyAvailableDeviceOfType(const __CFString *a1)
{
  __CFArray *v2;
  __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  uint64_t v9;
  BOOL v10;

  v2 = _mthid_copyAvailableDevicesInfo();
  v3 = v2;
  if (!v2)
  {
    if (a1)
      return 0;
    v5 = 0;
LABEL_14:
    if (v3)
      v10 = v5 <= 0;
    else
      v10 = 1;
    v9 = !v10;
    if (!v3)
      return v9;
LABEL_21:
    CFRelease(v3);
    return v9;
  }
  Count = CFArrayGetCount(v2);
  v5 = Count;
  if (!a1)
    goto LABEL_14;
  if (Count < 1)
  {
    v9 = 0;
    goto LABEL_21;
  }
  v6 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
    Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Device Type"));
    if (Value)
    {
      if (CFStringCompare(Value, a1, 0) == kCFCompareEqualTo)
        break;
    }
    if (v5 == ++v6)
    {
      v9 = 0;
      if (v3)
        goto LABEL_21;
      return v9;
    }
  }
  v9 = 1;
  if (v3)
    goto LABEL_21;
  return v9;
}

__CFArray *_mthid_copyAvailableDevicesInfo()
{
  __CFArray *Mutable;
  __CFArray *v1;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 10, MEMORY[0x24BDBD690]);
  v1 = Mutable;
  if (Mutable)
  {
    appendAvailableDevicesInfo(Mutable, "AppleUSBMultitouchDriver");
    appendAvailableDevicesInfo(v1, "AppleMultitouchDevice");
  }
  return v1;
}

void appendAvailableDevicesInfo(__CFArray *a1, char *name)
{
  CFMutableDictionaryRef v3;
  __CFDictionary *v4;
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  io_object_t v7;
  io_object_t v8;
  uint64_t v9;
  const void *v10;
  __CFDictionary *DeviceInfoForDevice;
  __CFDictionary *v12;
  io_iterator_t existing;

  if (name)
  {
    existing = 0;
    v3 = IOServiceMatching(name);
    if (v3)
    {
      v4 = v3;
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v6 = Mutable;
        CFDictionarySetValue(Mutable, CFSTR("MTHIDDevice"), (const void *)*MEMORY[0x24BDBD270]);
        CFDictionarySetValue(v4, CFSTR("IOPropertyMatch"), v6);
        CFRelease(v6);
        if (!IOServiceGetMatchingServices(0, v4, &existing))
        {
          v7 = IOIteratorNext(existing);
          if (v7)
          {
            v8 = v7;
            do
            {
              v9 = MTDeviceCreateFromService(v8);
              if (v9)
              {
                v10 = (const void *)v9;
                DeviceInfoForDevice = createDeviceInfoForDevice(v9);
                if (DeviceInfoForDevice)
                {
                  v12 = DeviceInfoForDevice;
                  CFArrayAppendValue(a1, DeviceInfoForDevice);
                  CFRelease(v12);
                }
                CFRelease(v10);
              }
              IOObjectRelease(v8);
              v8 = IOIteratorNext(existing);
            }
            while (v8);
          }
          IOObjectRelease(existing);
        }
      }
      else
      {
        CFRelease(v4);
      }
    }
  }
}

uint64_t _mthid_copyDeviceInfo(uint64_t a1)
{
  uint64_t result;
  const void *v2;
  __CFDictionary *DeviceInfoForDevice;

  result = mt_DeviceCreateFromDeviceID(a1, 0);
  if (result)
  {
    v2 = (const void *)result;
    DeviceInfoForDevice = createDeviceInfoForDevice(result);
    CFRelease(v2);
    return (uint64_t)DeviceInfoForDevice;
  }
  return result;
}

__CFDictionary *createDeviceInfoForDevice(uint64_t a1)
{
  unsigned int ParserType;
  int IsBuiltIn;
  int v4;
  int v5;
  _BOOL4 v8;
  __CFDictionary *Mutable;
  const __CFAllocator *v11;
  CFNumberRef v12;
  CFNumberRef v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  CFNumberRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  CFNumberRef v23;
  const __CFString *v24;
  const __CFString *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t valuePtr;

  valuePtr = 0;
  v28 = -1431655766;
  v29 = -1431655766;
  ParserType = MTDeviceGetParserType(a1);
  IsBuiltIn = MTDeviceIsBuiltIn(a1);
  v4 = MTDeviceSupportsActuation(a1);
  v5 = MTDeviceSupportsForce(a1);
  v8 = ParserType > 0x3E7 && ParserType - 4000 < 0xFFFFFC18 || ParserType == 2;
  Mutable = 0;
  if (!MTDeviceGetDeviceID(a1, &valuePtr))
  {
    Mutable = 0;
    if (!MTDeviceGetSensorSurfaceDimensions(a1, (unint64_t)&v29, (unint64_t)&v28))
    {
      if (valuePtr)
      {
        if (v29)
        {
          if (v28)
          {
            v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            if (Mutable)
            {
              v26 = v28 / 0x64;
              v27 = v29 / 0x64;
              v12 = CFNumberCreate(v11, kCFNumberSInt64Type, &valuePtr);
              if (v12)
              {
                v13 = v12;
                CFDictionarySetValue(Mutable, CFSTR("Device ID"), v12);
                CFRelease(v13);
              }
              v14 = (const void *)*MEMORY[0x24BDBD270];
              v15 = (const void *)*MEMORY[0x24BDBD268];
              if (IsBuiltIn)
                v16 = (const void *)*MEMORY[0x24BDBD270];
              else
                v16 = (const void *)*MEMORY[0x24BDBD268];
              CFDictionarySetValue(Mutable, CFSTR("Built-in"), v16);
              if (v8)
                v17 = v14;
              else
                v17 = v15;
              CFDictionarySetValue(Mutable, CFSTR("Opaque"), v17);
              if (v4)
                v18 = v14;
              else
                v18 = v15;
              CFDictionarySetValue(Mutable, CFSTR("SupportsActuation"), v18);
              if (v5)
                v19 = v14;
              else
                v19 = v15;
              CFDictionarySetValue(Mutable, CFSTR("SupportsForce"), v19);
              v20 = CFNumberCreate(v11, kCFNumberSInt32Type, &v27);
              if (v20)
              {
                v21 = v20;
                CFDictionarySetValue(Mutable, CFSTR("Surface Width mm"), v20);
                CFRelease(v21);
              }
              v22 = CFNumberCreate(v11, kCFNumberSInt32Type, &v26);
              if (v22)
              {
                v23 = v22;
                CFDictionarySetValue(Mutable, CFSTR("Surface Height mm"), v22);
                CFRelease(v23);
              }
              if (ParserType - 2000 >= 0x3E8)
                v24 = CFSTR("Simple");
              else
                v24 = CFSTR("Mouse");
              if (ParserType - 1000 >= 0x3E8)
                v25 = v24;
              else
                v25 = CFSTR("Trackpad");
              CFDictionarySetValue(Mutable, CFSTR("Device Type"), v25);
            }
          }
        }
      }
    }
  }
  return Mutable;
}

uint64_t _mthid_copyDeviceInfoForService(io_object_t a1)
{
  uint64_t result;
  const void *v2;
  __CFDictionary *DeviceInfoForDevice;

  result = MTDeviceCreateFromService(a1);
  if (result)
  {
    v2 = (const void *)result;
    DeviceInfoForDevice = createDeviceInfoForDevice(result);
    CFRelease(v2);
    return (uint64_t)DeviceInfoForDevice;
  }
  return result;
}

uint64_t _mthid_getDeviceIDForService(io_registry_entry_t a1)
{
  const __CFAllocator *v2;
  const __CFNumber *CFProperty;
  const __CFNumber *v4;
  CFTypeID v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  CFTypeID v8;
  uint64_t valuePtr;

  valuePtr = 0;
  if (a1)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("mt-device-id"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!CFProperty)
      goto LABEL_6;
    v4 = CFProperty;
    v5 = CFGetTypeID(CFProperty);
    if (v5 == CFNumberGetTypeID())
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
    CFRelease(v4);
    if (!valuePtr)
    {
LABEL_6:
      v6 = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("Multitouch ID"), v2, 0);
      if (v6)
      {
        v7 = v6;
        v8 = CFGetTypeID(v6);
        if (v8 == CFNumberGetTypeID())
          CFNumberGetValue(v7, kCFNumberSInt64Type, &valuePtr);
        CFRelease(v7);
      }
    }
  }
  return valuePtr;
}

uint64_t _mthid_getDeviceIDForRegistryEntryID(uint64_t a1)
{
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  uint64_t DeviceIDForService;

  v1 = IORegistryEntryIDMatching(a1);
  MatchingService = IOServiceGetMatchingService(0, v1);
  if (!MatchingService)
    return 0;
  v3 = MatchingService;
  DeviceIDForService = _mthid_getDeviceIDForService(MatchingService);
  IOObjectRelease(v3);
  return DeviceIDForService;
}

uint64_t _mthid_isPathCollection(uint64_t result)
{
  if (result)
  {
    if (IOHIDEventGetType() == 11)
    {
      result = IOHIDEventGetIntegerValue();
      if (result)
        return _mthid_pathCollectionGetDeviceID() != 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *_mthid_pathCollectionGetDeviceID()
{
  const __CFArray *result;
  const __CFArray *v1;
  int Count;
  CFIndex v3;

  result = (const __CFArray *)IOHIDEventGetChildren();
  if (result)
  {
    v1 = result;
    Count = CFArrayGetCount(result);
    if (Count >= 1)
    {
      v3 = (Count - 1);
      do
      {
        CFArrayGetValueAtIndex(v1, v3);
        if (IOHIDEventGetType() == 1)
          IOHIDEventGetVendorDefinedData();
      }
      while (v3-- > 0);
    }
    return 0;
  }
  return result;
}

BOOL _mthid_pathCollectionIsTouching()
{
  return IOHIDEventGetIntegerValue() == 1;
}

const __CFArray *_mthid_pathCollectionCopyAllPaths()
{
  const __CFArray *Mutable;
  const __CFArray *Children;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const void *ValueAtIndex;
  CFIndex v7;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      v2 = Children;
      Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        v4 = Count;
        for (i = 0; i != v4; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
          if (_mthid_isPath((_BOOL8)ValueAtIndex))
          {
            v7 = CFArrayGetCount(Mutable);
            CFArrayInsertValueAtIndex(Mutable, v7, ValueAtIndex);
          }
        }
      }
    }
  }
  return Mutable;
}

BOOL _mthid_isPath(_BOOL8 result)
{
  if (result)
    return IOHIDEventGetType() == 11 && IOHIDEventGetIntegerValue() == 0;
  return result;
}

const __CFArray *_mthid_pathCollectionCopyTouchingPaths()
{
  const __CFArray *Mutable;
  const __CFArray *Children;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const void *ValueAtIndex;
  CFIndex v7;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      v2 = Children;
      Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        v4 = Count;
        for (i = 0; i != v4; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
          if (_mthid_isPath((_BOOL8)ValueAtIndex) && IOHIDEventGetIntegerValue() == 1)
          {
            v7 = CFArrayGetCount(Mutable);
            CFArrayInsertValueAtIndex(Mutable, v7, ValueAtIndex);
          }
        }
      }
    }
  }
  return Mutable;
}

BOOL _mthid_pathIsTouching()
{
  return IOHIDEventGetIntegerValue() == 1;
}

double _mthid_pathCollectionGetPosition()
{
  double v0;
  double v1;

  IOHIDEventGetFloatValue();
  v1 = v0;
  IOHIDEventGetFloatValue();
  return v1;
}

uint64_t _mthid_pathCollectionGetForce()
{
  return IOHIDEventGetFloatValue();
}

unint64_t _mthid_pathIsResting()
{
  return ((unint64_t)IOHIDEventGetIntegerValue() >> 9) & 1;
}

BOOL _mthid_pathIsStationary()
{
  return (IOHIDEventGetIntegerValue() & 4) == 0;
}

BOOL _mthid_pathWasRejected()
{
  return IOHIDEventGetIntegerValue() < 1 || IOHIDEventGetIntegerValue() > 5;
}

uint64_t _mthid_pathGetIndex()
{
  return IOHIDEventGetIntegerValue();
}

double _mthid_pathGetPosition()
{
  double v0;
  double v1;

  IOHIDEventGetFloatValue();
  v1 = v0;
  IOHIDEventGetFloatValue();
  return v1;
}

double _mthid_pathGetVelocity()
{
  double v0;
  double v1;

  if (!IOHIDEventGetEvent())
    return 0.0;
  IOHIDEventGetFloatValue();
  v1 = v0;
  IOHIDEventGetFloatValue();
  return v1;
}

uint64_t _mthid_pathGetForce()
{
  return IOHIDEventGetFloatValue();
}

CFDictionaryRef _mthid_createGestureConfiguration()
{
  const __CFAllocator *v0;
  CFNumberRef v1;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v3;
  BOOL v4;
  CFDictionaryRef v5;
  CFDictionaryRef v7;
  int valuePtr;
  void *values[2];
  void *keys[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  valuePtr = 1;
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  Mutable = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
  v3 = Mutable;
  *(_OWORD *)keys = xmmword_24DC7DE78;
  values[0] = v1;
  values[1] = Mutable;
  if (v1)
    v4 = Mutable == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v7 = CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    goto LABEL_10;
  }
  v7 = 0;
  v5 = 0;
  if (v1)
  {
LABEL_10:
    CFRelease(v1);
    v5 = v7;
    if (!v3)
      return v5;
    goto LABEL_8;
  }
  if (Mutable)
LABEL_8:
    CFRelease(v3);
  return v5;
}

uint64_t _mthid_isGestureConfigurationValid(uint64_t result)
{
  const __CFDictionary *v1;
  CFTypeID v2;
  const void *Value;
  const void *v4;
  const void *v5;
  CFTypeID v6;
  int v7;
  CFTypeID v8;
  CFTypeID TypeID;
  CFIndex v10;
  const void *ValueAtIndex;
  CFTypeID v12;
  CFTypeID v13;
  CFIndex Count;
  int valuePtr;

  if (result)
  {
    v1 = (const __CFDictionary *)result;
    v2 = CFGetTypeID((CFTypeRef)result);
    if (v2 != CFDictionaryGetTypeID())
      return 0;
    valuePtr = -1;
    Value = CFDictionaryGetValue(v1, CFSTR("Version"));
    v4 = CFDictionaryGetValue(v1, CFSTR("Behaviors"));
    if (!Value)
      return 0;
    v5 = v4;
    v6 = CFGetTypeID(Value);
    if (v6 != CFNumberGetTypeID())
      return 0;
    v7 = CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr);
    result = 0;
    if (v7)
    {
      if (v5)
      {
        v8 = CFGetTypeID(v5);
        TypeID = CFArrayGetTypeID();
        result = 0;
        if (v8 == TypeID && valuePtr == 1)
        {
          if (CFArrayGetCount((CFArrayRef)v5) < 1)
            return 1;
          v10 = 0;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v5, v10);
            v12 = CFGetTypeID(ValueAtIndex);
            if (v12 != CFDictionaryGetTypeID())
              break;
            result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("BehaviorID"));
            if (!result)
              return result;
            v13 = CFGetTypeID((CFTypeRef)result);
            if (v13 != CFNumberGetTypeID())
              break;
            ++v10;
            Count = CFArrayGetCount((CFArrayRef)v5);
            result = 1;
            if (v10 >= Count)
              return result;
          }
          return 0;
        }
      }
    }
  }
  return result;
}

CFDictionaryRef _mthid_appendBehaviorToGestureConfiguration(const __CFDictionary *a1, void *a2)
{
  int isGestureConfigurationValid;
  CFDictionaryRef result;
  const void *v6;
  const __CFArray *Value;
  void *values;
  void *keys[2];
  CFRange v10;

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  isGestureConfigurationValid = _mthid_isGestureConfigurationValid((uint64_t)a1);
  result = 0;
  if (a2)
  {
    if (isGestureConfigurationValid)
    {
      values = a2;
      keys[0] = CFSTR("BehaviorID");
      result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (result)
      {
        v6 = result;
        Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Behaviors"));
        v10.length = CFArrayGetCount(Value);
        v10.location = 0;
        if (!CFArrayContainsValue(Value, v10, v6))
          CFArrayAppendValue(Value, v6);
        CFRelease(v6);
        return (CFDictionaryRef)1;
      }
    }
  }
  return result;
}

const __CFDictionary *_mthid_createAggregateGestureConfiguration(const __CFArray *a1)
{
  const __CFDictionary *GestureConfiguration;
  CFIndex v3;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *Value;
  CFIndex v6;
  const __CFDictionary *v7;
  void *v8;

  if (!a1)
    return 0;
  GestureConfiguration = _mthid_createGestureConfiguration();
  if (GestureConfiguration && CFArrayGetCount(a1) >= 1)
  {
    v3 = 0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v3);
      if (_mthid_isGestureConfigurationValid((uint64_t)ValueAtIndex))
      {
        Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Behaviors"));
        if (CFArrayGetCount(Value) >= 1)
        {
          v6 = 0;
          do
          {
            v7 = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v6);
            v8 = (void *)CFDictionaryGetValue(v7, CFSTR("BehaviorID"));
            _mthid_appendBehaviorToGestureConfiguration(GestureConfiguration, v8);
            ++v6;
          }
          while (v6 < CFArrayGetCount(Value));
        }
      }
      ++v3;
    }
    while (v3 < CFArrayGetCount(a1));
  }
  return GestureConfiguration;
}

CFDataRef _mthid_serializeGestureConfiguration(const void *a1)
{
  CFDataRef v2;
  NSObject *v3;
  CFIndex Code;
  CFErrorRef error;
  uint8_t buf[4];
  CFIndex v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  error = 0;
  v2 = 0;
  if (_mthid_isGestureConfigurationValid((uint64_t)a1))
  {
    v2 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    if (error)
    {
      v3 = MTLoggingFramework();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        Code = CFErrorGetCode(error);
        *(_DWORD *)buf = 134217984;
        v8 = Code;
        _os_log_impl(&dword_21A1DE000, v3, OS_LOG_TYPE_ERROR, "Error serializing gesture configuration. ErrorCode=%ld.", buf, 0xCu);
      }
      CFRelease(error);
    }
  }
  return v2;
}

CFPropertyListRef _mthid_unserializeGestureConfiguration(CFDataRef data)
{
  CFPropertyListRef v1;
  NSObject *v2;
  CFIndex Code;
  CFErrorRef error;
  uint8_t buf[4];
  CFIndex v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!data)
    return 0;
  error = 0;
  v1 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], data, 0, 0, &error);
  if (error)
  {
    v2 = MTLoggingFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      Code = CFErrorGetCode(error);
      *(_DWORD *)buf = 134217984;
      v7 = Code;
      _os_log_impl(&dword_21A1DE000, v2, OS_LOG_TYPE_ERROR, "Error unserializing gesture configuration. ErrorCode=%ld.", buf, 0xCu);
    }
    CFRelease(error);
  }
  if (v1 && (_mthid_isGestureConfigurationValid((uint64_t)v1) & 1) == 0)
  {
    CFRelease(v1);
    return 0;
  }
  return v1;
}

CFDataRef _mthid_serializePropertiesEvent(CFDataRef result)
{
  NSObject *v1;
  uint8_t v2[16];

  if (result)
  {
    result = IOCFSerialize(result, 1uLL);
    if (!result)
    {
      v1 = MTLoggingFramework();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v2 = 0;
        _os_log_impl(&dword_21A1DE000, v1, OS_LOG_TYPE_ERROR, "Error serializing properties dictionary", v2, 2u);
      }
      return 0;
    }
  }
  return result;
}

const __CFString *_mthid_unserializePropertiesEvent(const void *a1)
{
  CFTypeID v2;
  const char *BytePtr;
  size_t Length;
  const __CFString *v5;
  NSObject *v6;
  CFStringRef v7;
  NSObject *v8;
  const __CFString *v9;
  CFTypeID v11;
  CFStringRef errorString;
  uint8_t buf[4];
  CFStringRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1 || (v2 = CFGetTypeID(a1), v2 != CFDataGetTypeID()))
  {
    v8 = MTLoggingFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A1DE000, v8, OS_LOG_TYPE_ERROR, "Error unserializing properties event: Invalid data provided", buf, 2u);
    }
    return 0;
  }
  errorString = 0;
  BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)a1);
  Length = CFDataGetLength((CFDataRef)a1);
  v5 = (const __CFString *)IOCFUnserializeBinary(BytePtr, Length, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &errorString);
  if (errorString)
  {
    v6 = MTLoggingFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = errorString;
      _os_log_impl(&dword_21A1DE000, v6, OS_LOG_TYPE_ERROR, "Error unserializing properties event vendor defined data Error: %{public}@", buf, 0xCu);
    }
    v7 = errorString;
    goto LABEL_7;
  }
  v9 = v5;
  if (v5)
  {
    v11 = CFGetTypeID(v5);
    if (v11 != CFDictionaryGetTypeID())
    {
      v7 = v9;
LABEL_7:
      CFRelease(v7);
      return 0;
    }
  }
  return v9;
}

uint64_t quantizeFrequencyToPeriodByte(float a1, float a2)
{
  int v2;
  int v3;

  LOBYTE(v2) = 0;
  if (a1 > 0.0 && a2 > 0.0)
  {
    v3 = (int)(roundf(1.0 / (float)(a1 * a2)) + -1.0);
    if (v3 >= 255)
      v3 = 255;
    return (v3 & ~(v3 >> 31));
  }
  return v2;
}

uint64_t quantizeDurationToByte(float a1, float a2)
{
  int v2;
  int v3;

  if (a2 <= 0.0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v2 = llroundf(a1 / a2);
    if (v2 >= 255)
      v2 = 255;
    return (v2 & ~(v2 >> 31));
  }
  return v3;
}

uint64_t quantizeAmplitudeToByte(float a1)
{
  int v1;

  v1 = llroundf(a1 * 255.0);
  if (v1 >= 255)
    v1 = 255;
  return v1 & ~(v1 >> 31);
}

double MTActuationWaveformCreateWithBase@<D0>(int a1@<W0>, uint64_t a2@<X8>, float a3@<S0>, float a4@<S1>)
{
  double result;

  *(_DWORD *)(a2 + 136) = 0;
  *(_OWORD *)(a2 + 120) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_DWORD *)a2 = a1;
  *(float *)(a2 + 4) = a3;
  *(float *)(a2 + 8) = a4;
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)(a2 + 12) = _Q0;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(a2 + 28) = result;
  *(_DWORD *)(a2 + 36) = 0;
  return result;
}

uint64_t MTActuationAppendToWaveform(uint64_t a1, int a2, float a3, float a4, float a5, float a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v6 = *(_DWORD *)(a1 + 36);
  if (v6 > 4)
    return 0;
  v7 = a1 + 20 * v6;
  *(_DWORD *)(v7 + 40) = a2;
  *(float *)(v7 + 44) = a3;
  *(float *)(v7 + 48) = a4;
  *(float *)(v7 + 52) = a5;
  *(float *)(v7 + 56) = a6;
  v8 = (v6 + 1);
  *(_DWORD *)(a1 + 36) = v8;
  return v8;
}

BOOL MTActuationSetBaseMultipliers(float *a1, float a2, float a3, float a4)
{
  if (a1)
  {
    a1[3] = a2;
    a1[4] = a3;
    a1[5] = a4;
  }
  return a1 != 0;
}

BOOL MTActuationSetToneMultipliers(float *a1, float a2, float a3, float a4)
{
  if (a1)
  {
    a1[6] = a2;
    a1[7] = a3;
    a1[8] = a4;
  }
  return a1 != 0;
}

uint64_t MTActuationFillParametricBufferWithWaveform(uint64_t a1, _BYTE *a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10)
{
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  int v15;
  int v16;
  float *v17;
  unint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  BOOL v27;

  v10 = *(float *)(a1 + 4) * a4;
  v11 = 1.0;
  v12 = 1.0;
  if (v10 > 0.0)
  {
    if (v10 < a8)
      a8 = *(float *)(a1 + 4) * a4;
    if (a8 >= a7)
      a7 = a8;
    v12 = (float)(a7 / v10) * a4;
  }
  v13 = *(float *)(a1 + 8) * a6;
  if (v13 > 0.0)
  {
    if (v13 >= a10)
      v14 = a10;
    else
      v14 = *(float *)(a1 + 8) * a6;
    if (v14 < a9)
      v14 = a9;
    v11 = (float)(v14 / v13) * a6;
  }
  *a2 = *(_DWORD *)a1;
  a2[1] = llroundf(v12 * *(float *)(a1 + 4));
  if (a3 <= 0.0)
  {
    LOBYTE(v16) = 0;
  }
  else
  {
    v15 = llroundf((float)(v11 * *(float *)(a1 + 8)) / a3);
    if (v15 >= 255)
      v15 = 255;
    v16 = v15 & ~(v15 >> 31);
  }
  a2[2] = v16;
  if (*(int *)(a1 + 36) < 1)
    return 3;
  v17 = (float *)(a1 + 56);
  v18 = 3;
  v19 = 1;
  do
  {
    v20 = &a2[v18];
    a2[v18] = *((_DWORD *)v17 - 4);
    v21 = llroundf((float)(*(v17 - 1) * a5) * 255.0);
    if (v21 >= 255)
      v21 = 255;
    v20[1] = v21 & ~(v21 >> 31);
    if (a3 <= 0.0)
    {
      LOBYTE(v25) = 0;
      *((_WORD *)v20 + 1) = 0;
    }
    else
    {
      v22 = llroundf((float)(v11 * *(v17 - 3)) / a3);
      if (v22 >= 255)
        v22 = 255;
      v20[2] = v22 & ~(v22 >> 31);
      v23 = llroundf((float)(v11 * *(v17 - 2)) / a3);
      if (v23 >= 255)
        v23 = 255;
      v20[3] = v23 & ~(v23 >> 31);
      if (*v17 <= 0.0)
      {
        LOBYTE(v25) = 0;
      }
      else
      {
        v24 = (int)(roundf(1.0 / (float)(*v17 * a3)) + -1.0);
        if (v24 >= 255)
          v24 = 255;
        v25 = v24 & ~(v24 >> 31);
      }
    }
    v26 = v18 + 5;
    a2[v18 + 4] = v25;
    if (v19 >= *(int *)(a1 + 36))
      break;
    ++v19;
    v17 += 5;
    v27 = v18 >= 0x33;
    v18 += 5;
  }
  while (!v27);
  return v26;
}

uint64_t MTActuationBaseWaveformGetTypeForKey(const char *a1)
{
  uint64_t result;

  result = strncmp(a1, "None", 0x40uLL);
  if ((_DWORD)result)
    return strncmp(a1, "Gaussian", 0x40uLL) == 0;
  return result;
}

uint64_t MTActuationToneWaveformGetTypeForKey(const char *a1)
{
  uint64_t result;

  result = strncmp(a1, "None", 0x40uLL);
  if ((_DWORD)result)
  {
    if (!strncmp(a1, "Sine", 0x40uLL))
    {
      return 1;
    }
    else if (!strncmp(a1, "Square", 0x40uLL))
    {
      return 2;
    }
    else if (!strncmp(a1, "Sawtooth", 0x40uLL))
    {
      return 3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t mt_GetSurfaceScreenEdges(uint64_t a1)
{
  uint64_t AlgLibStateRef;

  AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  if (AlgLibStateRef)
    return AlgLibStateRef + 376;
  else
    return 0;
}

uint64_t mtalg_getSurfaceBounds_mm(uint64_t result)
{
  if (result)
    return MTAlg_GetAlgLibStateRef(result);
  return result;
}

uint64_t mtalg_IsOpaqueSurface(uint64_t a1)
{
  uint64_t result;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
    return *(_BYTE *)(result + 482) != 0;
  return result;
}

float mtalg_ConvertBinaryForceCentroidToMTFC(uint64_t a1, uint64_t a2, float *a3)
{
  int v4;
  uint64_t v5;
  uint64_t AlgLibStateRef;
  __int16 *v7;
  float v8;
  float result;

  if (a1)
  {
    v4 = a2;
    v5 = a2 << 16 >> 48;
    AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
    v7 = (__int16 *)(AlgLibStateRef + 376);
    if (!AlgLibStateRef)
      v7 = 0;
    v8 = (float)((v4 >> 16) - v7[3]) / (float)(v7[2] - v7[3]);
    a3[4] = (float)((__int16)v4 - v7[1]) / (float)(*v7 - v7[1]);
    a3[5] = v8;
    a3[6] = (float)(__int16)v4 / 100.0;
    a3[7] = (float)(v4 >> 16) / 100.0;
    result = (float)(int)v5;
    a3[8] = (float)(int)v5;
  }
  return result;
}

uint64_t mtalg_ComputeContactDensityFromRadii(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t result;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
    LOWORD(result) = alg_ComputeContactDensityFromRadii(a2, a3, a4, *(__int16 *)(result + 470), *(__int16 *)(result + 472));
  return (unsigned __int16)result;
}

uint64_t mtalg_getPathLifeCycle(uint64_t a1, unsigned int a2)
{
  uint64_t AlgLibStateRef;
  uint64_t v4;

  AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  v4 = AlgLibStateRef + 520;
  if (a2 - 1 <= 0x1E)
    v4 = AlgLibStateRef + 616 * a2 + 520;
  if (AlgLibStateRef)
    return v4;
  else
    return 0;
}

void mt_InitPathLifeCycles(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  _DWORD *v6;

  v2 = 0;
  v3 = (_DWORD *)(a1 + 520);
  v4 = (_DWORD *)(a1 + 520);
  do
  {
    if ((v2 - 1) >= 0x1F)
      v5 = v3;
    else
      v5 = v4;
    if (a1)
      v6 = v5;
    else
      v6 = 0;
    resetPathLifeCycle(v6, v2++);
    v4 += 154;
  }
  while (v2 != 32);
}

double resetPathLifeCycle(_DWORD *a1, int a2)
{
  double result;

  if (a1)
  {
    bzero(a1, 0x268uLL);
    *a1 = a2;
    *(_OWORD *)(a1 + 146) = xmmword_21A1FECF0;
    result = 0.0;
    *(_OWORD *)(a1 + 150) = 0u;
  }
  return result;
}

uint64_t mt_CleanupOldPaths(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;

  v6 = a2;
  v7 = 1232;
  v8 = 31;
  do
  {
    result = MTAlg_GetAlgLibStateRef(a1);
    if (result)
    {
      v10 = result + v7;
      if (*(_QWORD *)(result + v7 - 88) != a2)
      {
        v11 = *(_DWORD *)(v10 - 68);
        if (v11)
        {
          if (v11 == 7)
            v12 = 0;
          else
            v12 = 7;
          *(_DWORD *)(v10 - 68) = v12;
          v13 = (_QWORD *)(result + v7);
          *((_DWORD *)v13 - 23) = v12;
          *(v13 - 5) = 0;
          *v13 = 0;
          *((double *)v13 - 10) = a3;
          *(_QWORD *)(v10 - 88) = v6;
          result = MTAlg_IssuePathCallbacks(a1, *(unsigned int *)(v10 - 96), v12, (__int128 *)(result + v7 - 88));
        }
      }
    }
    v7 += 616;
    --v8;
  }
  while (v8);
  return result;
}

uint64_t mt_CalculateMTBinaryContactVelocity(uint64_t result, uint64_t a2, double a3)
{
  double v3;
  float v4;
  int v5;
  double v6;

  if (result && a2)
  {
    if (*(unsigned __int8 *)(a2 + 1) - 7 < 0xFFFFFFFD
      || *(__int16 *)(a2 + 8) == -1 && *(__int16 *)(a2 + 10) == -1)
    {
      *(_DWORD *)(a2 + 8) = 0;
    }
    else
    {
      v3 = a3 - *(double *)(result + 8);
      v4 = (float)((float)*(__int16 *)(a2 + 6) / 100.0) - *(float *)(result + 72);
      v5 = (int)((float)((float)((float)((float)*(__int16 *)(a2 + 4) / 100.0) - *(float *)(result + 68)) * 8.0) / v3);
      *(_WORD *)(a2 + 8) = v5;
      v6 = (float)(v4 * 8.0) / v3;
      *(_WORD *)(a2 + 10) = (int)v6;
      if (!(v5 | (int)v6))
        *(_WORD *)(a2 + 8) = 1;
    }
  }
  return result;
}

uint64_t mt_CalculateMTPreciseContactVelocity(uint64_t result, uint64_t a2, double a3)
{
  float32x2_t v3;
  float32x2_t v4;

  if (result && a2)
  {
    if (*(unsigned __int8 *)(a2 + 1) - 7 < 0xFFFFFFFD
      || *(float *)(a2 + 12) == 3.4028e38 && *(float *)(a2 + 16) == 3.4028e38)
    {
      *(_DWORD *)(a2 + 12) = 0;
      *(_DWORD *)(a2 + 16) = 0;
    }
    else
    {
      v3 = (float32x2_t)vdup_n_s32(0x447A0000u);
      v4 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vmul_f32(vsub_f32(vdiv_f32(*(float32x2_t *)(a2 + 4), v3), *(float32x2_t *)(result + 68)), v3)), (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3 - *(double *)(result + 8)), 0)));
      *(float32x2_t *)(a2 + 12) = v4;
      if (v4.f32[0] == 0.0 && v4.f32[1] == 0.0)
        *(_DWORD *)(a2 + 12) = 1123680256;
    }
  }
  return result;
}

float mt_FillMTContactDirectFromBinary(unsigned __int16 *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, char a5, double a6)
{
  unsigned int v9;
  double v10;
  int v14;
  int v15;
  float v16;
  unsigned int v17;
  float v18;
  float v19;
  double v20;
  int v21;
  int v22;
  float v23;
  float v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;

  if (a1 && a2 && a3)
  {
    v10 = *(double *)(a2 + 8);
    v9 = *(_DWORD *)(a2 + 20);
    *(_QWORD *)a2 = a4;
    *(double *)(a2 + 8) = a6;
    a6 = a6 - v10;
    WORD1(v10) = 18350;
    if (a6 < 0.04 && v9 < 5 && v9 > 2 && a3[1] == 0)
      v14 = 7;
    else
      v14 = a3[1];
    *(_DWORD *)(a2 + 16) = *a3;
    *(_DWORD *)(a2 + 20) = v14;
    v15 = (char)a3[3];
    *(_DWORD *)(a2 + 24) = a3[2];
    *(_DWORD *)(a2 + 28) = v15;
    LOWORD(a6) = *((_WORD *)a3 + 13);
    v16 = (float)LODWORD(a6);
    LOWORD(v10) = *((_WORD *)a3 + 9);
    *(float *)(a2 + 48) = (float)LODWORD(v10) * 0.0039062;
    *(float *)(a2 + 52) = v16;
    LOWORD(v16) = *((_WORD *)a3 + 10);
    HIWORD(v17) = 14336;
    *(float *)(a2 + 88) = (float)((float)*((__int16 *)a3 + 12) * 3.1416) * 0.000030518;
    *(float *)(a2 + 92) = (float)LODWORD(v16) * 0.0039062;
    v18 = (float)(2 * *((__int16 *)a3 + 4));
    v19 = (float)(2 * *((__int16 *)a3 + 5));
    *(float *)(a2 + 76) = v18 * 0.0625;
    *(float *)(a2 + 80) = v19 * 0.0625;
    v20 = (float)(v18 / 160.0) * 1000.0;
    v21 = (__int16)a1[1];
    *(float *)&a6 = (float)((__int16)*a1 - v21);
    *(float *)&v20 = v20 / *(float *)&a6;
    v22 = (__int16)a1[3];
    v23 = (float)((__int16)a1[2] - v22);
    v24 = (float)(v19 / 160.0) * 1000.0 / v23;
    *(_DWORD *)(a2 + 40) = LODWORD(v20);
    *(float *)(a2 + 44) = v24;
    *(float *)&v25 = (float)((float)*((__int16 *)a3 + 8) * 3.1416) * 0.000030518;
    LOWORD(v17) = *((_WORD *)a3 + 6);
    *(float *)(a2 + 56) = *(float *)&v25;
    *(float *)(a2 + 60) = (float)v17 / 100.0;
    LOWORD(v25) = *((_WORD *)a3 + 7);
    *(float *)(a2 + 64) = (float)v25 / 100.0;
    v26 = *((unsigned __int16 *)a3 + 2);
    v27 = *((unsigned __int16 *)a3 + 3);
    if ((a5 & 1) == 0)
    {
      v26 = alg_ClipPosPointToScreenEdge(v26 | (v27 << 16), a1);
      v27 = HIWORD(v26);
      v21 = (__int16)a1[1];
      v22 = (__int16)a1[3];
      *(float *)&a6 = (float)((__int16)*a1 - v21);
      v23 = (float)((__int16)a1[2] - v22);
    }
    *(float *)(a2 + 68) = (float)(__int16)v26 / 100.0;
    *(float *)(a2 + 72) = (float)(__int16)v27 / 100.0;
    *(float *)&a6 = (float)((__int16)v26 - v21) / *(float *)&a6;
    *(_DWORD *)(a2 + 32) = LODWORD(a6);
    *(float *)(a2 + 36) = (float)((__int16)v27 - v22) / v23;
    *(_WORD *)(a2 + 84) = *((_WORD *)a3 + 14);
  }
  return *(float *)&a6;
}

unsigned __int16 mt_FillMTContactDirectFromPrecise@<H0>(__int16 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, __n128 a5@<Q0>)
{
  double v5;
  unsigned int v6;
  int v10;
  int v11;
  int v12;
  int v13;
  float32x4_t v14;
  float32x2_t v15;
  int v16;
  float v17;
  float v18;
  int v19;
  float v20;
  float32x4_t v21;

  if (a1 && a2 && a3)
  {
    v5 = *(double *)(a2 + 8);
    v6 = *(_DWORD *)(a2 + 20);
    *(_QWORD *)a2 = a4;
    *(_QWORD *)(a2 + 8) = a5.n128_u64[0];
    if (a5.n128_f64[0] - v5 < 0.04 && v6 < 5 && v6 > 2 && a3[1] == 0)
      v10 = 7;
    else
      v10 = a3[1];
    *(_DWORD *)(a2 + 16) = *a3;
    *(_DWORD *)(a2 + 20) = v10;
    v11 = (char)a3[3];
    *(_DWORD *)(a2 + 24) = a3[2];
    *(_DWORD *)(a2 + 28) = v11;
    v13 = *((_DWORD *)a3 + 9);
    v12 = *((_DWORD *)a3 + 10);
    *(_DWORD *)(a2 + 48) = *((_DWORD *)a3 + 8);
    *(_DWORD *)(a2 + 52) = v12;
    *(_DWORD *)(a2 + 92) = v13;
    v14 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    v15 = vdiv_f32(*(float32x2_t *)(a3 + 12), *(float32x2_t *)v14.f32);
    v16 = a1[1];
    v17 = (float)(*a1 - v16);
    *(float32x2_t *)(a2 + 76) = v15;
    v18 = v17 / 100.0;
    v19 = a1[3];
    v20 = (float)(a1[2] - v19) / 100.0;
    *(float *)(a2 + 40) = v15.f32[0] / v18;
    *(float *)(a2 + 44) = v15.f32[1] / v20;
    *(_DWORD *)(a2 + 56) = *((_DWORD *)a3 + 7);
    v21.i64[0] = *(_QWORD *)(a3 + 20);
    v21.i64[1] = *(_QWORD *)(a3 + 4);
    a5 = (__n128)vdivq_f32(v21, v14);
    *(__n128 *)(a2 + 60) = a5;
    *(float *)(a2 + 32) = (float)(a5.n128_f32[2] - (float)((float)v16 / 100.0)) / v18;
    *(float *)(a2 + 36) = (float)(a5.n128_f32[3] - (float)((float)v19 / 100.0)) / v20;
    *(_DWORD *)(a2 + 88) = 0;
    *(_WORD *)(a2 + 84) = *((_WORD *)a3 + 22);
    a5.n128_u16[0] = *((_WORD *)a3 + 23);
    *(_WORD *)(a2 + 86) = a5.n128_u16[0];
  }
  return a5.n128_u16[0];
}

int *mt_PathLifeCycleFromPreciseContact(uint64_t a1, __int16 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, double a6)
{
  unsigned int v12;
  uint64_t AlgLibStateRef;
  int *v14;
  int v15;
  __n128 v16;

  v12 = *a3;
  AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  if (!AlgLibStateRef)
    return 0;
  v14 = (int *)(v12 - 1 >= 0x1F ? AlgLibStateRef + 520 : AlgLibStateRef + 520 + 616 * v12);
  if (!a4)
    return 0;
  if (a3[1] == 1)
  {
    v15 = *v14;
    bzero(v14, 0x268uLL);
    *v14 = v15;
    *(_OWORD *)(v14 + 146) = xmmword_21A1FECF0;
    *(_OWORD *)(v14 + 150) = 0u;
  }
  if (*(_BYTE *)(a4 + 10) || MTAlg_AlwaysNeedsVelocityCalculated(a1))
    mt_CalculateMTPreciseContactVelocity((uint64_t)(v14 + 2), (uint64_t)a3, a6);
  v16.n128_f64[0] = a6;
  mt_FillMTContactDirectFromPrecise(a2, (uint64_t)(v14 + 2), a3, a5, v16);
  return v14;
}

uint64_t mt_ForwardBinaryContacts(uint64_t a1, _BYTE *a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;
  __int16 *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int *v14;
  __int128 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t AlgLibStateRef;
  unsigned int *v21;
  unsigned int v22;

  result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
    v8 = (__int16 *)(result + 376);
  else
    v8 = 0;
  if (a2 && result)
  {
    v9 = (double)a4 / 1000.0;
    if (a2[72])
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 116;
      do
      {
        if (a2[113])
        {
          v14 = mt_PathLifeCycleFromPreciseContact(a1, v8, &a2[v10 + 116], (uint64_t)a2, a3, v9);
          if (v14)
          {
            v15 = (__int128 *)(v14 + 2);
            v14[24] = *(_DWORD *)&a2[v10 + 164];
            v16 = *v14;
            goto LABEL_14;
          }
        }
        else
        {
          if (!a2[112])
          {
            v19 = a2[v11 + 116];
            AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
            if (!AlgLibStateRef)
              goto LABEL_16;
            if (v19 - 1 >= 0x1F)
              v21 = (unsigned int *)(AlgLibStateRef + 520);
            else
              v21 = (unsigned int *)(AlgLibStateRef + 520 + 616 * v19);
            if (a2[v11 + 117] == 1)
            {
              v22 = *v21;
              bzero(v21, 0x268uLL);
              *v21 = v22;
              *(_OWORD *)(v21 + 146) = xmmword_21A1FECF0;
              *(_OWORD *)(v21 + 150) = 0u;
            }
            if (a2[10] || MTAlg_AlwaysNeedsVelocityCalculated(a1))
              mt_CalculateMTBinaryContactVelocity((uint64_t)(v21 + 2), (uint64_t)&a2[v11 + 116], v9);
            mt_FillMTContactDirectFromBinary((unsigned __int16 *)v8, (uint64_t)(v21 + 2), &a2[v11 + 116], a3, (a2[76] & 2) != 0, v9);
            v16 = *v21;
            v17 = v21[7];
            v18 = a1;
            v15 = (__int128 *)(v21 + 2);
            goto LABEL_15;
          }
          v14 = mt_PathLifeCycleFromPreciseContact(a1, v8, &a2[v13], (uint64_t)a2, a3, v9);
          if (v14)
          {
            v16 = *v14;
            v15 = (__int128 *)(v14 + 2);
LABEL_14:
            v17 = v14[7];
            v18 = a1;
LABEL_15:
            MTAlg_IssuePathCallbacks(v18, v16, v17, v15);
          }
        }
LABEL_16:
        ++v12;
        v11 += 30;
        v13 += 48;
        v10 += 60;
      }
      while (v12 < a2[72]);
    }
    mt_CleanupOldPaths(a1, a3, v9);
    return MTAlg_IssueContactFrameCallbacks(a1, a3, v9);
  }
  return result;
}

uint64_t MTDeviceBeginRecordingToFile(uint64_t a1, const char *a2, int a3)
{
  uint64_t result;
  CFDataRef RecordingHeader;
  const __CFData *v8;
  int v9;
  int Length;
  unint64_t TimeStamp_ms;
  int v12;
  const UInt8 *BytePtr;
  size_t v14;
  timespec v15;
  stat v16;
  int v17;
  unint64_t v18;
  char __buf;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 2104))
    {
      if (*(_BYTE *)(a1 + 2096))
      {
        return 3758097093;
      }
      else
      {
        RecordingHeader = _mt_CreateRecordingHeader(a1);
        *(_DWORD *)(a1 + 2092) = a3;
        *(_OWORD *)(a1 + 2136) = 0u;
        if (!RecordingHeader)
          return 3758097084;
        v8 = RecordingHeader;
        v9 = open(a2, 1537, 420);
        *(_DWORD *)(a1 + 2112) = v9;
        if ((v9 & 0x80000000) == 0)
        {
          fchmod(v9, 0x1A4u);
          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
          *(_BYTE *)(a1 + 2096) = 1;
          __buf = 2;
          Length = CFDataGetLength(v8);
          TimeStamp_ms = mt_GetTimeStamp_ms(a1);
          write(*(_DWORD *)(a1 + 2112), &__buf, 1uLL);
          ++*(_QWORD *)(a1 + 2144);
          v18 = TimeStamp_ms;
          write(*(_DWORD *)(a1 + 2112), &v18, 8uLL);
          *(_QWORD *)(a1 + 2144) += 8;
          v17 = Length;
          write(*(_DWORD *)(a1 + 2112), &v17, 4uLL);
          *(_QWORD *)(a1 + 2144) += 4;
          v12 = *(_DWORD *)(a1 + 2112);
          BytePtr = CFDataGetBytePtr(v8);
          v14 = CFDataGetLength(v8);
          write(v12, BytePtr, v14);
          *(_QWORD *)(a1 + 2144) += CFDataGetLength(v8);
          v15.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v15.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&v16.st_blksize = v15;
          *(timespec *)v16.st_qspare = v15;
          v16.st_birthtimespec = v15;
          *(timespec *)&v16.st_size = v15;
          v16.st_mtimespec = v15;
          v16.st_ctimespec = v15;
          *(timespec *)&v16.st_uid = v15;
          v16.st_atimespec = v15;
          *(timespec *)&v16.st_dev = v15;
          if (!fstat(*(_DWORD *)(a1 + 2112), &v16))
            *(_QWORD *)(a1 + 2144) = v16.st_size;
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
          MTRegisterFullFrameCallback(a1, (uint64_t)_mt_RecordingFullFrameCallback, 0);
        }
        CFRelease(v8);
        if ((*(_DWORD *)(a1 + 2112) & 0x80000000) != 0)
          return 3758097084;
        else
          return 0;
      }
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

CFDataRef _mt_CreateRecordingHeader(uint64_t a1)
{
  const __CFAllocator *v2;
  CFDataRef Data;
  CFNumberRef v4;
  CFNumberRef v5;
  io_registry_entry_t Service;
  char v7;
  uint64_t v8;
  uint64_t v9;
  io_object_t v11;
  io_registry_entry_t v12;
  char v13;
  CFMutableDictionaryRef v14;
  CFMutableDictionaryRef properties;
  io_registry_entry_t parent;
  io_iterator_t iterator[2];
  CFMutableDictionaryRef v19;
  unsigned int valuePtr;

  properties = 0;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Data = 0;
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))
    goto LABEL_34;
  if (!CFDictionaryGetValue(properties, CFSTR("LocationID")))
  {
    v19 = 0;
    MTDeviceGetDeviceID(a1, &v19);
    valuePtr = v19;
    v4 = CFNumberCreate(v2, kCFNumberSInt32Type, &valuePtr);
    if (v4)
    {
      v5 = v4;
      CFDictionarySetValue(properties, CFSTR("LocationID"), v4);
      CFRelease(v5);
    }
  }
  valuePtr = -1431655766;
  v19 = 0;
  MTDeviceGetDriverType(a1, &valuePtr);
  *(_QWORD *)iterator = 0;
  Service = MTDeviceGetService(a1);
  v7 = 0;
  parent = Service;
  if (valuePtr >= 4)
  {
    if (valuePtr == 4)
    {
      IORegistryEntryGetParentEntry(Service, "IOService", &parent);
      v7 = 1;
      if (parent)
      {
LABEL_7:
        if (!MEMORY[0x22073CDA0]())
        {
          do
          {
            v8 = IOIteratorNext(iterator[1]);
            if (!(_DWORD)v8)
              break;
            v9 = v8;
            if (IOObjectConformsTo(v8, "IOHIDInterface"))
            {
              if (!MEMORY[0x22073CDA0](v9, "IOService", iterator) && v19 == 0)
              {
                do
                {
                  v11 = IOIteratorNext(iterator[0]);
                  if (!v11)
                    break;
                  v12 = v11;
                  if (IOObjectConformsTo(v11, "IOHIDEventService"))
                    IORegistryEntryCreateCFProperties(v12, &v19, v2, 0);
                  IOObjectRelease(v12);
                }
                while (!v19);
              }
            }
            IOObjectRelease(v9);
          }
          while (!v19);
        }
      }
    }
  }
  else if (Service)
  {
    goto LABEL_7;
  }
  if (iterator[1])
    IOObjectRelease(iterator[1]);
  if (iterator[0])
    IOObjectRelease(iterator[0]);
  v13 = v7 ^ 1;
  if (!parent)
    v13 = 1;
  if ((v13 & 1) == 0)
    IOObjectRelease(parent);
  v14 = v19;
  if (v19)
  {
    CFDictionarySetValue(properties, CFSTR("Event Driver Properties"), v19);
    CFRelease(v14);
  }
  Data = CFPropertyListCreateData(v2, properties, kCFPropertyListBinaryFormat_v1_0, 0, 0);
LABEL_34:
  if (properties)
    CFRelease(properties);
  return Data;
}

intptr_t _mt_RecordingFullFrameCallback(uint64_t a1, const void *a2, unsigned int a3)
{
  int v6;
  __CFData *v7;
  UInt8 v9;
  UInt8 bytes[12];
  unsigned int __buf;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
  if (*(_BYTE *)(a1 + 2096))
  {
    __buf = a3;
    *(_QWORD *)bytes = mt_GetTimeStamp_ms(a1);
    v9 = 0;
    v6 = *(_DWORD *)(a1 + 2112);
    if ((v6 & 0x80000000) == 0)
    {
      write(v6, &__buf, 4uLL);
      write(*(_DWORD *)(a1 + 2112), bytes, 8uLL);
      write(*(_DWORD *)(a1 + 2112), &v9, 1uLL);
      write(*(_DWORD *)(a1 + 2112), a2, a3);
    }
    v7 = *(__CFData **)(a1 + 2120);
    if (v7)
    {
      CFDataAppendBytes(v7, (const UInt8 *)&__buf, 4);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), bytes, 8);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), &v9, 1);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), (const UInt8 *)a2, a3);
    }
    ++*(_QWORD *)(a1 + 2136);
    _mt_truncateRecordingIfNeeded(a1);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
}

uint64_t MTDeviceBeginRecordingToData(uint64_t a1, const void *a2, int a3)
{
  uint64_t result;
  CFDataRef RecordingHeader;
  const __CFData *v8;
  int Length;
  unint64_t TimeStamp_ms;
  __CFData *v11;
  const UInt8 *BytePtr;
  CFIndex v13;
  UInt8 v14[4];
  UInt8 v15[15];
  UInt8 bytes;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 2104))
    {
      if (*(_BYTE *)(a1 + 2096))
      {
        return 3758097093;
      }
      else
      {
        RecordingHeader = _mt_CreateRecordingHeader(a1);
        *(_DWORD *)(a1 + 2092) = a3;
        *(_OWORD *)(a1 + 2136) = 0u;
        if (RecordingHeader)
        {
          v8 = RecordingHeader;
          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
          CFRetain(a2);
          *(_QWORD *)(a1 + 2120) = a2;
          *(_BYTE *)(a1 + 2096) = 1;
          bytes = 2;
          Length = CFDataGetLength(v8);
          TimeStamp_ms = mt_GetTimeStamp_ms(a1);
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), &bytes, 1);
          *(_QWORD *)v15 = TimeStamp_ms;
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), v15, 8);
          *(_DWORD *)v14 = Length;
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), v14, 4);
          v11 = *(__CFData **)(a1 + 2120);
          BytePtr = CFDataGetBytePtr(v8);
          v13 = CFDataGetLength(v8);
          CFDataAppendBytes(v11, BytePtr, v13);
          *(_QWORD *)(a1 + 2144) = CFDataGetLength(*(CFDataRef *)(a1 + 2120));
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
          MTRegisterFullFrameCallback(a1, (uint64_t)_mt_RecordingFullFrameCallback, 0);
          CFRelease(v8);
          return 0;
        }
        else
        {
          return 3758097084;
        }
      }
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

uint64_t MTDeviceEndRecording(uint64_t a1)
{
  uint64_t result;
  const void *v3;
  int v4;

  result = 3758097090;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 2104))
    {
      if (*(_BYTE *)(a1 + 2096))
      {
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
        _mt_truncateRecordingIfNeeded(a1);
        *(_BYTE *)(a1 + 2096) = 0;
        MTUnregisterFullFrameCallback(a1, (uint64_t)_mt_RecordingFullFrameCallback);
        v3 = *(const void **)(a1 + 2120);
        if (v3)
        {
          CFRelease(v3);
          *(_QWORD *)(a1 + 2120) = 0;
        }
        v4 = *(_DWORD *)(a1 + 2112);
        if ((v4 & 0x80000000) == 0)
        {
          close(v4);
          *(_DWORD *)(a1 + 2112) = -1;
        }
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
        return 0;
      }
      else
      {
        return 3758097101;
      }
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

void _mt_truncateRecordingIfNeeded(uint64_t a1)
{
  __CFData *v2;
  uint64_t v3;
  UInt8 *MutableBytePtr;
  CFRange v5;
  unint64_t v6;
  unint64_t v7;

  v2 = *(__CFData **)(a1 + 2120);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 2128);
    if (v3)
    {
      if (*(_QWORD *)(a1 + 2136) >= (unint64_t)(2 * v3))
      {
        MutableBytePtr = CFDataGetMutableBytePtr(v2);
        v5.location = *(_QWORD *)(a1 + 2144);
        v6 = *(_QWORD *)(a1 + 2136);
        v7 = *(_QWORD *)(a1 + 2128);
        if (v6 <= v7)
        {
          v5.length = 0;
        }
        else
        {
          v5.length = 0;
          do
          {
            v5.length += *(unsigned int *)&MutableBytePtr[v5.location + v5.length] + 13;
            --v6;
          }
          while (v6 > v7);
        }
        CFDataDeleteBytes(*(CFMutableDataRef *)(a1 + 2120), v5);
        *(_QWORD *)(a1 + 2136) = *(_QWORD *)(a1 + 2128);
      }
    }
  }
}

intptr_t MTDeviceMarkRecording(intptr_t result, const char *a2)
{
  uint64_t v2;
  int v4;
  size_t v5;
  int v6;
  __CFData *v7;
  UInt8 v8;
  UInt8 bytes[12];
  int __buf;

  if (result)
  {
    v2 = result;
    if (*(_BYTE *)(result + 2096))
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(result + 2104), 0xFFFFFFFFFFFFFFFFLL);
      if (!a2)
        a2 = "";
      if (*(_BYTE *)(v2 + 2096))
      {
        v4 = strlen(a2);
        v5 = (v4 + 1);
        __buf = v4 + 1;
        *(_QWORD *)bytes = mt_GetTimeStamp_ms(v2);
        v8 = 1;
        v6 = *(_DWORD *)(v2 + 2112);
        if (v6)
        {
          write(v6, &__buf, 4uLL);
          write(*(_DWORD *)(v2 + 2112), bytes, 8uLL);
          write(*(_DWORD *)(v2 + 2112), &v8, 1uLL);
          write(*(_DWORD *)(v2 + 2112), a2, v5);
        }
        v7 = *(__CFData **)(v2 + 2120);
        if (v7)
        {
          CFDataAppendBytes(v7, (const UInt8 *)&__buf, 4);
          CFDataAppendBytes(*(CFMutableDataRef *)(v2 + 2120), bytes, 8);
          CFDataAppendBytes(*(CFMutableDataRef *)(v2 + 2120), &v8, 1);
          CFDataAppendBytes(*(CFMutableDataRef *)(v2 + 2120), (const UInt8 *)a2, v5);
        }
      }
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 2104));
    }
  }
  return result;
}

NSObject *MTDeviceSetRecordingDesiredFrameCount(NSObject *result, uint64_t a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = (uint64_t)result;
    result = result[263].isa;
    if (result)
    {
      dispatch_semaphore_wait(result, 0xFFFFFFFFFFFFFFFFLL);
      *(_QWORD *)(v2 + 2128) = a2;
      if (*(_BYTE *)(v2 + 2096))
        _mt_truncateRecordingIfNeeded(v2);
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 2104));
    }
  }
  return result;
}

NSObject *MTDeviceSetMaxRecordingLength(NSObject *a1, uint64_t a2)
{
  return MTDeviceSetRecordingDesiredFrameCount(a1, 60 * a2);
}

CFDataRef MTPlayerCreateFromData(CFDataRef theData, char a2)
{
  CFDataRef v2;
  const UInt8 *BytePtr;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  int8x16_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  const UInt8 *v14;
  size_t v15;
  const __CFData *v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  BOOL v33;
  int v34;
  const __CFAllocator *v35;
  __CFDictionary *Mutable;
  CFNumberRef v37;
  CFNumberRef v38;
  __CFDictionary *v39;
  __CFDictionary *v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  CFNumberRef v44;
  CFNumberRef v45;
  CFNumberRef v46;
  CFNumberRef v47;
  CFNumberRef v48;
  CFDataRef v49;
  CFDataRef v50;
  CFDataRef v51;
  CFDataRef v52;
  CFNumberRef v53;
  CFNumberRef v54;
  CFNumberRef v55;
  CFNumberRef v56;
  CFNumberRef v57;
  CFNumberRef v58;
  CFNumberRef v59;
  CFNumberRef v60;
  unint64_t v61;
  unsigned int v62;
  unsigned int v63;
  unint64_t v64;
  unsigned int v65;
  unint64_t v66;
  size_t v67;
  _BYTE *v68;
  void *v69;
  double v70;
  _QWORD *v71;
  char *v72;
  const __CFAllocator *v73;
  const __CFData *v74;
  const __CFData *v75;
  const __CFDictionary *v76;
  unsigned int v77;
  uint64_t v79;
  char *v80;
  size_t v81;
  unsigned int v82;
  uint64_t v83;
  char v84;
  char *v85;
  _BYTE *v86;
  void *v87;
  _QWORD *v88;
  __int128 v89;
  int v90;
  UInt8 *bytes[2];
  int v92;
  int v93;
  __int128 v94;
  _BYTE length[504];
  char v96;
  _BYTE v97[15];
  int v98;
  __int128 valuePtr;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _OWORD __src[31];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;

  v2 = theData;
  v146 = *MEMORY[0x24BDAC8D0];
  if (!theData)
    return v2;
  BytePtr = CFDataGetBytePtr(theData);
  v5 = CFDataGetLength(v2);
  v6 = v5;
  if (!v5)
    return 0;
  v7 = *BytePtr;
  v8 = v5 - 1;
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      v9 = 0uLL;
      memset(__src, 0, sizeof(__src));
      if (v8 >= 0x21C)
      {
        v94 = 0uLL;
        memset(length, 0, 240);
        valuePtr = 0uLL;
        v100 = 0uLL;
        v101 = 0uLL;
        v102 = 0uLL;
        v103 = 0uLL;
        v104 = 0uLL;
        v105 = 0uLL;
        v106 = 0uLL;
        v107 = 0uLL;
        v108 = 0uLL;
        v109 = 0uLL;
        v110 = 0uLL;
        v111 = 0uLL;
        v112 = 0uLL;
        v113 = 0uLL;
        v10 = v5 - 13;
        v93 = *(_DWORD *)(BytePtr + 1);
        if (v5 - 13 >= 0x21C)
        {
          v9 = *(int8x16_t *)(BytePtr + 13);
          v12 = *(_DWORD *)(BytePtr + 29);
          v18 = *(_OWORD *)(BytePtr + 241);
          *(_OWORD *)&length[176] = *(_OWORD *)(BytePtr + 225);
          *(_OWORD *)&length[192] = v18;
          v19 = *(_OWORD *)(BytePtr + 177);
          *(_OWORD *)&length[112] = *(_OWORD *)(BytePtr + 161);
          *(_OWORD *)&length[128] = v19;
          v20 = *(_OWORD *)(BytePtr + 209);
          *(_OWORD *)&length[144] = *(_OWORD *)(BytePtr + 193);
          *(_OWORD *)&length[160] = v20;
          v21 = *(_OWORD *)(BytePtr + 113);
          *(_OWORD *)&length[48] = *(_OWORD *)(BytePtr + 97);
          *(_OWORD *)&length[64] = v21;
          v22 = *(_OWORD *)(BytePtr + 145);
          *(_OWORD *)&length[80] = *(_OWORD *)(BytePtr + 129);
          *(_OWORD *)&length[96] = v22;
          v23 = *(_OWORD *)(BytePtr + 49);
          v94 = *(_OWORD *)(BytePtr + 33);
          *(_OWORD *)length = v23;
          v24 = *(_OWORD *)(BytePtr + 81);
          *(_OWORD *)&length[16] = *(_OWORD *)(BytePtr + 65);
          *(_OWORD *)&length[32] = v24;
          v25 = *(_OWORD *)(BytePtr + 273);
          *(_OWORD *)&length[208] = *(_OWORD *)(BytePtr + 257);
          *(_OWORD *)&length[224] = v25;
          v13 = *(_DWORD *)(BytePtr + 289);
          v26 = *(_OWORD *)(BytePtr + 501);
          v111 = *(_OWORD *)(BytePtr + 485);
          v112 = v26;
          v113 = *(_OWORD *)(BytePtr + 517);
          v27 = *(_OWORD *)(BytePtr + 437);
          v107 = *(_OWORD *)(BytePtr + 421);
          v108 = v27;
          v28 = *(_OWORD *)(BytePtr + 469);
          v109 = *(_OWORD *)(BytePtr + 453);
          v110 = v28;
          v29 = *(_OWORD *)(BytePtr + 373);
          v103 = *(_OWORD *)(BytePtr + 357);
          v104 = v29;
          v30 = *(_OWORD *)(BytePtr + 405);
          v105 = *(_OWORD *)(BytePtr + 389);
          v106 = v30;
          v31 = *(_OWORD *)(BytePtr + 309);
          valuePtr = *(_OWORD *)(BytePtr + 293);
          v100 = v31;
          v32 = *(_OWORD *)(BytePtr + 341);
          v101 = *(_OWORD *)(BytePtr + 325);
          v102 = v32;
          v11 = BytePtr[533];
          v14 = BytePtr + 553;
          v10 = v5 - 553;
          if (*(_DWORD *)(BytePtr + 549) == -1)
          {
            v9 = vrev32q_s8(v9);
            v12 = bswap32(v12);
            v13 = bswap32(v13);
          }
          v90 = *(_DWORD *)(BytePtr + 549);
        }
        else
        {
          v90 = 0;
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v14 = BytePtr + 13;
        }
        v142 = *(_OWORD *)&length[176];
        v143 = *(_OWORD *)&length[192];
        v144 = *(_OWORD *)&length[208];
        v145 = *(_OWORD *)&length[224];
        v138 = *(_OWORD *)&length[112];
        v139 = *(_OWORD *)&length[128];
        v140 = *(_OWORD *)&length[144];
        v141 = *(_OWORD *)&length[160];
        v134 = *(_OWORD *)&length[48];
        v135 = *(_OWORD *)&length[64];
        v136 = *(_OWORD *)&length[80];
        v137 = *(_OWORD *)&length[96];
        v130 = v94;
        v131 = *(_OWORD *)length;
        v132 = *(_OWORD *)&length[16];
        v133 = *(_OWORD *)&length[32];
        v127 = v111;
        v128 = v112;
        v129 = v113;
        v123 = v107;
        v124 = v108;
        v126 = v110;
        v125 = v109;
        v119 = v103;
        v120 = v104;
        v122 = v106;
        v121 = v105;
        v115 = valuePtr;
        v116 = v100;
        v33 = v10 > 0x1FF && v11 == 1;
        v34 = v33;
        v118 = v102;
        v117 = v101;
        v92 = v34;
        *(int8x16_t *)bytes = v9;
        if (v33)
        {
          v89 = *(_OWORD *)v14;
          v14 += 512;
          v10 -= 512;
          memset(__src, 0, sizeof(__src));
        }
        else
        {
          v89 = 0u;
        }
        v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        v94 = *(_OWORD *)bytes;
        *(_OWORD *)&length[244] = v145;
        *(_OWORD *)&length[196] = v142;
        *(_DWORD *)length = v12;
        *(_OWORD *)&length[212] = v143;
        *(_OWORD *)&length[228] = v144;
        *(_OWORD *)&length[132] = v138;
        *(_OWORD *)&length[148] = v139;
        *(_OWORD *)&length[164] = v140;
        *(_OWORD *)&length[180] = v141;
        *(_OWORD *)&length[68] = v134;
        *(_OWORD *)&length[84] = v135;
        *(_OWORD *)&length[100] = v136;
        *(_OWORD *)&length[116] = v137;
        *(_OWORD *)&length[4] = v130;
        *(_OWORD *)&length[20] = v131;
        *(_OWORD *)&length[36] = v132;
        *(_OWORD *)&length[52] = v133;
        *(_DWORD *)&length[260] = v13;
        *(_OWORD *)&length[456] = v127;
        *(_OWORD *)&length[472] = v128;
        *(_OWORD *)&length[488] = v129;
        *(_OWORD *)&length[392] = v123;
        *(_OWORD *)&length[408] = v124;
        *(_OWORD *)&length[424] = v125;
        *(_OWORD *)&length[440] = v126;
        *(_OWORD *)&length[328] = v119;
        *(_OWORD *)&length[344] = v120;
        *(_OWORD *)&length[360] = v121;
        *(_OWORD *)&length[376] = v122;
        *(_OWORD *)&length[264] = v115;
        *(_OWORD *)&length[280] = v116;
        *(_OWORD *)&length[296] = v117;
        *(_OWORD *)&length[312] = v118;
        v96 = v11;
        memset(v97, 0, sizeof(v97));
        v98 = v90;
        *(_QWORD *)&valuePtr = 2880294925;
        v37 = CFNumberCreate(v35, kCFNumberSInt64Type, &valuePtr);
        if (v37)
        {
          v38 = v37;
          CFDictionarySetValue(Mutable, CFSTR("LocationID"), v37);
          CFRelease(v38);
        }
        CFDictionarySetValue(Mutable, CFSTR("Transport"), CFSTR("Dummy"));
        CFDictionarySetValue(Mutable, CFSTR("HIDServiceSupport"), (const void *)*MEMORY[0x24BDBD270]);
        v39 = CFDictionaryCreateMutable(v35, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (v39)
        {
          v40 = v39;
          CFDictionaryAddValue(v39, CFSTR("0516B563-B15B-11DA-96EB-0014519758EF"), CFSTR("AppleMultitouchDriver.kext/Contents/PlugIns/MultitouchHID.plugin"));
          CFDictionarySetValue(Mutable, CFSTR("IOCFPlugInTypes"), v40);
          CFRelease(v40);
        }
        v41 = CFNumberCreate(v35, kCFNumberSInt32Type, &v94);
        if (v41)
        {
          v42 = v41;
          CFDictionarySetValue(Mutable, CFSTR("Family ID"), v41);
          CFRelease(v42);
        }
        v43 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 4);
        if (v43)
        {
          v44 = v43;
          CFDictionarySetValue(Mutable, CFSTR("Sensor Rows"), v43);
          CFRelease(v44);
        }
        v45 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 8);
        if (v45)
        {
          v46 = v45;
          CFDictionarySetValue(Mutable, CFSTR("Sensor Columns"), v45);
          CFRelease(v46);
        }
        v47 = CFNumberCreate(v35, kCFNumberSInt32Type, (const void *)((unint64_t)&v94 | 0xC));
        if (v47)
        {
          v48 = v47;
          CFDictionarySetValue(Mutable, CFSTR("bcdVersion"), v47);
          CFRelease(v48);
        }
        v49 = CFDataCreate(v35, &length[4], *(unsigned int *)length);
        if (v49)
        {
          v50 = v49;
          CFDictionarySetValue(Mutable, CFSTR("Sensor Region Descriptor"), v49);
          CFRelease(v50);
        }
        v51 = CFDataCreate(v35, &length[264], *(unsigned int *)&length[260]);
        if (v51)
        {
          v52 = v51;
          CFDictionarySetValue(Mutable, CFSTR("Sensor Region Param"), v51);
          CFRelease(v52);
        }
        if (v92)
        {
          v94 = v89;
          memcpy(length, __src, 0x1F0uLL);
          v53 = CFNumberCreate(v35, kCFNumberSInt32Type, &v94);
          if (v53)
          {
            v54 = v53;
            CFDictionarySetValue(Mutable, CFSTR("Sensor Surface Width"), v53);
            CFRelease(v54);
          }
          v55 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 4);
          if (v55)
          {
            v56 = v55;
            CFDictionarySetValue(Mutable, CFSTR("Sensor Surface Height"), v55);
            CFRelease(v56);
          }
          v57 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 8);
          if (v57)
          {
            v58 = v57;
            CFDictionarySetValue(Mutable, CFSTR("parser-type"), v57);
            CFRelease(v58);
          }
          v59 = CFNumberCreate(v35, kCFNumberSInt32Type, (const void *)((unint64_t)&v94 | 0xC));
          if (v59)
          {
            v60 = v59;
            CFDictionarySetValue(Mutable, CFSTR("parser-options"), v59);
            CFRelease(v60);
          }
        }
        v2 = (CFDataRef)MTPlayerCreate(Mutable, a2);
        CFRelease(Mutable);
        if (v2)
        {
          if (v10 >= 8 && (v10 & 0xFFFFFFFC) != 8)
          {
            v61 = 0;
            do
            {
              v62 = *((_DWORD *)v14 + 2);
              v63 = v10 - 12;
              v64 = bswap64(*(_QWORD *)v14);
              v65 = bswap32(v62);
              if (v93 == -1)
                v66 = v64;
              else
                v66 = *(_QWORD *)v14;
              if (v93 == -1)
                v67 = v65;
              else
                v67 = v62;
              v10 = v63 - v67;
              if (v63 < v67)
                break;
              v68 = malloc_type_malloc(0x28uLL, 0x1030040B1B30B78uLL);
              v68[28] = 0;
              *(_QWORD *)v68 = 0;
              *((_QWORD *)v68 + 1) = *((_QWORD *)v2 + 7);
              v69 = malloc_type_malloc(v67, 0x3FE07F93uLL);
              *((_QWORD *)v68 + 2) = v69;
              memcpy(v69, v14 + 12, v67);
              *((_DWORD *)v68 + 6) = v67;
              if (*((_QWORD *)v2 + 6))
              {
                v70 = (double)(v66 - v61) / 1000.0;
              }
              else
              {
                v61 = (unint64_t)((double)v66 / 1000.0);
                v70 = (double)v61;
                *((_QWORD *)v2 + 6) = v68;
              }
              *((double *)v68 + 4) = v70;
              v71 = (_QWORD *)*((_QWORD *)v2 + 7);
              if (v71)
                *v71 = v68;
              *((_QWORD *)v2 + 7) = v68;
              if (v10 < 8)
                break;
              v14 += v67 + 12;
            }
            while ((v10 & 0xFFFFFFFC) != 8);
          }
LABEL_73:
          *((_QWORD *)v2 + 8) = *((_QWORD *)v2 + 6);
          return v2;
        }
        return v2;
      }
    }
    return 0;
  }
  v2 = 0;
  if (v5 < 9)
    return v2;
  if ((v8 & 0xFFFFFFFC) == 8)
    return v2;
  v15 = *(unsigned int *)(BytePtr + 9);
  v16 = (const __CFData *)malloc_type_malloc(v15, 0x3B9331C7uLL);
  v2 = v16;
  if (!v16)
    return v2;
  v17 = v6 - 13;
  if (v6 - 13 < v15)
  {
    free(v16);
    return 0;
  }
  v72 = (char *)(BytePtr + 13);
  memcpy(v16, v72, v15);
  v73 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v74 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v2, v15);
  if (!v74)
    return 0;
  v75 = v74;
  v76 = (const __CFDictionary *)CFPropertyListCreateWithData(v73, v74, 2uLL, 0, 0);
  CFRelease(v75);
  free(v2);
  if (!v76)
    return 0;
  v2 = (CFDataRef)MTPlayerCreate(v76, a2);
  CFRelease(v76);
  if (v2)
  {
    v77 = v17 - v15;
    if (v17 - v15 >= 4)
    {
      v79 = 0;
      v80 = &v72[v15];
      do
      {
        if (v77 - 4 < 8)
          break;
        if (v77 == 12)
          break;
        v81 = *(unsigned int *)v80;
        v82 = v77 - 13;
        v77 = v77 - 13 - v81;
        if (v82 < v81)
          break;
        v83 = *(_QWORD *)(v80 + 4);
        v84 = v80[12];
        v85 = v80 + 13;
        v86 = malloc_type_malloc(0x28uLL, 0x1030040B1B30B78uLL);
        v86[28] = v84;
        *(_QWORD *)v86 = 0;
        *((_QWORD *)v86 + 1) = *((_QWORD *)v2 + 7);
        v87 = malloc_type_malloc(v81, 0x14DBD39AuLL);
        *((_QWORD *)v86 + 2) = v87;
        memcpy(v87, v85, v81);
        *((_DWORD *)v86 + 6) = v81;
        if (!*((_QWORD *)v2 + 6))
        {
          *((_QWORD *)v2 + 6) = v86;
          v79 = v83;
        }
        *((double *)v86 + 4) = (double)(unint64_t)(v83 - v79) / 1000.0;
        v88 = (_QWORD *)*((_QWORD *)v2 + 7);
        if (v88)
          *v88 = v86;
        v80 = &v85[v81];
        *((_QWORD *)v2 + 7) = v86;
      }
      while (v77 > 3);
    }
    goto LABEL_73;
  }
  return v2;
}

CFDataRef MTPlayerCreateFromFile(const char *a1, char a2)
{
  int v3;
  int v4;
  timespec v5;
  CFDataRef v6;
  const UInt8 *v7;
  UInt8 *v8;
  const __CFData *v9;
  const __CFData *v10;
  stat v12;

  v3 = open(a1, 0);
  if (v3 < 0)
    return 0;
  v4 = v3;
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v5;
  *(timespec *)v12.st_qspare = v5;
  v12.st_birthtimespec = v5;
  *(timespec *)&v12.st_size = v5;
  v12.st_mtimespec = v5;
  v12.st_ctimespec = v5;
  *(timespec *)&v12.st_uid = v5;
  v12.st_atimespec = v5;
  *(timespec *)&v12.st_dev = v5;
  if (fstat(v3, &v12) || (v7 = (const UInt8 *)mmap(0, v12.st_size, 1, 2, v4, 0), v7 == (const UInt8 *)-1))
  {
    v6 = 0;
  }
  else
  {
    v8 = (UInt8 *)v7;
    v9 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, v12.st_size, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    if (v9)
    {
      v10 = v9;
      v6 = MTPlayerCreateFromData(v9, a2);
      CFRelease(v10);
    }
    else
    {
      v6 = 0;
    }
    munmap(v8, v12.st_size);
  }
  close(v4);
  return v6;
}

uint64_t MTPlayerLoad(uint64_t a1)
{
  uint64_t v2;
  const __CFDictionary *v4;
  void (*v5)(uint64_t, uint64_t, _QWORD, _QWORD);
  io_object_t v6;
  io_service_t v7;
  const __CFAllocator *v8;
  task_port_t *v9;
  const CFDictionaryKeyCallBacks *v10;
  const CFDictionaryValueCallBacks *v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  uint64_t NotificationPort;
  unsigned int v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  io_iterator_t existing;
  _QWORD v21[6];
  unsigned int v22;
  _QWORD handler[6];
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  io_connect_t connect[3];

  if (!a1)
    return 3758097090;
  if (*(_DWORD *)(a1 + 112))
    return 3758097093;
  existing = -1431655766;
  v4 = IOServiceMatching("AppleMultitouchDummyV2");
  if (!v4)
    return 3758097084;
  v2 = 3758097084;
  if (!IOServiceGetMatchingServices(0, v4, &existing))
  {
    if (*(_DWORD *)(a1 + 112))
    {
      IOObjectRelease(existing);
LABEL_10:
      if (!*(_DWORD *)(a1 + 112))
        return 3758097086;
      v5 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 136);
      if (v5)
        v5(a1, 3, 0, *(_QWORD *)(a1 + 144));
      return 0;
    }
    v6 = IOIteratorNext(existing);
    if (v6)
    {
      v7 = v6;
      v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v9 = (task_port_t *)MEMORY[0x24BDAEC58];
      v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
      v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
      do
      {
        connect[0] = 0;
        v2 = IOServiceOpen(v7, *v9, 0, connect);
        if (!(_DWORD)v2)
        {
          *(_DWORD *)(a1 + 112) = connect[0];
          Mutable = CFDictionaryCreateMutable(v8, 0, v10, v11);
          if (!Mutable
            || (v13 = Mutable,
                CFDictionarySetValue(Mutable, CFSTR("Multitouch Properties"), *(const void **)(a1 + 16)),
                v2 = IOConnectSetCFProperties(*(_DWORD *)(a1 + 112), v13),
                CFRelease(v13),
                !(_DWORD)v2))
          {
            v26 = 0;
            v25 = 0;
            NotificationPort = IODataQueueAllocateNotificationPort();
            if ((_DWORD)NotificationPort)
            {
              v15 = NotificationPort;
              if (!MEMORY[0x22073CCB0](*(unsigned int *)(a1 + 112), 32, NotificationPort, 0)
                && !MEMORY[0x22073CC98](*(unsigned int *)(a1 + 112), 32, *v9, &v26, &v25, 1))
              {
                v19 = v26;
                v16 = dispatch_source_create(MEMORY[0x24BDAC9E0], v15, 0, *(dispatch_queue_t *)(a1 + 24));
                *(_QWORD *)(a1 + 128) = v16;
                v17 = MEMORY[0x24BDAC760];
                handler[0] = MEMORY[0x24BDAC760];
                handler[1] = 0x40000000;
                handler[2] = __mt_PlayerLoadForService_block_invoke;
                handler[3] = &__block_descriptor_tmp_53;
                handler[4] = a1;
                handler[5] = v26;
                v24 = v15;
                dispatch_source_set_cancel_handler(v16, handler);
                v18 = *(NSObject **)(a1 + 128);
                v21[0] = v17;
                v21[1] = 0x40000000;
                v21[2] = __mt_PlayerLoadForService_block_invoke_2;
                v21[3] = &__block_descriptor_tmp_56;
                v21[4] = a1;
                v21[5] = v19;
                v22 = v15;
                dispatch_source_set_event_handler(v18, v21);
                dispatch_resume(*(dispatch_object_t *)(a1 + 128));
              }
            }
            v2 = 0;
          }
        }
        IOObjectRelease(v7);
        if (*(_DWORD *)(a1 + 112))
          break;
        v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    else
    {
      v2 = 0;
    }
    IOObjectRelease(existing);
    if (!(_DWORD)v2)
      goto LABEL_10;
  }
  return v2;
}

uint64_t MTPlayerUnload(uint64_t a1)
{
  uint64_t result;
  io_connect_t v3;
  void (*v4)(uint64_t, uint64_t, _QWORD, _QWORD);

  result = 3758097090;
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 112);
    if (v3)
    {
      if (*(_QWORD *)(a1 + 128))
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 128));
        dispatch_release(*(dispatch_object_t *)(a1 + 128));
        *(_QWORD *)(a1 + 128) = 0;
        v3 = *(_DWORD *)(a1 + 112);
      }
      IOServiceClose(v3);
      *(_DWORD *)(a1 + 112) = 0;
      v4 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 136);
      if (v4)
        v4(a1, 4, 0, *(_QWORD *)(a1 + 144));
      return 0;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t MTPlayerSetEventCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 136) = a2;
    *(_QWORD *)(result + 144) = a3;
  }
  return result;
}

uint64_t MTPlayerSetFramePlaybackCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 152) = a2;
    *(_QWORD *)(result + 160) = a3;
  }
  return result;
}

uint64_t MTPlayerSetAnnotationCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 168) = a2;
    *(_QWORD *)(result + 176) = a3;
  }
  return result;
}

double MTPlayerGetLength(uint64_t a1)
{
  double result;
  uint64_t v2;
  uint64_t v3;

  result = 0.0;
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 56);
      if (v3)
        return *(double *)(v3 + 32) - *(double *)(v2 + 32);
    }
  }
  return result;
}

void mt_PlayerPlaybackTimerHandler(uint64_t a1)
{
  double v2;
  double Current;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  void (*v8)(uint64_t, _QWORD, _QWORD, _QWORD, double);
  void (*v9)(uint64_t, _QWORD, _QWORD);
  uint64_t *v10;
  NSObject *v11;
  _QWORD block[5];

  v2 = *(double *)(a1 + 88);
  Current = MTAbsoluteTimeGetCurrent();
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = Current;
    v5 = *(double *)(a1 + 96) + v2 * (Current - *(double *)(a1 + 80));
    v6 = *(_QWORD *)(a1 + 64);
    if (!v6)
    {
LABEL_22:
      *(_QWORD *)(a1 + 64) = 0;
      *(double *)(a1 + 80) = v4;
      *(double *)(a1 + 96) = v5;
      *(double *)(a1 + 104) = v5;
      v11 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __mt_PlayerPlaybackTimerHandler_block_invoke;
      block[3] = &__block_descriptor_tmp_1;
      block[4] = a1;
      dispatch_async(v11, block);
      return;
    }
    while (1)
    {
      if (v2 > 0.0 && (v7 = *(double *)(v6 + 32), v7 <= v5))
      {
        if (v7 >= *(double *)(a1 + 96))
          goto LABEL_13;
        if (v2 >= 0.0)
          goto LABEL_19;
      }
      else
      {
        if (v2 >= 0.0 || (v7 = *(double *)(v6 + 32), v7 < v5))
        {
          *(_QWORD *)(a1 + 64) = v6;
          *(double *)(a1 + 80) = v4;
          *(double *)(a1 + 96) = v5;
          *(double *)(a1 + 104) = v5;
          return;
        }
        if (v2 > 0.0 && v7 >= *(double *)(a1 + 96))
        {
LABEL_13:
          if (*(_BYTE *)(v6 + 28) == 1)
          {
            v9 = *(void (**)(uint64_t, _QWORD, _QWORD))(a1 + 168);
            if (v9)
              v9(a1, *(_QWORD *)(v6 + 16), *(_QWORD *)(a1 + 176));
          }
          else if (!*(_BYTE *)(v6 + 28))
          {
            mt_PlayerDispatchFrame(a1, *(const void **)(v6 + 16), *(_DWORD *)(v6 + 24));
            v8 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, double))(a1 + 152);
            if (v8)
            {
              v8(a1, *(_QWORD *)(v6 + 16), *(unsigned int *)(v6 + 24), *(_QWORD *)(a1 + 160), *(double *)(v6 + 32));
              *(_QWORD *)(a1 + 104) = *(_QWORD *)(v6 + 32);
            }
          }
          goto LABEL_19;
        }
      }
      if (v7 <= *(double *)(a1 + 96))
        goto LABEL_13;
LABEL_19:
      v10 = (uint64_t *)(v6 + 8);
      if (v2 >= 0.0)
        v10 = (uint64_t *)v6;
      v6 = *v10;
      if (!*v10)
        goto LABEL_22;
    }
  }
}

BOOL MTPlayerIsPlaying(_BOOL8 result)
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

uint64_t mt_PlayerDispatchFrame(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v3;
  mach_port_t v7;
  uint64_t v8;
  uint32_t outputCnt;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v3 = 3758097101;
  if (*(_DWORD *)(a1 + 112))
  {
    if (*(_DWORD *)(a1 + 116) >= a3)
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 216), 0xFFFFFFFFFFFFFFFFLL);
      memcpy(*(void **)(a1 + 120), a2, a3);
      outputCnt = 0;
      v7 = *(_DWORD *)(a1 + 112);
      v8 = *(unsigned int *)(a1 + 116);
      input[0] = *(_QWORD *)(a1 + 120);
      input[1] = v8;
      input[2] = a3;
      v3 = IOConnectCallScalarMethod(v7, 0, input, 3u, 0, &outputCnt);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 216));
    }
    else
    {
      return 3758097128;
    }
  }
  return v3;
}

uint64_t MTPlayerStop(_QWORD *a1)
{
  void (*v2)(_QWORD *, _QWORD, _QWORD, _QWORD);

  if (!a1)
    return 3758097090;
  _doMTPlayerPause((uint64_t)a1);
  a1[12] = 0;
  a1[13] = 0;
  a1[8] = a1[6];
  v2 = (void (*)(_QWORD *, _QWORD, _QWORD, _QWORD))a1[17];
  if (v2)
    v2(a1, 0, 0, a1[18]);
  return 0;
}

uint64_t MTPlayerPlay(uint64_t a1)
{
  uint64_t result;
  double Current;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(uint64_t, uint64_t, _QWORD, _QWORD);
  _QWORD handler[5];

  result = 3758097090;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      return 3758097093;
    }
    else
    {
      dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
      Current = MTAbsoluteTimeGetCurrent();
      *(double *)(a1 + 72) = Current;
      *(double *)(a1 + 80) = Current;
      v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 24));
      *(_QWORD *)(a1 + 40) = v4;
      dispatch_source_set_timer(v4, 0, 0xF4240uLL, 0);
      v5 = *(NSObject **)(a1 + 40);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = __MTPlayerPlay_block_invoke;
      handler[3] = &__block_descriptor_tmp_4;
      handler[4] = a1;
      dispatch_source_set_event_handler(v5, handler);
      dispatch_resume(*(dispatch_object_t *)(a1 + 40));
      v6 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 136);
      if (v6)
        v6(a1, 1, 0, *(_QWORD *)(a1 + 144));
      return 0;
    }
  }
  return result;
}

uint64_t MTPlayerPlayNextFrame(_QWORD *a1)
{
  uint64_t result;
  uint64_t *v3;
  void (*v4)(_QWORD *, uint64_t, _QWORD, _QWORD, double);
  void (*v5)(_QWORD *, uint64_t, _QWORD, double);
  double v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];

  result = 3758097090;
  if (a1)
  {
    if (a1[5])
    {
      return 3758097093;
    }
    else
    {
      v3 = (uint64_t *)a1[8];
      if (v3)
      {
        if (*((_BYTE *)v3 + 28) == 1)
        {
          v5 = (void (*)(_QWORD *, uint64_t, _QWORD, double))a1[21];
          if (v5)
            v5(a1, v3[2], a1[22], *((double *)v3 + 4));
        }
        else if (!*((_BYTE *)v3 + 28))
        {
          mt_PlayerDispatchFrame((uint64_t)a1, (const void *)v3[2], *((_DWORD *)v3 + 6));
          v4 = (void (*)(_QWORD *, uint64_t, _QWORD, _QWORD, double))a1[19];
          if (v4)
            v4(a1, v3[2], *((unsigned int *)v3 + 6), a1[20], *((double *)v3 + 4));
        }
        v6 = *(double *)v3;
        a1[8] = *v3;
        v7 = v3[4];
        a1[12] = v7;
        a1[13] = v7;
        if (v6 == 0.0)
        {
          v8 = a1[3];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __MTPlayerPlayNextFrame_block_invoke;
          block[3] = &__block_descriptor_tmp_5;
          block[4] = a1;
          dispatch_async(v8, block);
        }
        return 0;
      }
      else
      {
        return 3758097128;
      }
    }
  }
  return result;
}

uint64_t MTPlayerPlayPreviousFrame(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  void (*v6)(_QWORD *, uint64_t, _QWORD, _QWORD, double);
  void (*v7)(_QWORD *, uint64_t, _QWORD, double);
  double v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];

  result = 3758097128;
  if (!a1)
    return 3758097090;
  if (a1[5])
    return 3758097093;
  v3 = a1[8];
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (v4)
    {
      v5 = *(uint64_t **)(v4 + 8);
      if (v5)
      {
        if (*((_BYTE *)v5 + 28) == 1)
        {
          v7 = (void (*)(_QWORD *, uint64_t, _QWORD, double))a1[21];
          if (v7)
            v7(a1, v5[2], a1[22], *((double *)v5 + 4));
        }
        else if (!*((_BYTE *)v5 + 28))
        {
          mt_PlayerDispatchFrame((uint64_t)a1, (const void *)v5[2], *((_DWORD *)v5 + 6));
          v6 = (void (*)(_QWORD *, uint64_t, _QWORD, _QWORD, double))a1[19];
          if (v6)
            v6(a1, v5[2], *((unsigned int *)v5 + 6), a1[20], *((double *)v5 + 4));
        }
        v8 = *(double *)v5;
        a1[8] = *v5;
        v9 = v5[4];
        a1[12] = v9;
        a1[13] = v9;
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v8 + 8) + 8))
        {
          v10 = a1[3];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __MTPlayerPlayPreviousFrame_block_invoke;
          block[3] = &__block_descriptor_tmp_6;
          block[4] = a1;
          dispatch_async(v10, block);
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t MTPlayerPause(uint64_t a1)
{
  void (*v2)(uint64_t, uint64_t, _QWORD, _QWORD);

  if (!a1)
    return 3758097090;
  if (!_doMTPlayerPause(a1))
  {
    v2 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 136);
    if (v2)
      v2(a1, 2, 0, *(_QWORD *)(a1 + 144));
  }
  return 0;
}

uint64_t _doMTPlayerPause(uint64_t a1)
{
  uint64_t result;

  result = 3758097101;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
      dispatch_release(*(dispatch_object_t *)(a1 + 40));
      result = 0;
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 72) = 0;
      *(_QWORD *)(a1 + 80) = 0;
    }
  }
  return result;
}

double MTPlayerGetRate(uint64_t a1)
{
  return *(double *)(a1 + 88);
}

void MTPlayerSetRate(uint64_t a1, double a2)
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD block[5];

  if (!a1 || !*(_QWORD *)(a1 + 40))
  {
    v4 = *(uint64_t ***)(a1 + 64);
    if (v4)
    {
      v5 = v4[1];
      if (v5 && a2 < 0.0 && *(double *)(a1 + 88) > 0.0)
      {
        v6 = v5[1];
        *(_QWORD *)(a1 + 64) = v6;
        if (!v6)
        {
          v7 = *(NSObject **)(a1 + 24);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __MTPlayerSetRate_block_invoke;
          block[3] = &__block_descriptor_tmp_7;
          block[4] = a1;
          dispatch_async(v7, block);
          goto LABEL_14;
        }
LABEL_13:
        v9 = *(_QWORD *)(v6 + 32);
        *(_QWORD *)(a1 + 96) = v9;
        *(_QWORD *)(a1 + 104) = v9;
        goto LABEL_14;
      }
      v8 = *v4;
      if (v8 && a2 > 0.0 && *(double *)(a1 + 88) < 0.0)
      {
        v6 = *v8;
        *(_QWORD *)(a1 + 64) = v6;
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  *(double *)(a1 + 88) = a2;
}

double MTPlayerGetPosition(uint64_t a1)
{
  return *(double *)(a1 + 104);
}

void MTPlayerSetPosition(uint64_t a1, double a2)
{
  double v4;
  NSObject *v5;
  double *v6;

  v4 = *(double *)(a1 + 96);
  if (v4 > a2 && *(double *)(a1 + 88) > 0.0)
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 48);
  if (v4 < a2 && *(double *)(a1 + 88) < 0.0)
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 56);
  v5 = *(NSObject **)(a1 + 40);
  if (v5)
  {
    dispatch_suspend(v5);
    *(double *)(a1 + 96) = a2;
    *(double *)(a1 + 104) = a2;
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));
  }
  else
  {
    *(double *)(a1 + 96) = a2;
    *(double *)(a1 + 104) = a2;
  }
  v6 = *(double **)(a1 + 64);
  if (v6)
  {
    while (v6[4] > a2)
    {
      v6 = (double *)*((_QWORD *)v6 + 1);
      if (!v6)
        goto LABEL_16;
    }
    do
    {
      if (v6[4] >= a2)
        break;
      v6 = *(double **)v6;
    }
    while (v6);
  }
LABEL_16:
  *(_QWORD *)(a1 + 64) = v6;
}

uint64_t MTPlayerGetDeviceProperties(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

uint64_t MTPlayerDispatchFrame(uint64_t a1, const void *a2, unsigned int a3)
{
  if (a1)
    return mt_PlayerDispatchFrame(a1, a2, a3);
  else
    return 3758097090;
}

uint64_t MTPlayerSetGetReportHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 184) = a2;
    *(_QWORD *)(result + 192) = a3;
  }
  return result;
}

uint64_t MTPlayerSetSetReportHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 200) = a2;
    *(_QWORD *)(result + 208) = a3;
  }
  return result;
}

uint64_t MTPlayerGetTypeID()
{
  uint64_t result;

  result = __kMTPlayerTypeID;
  if (!__kMTPlayerTypeID)
  {
    pthread_once(&__playerTypeInit, (void (*)(void))__MTPlayerRegister);
    return __kMTPlayerTypeID;
  }
  return result;
}

uint64_t __MTPlayerRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kMTPlayerTypeID = result;
  return result;
}

uint64_t MTPlayerCreate(const __CFDictionary *a1, char a2)
{
  const __CFAllocator *v4;
  uint64_t Instance;
  __CFDictionary *MutableCopy;
  const __CFNumber *Value;
  const __CFNumber *v8;
  CFTypeID v9;
  unsigned int v10;
  int v11;
  int valuePtr;

  if (!a1)
    return 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!__kMTPlayerTypeID)
    pthread_once(&__playerTypeInit, (void (*)(void))__MTPlayerRegister);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, a1);
    *(_QWORD *)(Instance + 16) = MutableCopy;
    if ((a2 & 1) != 0)
    {
      CFDictionaryRemoveValue(MutableCopy, CFSTR("IOCFPlugInTypes"));
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(Instance + 16), CFSTR("MTHIDDevice"));
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(Instance + 16), CFSTR("parser-type"));
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(Instance + 16), CFSTR("parser-options"));
      MutableCopy = *(__CFDictionary **)(Instance + 16);
    }
    Value = (const __CFNumber *)CFDictionaryGetValue(MutableCopy, CFSTR("Max Packet Size"));
    if (Value)
    {
      v8 = Value;
      v9 = CFGetTypeID(Value);
      v10 = 4096;
      if (v9 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        v11 = CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
        if (valuePtr > 511 && v11 == 1)
          v10 = valuePtr;
        else
          v10 = 4096;
      }
    }
    else
    {
      v10 = 4096;
    }
    *(_DWORD *)(Instance + 116) = v10;
    *(_QWORD *)(Instance + 120) = malloc_type_malloc(v10, 0x6FD9EA78uLL);
  }
  return Instance;
}

dispatch_semaphore_t __MTPlayerInit(dispatch_semaphore_t result)
{
  dispatch_semaphore_t v1;

  if (result)
  {
    v1 = result;
    *(_OWORD *)&result[24].isa = 0u;
    *(_OWORD *)&result[26].isa = 0u;
    *(_OWORD *)&result[20].isa = 0u;
    *(_OWORD *)&result[22].isa = 0u;
    *(_OWORD *)&result[16].isa = 0u;
    *(_OWORD *)&result[18].isa = 0u;
    *(_OWORD *)&result[12].isa = 0u;
    *(_OWORD *)&result[14].isa = 0u;
    *(_OWORD *)&result[8].isa = 0u;
    *(_OWORD *)&result[10].isa = 0u;
    *(_OWORD *)&result[4].isa = 0u;
    *(_OWORD *)&result[6].isa = 0u;
    *(_OWORD *)&result[2].isa = 0u;
    result[3].isa = (Class)dispatch_queue_create("com.apple.MultitouchSupport.playback", 0);
    v1[4].isa = (Class)dispatch_group_create();
    v1[5].isa = 0;
    v1[7].isa = 0;
    v1[8].isa = 0;
    v1[12].isa = 0;
    v1[13].isa = 0;
    v1[11].isa = (Class)0x3FF0000000000000;
    *(_OWORD *)&v1[16].isa = 0u;
    *(_OWORD *)&v1[18].isa = 0u;
    *(_OWORD *)&v1[20].isa = 0u;
    *(_OWORD *)&v1[22].isa = 0u;
    *(_OWORD *)&v1[24].isa = 0u;
    v1[26].isa = 0;
    result = dispatch_semaphore_create(1);
    v1[27].isa = (Class)result;
    HIDWORD(v1[14].isa) = 4096;
    v1[15].isa = 0;
  }
  return result;
}

void __MTPlayerRelease(uint64_t a1)
{
  const void *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  if (a1 && *(_QWORD *)(a1 + 40))
    MTPlayerStop((_QWORD *)a1);
  if (*(_DWORD *)(a1 + 112))
    MTPlayerUnload(a1);
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  *(_QWORD *)(a1 + 24) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 216));
  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v4 = (_QWORD *)(a1 + 48);
  v3 = *(_QWORD **)(a1 + 48);
  if (v3)
  {
    do
    {
      v5 = (_QWORD *)*v3;
      free(v3);
      *v4 = v5;
      v3 = v5;
    }
    while (v5);
  }
  *v4 = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v6 = *(void **)(a1 + 120);
  if (v6)
  {
    free(v6);
    *(_QWORD *)(a1 + 120) = 0;
  }
}

uint64_t mtalg_FillinValidPixelRange(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (result)
  {
    if ((*(_BYTE *)(a2 + 24) & 0x50) != 0)
      v2 = 0x780000008800;
    else
      v2 = *(unsigned __int16 *)(a2 + 36);
    *(_QWORD *)(a2 + 28) = v2;
  }
  return result;
}

uint64_t mt_ForwardSpecificImageRegion()
{
  uint64_t v0;
  char v1;
  char v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  _BYTE *v9;
  _BYTE *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  int v22;
  uint64_t v23;
  _WORD *v24;
  _QWORD v26[5];
  _BYTE __b[32768];
  uint64_t v28;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = v0;
  v28 = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, sizeof(__b));
  *(_OWORD *)v26 = xmmword_21A1FED18;
  memset(&v26[2], 170, 24);
  *(double *)&v26[1] = (double)*(int *)(v6 + 12) / 1000.0;
  v26[0] = *(unsigned int *)(v6 + 4);
  HIDWORD(v26[2]) = 1 << *v10;
  LODWORD(v26[3]) = v4;
  v16 = v10[5];
  LOWORD(v26[2]) = v10[5];
  v17 = v10[2];
  WORD1(v26[2]) = v10[2];
  WORD2(v26[4]) = v8;
  BYTE6(v26[4]) = v2;
  if ((_DWORD)v17)
  {
    v18 = 0;
    v19 = v10[3];
    v20 = v12 * v10[1];
    v21 = __b;
    do
    {
      if ((_DWORD)v16)
      {
        v22 = v20 + v10[4];
        v23 = v16;
        v24 = v21;
        do
        {
          *v24++ = *(_WORD *)(v14 + 2 * v22++);
          --v23;
        }
        while (v23);
      }
      v18 += v19;
      v21 += 2 * v16 * v19;
      v20 += v12 * v19;
    }
    while (v18 < v17);
  }
  return MTAlg_IssueImageCallbacks(v15, __b, (__int128 *)v26);
}

uint64_t mt_ForwardCombinedImageRegions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  __int16 v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 *v36;
  int v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  _QWORD v47[5];
  _WORD v48[16384];
  uint64_t v49;

  v11 = MEMORY[0x24BDAC7A8]();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = v11;
  v49 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v47 = xmmword_21A1FED18;
  memset(&v47[2], 170, 24);
  *(double *)&v47[1] = (double)*(int *)(a9 + 12) / 1000.0;
  v47[0] = *(unsigned int *)(a9 + 4);
  LODWORD(v47[3]) = a10;
  LOWORD(v47[2]) = v12;
  WORD1(v47[2]) = v23;
  WORD2(v47[4]) = v24;
  BYTE6(v47[4]) = a11;
  bzero(v48, 0x8000uLL);
  if (v15 < 1)
  {
    v28 = 0;
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = v15;
    do
    {
      v30 = v17 - v25;
      v31 = (_BYTE *)(v17 - v25 + 8 * v25);
      if (v25)
      {
        v32 = v25 - 1;
        if (v31[1] != *(v31 - 6))
          v26 += *(unsigned __int8 *)(v17 - v32 + 8 * v32 + 2);
        v33 = v17 - v32 + 8 * v32;
        if (*(unsigned __int8 *)(v30 + 8 * v25 + 4) != *(unsigned __int8 *)(v33 + 4))
          v27 += *(unsigned __int8 *)(v33 + 5);
      }
      v34 = v31[2];
      if (v31[2])
      {
        v35 = 0;
        v36 = (unsigned __int8 *)(v30 + 8 * v25);
        v37 = v36[1];
        v38 = v36[5];
        v39 = v36 + 4;
        v40 = v36[3];
        v41 = v27 + v13 * v26;
        v42 = v19 * v37;
        do
        {
          if ((_DWORD)v38)
          {
            v43 = v42 + *v39;
            v44 = v38;
            v45 = v41;
            do
            {
              v48[v45++] = *(_WORD *)(v21 + 2 * v43++);
              --v44;
            }
            while (v44);
          }
          v35 += v40;
          v41 += v13 * v40;
          v42 += v19 * v40;
        }
        while (v35 < v34);
      }
      v28 |= 1 << *v31;
      ++v25;
    }
    while (v25 != v29);
  }
  HIDWORD(v47[2]) = v28;
  return MTAlg_IssueImageCallbacks(v22, v48, (__int128 *)v47);
}

uint64_t mt_ForwardImageRegion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  _BYTE *v33;
  uint64_t v34;
  int v35;
  _WORD *v36;
  __int128 v37[3];
  _DWORD v38[2];
  _BYTE __b[32768];
  uint64_t v40;

  v9 = MEMORY[0x24BDAC7A8]();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = v9;
  v40 = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, sizeof(__b));
  *(_DWORD *)((char *)v38 + 3) = -1431655766;
  v38[0] = -1431655766;
  result = MTDeviceGetSensorRegionOfType(v24, v38, v23);
  if (!(_DWORD)result)
  {
    v37[0] = xmmword_21A1FED18;
    memset(&v37[1], 170, 24);
    *((double *)v37 + 1) = (double)*(int *)(v15 + 12) / 1000.0;
    *(_QWORD *)&v37[0] = *(unsigned int *)(v15 + 4);
    *(_QWORD *)((char *)&v37[1] + 4) = __PAIR64__(v13, v21);
    v26 = BYTE1(v38[1]);
    LOWORD(v37[1]) = BYTE1(v38[1]);
    v27 = BYTE2(v38[0]);
    WORD1(v37[1]) = BYTE2(v38[0]);
    WORD2(v37[2]) = v11;
    BYTE6(v37[2]) = a9;
    if (BYTE2(v38[0]))
    {
      v28 = 0;
      v29 = HIBYTE(v38[0]);
      v30 = 2 * BYTE1(v38[1]) * (unint64_t)HIBYTE(v38[0]);
      v31 = LOBYTE(v38[1]) + v17 * BYTE1(v38[0]);
      v32 = v17 * HIBYTE(v38[0]);
      v33 = __b;
      do
      {
        if ((_DWORD)v26)
        {
          v34 = v26;
          v35 = v31;
          v36 = v33;
          do
          {
            *v36++ = *(_WORD *)(v19 + 2 * v35++);
            --v34;
          }
          while (v34);
        }
        v28 += v29;
        v33 += v30;
        v31 += v32;
      }
      while (v28 < v27);
    }
    return MTAlg_IssueImageCallbacks(v24, __b, v37);
  }
  return result;
}

uint64_t mtp_ForwardDeviceImageSubRegions(uint64_t a1)
{
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v6 = 0;
  v5 = 0;
  result = MTAlg_DeviceGetSensorRegionArray(a1, &v5, &v6);
  if (!(_DWORD)result)
  {
    v2 = v6;
    if (v6)
    {
      v3 = 0;
      v4 = 0;
      do
      {
        if (*(_BYTE *)(v5 + v3))
        {
          result = mt_ForwardSpecificImageRegion();
          v2 = v6;
        }
        ++v4;
        v3 += 7;
      }
      while (v4 < v2);
    }
  }
  return result;
}

uint64_t mtp_ForwardDeviceImageBuffer(uint64_t a1, const void *a2, __int16 a3, __int16 a4, uint64_t a5, int a6, unsigned int a7, int a8, int a9, char a10)
{
  double v11;
  int v12;
  uint64_t result;
  __int128 v14[3];

  v11 = (double)*(int *)(a5 + 12);
  *(_QWORD *)&v14[0] = 0xAAAAAAAAAAAAAAAALL;
  memset(&v14[1], 170, 24);
  *((double *)v14 + 1) = v11 / 1000.0;
  *(_QWORD *)&v14[0] = *(unsigned int *)(a5 + 4);
  if (a6)
    v12 = a6;
  else
    v12 = 2147483646;
  *(_QWORD *)((char *)&v14[1] + 4) = __PAIR64__(a7, v12);
  LOWORD(v14[1]) = a4;
  WORD1(v14[1]) = a3;
  WORD2(v14[2]) = a9 - a8;
  BYTE6(v14[2]) = a10;
  HIDWORD(v14[1]) = a9;
  LODWORD(v14[2]) = a8;
  result = MTAlg_IssueImageCallbacks(a1, a2, v14);
  if (DWORD1(v14[1]) == 2147483646)
    return mtp_ForwardDeviceImageSubRegions(a1);
  return result;
}

uint64_t MTActuatorGetTypeID()
{
  uint64_t result;

  result = __kMTActuatorTypeID;
  if (!__kMTActuatorTypeID)
  {
    pthread_once(&__actuatorTypeInit, (void (*)(void))__MTActuatorRegister);
    return __kMTActuatorTypeID;
  }
  return result;
}

uint64_t __MTActuatorRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kMTActuatorTypeID = result;
  return result;
}

uint64_t MTActuatorCreate(io_object_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  uint64_t Instance;
  void *CFProperty;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!__kMTActuatorTypeID)
    pthread_once(&__actuatorTypeInit, (void (*)(void))__MTActuatorRegister);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
    {
      IOObjectRetain(a1);
      *(_DWORD *)(Instance + 16) = a1;
    }
    *(_DWORD *)(Instance + 20) = 0;
    *(_DWORD *)(Instance + 24) = 0;
    *(_QWORD *)(Instance + 32) = a2;
    *(_BYTE *)(Instance + 48) = 1;
    *(_QWORD *)(Instance + 56) = 0;
    *(_OWORD *)(Instance + 72) = xmmword_21A1FED40;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, CFSTR("ActuatorLimits"), v4, 0);
    v7 = CFProperty;
    if (CFProperty)
    {
      objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("AmplitudeMin"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "floatValue");
        *(_DWORD *)(Instance + 72) = v10;
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AmplitudeMax"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "floatValue");
        *(_DWORD *)(Instance + 76) = v13;
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DurationMin"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "floatValue");
        *(_DWORD *)(Instance + 80) = v16;
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DurationMax"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "floatValue");
        *(_DWORD *)(Instance + 84) = v19;
      }

    }
  }
  return Instance;
}

uint64_t MTActuatorSetMTDevice(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t MTActuatorSetFirmwareClicks(uint64_t a1, char a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097084;
  if (!a1)
    return 3758097090;
  if (!MTActuatorIsOpen(a1))
    return 3758097101;
  v5 = *(id *)(a1 + 40);
  if (v5)
  {
    if ((a2 & 8) != 0)
      v6 = 4294967294;
    else
      v6 = 2;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MTActuationSetFirmwareDownClick((uint64_t)v8, (float *)a1);
      if (v9)
      {
        v10 = v9;
        MTLoggingFramework();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v19 = 67109120;
          v20 = v10;
          _os_log_impl(&dword_21A1DE000, v11, OS_LOG_TYPE_ERROR, "Error updating firmware primary down click, 0x%08x", (uint8_t *)&v19, 8u);
        }

      }
    }
    if ((a2 & 8) != 0)
      v12 = 0xFFFFFFFFLL;
    else
      v12 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = MTActuationSetFirmwareUpClick((uint64_t)v14, (float *)a1);
      if (v15)
      {
        v16 = v15;
        MTLoggingFramework();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v19 = 67109120;
          v20 = v16;
          _os_log_impl(&dword_21A1DE000, v17, OS_LOG_TYPE_ERROR, "Error updating firmware primary up click, 0x%08x", (uint8_t *)&v19, 8u);
        }

      }
    }

    v2 = 0;
  }

  return v2;
}

uint64_t MTActuatorActuate(uint64_t a1, unsigned int a2, char a3)
{
  uint64_t v3;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = 3758097090;
  if (a1)
  {
    if (MTActuatorIsOpen(a1))
    {
      v7 = *(id *)(a1 + 40);
      if (v7)
      {
        if (a2 <= 0x24)
        {
          if ((a3 & 8) != 0)
            v8 = -a2;
          else
            v8 = a2;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            v3 = MTActuationActuate((uint64_t)v10, (float *)a1);
          else
            v3 = 3758097136;
        }
      }
      else
      {
        v3 = 3758097084;
      }

    }
    else
    {
      return 3758097101;
    }
  }
  return v3;
}

void _MTActuationLoadActuationsFromPropertyListV2orV3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  void *v22;
  const __CFDictionary *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  uint32_t v28;
  void *v29;
  id v30;
  NSObject *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  _BYTE v37[10];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Actuator_%d"), *(unsigned int *)(a1 + 68));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default")),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v29 = v7;
      v30 = v5;
      v9 = *(id *)(a1 + 40);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v10 = v8;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (!v11)
        goto LABEL_29;
      v12 = v11;
      v13 = *(_QWORD *)v33;
      obj = v10;
      while (1)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ActuationID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -objc_msgSend(v16, "intValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "intValue") == 3)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Default"));
            v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = v15;
          }
          v19 = v18;
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Silent"));
          v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "intValue") & 0x80000000) != 0 || !v19)
          {
            MTLoggingFramework();
            v25 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              goto LABEL_26;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v37 = v16 == 0;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v19 == 0;
            v26 = v25;
            v27 = "Error parsing click playlist, unable to determine actuation id(%d) or default waveform not defined(%d)";
            v28 = 14;
LABEL_25:
            _os_log_impl(&dword_21A1DE000, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
            goto LABEL_26;
          }
          v21 = MTActuationCreateFromDictionary(v19, 0);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v16);

          objc_msgSend(v9, "objectForKeyedSubscript:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            MTLoggingFramework();
            v25 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              goto LABEL_26;
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v37 = v16;
            v26 = v25;
            v27 = "Error parsing click playlist, failed to create default waveform for actuationID=%@";
LABEL_24:
            v28 = 12;
            goto LABEL_25;
          }
          if (!v20)
            v20 = v19;
          v23 = MTActuationCreateFromDictionary(v20, 0);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, v17);

          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v16);
            MTLoggingFramework();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v37 = v17;
              v26 = v25;
              v27 = "Error parsing click playlist, failed to create silent waveform for actuationID=%@";
              goto LABEL_24;
            }
LABEL_26:

          }
        }
        v10 = obj;
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        if (!v12)
        {
LABEL_29:

          v7 = v29;
          v5 = v30;
          goto LABEL_30;
        }
      }
    }
    MTLoggingFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v37 = v6;
      _os_log_impl(&dword_21A1DE000, v10, OS_LOG_TYPE_ERROR, "Error parsing click playlist, revision %@ and default not found", buf, 0xCu);
    }
LABEL_30:

  }
}

void _MTActuationLoadActuationsFromPropertyList(uint64_t a1, void *cf)
{
  CFTypeID v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (cf && (v4 = CFGetTypeID(cf), v4 == CFDictionaryGetTypeID()))
  {
    v5 = cf;
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("Version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "intValue") & 0xFFFFFFFE) == 2)
    {
      _MTActuationLoadActuationsFromPropertyListV2orV3(a1, v5, v6);
    }
    else
    {
      MTLoggingFramework();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21A1DE000, v7, OS_LOG_TYPE_ERROR, "Error parsing click playlist, unknown version", v8, 2u);
      }

    }
  }
  else
  {
    MTLoggingFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A1DE000, v5, OS_LOG_TYPE_ERROR, "Failed to load actuations from plist - Invalid plist reference", buf, 2u);
    }
  }

}

void MTActuatorLoadActuations(uint64_t a1)
{
  const void *v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  uint8_t *v5;
  const __CFData *v6;
  const __CFData *v7;
  void *v8;
  const void *v9;
  void *v10;
  const void *v11;
  unint64_t size;

  if (a1)
  {
    v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(a1 + 40) = Mutable;
    if (Mutable)
    {
      size = 0xAAAAAAAAAAAAAAAALL;
      v5 = getsectiondata((const mach_header_64 *)&dword_21A1DE000, "__TEXT", "__tpad_act_plist", &size);
      if (v5)
      {
        v6 = CFDataCreate(v3, v5, size);
        if (v6)
        {
          v7 = v6;
          v8 = (void *)CFPropertyListCreateWithData(v3, v6, 0, 0, 0);
          if (v8)
          {
            v9 = v8;
            _MTActuationLoadActuationsFromPropertyList(a1, v8);
            CFRelease(v9);
          }
          CFRelease(v7);
        }
      }
      if (CFPreferencesGetAppBooleanValue(CFSTR("ClickOverrideEnabled"), CFSTR("com.apple.MultitouchSupport"), 0))
      {
        v10 = (void *)CFPreferencesCopyAppValue(CFSTR("ClickOverridePlaylist"), CFSTR("com.apple.MultitouchSupport"));
        if (v10)
        {
          v11 = v10;
          _MTActuationLoadActuationsFromPropertyList(a1, v10);
          CFRelease(v11);
        }
      }
    }
  }
}

uint64_t _GetMTActuationID(int a1)
{
  if ((a1 - 1) > 5)
    return 0;
  else
    return dword_21A1FED58[a1 - 1];
}

double __MTActuatorInit(uint64_t a1)
{
  double result;

  if (a1)
  {
    *(_QWORD *)(a1 + 80) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
  }
  return result;
}

uint64_t __MTActuatorRelease(uint64_t result)
{
  uint64_t v1;
  const void *v2;

  v1 = result;
  if (result)
  {
    MTActuatorClose(result);
    v2 = *(const void **)(v1 + 40);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(v1 + 40) = 0;
    }
    result = *(unsigned int *)(v1 + 16);
    if ((_DWORD)result)
    {
      result = IOObjectRelease(result);
      *(_DWORD *)(v1 + 16) = 0;
    }
  }
  *(_QWORD *)(v1 + 32) = 0;
  return result;
}

uint64_t alg_ComputeContactDensity(int a1, int a2, int a3, int a4)
{
  int v4;

  if (a2 <= a3)
    v4 = a3;
  else
    v4 = a2;
  return (__int16)(400 * a1 / (v4 - a4));
}

uint64_t alg_ComputeContactDensityFromRadii(int a1, int a2, int a3, int a4, int a5)
{
  int v8;
  int v9;
  int v10;

  if (a3 <= a4)
    v8 = a4;
  else
    v8 = a3;
  if (a2 <= a4)
    v9 = a4;
  else
    v9 = a2;
  v10 = (__int16)lsqrt(v8 * v9);
  if (v10 <= a4)
    v10 = a4;
  return (__int16)(400 * a1 / (v10 - a5));
}

uint64_t MTActuationGetTypeID()
{
  uint64_t result;

  result = __kMTActuationTypeID;
  if (!__kMTActuationTypeID)
  {
    pthread_once(&__actuationTypeInit, (void (*)(void))__MTActuationRegister);
    return __kMTActuationTypeID;
  }
  return result;
}

uint64_t __MTActuationRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kMTActuationTypeID = result;
  return result;
}

const __CFDictionary *MTActuationCreateFromDictionary(const __CFDictionary *a1, int a2)
{
  CFTypeID v4;
  const void *Value;
  CFTypeID v6;

  if (a1
    && (v4 = CFGetTypeID(a1), v4 == CFDictionaryGetTypeID())
    && (Value = CFDictionaryGetValue(a1, CFSTR("BaseWaveform"))) != 0
    && (v6 = CFGetTypeID(Value), v6 == CFDictionaryGetTypeID()))
  {
    return _MTActuationCreateFromParameterizedWaveform(a1, a2);
  }
  else
  {
    return 0;
  }
}

const __CFDictionary *_MTActuationCreateFromParameterizedWaveform(const __CFDictionary *result, int a2)
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFTypeID v5;
  __int128 v6;
  const __CFString *Value;
  const __CFString *v8;
  CFTypeID v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  CFTypeID v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  CFTypeID v15;
  float v16;
  float v17;
  const __CFArray *v18;
  const __CFArray *v19;
  CFTypeID v20;
  CFIndex v21;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v23;
  CFTypeID v24;
  const __CFString *v25;
  const __CFString *v26;
  CFTypeID v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  CFTypeID v30;
  const __CFNumber *v31;
  const __CFNumber *v32;
  CFTypeID v33;
  const __CFNumber *v34;
  const __CFNumber *v35;
  CFTypeID v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  CFTypeID v39;
  float v40;
  float v41;
  float v42;
  float v43;
  const __CFDictionary *v44;
  const __CFDictionary *v45;
  CFTypeID v46;
  const __CFNumber *v47;
  const __CFNumber *v48;
  CFTypeID v49;
  const __CFNumber *v50;
  const __CFNumber *v51;
  CFTypeID v52;
  const __CFNumber *v53;
  float v54;
  const __CFNumber *v55;
  CFTypeID v56;
  const __CFDictionary *v57;
  const __CFDictionary *v58;
  CFTypeID v59;
  const __CFNumber *v60;
  const __CFNumber *v61;
  CFTypeID v62;
  const __CFNumber *v63;
  const __CFNumber *v64;
  CFTypeID v65;
  const __CFNumber *v66;
  float v67;
  const __CFNumber *v68;
  CFTypeID v69;
  double v70;
  double v71;
  double v72;
  _OWORD v73[7];
  _OWORD v74[2];
  double v75;
  double valuePtr;
  _OWORD v77[7];
  _OWORD v78[2];
  _OWORD buffer[4];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v75 = 0.0;
  valuePtr = 0.0;
  if (result)
  {
    v3 = result;
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("BaseWaveform"));
    if (result)
    {
      v4 = result;
      v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID())
      {
        *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
        buffer[2] = v6;
        buffer[3] = v6;
        buffer[0] = v6;
        buffer[1] = v6;
        Value = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("Type"));
        v8 = Value;
        if (Value)
        {
          v9 = CFGetTypeID(Value);
          if (v9 == CFStringGetTypeID() && CFStringGetCString(v8, (char *)buffer, 64, 0x600u))
            LODWORD(v8) = MTActuationBaseWaveformGetTypeForKey((const char *)buffer);
          else
            LODWORD(v8) = 0;
        }
        v10 = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("DurationMS"));
        if (v10)
        {
          v11 = v10;
          v12 = CFGetTypeID(v10);
          if (v12 == CFNumberGetTypeID())
            CFNumberGetValue(v11, kCFNumberDoubleType, &valuePtr);
        }
        v13 = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("Amplitude"));
        if (v13)
        {
          v14 = v13;
          v15 = CFGetTypeID(v13);
          if (v15 == CFNumberGetTypeID())
            CFNumberGetValue(v14, kCFNumberDoubleType, &v75);
        }
        v16 = v75;
        v17 = valuePtr;
        MTActuationWaveformCreateWithBase((int)v8, (uint64_t)v73, v16, v17);
        v77[5] = v73[5];
        v77[6] = v73[6];
        v78[0] = v74[0];
        *(_OWORD *)((char *)v78 + 12) = *(_OWORD *)((char *)v74 + 12);
        v77[2] = v73[2];
        v77[3] = v73[3];
        v77[4] = v73[4];
        v77[0] = v73[0];
        v77[1] = v73[1];
        v18 = (const __CFArray *)CFDictionaryGetValue(v3, CFSTR("Tones"));
        if (v18)
        {
          v19 = v18;
          v20 = CFGetTypeID(v18);
          if (v20 == CFArrayGetTypeID() && CFArrayGetCount(v19) >= 1)
          {
            v21 = 0;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, v21);
              if (ValueAtIndex)
              {
                v23 = ValueAtIndex;
                v24 = CFGetTypeID(ValueAtIndex);
                if (v24 == CFDictionaryGetTypeID())
                {
                  v72 = 0.0;
                  *(_QWORD *)&v73[0] = 0;
                  v70 = 0.0;
                  v71 = 0.0;
                  v25 = (const __CFString *)CFDictionaryGetValue(v23, CFSTR("Type"));
                  v26 = v25;
                  if (v25)
                  {
                    v27 = CFGetTypeID(v25);
                    if (v27 == CFStringGetTypeID() && CFStringGetCString(v26, (char *)buffer, 64, 0x600u))
                      LODWORD(v26) = MTActuationToneWaveformGetTypeForKey((const char *)buffer);
                    else
                      LODWORD(v26) = 0;
                  }
                  v28 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("DelayMS"));
                  if (v28)
                  {
                    v29 = v28;
                    v30 = CFGetTypeID(v28);
                    if (v30 == CFNumberGetTypeID())
                      CFNumberGetValue(v29, kCFNumberDoubleType, v73);
                  }
                  v31 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("DurationMS"));
                  if (v31)
                  {
                    v32 = v31;
                    v33 = CFGetTypeID(v31);
                    if (v33 == CFNumberGetTypeID())
                      CFNumberGetValue(v32, kCFNumberDoubleType, &v72);
                  }
                  v34 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("Amplitude"));
                  if (v34)
                  {
                    v35 = v34;
                    v36 = CFGetTypeID(v34);
                    if (v36 == CFNumberGetTypeID())
                      CFNumberGetValue(v35, kCFNumberDoubleType, &v71);
                  }
                  v37 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("FrequencykHz"));
                  if (v37)
                  {
                    v38 = v37;
                    v39 = CFGetTypeID(v37);
                    if (v39 == CFNumberGetTypeID())
                      CFNumberGetValue(v38, kCFNumberDoubleType, &v70);
                  }
                  v40 = *(double *)v73;
                  v41 = v72;
                  v42 = v71;
                  v43 = v70;
                  MTActuationAppendToWaveform((uint64_t)v77, (int)v26, v40, v41, v42, v43);
                }
              }
              ++v21;
            }
            while (CFArrayGetCount(v19) > v21);
          }
        }
        v44 = (const __CFDictionary *)CFDictionaryGetValue(v3, CFSTR("BaseMultipliers"));
        if (v44)
        {
          v45 = v44;
          v46 = CFGetTypeID(v44);
          if (v46 == CFDictionaryGetTypeID())
          {
            LODWORD(v73[0]) = 1065353216;
            LODWORD(v72) = 1065353216;
            LODWORD(v71) = 1065353216;
            v47 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("Light"));
            if (v47)
            {
              v48 = v47;
              v49 = CFGetTypeID(v47);
              if (v49 == CFNumberGetTypeID())
                CFNumberGetValue(v48, kCFNumberFloatType, v73);
            }
            v50 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("Medium"));
            if (v50)
            {
              v51 = v50;
              v52 = CFGetTypeID(v50);
              if (v52 == CFNumberGetTypeID())
                CFNumberGetValue(v51, kCFNumberFloatType, &v72);
            }
            v53 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("Firm"));
            v54 = 1.0;
            if (v53)
            {
              v55 = v53;
              v56 = CFGetTypeID(v53);
              if (v56 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v55, kCFNumberFloatType, &v71);
                v54 = *(float *)&v71;
              }
            }
            MTActuationSetBaseMultipliers((float *)v77, *(float *)v73, *(float *)&v72, v54);
          }
        }
        v57 = (const __CFDictionary *)CFDictionaryGetValue(v3, CFSTR("ToneMultipliers"));
        if (v57)
        {
          v58 = v57;
          v59 = CFGetTypeID(v57);
          if (v59 == CFDictionaryGetTypeID())
          {
            LODWORD(v73[0]) = 1065353216;
            LODWORD(v72) = 1065353216;
            LODWORD(v71) = 1065353216;
            v60 = (const __CFNumber *)CFDictionaryGetValue(v58, CFSTR("Light"));
            if (v60)
            {
              v61 = v60;
              v62 = CFGetTypeID(v60);
              if (v62 == CFNumberGetTypeID())
                CFNumberGetValue(v61, kCFNumberFloatType, v73);
            }
            v63 = (const __CFNumber *)CFDictionaryGetValue(v58, CFSTR("Medium"));
            if (v63)
            {
              v64 = v63;
              v65 = CFGetTypeID(v63);
              if (v65 == CFNumberGetTypeID())
                CFNumberGetValue(v64, kCFNumberFloatType, &v72);
            }
            v66 = (const __CFNumber *)CFDictionaryGetValue(v58, CFSTR("Firm"));
            v67 = 1.0;
            if (v66)
            {
              v68 = v66;
              v69 = CFGetTypeID(v66);
              if (v69 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v68, kCFNumberFloatType, &v71);
                v67 = *(float *)&v71;
              }
            }
            MTActuationSetToneMultipliers((float *)v77, *(float *)v73, *(float *)&v72, v67);
          }
        }
        return (const __CFDictionary *)_MTActuationCreateFromWaveform(v77, a2);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t _MTActuationCreateFromWaveform(_OWORD *a1, int a2)
{
  uint64_t Instance;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (!__kMTActuationTypeID)
    pthread_once(&__actuationTypeInit, (void (*)(void))__MTActuationRegister);
  Instance = _CFRuntimeCreateInstance();
  v5 = 0;
  if (a1 && Instance)
  {
    *(_OWORD *)(Instance + 24) = *a1;
    v6 = a1[1];
    v7 = a1[2];
    v8 = a1[3];
    *(_OWORD *)(Instance + 88) = a1[4];
    *(_OWORD *)(Instance + 72) = v8;
    *(_OWORD *)(Instance + 56) = v7;
    *(_OWORD *)(Instance + 40) = v6;
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    *(_OWORD *)(Instance + 148) = *(_OWORD *)((char *)a1 + 124);
    *(_OWORD *)(Instance + 136) = v11;
    *(_OWORD *)(Instance + 120) = v10;
    *(_OWORD *)(Instance + 104) = v9;
    *(_DWORD *)(Instance + 16) = 2;
    *(_DWORD *)(Instance + 20) = a2;
    return Instance;
  }
  return v5;
}

uint64_t MTActuationCalculateWaveform(uint64_t result, float *a2, _BYTE *a3, float a4, float a5, uint64_t a6, char a7)
{
  float v8;
  float v9;
  float v10;
  _OWORD *v11;
  int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[7];
  _OWORD v24[2];

  if (!result)
    return result;
  if ((a7 & 1) != 0)
  {
    v9 = *(float *)(result + 36);
    v10 = *(float *)(result + 48);
  }
  else if ((a7 & 2) != 0)
  {
    v9 = *(float *)(result + 40);
    v10 = *(float *)(result + 52);
  }
  else
  {
    if ((a7 & 4) == 0)
    {
      v8 = a4;
      goto LABEL_10;
    }
    v9 = *(float *)(result + 44);
    v10 = *(float *)(result + 56);
  }
  v8 = v10 * a4;
  a4 = v9 * a4;
LABEL_10:
  v12 = *(_DWORD *)(result + 24);
  v11 = (_OWORD *)(result + 24);
  if (!v12)
    return 0;
  if (v8 > 2.0)
    v8 = 2.0;
  if (v8 >= 0.0)
    v13 = v8;
  else
    v13 = 0.0;
  v14 = a2[18];
  v15 = a2[19];
  v16 = a2[20];
  v17 = a2[21];
  if (a4 > 2.0)
    a4 = 2.0;
  if (a4 >= 0.0)
    v18 = a4;
  else
    v18 = 0.0;
  v19 = v11[7];
  v23[6] = v11[6];
  v24[0] = v19;
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)((char *)v11 + 124);
  v20 = v11[3];
  v23[2] = v11[2];
  v23[3] = v20;
  v21 = v11[5];
  v23[4] = v11[4];
  v23[5] = v21;
  v22 = v11[1];
  v23[0] = *v11;
  v23[1] = v22;
  return MTActuationFillParametricBufferWithWaveform((uint64_t)v23, a3, 0.041667, v18, v13, a5, v14, v15, v16, v17);
}

uint64_t MTActuationSetFirmwareDownClick(uint64_t a1, float *a2)
{
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  char v6;
  float v7;
  float v8;
  signed int v9;
  _OWORD v11[2];
  _BYTE v12[28];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097090;
  if (a1 && a2)
  {
    v4 = MEMORY[0x24BDAC7A8]();
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v12[12] = v5;
    v11[1] = v5;
    *(_OWORD *)v12 = v5;
    v11[0] = v5;
    v9 = MTActuationCalculateWaveform(v4, a2, v11, v7, v8, 60, v6);
    if (v9 < 1)
      return 3758097084;
    else
      return MTActuatorSetReport((uint64_t)a2, 34, (uint64_t)v11, v9);
  }
  return v2;
}

uint64_t MTActuationSetFirmwareUpClick(uint64_t a1, float *a2)
{
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  char v6;
  float v7;
  float v8;
  signed int v9;
  _OWORD v11[2];
  _BYTE v12[28];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097090;
  if (a1 && a2)
  {
    v4 = MEMORY[0x24BDAC7A8]();
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v12[12] = v5;
    v11[1] = v5;
    *(_OWORD *)v12 = v5;
    v11[0] = v5;
    v9 = MTActuationCalculateWaveform(v4, a2, v11, v7, v8, 60, v6);
    if (v9 < 1)
      return 3758097084;
    else
      return MTActuatorSetReport((uint64_t)a2, 35, (uint64_t)v11, v9);
  }
  return v2;
}

uint64_t MTActuationActuate(uint64_t a1, float *a2)
{
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  char v6;
  float v7;
  float v8;
  signed int v9;
  _OWORD v11[2];
  _BYTE v12[28];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097090;
  if (a1 && a2)
  {
    v4 = MEMORY[0x24BDAC7A8]();
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v12[12] = v5;
    v11[1] = v5;
    *(_OWORD *)v12 = v5;
    v11[0] = v5;
    v9 = MTActuationCalculateWaveform(v4, a2, v11, v7, v8, 60, v6);
    if (v9 < 1)
      return 3758097084;
    else
      return MTActuatorSetWaveform((uint64_t)a2, 83, (uint64_t)v11, v9);
  }
  return v2;
}

double __MTActuationInit(uint64_t a1)
{
  double result;

  if (a1)
  {
    *(_QWORD *)(a1 + 160) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t touchpadCodecDecodeImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  unint64_t v45;
  int v46;
  unsigned int v47;
  int v48;
  unint64_t v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  _BYTE *v54;
  char v55;
  unsigned __int8 v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v63;
  int v64;
  char v65;
  int v66;
  __int16 v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v75;
  unsigned __int8 v76;
  uint64_t v78;
  uint64_t v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  char v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;

  v85 = 0;
  v86 = 0;
  v6 = *(unsigned int *)(a1 + 664);
  v78 = *(unsigned int *)(a1 + 668);
  v90 = 0;
  v91 = 0;
  v87 = a4;
  v88 = a5;
  v89 = 0;
  if (!codecReadHeader(&v87, (uint64_t)&v85))
    return 0;
  v76 = v85;
  if ((v85 & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 664) != __PAIR64__(HIWORD(v85), WORD2(v85)) || v86 != *(_BYTE *)(a1 + 672))
      return 0;
    codecResetModel(a1);
  }
  if ((_DWORD)v78)
  {
    v7 = 0;
    v8 = 0;
    v9 = v89;
    v10 = v90;
    v75 = *(_QWORD *)(a1 + 632);
    v11 = v91;
    v12 = HIDWORD(v91);
    while (1)
    {
      v13 = (v76 & (v8 != 0)) != 0 ? -(uint64_t)v6 : 0;
      v80 = v7;
      v79 = v8;
      if ((_DWORD)v6)
        break;
LABEL_100:
      v8 = v79 + 1;
      a2 += a3;
      v7 = v80 + v6;
      if (v79 + 1 == v78)
        goto LABEL_103;
    }
    v14 = 0;
    v16 = v88;
    v82 = v87;
    v83 = v75 + 2 * v7;
    v81 = v83 + 2 * v13;
    v17 = *(__int16 *)(v75 + 2 * (v6 * v8) + 2 * v13);
    v15 = v17;
    v18 = v17;
    v19 = v10;
    v20 = v17;
    while (1)
    {
      v21 = v14 + 1;
      if (v14 + 1 < v6)
        v20 = *(__int16 *)(v81 + 2 * v14 + 2);
      v22 = v15 - v17;
      if (v15 - v17 <= -2)
        v23 = -2;
      else
        v23 = 0;
      if (v22 > 1)
        v23 = 2;
      if (v22 < -40)
        v23 = -1;
      if (v22 <= 40)
        v24 = v23;
      else
        v24 = 1;
      v25 = 25 * v24;
      v26 = v17 - v18;
      if (v17 - v18 <= -2)
        v27 = -2;
      else
        v27 = 0;
      if (v26 > 1)
        v27 = 2;
      if (v26 < -40)
        v27 = -1;
      if (v26 <= 40)
        v28 = v27;
      else
        v28 = 1;
      v29 = 5 * v28 + v25;
      v30 = v18 - v20;
      if (v18 - v20 <= -2)
        v31 = -2;
      else
        v31 = 0;
      if (v30 > 1)
        v31 = 2;
      if (v30 < -40)
        v31 = -1;
      if (v30 <= 40)
        v32 = v31;
      else
        v32 = 1;
      v33 = v29 + v32;
      v34 = v18 - v17 + v15;
      if (v34 <= v15)
        v35 = v15;
      else
        v35 = v34;
      if (v34 < v15)
        v15 = v34;
      if (v35 >= v18)
        v36 = v18;
      else
        v36 = v35;
      if (v15 <= v36)
        v37 = v36;
      else
        v37 = v15;
      if (v33 >= 0)
        v38 = v33;
      else
        v38 = -v33;
      if (v12 <= 15)
      {
        v39 = v9 + 1;
        v89 = v9 + 1;
        if (v9 < v16)
        {
          v10 = v19 + 1;
          v90 = v19 + 1;
          v11 |= *(unsigned __int8 *)(v82 + v19) << v12;
          v12 += 8;
          v91 = __PAIR64__(v12, v11);
          ++v19;
        }
        v9 += 2;
        v89 = v9;
        if (v39 < v16)
        {
          v10 = v19 + 1;
          v90 = v19 + 1;
          v11 |= *(unsigned __int8 *)(v82 + v19) << v12;
          v12 += 8;
          ++v19;
        }
      }
      v40 = a1 + 10 * v38;
      v41 = *(unsigned __int8 *)(v40 + 8);
      v42 = __clz(__rbit32((unsigned __int16)v11 | 0x10000));
      if (v42 > 0xF)
      {
        v47 = HIWORD(v11);
        v48 = v12 - 16;
        LODWORD(v91) = HIWORD(v11);
        HIDWORD(v91) = v12 - 16;
        if (v12 <= 31)
        {
          v49 = v9 + 1;
          v89 = v9 + 1;
          if (v9 < v16)
          {
            v10 = v19 + 1;
            v90 = v19 + 1;
            v47 |= *(unsigned __int8 *)(v82 + v19) << v48;
            v48 = v12 - 8;
            LODWORD(v91) = v47;
            HIDWORD(v91) = v12 - 8;
            ++v19;
          }
          v9 += 2;
          v89 = v9;
          if (v49 < v16)
          {
            v10 = v19 + 1;
            v90 = v19 + 1;
            v47 |= *(unsigned __int8 *)(v82 + v19) << v48;
            v48 += 8;
            ++v19;
          }
        }
        v11 = HIWORD(v47);
        v12 = v48 - 16;
        LODWORD(v91) = HIWORD(v47);
        HIDWORD(v91) = v48 - 16;
      }
      else
      {
        v43 = v11 >> (v42 + 1);
        v44 = v12 - (v42 + 1);
        v91 = __PAIR64__(v44, v43);
        if (v44 <= 15)
        {
          v45 = v9 + 1;
          v89 = v9 + 1;
          if (v9 < v16)
          {
            v10 = v19 + 1;
            v90 = v19 + 1;
            v43 |= *(unsigned __int8 *)(v82 + v19) << v44;
            v44 += 8;
            v91 = __PAIR64__(v44, v43);
            ++v19;
          }
          v9 += 2;
          v89 = v9;
          if (v45 < v16)
          {
            v10 = v19 + 1;
            v90 = v19 + 1;
            v43 |= *(unsigned __int8 *)(v82 + v19) << v44;
            v44 += 8;
            ++v19;
          }
        }
        v46 = v43 & ((-1 << v41) ^ 0xFFFF);
        v11 = v43 >> v41;
        v12 = v44 - v41;
        v91 = __PAIR64__(v12, v11);
        v47 = v46 + (v42 << v41);
      }
      v50 = *(_DWORD *)(v40 + 4);
      v51 = ((unsigned __int16)v47 >> 1) ^ -(v47 & 1);
      v52 = *(_DWORD *)v40;
      v53 = a1 + 10 * v38;
      v55 = *(_BYTE *)(v53 + 9);
      v54 = (_BYTE *)(v53 + 9);
      v56 = v55 + 1;
      *v54 = v55 + 1;
      if (v51 >= 0)
        v57 = v51;
      else
        v57 = -v51;
      if (v51 <= 0)
      {
        if ((v51 & 0x80000000) == 0)
          goto LABEL_84;
        v58 = -1;
      }
      else
      {
        v58 = 1;
      }
      *(_DWORD *)(v40 + 4) = v50 + v58;
LABEL_84:
      v59 = v57 + v52;
      v60 = v56;
      v61 = v56 << v41;
      v63 = v61 >= 2 * v59 && v41 != 0;
      v64 = v63 << 31 >> 31;
      if (v61 >= v59)
        v65 = v64;
      else
        v65 = 1;
      *(_DWORD *)v40 = v59;
      *(_BYTE *)(v40 + 8) = v41 + v65;
      if (v60 == 64)
      {
        *v54 = 32;
        *(_DWORD *)v40 = v59 - (v59 >> 1);
      }
      v66 = (__int16)(v51 + ((v50 + 8) >> 4));
      if (v33 < 0)
        v66 = -v66;
      v67 = v66 + v37;
      v15 = (__int16)(v66 + v37);
      *(_WORD *)(a2 + 2 * v14) = v67;
      *(_WORD *)(v83 + 2 * v14++) = v67;
      v17 = v18;
      v18 = v20;
      if (v6 == v21)
        goto LABEL_100;
    }
  }
  v12 = HIDWORD(v91);
LABEL_103:
  if (v12 <= 15)
  {
    v68 = v89;
    v69 = ++v89;
    if (v68 < v88)
    {
      v70 = v90++;
      v71 = *(unsigned __int8 *)(v87 + v70) << v12;
      v12 += 8;
      LODWORD(v91) = v71 | v91;
      HIDWORD(v91) = v12;
    }
    v89 = v68 + 2;
    if (v69 < v88)
    {
      v72 = v90++;
      LODWORD(v91) = v91 | (*(unsigned __int8 *)(v87 + v72) << v12);
      v12 += 8;
    }
  }
  v73 = v91 & 0xFFF;
  LODWORD(v91) = v91 >> 12;
  HIDWORD(v91) = v12 - 12;
  if (v73 == codecGetFooterID(a1) && (v91 & 0x8000000000000000) == 0)
    return v90 - ((unint64_t)HIDWORD(v91) >> 3);
  return 0;
}

uint64_t touchpadGetInfoWithCompressedBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6[5];

  result = 0;
  v6[0] = a3;
  v6[1] = a4;
  memset(&v6[2], 0, 24);
  if (a2 == 9)
  {
    if (codecReadHeader(v6, a1))
      return 9;
    else
      return 0;
  }
  return result;
}

BOOL codecReadHeader(uint64_t *a1, uint64_t a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  int v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int16 v55;
  __int16 v56;
  unsigned int v57;
  int v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int16 v65;
  unsigned int v66;
  int v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  unsigned int v75;

  *(_BYTE *)(a2 + 8) = 0;
  *(_QWORD *)a2 = 0;
  v2 = *((_DWORD *)a1 + 9);
  if (v2 <= 15)
  {
    v4 = a1[1];
    v3 = a1[2];
    a1[2] = v3 + 1;
    if (v3 < v4)
    {
      v5 = *a1;
      v6 = a1[3];
      a1[3] = v6 + 1;
      LODWORD(v5) = (*(unsigned __int8 *)(v5 + v6) << v2) | *((_DWORD *)a1 + 8);
      v2 += 8;
      *((_DWORD *)a1 + 8) = v5;
      *((_DWORD *)a1 + 9) = v2;
    }
    a1[2] = v3 + 2;
    if (v3 + 1 < v4)
    {
      v7 = *a1;
      v8 = a1[3];
      a1[3] = v8 + 1;
      *((_DWORD *)a1 + 8) |= *(unsigned __int8 *)(v7 + v8) << v2;
      v2 += 8;
    }
  }
  v9 = a1[4] & 0x1F;
  v10 = *((_DWORD *)a1 + 8) >> 5;
  v11 = v2 - 5;
  *((_DWORD *)a1 + 8) = v10;
  *((_DWORD *)a1 + 9) = v2 - 5;
  v12 = v9 - 16;
  if (v9 > 0x10)
  {
    if (v2 <= 20)
    {
      v24 = a1[1];
      v23 = a1[2];
      a1[2] = v23 + 1;
      if (v23 < v24)
      {
        v25 = *a1;
        v26 = a1[3];
        a1[3] = v26 + 1;
        v10 |= *(unsigned __int8 *)(v25 + v26) << v11;
        v11 = v2 + 3;
        *((_DWORD *)a1 + 8) = v10;
        *((_DWORD *)a1 + 9) = v2 + 3;
      }
      a1[2] = v23 + 2;
      if (v23 + 1 < v24)
      {
        v27 = *a1;
        v28 = a1[3];
        a1[3] = v28 + 1;
        v10 |= *(unsigned __int8 *)(v27 + v28) << v11;
        v11 += 8;
      }
    }
    v29 = HIWORD(v10);
    v30 = v11 - 16;
    *((_DWORD *)a1 + 8) = HIWORD(v10);
    *((_DWORD *)a1 + 9) = v11 - 16;
    if (v11 <= 31)
    {
      v32 = a1[1];
      v31 = a1[2];
      a1[2] = v31 + 1;
      if (v31 < v32)
      {
        v33 = *a1;
        v34 = a1[3];
        a1[3] = v34 + 1;
        v29 |= *(unsigned __int8 *)(v33 + v34) << v30;
        v30 = v11 - 8;
        *((_DWORD *)a1 + 8) = v29;
        *((_DWORD *)a1 + 9) = v11 - 8;
      }
      a1[2] = v31 + 2;
      if (v31 + 1 < v32)
      {
        v35 = *a1;
        v36 = a1[3];
        a1[3] = v36 + 1;
        v29 |= *(unsigned __int8 *)(v35 + v36) << v30;
        v30 += 8;
      }
    }
    v37 = v29 & ~(-1 << v12);
    v20 = v29 >> v12;
    v21 = v30 - v12;
    *((_DWORD *)a1 + 8) = v20;
    *((_DWORD *)a1 + 9) = v30 - v12;
    v22 = (unsigned __int16)v10 | (v37 << 16);
    v19 = -1 << v9;
  }
  else
  {
    if (v2 <= 20)
    {
      v14 = a1[1];
      v13 = a1[2];
      a1[2] = v13 + 1;
      if (v13 < v14)
      {
        v15 = *a1;
        v16 = a1[3];
        a1[3] = v16 + 1;
        v10 |= *(unsigned __int8 *)(v15 + v16) << v11;
        v11 = v2 + 3;
        *((_DWORD *)a1 + 8) = v10;
        *((_DWORD *)a1 + 9) = v2 + 3;
      }
      a1[2] = v13 + 2;
      if (v13 + 1 < v14)
      {
        v17 = *a1;
        v18 = a1[3];
        a1[3] = v18 + 1;
        v10 |= *(unsigned __int8 *)(v17 + v18) << v11;
        v11 += 8;
      }
    }
    v19 = -1 << v9;
    v20 = v10 >> v9;
    v21 = v11 - v9;
    *((_DWORD *)a1 + 8) = v10 >> v9;
    *((_DWORD *)a1 + 9) = v21;
    v22 = v10 & (unsigned __int16)~(unsigned __int16)(-1 << v9);
  }
  v38 = v22 + ~v19;
  *(_DWORD *)a2 = v38;
  if ((v38 & 1) != 0)
  {
    if (v21 <= 15)
    {
      v40 = a1[1];
      v39 = a1[2];
      a1[2] = v39 + 1;
      if (v39 < v40)
      {
        v41 = *a1;
        v42 = a1[3];
        a1[3] = v42 + 1;
        v20 |= *(unsigned __int8 *)(v41 + v42) << v21;
        v21 += 8;
        *((_DWORD *)a1 + 8) = v20;
        *((_DWORD *)a1 + 9) = v21;
      }
      a1[2] = v39 + 2;
      if (v39 + 1 < v40)
      {
        v43 = *a1;
        v44 = a1[3];
        a1[3] = v44 + 1;
        v20 |= *(unsigned __int8 *)(v43 + v44) << v21;
        v21 += 8;
      }
    }
    v45 = v20 & 0xF;
    v46 = v20 >> 4;
    v47 = v21 - 4;
    *((_DWORD *)a1 + 8) = v46;
    *((_DWORD *)a1 + 9) = v21 - 4;
    v48 = v45 + 1;
    if (v21 <= 19)
    {
      v50 = a1[1];
      v49 = a1[2];
      a1[2] = v49 + 1;
      if (v49 < v50)
      {
        v51 = *a1;
        v52 = a1[3];
        a1[3] = v52 + 1;
        v46 |= *(unsigned __int8 *)(v51 + v52) << v47;
        v47 = v21 + 4;
        *((_DWORD *)a1 + 8) = v46;
        *((_DWORD *)a1 + 9) = v21 + 4;
      }
      a1[2] = v49 + 2;
      if (v49 + 1 < v50)
      {
        v53 = *a1;
        v54 = a1[3];
        a1[3] = v54 + 1;
        v46 |= *(unsigned __int8 *)(v53 + v54) << v47;
        v47 += 8;
      }
    }
    v55 = ~(unsigned __int16)(-2 << v45);
    v56 = v46 & v55;
    v57 = v46 >> v48;
    v58 = v47 - v48;
    *((_DWORD *)a1 + 8) = v57;
    *((_DWORD *)a1 + 9) = v47 - v48;
    *(_WORD *)(a2 + 4) = v56;
    if (v47 - v48 <= 15)
    {
      v60 = a1[1];
      v59 = a1[2];
      a1[2] = v59 + 1;
      if (v59 < v60)
      {
        v61 = *a1;
        v62 = a1[3];
        a1[3] = v62 + 1;
        v57 |= *(unsigned __int8 *)(v61 + v62) << v58;
        v58 += 8;
        *((_DWORD *)a1 + 8) = v57;
        *((_DWORD *)a1 + 9) = v58;
      }
      a1[2] = v59 + 2;
      if (v59 + 1 < v60)
      {
        v63 = *a1;
        v64 = a1[3];
        a1[3] = v64 + 1;
        v57 |= *(unsigned __int8 *)(v63 + v64) << v58;
        v58 += 8;
      }
    }
    v65 = v57 & v55;
    v66 = v57 >> v48;
    v67 = v58 - v48;
    *((_DWORD *)a1 + 8) = v66;
    *((_DWORD *)a1 + 9) = v67;
    *(_WORD *)(a2 + 6) = v65;
    if (v67 <= 15)
    {
      v69 = a1[1];
      v68 = a1[2];
      a1[2] = v68 + 1;
      if (v68 < v69)
      {
        v70 = *a1;
        v71 = a1[3];
        a1[3] = v71 + 1;
        v66 |= *(unsigned __int8 *)(v70 + v71) << v67;
        v67 += 8;
        *((_DWORD *)a1 + 8) = v66;
        *((_DWORD *)a1 + 9) = v67;
      }
      a1[2] = v68 + 2;
      if (v68 + 1 < v69)
      {
        v72 = *a1;
        v73 = a1[3];
        a1[3] = v73 + 1;
        v66 |= *(unsigned __int8 *)(v72 + v73) << v67;
        v67 += 8;
      }
    }
    v74 = v66 & 0x1F;
    v75 = v66 >> 5;
    v21 = v67 - 5;
    *((_DWORD *)a1 + 8) = v75;
    *((_DWORD *)a1 + 9) = v67 - 5;
    *(_BYTE *)(a2 + 8) = v74 + 1;
  }
  return (v21 & 0x80000000) == 0 && a1[3] != v21 >> 3;
}

uint64_t *codecWriteHeader(uint64_t *result, int a2, int a3, __int16 a4, int a5)
{
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  int v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  int v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;

  v5 = __clz(a5 + 1);
  v6 = 31 - v5;
  v7 = *((_DWORD *)result + 9);
  v8 = *((_DWORD *)result + 8) | ((unsigned __int16)(31 - v5) << v7);
  v9 = v7 + 5;
  *((_DWORD *)result + 8) = v8;
  *((_DWORD *)result + 9) = v7 + 5;
  if (v7 >= 12)
  {
    v10 = result[1];
    v11 = result[2];
    v12 = v11 + 1;
    result[2] = v11 + 1;
    if (v11 < v10)
    {
      v13 = *result;
      v14 = result[3];
      result[3] = v14 + 1;
      *(_BYTE *)(v13 + v14) = v8;
      v8 = *((_DWORD *)result + 8);
      v9 = *((_DWORD *)result + 9);
      v10 = result[1];
      v12 = result[2];
    }
    v15 = v8 >> 8;
    v16 = v9 - 8;
    *((_DWORD *)result + 8) = v15;
    *((_DWORD *)result + 9) = v16;
    result[2] = v12 + 1;
    if (v12 < v10)
    {
      v17 = *result;
      v18 = result[3];
      result[3] = v18 + 1;
      *(_BYTE *)(v17 + v18) = v15;
      v15 = *((_DWORD *)result + 8);
      v16 = *((_DWORD *)result + 9);
    }
    v8 = v15 >> 8;
    v9 = v16 - 8;
  }
  v19 = v8 | ((unsigned __int16)(a5 + 1 - (0x80000000 >> v5)) << v9);
  v20 = v9 + v6;
  *((_DWORD *)result + 8) = v19;
  *((_DWORD *)result + 9) = v9 + v6;
  if ((int)(v9 + v6) >= 17)
  {
    v21 = result[1];
    v22 = result[2];
    v23 = v22 + 1;
    result[2] = v22 + 1;
    if (v22 < v21)
    {
      v24 = *result;
      v25 = result[3];
      result[3] = v25 + 1;
      *(_BYTE *)(v24 + v25) = v19;
      v19 = *((_DWORD *)result + 8);
      v20 = *((_DWORD *)result + 9);
      v21 = result[1];
      v23 = result[2];
    }
    v26 = v19 >> 8;
    v27 = v20 - 8;
    *((_DWORD *)result + 8) = v26;
    *((_DWORD *)result + 9) = v27;
    result[2] = v23 + 1;
    if (v23 < v21)
    {
      v28 = *result;
      v29 = result[3];
      result[3] = v29 + 1;
      *(_BYTE *)(v28 + v29) = v26;
      v26 = *((_DWORD *)result + 8);
      v27 = *((_DWORD *)result + 9);
    }
    v19 = v26 >> 8;
    v20 = v27 - 8;
    *((_DWORD *)result + 8) = v19;
    *((_DWORD *)result + 9) = v20;
  }
  if ((a5 & 1) != 0)
  {
    v30 = __clz(a3 | a2);
    v31 = v19 | ((unsigned __int16)(31 - v30) << v20);
    v32 = v20 + 4;
    *((_DWORD *)result + 8) = v31;
    *((_DWORD *)result + 9) = v20 + 4;
    if (v20 >= 13)
    {
      v33 = result[1];
      v34 = result[2];
      v35 = v34 + 1;
      result[2] = v34 + 1;
      if (v34 < v33)
      {
        v36 = *result;
        v37 = result[3];
        result[3] = v37 + 1;
        *(_BYTE *)(v36 + v37) = v31;
        v31 = *((_DWORD *)result + 8);
        v32 = *((_DWORD *)result + 9);
        v33 = result[1];
        v35 = result[2];
      }
      v38 = v31 >> 8;
      v39 = v32 - 8;
      *((_DWORD *)result + 8) = v38;
      *((_DWORD *)result + 9) = v39;
      result[2] = v35 + 1;
      if (v35 < v33)
      {
        v40 = *result;
        v41 = result[3];
        result[3] = v41 + 1;
        *(_BYTE *)(v40 + v41) = v38;
        v38 = *((_DWORD *)result + 8);
        v39 = *((_DWORD *)result + 9);
      }
      v31 = v38 >> 8;
      v32 = v39 - 8;
    }
    v42 = 32 - v30;
    v43 = v31 | ((unsigned __int16)a2 << v32);
    v44 = v32 + v42;
    *((_DWORD *)result + 8) = v43;
    *((_DWORD *)result + 9) = v32 + v42;
    if ((int)(v32 + v42) >= 17)
    {
      v45 = result[1];
      v46 = result[2];
      v47 = v46 + 1;
      result[2] = v46 + 1;
      if (v46 < v45)
      {
        v48 = *result;
        v49 = result[3];
        result[3] = v49 + 1;
        *(_BYTE *)(v48 + v49) = v43;
        v43 = *((_DWORD *)result + 8);
        v44 = *((_DWORD *)result + 9);
        v45 = result[1];
        v47 = result[2];
      }
      v50 = v43 >> 8;
      v51 = v44 - 8;
      *((_DWORD *)result + 8) = v50;
      *((_DWORD *)result + 9) = v51;
      result[2] = v47 + 1;
      if (v47 < v45)
      {
        v52 = *result;
        v53 = result[3];
        result[3] = v53 + 1;
        *(_BYTE *)(v52 + v53) = v50;
        v50 = *((_DWORD *)result + 8);
        v51 = *((_DWORD *)result + 9);
      }
      v43 = v50 >> 8;
      v44 = v51 - 8;
    }
    v54 = v43 | ((unsigned __int16)a3 << v44);
    v55 = v44 + v42;
    *((_DWORD *)result + 8) = v54;
    *((_DWORD *)result + 9) = v55;
    if (v55 >= 17)
    {
      v56 = result[1];
      v57 = result[2];
      v58 = v57 + 1;
      result[2] = v57 + 1;
      if (v57 < v56)
      {
        v59 = *result;
        v60 = result[3];
        result[3] = v60 + 1;
        *(_BYTE *)(v59 + v60) = v54;
        v54 = *((_DWORD *)result + 8);
        v55 = *((_DWORD *)result + 9);
        v56 = result[1];
        v58 = result[2];
      }
      v61 = v54 >> 8;
      v62 = v55 - 8;
      *((_DWORD *)result + 8) = v61;
      *((_DWORD *)result + 9) = v62;
      result[2] = v58 + 1;
      if (v58 < v56)
      {
        v63 = *result;
        v64 = result[3];
        result[3] = v64 + 1;
        *(_BYTE *)(v63 + v64) = v61;
        v61 = *((_DWORD *)result + 8);
        v62 = *((_DWORD *)result + 9);
      }
      v54 = v61 >> 8;
      v55 = v62 - 8;
    }
    v65 = v54 | ((unsigned __int16)(a4 - 1) << v55);
    v66 = v55 + 5;
    *((_DWORD *)result + 8) = v65;
    *((_DWORD *)result + 9) = v55 + 5;
    if (v55 >= 12)
    {
      v67 = result[1];
      v68 = result[2];
      v69 = v68 + 1;
      result[2] = v68 + 1;
      if (v68 < v67)
      {
        v70 = *result;
        v71 = result[3];
        result[3] = v71 + 1;
        *(_BYTE *)(v70 + v71) = v65;
        v65 = *((_DWORD *)result + 8);
        v66 = *((_DWORD *)result + 9);
        v67 = result[1];
        v69 = result[2];
      }
      v72 = v65 >> 8;
      v73 = v66 - 8;
      *((_DWORD *)result + 8) = v72;
      *((_DWORD *)result + 9) = v73;
      result[2] = v69 + 1;
      if (v69 < v67)
      {
        v74 = *result;
        v75 = result[3];
        result[3] = v75 + 1;
        *(_BYTE *)(v74 + v75) = v72;
        v72 = *((_DWORD *)result + 8);
        v73 = *((_DWORD *)result + 9);
      }
      *((_DWORD *)result + 8) = v72 >> 8;
      *((_DWORD *)result + 9) = v73 - 8;
    }
  }
  return result;
}

_QWORD *touchpadCodecCreate(int a1, int a2, int a3, int a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v8;
  void *v9;
  uint64_t i;
  char *v11;

  v5 = 0;
  if (a1)
  {
    if (a2)
    {
      if (a3 == 16 && !a4 && !a5)
      {
        v8 = calloc(1uLL, 0x2A8uLL);
        v5 = v8;
        if (v8)
        {
          v8[81] = (a2 * a1);
          v8[80] = 2 * (a2 * a1);
          v8[82] = 0;
          *((_DWORD *)v8 + 166) = a1;
          *((_DWORD *)v8 + 167) = a2;
          *((_BYTE *)v8 + 672) = 16;
          v9 = malloc(2 * (a2 * a1));
          v5[79] = v9;
          if (v9)
          {
            bzero(v9, 2 * (a2 * a1));
            for (i = 0; i != 630; i += 10)
            {
              v11 = (char *)v5 + i;
              *(_QWORD *)v11 = 32;
              *((_WORD *)v11 + 4) = 261;
            }
            v5[82] = 0;
          }
          else
          {
            free(v5);
            return 0;
          }
        }
      }
    }
  }
  return v5;
}

void codecResetModel(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  bzero(*(void **)(a1 + 632), *(_QWORD *)(a1 + 640));
  for (i = 0; i != 630; i += 10)
  {
    v3 = a1 + i;
    *(_QWORD *)v3 = 32;
    *(_WORD *)(v3 + 8) = 261;
  }
  *(_QWORD *)(a1 + 656) = 0;
}

void touchpadCodecDestroy(void **a1)
{
  if (a1)
  {
    free(a1[79]);
    free(a1);
  }
}

uint64_t codecGetFooterID(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = 0;
  v2 = 0;
  do
  {
    v2 = *(_DWORD *)(a1 + v1) ^ __ROR4__(v2, 31);
    v1 += 10;
  }
  while (v1 != 630);
  return (-1640531535 * v2) >> 20;
}

void mt_FillDefaultMultitouchRegion_cold_1()
{
  __assert_rtn("mt_FillDefaultMultitouchRegion", "mt_PassThruShared.c", 131, "ysize_rowsinuse <= MULTITOUCH_ROWS");
}

void mt_FillDefaultMultitouchRegion_cold_2()
{
  __assert_rtn("mt_FillDefaultMultitouchRegion", "mt_PassThruShared.c", 132, "xsize_colsinuse <= MULTITOUCH_COLS");
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB7B0](allocator, ptr, newsize, hint);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x24BDBBAB8](bundle, functionName);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
  MEMORY[0x24BDBBCC8](theData, range.location, range.length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortGetContext(CFMachPortRef port, CFMachPortContext *context)
{
  MEMORY[0x24BDBBFC0](port, context);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x24BDBBFC8](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
}

Boolean CFMachPortIsValid(CFMachPortRef port)
{
  return MEMORY[0x24BDBBFD8](port);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x24BDBC208](propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC988](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x24BDD7EB8](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x24BDD7EC8](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetCFProperties(io_connect_t connect, CFTypeRef properties)
{
  return MEMORY[0x24BDD7F30](*(_QWORD *)&connect, properties);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F80](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x24BDD7FA0]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x24BDD7FA8](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x24BDD7FB0](dataQueue, data, dataSize);
}

IOReturn IODataQueueWaitForAvailableData(IODataQueueMemory *dataQueue, mach_port_t notificationPort)
{
  return MEMORY[0x24BDD7FC0](dataQueue, *(_QWORD *)&notificationPort);
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x24BDD8260]();
}

uint64_t IOHIDEventGetEvent()
{
  return MEMORY[0x24BDD8278]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x24BDD8290]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventGetVendorDefinedData()
{
  return MEMORY[0x24BDD82E8]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x24BED4AC0]();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return MEMORY[0x24BED4AF8]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x24BED4B20]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x24BED4B30]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x24BED4B38]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x24BED4B70]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x24BED4B90]();
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x24BDD89C8](*(_QWORD *)&service, waitTime);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x24BDAE2B8](*(_QWORD *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x24BDAE748](mhp, segname, sectname, size);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

uint64_t work_interval_create()
{
  return MEMORY[0x24BDB0530]();
}

uint64_t work_interval_destroy()
{
  return MEMORY[0x24BDB0538]();
}

uint64_t work_interval_join()
{
  return MEMORY[0x24BDB0540]();
}

uint64_t work_interval_leave()
{
  return MEMORY[0x24BDB0548]();
}

uint64_t work_interval_notify()
{
  return MEMORY[0x24BDB0550]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

