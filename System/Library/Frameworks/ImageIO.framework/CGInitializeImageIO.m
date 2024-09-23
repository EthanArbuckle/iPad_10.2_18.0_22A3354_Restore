@implementation CGInitializeImageIO

void __CGInitializeImageIO_block_invoke()
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(25, 0);
  dispatch_async(global_queue, &__block_literal_global_3);
}

void __CGInitializeImageIO_block_invoke_2()
{
  const __CFString *v0;
  const __CFNumber *v1;
  CFNumberRef v2;
  double v3;
  dispatch_time_t v4;
  NSObject *global_queue;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;

  IIOInitDebugFlags();
  if (IIOXPCClient::GetIIOXPCClient(void)::xpcClientCreate != -1)
    dispatch_once(&IIOXPCClient::GetIIOXPCClient(void)::xpcClientCreate, &__block_literal_global_155);
  if (IIOXPCClient::processSupportsOOPCheckOnce((IIOXPCClient *)IIOXPCClient::GetIIOXPCClient(void)::gIIOXPCClient))
  {
    ImageIOLogInternal("⏹️   CGInitializeImageIO called...\n");
    v0 = (const __CFString *)*MEMORY[0x1E0C9B248];
    v1 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("IIO_LaunchInfo"), (CFStringRef)*MEMORY[0x1E0C9B248]);
    if (v1)
    {
      v2 = v1;
      CFNumberGetValue(v1, kCFNumberDoubleType, &gSavedFirstCallTime);
    }
    else
    {
      ImageIOLogInternal("⏹️   ImageIO: not launching XPCService (no launchinfo)...\n");
      v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &gSavedFirstCallTime);
      CFPreferencesSetAppValue(CFSTR("IIO_LaunchInfo"), v2, v0);
    }
    CFRelease(v2);
    v3 = *(double *)&gSavedFirstCallTime;
    if (*(double *)&gSavedFirstCallTime == -1.0)
    {
      ImageIOLogInternal("⏹️   ImageIO: waiting for first ImageIO call...\n", *(double *)&gSavedFirstCallTime);
      v4 = dispatch_time(0, 8000000000);
      global_queue = dispatch_get_global_queue(0, 0);
      dispatch_after(v4, global_queue, &__block_literal_global_9);
      v3 = *(double *)&gSavedFirstCallTime;
    }
    if (v3 > 0.0 && v3 < 10.0)
    {
      v6 = fmax(v3 + -0.06, 0.01);
      ImageIOLogInternal("⏹️   ImageIO: waiting %g s before launching XPCService\n", v6);
      v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      v8 = dispatch_get_global_queue(2, 0);
      dispatch_after(v7, v8, &__block_literal_global_13);
    }
  }
}

void __CGInitializeImageIO_block_invoke_3()
{
  _BYTE v0[16];
  CFPropertyListRef value;

  if (*(double *)&gFirstCallTime == 0.0)
  {
    ImageIOLogInternal("⏹️   ImageIO: not launching XPCService (no ImageIO call within first 8 sec)...\n", *(double *)&gFirstCallTime);
    IIONumber::IIONumber((IIONumber *)v0, -2.0);
    CFPreferencesSetAppValue(CFSTR("IIO_LaunchInfo"), value, (CFStringRef)*MEMORY[0x1E0C9B248]);
    IIONumber::~IIONumber((IIONumber *)v0);
  }
}

void __CGInitializeImageIO_block_invoke_4()
{
  IIOXPCClient *v0;

  ImageIOLogInternal("✳️   ImageIO: launching XPCService: %g\n", *(double *)&gSavedFirstCallTime);
  if (IIOXPCClient::GetIIOXPCClient(void)::xpcClientCreate != -1)
    dispatch_once(&IIOXPCClient::GetIIOXPCClient(void)::xpcClientCreate, &__block_literal_global_155);
  v0 = (IIOXPCClient *)IIOXPCClient::GetIIOXPCClient(void)::gIIOXPCClient;
  if (IIOXPCClient::processSupportsOOPCheckOnce((IIOXPCClient *)IIOXPCClient::GetIIOXPCClient(void)::gIIOXPCClient))
    IIOXPCClient::wakeup_xpc_service(v0);
}

@end
