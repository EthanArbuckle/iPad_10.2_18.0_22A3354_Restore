@implementation BSMachPortReceiveRight

- (BSMachPortReceiveRight)init
{
  NSObject *v3;
  BSMachPortReceiveRight *v4;
  void *v6;
  id v7;
  mach_port_name_t v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  if (BSMachCreateReceiveRight(&v8))
  {
    _BSMachPortRightDescription(1u, 0, (uint64_t)CFSTR("init"), v8, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    self = -[BSMachPortRight _initWithPort:type:owner:trace:](self, v8, 1, 0, v3);
    v4 = self;
  }
  else
  {
    BSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      v7 = v6;
      _os_log_error_impl(&dword_18A184000, v3, OS_LOG_TYPE_ERROR, "failed to create port for %{public}@ - returning nil from initializer", buf, 0xCu);

    }
    v4 = 0;
  }

  return v4;
}

- (BSMachPortReceiveRight)initWithPort:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  BSMachPortReceiveRight *v7;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (!BSMachPortIsType(a3, 0x20000))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 420, CFSTR("you must pass in a valid receive right"));

  }
  _BSMachPortRightDescription(1u, 0, (uint64_t)CFSTR("take"), v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (BSMachPortReceiveRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 1, 0, v6);

  return v7;
}

+ (char)_type
{
  return 1;
}

@end
