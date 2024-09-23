@implementation BSMachPortSendRight

- (BSMachPortSendRight)initWithPort:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  BSMachPortSendRight *v7;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (a3 - 1 <= 0xFFFFFFFD && !BSMachPortIsType(a3, 1114112))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 482, CFSTR("you must pass in a send (or dead) right or NULL"));

  }
  _BSMachPortRightDescription(3u, 0, (uint64_t)CFSTR("take"), v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 3, 0, v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCopyOfRight:", self);
}

- (BSMachPortSendRight)initWithCopyOfRight:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  BSMachPortSendRight *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__BSMachPortSendRight_initWithCopyOfRight___block_invoke;
  v10[3] = &unk_1E1EBF3D0;
  v10[4] = &v11;
  objc_msgSend(a3, "accessPort:", v10);
  v5 = *((unsigned int *)v12 + 6);
  objc_msgSend(a3, "trace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _BSMachPortRightDescription(3u, 0, (uint64_t)CFSTR("copy"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, *((unsigned int *)v12 + 6), 3, 0, v7);
  _Block_object_dispose(&v11, 8);
  return v8;
}

BOOL __43__BSMachPortSendRight_initWithCopyOfRight___block_invoke(_BOOL8 result, mach_port_name_t name)
{
  uint64_t v3;

  if (name - 1 <= 0xFFFFFFFD)
  {
    v3 = result;
    result = BSMachSendRightRetain(name);
    if (result)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = name;
  }
  return result;
}

+ (char)_type
{
  return 3;
}

+ (id)wrapSendRight:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSendRight:", *(_QWORD *)&a3);
}

- (BSMachPortSendRight)initWithCopyOfPort:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  BSMachPortSendRight *v7;
  void *v9;

  LODWORD(v3) = a3;
  if (a3 - 1 <= 0xFFFFFFFD && !BSMachPortIsType(a3, 1114112))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 489, CFSTR("you must pass in a send (or dead) right or NULL"));

  }
  if (BSMachPortIsType(v3, 0x10000))
  {
    if (BSMachSendRightRetain(v3))
      v3 = v3;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  _BSMachPortRightDescription(3u, 0, (uint64_t)CFSTR("copytake"), v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 3, 0, v6);

  return v7;
}

- (id)initFromReceiveRight:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__BSMachPortSendRight_initFromReceiveRight___block_invoke;
  v10[3] = &unk_1E1EBF3D0;
  v10[4] = &v11;
  objc_msgSend(a3, "accessPort:", v10);
  v5 = *((unsigned int *)v12 + 6);
  objc_msgSend(a3, "trace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _BSMachPortRightDescription(3u, 0, (uint64_t)CFSTR("make"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BSMachPortRight _initWithPort:type:owner:trace:](self, *((unsigned int *)v12 + 6), 3, 0, v7);
  _Block_object_dispose(&v11, 8);
  return v8;
}

BOOL __44__BSMachPortSendRight_initFromReceiveRight___block_invoke(_BOOL8 result, mach_port_name_t name)
{
  uint64_t v3;

  if (name - 1 <= 0xFFFFFFFD)
  {
    v3 = result;
    result = BSMachCreateSendRight(name);
    if (result)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = name;
  }
  return result;
}

+ (id)bootstrapLookUpWithName:(id)a3
{
  mach_port_t v4;
  id v5;
  kern_return_t v6;
  mach_error_t v7;
  NSObject *v9;
  _QWORD *v10;
  void *v12;
  id v13;
  char *v14;
  mach_port_t sp;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  mach_error_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  sp = 0;
  v4 = *MEMORY[0x1E0C81720];
  v5 = objc_retainAutorelease(a3);
  v6 = bootstrap_look_up(v4, (const char *)objc_msgSend(v5, "UTF8String"), &sp);
  v7 = v6;
  if (sp + 1 >= 2 && v6 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bootstrap_look_up:%@"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _BSMachPortRightDescription(3u, 0, (uint64_t)v12, sp, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc((Class)a1);
    v10 = -[BSMachPortRight _initWithPort:type:owner:trace:](v13, sp, 3, 0, v9);
  }
  else
  {
    BSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = mach_error_string(v7);
      *(_DWORD *)buf = 138543874;
      v17 = v5;
      v18 = 2082;
      v19 = v14;
      v20 = 1024;
      v21 = v7;
      _os_log_error_impl(&dword_18A184000, v9, OS_LOG_TYPE_ERROR, "Unable to bootstrap_look_up port with name %{public}@: %{public}s (%d)", buf, 0x1Cu);
    }
    v10 = 0;
  }

  return v10;
}

- (BSMachPortSendRight)initWithNonRetainingPort:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  BSMachPortSendRight *v6;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (a3 + 1 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 553, CFSTR("you must pass in a valid send right"));

  }
  _BSMachPortRightDescription(3u, 1, (uint64_t)CFSTR("wrap"), v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 3, 1, v5);

  return v6;
}

+ (id)taskNamePortForPID:(int)a3
{
  return +[BSMachPortTaskNameRight taskNameForPID:](BSMachPortTaskNameRight, "taskNameForPID:", *(_QWORD *)&a3);
}

+ (id)bootstrapLookUpPortWithName:(id)a3
{
  objc_msgSend(a1, "bootstrapLookUpWithName:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BSMachPortSendRight)initWithSendRight:(unsigned int)a3 assumeOwnership:(BOOL)a4
{
  BSMachPortSendRight *v4;
  BSMachPortSendRight *v5;

  if (a4)
    v4 = -[BSMachPortSendRight initWithPort:](self, "initWithPort:", *(_QWORD *)&a3);
  else
    v4 = -[BSMachPortSendRight initWithNonRetainingPort:](self, "initWithNonRetainingPort:", *(_QWORD *)&a3);
  v5 = v4;

  return v5;
}

@end
