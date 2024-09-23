@implementation CreateRPCTimeoutThread

void __fpServer_CreateRPCTimeoutThread_block_invoke()
{
  uint64_t v0;

  qword_1EE141A08 = (uint64_t)FigDispatchQueueCreateWithPriority("FigRPCTimeoutServerQueue", 0, 0x23u);
  dword_1EE141A10 = 0;
  v0 = bootstrap_check_in(*MEMORY[0x1E0C81720], "com.apple.coremedia.admin", (mach_port_t *)&dword_1EE141A10);
  if ((_DWORD)v0)
  {
    FigSignalErrorAt(v0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    qword_1EE141A18 = (uint64_t)dispatch_source_create(MEMORY[0x1E0C80D98], dword_1EE141A10, 0, (dispatch_queue_t)qword_1EE141A08);
    dispatch_source_set_cancel_handler((dispatch_source_t)qword_1EE141A18, &__block_literal_global_11_1);
    dispatch_source_set_event_handler((dispatch_source_t)qword_1EE141A18, &__block_literal_global_13);
    dispatch_resume((dispatch_object_t)qword_1EE141A18);
  }
}

void __fpServer_CreateRPCTimeoutThread_block_invoke_2()
{
  FigMachPortReleaseReceiveRight_(dword_1EE141A10, 0, 0, 0, 0);
  FigMachPortReleaseSendRight_(dword_1EE141A10, 0, 0, 0, 0);
  dispatch_release((dispatch_object_t)qword_1EE141A18);
  qword_1EE141A18 = 0;
}

uint64_t __fpServer_CreateRPCTimeoutThread_block_invoke_3()
{
  return dispatch_mig_server();
}

@end
