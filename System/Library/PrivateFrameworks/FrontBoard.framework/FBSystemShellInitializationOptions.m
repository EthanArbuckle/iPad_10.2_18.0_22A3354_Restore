@implementation FBSystemShellInitializationOptions

- (id)_initWithOptions:(id)a3
{
  id v4;
  FBSystemShellInitializationOptions *v5;
  FBSystemShellInitializationOptions *v6;
  uint64_t v7;
  id registerServicesBlock;

  v4 = a3;
  v5 = -[FBSystemShellInitializationOptions init](self, "init");
  v6 = v5;
  if (v5)
  {
    v5->_resetDarkBootState = *((_BYTE *)v4 + 10);
    v5->_initializeReadyForInteraction = *((_BYTE *)v4 + 8);
    v5->_shouldWaitForMigrator = *((_BYTE *)v4 + 9);
    v5->_systemSleepInterval = *((double *)v4 + 3);
    objc_storeStrong((id *)&v5->_independentWatchdogPortName, *((id *)v4 + 2));
    v6->_initializeDisplayManager = *((_BYTE *)v4 + 11);
    v7 = objc_msgSend(*((id *)v4 + 4), "copy");
    registerServicesBlock = v6->_registerServicesBlock;
    v6->_registerServicesBlock = (id)v7;

  }
  return v6;
}

- (FBSystemShellInitializationOptions)init
{
  FBSystemShellInitializationOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBSystemShellInitializationOptions;
  result = -[FBSystemShellInitializationOptions init](&v3, sel_init);
  if (result)
  {
    result->_shouldWaitForMigrator = 1;
    result->_initializeDisplayManager = 1;
    result->_systemSleepInterval = 1.0;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0D22FD0], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_resetDarkBootState);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_initializeReadyForInteraction);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_shouldWaitForMigrator);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_initializeDisplayManager);
  v8 = (id)objc_msgSend(v3, "appendDouble:", self->_systemSleepInterval);
  v9 = (void *)MEMORY[0x1A8590C4C](self->_registerServicesBlock);
  v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  v11 = (id)objc_msgSend(v3, "appendObject:", self->_independentWatchdogPortName);
  v12 = objc_msgSend(v3, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  FBSystemShellInitializationOptions *v4;
  FBSystemShellInitializationOptions *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (FBSystemShellInitializationOptions *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (BSEqualBools()
        && BSEqualBools()
        && BSEqualBools()
        && BSEqualBools()
        && BSFloatEqualToFloat())
      {
        v6 = (void *)MEMORY[0x1A8590C4C](self->_registerServicesBlock);
        v7 = (void *)MEMORY[0x1A8590C4C](v5->_registerServicesBlock);
        if (BSEqualObjects())
          v8 = BSEqualObjects();
        else
          v8 = 0;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSystemShellInitializationOptions _initWithOptions:]([FBMutableSystemShellInitializationOptions alloc], "_initWithOptions:", self);
}

- (BOOL)initializeReadyForInteraction
{
  return self->_initializeReadyForInteraction;
}

- (BOOL)resetDarkBootState
{
  return self->_resetDarkBootState;
}

- (BOOL)shouldWaitForMigrator
{
  return self->_shouldWaitForMigrator;
}

- (double)systemSleepInterval
{
  return self->_systemSleepInterval;
}

- (id)registerAdditionalServicesBlock
{
  return self->_registerServicesBlock;
}

- (NSString)independentWatchdogPortName
{
  return self->_independentWatchdogPortName;
}

- (BOOL)initializeDisplayManager
{
  return self->_initializeDisplayManager;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registerServicesBlock, 0);
  objc_storeStrong((id *)&self->_independentWatchdogPortName, 0);
}

@end
