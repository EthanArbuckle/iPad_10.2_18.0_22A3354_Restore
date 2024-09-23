@implementation IOAccessorySystemStateEndpoint

- (IOAccessorySystemStateEndpoint)initWithService:(unsigned int)a3
{
  IOAccessorySystemStateEndpoint *v4;
  io_connect_t *v5;
  IOAccessorySystemStateEndpoint *v6;
  kern_return_t v7;
  mach_error_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOAccessorySystemStateEndpoint;
  v4 = -[IOAccessorySystemStateEndpoint init](&v10, sel_init);
  v5 = (io_connect_t *)v4;
  v6 = 0;
  if (a3 && v4)
  {
    v4->_service = a3;
    IOObjectRetain(a3);
    v7 = IOServiceOpen(a3, *MEMORY[0x1E0C83DA0], 0, v5 + 3);
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[IOAccessorySystemStateEndpoint initWithService:].cold.1(v8);
      v6 = 0;
    }
    else
    {
      v6 = v5;
    }
  }

  return v6;
}

- (void)dealloc
{
  io_connect_t connection;
  io_object_t service;
  objc_super v5;

  connection = self->_connection;
  if (connection)
  {
    IOServiceClose(connection);
    self->_connection = 0;
  }
  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)IOAccessorySystemStateEndpoint;
  -[IOAccessorySystemStateEndpoint dealloc](&v5, sel_dealloc);
}

- (void)notifyBootComplete
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v1, "%s error %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)notifyUserActive:(BOOL)a3
{
  kern_return_t v3;
  mach_error_t v4;
  uint64_t input;

  input = a3;
  v3 = IOConnectCallMethod(self->_connection, 1u, &input, 1u, 0, 0, 0, 0, 0, 0);
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[IOAccessorySystemStateEndpoint notifyUserActive:].cold.1(v4);
  }
}

- (void)notifyUserPresent:(BOOL)a3
{
  kern_return_t v3;
  mach_error_t v4;
  uint64_t input;

  input = a3;
  v3 = IOConnectCallMethod(self->_connection, 2u, &input, 1u, 0, 0, 0, 0, 0, 0);
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[IOAccessorySystemStateEndpoint notifyUserPresent:].cold.1(v4);
  }
}

- (unsigned)service
{
  return self->_service;
}

- (unsigned)connection
{
  return self->_connection;
}

- (void)initWithService:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v1, "%s unable to open service (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)notifyUserActive:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v1, "%s error %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)notifyUserPresent:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v1, "%s error %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
