@implementation BKLogEventOrCode

void ___BKLogEventOrCode_block_invoke()
{
  void *v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _BKLogEventOrCode_isDaemon = objc_msgSend(v1, "hasSuffix:", CFSTR("biometrickitd"));

  v2 = dispatch_queue_create("com.apple.BKLogEvent.dispatch", 0);
  v3 = (void *)_BKLogEventOrCode_queue;
  _BKLogEventOrCode_queue = (uint64_t)v2;

}

void ___BKLogEventOrCode_block_invoke_2(uint64_t a1)
{
  id v2;

  -[objc_class manager](NSClassFromString(CFSTR("BiometricKit")), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventOrCode:", *(_QWORD *)(a1 + 32));

}

@end
