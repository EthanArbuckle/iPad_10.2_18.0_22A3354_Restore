uint64_t EXDisplayPipeOpen(io_connect_t **a1)
{
  uint64_t v1;
  io_connect_t *v3;
  const char *v4;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_connect_t *v8;
  kern_return_t v9;
  mach_port_t mainPort;

  v1 = 3758097084;
  mainPort = *MEMORY[0x24BDD8B18];
  if (!a1)
    return 3758097090;
  v3 = (io_connect_t *)malloc_type_malloc(0xCuLL, 0x100004005A209FEuLL);
  *a1 = v3;
  if (!v3)
    return 3758097085;
  if (MEMORY[0x23B858F6C](0, &mainPort))
  {
    v4 = "error: master port failure";
LABEL_5:
    puts(v4);
    return v1;
  }
  v6 = IOServiceMatching("EXDisplayPipe");
  if (!v6)
  {
    v4 = "error: failed to create matching class";
    goto LABEL_5;
  }
  MatchingService = IOServiceGetMatchingService(mainPort, v6);
  v8 = *a1;
  (*a1)[1] = MatchingService;
  if (!MatchingService)
  {
    v4 = "error: service is null";
    goto LABEL_5;
  }
  v9 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, v8);
  if (v9)
  {
    printf("error: unable to open service %x\n", v9);
  }
  else
  {
    v1 = 0;
    *((_BYTE *)*a1 + 8) = 1;
  }
  return v1;
}

uint64_t EXDisplayPipeClose(io_connect_t **a1)
{
  io_connect_t *v2;
  uint64_t result;

  if (!a1)
    return 3758097090;
  v2 = *a1;
  if (v2)
  {
    if (*v2)
    {
      IOServiceClose(*v2);
      v2 = *a1;
      **a1 = 0;
    }
  }
  free(v2);
  result = 0;
  *a1 = 0;
  return result;
}

uint64_t EXDisplayPipeSetPower(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  kern_return_t v4;
  uint64_t input;

  v2 = 3758097112;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    input = a2;
    v4 = IOConnectCallMethod(*(_DWORD *)a1, 7u, &input, 1u, 0, 0, 0, 0, 0, 0);
    if (v4)
    {
      syslog(3, "%s: %u: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeSetPower", a2, v4);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t EXDisplayPipeShowIndicator(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  kern_return_t v5;
  uint64_t input;
  uint64_t inputStruct;

  v3 = 3758097112;
  inputStruct = a3;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    input = a2;
    v5 = IOConnectCallMethod(*(_DWORD *)a1, 1u, &input, 1u, &inputStruct, 8uLL, 0, 0, 0, 0);
    if (v5)
    {
      syslog(3, "%s: glyph %u: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeShowIndicator", a2, v5);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t EXDisplayPipeHideIndicator(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  kern_return_t v4;
  uint64_t input;

  v2 = 3758097112;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    input = a2;
    v4 = IOConnectCallMethod(*(_DWORD *)a1, 2u, &input, 1u, 0, 0, 0, 0, 0, 0);
    if (v4)
    {
      syslog(3, "%s: glyph %u: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeHideIndicator", a2, v4);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t EXDisplayPipeSetIndicators(uint64_t a1, void *inputStruct)
{
  uint64_t v2;
  kern_return_t v3;

  v2 = 3758097112;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    v3 = IOConnectCallMethod(*(_DWORD *)a1, 3u, 0, 0, inputStruct, 0x160uLL, 0, 0, 0, 0);
    if (v3)
    {
      syslog(3, "%s: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeSetIndicators", v3);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t EXDisplayPipeGetStatus(uint64_t a1, void *outputStruct)
{
  uint64_t v2;
  kern_return_t v3;
  size_t v5;

  v2 = 3758097112;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    v5 = 352;
    v3 = IOConnectCallMethod(*(_DWORD *)a1, 4u, 0, 0, 0, 0, 0, 0, outputStruct, &v5);
    if (v3)
    {
      syslog(3, "%s: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeGetStatus", v3);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t EXDisplayPipeSetLogLevel(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  kern_return_t v3;
  uint64_t input;

  v2 = 3758097112;
  input = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    v3 = IOConnectCallMethod(*(_DWORD *)a1, 5u, &input, 1u, 0, 0, 0, 0, 0, 0);
    if (v3)
    {
      syslog(3, "%s: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeSetLogLevel", v3);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t EXDisplayPipeSetLogMask(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  kern_return_t v3;
  uint64_t input;

  v2 = 3758097112;
  input = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    v3 = IOConnectCallMethod(*(_DWORD *)a1, 6u, &input, 1u, 0, 0, 0, 0, 0, 0);
    if (v3)
    {
      syslog(3, "%s: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeSetLogMask", v3);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t EXDisplayPipeSetALSSEnable(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  kern_return_t v3;
  uint64_t input;

  v2 = 3758097112;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    input = a2;
    v3 = IOConnectCallMethod(*(_DWORD *)a1, 8u, &input, 1u, 0, 0, 0, 0, 0, 0);
    if (v3)
    {
      syslog(3, "%s: IOConnectCallMethod returned 0x%x\n", "EXDisplayPipeSetALSSEnable", v3);
      return 3758097084;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

