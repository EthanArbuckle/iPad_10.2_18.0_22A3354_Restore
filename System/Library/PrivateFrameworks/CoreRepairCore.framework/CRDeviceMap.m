@implementation CRDeviceMap

+ (id)currentDevice
{
  if (qword_253E79818 != -1)
    dispatch_once(&qword_253E79818, &unk_24D1AA488);
  return (id)qword_253E79810;
}

+ (id)getSupportedComponentTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21453963C;
  block[3] = &unk_24D1AA2E8;
  block[4] = a1;
  if (qword_253E797D0 != -1)
    dispatch_once(&qword_253E797D0, block);
  return (id)qword_253E79820;
}

+ (id)getComponentName:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = *(_QWORD *)&a3;
  objc_msgSend_currentDevice(a1, a2, *(uint64_t *)&a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getComponentByType_(v5, v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)getKeysInComponent:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = *(_QWORD *)&a3;
  objc_msgSend_currentDevice(a1, a2, *(uint64_t *)&a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getComponentByType_(v5, v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fdrKeys(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
