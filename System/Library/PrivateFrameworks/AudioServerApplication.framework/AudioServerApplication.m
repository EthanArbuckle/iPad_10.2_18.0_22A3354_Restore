uint64_t InputOutputProc(int a1, const void *a2, unsigned int *a3, const void *a4, unsigned int *a5, const void *a6, _DWORD *a7)
{
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  unint64_t v20;
  _DWORD *v21;
  _DWORD *v22;
  uint64_t v23;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _DWORD *v29;
  uint64_t v30;
  unint64_t v31;
  _DWORD *v32;
  _DWORD *v33;
  unint64_t v34;
  AudioBufferList *v35;
  AudioBufferList *v36;
  uint64_t v37;
  unint64_t v38;
  AudioBufferList *v39;
  AudioBufferList *v40;
  uint64_t v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const void *v45;
  __int16 v46;
  unsigned int *v47;
  __int16 v48;
  const void *v49;
  __int16 v50;
  unsigned int *v51;
  __int16 v52;
  const void *v53;
  __int16 v54;
  _DWORD *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (!a2 || !a3 || !a4 || !a5 || !a6 || !a7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110656;
      v43 = a1;
      v44 = 2048;
      v45 = a2;
      v46 = 2048;
      v47 = a3;
      v48 = 2048;
      v49 = a4;
      v50 = 2048;
      v51 = a5;
      v52 = 2048;
      v53 = a6;
      v54 = 2048;
      v55 = a7;
      _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ASAPlaythrough IO Proc NULL argument %u %p %p %p %p %p %p", buf, 0x44u);
    }
    printf("ASAPlaythrough IO Proc NULL argument %u %p %p %p %p %p %p", a1, a2, a3, a4, a5, a6, a7);
    return 0;
  }
  v14 = a7[1];
  if ((_DWORD)v14)
  {
    v15 = 0;
    v16 = 0;
    v17 = *((_QWORD *)a7 + 5);
    do
    {
      v18 = *(_DWORD **)(v17 + 8 * v15);
      if (*v18)
      {
        v19 = 0;
        v20 = 0;
        do
        {
          v21 = &v18[v19];
          v22 = &v18[v19 + 2];
          if (v16 >= *a3)
          {
            *v22 = 0;
            *((_QWORD *)v21 + 2) = 0;
          }
          else
          {
            *(_OWORD *)v22 = *(_OWORD *)&a3[4 * v16++ + 2];
            v17 = *((_QWORD *)a7 + 5);
          }
          ++v20;
          v18 = *(_DWORD **)(v17 + 8 * v15);
          v19 += 4;
        }
        while (v20 < *v18);
        v14 = a7[1];
      }
      ++v15;
    }
    while (v15 < v14);
  }
  else
  {
    v14 = 0;
  }
  v25 = a7[2];
  if ((_DWORD)v25)
  {
    v26 = 0;
    v27 = 0;
    v28 = *((_QWORD *)a7 + 6);
    do
    {
      v29 = *(_DWORD **)(v28 + 8 * v26);
      if (*v29)
      {
        v30 = 0;
        v31 = 0;
        do
        {
          v32 = &v29[v30];
          v33 = &v29[v30 + 2];
          if (v27 >= *a5)
          {
            *v33 = 0;
            *((_QWORD *)v32 + 2) = 0;
          }
          else
          {
            *(_OWORD *)v33 = *(_OWORD *)&a5[4 * v27++ + 2];
            v28 = *((_QWORD *)a7 + 6);
          }
          ++v31;
          v29 = *(_DWORD **)(v28 + 8 * v26);
          v30 += 4;
        }
        while (v31 < *v29);
        v25 = a7[2];
      }
      ++v26;
    }
    while (v26 < v25);
    v14 = a7[1];
  }
  if (v14)
  {
    v34 = 0;
    do
    {
      v35 = *(AudioBufferList **)(*((_QWORD *)a7 + 5) + 8 * v34);
      if ((CheckAudioBufferList(&v35->mNumberBuffers) & 1) != 0)
      {
        v23 = 2003329396;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          InputOutputProc_cold_4(v34, (uint64_t)a4);
        return v23;
      }
      v36 = *(AudioBufferList **)(*((_QWORD *)a7 + 7) + 8 * v34);
      if ((CheckAudioBufferList(&v36->mNumberBuffers) & 1) != 0)
      {
        v23 = 2003329396;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          InputOutputProc_cold_3(v34, (uint64_t)a4);
        return v23;
      }
      v37 = AudioConverterConvertComplexBuffer(*(AudioConverterRef *)(*((_QWORD *)a7 + 3) + 8 * v34++), *a7, v35, v36);
    }
    while (v34 < a7[1]);
    v23 = v37;
    if ((_DWORD)v37)
      return v23;
  }
  if (!a7[2])
    return 0;
  v38 = 0;
  while (1)
  {
    v39 = (AudioBufferList *)*((_QWORD *)a7 + 8);
    if ((CheckAudioBufferList(&v39->mNumberBuffers) & 1) != 0)
      break;
    v40 = *(AudioBufferList **)(*((_QWORD *)a7 + 6) + 8 * v38);
    if ((CheckAudioBufferList(&v40->mNumberBuffers) & 1) != 0)
    {
      v23 = 2003329396;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        InputOutputProc_cold_1(v38, (uint64_t)a6);
      return v23;
    }
    v41 = AudioConverterConvertComplexBuffer(*(AudioConverterRef *)(*((_QWORD *)a7 + 4) + 8 * v38++), *a7, v39, v40);
    if (v38 >= a7[2])
      return v41;
  }
  v23 = 2003329396;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    InputOutputProc_cold_2(v38, (uint64_t)a6);
  return v23;
}

uint64_t CheckAudioBufferList(unsigned int *a1)
{
  _DWORD *v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  _DWORD *v5;
  _DWORD *v6;
  unsigned int v7;

  v3 = *a1;
  v1 = a1 + 2;
  v2 = v3;
  if (v3)
  {
    v4 = 0;
    v5 = &v1[4 * v2];
    while (1)
    {
      v6 = (_DWORD *)*((_QWORD *)v1 + 1);
      if (!v6)
        break;
      v7 = v1[1];
      if (v7 >= 4)
        v4 += *v6 + *(_DWORD *)((char *)v6 + (v7 & 0xFFFFFFFC) - 4);
      v1 += 4;
      if (v1 >= v5)
      {
        LODWORD(v2) = 0;
        return v2 | v4 & 0xFFFFFFFE;
      }
    }
    LODWORD(v2) = 1;
  }
  else
  {
    v4 = 0;
  }
  return v2 | v4 & 0xFFFFFFFE;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

double OUTLINED_FUNCTION_2@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return *(double *)a1;
}

void InputOutputProc_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C46C000, MEMORY[0x24BDACB70], v2, "Device %u playthrough: Bad proc output buffer list on stream %d, cycle %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

void InputOutputProc_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C46C000, MEMORY[0x24BDACB70], v2, "Device %u playthrough: Bad scratch output buffer list on stream %d, cycle %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

void InputOutputProc_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C46C000, MEMORY[0x24BDACB70], v2, "Device %u playthrough: Bad scratch input buffer list on stream %d, cycle %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

void InputOutputProc_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C46C000, MEMORY[0x24BDACB70], v2, "Device %u playthrough: Bad proc input buffer list on stream %d, cycle %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

OSStatus AudioConverterConvertComplexBuffer(AudioConverterRef inAudioConverter, UInt32 inNumberPCMFrames, const AudioBufferList *inInputData, AudioBufferList *outOutputData)
{
  return MEMORY[0x24BE0A6B0](inAudioConverter, *(_QWORD *)&inNumberPCMFrames, inInputData, outOutputData);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x24BE0A6B8](inAudioConverter);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x24BE0A6C0](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BE0A6C8](inAudioConverter, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioDeviceCreateIOProcID(AudioObjectID inDevice, AudioDeviceIOProc inProc, void *inClientData, AudioDeviceIOProcID *outIOProcID)
{
  return MEMORY[0x24BDBAEF0](*(_QWORD *)&inDevice, inProc, inClientData, outIOProcID);
}

OSStatus AudioDeviceDestroyIOProcID(AudioObjectID inDevice, AudioDeviceIOProcID inIOProcID)
{
  return MEMORY[0x24BDBAEF8](*(_QWORD *)&inDevice, inIOProcID);
}

OSStatus AudioDeviceStart(AudioObjectID inDevice, AudioDeviceIOProcID inProcID)
{
  return MEMORY[0x24BDBAF00](*(_QWORD *)&inDevice, inProcID);
}

OSStatus AudioDeviceStop(AudioObjectID inDevice, AudioDeviceIOProcID inProcID)
{
  return MEMORY[0x24BDBAF10](*(_QWORD *)&inDevice, inProcID);
}

OSStatus AudioHardwareCreateAggregateDevice(CFDictionaryRef inDescription, AudioObjectID *outDeviceID)
{
  return MEMORY[0x24BDBAF18](inDescription, outDeviceID);
}

OSStatus AudioHardwareDestroyAggregateDevice(AudioObjectID inDeviceID)
{
  return MEMORY[0x24BDBAF20](*(_QWORD *)&inDeviceID);
}

OSStatus AudioObjectAddPropertyListenerBlock(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, dispatch_queue_t inDispatchQueue, AudioObjectPropertyListenerBlock inListener)
{
  return MEMORY[0x24BDBAF30](*(_QWORD *)&inObjectID, inAddress, inDispatchQueue, inListener);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x24BDBAF38](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioObjectGetPropertyDataSize(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *outDataSize)
{
  return MEMORY[0x24BDBAF40](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, outDataSize);
}

Boolean AudioObjectHasProperty(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress)
{
  return MEMORY[0x24BDBAF48](*(_QWORD *)&inObjectID, inAddress);
}

OSStatus AudioObjectIsPropertySettable(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, Boolean *outIsSettable)
{
  return MEMORY[0x24BDBAF50](*(_QWORD *)&inObjectID, inAddress, outIsSettable);
}

OSStatus AudioObjectRemovePropertyListenerBlock(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, dispatch_queue_t inDispatchQueue, AudioObjectPropertyListenerBlock inListener)
{
  return MEMORY[0x24BDBAF60](*(_QWORD *)&inObjectID, inAddress, inDispatchQueue, inListener);
}

OSStatus AudioObjectSetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 inDataSize, const void *inData)
{
  return MEMORY[0x24BDBAF68](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, *(_QWORD *)&inDataSize, inData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

