@implementation GCHIDServiceInfo(IPC)

- (uint64_t)initWithService:()IPC
{
  _QWORD *v5;
  uint64_t v6;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "initWithService:queue:", a3, v5[2]);

  return v6;
}

@end
