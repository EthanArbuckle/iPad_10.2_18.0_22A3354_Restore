@implementation FSFileDataBuffer

- (FSFileDataBuffer)initWithCapacity:(unint64_t)a3 andLength:(unint64_t)a4
{
  FSFileDataBuffer *v6;
  FSFileDataBuffer *v7;
  unint64_t *p_internalCapacity;
  vm_map_t *v9;
  NSObject *v10;
  memory_object_size_t size;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FSFileDataBuffer;
  v6 = -[FSFileDataBuffer init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_internalCapacity = a3;
    v6->_length = a4;
    p_internalCapacity = &v6->_internalCapacity;
    v9 = (vm_map_t *)MEMORY[0x24BDAEC58];
    if (vm_allocate(*MEMORY[0x24BDAEC58], &v6->_vma, a3, -1778384895))
    {

      fskit_std_log();
      v7 = (FSFileDataBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
        -[FSFileDataBuffer initWithCapacity:andLength:].cold.3();
LABEL_12:

      return 0;
    }
    size = v7->_internalCapacity;
    if (mach_make_memory_entry_64(*v9, &size, v7->_vma, 4194371, &v7->_mp, 0))
    {

      fskit_std_log();
      v7 = (FSFileDataBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
        -[FSFileDataBuffer initWithCapacity:andLength:].cold.2();
      goto LABEL_12;
    }
    if (size < *p_internalCapacity)
    {
      fskit_std_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FSFileDataBuffer initWithCapacity:andLength:].cold.1((uint64_t *)&size, (uint64_t *)&v7->_internalCapacity, v10);

      goto LABEL_12;
    }
  }
  return v7;
}

- (unint64_t)internalCapacity
{
  return self->_internalCapacity;
}

- (void)dealloc
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_DEBUG, "FSFileDataBuffer: dealloc: error %d", (uint8_t *)v2, 8u);
}

+ (id)dataWithLength:(unint64_t)a3
{
  return -[FSFileDataBuffer initWithLength:]([FSFileDataBuffer alloc], "initWithLength:", a3);
}

- (FSFileDataBuffer)initWithLength:(unint64_t)a3
{
  return -[FSFileDataBuffer initWithCapacity:andLength:](self, "initWithCapacity:andLength:", a3, a3);
}

- (BOOL)ensureMappedMB:(unint64_t)a3
{
  kern_return_t v4;
  NSObject *v5;
  mach_vm_address_t address;

  address = a3;
  v4 = mach_vm_map(*MEMORY[0x24BDAEC58], &address, self->_internalCapacity, 0, 1, self->_mp, 0, 0, 67, 67, 2u);
  if (v4)
  {
    fskit_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FSFileDataBuffer ensureMappedMB:].cold.1();

  }
  else
  {
    self->_vma = address;
  }
  return v4 == 0;
}

- (BOOL)ensureMapped
{
  return self->_vma || -[FSFileDataBuffer ensureMappedMB:](self, "ensureMappedMB:", 0);
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
  objc_msgSend(v6, "encodeInteger:forKey:", self->_length, CFSTR("FSKitBuff.len"));
  objc_msgSend(v6, "encodeXPCObject:forKey:", v4, CFSTR("FSKitBuff.mp"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_internalCapacity, CFSTR("FSKitMBuff.cap"));

}

- (FSFileDataBuffer)initWithCoder:(id)a3
{
  id v4;
  FSFileDataBuffer *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FSFileDataBuffer *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FSFileDataBuffer;
  v5 = -[FSFileDataBuffer init](&v27, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v26);
    }
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSKitBuff.len"));
    v5->_internalCapacity = v6;
    v5->_length = v6;
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFD8], CFSTR("FSKitBuff.mp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSKitMBuff.cap"));
    v5->_internalCapacity = v8;
    if (v5->_length > v8)
    {
      fskit_std_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FSFileDataBuffer initWithCoder:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_11:

      v17 = 0;
      goto LABEL_12;
    }
    if (!v7)
    {
      fskit_std_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FSFileDataBuffer initWithCoder:].cold.2(v9, v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_11;
    }
    v5->_mp = xpc_mach_send_copy_right();

  }
  v17 = v5;
LABEL_12:

  return v17;
}

- (const)bytes
{
  if (-[FSFileDataBuffer ensureMapped](self, "ensureMapped"))
    return (const void *)self->_vma;
  else
    return 0;
}

- (void)withBytes:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, const void *))a3 + 2))(v5, -[FSFileDataBuffer bytes](self, "bytes"));

}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
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
  v6 = "-[FSFileDataBuffer initWithCapacity:andLength:]";
  v7 = 2048;
  v8 = v3;
  v9 = 2048;
  v10 = v4;
  _os_log_error_impl(&dword_23B2A6000, log, OS_LOG_TYPE_ERROR, "%s: mach_make_memory_entry_64 gave us size %lu instead of %lu", (uint8_t *)&v5, 0x20u);
}

- (void)initWithCapacity:andLength:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: mach_make_memory_entry_64 returned %x", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCapacity:andLength:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: vm_allocate returned %x", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)ensureMappedMB:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: failed with error %x", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: supplied length is greater than supplied capacity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: didn't get the wrapper", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
