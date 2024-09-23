@implementation MTRUUIDHelper

+ (id)GetShortestServiceUUID:(const ChipBleUUID *)a3
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v12;
  const char *v13;

  if (*(_QWORD *)&a3->var0[4] == 0x8000008000100000 && *(_DWORD *)&a3->var0[12] == -80438433)
  {
    if (a3->var0[0] || a3->var0[1])
    {
      v8 = (void *)MEMORY[0x24BDBB2A8];
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)a3, 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDWithData_(v8, v9, (uint64_t)v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDBB2A8];
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)&a3->var0[2], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDWithData_(v12, v13, (uint64_t)v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBB2A8];
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)a3, 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDWithData_(v4, v6, (uint64_t)v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  return v10;
}

@end
