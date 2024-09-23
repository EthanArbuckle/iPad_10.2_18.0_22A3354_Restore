@implementation EXUIKit_Subsystem

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB35D8], "globalStateQueueForExtension:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke;
  v8[3] = &unk_1E2CFC638;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EXUIKit_Subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, block);
  return (id)sharedInstance___instance;
}

+ (id)initForPlugInKitWithOptions:(id)a3
{
  return +[EXUIKit_Subsystem initForPlugInKit](EXUIKit_Subsystem, "initForPlugInKit", a3);
}

+ (id)initForPlugInKit
{
  id result;

  result = (id)objc_msgSend(a1, "sharedInstance");
  *((_BYTE *)result + 9) = 1;
  return result;
}

- (NSDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isPlugInKitProcess
{
  return self->_plugInKitProcess;
}

- (void)setPlugInKitProcess:(BOOL)a3
{
  self->_plugInKitProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
}

@end
