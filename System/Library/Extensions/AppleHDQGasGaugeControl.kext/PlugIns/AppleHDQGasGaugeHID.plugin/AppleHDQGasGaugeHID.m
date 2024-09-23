uint64_t ggctl_connect(io_object_t *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  kern_return_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  io_connect_t connect;

  connect = 0;
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching("AppleHDQGasGaugeControl");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    v6 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect);
    if (v6)
    {
      v7 = v6;
      v8 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        ggctl_connect_cold_2(v7, v8, v9);
      connect = 0;
    }
    if (a1)
      *a1 = v5;
    else
      IOObjectRelease(v5);
    return connect;
  }
  else
  {
    v10 = logger;
    result = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      ggctl_connect_cold_1(v10, v12, v13);
      return 0;
    }
  }
  return result;
}

uint64_t ggctl_disconnect(uint64_t connect)
{
  if ((_DWORD)connect)
    return IOServiceClose(connect);
  return connect;
}

void ggctl_reset(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  NSObject *v3;
  uint8_t buf[8];
  uint64_t input;

  input = a2;
  v2 = IOConnectCallMethod(a1, 0, &input, 1u, 0, 0, 0, 0, 0, 0);
  v3 = logger;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_reset_cold_1();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_231046000, v3, OS_LOG_TYPE_DEFAULT, "gas gauge: reset", buf, 2u);
    }
    ++gauge_reset_count;
  }
}

uint64_t ggctl_get_hdq_state(mach_port_t a1)
{
  kern_return_t v1;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v1 = IOConnectCallMethod(a1, 1u, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if (v1 == -536870183)
    return 4294967294;
  if (v1)
    return 0xFFFFFFFFLL;
  return output != 0;
}

uint64_t ggctl_get_device_configuration(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt;

  outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t ggctl_enable_currentlog(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t ggctl_map_currentlog(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = MEMORY[0x2348CEB48](a1, 0, *MEMORY[0x24BDAEC58], &v6, &v5, 1);
  v4 = v6;
  if ((_DWORD)result)
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t ggctl_open_device(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int hdq_state;
  NSObject *v5;

  v3 = a1;
  if (!a3)
    return v3;
  hdq_state = ggctl_get_hdq_state(a1);
  if (hdq_state < 0)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_open_device_cold_2();
  }
  else
  {
    if (hdq_state)
    {
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0)
        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        ggctl_open_device_cold_4();
      }
      return v3;
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_open_device_cold_3();
    ggctl_reset(v3, 1u);
  }
  v5 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    ggctl_open_device_cold_1(v5);
  return 0xFFFFFFFFLL;
}

uint64_t hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ggctl_hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ggctl_hdqRead8(mach_port_t a1, int a2)
{
  uint32_t outputCnt;
  uint64_t input;
  int64x2_t v5;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  input = a2;
  v5 = vdupq_n_s64(8uLL);
  outputCnt = 1;
  if (IOConnectCallScalarMethod(a1, 7u, &input, 3u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_hdqRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  v5 = xmmword_231051030;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_controlRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_controlWrite16(mach_port_t a1, int a2, int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_readBlock(mach_port_t a1, int a2, int a3, void *outputStruct, _BYTE *a5)
{
  uint64_t result;
  size_t v7;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  output = 0;
  outputCnt = 1;
  v7 = 32;
  if (IOConnectCallMethod(a1, 9u, input, 2u, 0, 0, &output, &outputCnt, outputStruct, &v7))
    return 0xFFFFFFFFLL;
  result = 0;
  if (a5)
    *a5 = output;
  return result;
}

uint64_t ggctl_writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_gaugeInterrupts(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  unsigned int v3;
  uint64_t input;

  input = a2;
  v2 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v2 == -536870183)
    v3 = -2;
  else
    v3 = -1;
  if (v2)
    return v3;
  else
    return 0;
}

CFDictionaryRef pmps_service()
{
  CFDictionaryRef result;
  CFDictionaryRef v1;
  __CFDictionary *v2;
  void *keys;

  keys = CFSTR("built-in");
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, MEMORY[0x24BDBD270], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (result)
  {
    v1 = result;
    v2 = IOServiceMatching("IOPMPowerSource");
    CFDictionarySetValue(v2, CFSTR("IOPropertyMatch"), v1);
    CFRelease(v1);
    return (CFDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v2);
  }
  return result;
}

uint64_t uart_open_device(uint64_t a1, uint64_t a2, int a3)
{
  return ggctl_open_device(a1, 0, a3);
}

uint64_t hdqRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  v5 = xmmword_231051030;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t controlOp16(mach_port_t a1, int a2)
{
  uint64_t input;

  input = a2;
  if (IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t controlRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t controlWrite16(mach_port_t a1, int a2, int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t gaugeEnableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  input = 1;
  v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t gaugeDisableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  input = 0;
  v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t gaugeDisconnect(mach_port_t connection)
{
  int v2;
  int v3;
  NSObject *v4;
  unsigned int v6;
  __int16 v7;
  uint64_t input;
  uint32_t outputCnt;
  uint64_t output;
  __int16 v11;
  int v12;
  uint64_t v13;

  v2 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  do
  {
    output = 0;
    outputCnt = 1;
    input = 23;
    if (IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt))
      v3 = -1;
    else
      v3 = output;
    if (!v3)
      break;
    v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      LODWORD(output) = 67109376;
      HIDWORD(output) = v2;
      v11 = 1024;
      v12 = v3;
      _os_log_error_impl(&dword_231046000, v4, OS_LOG_TYPE_ERROR, "%d: retry OpenProtector (%d)", (uint8_t *)&output, 0xEu);
    }
    usleep(0xF4240u);
    ++v2;
  }
  while (v2 != 3);
  v7 = 0;
  output = 0;
  outputCnt = 1;
  input = 32;
  IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt);
  if (controlReadU16(connection, 0, &v7))
    return 4294967291;
  if (v3)
    v6 = -36;
  else
    v6 = 0;
  if ((v7 & 0x2000) != 0)
    return v6;
  else
    return 0xFFFFFFFFLL;
}

uint64_t controlReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadS8(mach_port_t a1, int a2, _BYTE *a3)
{
  uint64_t result;

  result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadU8(mach_port_t a1, int a2, _BYTE *a3)
{
  uint64_t result;

  result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t controlReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t dumpBuffer(unsigned __int8 *a1, int a2)
{
  uint64_t v3;
  int v4;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      v4 = *a1++;
      printf(" %02x", v4);
      --v3;
    }
    while (v3);
  }
  return putchar(10);
}

uint64_t registerName(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0x600)
  {
    if (a2 - 1281 > 1 || (*(_DWORD *)a1 | 4) != 0x1E)
      goto LABEL_8;
    return 0;
  }
  if ((*(_DWORD *)a1 | 2) == 0xE)
    return 0;
LABEL_8:
  v2 = *(_QWORD *)(a1 + 72);
  if (!v2
    && (a2 < 0x600 || (v2 = *(_QWORD *)(a1 + 48)) == 0)
    && (a2 < 0x501 || (v2 = *(_QWORD *)(a1 + 40)) == 0)
    && (a2 < 0x313 || (v2 = *(_QWORD *)(a1 + 32)) == 0)
    && (a2 < 0x132 || (v2 = *(_QWORD *)(a1 + 24)) == 0))
  {
    if (a2 < 0x119)
      return *(_QWORD *)(a1 + 8);
    v2 = *(_QWORD *)(a1 + 16);
    if (!v2)
      return *(_QWORD *)(a1 + 8);
  }
  return v2;
}

uint64_t readRegister(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  int v4;
  uint64_t result;
  uint64_t (*v6)(_WORD *);

  v4 = *(_DWORD *)(a2 + 4);
  result = 0xFFFFFFFFLL;
  if (v4 <= 1)
  {
    if (v4)
    {
      if (v4 == 1)
        return hdqReadU16(a3, *(_DWORD *)a2, a1);
    }
    else
    {
      return hdqReadS16(a3, *(_DWORD *)a2, a1);
    }
  }
  else
  {
    switch(v4)
    {
      case 100:
        v6 = *(uint64_t (**)(_WORD *))(a2 + 64);
        if (v6)
          return v6(a1);
        break;
      case 10:
        return controlReadU16(a3, *(_DWORD *)a2, a1);
      case 2:
        result = ggctl_hdqRead8(a3, *(_DWORD *)a2);
        if ((result & 0x80000000) == 0)
        {
          if (a1)
            *(_BYTE *)a1 = result;
          return 0;
        }
        break;
    }
  }
  return result;
}

uint64_t getFWVersion(mach_port_t a1, __int16 *a2)
{
  __int16 v3;
  uint64_t result;

  v3 = getFWVersion_gFWVersion;
  if (getFWVersion_gFWVersion)
    goto LABEL_2;
  if (!controlReadU16(a1, 2, &getFWVersion_gFWVersion))
  {
    v3 = getFWVersion_gFWVersion;
    if (getFWVersion_gFWVersion == 256)
    {
      v3 = 1536;
      getFWVersion_gFWVersion = 1536;
    }
LABEL_2:
    result = 0;
    *a2 = v3;
    return result;
  }
  return 0xFFFFFFFFLL;
}

double readLifetimeData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  __int128 v7;
  unsigned __int16 v8;
  __int128 outputStruct;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) == 0
    && v8 >= 0x313u
    && !ggctl_readBlock(a3, -1, 4, &outputStruct, 0))
  {
    v6 = v10;
    *a1 = outputStruct;
    a1[1] = v6;
    if (!ggctl_readBlock(a3, -1, 6, &outputStruct, 0))
    {
      result = *(double *)&outputStruct;
      v7 = v10;
      a1[2] = outputStruct;
      a1[3] = v7;
    }
  }
  return result;
}

double readRaTableData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  unsigned __int16 v7;
  _OWORD outputStruct[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 7, outputStruct, 0))
  {
    result = *(double *)outputStruct;
    v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

double readIMAXAndSOCSmoothData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  unsigned __int16 v7;
  _OWORD outputStruct[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 8, outputStruct, 0))
  {
    result = *(double *)outputStruct;
    v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

uint64_t findRaWeightMulitplier(int a1)
{
  uint64_t v1;

  v1 = 0;
  while ((unsigned __int16)battery_health_metric_config[v1] != a1)
  {
    v1 += 4;
    if (v1 == 68)
      return 0;
  }
  return *(unsigned int *)&battery_health_metric_config[v1 + 2];
}

float calculateWra(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9)
{
  return (double)a2 * 0.137995
       + (double)a1 * 0.0693069
       + (double)a3 * 0.137376
       + (double)a4 * 0.137376
       + (double)a5 * 0.137376
       + (double)a6 * 0.137376
       + (double)a7 * 0.137376
       + (double)a8 * 0.0872525
       + (double)a9 * 0.0185644;
}

float calculateChemicalWeightedRa(unsigned int a1, float a2)
{
  return (float)((float)a1 * a2) / 1000.0;
}

CFDictionaryRef readShutdownReasonData(mach_port_t a1)
{
  NSObject *v2;
  const char *v3;
  _OWORD v5[2];
  __int128 v6;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  _OWORD v12[3];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  memset(v12, 0, sizeof(v12));
  if (ggctl_logShutdownReason(a1, (uint64_t)v5, 1u))
  {
    v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v9 = "readShutdownReasonData";
    v10 = 1024;
    v11 = 2502;
    v3 = "%s:%d cannot read data";
LABEL_4:
    _os_log_impl(&dword_231046000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 0x12u);
    return 0;
  }
  if (!*((_QWORD *)&v6 + 1))
  {
    v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v9 = "readShutdownReasonData";
    v10 = 1024;
    v11 = 2506;
    v3 = "%s:%d invalid timestamp";
    goto LABEL_4;
  }
  return parseShutdownReason((__int16 *)v5, (const UInt8 *)v12, a1);
}

uint64_t ggctl_logShutdownReason(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  __int128 v5;
  __int128 v7;
  uint64_t input;
  uint64_t v9;
  size_t v10;
  __int128 outputStruct;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD inputStruct[3];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 64;
  if (!a2)
    return 0xFFFFFFFFLL;
  if ((a3 & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    outputStruct = 0u;
    v12 = 0u;
    input = a3;
    v4 = IOConnectCallMethod(a1, 0x11u, &input, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
    if (!v4)
    {
      v5 = v12;
      *(_OWORD *)a2 = outputStruct;
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = v13;
      *(_DWORD *)(a2 + 48) = v14;
    }
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 16);
    inputStruct[0] = *(_OWORD *)a2;
    inputStruct[1] = v7;
    inputStruct[2] = *(_OWORD *)(a2 + 32);
    v16 = *(_DWORD *)(a2 + 48);
    v9 = a3;
    v4 = IOConnectCallMethod(a1, 0x11u, &v9, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
  }
  if (v4)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

CFDictionaryRef parseShutdownReason(__int16 *a1, const UInt8 *a2, mach_port_t a3)
{
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
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
  uint64_t valuePtr;
  void *keys[23];
  __int128 v37;
  __int128 v38;
  const __CFString *v39;
  void *values[22];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  UInt8 bytes[16];
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0;
  keys[0] = CFSTR("ShutDownTimestamp");
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  valuePtr = *((_QWORD *)a1 + 5);
  values[0] = CFNumberCreate(v6, kCFNumberLongType, &valuePtr);
  keys[1] = CFSTR("ShutDownUISoc");
  v34 = *((_DWORD *)a1 + 12);
  values[1] = CFNumberCreate(v6, kCFNumberFloatType, &v34);
  keys[2] = CFSTR("ShutDownTemperature");
  v33 = *a1;
  values[2] = CFNumberCreate(v6, kCFNumberIntType, &v33);
  keys[3] = CFSTR("ShutDownPresentDOD");
  v32 = a1[1];
  values[3] = CFNumberCreate(v6, kCFNumberIntType, &v32);
  keys[4] = CFSTR("ShutDownMaxRa08");
  v31 = a1[2];
  values[4] = CFNumberCreate(v6, kCFNumberIntType, &v31);
  keys[5] = CFSTR("ShutDownNominalChargeCapacity");
  v30 = (unsigned __int16)a1[3];
  values[5] = CFNumberCreate(v6, kCFNumberIntType, &v30);
  keys[6] = CFSTR("ShutDownPrevNominalChargeCapacity");
  v29 = (unsigned __int16)a1[4];
  values[6] = CFNumberCreate(v6, kCFNumberIntType, &v29);
  keys[7] = CFSTR("ShutDownFullChargeCapacity");
  v28 = a1[5];
  values[7] = CFNumberCreate(v6, kCFNumberIntType, &v28);
  keys[8] = CFSTR("ShutDownPrevFullChargeCapacity");
  v27 = a1[6];
  values[8] = CFNumberCreate(v6, kCFNumberIntType, &v27);
  keys[9] = CFSTR("ShutDownRemainingCapacity");
  v26 = a1[7];
  values[9] = CFNumberCreate(v6, kCFNumberIntType, &v26);
  keys[10] = CFSTR("ShutDownPrevRemainingCapacity");
  v25 = a1[8];
  values[10] = CFNumberCreate(v6, kCFNumberIntType, &v25);
  keys[11] = CFSTR("ShutDownCycleCount");
  v24 = (unsigned __int16)a1[9];
  values[11] = CFNumberCreate(v6, kCFNumberIntType, &v24);
  keys[12] = CFSTR("ShutDownMaxDischargeCurrent");
  v23 = a1[10];
  values[12] = CFNumberCreate(v6, kCFNumberIntType, &v23);
  keys[13] = CFSTR("ShutDownTimeAbove95");
  v22 = *((unsigned __int8 *)a1 + 22);
  values[13] = CFNumberCreate(v6, kCFNumberIntType, &v22);
  keys[14] = CFSTR("ShutDownVoltage");
  v21 = *(__int16 *)((char *)a1 + 23);
  values[14] = CFNumberCreate(v6, kCFNumberIntType, &v21);
  keys[15] = CFSTR("ShutDownPrevVoltage");
  v20 = *(__int16 *)((char *)a1 + 25);
  values[15] = CFNumberCreate(v6, kCFNumberIntType, &v20);
  keys[16] = CFSTR("ShutDownAverageCurrent");
  v19 = *(__int16 *)((char *)a1 + 27);
  values[16] = CFNumberCreate(v6, kCFNumberIntType, &v19);
  keys[17] = CFSTR("ShutDownPrevAverageCurrent");
  v18 = *(__int16 *)((char *)a1 + 29);
  values[17] = CFNumberCreate(v6, kCFNumberIntType, &v18);
  keys[18] = CFSTR("ShutDownCycleCountLastQmax");
  v17 = *((unsigned __int8 *)a1 + 31);
  values[18] = CFNumberCreate(v6, kCFNumberIntType, &v17);
  keys[19] = CFSTR("ShutDownResScale");
  v16 = (unsigned __int16)a1[16];
  values[19] = CFNumberCreate(v6, kCFNumberIntType, &v16);
  keys[20] = CFSTR("ShutDownQstart");
  v15 = a1[17];
  values[20] = CFNumberCreate(v6, kCFNumberIntType, &v15);
  keys[21] = CFSTR("ShutDownPassedCharge");
  v14 = a1[18];
  values[21] = CFNumberCreate(v6, kCFNumberIntType, &v14);
  keys[22] = CFSTR("ShutDownDOD0");
  v13 = (unsigned __int16)a1[19];
  *(_QWORD *)&v41 = CFNumberCreate(v6, kCFNumberIntType, &v13);
  *(_QWORD *)&v37 = CFSTR("Raw");
  *((_QWORD *)&v41 + 1) = CFDataCreate(v6, (const UInt8 *)a1, 52);
  v46 = 0;
  *(_OWORD *)bytes = 0u;
  v45 = 0u;
  ggctl_logShutdownDLog(a3, (uint64_t)bytes, 1u);
  *((_QWORD *)&v37 + 1) = CFSTR("ShutDownDLog");
  *(_QWORD *)&v42 = CFDataCreate(v6, bytes, 40);
  *(_QWORD *)&v38 = CFSTR("timeSinceAwake");
  v12 = *(_QWORD *)a2;
  *((_QWORD *)&v42 + 1) = CFNumberCreate(v6, kCFNumberLongType, &v12);
  *((_QWORD *)&v38 + 1) = CFSTR("ShutDownRaTableRaw");
  *(_QWORD *)&v43 = CFDataCreate(v6, a2 + 8, 32);
  v39 = CFSTR("ShutDownRSS");
  v11 = *((unsigned __int16 *)a2 + 20);
  *((_QWORD *)&v43 + 1) = CFNumberCreate(v6, kCFNumberIntType, &v11);
  v7 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 28, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = 27;
  do
  {
    CFRelease(values[v8]);
    v9 = v8-- + 1;
  }
  while (v9 > 1);
  return v7;
}

void writeBatteryDiagnosticData(uint64_t a1, int a2)
{
  size_t outputStructCnt;
  _BYTE v5[48];
  __int16 v6;
  _QWORD v7[45];

  v7[44] = *MEMORY[0x24BDAC8D0];
  bzero(v5, 0x258uLL);
  outputStructCnt = 352;
  IOConnectCallStructMethod(a1, 2u, 0, 0, v7, &outputStructCnt);
  v6 = 4000;
  logBatteryDiagnosticData((uint64_t)v5, a1, a2);
}

void logBatteryDiagnosticData(uint64_t a1, uint64_t a2, int a3)
{
  const __CFDictionary *v6;
  int SInt32ForKey;
  float v8;
  int v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  char *v16;
  _BYTE v17[24];
  __int128 v18;
  uint64_t v19;
  char __str[2];
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  char v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  char v36;
  uint64_t v37;
  time_t v38;
  float v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v40 = 0u;
  v41 = 0u;
  v42 = 0;
  v6 = IOServiceMatching("IOPMPowerSource");
  service = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v6);
  if (service)
  {
    if ((getSInt32ForKey(CFSTR("CurrentCapacity"), (_DWORD *)&v14 + 1) & 0x80000000) != 0)
    {
      IOObjectRelease(service);
    }
    else
    {
      SInt32ForKey = getSInt32ForKey(CFSTR("MaxCapacity"), &v14);
      IOObjectRelease(service);
      if ((SInt32ForKey & 0x80000000) == 0)
      {
        v8 = (float)(100 * HIDWORD(v14)) / (float)(int)v14;
        setUPOData(CFSTR("IOPMUBootUPOState"), v8 > 10.0);
        if (*(_DWORD *)(a1 + 596) && v8 > 10.0 && *(__int16 *)(a1 + 48) >= 2742)
          setUPOData(CFSTR("IOPMUBootUPOCounter"), 1);
        v9 = (__int16)(*(unsigned __int8 *)(a1 + 104) << 8) | *(unsigned __int8 *)(a1 + 105);
        v10 = (__int16)(*(unsigned __int8 *)(a1 + 126) << 8) | *(unsigned __int8 *)(a1 + 127);
        v11 = *(unsigned __int8 *)(a1 + 142);
        v12 = *(unsigned __int8 *)(a1 + 139);
        if (a3)
        {
          v38 = time(0);
          v39 = v8;
          *(_WORD *)__str = *(_WORD *)(a1 + 48);
          v21 = *(_WORD *)(a1 + 58);
          v22 = v10;
          v23 = *(_WORD *)(a1 + 46);
          v24 = *(_WORD *)(a1 + 228);
          v25 = *(_WORD *)(a1 + 44);
          v26 = *(_WORD *)(a1 + 226);
          v27 = *(_WORD *)(a1 + 52);
          v28 = *(_WORD *)(a1 + 230);
          v29 = *(_WORD *)(a1 + 84);
          v30 = v9;
          v31 = v11;
          v32 = *(_WORD *)(a1 + 42);
          v33 = *(_WORD *)(a1 + 222);
          v34 = *(_WORD *)(a1 + 50);
          v35 = *(_WORD *)(a1 + 224);
          v36 = v12;
          v37 = *(_QWORD *)(a1 + 60);
          v19 = 0;
          *(_QWORD *)v17 = v38 - *(_QWORD *)(a1 + 232);
          *(_OWORD *)&v17[8] = *(_OWORD *)(a1 + 158);
          v18 = *(_OWORD *)(a1 + 174);
          LOWORD(v19) = bswap32(*(unsigned __int16 *)(a1 + 191)) >> 16;
          ggctl_logShutdownReason(a2, (uint64_t)__str, 0);
          ggctl_logShutdownDLog(a2, (uint64_t)&v40, 0);
          ggctl_logShutdownReason2(a2, v17, 0);
        }
        *(_OWORD *)v17 = *(_OWORD *)a1;
        *(_WORD *)&v17[16] = *(_WORD *)(a1 + 16);
        snprintf(__str, 0x200uLL, "%s,%5.2f,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d"
          ",%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d",
          v17,
          v8,
          *(__int16 *)(a1 + 48),
          *(__int16 *)(a1 + 58),
          v10,
          *(unsigned __int16 *)(a1 + 46),
          *(unsigned __int16 *)(a1 + 228),
          *(__int16 *)(a1 + 44),
          *(__int16 *)(a1 + 226),
          *(__int16 *)(a1 + 52),
          *(__int16 *)(a1 + 230),
          *(unsigned __int16 *)(a1 + 84),
          v9,
          v11,
          *(__int16 *)(a1 + 42),
          *(__int16 *)(a1 + 222),
          *(__int16 *)(a1 + 50),
          *(__int16 *)(a1 + 224),
          v12,
          *(unsigned __int16 *)(a1 + 60),
          __rev16(*(unsigned __int16 *)(a1 + 191)),
          __rev16(*(unsigned __int16 *)(a1 + 158)),
          __rev16(*(unsigned __int16 *)(a1 + 160)),
          __rev16(*(unsigned __int16 *)(a1 + 162)),
          __rev16(*(unsigned __int16 *)(a1 + 164)),
          __rev16(*(unsigned __int16 *)(a1 + 166)),
          __rev16(*(unsigned __int16 *)(a1 + 168)),
          __rev16(*(unsigned __int16 *)(a1 + 170)),
          __rev16(*(unsigned __int16 *)(a1 + 172)),
          __rev16(*(unsigned __int16 *)(a1 + 174)),
          __rev16(*(unsigned __int16 *)(a1 + 176)),
          __rev16(*(unsigned __int16 *)(a1 + 178)),
          __rev16(*(unsigned __int16 *)(a1 + 180)),
          __rev16(*(unsigned __int16 *)(a1 + 182)),
          __rev16(*(unsigned __int16 *)(a1 + 184)),
          __rev16(*(unsigned __int16 *)(a1 + 186)),
          (unsigned __int16)v40,
          WORD1(v40),
          WORD2(v40),
          WORD3(v40),
          WORD4(v40),
          WORD5(v40),
          WORD6(v40),
          HIWORD(v40),
          (unsigned __int16)v41,
          WORD1(v41),
          WORD2(v41),
          WORD3(v41),
          WORD4(v41),
          WORD5(v41),
          WORD6(v41),
          HIWORD(v41),
          (unsigned __int16)v42,
          WORD1(v42),
          WORD2(v42),
          HIWORD(v42));
        CFAbsoluteTimeGetCurrent();
        logLineForAppleCare();
        v13 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v16 = __str;
          _os_log_impl(&dword_231046000, v13, OS_LOG_TYPE_DEFAULT, "Battery Diagnostic Data:: %s", buf, 0xCu);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    logBatteryDiagnosticData_cold_1();
  }
}

BOOL okToLoad()
{
  stat v1;

  memset(&v1, 0, sizeof(v1));
  return stat("/dev/cu.gas-gauge", &v1) == 0;
}

uint64_t startUpdateThread(unsigned int a1)
{
  uint64_t v2;
  NSObject *v4;
  uint8_t v5[8];
  pthread_t v6;
  stat v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  if (stat("/dev/cu.gas-gauge", &v7))
    return 0xFFFFFFFFLL;
  v6 = 0;
  memset(&v7, 0, 64);
  pthread_attr_init((pthread_attr_t *)&v7);
  pthread_attr_setdetachstate((pthread_attr_t *)&v7, 2);
  logger = (uint64_t)os_log_create("com.apple.AppleHDQGasGauge", "battery");
  if (!logger)
    return 0xFFFFFFFFLL;
  v2 = pthread_create(&v6, (const pthread_attr_t *)&v7, (void *(__cdecl *)(void *))updateThread, (void *)a1);
  if ((_DWORD)v2)
  {
    v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_231046000, v4, OS_LOG_TYPE_ERROR, "pthread_create", v5, 2u);
      v4 = logger;
    }
    os_release(v4);
  }
  else
  {
    pthread_attr_destroy((pthread_attr_t *)&v7);
  }
  return v2;
}

uint64_t updateThread(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  unsigned int v5;
  io_service_t v6;
  mach_port_t v7;
  IONotificationPort *v8;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  const __CFString *v11;
  __CFRunLoop *v12;
  __CFRunLoopSource *v13;
  uint64_t v14;
  io_connect_t v15;
  mach_error_t v16;
  BOOL *v17;
  mach_error_t v18;
  NSObject *v19;
  const __CFNumber *v21;
  const __CFNumber *v22;
  CFTypeID v23;
  NSObject *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  CFTypeID v27;
  int Value;
  const __CFBoolean *v29;
  const __CFBoolean *v30;
  CFTypeID v31;
  NSObject *v32;
  const __CFNumber *v33;
  const __CFNumber *v34;
  CFTypeID v35;
  NSObject *v36;
  const __CFBoolean *v37;
  const __CFBoolean *v38;
  CFTypeID v39;
  NSObject *v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  CFTypeID v43;
  NSObject *v44;
  IONotificationPort *v45;
  kern_return_t v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  __CFRunLoop *v50;
  __CFRunLoopSource *v51;
  NSObject *v52;
  __darwin_time_t v53;
  NSObject *v54;
  int v55;
  char v56;
  int v57;
  int v58;
  double v59;
  double v60;
  int v61;
  mach_port_t v62;
  kern_return_t v63;
  int v64;
  NSObject *v65;
  int v66;
  int v67;
  NSObject *v68;
  CFAbsoluteTime v69;
  _BOOL4 v70;
  _BOOL4 v71;
  char v72;
  double v73;
  double v74;
  NSObject *v75;
  NSObject *v76;
  int v77;
  int v78;
  int v79;
  NSObject *v80;
  int v81;
  NSObject *v82;
  int v83;
  CFTypeRef CFProperty;
  CFTypeRef v85;
  CFTypeID v86;
  int v87;
  unsigned __int8 v88;
  NSObject *v89;
  int v90;
  int hdq_state;
  CFPropertyListRef v92;
  _BOOL4 v93;
  mach_port_t v94;
  int v95;
  unint64_t v96;
  int v97;
  NSObject *v98;
  unsigned int v99;
  int v100;
  int v101;
  NSObject *v102;
  NSObject *v103;
  int v104;
  _BOOL4 v105;
  uint64_t v106;
  int v107;
  int v108;
  CFNumberRef v109;
  CFNumberRef v110;
  int v111;
  BOOL v112;
  NSObject *v113;
  int v114;
  int Block;
  NSObject *v116;
  __darwin_time_t v117;
  unint64_t v118;
  NSObject *v119;
  __darwin_time_t v120;
  int v121;
  NSObject *v122;
  __darwin_time_t v123;
  unint64_t v124;
  NSObject *v125;
  NSObject *v126;
  __darwin_time_t v127;
  char v128;
  NSObject *v129;
  unint64_t v130;
  _BOOL4 v131;
  _BOOL4 v132;
  unint64_t v133;
  _BOOL4 v134;
  NSObject *v135;
  int v136;
  int v137;
  NSObject *v138;
  NSObject *v139;
  int v140;
  NSObject *v141;
  uint64_t v142;
  int BatteryData;
  CFDictionaryRef ChargerData;
  _BOOL4 v145;
  int v146;
  int v147;
  BOOL v148;
  int v149;
  int v150;
  __int16 v151;
  NSObject *v152;
  BOOL v153;
  __int16 v154;
  int v155;
  unsigned int v156;
  NSObject *v157;
  NSObject *v158;
  BOOL v159;
  int v160;
  BOOL v161;
  NSObject *v162;
  NSObject *v163;
  _BOOL4 v164;
  CFDictionaryRef v165;
  NSObject *v166;
  const __CFAllocator *v167;
  int v168;
  const __CFString *v169;
  int v170;
  int v171;
  NSObject *v172;
  _BOOL4 v173;
  unsigned int v174;
  int v176;
  CFNumberRef v177;
  uint64_t v178;
  uint64_t v179;
  int U16;
  _BOOL4 v181;
  NSObject *v182;
  unint64_t v183;
  NSObject *v184;
  CFNumberRef v185;
  uint64_t v186;
  uint64_t v187;
  CFNumberRef v188;
  uint64_t v189;
  CFNumberRef v190;
  uint64_t v191;
  CFNumberRef v192;
  uint64_t v193;
  CFNumberRef v194;
  uint64_t v195;
  unsigned int v196;
  CFNumberRef v197;
  uint64_t v198;
  const void *v199;
  uint64_t v200;
  CFNumberRef v201;
  uint64_t v202;
  char *v203;
  CFNumberRef v204;
  uint64_t v205;
  CFNumberRef v206;
  uint64_t v207;
  CFNumberRef v208;
  uint64_t v209;
  CFNumberRef v210;
  uint64_t v211;
  CFDictionaryRef v212;
  CFDictionaryRef v213;
  CFDictionaryRef v214;
  NSObject *v215;
  CFDictionaryRef v216;
  CFDictionaryRef v217;
  NSObject *v218;
  CFDictionaryRef v219;
  NSObject *v220;
  int S16;
  int v223;
  NSObject *v224;
  time_t v225;
  uint64_t v226;
  NSObject *v227;
  const char *v228;
  char v229;
  time_t v230;
  char v231;
  uint64_t v232;
  _BOOL4 v233;
  NSObject *v234;
  const char *v235;
  int v236;
  int v237;
  NSObject *v238;
  __int16 v239;
  _BOOL4 v240;
  NSObject *v241;
  int v242;
  int v243;
  int v244;
  NSObject *v245;
  char v246;
  NSObject *v247;
  int v248;
  NSObject *v249;
  int v250;
  int v251;
  int v252;
  NSObject *v253;
  NSObject *v254;
  uint64_t v255;
  _BOOL4 v256;
  NSObject *v257;
  const char *v258;
  uint32_t v259;
  CFAbsoluteTime v260;
  NSObject *v261;
  NSObject *v262;
  int v263;
  _BOOL4 v264;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  int v269;
  int v270;
  _BOOL4 v271;
  int v272;
  int v273;
  int v274;
  uint64_t v275;
  os_log_t v276;
  _BOOL4 v277;
  NSObject *v278;
  time_t v279;
  _BOOL4 v280;
  char v281;
  _BOOL4 v282;
  int v283;
  uint64_t v284;
  BOOL v285;
  int v286;
  int v287;
  int v288;
  uint64_t v289;
  int v290;
  CFPropertyListRef v291;
  int v292;
  BOOL *v293;
  unsigned int v294;
  _BOOL4 v295;
  BOOL v296;
  const __CFString *v297;
  const __CFString *v298;
  const __CFString *mode;
  io_connect_t v300;
  BOOL v301;
  _BOOL4 v302;
  const __CFAllocator *allocator;
  io_connect_t kernelPort;
  CFTypeRef v305;
  BOOL v306;
  int v307;
  char v308;
  char v309;
  char v310[7];
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  _BOOL4 v327;
  int v328;
  char v329;
  char v330[15];
  char v331;
  char v332[15];
  char v333;
  char v334[15];
  size_t v335;
  int valuePtr;
  uint64_t refCon;
  intptr_t notificationID;
  io_object_t notifier;
  IONotificationPortRef thePortRef;
  unsigned __int16 v341;
  int v342;
  io_object_t notification[2];
  uint8_t v344[4];
  int v345[3];
  uint8_t v346[4];
  const char *v347;
  __int16 v348;
  int v349;
  void *keys[2];
  __int128 v351;
  __int128 v352;
  _BYTE input[52];
  double v354;
  int v355;
  void *v356[2];
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  uint8_t buf[32];
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  char v399[64];
  uint64_t v400;

  v400 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)notification = 0;
  v342 = 0;
  v341 = 0;
  thePortRef = 0;
  notifier = 0;
  notificationID = 0;
  refCon = 0;
  pthread_setname_np("GasGauge-updateThread");
  v2 = 0x25414D000uLL;
  gRestrictLogMessagesCounter = 0;
  v3 = 0x255EB2000uLL;
  v4 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_231046000, v4, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread start", buf, 2u);
  }
  v5 = pmps_service();
  if (v5)
  {
    v6 = v5;
    v7 = *MEMORY[0x24BDD8B18];
    v8 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    if (IOServiceAddInterestNotification(v8, v6, "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        updateThread_cold_10();
      return 0;
    }
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v8);
    v11 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    kernelPort = IORegisterForSystemPower(&refCon, &thePortRef, (IOServiceInterestCallback)iokit_callback, &notifier);
    if (kernelPort && thePortRef)
    {
      v12 = CFRunLoopGetCurrent();
      v13 = IONotificationPortGetRunLoopSource(thePortRef);
      CFRunLoopAddSource(v12, v13, v11);
      v14 = ggctl_connect(&notification[1]);
      if (!(_DWORD)v14)
        return 0;
      v15 = v14;
      *(_QWORD *)buf = 0;
      v356[0] = 0;
      v16 = MEMORY[0x2348CEB48](v14, 0, *MEMORY[0x24BDAEC58], buf, v356, 1);
      if (v16)
        v17 = 0;
      else
        v17 = *(BOOL **)buf;
      if (v16)
      {
        v18 = v16;
        v19 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          updateThread_cold_9(v18, v19);
        IOServiceClose(v15);
        return 0;
      }
      v289 = *(_QWORD *)buf;
      v293 = v17;
      mode = v11;
      *(_QWORD *)buf = 352;
      IOConnectCallStructMethod(v15, 2u, 0, 0, &dword_255EB38D8, (size_t *)buf);
      byte_255EB3824 = dword_255EB397C != 0;
      v341 = word_255EB3966;
      v286 = dword_255EB3A30;
      valuePtr = dword_255EB396C;
      v297 = (const __CFString *)*MEMORY[0x24BDBD588];
      v298 = (const __CFString *)*MEMORY[0x24BDBD590];
      v21 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("UpdateSampleConfig"), CFSTR("com.apple.gasgauge"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
      if (v21)
      {
        v22 = v21;
        v23 = CFGetTypeID(v21);
        if (v23 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v22, kCFNumberSInt32Type, &valuePtr);
          v24 = logger;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = valuePtr;
            _os_log_impl(&dword_231046000, v24, OS_LOG_TYPE_DEFAULT, "changed updateSampleConfig=%#x", buf, 8u);
          }
        }
        CFRelease(v22);
      }
      v294 = valuePtr;
      v25 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("CriticalBattery"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v25)
      {
        v26 = v25;
        v27 = CFGetTypeID(v25);
        if (v27 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v26, kCFNumberSInt32Type, &word_255EB3964);
          CFRelease(v26);
        }
        else
        {
          Value = CFBooleanGetValue(v26);
          CFRelease(v26);
          if (!Value)
          {
            v262 = logger;
            v292 = 0;
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_231046000, v262, OS_LOG_TYPE_DEFAULT, "Critical battery shutdown disabled", buf, 2u);
              v292 = 0;
            }
            goto LABEL_30;
          }
        }
      }
      v292 = 1;
LABEL_30:
      v29 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("UserMode"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v29)
      {
        v30 = v29;
        v31 = CFGetTypeID(v29);
        v295 = v31 == CFBooleanGetTypeID() && CFBooleanGetValue(v30) != 0;
        CFRelease(v30);
        v32 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v295;
          _os_log_impl(&dword_231046000, v32, OS_LOG_TYPE_DEFAULT, "gas gauge: userModeEnabled=%d", buf, 8u);
        }
      }
      else
      {
        v295 = 0;
      }
      v33 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("CriticalFlagDelay"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v33)
      {
        v34 = v33;
        v35 = CFGetTypeID(v33);
        if (v35 == CFNumberGetTypeID())
          CFNumberGetValue(v34, kCFNumberSInt32Type, &v341);
        CFRelease(v34);
        v36 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v341;
          _os_log_impl(&dword_231046000, v36, OS_LOG_TYPE_DEFAULT, "gas gauge: critical flag delay %d", buf, 8u);
        }
      }
      v37 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("DebugPolling"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v37)
      {
        v38 = v37;
        v39 = CFGetTypeID(v37);
        if (v39 == CFBooleanGetTypeID())
          debug_polling = CFBooleanGetValue(v38) != 0;
        CFRelease(v38);
        v40 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = debug_polling;
          _os_log_impl(&dword_231046000, v40, OS_LOG_TYPE_DEFAULT, "gas gauge: debug_polling=%d", buf, 8u);
        }
      }
      v41 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("RestricLogCounter"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v41)
      {
        v42 = v41;
        v43 = CFGetTypeID(v41);
        if (v43 == CFNumberGetTypeID())
          CFNumberGetValue(v42, kCFNumberSInt32Type, &gRestrictLogCounter);
        CFRelease(v42);
        v44 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = gRestrictLogCounter;
          _os_log_impl(&dword_231046000, v44, OS_LOG_TYPE_DEFAULT, "gas gauge: log counter %d", buf, 8u);
        }
      }
      v307 = dword_255EB3970;
      if (dword_255EB3970)
      {
        v45 = IONotificationPortCreate(v7);
        v46 = IOServiceAddInterestNotification(v45, notification[1], "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification);
        v47 = logger;
        if (v46)
        {
          v48 = v46;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
            updateThread_cold_8(v48, v47, v49);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_231046000, v47, OS_LOG_TYPE_DEFAULT, "gasgauge: listening for battery interrupts", buf, 2u);
          }
          v50 = CFRunLoopGetCurrent();
          v51 = IONotificationPortGetRunLoopSource(v45);
          CFRunLoopAddSource(v50, v51, v11);
        }
      }
      v342 = 0;
      getUPOData(CFSTR("IOPMUBootUPOState"), &v342);
      v301 = v342 != 0;
      getUPOData(CFSTR("IOPMUBootBatteryHealthMetric"), &dword_255EB38D0);
      v335 = 64;
      if (sysctlbyname("hw.model", v399, &v335, 0, 0))
      {
        v52 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          updateThread_cold_7(v52);
      }
      v300 = v15;
      v53 = UpSeconds();
      v54 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v292;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (unsigned __int16)word_255EB3964;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = valuePtr;
        *(_WORD *)&buf[30] = 1024;
        LODWORD(v379) = byte_255EB3824;
        WORD2(v379) = 1024;
        *(_DWORD *)((char *)&v379 + 6) = v341;
        WORD5(v379) = 1024;
        HIDWORD(v379) = dword_255EB3968;
        LOWORD(v380) = 1024;
        *(_DWORD *)((char *)&v380 + 2) = v342;
        _os_log_impl(&dword_231046000, v54, OS_LOG_TYPE_DEFAULT, "gasgauge: %llu updateThread critical(%d, 0x%x), uscfg=0x%x, dyn=%d cfd=%d cfd-voltage=%d, upos=%x", buf, 0x36u);
      }
      v284 = a1;
      v280 = a1 != 0;
      LOBYTE(v55) = 0;
      v285 = 0;
      v306 = 0;
      v302 = 0;
      v296 = 0;
      v56 = 0;
      v308 = 0;
      v281 = 0;
      v279 = 0;
      v57 = 0;
      v290 = 0;
      v58 = 0;
      qword_255EB38C8 = time(0);
      v282 = (dword_255EB3980 | dword_255EB39C4) != 0;
      v288 = (v294 >> 2) & 1;
      v287 = (v294 >> 3) & 1;
      allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v305 = (CFTypeRef)*MEMORY[0x24BDBD270];
      v291 = (CFPropertyListRef)*MEMORY[0x24BDBD268];
      v59 = 0.0;
      v60 = 0.0;
      LOBYTE(v283) = 1;
      v61 = -1;
      v62 = -1;
      while (1)
      {
        v398 = 0u;
        v397 = 0u;
        v396 = 0u;
        v395 = 0u;
        v394 = 0u;
        v393 = 0u;
        v392 = 0u;
        v391 = 0u;
        v390 = 0u;
        v389 = 0u;
        v388 = 0u;
        v387 = 0u;
        v386 = 0u;
        v385 = 0u;
        v384 = 0u;
        v383 = 0u;
        v382 = 0u;
        v381 = 0u;
        v380 = 0u;
        v379 = 0u;
        memset(buf, 0, sizeof(buf));
        v377 = 0u;
        v376 = 0u;
        v375 = 0u;
        v374 = 0u;
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v370 = 0u;
        v369 = 0u;
        v368 = 0u;
        v367 = 0u;
        v365 = 0u;
        v366 = 0u;
        v363 = 0u;
        v364 = 0u;
        v361 = 0u;
        v362 = 0u;
        v359 = 0u;
        v360 = 0u;
        v357 = 0u;
        v358 = 0u;
        *(_OWORD *)v356 = 0u;
        if (v307 && v62 != -1)
        {
          *(_QWORD *)input = 1;
          v63 = IOConnectCallScalarMethod(v62, 0x10u, (const uint64_t *)input, 1u, 0, 0);
          v64 = v63 == -536870183 ? -2 : -1;
          if (v63)
          {
            v65 = *(NSObject **)(v3 + 3920);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)input = 67109120;
              *(_DWORD *)&input[4] = v64;
              _os_log_impl(&dword_231046000, v65, OS_LOG_TYPE_DEFAULT, "cannot enable gauge interrupts (%d)", input, 8u);
            }
          }
        }
        LODWORD(refCon) = 0;
        if (v57)
        {
          v66 = *(_DWORD *)(v2 + 1416);
          if (v66)
          {
            v67 = v66 - 1;
          }
          else
          {
            if (v59 == 0.0)
              goto LABEL_81;
            v68 = *(NSObject **)(v3 + 3920);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              v69 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)input = 67109632;
              *(_DWORD *)&input[4] = v57;
              *(_WORD *)&input[8] = 2048;
              *(double *)&input[10] = v69 - v59;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = gRestrictLogCounter;
              _os_log_impl(&dword_231046000, v68, OS_LOG_TYPE_DEFAULT, "failure last_update_failed_counter=%d last_success at %g, supressing %d subsequent errors", input, 0x18u);
            }
            v67 = gRestrictLogCounter;
          }
          *(_DWORD *)(v2 + 1416) = v67;
        }
LABEL_81:
        v70 = v61 != -1;
        v71 = v61 < 50;
        v72 = v70 && v71;
        if (v70 && v71)
          v73 = 5.0;
        else
          v73 = 20.0;
        if ((v56 & 1) != 0)
        {
LABEL_526:
          IOObjectRelease(v6);
          MEMORY[0x2348CEB54](v300, 0, *MEMORY[0x24BDAEC58], v293);
          IOServiceClose(v300);
          *(_DWORD *)(v2 + 1416) = 0;
          v261 = *(NSObject **)(v3 + 3920);
          if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_231046000, v261, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread terminated", buf, 2u);
          }
          return 0;
        }
        if (!(v58 | v57))
          goto LABEL_122;
        v74 = CFAbsoluteTimeGetCurrent();
        if (debug_polling && (v75 = *(NSObject **)(v3 + 3920), os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)))
        {
          *(_DWORD *)input = 136316418;
          *(_QWORD *)&input[4] = "updateThread";
          *(_WORD *)&input[12] = 1024;
          *(_DWORD *)&input[14] = 2802;
          *(_WORD *)&input[18] = 1024;
          *(_DWORD *)&input[20] = v58;
          *(_WORD *)&input[24] = 1024;
          *(_DWORD *)&input[26] = v55 & 1;
          *(_WORD *)&input[30] = 2048;
          *(double *)&input[32] = v74;
          *(_WORD *)&input[40] = 2048;
          *(double *)&input[42] = v60;
          _os_log_debug_impl(&dword_231046000, v75, OS_LOG_TYPE_DEBUG, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f *** ", input, 0x32u);
          if ((v55 & 1) == 0)
          {
LABEL_92:
            v60 = v73 + v74;
            goto LABEL_93;
          }
        }
        else if ((v55 & 1) == 0)
        {
          goto LABEL_92;
        }
        v73 = 0.0;
        if (v74 < v60)
          v73 = v60 - v74;
LABEL_93:
        if (debug_polling)
        {
          v76 = *(NSObject **)(v3 + 3920);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)input = 136316674;
            *(_QWORD *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2860;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v58;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = v55 & 1;
            *(_WORD *)&input[30] = 2048;
            *(double *)&input[32] = v74;
            *(_WORD *)&input[40] = 2048;
            *(double *)&input[42] = v60;
            *(_WORD *)&input[50] = 2048;
            v354 = v73;
            _os_log_error_impl(&dword_231046000, v76, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f update_interval=%f *** ", input, 0x3Cu);
          }
        }
        if (v73 == 0.0)
        {
          v55 = 0;
          LODWORD(refCon) = 0;
LABEL_121:
          LOBYTE(v55) = v55 != 0;
          goto LABEL_122;
        }
        if (CFRunLoopRunInMode(mode, v73, 1u) != kCFRunLoopRunHandledSource)
        {
          v55 = 0;
          goto LABEL_121;
        }
        v55 = 0;
        v77 = refCon;
        v78 = 1;
        if ((int)refCon > -536870145)
        {
          if ((_DWORD)refCon == -536870144 || (_DWORD)refCon == -536723200)
            goto LABEL_113;
          v79 = -469794560;
        }
        else
        {
          if ((refCon + 536870288) <= 0x20
            && ((1 << (refCon - 112)) & 0x100010001) != 0)
          {
            goto LABEL_113;
          }
          v79 = -536870320;
        }
        if ((_DWORD)refCon != v79)
        {
          v78 = debug_polling;
          if (debug_polling)
          {
            v80 = *(NSObject **)(v3 + 3920);
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)input = 136315906;
              *(_QWORD *)&input[4] = "updateThread";
              *(_WORD *)&input[12] = 1024;
              *(_DWORD *)&input[14] = 2879;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = v58;
              *(_WORD *)&input[24] = 1024;
              *(_DWORD *)&input[26] = v77;
              _os_log_error_impl(&dword_231046000, v80, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x  (ign) *** ", input, 0x1Eu);
            }
            v78 = 0;
            v55 = 1;
          }
          else
          {
            v55 = 1;
          }
        }
LABEL_113:
        if (v77 > -536870145)
        {
          if (v77 == -536870144 || v77 == -469794560)
            goto LABEL_121;
          v81 = -536723200;
        }
        else
        {
          if ((v77 + 536870288) <= 0x20 && ((1 << (v77 - 112)) & 0x100010001) != 0)
            goto LABEL_121;
          v81 = -536870320;
        }
        if (v77 == v81)
          goto LABEL_121;
        if (v78)
        {
LABEL_122:
          if (debug_polling && (v82 = *(NSObject **)(v3 + 3920), os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)input = 136316162;
            *(_QWORD *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2897;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v58;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = refCon;
            *(_WORD *)&input[30] = 1024;
            *(_DWORD *)&input[32] = v308 & 1;
            _os_log_error_impl(&dword_231046000, v82, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x system_sleep=%d *** ", input, 0x24u);
            if (v58)
              goto LABEL_125;
LABEL_126:
            CFProperty = IORegistryEntryCreateCFProperty(v6, CFSTR("AdapterInfo"), allocator, 0);
            v85 = IORegistryEntryCreateCFProperty(v6, CFSTR("AppleRawExternalConnected"), allocator, 0);
            LODWORD(keys[0]) = 0;
            if (CFProperty)
            {
              v86 = CFGetTypeID(CFProperty);
              if (v86 == CFNumberGetTypeID())
                CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt32Type, keys);
              CFRelease(CFProperty);
              v87 = (int)keys[0];
              if (v306 != (LODWORD(keys[0]) == 0))
              {
LABEL_132:
                v88 = v302 ^ (v85 != v305);
                goto LABEL_133;
              }
              v88 = 0;
            }
            else
            {
              v87 = 0;
              v88 = 0;
              if (!v306)
                goto LABEL_132;
            }
LABEL_133:
            if (debug_polling)
            {
              v89 = logger;
              if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)input = 136316418;
                *(_QWORD *)&input[4] = "updateThread";
                *(_WORD *)&input[12] = 1024;
                *(_DWORD *)&input[14] = 2921;
                *(_WORD *)&input[18] = 1024;
                *(_DWORD *)&input[20] = v58;
                *(_WORD *)&input[24] = 1024;
                *(_DWORD *)&input[26] = v88 & 1;
                *(_WORD *)&input[30] = 1024;
                *(_DWORD *)&input[32] = v87;
                *(_WORD *)&input[36] = 1024;
                *(_DWORD *)&input[38] = v85 == v305;
                _os_log_impl(&dword_231046000, v89, OS_LOG_TYPE_DEFAULT, "*** %s:%d updatesDone=%d same_adaptor=%d adaptor_type=%d external_connected=%d *** ", input, 0x2Au);
              }
            }
            if ((v88 & (v58 != 0)) != 1 || v73 == 0.0)
            {
              v90 = (int)keys[0];
              v306 = LODWORD(keys[0]) != 0;
              v302 = v85 == v305;
              v2 = 0x25414D000;
              if (v85)
                CFRelease(v85);
              if (v90 != 0 && v301)
              {
                setUPOData(CFSTR("IOPMUBootUPOState"), 0);
                v301 = 0;
              }
              ++debug_cnt_ut_recv;
              v83 = refCon;
              v3 = 0x255EB2000uLL;
              goto LABEL_147;
            }
            v2 = 0x25414D000;
            if (v85)
              CFRelease(v85);
            v56 = 0;
            v62 = -1;
            LOBYTE(v55) = 1;
LABEL_141:
            v3 = 0x255EB2000;
          }
          else
          {
            if (!v58)
              goto LABEL_126;
LABEL_125:
            v83 = refCon;
            if ((_DWORD)refCon == -536723200)
              goto LABEL_126;
LABEL_147:
            if (v83 == -469794560)
            {
              LOBYTE(v55) = 1;
              if (v73 != 0.0)
                v72 = 1;
            }
            if ((v308 & (v83 != -536870144)) != 0)
            {
LABEL_156:
              v56 = 0;
              v62 = -1;
              v308 = 1;
            }
            else if (v83 == -536870288)
            {
              IOAllowPowerChange(kernelPort, notificationID);
              v56 = 0;
              v62 = -1;
              LOBYTE(v55) = 1;
            }
            else
            {
              if (v57 && v83 == -536870272)
              {
                IOAllowPowerChange(kernelPort, notificationID);
                goto LABEL_156;
              }
              if (v300 == -1)
              {
                v56 = 0;
                ++v57;
                goto LABEL_166;
              }
              if (v83 == -536870144)
              {
                if (v296)
                  updateThermalCoolDownState(notification[1], 0);
                v296 = 0;
                if ((v308 & 1) != 0)
                {
                  v308 = 0;
                  qword_255EB38C8 = time(0);
                }
                else
                {
                  v308 = 0;
                }
              }
              hdq_state = ggctl_get_hdq_state(v300);
              if (hdq_state == -2)
              {
                v56 = 1;
                goto LABEL_444;
              }
              if (hdq_state)
              {
                if (hdq_state < 0)
                {
                  if (os_log_type_enabled(*(os_log_t *)(v3 + 3920), OS_LOG_TYPE_ERROR))
                    updateThread_cold_2(&v329, v330);
                  v56 = 0;
                  goto LABEL_443;
                }
                v95 = hdqBreak(v300);
                if (v95 != -2)
                {
                  if (v95 < 0)
                  {
                    v96 = v3;
                    v97 = ++updateThread_debug_break_failures;
                    v98 = *(NSObject **)(v96 + 3920);
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)input = 136315906;
                      *(_QWORD *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3024;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v97;
                      *(_WORD *)&input[24] = 1024;
                      *(_DWORD *)&input[26] = -1;
                      _os_log_error_impl(&dword_231046000, v98, OS_LOG_TYPE_ERROR, "%s:%d break failed break_failures=%d (%d)", input, 0x1Eu);
                      v97 = updateThread_debug_break_failures;
                    }
                    if ((-858993459 * v97) <= 0x33333333)
                    {
                      statsAndLogs(notification[1], 0);
                      v3 = 0x255EB2000uLL;
                    }
                    else
                    {
                      v99 = -1227133513 * v97;
                      v3 = 0x255EB2000;
                      if (v99 <= 0x24924924)
                        debugLog(notification[1], 63);
                    }
                  }
                  else if (updateThread_debug_break_failures)
                  {
                    statsAndLogs(notification[1], 1);
                    debugLog(notification[1], 0);
                    updateThread_debug_break_failures = 0;
                  }
                }
                if (v307)
                {
                  if (v58)
                  {
                    v100 = gaugeDisableInterrupts(v300);
                    if (v100 < 0)
                    {
                      v101 = v100;
                      v102 = *(NSObject **)(v3 + 3920);
                      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)input = 136315650;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3044;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v101;
                        _os_log_error_impl(&dword_231046000, v102, OS_LOG_TYPE_ERROR, "%s:%d cannot disable gauge interrupts (%d)", input, 0x18u);
                      }
                    }
                  }
                }
                if ((_DWORD)refCon == -536870272)
                {
                  v108 = OSThermalNotificationCurrentLevel();
                  v296 = v108 > 14;
                  v2 = 0x25414D000;
                  if (v108 >= 15)
                    updateThermalCoolDownState(notification[1], 1);
                  IOAllowPowerChange(kernelPort, notificationID);
                  v56 = 0;
                  v308 = 1;
                  goto LABEL_444;
                }
                v2 = 0x25414D000;
                if ((_DWORD)refCon == -536870320)
                  goto LABEL_526;
                if (v58)
                {
                  v275 = 0;
                  goto LABEL_203;
                }
                if ((getFWVersion(v300, &word_255EB3806) & 0x80000000) != 0)
                {
                  v56 = 0;
                  v58 = 0;
                  ++v57;
                  v62 = v300;
                }
                else
                {
                  v109 = CFNumberCreate(allocator, kCFNumberIntType, &word_255EB3806);
                  if (v109)
                  {
                    v110 = v109;
                    IORegistryEntrySetCFProperty(v6, CFSTR("GasGaugeFirmwareVersion"), v109);
                    CFRelease(v110);
                  }
                  v111 = (unsigned __int16)word_255EB3806;
                  v112 = (unsigned __int16)word_255EB3806 - 1281 < 2;
                  *v293 = (unsigned __int16)word_255EB3806 > 0x131u;
                  if (v111 == 265)
                  {
                    v113 = logger;
                    v292 = 0;
                    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)input = 0;
                      _os_log_impl(&dword_231046000, v113, OS_LOG_TYPE_DEFAULT, "gas gauge firmware 1.09: disabling critical battery shutdown", input, 2u);
                      v292 = 0;
                    }
                  }
                  LOBYTE(v288) = v288 | v112;
                  keys[0] = 0;
                  if ((readChargeTable(v300, (__CFData **)keys) & 0x80000000) != 0)
                  {
                    v56 = 0;
                    v58 = 0;
                    ++v57;
                    v62 = v300;
                    goto LABEL_141;
                  }
                  v3 = 0x255EB2000uLL;
                  if (keys[0])
                  {
                    *(void **)buf = keys[0];
                    v356[0] = CFSTR("ChargeTable");
                    v275 = 1;
                  }
                  else
                  {
                    v275 = 0;
                  }
                  if (dword_255EB38D8)
                    v114 = dword_255EB38D8;
                  else
                    v114 = 2;
                  Block = ggctl_readBlock(v300, -1, v114, updateThread_batteryInfo, 0);
                  if (Block < 0)
                    strcpy((char *)updateThread_batteryInfo, "000000");
                  if ((v287 & 1) != 0)
                  {
                    byte_255EB3808 = dword_255EB3978;
                    if ((_BYTE)dword_255EB3978)
                    {
                      LOBYTE(v287) = 1;
                    }
                    else
                    {
                      v158 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        *(_QWORD *)input = 67109376;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = Block;
                        _os_log_error_impl(&dword_231046000, v158, OS_LOG_TYPE_ERROR, "disabled passedCharge PCFF=%d err=%d", input, 0xEu);
                      }
                      LOBYTE(v287) = 0;
                      v2 = 0x25414D000;
                    }
                  }
                  else
                  {
                    LOBYTE(v287) = 0;
                  }
                  if (byte_255EB3824)
                    word_255EB3804 = 136;
                  if (hdqReadS16(v300, 60, &word_255EB3802))
                    word_255EB3802 = 0;
                  if (controlReadU16(v300, 8, &word_255EB3800))
                  {
                    word_255EB3800 = 0;
                    v271 = 0;
                    v272 = 1;
                    v106 = v275;
LABEL_280:
                    v327 = v58 < 16;
                    *(_QWORD *)&buf[8 * v106] = CFNumberCreate(allocator, kCFNumberIntType, &v327);
                    v356[v106] = CFSTR("ForceFullGGUpdateOnBoot");
                    HIDWORD(v130) = -1431655764 * v58 + 143165576;
                    LODWORD(v130) = HIDWORD(v130);
                    v131 = (v130 >> 2) < 0x4444445 && v58 < 16;
                    if (v131)
                    {
                      v132 = 1;
                    }
                    else
                    {
                      HIDWORD(v133) = -1813430636 * v58 + 9544368;
                      LODWORD(v133) = HIDWORD(v133);
                      v132 = (v133 >> 4) < 0x123457;
                    }
                    v276 = (os_log_t)v106;
                    if (debug_polling)
                    {
                      v134 = v132;
                      v135 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 136316418;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3254;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v58;
                        *(_WORD *)&input[24] = 1024;
                        *(_DWORD *)&input[26] = v134;
                        *(_WORD *)&input[30] = 1024;
                        *(_DWORD *)&input[32] = v131;
                        *(_WORD *)&input[36] = 1024;
                        *(_DWORD *)&input[38] = v58 < 16;
                        _os_log_impl(&dword_231046000, v135, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d, fullUpdate=%d, bootFullUpdate=%d, forceFullUpdate=%d] ", input, 0x2Au);
                        v136 = debug_polling;
                      }
                      else
                      {
                        v136 = 1;
                      }
                      if (v58)
                        v137 = v134;
                      else
                        v137 = 0;
                      v3 = 0x255EB2000uLL;
                      v132 = v134;
                      if (v136)
                      {
                        v106 = (uint64_t)v276;
                        if (v137)
                        {
                          v137 = 1;
                          statsAndLogs(notification[1], 1);
                        }
                      }
                      else
                      {
                        v106 = (uint64_t)v276;
                      }
                    }
                    else
                    {
                      if (v58)
                        v137 = v132;
                      else
                        v137 = 0;
                      v3 = 0x255EB2000;
                    }
                    if (v272)
                    {
LABEL_439:
                      if (*v293 && *(_DWORD *)(v289 + 4))
                        ++*(_DWORD *)(v289 + 28);
                      v56 = 0;
                      ++debug_cnt_ut_err;
LABEL_443:
                      ++v57;
                      goto LABEL_444;
                    }
                    v264 = v132;
                    if (debug_polling)
                    {
                      v138 = *(NSObject **)(v3 + 3920);
                      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 136315650;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3295;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v58;
                        _os_log_impl(&dword_231046000, v138, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d POLLING THE BATTERY", input, 0x18u);
                      }
                    }
                    v139 = (v106 + 1);
                    v140 = !v295;
                    if (!v58)
                      v140 = 1;
                    v269 = v140;
                    if (v140 != 1)
                      goto LABEL_317;
                    v141 = (v106 + 1);
                    if (v264)
                      v142 = 18;
                    else
                      v142 = 10;
                    BatteryData = readBatteryData((uint64_t)&updateThread_updates, v142, v300);
                    if (BatteryData == (_DWORD)v142)
                    {
                      calculateBatteryHealthMetric();
                      v139 = v141;
                      goto LABEL_317;
                    }
                    v273 = BatteryData;
                    log = *(NSObject **)(v3 + 3920);
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)input = 67109376;
                      *(_DWORD *)&input[4] = v142;
                      *(_WORD *)&input[8] = 1024;
                      *(_DWORD *)&input[10] = v273;
                      _os_log_impl(&dword_231046000, log, OS_LOG_TYPE_DEFAULT, "cannot read battery data count=%d (err=%d)", input, 0xEu);
                    }
                    calculateBatteryHealthMetric();
                    v139 = v141;
                    LODWORD(ChargerData) = v273;
                    if (v273)
                    {
                      v145 = 0;
                    }
                    else
                    {
LABEL_317:
                      v146 = word_255EB380A;
                      v147 = word_255EB3812;
                      if (word_255EB3812)
                        v148 = 0;
                      else
                        v148 = word_255EB380A == 3600;
                      v149 = (unsigned __int16)word_255EB383A;
                      if (v148 || (unsigned __int16)word_255EB383A == 0xFFFF)
                      {
                        logb = v139;
                        v157 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 67110144;
                          *(_DWORD *)&input[4] = v149;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = word_255EB3814;
                          *(_WORD *)&input[14] = 1024;
                          *(_DWORD *)&input[16] = word_255EB380C;
                          *(_WORD *)&input[20] = 1024;
                          *(_DWORD *)&input[22] = v146;
                          *(_WORD *)&input[26] = 1024;
                          *(_DWORD *)&input[28] = v147;
                          _os_log_impl(&dword_231046000, v157, OS_LOG_TYPE_DEFAULT, "gas gauge reset detected (flags %#x capacity %d/%dmAh voltage %dmV current %dmA)", input, 0x20u);
                        }
                        v145 = 0;
                        LODWORD(ChargerData) = -1;
                        v3 = 0x255EB2000;
                        v139 = logb;
                      }
                      else
                      {
                        if (!v58 && v342)
                        {
                          loga = v139;
                          v342 = 0;
                          v150 = word_255EB380C;
                          v151 = 100 * (word_255EB380C / 100) + 100;
                          v152 = logger;
                          v153 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                          v154 = v151;
                          v155 = v151;
                          if (v153)
                          {
                            *(_QWORD *)input = 67110144;
                            v156 = ((26215 * v151) >> 18) + ((26215 * v151) >> 31);
                            *(_WORD *)&input[8] = 1024;
                            *(_DWORD *)&input[10] = v150;
                            *(_WORD *)&input[14] = 1024;
                            *(_DWORD *)&input[16] = word_255EB3814;
                            *(_WORD *)&input[20] = 1024;
                            *(_DWORD *)&input[22] = v155;
                            *(_WORD *)&input[26] = 1024;
                            *(_DWORD *)&input[28] = ((26215 * v155) >> 18) + ((26215 * v155) >> 31);
                            _os_log_impl(&dword_231046000, v152, OS_LOG_TYPE_DEFAULT, "mask real UPOState=%x FCC=%d RemCap=%d new FCC=%d new RemCap=%d", input, 0x20u);
                          }
                          else
                          {
                            v156 = ((26215 * v151) >> 18) + ((26215 * v151) >> 31);
                          }
                          word_255EB380C = v154;
                          word_255EB3814 = v156;
                          v139 = loga;
                        }
                        if (((v269 ^ 1) & 1) != 0)
                        {
                          LODWORD(ChargerData) = 0;
                          v159 = v302;
                        }
                        else
                        {
                          v159 = v302;
                          if (v302)
                            v160 = 24;
                          else
                            v160 = 22;
                          LODWORD(ChargerData) = hdqReadS16(v300, v160, &word_255EB3816);
                        }
                        v145 = (_DWORD)ChargerData == 0;
                        v161 = (_DWORD)ChargerData != 0;
                        if ((v294 & 2) == 0)
                          v161 = 1;
                        if ((v161 || !v159) | (v269 ^ 1) & 1)
                        {
                          v3 = 0x255EB2000;
                        }
                        else
                        {
                          ChargerData = readChargerData(v288 & 1, v287 & 1, v300);
                          *(_QWORD *)&buf[8 * (_QWORD)v139] = ChargerData;
                          v3 = 0x255EB2000uLL;
                          if (ChargerData)
                          {
                            if (v284)
                              CFShow(ChargerData);
                            LODWORD(ChargerData) = 0;
                            v356[(_QWORD)v139] = CFSTR("ChargerData");
                            v139 = ((char *)&v276->isa + 2);
                          }
                        }
                      }
                    }
                    v274 = (int)ChargerData;
                    v277 = v145;
                    if (v145 && (unsigned __int16)word_255EB3806 >= 0x501u)
                    {
                      v326 = (unsigned __int16)word_255EB380E;
                      *(_QWORD *)&buf[8 * (_QWORD)v139] = CFNumberCreate(allocator, kCFNumberIntType, &v326);
                      v356[(_QWORD)v139] = CFSTR("NominalChargeCapacity");
                      v162 = ((char *)&v139->isa + 1);
                    }
                    else
                    {
                      v162 = v139;
                    }
                    if (debug_polling)
                    {
                      v163 = *(NSObject **)(v3 + 3920);
                      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 67109376;
                        *(_DWORD *)&input[4] = dword_255EB3980;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = dword_255EB39C4;
                        _os_log_impl(&dword_231046000, v163, OS_LOG_TYPE_DEFAULT, "determineVACVoltage, vacLevelCount=%d, vac95LevelCount=%d", input, 0xEu);
                      }
                    }
                    v164 = v302;
                    v263 = v137;
                    if (!byte_255EB3824 || v58 != 0 && !v302)
                    {
                      if (v282 && (v58 == 0 || v302))
                      {
                        v170 = determineVACVoltage();
                        if (v170 != dword_255EB3828)
                        {
                          v171 = v170;
                          dword_255EB3828 = v170;
                          v172 = *(NSObject **)(v3 + 3920);
                          if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v171;
                            _os_log_impl(&dword_231046000, v172, OS_LOG_TYPE_DEFAULT, "Added atvAbsMaxVoltageMV=%u to battery dict", input, 8u);
                            v171 = dword_255EB3828;
                          }
                          v167 = allocator;
                          v325 = v171;
                          v166 = v162;
                          *(_QWORD *)&buf[8 * (_QWORD)v162] = CFNumberCreate(allocator, kCFNumberIntType, &v325);
                          v169 = CFSTR("atvAbsMaxVoltageMV");
                          v164 = v302;
                          v168 = v269;
LABEL_375:
                          v356[(_QWORD)v166] = (void *)v169;
                          v166 = ((char *)v166 + 1);
                          goto LABEL_376;
                        }
                        v164 = v302;
                      }
                      v167 = allocator;
                      v166 = v162;
                      goto LABEL_371;
                    }
                    v165 = dynamicATV(v300);
                    v166 = v162;
                    *(_QWORD *)&buf[8 * (_QWORD)v162] = v165;
                    v167 = allocator;
                    if (v165)
                    {
                      v168 = v269;
                      if (v284)
                        CFShow(v165);
                      v169 = CFSTR("AppleDynamicATV");
                      goto LABEL_375;
                    }
LABEL_371:
                    v168 = v269;
LABEL_376:
                    v173 = v277;
                    if ((v294 & 2) != 0)
                      v173 = 0;
                    if ((v168 & (v173 && v164)) == 1)
                    {
                      *(_QWORD *)input = 0;
                      keys[0] = 0;
                      *(_QWORD *)input = CFNumberCreate(v167, kCFNumberIntType, &dword_255EB3828);
                      keys[0] = CFSTR("ChargingVoltage");
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFDictionaryCreate(v167, (const void **)keys, (const void **)input, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      v356[(_QWORD)v166] = CFSTR("ChargerData");
                      v166 = ((char *)v166 + 1);
                      CFRelease(*(CFTypeRef *)input);
                    }
                    if (dword_255EB3A08)
                    {
                      v174 = determinePoSMThreshold();
                      if (v174 != dword_255EB3830)
                        dword_255EB3830 = v174;
                      *(_DWORD *)input = HIWORD(v174);
                      LODWORD(keys[0]) = (unsigned __int16)v174;
                      if ((unsigned __int16)v174 == 0xFFFF || HIWORD(v174) == 0xFFFF)
                        v176 = 0;
                      else
                        v176 = dword_255EB3A08;
                      *(_DWORD *)v346 = v176;
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFNumberCreate(v167, kCFNumberIntType, v346);
                      v356[(_QWORD)v166] = CFSTR("PoSMEnabled");
                      v177 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v178 = 8 * (_QWORD)v166 + 8;
                      *(_QWORD *)&buf[v178] = v177;
                      *(void **)((char *)v356 + v178) = CFSTR("PoSMUpperThreshold");
                      v166 = ((char *)v166 + 2);
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFNumberCreate(allocator, kCFNumberIntType, keys);
                      v356[(_QWORD)v166] = CFSTR("PoSMLowerThreshold");
                    }
                    else
                    {
                      *(_DWORD *)input = 0;
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFNumberCreate(v167, kCFNumberIntType, input);
                      v356[(_QWORD)v166] = CFSTR("PoSMEnabled");
                    }
                    if ((v277 & v294) != 0)
                      U16 = 0;
                    else
                      U16 = v274;
                    if ((v168 & v277 & v294) == 1)
                      U16 = hdqReadU16(v300, 110, &word_255EB3818);
                    v3 = 0x255EB2000uLL;
                    v2 = 0x25414D000;
                    v181 = v271;
                    v182 = v166;
                    v183 = (unint64_t)&v166->isa + 1;
                    if (!U16)
                    {
                      v184 = v182;
                      logc = v182;
                      v324 = 10 * word_255EB3810 - 27320;
                      *(_QWORD *)&buf[8 * v183] = CFNumberCreate(allocator, kCFNumberIntType, &v324);
                      v356[v183] = CFSTR("Temperature");
                      v323 = word_255EB3812;
                      v185 = CFNumberCreate(allocator, kCFNumberIntType, &v323);
                      v186 = 8 * (_QWORD)v184;
                      v187 = 8 * (_QWORD)v184 + 16;
                      *(_QWORD *)&buf[v187] = v185;
                      *(void **)((char *)v356 + v187) = CFSTR("Amperage");
                      v322 = word_255EB380A;
                      v188 = CFNumberCreate(allocator, kCFNumberIntType, &v322);
                      v189 = 8 * (_QWORD)v184 + 24;
                      *(_QWORD *)&buf[v189] = v188;
                      *(void **)((char *)v356 + v189) = CFSTR("Voltage");
                      v321 = word_255EB3816;
                      v190 = CFNumberCreate(allocator, kCFNumberIntType, &v321);
                      v191 = 8 * (_QWORD)v184 + 32;
                      *(_QWORD *)&buf[v191] = v190;
                      *(void **)((char *)v356 + v191) = CFSTR("TimeRemaining");
                      v61 = word_255EB3814;
                      v320 = word_255EB3814;
                      v192 = CFNumberCreate(allocator, kCFNumberIntType, &v320);
                      v193 = v186 + 40;
                      *(_QWORD *)&buf[v193] = v192;
                      *(void **)((char *)v356 + v193) = CFSTR("CurrentCapacity");
                      v319 = word_255EB380C;
                      v194 = CFNumberCreate(allocator, kCFNumberIntType, &v319);
                      v195 = v186 + 48;
                      *(_QWORD *)&buf[v195] = v194;
                      *(void **)((char *)v356 + v195) = CFSTR("MaxCapacity");
                      HIWORD(v196) = -18304;
                      LOWORD(v196) = word_255EB3836;
                      *(_DWORD *)input = llroundf((float)((float)((float)word_255EB381A * -0.000061035) + 1.0) * (float)v196);
                      v197 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v198 = v186 + 56;
                      *(_QWORD *)&buf[v198] = v197;
                      *(void **)((char *)v356 + v198) = CFSTR("AbsoluteCapacity");
                      v199 = v305;
                      if (!v271)
                        v199 = v291;
                      v200 = v186 + 64;
                      *(_QWORD *)&buf[v200] = v199;
                      *(void **)((char *)v356 + v200) = CFSTR("AtCriticalLevel");
                      v318 = (unsigned __int16)word_255EB383A;
                      v201 = CFNumberCreate(allocator, kCFNumberIntType, &v318);
                      v202 = v186 + 72;
                      *(_QWORD *)&buf[v202] = v201;
                      *(void **)((char *)v356 + v202) = CFSTR("AppleRawBatteryFlags");
                      v203 = (char *)&logc[1].isa + 2;
                      if ((v294 & 1) != 0)
                      {
                        v317 = (unsigned __int16)word_255EB3818;
                        *(_QWORD *)&buf[8 * (_QWORD)v203] = CFNumberCreate(allocator, kCFNumberIntType, &v317);
                        v356[(_QWORD)v203] = CFSTR("ITMiscStatus");
                        v316 = word_255EB3818 & 3;
                        v204 = CFNumberCreate(allocator, kCFNumberIntType, &v316);
                        v205 = v186 + 88;
                        *(_QWORD *)&buf[v205] = v204;
                        *(void **)((char *)v356 + v205) = CFSTR("ITSimulationCounter");
                        v315 = ((unsigned __int16)word_255EB3818 >> 2) & 3;
                        v206 = CFNumberCreate(allocator, kCFNumberIntType, &v315);
                        v207 = v186 + 96;
                        *(_QWORD *)&buf[v207] = v206;
                        *(void **)((char *)v356 + v207) = CFSTR("RaUpdateCounter");
                        v203 = (char *)&logc[1].isa + 5;
                      }
                      v314 = word_255EB383A & 0x80;
                      *(_QWORD *)&buf[8 * (_QWORD)v203] = CFNumberCreate(allocator, kCFNumberIntType, &v314);
                      v356[(_QWORD)v203] = CFSTR("OCVTakenFlag");
                      v313 = word_255EB383A & 0x200;
                      v208 = CFNumberCreate(allocator, kCFNumberIntType, &v313);
                      v209 = 8 * (_QWORD)v203 + 8;
                      *(_QWORD *)&buf[v209] = v208;
                      *(void **)((char *)v356 + v209) = CFSTR("FCFlag");
                      v183 = (unint64_t)(v203 + 2);
                      if (!v264)
                        goto LABEL_406;
                      v312 = (unsigned __int16)word_255EB3834;
                      *(_QWORD *)&buf[8 * v183] = CFNumberCreate(allocator, kCFNumberIntType, &v312);
                      v356[v183] = CFSTR("CycleCount");
                      v311 = word_255EB3802;
                      v210 = CFNumberCreate(allocator, kCFNumberIntType, &v311);
                      v211 = 8 * (_QWORD)v203 + 24;
                      *(_QWORD *)&buf[v211] = v210;
                      *(void **)((char *)v356 + v211) = CFSTR("DesignCapacity");
                      v183 = (unint64_t)(v203 + 4);
                      v212 = parseBatteryData(v294 & 1, v280);
                      *(_QWORD *)&buf[8 * (_QWORD)(v203 + 4)] = v212;
                      if (v212)
                      {
                        U16 = 0;
                        if (v284)
                          CFShow(v212);
                        v356[v183] = CFSTR("BatteryData");
                        v183 = (unint64_t)(v203 + 5);
                        v181 = v271;
                      }
                      else
                      {
LABEL_406:
                        v181 = v271;
                        U16 = 0;
                      }
                      v2 = 0x25414D000;
                    }
                    if (v286 && (updateThread_oneTime & 1) == 0)
                    {
                      v352 = 0u;
                      memset(input, 0, sizeof(input));
                      *(_OWORD *)keys = 0u;
                      v351 = 0u;
                      if (ggctl_logShutdownReason(v300, (uint64_t)input, 1u) || !*(_QWORD *)&input[40])
                      {
                        v215 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v346 = 136315394;
                          v347 = "updateThread";
                          v348 = 1024;
                          v349 = 3577;
                          _os_log_impl(&dword_231046000, v215, OS_LOG_TYPE_DEFAULT, "%s:%d  Error Reading Shutdown reason", v346, 0x12u);
                        }
                      }
                      else
                      {
                        ggctl_logShutdownReason2(v300, keys, 1u);
                        v213 = parseShutdownReason((__int16 *)input, (const UInt8 *)keys, v300);
                        if (v213)
                        {
                          v214 = v213;
                          if (v284)
                            CFShow(v213);
                          *(_QWORD *)&buf[8 * v183] = v214;
                          v356[v183++] = CFSTR("BatteryShutdownReason");
                        }
                        memset(input, 0, sizeof(input));
                        ggctl_logShutdownReason(v300, (uint64_t)input, 0);
                        *(_OWORD *)keys = 0u;
                        v351 = 0u;
                        v352 = 0u;
                        ggctl_logShutdownReason2(v300, keys, 0);
                      }
                      v2 = 0x25414D000;
                      updateThread_oneTime = 1;
                      v181 = v271;
                    }
                    if (v181)
                    {
                      readIMAXAndSOCSmoothData(byte_255EB389E, v179, v300);
                      logBatteryDiagnosticData((uint64_t)updateThread_batteryInfo, v300, v286 != 0);
                    }
                    if (!U16)
                    {
                      v216 = CFDictionaryCreate(allocator, (const void **)v356, (const void **)buf, v183, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      if (v216)
                      {
                        v217 = v216;
                        if (v284)
                          CFShow(v216);
                        if (debug_polling)
                        {
                          v218 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 136315650;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3600;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v58;
                            _os_log_impl(&dword_231046000, v218, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d PUBLISHING BATTERY data", input, 0x18u);
                          }
                        }
                        v219 = v217;
                        U16 = IORegistryEntrySetCFProperties(v6, v217);
                        if (U16)
                        {
                          v278 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = U16;
                            _os_log_error_impl(&dword_231046000, v278, OS_LOG_TYPE_ERROR, "IORegistryEntrySetCFProperties(0x%x)", input, 8u);
                          }
                        }
                        CFRelease(v219);
                        ++debug_cnt_ut_sent;
                      }
                      else
                      {
                        v220 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 136315650;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3608;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v58;
                          _os_log_error_impl(&dword_231046000, v220, OS_LOG_TYPE_ERROR, "%s:%d  updatesDone=%d dictionary failed", input, 0x18u);
                        }
                        U16 = 0;
                      }
                      v2 = 0x25414D000;
                    }
                    do
                      CFRelease(*(CFTypeRef *)&buf[8 * v183 - 8]);
                    while (v183-- > 1);
                    if (U16)
                      goto LABEL_439;
                    if (v295)
                    {
                      if ((v283 & 1) != 0)
                      {
                        S16 = controlReadS16(v300, 25, 0);
                        if (S16)
                        {
                          v223 = S16;
                          v224 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v223;
                            _os_log_error_impl(&dword_231046000, v224, OS_LOG_TYPE_ERROR, "CCA: usermode cannot disable DLOG (%#x)", input, 8u);
                          }
                          LOBYTE(v283) = 1;
                        }
                        else
                        {
                          LOBYTE(v283) = 0;
                          *(_DWORD *)(v289 + 24) = 0;
                          *(_DWORD *)(v289 + 16) = 0;
                          *(_QWORD *)(v289 + 8) = 0;
                        }
                        goto LABEL_516;
                      }
                      LOBYTE(v283) = 0;
LABEL_517:
                      if (*(_DWORD *)(v2 + 1416))
                      {
                        *(_DWORD *)(v2 + 1416) = 0;
                        v255 = logger;
                        v256 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if (v59 == 0.0)
                        {
                          if (v256)
                          {
                            *(_WORD *)input = 0;
                            v257 = v255;
                            v258 = "gasgauge success after previous failure";
                            v259 = 2;
                            goto LABEL_523;
                          }
                        }
                        else if (v256)
                        {
                          v260 = CFAbsoluteTimeGetCurrent();
                          *(_DWORD *)input = 134217984;
                          *(double *)&input[4] = v260 - v59;
                          v257 = v255;
                          v258 = "gasgauge success after previous %gs failure";
                          v259 = 12;
LABEL_523:
                          _os_log_impl(&dword_231046000, v257, OS_LOG_TYPE_DEFAULT, v258, input, v259);
                        }
                      }
                      v59 = CFAbsoluteTimeGetCurrent();
                      v56 = 0;
                      v57 = 0;
                      word_255EB38BE = word_255EB380A;
                      word_255EB38C0 = word_255EB3812;
                      dword_255EB38C2 = *(_DWORD *)&word_255EB380C;
                      word_255EB38C6 = word_255EB3814;
                      ++v58;
                      goto LABEL_444;
                    }
                    if ((unsigned __int16)word_255EB3806 < 0x132u)
                      goto LABEL_517;
                    if ((v281 & 1) != 0)
                    {
                      v225 = time(0);
                      if (v225 < v279)
                      {
                        v226 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 134217984;
                          *(_QWORD *)&input[4] = v279;
                          v227 = v226;
                          v228 = "CCA: wait for deadline now=%lu";
                          goto LABEL_475;
                        }
                        goto LABEL_476;
                      }
                      v230 = v225;
                      if ((unsigned __int16)word_255EB3806 < 0x600u)
                      {
                        LOWORD(keys[0]) = 0;
                        v236 = controlReadU16(v300, 0, keys);
                        if (v236)
                        {
                          v237 = v236;
                          v238 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v237;
                            _os_log_error_impl(&dword_231046000, v238, OS_LOG_TYPE_ERROR, "CCA: cannot read DLOG status (%#x)", input, 8u);
                          }
                          goto LABEL_476;
                        }
                        v239 = (__int16)keys[0];
                        v232 = logger;
                        v240 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v239 & 0x800) != 0)
                        {
                          if (!v240)
                            goto LABEL_476;
                          goto LABEL_474;
                        }
                        if (v240)
                        {
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v58;
                          *(_WORD *)&input[8] = 2048;
                          *(_QWORD *)&input[10] = v230;
                          v234 = v232;
                          v235 = "CCA: re-enable DLOG updatesDone=%d, now=%lu";
LABEL_471:
                          _os_log_impl(&dword_231046000, v234, OS_LOG_TYPE_DEFAULT, v235, input, 0x12u);
                        }
LABEL_472:
                        v229 = 0;
                        v279 = 0;
                      }
                      else
                      {
                        v231 = word_255EB383A;
                        v232 = logger;
                        v233 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v231 & 0x20) == 0)
                        {
                          if (v233)
                          {
                            *(_DWORD *)input = 67109376;
                            *(_DWORD *)&input[4] = v58;
                            *(_WORD *)&input[8] = 2048;
                            *(_QWORD *)&input[10] = v230;
                            v234 = v232;
                            v235 = "CCA: re-enable DLOG updatesDone=%u, now=%lu";
                            goto LABEL_471;
                          }
                          goto LABEL_472;
                        }
                        if (!v233)
                          goto LABEL_476;
LABEL_474:
                        *(_DWORD *)input = 134217984;
                        *(_QWORD *)&input[4] = v230;
                        v227 = v232;
                        v228 = "CCA: GasGauge still calibrating now=%lu";
LABEL_475:
                        _os_log_impl(&dword_231046000, v227, OS_LOG_TYPE_DEFAULT, v228, input, 0xCu);
LABEL_476:
                        v229 = 1;
                      }
                    }
                    else
                    {
                      v229 = 0;
                    }
                    if ((v283 & 1) != 0)
                    {
                      if (*(_DWORD *)(v289 + 4))
                        goto LABEL_484;
                      v241 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        v242 = *(_DWORD *)(v289 + 4);
                        *(_DWORD *)input = 67109120;
                        *(_DWORD *)&input[4] = v242;
                        _os_log_impl(&dword_231046000, v241, OS_LOG_TYPE_DEFAULT, "disabling DLOG (num_clients=%i)", input, 8u);
                      }
                      v243 = controlReadS16(v300, 25, 0);
                      if (v243)
                      {
                        v244 = v243;
                        v245 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 67109120;
                          *(_DWORD *)&input[4] = v244;
                          _os_log_error_impl(&dword_231046000, v245, OS_LOG_TYPE_ERROR, "cannot disable DLOG (%#x)", input, 8u);
                        }
LABEL_484:
                        v283 = 1;
                      }
                      else
                      {
                        v283 = 0;
                        *(_DWORD *)(v289 + 24) = 0;
                        *(_DWORD *)(v289 + 16) = 0;
                        *(_QWORD *)(v289 + 8) = 0;
                      }
                    }
                    else
                    {
                      v283 = 0;
                    }
                    if (*(_DWORD *)(v289 + 4))
                      v246 = v229;
                    else
                      v246 = 1;
                    if ((v246 & 1) == 0)
                    {
                      if (!v58 || v283 != 1)
                      {
                        v247 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          v248 = *(_DWORD *)(v289 + 4);
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v58;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = v248;
                          _os_log_impl(&dword_231046000, v247, OS_LOG_TYPE_DEFAULT, "gathering data log updatesDone=%d num_clients=%d", input, 0xEu);
                        }
                      }
                      if ((*(_DWORD *)(v289 + 4) & 0x80000000) != 0
                        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        updateThread_cold_4(&v309, v310);
                      }
                      if (drainDataLog(v300))
                      {
                        v249 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          updateThread_cold_3(v344, v345, v249);
                      }
                      v283 = 1;
                    }
                    if ((v229 & 1) != 0)
                    {
                      v250 = 1;
                    }
                    else if ((unsigned __int16)word_255EB3806 < 0x600u)
                    {
                      v250 = v263;
                      if ((unsigned __int16)word_255EB3806 <= 0x501u)
                        v250 = 0;
                    }
                    else
                    {
                      v250 = ((unsigned __int16)word_255EB383A >> 5) & 1;
                    }
                    v281 = v250;
                    if ((v283 & v250) == 1)
                    {
                      v251 = controlReadS16(v300, 25, 0);
                      if (v251)
                      {
                        v252 = v251;
                        v253 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 67109120;
                          *(_DWORD *)&input[4] = v252;
                          _os_log_error_impl(&dword_231046000, v253, OS_LOG_TYPE_ERROR, "CCA: cannot disable DLOG (%#x)", input, 8u);
                        }
                        v281 = 0;
                        LOBYTE(v283) = 1;
                      }
                      else
                      {
                        *(_DWORD *)(v289 + 16) = 0;
                        *(_QWORD *)(v289 + 8) = 0;
                        v279 = time(0) + 20;
                        v254 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v58;
                          *(_WORD *)&input[8] = 2048;
                          *(_QWORD *)&input[10] = v279;
                          _os_log_impl(&dword_231046000, v254, OS_LOG_TYPE_DEFAULT, "CCA: disabled DLOG updatesDone=%d ccaDeadline=%lu", input, 0x12u);
                        }
                        LOBYTE(v283) = 0;
                        v281 = 1;
                      }
                    }
                    v3 = 0x255EB2000uLL;
LABEL_516:
                    v2 = 0x25414D000uLL;
                    goto LABEL_517;
                  }
LABEL_203:
                  if (debug_polling)
                  {
                    v103 = *(NSObject **)(v3 + 3920);
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)input = 136315650;
                      *(_QWORD *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3146;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v58;
                      _os_log_impl(&dword_231046000, v103, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d READING FLAGS", input, 0x18u);
                    }
                  }
                  v104 = hdqReadU16(v300, 10, &word_255EB383A);
                  v105 = 0;
                  v272 = v104;
                  if (v104 || (unsigned __int16)word_255EB383A == 0xFFFF)
                  {
                    v106 = v275;
                  }
                  else
                  {
                    v106 = v275;
                    if (((v292 ^ 1) & 1) == 0)
                    {
                      if (word_255EB3964)
                      {
                        v270 = 0;
                        if ((v294 & 0x20) != 0)
                        {
                          v107 = v285
                              && (unsigned __int16)(word_255EB3964 & word_255EB383A) == (unsigned __int16)word_255EB3964;
                          v285 = (unsigned __int16)(word_255EB3964 & word_255EB383A) == (unsigned __int16)word_255EB3964;
                        }
                        else
                        {
                          v107 = (unsigned __int16)(word_255EB3964 & word_255EB383A) == (unsigned __int16)word_255EB3964;
                        }
                      }
                      else if (v58 && dword_255EB3968 >= word_255EB380A)
                      {
                        v270 = 0;
                        v107 = 1;
                      }
                      else
                      {
                        v107 = ((unsigned __int16)word_255EB383A >> 2) & 1;
                        v270 = 1;
                      }
                      if (debug_polling)
                      {
                        v116 = *(NSObject **)(v3 + 3920);
                        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                        {
                          v117 = UpSeconds();
                          *(_DWORD *)input = 136317186;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3178;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v58;
                          *(_WORD *)&input[24] = 1024;
                          *(_DWORD *)&input[26] = v107;
                          *(_WORD *)&input[30] = 1024;
                          *(_DWORD *)&input[32] = v302;
                          v3 = 0x255EB2000uLL;
                          *(_WORD *)&input[36] = 2048;
                          *(_QWORD *)&input[38] = v117;
                          *(_WORD *)&input[46] = 1024;
                          *(_DWORD *)&input[48] = v341;
                          LOWORD(v354) = 1024;
                          *(_DWORD *)((char *)&v354 + 2) = dword_255EB3968;
                          HIWORD(v354) = 1024;
                          v355 = word_255EB380A;
                          _os_log_impl(&dword_231046000, v116, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu cfd=%d cfd-voltage=%d batteryInfo.voltage=%d", input, 0x40u);
                        }
                      }
                      if (!v341)
                        goto LABEL_263;
                      v118 = UpSeconds();
                      if (v118 <= v341)
                      {
                        if (!v58)
                          goto LABEL_532;
                        v121 = word_255EB380A;
                        if (dword_255EB3968 >= word_255EB380A)
                        {
                          v124 = v118;
                          v125 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 136316162;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3201;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v58;
                            *(_WORD *)&input[24] = 2048;
                            *(_QWORD *)&input[26] = v124;
                            *(_WORD *)&input[34] = 1024;
                            *(_DWORD *)&input[36] = v121;
                            _os_log_impl(&dword_231046000, v125, OS_LOG_TYPE_DEFAULT, "%s:%d updatesDone=%d UpSeconds=%llu voltage=%d (low)", input, 0x28u);
                          }
                          v270 = 0;
                          v107 = 1;
                          v3 = 0x255EB2000uLL;
                          goto LABEL_263;
                        }
                        v3 = 0x255EB2000uLL;
                        if (v302)
                        {
LABEL_532:
                          if (debug_polling)
                          {
                            if (v107)
                            {
                              v122 = *(NSObject **)(v3 + 3920);
                              if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                              {
                                v123 = UpSeconds();
                                *(_DWORD *)input = 136315906;
                                *(_QWORD *)&input[4] = "updateThread";
                                *(_WORD *)&input[12] = 1024;
                                *(_DWORD *)&input[14] = 3209;
                                *(_WORD *)&input[18] = 2048;
                                *(_QWORD *)&input[20] = v123;
                                *(_WORD *)&input[28] = 1024;
                                *(_DWORD *)&input[30] = v341;
                                _os_log_impl(&dword_231046000, v122, OS_LOG_TYPE_DEFAULT, "%s:%d UpSeconds=%llu (cfd = %u) forcing critical to 0", input, 0x22u);
                              }
                            }
                          }
                          if (!v270)
                            v107 = 0;
                          v270 = v270 << 31 >> 31;
                        }
                      }
                      else if (debug_polling)
                      {
                        v119 = *(NSObject **)(v3 + 3920);
                        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                        {
                          v120 = UpSeconds();
                          *(_DWORD *)input = 136315906;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3191;
                          *(_WORD *)&input[18] = 2048;
                          *(_QWORD *)&input[20] = v120;
                          *(_WORD *)&input[28] = 1024;
                          *(_DWORD *)&input[30] = v341;
                          _os_log_impl(&dword_231046000, v119, OS_LOG_TYPE_DEFAULT, "%s:%d deadline expired at UpSeconds=%llu (cfd = %u)", input, 0x22u);
                        }
                      }
LABEL_263:
                      if (!word_255EB3964)
                      {
                        v328 = v270;
                        *(_QWORD *)((unint64_t)buf | (8 * v275)) = CFNumberCreate(allocator, kCFNumberIntType, &v328);
                        *(_QWORD *)((unint64_t)v356 & 0xFFFFFFFFFFFFFFF7 | (8 * (v275 & 1))) = CFSTR("SOCBasedShutdown");
                        v106 = v275 + 1;
                      }
                      if (debug_polling)
                      {
                        if (v107)
                        {
                          v126 = *(NSObject **)(v3 + 3920);
                          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                          {
                            v127 = UpSeconds();
                            *(_DWORD *)input = 136316674;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3227;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v58;
                            *(_WORD *)&input[24] = 1024;
                            *(_DWORD *)&input[26] = 1;
                            *(_WORD *)&input[30] = 1024;
                            *(_DWORD *)&input[32] = v302;
                            v3 = 0x255EB2000uLL;
                            *(_WORD *)&input[36] = 2048;
                            *(_QWORD *)&input[38] = v127;
                            *(_WORD *)&input[46] = 1024;
                            *(_DWORD *)&input[48] = word_255EB380A;
                            _os_log_impl(&dword_231046000, v126, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu batteryInfo.voltage=%d", input, 0x34u);
                          }
                        }
                      }
                      v105 = v107 != 0;
                      v2 = 0x25414D000;
                    }
                  }
                  if ((v72 & 1) == 0 || (v290 > 2 ? (v128 = 1) : (v128 = v105), (v128 & 1) != 0 || v57))
                  {
                    v271 = v105;
                    v290 = 0;
                    goto LABEL_280;
                  }
                  ++v290;
                  v129 = *(NSObject **)(v3 + 3920);
                  if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)input = 0;
                    _os_log_impl(&dword_231046000, v129, OS_LOG_TYPE_INFO, "flags update only", input, 2u);
                  }
                  v56 = 0;
                  v57 = 0;
LABEL_444:
                  v62 = v300;
                }
              }
              else
              {
                v92 = CFPreferencesCopyValue(CFSTR("ResetEnabled"), CFSTR("com.apple.gasgauge"), v298, v297);
                v93 = os_log_type_enabled(*(os_log_t *)(v3 + 3920), OS_LOG_TYPE_ERROR);
                if (v92 == v291)
                {
                  v94 = v300;
                  if (v93)
                    updateThread_cold_5(&v333, v334);
                }
                else
                {
                  if (v93)
                    updateThread_cold_6(&v331, v332);
                  v94 = v300;
                  ggctl_reset(v300, 1u);
                }
                v56 = 0;
                ++v57;
                v62 = v94;
              }
            }
          }
        }
        else
        {
          v56 = 0;
LABEL_166:
          v62 = -1;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      updateThread_cold_1();
  }
  return 0;
}

uint64_t batteryThread(unsigned int a1)
{
  updateThread(a1);
  return 0;
}

_QWORD *GGHIDPlugInFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  _QWORD *v4;
  const __CFAllocator *v5;
  CFUUIDRef v6;
  const __CFUUID *v7;
  const __CFAllocator *v8;
  timespec __tp;
  int v11;
  int valuePtr;

  v3 = CFUUIDGetConstantUUIDWithBytes(0, 5u, 0x16u, 0xB5u, 0x63u, 0xB1u, 0x5Bu, 0x11u, 0xDAu, 0x96u, 0xEBu, 0, 0x14u, 0x51u, 0x97u, 0x58u, 0xEFu);
  if (!CFEqual(a2, v3))
    return 0;
  v4 = calloc(1uLL, 0x98uLL);
  *v4 = &GGHID_IOCFPlugInInterface;
  v4[1] = v4;
  v4[2] = &GGHID_IOHIDServiceInterface2;
  v4[3] = v4;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v6 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0xABu, 0x58u, 0xEBu, 0x3Eu, 0xA7u, 0x74u, 0x4Fu, 0xCCu, 0xA1u, 0x1Au, 0x5Au, 0xCDu, 0x74u, 0xE7u, 0xDAu, 0x17u);
  v4[4] = CFRetain(v6);
  v7 = CFUUIDGetConstantUUIDWithBytes(v5, 0xABu, 0x58u, 0xEBu, 0x3Eu, 0xA7u, 0x74u, 0x4Fu, 0xCCu, 0xA1u, 0x1Au, 0x5Au, 0xCDu, 0x74u, 0xE7u, 0xDAu, 0x17u);
  CFPlugInAddInstanceForFactory(v7);
  v4[5] = 1;
  v4[6] = 0;
  v11 = 5;
  valuePtr = 65280;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4[7] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v4[8] = CFNumberCreate(v8, kCFNumberSInt32Type, &v11);
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  if (!clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp))
    v4[16] = __tp.tv_nsec / 1000 + 1000000 * __tp.tv_sec;
  return v4;
}

double ggctl_logShutdownDLog(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  double result;
  __int128 v6;
  uint64_t v7;
  uint64_t input;
  size_t v9;
  __int128 outputStruct;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = 40;
  if ((a3 & 1) != 0)
  {
    if (!a2)
      return result;
    v12 = 0;
    outputStruct = 0u;
    v11 = 0u;
    v7 = a3;
    v4 = IOConnectCallMethod(a1, 0x12u, &v7, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  else
  {
    if (!a2)
      return result;
    v12 = 0;
    outputStruct = 0u;
    v11 = 0u;
    input = a3;
    v4 = IOConnectCallMethod(a1, 0x12u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  if (!v4)
  {
    result = *(double *)&outputStruct;
    v6 = v11;
    *(_OWORD *)a2 = outputStruct;
    *(_OWORD *)(a2 + 16) = v6;
    *(_QWORD *)(a2 + 32) = v12;
  }
  return result;
}

uint64_t getSInt32ForKey(CFStringRef key, _DWORD *a2)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v4;
  CFTypeID TypeID;
  int Value;
  uint64_t result;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(service, key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v4 = CFProperty;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      Value = CFNumberGetValue(v4, kCFNumberSInt32Type, a2);
      CFRelease(v4);
      if (Value)
        return 0;
    }
    else
    {
      CFRelease(v4);
    }
  }
  result = 0xFFFFFFFFLL;
  *a2 = -1;
  return result;
}

void setUPOData(const __CFString *a1, int a2)
{
  CFMutableDictionaryRef v3;
  __CFDictionary *v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  io_service_t MatchingService;
  io_registry_entry_t v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  int valuePtr;
  int v14;

  v14 = a2;
  v3 = IOServiceMatching("IOService");
  if (v3)
  {
    v4 = v3;
    valuePtr = 0;
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    v6 = CFDictionaryCreate(v5, (const void **)&setUPOData_tmp, (const void **)&v12, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(v4, CFSTR("IOPropertyMatch"), v6);
      CFRelease(v7);
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v4);
      if (!MatchingService)
        return;
      v9 = MatchingService;
      v10 = CFNumberCreate(v5, kCFNumberSInt32Type, &v14);
      IORegistryEntrySetCFProperty(v9, a1, v10);
      IOObjectRelease(v9);
      v11 = v10;
    }
    else
    {
      v11 = v4;
    }
    CFRelease(v11);
  }
}

uint64_t ggctl_logShutdownReason2(uint64_t result, _OWORD *a2, unsigned int a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t input;
  uint64_t v7;
  size_t v8;
  __int128 outputStruct;
  __int128 v10;
  __int128 v11;
  _OWORD inputStruct[3];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 48;
  if (a2)
  {
    if ((a3 & 1) != 0)
    {
      v10 = 0u;
      v11 = 0u;
      outputStruct = 0u;
      input = a3;
      result = IOConnectCallMethod(result, 0x13u, &input, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
      if (!(_DWORD)result)
      {
        v4 = v10;
        *a2 = outputStruct;
        a2[1] = v4;
        a2[2] = v11;
      }
    }
    else
    {
      v5 = a2[1];
      inputStruct[0] = *a2;
      inputStruct[1] = v5;
      inputStruct[2] = a2[2];
      v7 = a3;
      return IOConnectCallMethod(result, 0x13u, &v7, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
    }
  }
  return result;
}

uint64_t iokit_callback(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)result = a3;
  *(_QWORD *)(result + 8) = a4;
  return result;
}

void getUPOData(CFStringRef key, void *a2)
{
  io_registry_entry_t v4;
  CFAllocatorRef *v5;
  CFMutableDictionaryRef v6;
  __CFDictionary *v7;
  const __CFAllocator *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CFTypeRef CFProperty;
  const void *v12;
  CFTypeID TypeID;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = find_pmu_pmu_service;
  v5 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (find_pmu_pmu_service)
    goto LABEL_7;
  v6 = IOServiceMatching("IOService");
  if (v6)
  {
    v7 = v6;
    v15 = 0;
    v8 = *v5;
    find_pmu_zero_number = (uint64_t)CFNumberCreate(*v5, kCFNumberSInt32Type, &v15);
    v9 = CFDictionaryCreate(v8, (const void **)&find_pmu_tmp, (const void **)&find_pmu_zero_number, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue(v7, CFSTR("IOPropertyMatch"), v9);
      CFRelease(v10);
      find_pmu_pmu_service = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v7);
    }
    else
    {
      CFRelease(v7);
    }
  }
  v4 = find_pmu_pmu_service;
  if (find_pmu_pmu_service)
  {
LABEL_7:
    CFProperty = IORegistryEntryCreateCFProperty(v4, key, *v5, 0);
    if (CFProperty)
    {
      v12 = CFProperty;
      TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v12) || !CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt32Type, a2))
      {
        v14 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315394;
          v16 = "/Library/Caches/com.apple.xbs/Sources/AppleHDQGasGauge/AppleHDQGasGauge.c";
          v17 = 1024;
          v18 = 2348;
          _os_log_impl(&dword_231046000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d cannot read upo data", (uint8_t *)&v15, 0x12u);
        }
      }
      CFRelease(v12);
    }
  }
}

void updateThermalCoolDownState(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v4;
  void **v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "ThermalCoolDown", 0x8000100u);
  v5 = (void **)MEMORY[0x24BDBD270];
  if (!a2)
    v5 = (void **)MEMORY[0x24BDBD268];
  values = *v5;
  v6 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v6)
  {
    v7 = v6;
    IORegistryEntrySetCFProperties(a1, v6);
    CFRelease(v7);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    updateThermalCoolDownState_cold_1();
  }
}

void statsAndLogs(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v4;
  const void *v5;
  CFIndex v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *values;
  CFTypeRef cf;
  void *keys;
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  cf = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  keys = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "stats", 0x8000100u);
  v5 = (const void *)*MEMORY[0x24BDBD268];
  values = (void *)*MEMORY[0x24BDBD268];
  if (a2)
  {
    v12 = CFStringCreateWithCString(v4, "log", 0x8000100u);
    cf = v5;
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  v7 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, v6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v7)
  {
    v8 = v7;
    if (IORegistryEntrySetCFProperties(a1, v7) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      statsAndLogs_cold_2();
    CFRelease(v8);
    CFRelease(values);
    if (a2)
      CFRelease(cf);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    statsAndLogs_cold_1();
  }
}

void debugLog(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  int valuePtr;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "debug", 0x8000100u);
  values = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  v4 = CFDictionaryCreate(v3, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v4)
  {
    v5 = v4;
    if (IORegistryEntrySetCFProperties(a1, v4))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        debugLog_cold_2();
    }
    CFRelease(v5);
    CFRelease(values);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    debugLog_cold_1();
  }
}

uint64_t readChargeTable(mach_port_t a1, __CFData **a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  char *p_outputStruct;
  char v15;
  int v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  __CFData *Mutable;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  UInt8 *MutableBytePtr;
  UInt8 *v28;
  char *v29;
  UInt8 *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  unsigned __int8 outputStruct;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  _BYTE v48[34];

  *(_QWORD *)&v48[26] = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  if (!dword_255EB38DC)
    return 0;
  v3 = 0xFFFFFFFFLL;
  if (!ggctl_readBlock(a1, -1, dword_255EB38DC, &outputStruct, 0))
  {
    v4 = v47;
    if (v47 == 255)
    {
      v9 = outputStruct;
      v10 = (unint64_t)outputStruct >> 4;
      v11 = 6 * v10 + 4;
      if (outputStruct <= 0x4FuLL)
      {
        v13 = 0;
        v37 = v46;
        p_outputStruct = (char *)&outputStruct;
        do
        {
          v15 = *p_outputStruct++;
          v13 += v15;
          --v11;
        }
        while (v11);
        v16 = v13;
        if (v13)
        {
          v17 = logger;
          v3 = 0;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            v39 = v16;
            v40 = 1024;
            v41 = v45;
            v42 = 1024;
            v43 = 256 - (v16 - v45);
            v6 = "gas gauge charge table bad checksum: checksum %#x checksum byte %#x expecting %#x";
            v7 = v17;
            v8 = 20;
            goto LABEL_14;
          }
        }
        else
        {
          v19 = (unint64_t)v46 >> 4;
          v20 = 4 * v19 + 8;
          Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v20 * (unint64_t)v10);
          CFDataSetLength(Mutable, v20 * (unint64_t)v10);
          if (v9 >= 0x10)
          {
            v22 = 0;
            if (v19 <= 1)
              v23 = 1;
            else
              v23 = v19;
            v36 = v23;
            if (v10 <= 1)
              v24 = 1;
            else
              v24 = v10;
            v25 = v48;
            v26 = 10;
            do
            {
              MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
              v28 = &MutableBytePtr[v22 * v20];
              v29 = (char *)(&outputStruct + 6 * v22);
              *(_WORD *)v28 = 100 * v29[4];
              *((_WORD *)v28 + 1) = 100 * v29[5];
              *((_DWORD *)v28 + 1) = v19;
              if (v37 >= 0x10)
              {
                v30 = &MutableBytePtr[v26];
                v31 = v19 - 1;
                v32 = v36;
                v33 = v25;
                do
                {
                  if (v31)
                    v34 = updateThread_batteryInfo[(*v33 & 0xF) + 64];
                  else
                    LOWORD(v34) = -1;
                  *((_WORD *)v30 - 1) = v34;
                  v35 = *v33++;
                  *(_WORD *)v30 = *(int *)((char *)&updateThread_batteryInfo[80] + (((unint64_t)v35 >> 2) & 0x3C));
                  v30 += 4;
                  --v31;
                  --v32;
                }
                while (v32);
              }
              ++v22;
              v26 += v20;
              v25 += 6;
            }
            while (v22 != v24);
          }
          v3 = 0;
          *a2 = Mutable;
        }
      }
      else
      {
        v12 = logger;
        v3 = 0;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v39 = v10;
          v40 = 1024;
          v41 = 6 * v10 + 4;
          v6 = "gas gauge charge table inconsistent: %d data entries, %d bytes";
          v7 = v12;
          v8 = 14;
          goto LABEL_14;
        }
      }
    }
    else
    {
      v5 = logger;
      v3 = 0;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v39 = v4;
        v6 = "gas gauge charge table invalid type: %#x";
        v7 = v5;
        v8 = 8;
LABEL_14:
        _os_log_impl(&dword_231046000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t readRemainingCapacity__(_WORD *a1, int *a2, mach_port_t a3)
{
  int v6;
  unsigned __int16 v8;

  v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v8 <= 0x118u)
    v6 = *a2;
  else
    v6 = 50;
  return hdqReadS16(a3, v6, a1);
}

uint64_t readFAC__(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  __int16 v6;

  v6 = 0;
  if ((getFWVersion(a3, &v6) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v6 == 1536)
    return 0;
  return hdqReadU16(a3, 14, a1);
}

uint64_t readBatteryData(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t Register;
  unsigned __int16 v10;

  v10 = 0;
  if ((getFWVersion(a3, (__int16 *)&v10) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if ((int)a2 >= 1)
  {
    v6 = 0;
    v7 = v10;
    while (1)
    {
      if (*(_DWORD *)(a1 + 4) == -1)
        return v6;
      if (registerName(a1, v7))
      {
        Register = readRegister(*(_WORD **)(a1 + 56), a1, a3);
        if ((Register & 0x80000000) != 0)
          break;
      }
      ++v6;
      a1 += 80;
      if (a2 == v6)
        return a2;
    }
    return Register;
  }
  return a2;
}

void calculateBatteryHealthMetric()
{
  uint64_t v0;
  float v1;
  float v2;
  float v3;

  if ((unsigned __int16)word_255EB3806 >= 0x600u)
  {
    v0 = 0;
    v1 = (double)(bswap32((unsigned __int16)word_255EB3880) >> 16) * 0.137995
       + (double)(bswap32((unsigned __int16)word_255EB387E) >> 16) * 0.0693069
       + (double)(bswap32((unsigned __int16)word_255EB3882) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_255EB3884) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_255EB3886) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_255EB3888) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_255EB388A) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_255EB388C) >> 16) * 0.0872525
       + (double)(bswap32((unsigned __int16)word_255EB388E) >> 16) * 0.0185644;
    word_255EB38D4 = (int)v1;
    while (battery_health_metric_config[v0] != word_255EB3800)
    {
      v0 += 4;
      if (v0 == 68)
      {
        v2 = 0.0;
        goto LABEL_7;
      }
    }
    v2 = (float)*(unsigned int *)&battery_health_metric_config[v0 + 2];
LABEL_7:
    v3 = (float)(v2 * v1) / 1000.0;
    word_255EB38D6 = (int)v3;
    if (dword_255EB38D0 < (int)v3)
    {
      dword_255EB38D0 = (int)v3;
      setUPOData(CFSTR("IOPMUBootBatteryHealthMetric"), (int)v3);
    }
  }
}

CFDictionaryRef readChargerData(int a1, int a2, mach_port_t a3)
{
  const __CFAllocator *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  CFDictionaryRef v10;
  CFNumberRef v11;
  uint64_t v12;
  CFNumberRef v13;
  uint64_t v14;
  CFNumberRef v15;
  uint64_t v16;
  unint64_t v17;
  time_t v19;
  void *keys[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *values[9];

  values[8] = *(void **)MEMORY[0x24BDAC8D0];
  if (readBatteryData((uint64_t)&readChargerData_chargerRegs, 5, a3) != 5)
    return 0;
  memset(&values[2], 0, 48);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt8Type, &readChargerData_notChargingReason);
  keys[0] = CFSTR("NotChargingReason");
  values[1] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerAlert);
  keys[1] = CFSTR("ChargerAlert");
  if (!a1)
    goto LABEL_11;
  v7 = readChargerData_notChargingReason & 0x10;
  if (a2)
  {
    if ((readChargerData_notChargingReason & 0x10) != 0)
    {
      v7 = (readChargerData_notChargingReason >> 4) & 1;
      LOWORD(v19) = 0;
      if ((hdqReadU16(a3, 52, &v19) & 0x80000000) == 0)
      {
        v8 = 1717986919 * byte_255EB3808 * word_255EB3802;
        if ((int)((v8 >> 34) + ((unint64_t)v8 >> 63)) > (unsigned __int16)v19)
          v7 = 0;
      }
    }
  }
  if (v7)
  {
    values[2] = *(void **)MEMORY[0x24BDBD270];
    *(_QWORD *)&v21 = CFSTR("ChargerTimeout");
    v9 = 3;
  }
  else
  {
LABEL_11:
    v9 = 2;
  }
  if ((readChargerData_notChargingReason & 0x20) != 0)
  {
    values[v9] = (void *)*MEMORY[0x24BDBD270];
    keys[v9++] = CFSTR("ChargerWatchdogTimeout");
  }
  values[v9] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingCurrent);
  keys[v9] = CFSTR("ChargingCurrent");
  v11 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingVoltage);
  v12 = 8 * v9 + 8;
  *(void **)((char *)values + v12) = v11;
  *(void **)((char *)keys + v12) = CFSTR("ChargingVoltage");
  v13 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerStatus);
  v14 = 8 * v9 + 16;
  *(void **)((char *)values + v14) = v13;
  *(void **)((char *)keys + v14) = CFSTR("ChargerStatus");
  v19 = time(0);
  v15 = CFNumberCreate(v6, kCFNumberLongType, &v19);
  v16 = 8 * v9 + 24;
  *(void **)((char *)values + v16) = v15;
  *(void **)((char *)keys + v16) = CFSTR("UpdateTime");
  v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, v9 + 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
  {
    CFRelease(values[v9 + 3]);
    v17 = v9 + 4;
    --v9;
  }
  while (v17 > 1);
  return v10;
}

CFDictionaryRef dynamicATV(mach_port_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  int v6;
  const __CFAllocator *v7;
  int v8;
  unint64_t v9;
  CFDictionaryRef v10;
  const __CFString *v13;
  const __CFString *v14;
  void *values;
  CFNumberRef v16;
  uint64_t input[2];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v14 = 0;
  *(_OWORD *)input = xmmword_231051040;
  v18 = 0;
  if (IOConnectCallScalarMethod(a1, 7u, input, 3u, 0, 0))
  {
    v1 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      dynamicATV_cold_1(v1, v2, v3);
  }
  v4 = word_255EB3804 + (unsigned __int16)word_255EB380E;
  v5 = word_255EB3802;
  if (v4 <= (__int16)(v5 + ((unsigned __int16)(v5 & 0x8000) >> 15)) >> 1)
    v6 = (__int16)(word_255EB3802 + ((word_255EB3802 & 0x8000u) >> 15)) >> 1;
  else
    v6 = word_255EB3804 + (unsigned __int16)word_255EB380E;
  if (v4 <= word_255EB3802)
    v5 = v6;
  dword_255EB382C = v5;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &dword_255EB382C);
  v13 = CFSTR("atvBatteryCapacityMA");
  if (dword_255EB3980)
  {
    v8 = determineVACVoltage();
    if (v8 != dword_255EB3828)
      dword_255EB3828 = v8;
    v16 = CFNumberCreate(v7, kCFNumberIntType, &dword_255EB3828);
    v14 = CFSTR("atvAbsMaxVoltageMV");
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  v10 = CFDictionaryCreate(v7, (const void **)&v13, (const void **)&values, v9, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
    CFRelease(*(&v14 + v9));
  while (v9-- > 1);
  return v10;
}

uint64_t determineVACVoltage()
{
  unsigned int v0;
  uint64_t v1;
  int *v3;
  unsigned __int16 v4;
  unsigned int v5;
  unsigned int v6;
  int v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  unsigned __int8 v12;
  __int16 v13;
  unsigned __int8 *v14;
  unsigned __int16 v15;
  BOOL v17;
  unint64_t v18;
  int *v19;
  unsigned __int16 v20;
  unsigned int v21;
  unsigned int v22;
  int v24;
  NSObject *v25;
  BOOL v26;
  unsigned int v27;
  uint64_t v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  NSObject *v34;
  int v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v0 = dword_255EB3828;
  v1 = dword_255EB3980;
  if (dword_255EB3980)
  {
    if (determineVACVoltage_lastBatteryCycleCount != (unsigned __int16)word_255EB3834 || dword_255EB3828 == 0)
    {
      determineVACVoltage_lastBatteryCycleCount = (unsigned __int16)word_255EB3834;
      v3 = &dword_255EB3984;
      while (1)
      {
        v5 = *v3++;
        v4 = v5;
        v6 = HIWORD(v5);
        if (v5 < 0x10000 || v6 > (unsigned __int16)word_255EB3834)
          break;
        if (!--v1)
        {
          v8 = determineVACVoltage_vacBasedVoltageMV;
          if (determineVACVoltage_vacBasedVoltageMV)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      v8 = v4;
      if (v4)
        goto LABEL_17;
LABEL_16:
      v8 = LOWORD(updateThread_batteryInfo[dword_255EB3980 + 104]);
LABEL_17:
      determineVACVoltage_vacBasedVoltageMV = v8;
      v9 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 67109120;
        v38 = v8;
        _os_log_impl(&dword_231046000, v9, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vacBasedVoltageMV=%d", (uint8_t *)&v37, 8u);
        v8 = determineVACVoltage_vacBasedVoltageMV;
      }
      if (v0)
        v10 = 1;
      else
        v10 = v8 == 0;
      if (!v10)
        v0 = v8;
    }
  }
  v11 = dword_255EB39C4;
  if (dword_255EB39C4 && (unsigned __int16)word_255EB3806 >= 0x313u)
  {
    v12 = word_255EB386E;
    if ((unsigned __int16)word_255EB3806 <= 0x500u)
      v13 = word_255EB386E;
    else
      v13 = word_255EB386C;
    v14 = (unsigned __int8 *)&word_255EB386E + 1;
    if ((unsigned __int16)word_255EB3806 > 0x500u)
      v14 = (unsigned __int8 *)&word_255EB386C + 1;
    v15 = *v14 | (unsigned __int16)(v13 << 8);
    if ((unsigned __int16)word_255EB3806 <= 0x500u)
      v12 = byte_255EB3870;
    if (v12 && v15 != 0)
    {
      if (determineVACVoltage_lastTimeAbove95 != v12
        || ((unsigned __int16)determineVACVoltage_lastToT == v15 ? (v17 = v0 == 0) : (v17 = 1), v17))
      {
        determineVACVoltage_lastTimeAbove95 = v12;
        determineVACVoltage_lastToT = v15;
        v18 = (42949673 * (unint64_t)(v12 * v15)) >> 32;
        v19 = &dword_255EB39C8;
        while (1)
        {
          v21 = *v19++;
          v20 = v21;
          v22 = HIWORD(v21);
          if (v21 < 0x10000 || v18 < v22)
            break;
          if (!--v11)
          {
            v24 = determineVACVoltage_vac95BasedVoltageMV;
            if (determineVACVoltage_vac95BasedVoltageMV)
              goto LABEL_54;
            goto LABEL_53;
          }
        }
        v24 = v20;
        if (v20)
          goto LABEL_54;
LABEL_53:
        v24 = LOWORD(updateThread_batteryInfo[dword_255EB39C4 + 121]);
LABEL_54:
        determineVACVoltage_vac95BasedVoltageMV = v24;
        v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 67109376;
          v38 = v24;
          v39 = 1024;
          v40 = v0;
          _os_log_impl(&dword_231046000, v25, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vac95BasedVoltageMV=%d absMaxVoltageMV=%d", (uint8_t *)&v37, 0xEu);
          v24 = determineVACVoltage_vac95BasedVoltageMV;
        }
        if (v0)
          v26 = 1;
        else
          v26 = v24 == 0;
        if (!v26)
          v0 = v24;
      }
    }
  }
  v27 = determineVACVoltage_vacBasedVoltageMV;
  if (determineVACVoltage_vacBasedVoltageMV >= v0 || determineVACVoltage_vacBasedVoltageMV == 0)
    v27 = v0;
  if (determineVACVoltage_vac95BasedVoltageMV >= v27 || determineVACVoltage_vac95BasedVoltageMV == 0)
    v30 = v27;
  else
    v30 = determineVACVoltage_vac95BasedVoltageMV;
  v31 = dword_255EB3828;
  v32 = word_255EB380A;
  if (dword_255EB3828)
    v33 = v30 >= word_255EB380A;
  else
    v33 = 1;
  if (v33)
    return v30;
  v34 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    v37 = 67109376;
    v38 = v32;
    v39 = 1024;
    v40 = v30;
    _os_log_impl(&dword_231046000, v34, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: waiting for vbat(%d) < vac(%d)", (uint8_t *)&v37, 0xEu);
    return dword_255EB3828;
  }
  return v31;
}

uint64_t determinePoSMThreshold()
{
  __int16 *v0;
  unsigned __int8 *v1;
  __int16 *v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  _DWORD *v21;
  uint64_t v22;
  unsigned int v24;
  unsigned int v26;
  NSObject *v29;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  int v34;
  uint8_t buf[4];
  _BOOL4 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  if ((unsigned __int16)word_255EB3806 <= 0x500u)
  {
    if ((unsigned __int16)word_255EB3806 < 0x313u)
      return 0xFFFFFFFFLL;
    v2 = &word_255EB386E;
    v0 = (__int16 *)&byte_255EB3870;
    v1 = (unsigned __int8 *)&word_255EB386E + 1;
  }
  else
  {
    v0 = &word_255EB386E;
    v1 = (unsigned __int8 *)&word_255EB386C + 1;
    v2 = &word_255EB386C;
  }
  v3 = *v1 | (*(unsigned __int8 *)v2 << 8);
  v4 = *(unsigned __int8 *)v0;
  v5 = (unsigned __int16)dword_255EB3A0C;
  v6 = (unsigned __int16)dword_255EB3A0C != 0;
  v7 = (unsigned __int16)word_255EB3A10;
  v8 = word_255EB3A10 != 0;
  v9 = (unsigned __int16)word_255EB3A18;
  v10 = word_255EB3A18 != 0;
  v11 = determinePoSMThreshold_lastBatteryCycleCount != (unsigned __int16)word_255EB3834
     && (unsigned __int16)dword_255EB3A0C != 0;
  v12 = (unsigned __int16)determinePoSMThreshold_lastToT != v3 && word_255EB3A10 != 0;
  v13 = determinePoSMThreshold_lastAbove95 != v4
     || (unsigned __int16)determinePoSMThreshold_lastToT != v3;
  v14 = determinePoSMThreshold_lastAbove95 != v4 && word_255EB3A18 != 0;
  v32 = v11;
  v33 = v14;
  v15 = (unsigned __int16)dword_255EB3A14;
  v31 = (unsigned __int16)dword_255EB3A14 != 0;
  if ((_WORD)dword_255EB3A14)
    v16 = v13;
  else
    v16 = 0;
  if (v11)
  {
    determinePoSMThreshold_lastBatteryCycleCount = (unsigned __int16)word_255EB3834;
    if ((unsigned __int16)word_255EB3834 <= HIWORD(dword_255EB3A0C))
      v17 = -1;
    else
      v17 = dword_255EB3A1C;
    determinePoSMThreshold_vacThreshold = v17;
  }
  if (v12)
  {
    determinePoSMThreshold_lastToT = v3;
    if (v3 <= HIWORD(*(_DWORD *)&word_255EB3A10))
      v18 = -1;
    else
      v18 = dword_255EB3A20;
    determinePoSMThreshold_vacpThreshold = v18;
  }
  if (v16)
  {
    determinePoSMThreshold_lastToT = v3;
    determinePoSMThreshold_lastAbove95 = v4;
    if ((42949673 * (unint64_t)(v4 * v3)) >> 32 <= HIWORD(dword_255EB3A14))
      v19 = -1;
    else
      v19 = dword_255EB3A24;
    determinePoSMThreshold_vac95Threshold = v19;
  }
  v34 = (unsigned __int16)word_255EB3834;
  if (word_255EB3A18)
  {
    determinePoSMThreshold_lastAbove95 = v4;
    if (v4 <= HIWORD(*(_DWORD *)&word_255EB3A18))
    {
      v21 = &unk_255EB3000;
      v20 = -1;
    }
    else
    {
      v20 = dword_255EB3A28;
      v21 = (_DWORD *)&unk_255EB3000;
    }
    v21[683] = v20;
  }
  else
  {
    v20 = determinePoSMThreshold_vac95pThreshold;
  }
  if (determinePoSMThreshold_vacThreshold == -1 || v5 == 0)
    v24 = -1;
  else
    v24 = determinePoSMThreshold_vacThreshold;
  if (determinePoSMThreshold_vacpThreshold >= v24 || v7 == 0)
    v26 = v24;
  else
    v26 = determinePoSMThreshold_vacpThreshold;
  if (determinePoSMThreshold_vac95Threshold < v26 && v15 != 0)
    v26 = determinePoSMThreshold_vac95Threshold;
  if (v20 >= v26 || v9 == 0)
    v22 = v26;
  else
    v22 = v20;
  v29 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v36 = v6;
    v37 = 1024;
    v38 = v8;
    v39 = 1024;
    v40 = v31;
    v41 = 1024;
    v42 = v10;
    _os_log_impl(&dword_231046000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, enabled:%d %d %d %d ", buf, 0x1Au);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v36 = v32;
    v37 = 1024;
    v38 = v12;
    v39 = 1024;
    v40 = v16;
    v41 = 1024;
    v42 = v33;
    _os_log_impl(&dword_231046000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, changed:%d %d %d %d ", buf, 0x1Au);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    v36 = v34;
    v37 = 1024;
    v38 = HIWORD(dword_255EB3A0C);
    v39 = 1024;
    v40 = v3;
    v41 = 1024;
    v42 = (unsigned __int16)word_255EB3A12;
    v43 = 1024;
    v44 = (42949673 * (unint64_t)(v4 * v3)) >> 32;
    v45 = 1024;
    v46 = HIWORD(dword_255EB3A14);
    v47 = 1024;
    v48 = v4;
    v49 = 1024;
    v50 = (unsigned __int16)word_255EB3A1A;
    _os_log_impl(&dword_231046000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, cmp:%d>%u %d>%u %d>%u %d>%u", buf, 0x32u);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    v36 = v22;
    v37 = 1024;
    v38 = determinePoSMThreshold_vacThreshold;
    v39 = 1024;
    v40 = determinePoSMThreshold_vacpThreshold;
    v41 = 1024;
    v42 = determinePoSMThreshold_vac95Threshold;
    v43 = 1024;
    v44 = determinePoSMThreshold_vac95pThreshold;
    _os_log_impl(&dword_231046000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold,minThreshold=%u threshold:%u %u %u %u", buf, 0x20u);
  }
  return v22;
}

CFDictionaryRef parseBatteryData(int a1, int a2)
{
  const __CFAllocator *v4;
  uint64_t v5;
  CFNumberRef v6;
  uint64_t v7;
  CFNumberRef v8;
  uint64_t v9;
  CFNumberRef v10;
  uint64_t v11;
  CFNumberRef v12;
  uint64_t v13;
  CFStringRef StringWithBytes;
  uint64_t v15;
  CFNumberRef v16;
  uint64_t v17;
  uint64_t v18;
  __int16 *v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  CFDictionaryRef v23;
  unint64_t v24;
  CFNumberRef v25;
  uint64_t v26;
  CFNumberRef v27;
  uint64_t v28;
  CFNumberRef v29;
  uint64_t v30;
  uint64_t v31;
  CFNumberRef v32;
  uint64_t v33;
  CFNumberRef v34;
  uint64_t v35;
  CFNumberRef v36;
  uint64_t v37;
  uint64_t v38;
  CFNumberRef v39;
  uint64_t v40;
  CFDictionaryRef v41;
  unint64_t v42;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  unsigned int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  __int16 v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  _BYTE valuePtr[12];
  void *values;
  int v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  time_t v92;
  void *v93[3];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  void *v107;
  _QWORD v108[2];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  void *keys[22];
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  void *v126[21];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&valuePtr[4] = 0;
  v121 = 0;
  v120 = 0u;
  v119 = 0u;
  v118 = 0u;
  v117 = 0u;
  v116 = 0u;
  v115 = 0u;
  v114 = 0u;
  v113 = 0u;
  v112 = 0u;
  v111 = 0u;
  v110 = 0u;
  v109 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v107 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)updateThread_batteryInfo, 32);
  v93[0] = CFSTR("MfgData");
  v108[0] = createStringWithBytes((UInt8 *)updateThread_batteryInfo, 0x12uLL);
  v93[1] = CFSTR("Serial");
  *(_QWORD *)valuePtr = word_255EB3802;
  v108[1] = CFNumberCreate(v4, kCFNumberIntType, valuePtr);
  v93[2] = CFSTR("DesignCapacity");
  v64 = (unsigned __int16)word_255EB3836;
  values = CFNumberCreate(v4, kCFNumberIntType, &v64);
  if (values)
  {
    *(_QWORD *)&v109 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x24BDBD690]);
    *(_QWORD *)&v94 = CFSTR("Qmax");
    CFRelease(values);
    v5 = 4;
  }
  else
  {
    v5 = 3;
  }
  v63 = word_255EB380C;
  v108[v5 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v63);
  v93[v5] = CFSTR("MaxCapacity");
  v62 = (unsigned __int16)word_255EB3834;
  v6 = CFNumberCreate(v4, kCFNumberIntType, &v62);
  v7 = 8 * v5 + 8;
  *(_QWORD *)((char *)&v108[-1] + v7) = v6;
  *(void **)((char *)v93 + v7) = CFSTR("CycleCount");
  v61 = (unsigned __int16)word_255EB3838;
  v8 = CFNumberCreate(v4, kCFNumberIntType, &v61);
  v9 = 8 * v5 + 16;
  *(_QWORD *)((char *)&v108[-1] + v9) = v8;
  *(void **)((char *)v93 + v9) = CFSTR("StateOfCharge");
  v60 = word_255EB380A;
  v10 = CFNumberCreate(v4, kCFNumberIntType, &v60);
  v11 = 8 * v5 + 24;
  *(_QWORD *)((char *)&v108[-1] + v11) = v10;
  *(void **)((char *)v93 + v11) = CFSTR("Voltage");
  v59 = (unsigned __int16)word_255EB383A;
  v12 = CFNumberCreate(v4, kCFNumberIntType, &v59);
  v13 = 8 * v5 + 32;
  *(_QWORD *)((char *)&v108[-1] + v13) = v12;
  *(void **)((char *)v93 + v13) = CFSTR("Flags");
  StringWithBytes = createStringWithBytes((UInt8 *)updateThread_batteryInfo + 2, 4uLL);
  v15 = 8 * v5 + 40;
  *(_QWORD *)((char *)&v108[-1] + v15) = StringWithBytes;
  *(void **)((char *)v93 + v15) = CFSTR("ManufactureDate");
  v58 = word_255EB3800;
  v16 = CFNumberCreate(v4, kCFNumberSInt16Type, &v58);
  v17 = 8 * v5 + 48;
  *(_QWORD *)((char *)&v108[-1] + v17) = v16;
  *(void **)((char *)v93 + v17) = CFSTR("ChemID");
  v18 = v5 + 7;
  if (word_255EB3806 != 1536)
  {
    v57 = (unsigned __int16)word_255EB383C;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v57);
    v93[v18] = CFSTR("FullAvailableCapacity");
    v18 = v5 | 8;
    if ((unsigned __int16)word_255EB3806 < 0x313u)
      goto LABEL_20;
  }
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0;
  v92 = time(0);
  keys[0] = CFSTR("UpdateTime");
  v126[0] = CFNumberCreate(v4, kCFNumberLongType, &v92);
  keys[1] = CFSTR("MaximumTemperature");
  v91 = (__int16)(byte_255EB383E << 8) | byte_255EB383F;
  v126[1] = CFNumberCreate(v4, kCFNumberIntType, &v91);
  keys[2] = CFSTR("MinimumTemperature");
  v90 = (__int16)(byte_255EB3840 << 8) | byte_255EB3841;
  v126[2] = CFNumberCreate(v4, kCFNumberIntType, &v90);
  keys[3] = CFSTR("MaximumPackVoltage");
  v89 = (__int16)(byte_255EB3842 << 8) | byte_255EB3843;
  v126[3] = CFNumberCreate(v4, kCFNumberIntType, &v89);
  keys[4] = CFSTR("MinimumPackVoltage");
  v88 = (__int16)(byte_255EB3844 << 8) | byte_255EB3845;
  v126[4] = CFNumberCreate(v4, kCFNumberIntType, &v88);
  keys[5] = CFSTR("MaximumChargeCurrent");
  v87 = (__int16)(byte_255EB3846 << 8) | byte_255EB3847;
  v126[5] = CFNumberCreate(v4, kCFNumberIntType, &v87);
  keys[6] = CFSTR("MaximumDischargeCurrent");
  v86 = (__int16)(byte_255EB3848 << 8) | byte_255EB3849;
  v126[6] = CFNumberCreate(v4, kCFNumberIntType, &v86);
  keys[7] = CFSTR("MaximumOverChargedCapacity");
  v85 = (__int16)(byte_255EB384A << 8) | byte_255EB384B;
  v126[7] = CFNumberCreate(v4, kCFNumberIntType, &v85);
  keys[8] = CFSTR("MaximumOverDischargedCapacity");
  v84 = (__int16)(byte_255EB384C << 8) | byte_255EB384D;
  v126[8] = CFNumberCreate(v4, kCFNumberIntType, &v84);
  keys[9] = CFSTR("MaximumFCC");
  v83 = (__int16)(byte_255EB384E << 8) | byte_255EB384F;
  v126[9] = CFNumberCreate(v4, kCFNumberIntType, &v83);
  keys[10] = CFSTR("MinimumFCC");
  v82 = (__int16)(byte_255EB3850 << 8) | byte_255EB3851;
  v126[10] = CFNumberCreate(v4, kCFNumberIntType, &v82);
  keys[11] = CFSTR("MaximumDeltaVoltage");
  v81 = (__int16)(byte_255EB3852 << 8) | byte_255EB3853;
  v126[11] = CFNumberCreate(v4, kCFNumberIntType, &v81);
  keys[12] = CFSTR("MinimumDeltaVoltage");
  v80 = (__int16)(byte_255EB3854 << 8) | byte_255EB3855;
  v126[12] = CFNumberCreate(v4, kCFNumberIntType, &v80);
  keys[13] = CFSTR("LowAvgCurrentLastRun");
  v79 = (__int16)(byte_255EB3856 << 8) | byte_255EB3857;
  v126[13] = CFNumberCreate(v4, kCFNumberIntType, &v79);
  keys[14] = CFSTR("HighAvgCurrentLastRun");
  v78 = (__int16)(byte_255EB3858 << 8) | byte_255EB3859;
  v126[14] = CFNumberCreate(v4, kCFNumberIntType, &v78);
  keys[15] = CFSTR("MaximumQmax");
  v77 = (__int16)(byte_255EB385A << 8) | byte_255EB385B;
  v126[15] = CFNumberCreate(v4, kCFNumberIntType, &v77);
  keys[16] = CFSTR("MinimumQmax");
  v76 = (__int16)(byte_255EB385C << 8) | byte_255EB385D;
  v126[16] = CFNumberCreate(v4, kCFNumberIntType, &v76);
  keys[17] = CFSTR("MaximumRa0-8");
  v75 = (__int16)(byte_255EB385E << 8) | byte_255EB385F;
  v126[17] = CFNumberCreate(v4, kCFNumberIntType, &v75);
  keys[18] = CFSTR("MinimumRa0-8");
  v74 = (__int16)(byte_255EB3860 << 8) | byte_255EB3861;
  v126[18] = CFNumberCreate(v4, kCFNumberIntType, &v74);
  keys[19] = CFSTR("AverageTemperature");
  v73 = byte_255EB3862;
  v126[19] = CFNumberCreate(v4, kCFNumberIntType, &v73);
  keys[20] = CFSTR("TemperatureSamples");
  v72 = bswap32(unk_255EB3863);
  v126[20] = CFNumberCreate(v4, kCFNumberIntType, &v72);
  keys[21] = CFSTR("FlashWriteCount");
  v71 = __rev16(unk_255EB3867);
  *(_QWORD *)&v127 = CFNumberCreate(v4, kCFNumberIntType, &v71);
  *(_QWORD *)&v123 = CFSTR("RDISCnt");
  v70 = __rev16(unk_255EB3869);
  *((_QWORD *)&v127 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v70);
  *((_QWORD *)&v123 + 1) = CFSTR("CycleCountLastQmax");
  v69 = byte_255EB386B;
  *(_QWORD *)&v128 = CFNumberCreate(v4, kCFNumberIntType, &v69);
  if ((unsigned __int16)word_255EB3806 < 0x501u)
  {
    if ((unsigned __int16)word_255EB3806 < 0x313u)
    {
      v22 = 24;
      goto LABEL_12;
    }
    v19 = &word_255EB386E;
  }
  else
  {
    v19 = &word_255EB386C;
  }
  v20 = __rev16((unsigned __int16)*v19);
  *(_QWORD *)&v124 = CFSTR("TotalOperatingTime");
  v68 = v20;
  *((_QWORD *)&v128 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v68);
  v21 = *((unsigned __int8 *)v19 + 2);
  *((_QWORD *)&v124 + 1) = CFSTR("TimeAbove95Perc");
  v67 = v21;
  *(_QWORD *)&v129 = CFNumberCreate(v4, kCFNumberIntType, &v67);
  v22 = 26;
LABEL_12:
  keys[v22] = CFSTR("Raw");
  v126[v22] = CFDataCreate(v4, (const UInt8 *)&byte_255EB383E, 64);
  v23 = CFDictionaryCreate(v4, (const void **)keys, (const void **)v126, v22 | 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
  {
    CFRelease(v126[v22]);
    v24 = v22-- + 1;
  }
  while (v24 > 1);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      parseBatteryData_cold_2();
      if (!a1)
        goto LABEL_22;
LABEL_21:
      v56 = (unsigned __int16)word_255EB3818;
      v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v56);
      v93[v18] = CFSTR("ITMiscStatus");
      v55 = word_255EB3818 & 3;
      v25 = CFNumberCreate(v4, kCFNumberIntType, &v55);
      v26 = 8 * v18 + 8;
      *(_QWORD *)((char *)&v108[-1] + v26) = v25;
      *(void **)((char *)v93 + v26) = CFSTR("ITSimulationCounter");
      v18 += 2;
      goto LABEL_22;
    }
LABEL_20:
    if (!a1)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (a2)
    CFShow(v23);
  v108[v18 - 1] = v23;
  v93[v18++] = CFSTR("LifetimeData");
  if (a1)
    goto LABEL_21;
LABEL_22:
  if ((unsigned __int16)word_255EB3806 >= 0x600u)
  {
    *(_QWORD *)&valuePtr[4] = CFDataCreate(v4, (const UInt8 *)&word_255EB387E, 32);
    if (*(_QWORD *)&valuePtr[4])
    {
      v108[v18 - 1] = CFArrayCreate(v4, (const void **)&valuePtr[4], 1, MEMORY[0x24BDBD690]);
      v93[v18++] = CFSTR("RaTableRaw");
      CFRelease(*(CFTypeRef *)&valuePtr[4]);
    }
    v54 = (unsigned __int16)word_255EB38D4;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v54);
    v93[v18] = CFSTR("WeightedRa");
    v53 = (unsigned __int16)word_255EB38D6;
    v27 = CFNumberCreate(v4, kCFNumberIntType, &v53);
    v28 = 8 * v18 + 8;
    *(_QWORD *)((char *)&v108[-1] + v28) = v27;
    *(void **)((char *)v93 + v28) = CFSTR("ChemicalWeightedRa");
    v52 = dword_255EB38D0;
    v29 = CFNumberCreate(v4, kCFNumberIntType, &v52);
    v30 = 8 * v18 + 16;
    *(_QWORD *)((char *)&v108[-1] + v30) = v29;
    *(void **)((char *)v93 + v30) = CFSTR("BatteryHealthMetric");
    v31 = v18 + 3;
    if ((unsigned __int16)word_255EB3806 < 0x600u)
    {
      v18 += 3;
    }
    else
    {
      v108[v31 - 1] = CFDataCreate(v4, byte_255EB389E, 32);
      v93[v31] = CFSTR("iMaxAndSocSmoothTable");
      v51 = __rev16(*(unsigned __int16 *)&byte_255EB389E[1]);
      v32 = CFNumberCreate(v4, kCFNumberIntType, &v51);
      v33 = 8 * v18 + 32;
      *(_QWORD *)((char *)&v108[-1] + v33) = v32;
      *(void **)((char *)v93 + v33) = CFSTR("RSS");
      v18 += 5;
    }
  }
  v50 = (unsigned __int16)word_255EB381C;
  v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v50);
  v93[v18] = CFSTR("ResScale");
  v49 = word_255EB381E;
  v34 = CFNumberCreate(v4, kCFNumberIntType, &v49);
  v35 = 8 * v18 + 8;
  *(_QWORD *)((char *)&v108[-1] + v35) = v34;
  *(void **)((char *)v93 + v35) = CFSTR("Qstart");
  v48 = word_255EB3820;
  v36 = CFNumberCreate(v4, kCFNumberIntType, &v48);
  v37 = 8 * v18 + 16;
  *(_QWORD *)((char *)&v108[-1] + v37) = v36;
  *(void **)((char *)v93 + v37) = CFSTR("PassedCharge");
  v38 = v18 + 3;
  v47 = (unsigned __int16)word_255EB3822;
  values = CFNumberCreate(v4, kCFNumberIntType, &v47);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x24BDBD690]);
    v93[v38] = CFSTR("DOD0");
    v38 = v18 + 4;
    CFRelease(values);
  }
  v46 = word_255EB381A;
  values = CFNumberCreate(v4, kCFNumberIntType, &v46);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x24BDBD690]);
    v93[v38++] = CFSTR("PresentDOD");
    CFRelease(values);
  }
  v45 = (unsigned __int16)word_255EB383A;
  v108[v38 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v45);
  v93[v38] = CFSTR("GaugeFlagRaw");
  v44 = gauge_reset_count;
  v39 = CFNumberCreate(v4, kCFNumberLongLongType, &v44);
  v40 = 8 * v38 + 8;
  *(_QWORD *)((char *)&v108[-1] + v40) = v39;
  *(void **)((char *)v93 + v40) = CFSTR("GaugeResetCounter");
  if (v38 >= 27)
    parseBatteryData_cold_1();
  v41 = CFDictionaryCreate(v4, (const void **)v93, (const void **)&v107, v38 + 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v38 >= -1)
  {
    do
    {
      CFRelease((CFTypeRef)v108[v38]);
      v42 = v38 + 2;
      --v38;
    }
    while (v42 > 1);
  }
  return v41;
}

__darwin_time_t UpSeconds()
{
  timeval v1;

  if (!UpSeconds_boottime)
  {
    v1.tv_sec = 16;
    sysctlbyname("kern.boottime", &UpSeconds_boottime, (size_t *)&v1, 0, 0);
  }
  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec - UpSeconds_boottime;
}

CFStringRef createStringWithBytes(UInt8 *bytes, unint64_t a2)
{
  unint64_t v2;
  unsigned int v3;

  v2 = 0;
  if (a2)
  {
    v3 = 1;
    do
    {
      if (!bytes[v2])
        break;
      v2 = v3++;
    }
    while (v2 < a2);
  }
  return CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
}

uint64_t GGHIDQueryInterface(uint64_t a1, CFUUIDBytes a2, _QWORD *a3)
{
  uint64_t v4;
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  int v8;
  uint64_t v9;
  CFUUIDRef v10;
  int v11;
  CFUUIDRef v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  v8 = CFEqual(v5, v7);
  v9 = v4;
  if (!v8)
  {
    v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v11 = CFEqual(v5, v10);
    v9 = v4;
    if (!v11)
    {
      v12 = CFUUIDGetConstantUUIDWithBytes(v6, 0x6Fu, 0xE2u, 0x2Au, 0xBFu, 0x68u, 0xB9u, 0x11u, 0xDBu, 0xA7u, 0x1Fu, 0, 0x16u, 0xCBu, 0xC1u, 0x10u, 0xF7u);
      if (!CFEqual(v5, v12))
      {
        v13 = 2147483652;
        goto LABEL_6;
      }
      v9 = v4 + 16;
    }
  }
  v13 = 0;
  *a3 = v9;
  ++*(_DWORD *)(v4 + 40);
LABEL_6:
  CFRelease(v5);
  return v13;
}

uint64_t GGHIDAddRef(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 8);
  result = (*(_DWORD *)(v1 + 40) + 1);
  *(_DWORD *)(v1 + 40) = result;
  return result;
}

uint64_t GGHIDRelease(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  const __CFUUID *v4;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_DWORD *)(v1 + 40);
  v3 = (v2 - 1);
  *(_DWORD *)(v1 + 40) = v3;
  if (v2 == 1)
  {
    v4 = *(const __CFUUID **)(v1 + 32);
    GGHIDStop(a1);
    free((void *)v1);
    CFPlugInRemoveInstanceForFactory(v4);
    CFRelease(v4);
  }
  return v3;
}

uint64_t GGHIDProbe(int a1, int a2, io_object_t object)
{
  uint64_t result;
  stat v4;

  if (!object)
    return 3758097090;
  if (!IOObjectConformsTo(object, "AppleHDQGasGaugeControl"))
    return 3758097090;
  memset(&v4, 0, sizeof(v4));
  result = stat("/dev/cu.gas-gauge", &v4);
  if ((_DWORD)result)
    return 3758097090;
  return result;
}

uint64_t GGHIDStart(uint64_t a1, int a2, io_service_t service)
{
  uint64_t v3;
  io_connect_t *v4;
  uint64_t v5;
  uint64_t v6;
  mach_port_t v7;
  int v9;
  _OWORD v10[8];
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
  size_t outputStructCnt;

  v3 = *(_QWORD *)(a1 + 8);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  memset(v10, 0, sizeof(v10));
  v4 = (io_connect_t *)(v3 + 44);
  v5 = IOServiceOpen(service, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)(v3 + 44));
  if ((_DWORD)v5)
  {
    v6 = v5;
LABEL_5:
    *v4 = 0;
    return v6;
  }
  v7 = *v4;
  outputStructCnt = 352;
  v6 = IOConnectCallStructMethod(v7, 2u, 0, 0, v10, &outputStructCnt);
  if ((_DWORD)v6)
  {
    IOServiceClose(*v4);
    goto LABEL_5;
  }
  v9 = DWORD2(v11);
  if (DWORD2(v11) == -1)
    v9 = 1413951554;
  LODWORD(outputStructCnt) = v9;
  *(_QWORD *)(v3 + 48) = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &outputStructCnt);
  *(_DWORD *)(v3 + 72) = DWORD2(v12);
  return v6;
}

uint64_t GGHIDStop(uint64_t a1)
{
  uint64_t v1;
  io_connect_t v2;
  const void *v3;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_DWORD *)(v1 + 44);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(v1 + 44) = 0;
  }
  v3 = *(const void **)(v1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(v1 + 48) = 0;
  }
  return 0;
}

CFDictionaryRef GGHIDCopyProperty(uint64_t a1, CFTypeRef cf1)
{
  uint64_t v3;
  const __CFAllocator *v4;
  const void *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  void *v8;
  const void **v9;
  const void *v10;
  uint64_t v11;
  CFDictionaryRef v12;
  unint64_t v13;
  void *keys[7];
  __int128 v16;
  __int128 v17;
  void *values[7];
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  if (CFEqual(cf1, CFSTR("ServicePluginDebug")))
  {
    v19 = 0u;
    v20 = 0u;
    v16 = 0u;
    v17 = 0u;
    values[0] = CFSTR("AppleHDQGasGaugeHID");
    keys[0] = CFSTR("PluginName");
    keys[1] = CFSTR("TemperatureEventCnt");
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    values[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, (const void *)(v3 + 88));
    keys[2] = CFSTR("TemperatureEventFailCnt");
    values[2] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 96));
    keys[3] = CFSTR("TemperatureEventConsFailCnt");
    values[3] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 104));
    keys[4] = CFSTR("LastCalledTs");
    values[4] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 112));
    keys[5] = CFSTR("LastErrTs");
    values[5] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 120));
    keys[6] = CFSTR("LastSuccessTs");
    values[6] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 128));
    v5 = *(const void **)(v3 + 136);
    if (v5)
    {
      *(_QWORD *)&v16 = CFSTR("ErrorHistory");
      *(_QWORD *)&v19 = v5;
      CFRetain(v5);
      v6 = 8;
    }
    else
    {
      v6 = 7;
    }
    v8 = *(void **)(v3 + 144);
    if (v8)
    {
      keys[v6] = CFSTR("ErrorCounts");
      values[v6] = v8;
      CFRetain(v8);
      ++v6;
    }
    keys[v6] = CFSTR("ErrorInjection");
    if (*(_BYTE *)(v3 + 76))
      v9 = (const void **)MEMORY[0x24BDBD270];
    else
      v9 = (const void **)MEMORY[0x24BDBD268];
    v10 = *v9;
    values[v6] = (void *)*v9;
    CFRetain(v10);
    v11 = v6 + 1;
    keys[v6 + 1] = CFSTR("ErrorInjectionCode");
    values[v6 + 1] = CFNumberCreate(v4, kCFNumberSInt32Type, (const void *)(v3 + 80));
    v12 = CFDictionaryCreate(v4, (const void **)keys, (const void **)values, v6 + 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    do
    {
      CFRelease(values[v11]);
      v13 = v11-- + 1;
    }
    while (v13 > 1);
  }
  else
  {
    if (CFEqual(cf1, CFSTR("PrimaryUsagePage")))
      v7 = *(const __CFDictionary **)(v3 + 56);
    else
      v7 = 0;
    if (CFEqual(cf1, CFSTR("PrimaryUsage")))
      v7 = *(const __CFDictionary **)(v3 + 64);
    if (CFEqual(cf1, CFSTR("LocationID")))
      v7 = *(const __CFDictionary **)(v3 + 48);
    if (CFEqual(cf1, CFSTR("Product")))
      v12 = (CFDictionaryRef)CFSTR("gas gauge battery");
    else
      v12 = v7;
    if (v12)
      CFRetain(v12);
  }
  return v12;
}

uint64_t GGHIDSetProperty(uint64_t a1, CFTypeRef cf1, const __CFNumber *a3)
{
  uint64_t v5;
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v8;
  BOOL v9;
  CFTypeID v10;
  int valuePtr;

  v5 = *(_QWORD *)(a1 + 8);
  if (CFEqual(cf1, CFSTR("ErrorInjectionCode")))
  {
    TypeID = CFNumberGetTypeID();
    if (a3 && CFGetTypeID(a3) == TypeID)
    {
      CFNumberGetValue(a3, kCFNumberSInt32Type, (void *)(v5 + 80));
      return 1;
    }
  }
  else
  {
    result = CFEqual(cf1, CFSTR("ErrorInjection"));
    if (!(_DWORD)result)
      return result;
    v8 = CFBooleanGetTypeID();
    if (a3)
    {
      if (CFGetTypeID(a3) == v8)
      {
        v9 = *MEMORY[0x24BDBD270] == (_QWORD)a3;
      }
      else
      {
        v10 = CFNumberGetTypeID();
        if (CFGetTypeID(a3) != v10)
          return 0;
        valuePtr = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        v9 = valuePtr != 0;
      }
      *(_BYTE *)(v5 + 76) = v9;
      return 1;
    }
    CFNumberGetTypeID();
  }
  return 0;
}

uint64_t GGHIDCopyEvent(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_port_t v4;
  kern_return_t v5;
  BOOL v6;
  mach_port_t v7;
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  CFAllocatorRef *v11;
  const __CFArray *Mutable;
  CFNumberRef v13;
  CFNumberRef v14;
  uint64_t v15;
  uint64_t v16;
  const __CFAllocator *v17;
  CFStringRef v18;
  CFStringRef v19;
  const __CFNumber *Value;
  int v21;
  CFNumberRef v22;
  CFNumberRef v23;
  NSObject *v24;
  NSObject *v25;
  mach_port_t v26;
  kern_return_t v27;
  kern_return_t v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t input;
  timespec __tp;
  uint32_t outputCnt;
  int v42;
  kern_return_t valuePtr;
  uint64_t output;
  _BYTE __str[12];
  __int16 v46;
  _BYTE v47[28];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (a2 == 15)
  {
    v2 = *(_QWORD *)(a1 + 8);
    outputCnt = 1;
    output = 0;
    __tp.tv_sec = 0;
    __tp.tv_nsec = 0;
    if (!clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp))
      *(_QWORD *)(v2 + 112) = __tp.tv_nsec / 1000 + 1000000 * __tp.tv_sec;
    v3 = *(_QWORD *)(v2 + 88);
    if (v3 != -1)
      *(_QWORD *)(v2 + 88) = v3 + 1;
    if (*(_DWORD *)(v2 + 72))
    {
      v4 = *(_DWORD *)(v2 + 44);
      input = 0;
      v5 = IOConnectCallScalarMethod(v4, 0x10u, &input, 1u, 0, 0);
      v6 = v5 == -536870183 || v5 == 0;
      if (!v6 && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        GGHIDCopyEvent_cold_1();
    }
    v7 = *(_DWORD *)(v2 + 44);
    v38 = 6;
    v8 = IOConnectCallScalarMethod(v7, 8u, &v38, 1u, &output, &outputCnt);
    if (*(_BYTE *)(v2 + 76))
      v9 = *(_DWORD *)(v2 + 80);
    else
      v9 = v8;
    valuePtr = v9;
    v11 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
    if (v9)
    {
      Mutable = *(const __CFArray **)(v2 + 136);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 10, MEMORY[0x24BDBD690]);
        *(_QWORD *)(v2 + 136) = Mutable;
      }
      if (!*(_QWORD *)(v2 + 144))
      {
        *(_QWORD *)(v2 + 144) = CFDictionaryCreateMutable(*v11, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        Mutable = *(const __CFArray **)(v2 + 136);
      }
      *(_QWORD *)(v2 + 120) = *(_QWORD *)(v2 + 112);
      if (CFArrayGetCount(Mutable) >= 10)
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v2 + 136), 0);
      if (*(_QWORD *)(v2 + 136))
      {
        v13 = CFNumberCreate(*v11, kCFNumberIntType, &valuePtr);
        if (v13)
        {
          v14 = v13;
          CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 136), v13);
          CFRelease(v14);
        }
      }
      v15 = *(_QWORD *)(v2 + 96);
      if (v15 != -1)
        *(_QWORD *)(v2 + 96) = v15 + 1;
      v16 = *(_QWORD *)(v2 + 104);
      if (v16 != -1)
        *(_QWORD *)(v2 + 104) = v16 + 1;
      if (*(_QWORD *)(v2 + 144))
      {
        *(_DWORD *)&__str[7] = 0;
        *(_QWORD *)__str = 0;
        snprintf(__str, 0xBuLL, "%#x", valuePtr);
        v17 = *v11;
        v18 = CFStringCreateWithCString(*v11, __str, 0x8000100u);
        if (v18)
        {
          v19 = v18;
          v42 = 0;
          Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 144), v18);
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberIntType, &v42);
            v21 = v42 + 1;
          }
          else
          {
            v21 = 1;
          }
          v42 = v21;
          v22 = CFNumberCreate(v17, kCFNumberIntType, &v42);
          if (v22)
          {
            v23 = v22;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v2 + 144), v19, v22);
            CFRelease(v23);
          }
          CFRelease(v19);
        }
      }
      v24 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(v2 + 96);
        v32 = *(_QWORD *)(v2 + 104);
        *(_DWORD *)__str = 136315906;
        *(_QWORD *)&__str[4] = "GGHID_log_error";
        v46 = 1024;
        *(_DWORD *)v47 = valuePtr;
        *(_WORD *)&v47[4] = 2048;
        *(_QWORD *)&v47[6] = v31;
        *(_WORD *)&v47[14] = 2048;
        *(_QWORD *)&v47[16] = v32;
        _os_log_error_impl(&dword_231046000, v24, OS_LOG_TYPE_ERROR, "%s: cannot read temperature: rc:%u cnt:%zu ccnt:%zu", __str, 0x26u);
      }
      if (*(_QWORD *)(v2 + 112) - *(_QWORD *)(v2 + 128) >= 0x9896801uLL)
      {
        v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_FAULT))
        {
          v33 = *(_QWORD *)(v2 + 96);
          v34 = *(_QWORD *)(v2 + 104);
          v35 = *(_QWORD *)(v2 + 136);
          v36 = *(_QWORD *)(v2 + 144);
          *(_DWORD *)__str = 134218754;
          *(_QWORD *)&__str[4] = v33;
          v46 = 2048;
          *(_QWORD *)v47 = v34;
          *(_WORD *)&v47[8] = 2112;
          *(_QWORD *)&v47[10] = v35;
          *(_WORD *)&v47[18] = 2112;
          *(_QWORD *)&v47[20] = v36;
          _os_log_fault_impl(&dword_231046000, v25, OS_LOG_TYPE_FAULT, "cnt:%zu ccnt:%zu errs:%@ errCnts:%@", __str, 0x2Au);
        }
      }
      if (v9 == -536870183)
        goto LABEL_52;
      if (v9 == -536870163)
      {
LABEL_51:
        v10 = 0;
        gRestrictLogMessagesCounter = gRestrictLogCounter;
        return v10;
      }
    }
    else
    {
      *(_QWORD *)(v2 + 104) = 0;
      *(_QWORD *)(v2 + 128) = *(_QWORD *)(v2 + 112);
    }
    if (*(_DWORD *)(v2 + 72)
      && (v26 = *(_DWORD *)(v2 + 44), v37 = 1, (v27 = IOConnectCallScalarMethod(v26, 0x10u, &v37, 1u, 0, 0)) != 0)
      && (v28 = v27, v29 = logger, os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)__str = 136315650;
      *(_QWORD *)&__str[4] = "GGHID_GetTemperature";
      v46 = 1024;
      *(_DWORD *)v47 = 4343;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v28;
      _os_log_error_impl(&dword_231046000, v29, OS_LOG_TYPE_ERROR, "%s:%d cannot enable interrupts (%x)", __str, 0x18u);
      if (v9)
        goto LABEL_51;
    }
    else if (v9)
    {
      goto LABEL_51;
    }
LABEL_52:
    gRestrictLogMessagesCounter = 0;
    mach_absolute_time();
    v10 = IOHIDEventCreate();
    IOHIDEventSetFloatValue();
    return v10;
  }
  return 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

_BYTE *OUTLINED_FUNCTION_8(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void ggctl_connect_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "AppleHDQGasGaugeControl";
  OUTLINED_FUNCTION_9(&dword_231046000, a1, a3, "could not find %s service", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void ggctl_connect_cold_2(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_5(&dword_231046000, a2, a3, "could not open service: %#x", (uint8_t *)v3);
  OUTLINED_FUNCTION_3();
}

void ggctl_reset_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_231046000, v0, v1, "gas gauge: cannot issue a reset", v2);
  OUTLINED_FUNCTION_3();
}

void ggctl_open_device_cold_1(NSObject *a1)
{
  int *v2;
  char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136315394;
  v5 = "checkreset";
  v6 = 2080;
  v7 = v3;
  _os_log_error_impl(&dword_231046000, a1, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_11();
}

void ggctl_open_device_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_231046000, v0, v1, "gas gauge: cannot determine the state of SWI line", v2);
  OUTLINED_FUNCTION_3();
}

void ggctl_open_device_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_231046000, v0, v1, "gas gauge: SWI line low, issuing reset", v2);
  OUTLINED_FUNCTION_3();
}

void ggctl_open_device_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_231046000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void logBatteryDiagnosticData_cold_1()
{
  os_log_t v0;
  _WORD v1[10];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 2373;
  v1[9] = 2080;
  v2 = "IOPMPowerSource";
  _os_log_error_impl(&dword_231046000, v0, OS_LOG_TYPE_ERROR, "%s:%d cannot find service %s\n", (uint8_t *)v1, 0x1Cu);
}

void updateThread_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_231046000, v0, v1, "gasgauge: could not register for system power notifications", v2);
  OUTLINED_FUNCTION_3();
}

void updateThread_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_231046000, v2, (uint64_t)v2, "gasgauge: SWI line, cannot determine the state of line", v3);
}

void updateThread_cold_3(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = -1;
  OUTLINED_FUNCTION_5(&dword_231046000, a3, (uint64_t)a3, "cannot drain the data log (%d)", a1);
}

void updateThread_cold_4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_231046000, v2, (uint64_t)v2, "num_client<0, client error?", v3);
}

void updateThread_cold_5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_231046000, v2, (uint64_t)v2, "gasgauge: SWI line low reset disabled, ignoring", v3);
}

void updateThread_cold_6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_231046000, v2, (uint64_t)v2, "gasgauge: SWI line low issuing reset", v3);
}

void updateThread_cold_7(NSObject *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  int v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  v3 = strerror(*v2);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_9(&dword_231046000, a1, v4, "could not find hw.model: %s", (uint8_t *)&v5);
  OUTLINED_FUNCTION_11();
}

void updateThread_cold_8(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_5(&dword_231046000, a2, a3, "gasgauge: could not register for battery events err=%x", (uint8_t *)v3);
  OUTLINED_FUNCTION_3();
}

void updateThread_cold_9(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136315138;
  v5 = mach_error_string(a1);
  OUTLINED_FUNCTION_9(&dword_231046000, a2, v3, "gasgauge: could not map data log: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_11();
}

void updateThread_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_231046000, v0, v1, "gasgauge: could not register for power source events", v2);
  OUTLINED_FUNCTION_3();
}

void updateThermalCoolDownState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_231046000, v0, v1, "%s:%d cannot update thermal state", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void statsAndLogs_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_231046000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void statsAndLogs_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_231046000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void debugLog_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_231046000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void debugLog_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_231046000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void dynamicATV_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = -1;
  OUTLINED_FUNCTION_5(&dword_231046000, a1, a3, "dynATV: cannot write to charger startus (%d)", (uint8_t *)v3);
  OUTLINED_FUNCTION_3();
}

void parseBatteryData_cold_1()
{
  __assert_rtn("parseBatteryData", "AppleHDQGasGauge.c", 1565, "batteryDataCount<=kNumBatteryDataUpdateKeys");
}

void parseBatteryData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_231046000, v0, v1, "Cannot create the lifetime dictionary", v2);
  OUTLINED_FUNCTION_3();
}

void GGHIDCopyEvent_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_231046000, v0, v1, "%s:%d cannot disable interrupts (%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC140](factoryID);
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC148](factoryID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
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

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC560](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
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

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F80](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x24BDD8158]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x24BDD8318]();
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

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x24BDD8930](*(_QWORD *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x24BDAC510]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
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

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t logLineForAppleCare()
{
  return MEMORY[0x24BE29FB8]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

