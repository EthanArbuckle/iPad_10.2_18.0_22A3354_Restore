@implementation CMContinuityCaptureLog

void __CMContinuityCaptureLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.CMContinuityCapture", "default");
  v1 = (void *)CMContinuityCaptureLog_log[0];
  CMContinuityCaptureLog_log[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.CMContinuityCapture", "device");
  v3 = (void *)qword_25408BE10;
  qword_25408BE10 = (uint64_t)v2;

  v4 = os_log_create("com.apple.CMContinuityCapture", "provider");
  v5 = (void *)qword_25408BE08;
  qword_25408BE08 = (uint64_t)v4;

  v6 = os_log_create("com.apple.CMContinuityCapture", "stream");
  v7 = (void *)qword_25408BE18;
  qword_25408BE18 = (uint64_t)v6;

}

@end
