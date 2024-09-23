@implementation LiveFSSharedMutableBuffer

- (LiveFSSharedMutableBuffer)initWithMachPort:(unsigned int)a3 capacity:(unint64_t)a4 length:(unint64_t)a5 wrapsIOWMD:(BOOL)a6
{
  LiveFSSharedMutableBuffer *v10;
  LiveFSSharedMutableBuffer *v11;
  LiveFSMemoryMap *memMap;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LiveFSSharedMutableBuffer;
  v10 = -[LiveFSSharedMutableBuffer init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_mp = a3;
    v10->_capacity = a4;
    v10->_length = a5;
    v10->_isIOWMD = a6;
    memMap = v10->_memMap;
    v10->_memMap = 0;

  }
  return v11;
}

- (LiveFSSharedMutableBuffer)initWithCapacity:(unint64_t)a3 andLength:(unint64_t)a4
{
  LiveFSSharedMutableBuffer *v6;
  LiveFSSharedMutableBuffer *v7;
  vm_size_t *p_capacity;
  LiveFSMemoryMap *memMap;
  vm_map_t *v10;
  memory_object_offset_t vma;
  NSObject *v12;
  memory_object_size_t size;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LiveFSSharedMutableBuffer;
  v6 = -[LiveFSSharedMutableBuffer init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_capacity = a3;
    v6->_length = a4;
    p_capacity = &v6->_capacity;
    v6->_isIOWMD = 0;
    memMap = v6->_memMap;
    v6->_memMap = 0;

    v10 = (vm_map_t *)MEMORY[0x24BDAEC58];
    if (vm_allocate(*MEMORY[0x24BDAEC58], &v7->_vma, *p_capacity, -1778384895))
    {

      livefs_std_log();
      v7 = (LiveFSSharedMutableBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
        -[LiveFSSharedMutableBuffer initWithCapacity:andLength:].cold.3();
LABEL_12:

      return 0;
    }
    vma = v7->_vma;
    size = v7->_capacity;
    if (mach_make_memory_entry_64(*v10, &size, vma, 4194371, &v7->_mp, 0))
    {

      livefs_std_log();
      v7 = (LiveFSSharedMutableBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
        -[LiveFSSharedMutableBuffer initWithCapacity:andLength:].cold.2();
      goto LABEL_12;
    }
    if (size < *p_capacity)
    {
      livefs_std_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[LiveFSSharedMutableBuffer initWithCapacity:andLength:].cold.1((uint64_t *)&size, (uint64_t *)&v7->_capacity, v12);

      goto LABEL_12;
    }
  }
  return v7;
}

- (LiveFSSharedMutableBuffer)initWithCapacity:(unint64_t)a3
{
  return -[LiveFSSharedMutableBuffer initWithCapacity:andLength:](self, "initWithCapacity:andLength:", a3, 0);
}

- (LiveFSSharedMutableBuffer)initWithLength:(unint64_t)a3
{
  return -[LiveFSSharedMutableBuffer initWithCapacity:andLength:](self, "initWithCapacity:andLength:", a3, a3);
}

+ (id)bufferWithLength:(unint64_t)a3
{
  return -[LiveFSSharedMutableBuffer initWithLength:]([LiveFSSharedMutableBuffer alloc], "initWithLength:", a3);
}

+ (id)bufferWithCapacity:(unint64_t)a3
{
  return -[LiveFSSharedMutableBuffer initWithCapacity:]([LiveFSSharedMutableBuffer alloc], "initWithCapacity:", a3);
}

+ (id)dataWithLength:(unint64_t)a3
{
  return -[LiveFSSharedMutableBuffer initWithLength:]([LiveFSSharedMutableBuffer alloc], "initWithLength:", a3);
}

+ (id)dataWithCapacity:(unint64_t)a3
{
  return -[LiveFSSharedMutableBuffer initWithCapacity:]([LiveFSSharedMutableBuffer alloc], "initWithCapacity:", a3);
}

+ (id)newByCopyingPort:(unsigned int)a3
{
  uint64_t v3;
  kern_return_t v4;
  kern_return_t v5;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v4 = mach_port_mod_refs(*MEMORY[0x24BDAEC58], a3, 0, 1);
  if (!v4)
    return -[LiveFSSharedMutableBuffer initWithMachPort:capacity:length:wrapsIOWMD:]([LiveFSSharedMutableBuffer alloc], "initWithMachPort:capacity:length:wrapsIOWMD:", v3, 0, 0, 1);
  v5 = v4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_22BD61000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "mach_port_mod_refs failed, returned %d", (uint8_t *)v7, 8u);
  }
  return 0;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, a2, a3, "LiveFSSharedMutableBuffer: dealloc: error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

- (void)detachBytes
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22BD61000, log, OS_LOG_TYPE_FAULT, "detatchBytes called on LiveFSSharedMutableBuffer wrapping an IOMD, which won't work well", v1, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  if (self->_capacity >= a3)
    self->_length = a3;
}

- (void)createMappingForVMAAt:(unint64_t)a3 options:(unsigned int)a4 startingAtOffset:(unint64_t)a5 forLength:(unint64_t)a6 completionHandler:(id)a7
{
  void (**v11)(id, uint64_t, _QWORD);
  unint64_t vma;
  id v13;
  void (**v14)(id, uint64_t, _QWORD);

  v11 = (void (**)(id, uint64_t, _QWORD))a7;
  v14 = v11;
  if (a6 + a5 > self->_length)
  {
    v11[2](v11, 18, 0);
    goto LABEL_8;
  }
  vma = self->_vma;
  if (!vma)
  {
    if (!-[LiveFSSharedMutableBuffer ensureMappedMB:](self, "ensureMappedMB:", a3))
    {
      v14[2](v14, 3, 0);
      goto LABEL_8;
    }
    vma = self->_vma;
  }
  v13 = +[LiveFSMemoryMap newWithPort:address:andSize:](LiveFSMemoryMap, "newWithPort:address:andSize:", 0, vma + a5, a6);
  ((void (**)(id, uint64_t, id))v14)[2](v14, 0, v13);

LABEL_8:
}

- (void)createMappingAt:(unint64_t)a3 options:(unsigned int)a4 startingAtOffset:(unint64_t)a5 forLength:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v9;
  void (**v12)(id, uint64_t, id);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
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
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v9 = *(_QWORD *)&a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v12 = (void (**)(id, uint64_t, id))a7;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = 24;
  if (self->_isIOWMD)
  {
    *((_QWORD *)&v19 + 1) = a3;
    LODWORD(v19) = self->_mp;
    LODWORD(v20) = 0;
    *((_QWORD *)&v20 + 1) = a5;
    *(_QWORD *)&v21 = a6;
    +[LiveFSUserClient defaultClient](LiveFSUserClient, "defaultClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "callStructMethod:inStruct:inSize:outStruct:outStructSize:", 0, &v19, 40, &v19, &v18);
      if ((_DWORD)v15)
      {
        v16 = v15;
        v17 = 0;
      }
      else
      {
        v17 = +[LiveFSMemoryMap newWithPort:address:andSize:](LiveFSMemoryMap, "newWithPort:address:andSize:", v20, v19);
        v16 = 0;
      }
    }
    else
    {
      v17 = 0;
      v16 = 9;
    }
    v12[2](v12, v16, v17);

  }
  else
  {
    -[LiveFSSharedMutableBuffer createMappingForVMAAt:options:startingAtOffset:forLength:completionHandler:](self, "createMappingForVMAAt:options:startingAtOffset:forLength:completionHandler:", a3, v9, a5, a6, v12);
  }

}

- (BOOL)ensureMappedMB:(unint64_t)a3
{
  kern_return_t v4;
  NSObject *v5;
  mach_vm_address_t address;

  address = a3;
  v4 = mach_vm_map(*MEMORY[0x24BDAEC58], &address, self->_capacity, 0, 1, self->_mp, 0, 0, 67, 67, 2u);
  if (v4)
  {
    livefs_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[LiveFSSharedMutableBuffer ensureMappedMB:].cold.1();

  }
  else
  {
    self->_vma = address;
  }
  return v4 == 0;
}

- (BOOL)ensureMappedIOMD
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__LiveFSSharedMutableBuffer_ensureMappedIOMD__block_invoke;
  v4[3] = &unk_24F64C468;
  v4[4] = self;
  v4[5] = &v5;
  -[LiveFSSharedMutableBuffer createMappingAt:options:startingAtOffset:forLength:completionHandler:](self, "createMappingAt:options:startingAtOffset:forLength:completionHandler:", 0, 0, 0, 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__LiveFSSharedMutableBuffer_ensureMappedIOMD__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  char v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  if (a2)
  {
    v7 = 0;
  }
  else
  {
    v9 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v9, "address");
    v8 = objc_msgSend(v9, "size");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v8;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v8;
    v6 = v9;
    v7 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;

}

- (BOOL)ensureMapped
{
  if (self->_vma)
    return 1;
  if (self->_isIOWMD)
    return -[LiveFSSharedMutableBuffer ensureMappedIOMD](self, "ensureMappedIOMD");
  return -[LiveFSSharedMutableBuffer ensureMappedMB:](self, "ensureMappedMB:", 0);
}

- (id)createDispatchData
{
  LiveFSSharedMutableBuffer *v2;
  void *v3;
  const void *vma;
  size_t length;
  NSObject *v6;
  dispatch_data_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  LiveFSSharedMutableBuffer *v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2;
  v10[4] = __Block_byref_object_dispose__2;
  v2 = self;
  v11 = v2;
  if (-[LiveFSSharedMutableBuffer ensureMapped](v2, "ensureMapped"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__LiveFSSharedMutableBuffer_createDispatchData__block_invoke;
    v9[3] = &unk_24F64C490;
    v9[4] = v10;
    v3 = (void *)MEMORY[0x22E2FAC64](v9);
    vma = (const void *)v2->_vma;
    length = v2->_length;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_data_create(vma, length, v6, v3);

  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(v10, 8);

  return v7;
}

void __47__LiveFSSharedMutableBuffer_createDispatchData__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)mutableBytes
{
  if (-[LiveFSSharedMutableBuffer ensureMapped](self, "ensureMapped"))
    return (void *)self->_vma;
  else
    return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  v4 = (void *)xpc_mach_send_create();
  objc_msgSend(v6, "encodeInteger:forKey:", self->_capacity, CFSTR("LiveFSSMBuff.cap"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_length, CFSTR("LiveFSSMBuff.len"));
  objc_msgSend(v6, "encodeXPCObject:forKey:", v4, CFSTR("LiveFSSMBuff.mp"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isIOWMD, CFSTR("LiveFSSMBuff.isIOWMD"));

}

- (LiveFSSharedMutableBuffer)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  LiveFSSharedMutableBuffer *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LiveFSSMBuff.cap"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LiveFSSMBuff.len"));
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFD8], CFSTR("LiveFSSMBuff.mp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LiveFSSMBuff.isIOWMD"));
  if (v6 > v5)
  {
    livefs_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[LiveFSSharedMutableBuffer initWithCoder:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_9:

    v17 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    livefs_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[LiveFSSharedMutableBuffer initWithCoder:].cold.2(v9, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_9;
  }
  self = -[LiveFSSharedMutableBuffer initWithMachPort:capacity:length:wrapsIOWMD:](self, "initWithMachPort:capacity:length:wrapsIOWMD:", xpc_mach_send_copy_right(), v5, v6, v8);
  v17 = self;
LABEL_10:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memMap, 0);
}

- (void)initWithCapacity:(os_log_t)log andLength:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 136315650;
  v6 = "-[LiveFSSharedMutableBuffer initWithCapacity:andLength:]";
  v7 = 2048;
  v8 = v3;
  v9 = 2048;
  v10 = v4;
  _os_log_error_impl(&dword_22BD61000, log, OS_LOG_TYPE_ERROR, "%s: mach_make_memory_entry_64 gave us size %lu instead of %lu", (uint8_t *)&v5, 0x20u);
}

- (void)initWithCapacity:andLength:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_22BD61000, v0, v1, "%s: mach_make_memory_entry_64 returned %x", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCapacity:andLength:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_22BD61000, v0, v1, "%s: vm_allocate returned %x", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)ensureMappedMB:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_22BD61000, v0, v1, "%s: failed with error %x", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22BD61000, a1, a3, "%s: supplied length is greater than supplied capacity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22BD61000, a1, a3, "%s: didn't get the wrapper", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
