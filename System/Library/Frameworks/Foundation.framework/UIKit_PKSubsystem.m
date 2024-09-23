@implementation UIKit_PKSubsystem

+ (id)initForPlugInKitWithOptions:(id)a3
{
  return +[UIKit_PKSubsystem initForPlugInKit](UIKit_PKSubsystem, "initForPlugInKit", a3);
}

- (void)setInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  NSObject *v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v6 = +[NSExtension globalStateQueueForExtension:](NSExtension, "globalStateQueueForExtension:", 0, a4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIKit_PKSubsystem_beginUsing_withBundle___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v6, block);
}

+ (id)initForPlugInKit
{
  id result;

  result = (id)objc_msgSend(a1, "sharedInstance");
  *((_BYTE *)result + 9) = 1;
  return result;
}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__UIKit_PKSubsystem_sharedInstance__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A8C0 != -1)
    dispatch_once(&qword_1ECD0A8C0, v3);
  return (id)_MergedGlobals_154;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)UIKit_PKSubsystem;
  -[UIKit_PKSubsystem dealloc](&v3, sel_dealloc);
}

- (NSDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (BOOL)isPlugInKitProcess
{
  return self->_plugInKitProcess;
}

- (void)setPlugInKitProcess:(BOOL)a3
{
  self->_plugInKitProcess = a3;
}

@end
