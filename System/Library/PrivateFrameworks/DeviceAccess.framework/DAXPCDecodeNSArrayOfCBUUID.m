@implementation DAXPCDecodeNSArrayOfCBUUID

uint64_t __DAXPCDecodeNSArrayOfCBUUID_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  size_t length;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  if (MEMORY[0x2199CAB58]() == MEMORY[0x24BDACF90]
    && (length = xpc_data_get_length(v4), length <= 0x10)
    && ((1 << length) & 0x10014) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", xpc_data_get_bytes_ptr(v4), length);
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

    v8 = 1;
  }
  else
  {
    NSErrorF_safe();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

  return v8;
}

@end
