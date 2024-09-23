@implementation LiveFSMachPort

- (LiveFSMachPort)init
{
  return -[LiveFSMachPort initWithPort:](self, "initWithPort:", 0);
}

- (LiveFSMachPort)initWithPort:(unsigned int)a3
{
  LiveFSMachPort *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LiveFSMachPort;
  result = -[LiveFSMachPort init](&v5, sel_init);
  if (result)
    result->_machPort = a3;
  return result;
}

+ (id)newByCopyingPort:(unsigned int)a3
{
  uint64_t v3;
  kern_return_t v5;
  kern_return_t v6;
  _DWORD v8[2];
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x24BDAC8D0];
  if (a3 - 1 > 0xFFFFFFFD)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPort:", v3);
  v5 = mach_port_mod_refs(*MEMORY[0x24BDAEC58], a3, 0, 1);
  if (!v5)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPort:", v3);
  v6 = v5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl(&dword_22BD61000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "mach_port_mod_refs failed, returned %d", (uint8_t *)v8, 8u);
  }
  return 0;
}

- (void)dealloc
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_22BD61000, a2, OS_LOG_TYPE_DEBUG, "LiveFSMachPort: dealloc: error %d", (uint8_t *)v2, 8u);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  v3 = (void *)xpc_mach_send_create();
  objc_msgSend(v5, "encodeXPCObject:forKey:", v3, CFSTR("LiveFSmp.mp"));

}

- (LiveFSMachPort)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LiveFSMachPort *v6;
  NSObject *v7;
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFD8], CFSTR("LiveFSmp.mp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[LiveFSMachPort initWithPort:](self, "initWithPort:", xpc_mach_send_copy_right());
    v6 = self;
  }
  else
  {
    livefs_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LiveFSMachPort initWithCoder:].cold.1(v7);

    v6 = 0;
  }

  return v6;
}

- (unsigned)machPort
{
  return self->_machPort;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[LiveFSMachPort initWithCoder:]";
  _os_log_error_impl(&dword_22BD61000, log, OS_LOG_TYPE_ERROR, "%s: didn't get the wrapper", (uint8_t *)&v1, 0xCu);
}

@end
