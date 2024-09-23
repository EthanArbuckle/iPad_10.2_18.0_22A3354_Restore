@implementation NSMachBootstrapServer

+ (id)sharedInstance
{
  id result;

  result = (id)sharedInstance___NSMachBootstrapServerShared;
  if (!sharedInstance___NSMachBootstrapServerShared)
  {
    result = (id)objc_msgSend(objc_allocWithZone((Class)a1), "init");
    sharedInstance___NSMachBootstrapServerShared = (uint64_t)result;
  }
  return result;
}

- (id)portForName:(id)a3 options:(unint64_t)a4
{
  id result;
  mach_port_t special_port[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)special_port = 0;
  if (task_get_special_port(*MEMORY[0x1E0C83DA0], 4, &special_port[1]))
    return 0;
  result = -[NSFileManager fileSystemRepresentationWithPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileSystemRepresentationWithPath:", a3);
  if (result)
  {
    if (!bootstrap_look_up2())
      return (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DD0]), "initWithMachPort:options:", special_port[0], 1);
    return 0;
  }
  return result;
}

- (NSPort)portForName:(NSString *)name
{
  return (NSPort *)-[NSMachBootstrapServer portForName:options:](self, "portForName:options:", name, 0);
}

- (BOOL)registerPort:(NSPort *)port name:(NSString *)name
{
  kern_return_t v6;
  const char *v7;
  mach_port_t special_port;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  special_port = 0;
  v6 = task_get_special_port(*MEMORY[0x1E0C83DA0], 4, &special_port);
  LOBYTE(v7) = 0;
  if (!v6)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NSString UTF8String](name, "UTF8String");
      if (v7)
      {
        -[NSPort machPort](port, "machPort");
        LOBYTE(v7) = bootstrap_register2() == 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return (char)v7;
}

- (NSPort)servicePortWithName:(NSString *)name
{
  ipc_space_t *v4;
  NSPort *v5;
  const char *v7;
  id v8;
  mach_port_t special_port[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)special_port = 0;
  v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (!task_get_special_port(*MEMORY[0x1E0C83DA0], 4, &special_port[1]))
  {
    v7 = -[NSString UTF8String](name, "UTF8String");
    if (v7)
    {
      if (!bootstrap_check_in(special_port[1], v7, special_port))
      {
        mach_port_insert_right(*v4, special_port[0], special_port[0], 0x14u);
        v8 = objc_allocWithZone(MEMORY[0x1E0C99DD0]);
        return (NSPort *)(id)objc_msgSend(v8, "initWithMachPort:", special_port[0]);
      }
      v5 = (NSPort *)objc_msgSend(MEMORY[0x1E0C99DD0], "port");
      -[NSPort machPort](v5, "machPort");
      if (!bootstrap_register2())
        return v5;
    }
  }
  return 0;
}

- (NSPort)portForName:(NSString *)name host:(NSString *)host
{
  if (host && !objc_msgSend(&stru_1E0F56070, "isEqual:", host))
    return 0;
  else
    return -[NSMachBootstrapServer portForName:](self, "portForName:", name);
}

- (BOOL)removePortForName:(id)a3
{
  return 0;
}

@end
