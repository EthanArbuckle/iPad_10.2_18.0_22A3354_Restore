@implementation IOKConnection

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 structOutput:(void *)outputStruct structOutputSize:(unint64_t *)a11 error:(id *)a12
{
  kern_return_t v12;

  v12 = IOConnectCallMethod(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7, a8, a9, outputStruct, a11);
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a12)
        return v12 == 0;
      goto LABEL_4;
    }
    if (a12)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v12, 0);
      *a12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12 == 0;
}

- (unsigned)connection
{
  return self->_connection;
}

- (IOKConnection)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[IOKConnection init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (IOKConnection)initWithService:(id)a3 andType:(unsigned int)a4
{
  id v6;
  IOKConnection *v7;
  io_service_t v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IOKConnection;
  v7 = -[IOKConnection init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "object");
    if (IOServiceOpen(v8, *MEMORY[0x24BDAEC58], a4, &v7->_connection))
    {
      v7->_connection = 0;

      v7 = 0;
    }
  }

  return v7;
}

- (IOKConnection)initWithService:(id)a3
{
  return -[IOKConnection initWithService:andType:](self, "initWithService:andType:", a3, 0);
}

- (IOKService)service
{
  IOKService *v3;
  IOKService *v4;
  io_object_t object;

  object = 0;
  if (MEMORY[0x2199DC650](-[IOKConnection connection](self, "connection"), &object))
    return (IOKService *)0;
  v3 = [IOKService alloc];
  v4 = -[IOKService initWithServiceEntry:](v3, "initWithServiceEntry:", object);
  IOObjectRelease(object);
  return v4;
}

- (BOOL)setNotificationPort:(id)a3 ofType:(unsigned int)a4 withReference:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = -[IOKConnection connection](self, "connection");
  v12 = objc_msgSend(v10, "machPort");

  v13 = MEMORY[0x2199DC680](v11, v8, v12, a5);
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a6)
        return v13 == 0;
      goto LABEL_4;
    }
    if (a6)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v13, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v13 == 0;
}

- (BOOL)mapMemory64OfType:(unsigned int)a3 withOptions:(unsigned int)a4 atAddress:(unint64_t *)a5 ofSize:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v12 = -[IOKConnection connection](self, "connection");
  v13 = MEMORY[0x2199DC65C](v12, v11, *MEMORY[0x24BDAEC58], a5, a6, v10);
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a7)
        return v13 == 0;
      goto LABEL_4;
    }
    if (a7)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v13, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v13 == 0;
}

- (BOOL)unmapMemory64OfType:(unsigned int)a3 atAddress:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  int v9;

  v7 = *(_QWORD *)&a3;
  v8 = -[IOKConnection connection](self, "connection");
  v9 = MEMORY[0x2199DC6E0](v8, v7, *MEMORY[0x24BDAEC58], a4);
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a5)
        return v9 == 0;
      goto LABEL_4;
    }
    if (a5)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v9, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9 == 0;
}

- (BOOL)setProperties:(id)a3 error:(id *)a4
{
  id v6;
  kern_return_t v7;

  v6 = a3;
  v7 = IOConnectSetCFProperties(-[IOKConnection connection](self, "connection"), v6);

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a4)
        return v7 == 0;
      goto LABEL_4;
    }
    if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v7, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7 == 0;
}

- (BOOL)setProperty:(id)a3 withKey:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  kern_return_t v10;

  v8 = (__CFString *)a4;
  v9 = a3;
  v10 = IOConnectSetCFProperty(-[IOKConnection connection](self, "connection"), v8, v9);

  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a5)
        return v10 == 0;
      goto LABEL_4;
    }
    if (a5)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v10, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v10 == 0;
}

- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 scalarInputs:(const unint64_t *)a7 scalarInputCount:(unsigned int)a8 structInput:(const void *)a9 structInputSize:(unint64_t)inputStructCnt scalarOutputs:(unint64_t *)a11 scalarOutputCount:(unsigned int *)a12 structOutput:(void *)a13 structOutputSize:(unint64_t *)outputStructCnt error:(id *)a15
{
  kern_return_t v15;

  v15 = IOConnectCallAsyncMethod(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7, a8, a9, inputStructCnt, a11, a12, a13, outputStructCnt);
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a15)
        return v15 == 0;
      goto LABEL_4;
    }
    if (a15)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v15, 0);
      *a15 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v15 == 0;
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 structOutput:(void *)a6 structOutputSize:(unint64_t *)a7 error:(id *)a8
{
  kern_return_t v9;

  v9 = IOConnectCallStructMethod(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7);
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a8)
        return v9 == 0;
      goto LABEL_4;
    }
    if (a8)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v9, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9 == 0;
}

- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 structOutput:(void *)a9 structOutputSize:(unint64_t *)outputStructCnt error:(id *)a11
{
  kern_return_t v11;

  v11 = IOConnectCallAsyncStructMethod(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7, a8, a9, outputStructCnt);
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a11)
        return v11 == 0;
      goto LABEL_4;
    }
    if (a11)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v11 == 0;
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8
{
  kern_return_t v9;

  v9 = IOConnectCallScalarMethod(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7);
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a8)
        return v9 == 0;
      goto LABEL_4;
    }
    if (a8)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v9, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9 == 0;
}

- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 scalarInputs:(const unint64_t *)a7 scalarInputCount:(unsigned int)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)outputCnt error:(id *)a11
{
  kern_return_t v11;

  v11 = IOConnectCallAsyncScalarMethod(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7, a8, a9, outputCnt);
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a11)
        return v11 == 0;
      goto LABEL_4;
    }
    if (a11)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v11 == 0;
}

- (BOOL)trap:(unsigned int)a3 error:(id *)a4
{
  kern_return_t v5;

  v5 = IOConnectTrap0(-[IOKConnection connection](self, "connection"), a3);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a4)
        return v5 == 0;
      goto LABEL_4;
    }
    if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v5, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 error:(id *)a5
{
  kern_return_t v6;

  v6 = IOConnectTrap1(-[IOKConnection connection](self, "connection"), a3, a4);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a5)
        return v6 == 0;
      goto LABEL_4;
    }
    if (a5)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v6, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 error:(id *)a6
{
  kern_return_t v7;

  v7 = IOConnectTrap2(-[IOKConnection connection](self, "connection"), a3, a4, a5);
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a6)
        return v7 == 0;
      goto LABEL_4;
    }
    if (a6)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v7, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 error:(id *)a7
{
  kern_return_t v8;

  v8 = IOConnectTrap3(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6);
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a7)
        return v8 == 0;
      goto LABEL_4;
    }
    if (a7)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v8, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v8 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 error:(id *)a8
{
  kern_return_t v9;

  v9 = IOConnectTrap4(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7);
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a8)
        return v9 == 0;
      goto LABEL_4;
    }
    if (a8)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v9, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 p5:(unint64_t)a8 error:(id *)a9
{
  kern_return_t v9;

  v9 = IOConnectTrap5(-[IOKConnection connection](self, "connection"), a3, a4, a5, a6, a7, a8);
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a9)
        return v9 == 0;
      goto LABEL_4;
    }
    if (a9)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v9, 0);
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 p5:(unint64_t)a8 p6:(unint64_t)a9 error:(id *)a10
{
  int v10;

  v10 = MEMORY[0x2199DC6D4](-[IOKConnection connection](self, "connection"), *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9);
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a10)
        return v10 == 0;
      goto LABEL_4;
    }
    if (a10)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v10, 0);
      *a10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v10 == 0;
}

- (unint64_t)hash
{
  return -[IOKConnection connection](self, "connection");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || -[IOKConnection isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[IOKConnection connection](self, "connection");
    v6 = v5 == objc_msgSend(v4, "connection");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  io_connect_t connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    IOServiceClose(connection);
  v4.receiver = self;
  v4.super_class = (Class)IOKConnection;
  -[IOKConnection dealloc](&v4, sel_dealloc);
}

- (void)setNotificationPort:ofType:withReference:error:.cold.1()
{
  void *v0;
  void *v1;
  objc_class *v2;
  id v3;
  const char *v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_6();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5(v3, v4);
  v5 = (const char *)OUTLINED_FUNCTION_7();
  NSStringFromSelector(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_4(v6, v7);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215148000, MEMORY[0x24BDACB70], v8, "%s %s failed with error 0x%08x", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1();
}

@end
