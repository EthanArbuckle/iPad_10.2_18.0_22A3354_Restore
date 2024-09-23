@implementation CUXPCDecodeNSArrayOfNSData

uint64_t __CUXPCDecodeNSArrayOfNSData_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t length;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if (MEMORY[0x18D78F504]() != MEMORY[0x1E0C812E8])
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960540, (uint64_t)"XPC array non-data value: '%s'", v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 48));
LABEL_8:
    v19 = objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;
    goto LABEL_5;
  }
  length = xpc_data_get_length(v4);
  if (length < *(_QWORD *)(a1 + 56) || length > *(_QWORD *)(a1 + 64))
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960553, (uint64_t)"XPC array bad data length: '%s', %zu bytes", v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 48));
    goto LABEL_8;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", xpc_data_get_bytes_ptr(v4), length);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
  v17 = 1;
LABEL_5:

  return v17;
}

@end
