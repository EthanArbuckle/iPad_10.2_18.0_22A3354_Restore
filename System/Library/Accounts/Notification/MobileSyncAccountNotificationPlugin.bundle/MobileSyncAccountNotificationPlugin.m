void sub_230F3B510()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BDB3FD8];
  v7[0] = *MEMORY[0x24BDB4030];
  v7[1] = v1;
  v2 = *MEMORY[0x24BDB4010];
  v7[2] = *MEMORY[0x24BDB4000];
  v7[3] = v2;
  v3 = *MEMORY[0x24BDB4098];
  v7[4] = *MEMORY[0x24BDB3FF8];
  v7[5] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_25414C090;
  qword_25414C090 = v5;

}

uint64_t sub_230F3B5F8(uint64_t result)
{
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)result;
  if (*(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(result + 49))
  {
    SetExternalSourceEnabledForDataType();
    result = SetAccountNameEnabledForDataType();
  }
  if (v1[50] != v1[51])
  {
    SetExternalSourceEnabledForDataType();
    result = SetAccountNameEnabledForDataType();
  }
  if (v1[52] != v1[53])
  {
    SetExternalSourceEnabledForDataType();
    result = SetAccountNameEnabledForDataType();
  }
  if (v1[54] != v1[55])
  {
    SetExternalSourceEnabledForDataType();
    return SetAccountNameEnabledForDataType();
  }
  return result;
}

uint64_t SetAccountNameEnabledForDataType()
{
  return MEMORY[0x24BE00EA0]();
}

uint64_t SetExternalSourceEnabledForDataType()
{
  return MEMORY[0x24BE00EA8]();
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

