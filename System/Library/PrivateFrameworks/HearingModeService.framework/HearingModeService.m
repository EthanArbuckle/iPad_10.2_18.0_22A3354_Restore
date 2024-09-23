uint64_t HMXPCGetNextClientID()
{
  unsigned int v0;
  uint64_t result;

  if (HMXPCGetNextClientID_sOnce != -1)
    dispatch_once(&HMXPCGetNextClientID_sOnce, &__block_literal_global);
  do
  {
    v0 = __ldaxr((unsigned int *)&HMXPCGetNextClientID_sNext);
    result = v0 + 1;
  }
  while (__stlxr(result, (unsigned int *)&HMXPCGetNextClientID_sNext));
  return result;
}

id HMEarLossDataToArray(void *a1)
{
  double v1;
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  _QWORD v21[9];

  v21[8] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "getBytes:length:", &v19, 32);
  LODWORD(v1) = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  LODWORD(v3) = DWORD1(v19);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  LODWORD(v5) = DWORD2(v19);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v6;
  LODWORD(v7) = HIDWORD(v19);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  LODWORD(v9) = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v10;
  LODWORD(v11) = DWORD1(v20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v12;
  LODWORD(v13) = DWORD2(v20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v14;
  LODWORD(v15) = HIDWORD(v20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id HMEarLossArrayToData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    memset(v18, 0, sizeof(v18));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v15;
LABEL_4:
      v8 = 0;
      v9 = v6;
      v10 = (char *)v18 + 4 * v6;
      while (1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        if (v9 + v8 == 8)
          break;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "doubleValue", (_QWORD)v14);
        *(float *)&v11 = v11;
        *(_DWORD *)&v10[4 * v8++] = LODWORD(v11);
        if (v5 == v8)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          v6 = v9 + v8;
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v18, 32);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_23DF3447C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23DF34DC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23DF34EC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x24BE291C8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x24BE29648]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x24BE29650]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x24BE29660]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x24BE29668]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x24BE29688]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

