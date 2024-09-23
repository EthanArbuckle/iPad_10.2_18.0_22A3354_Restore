@implementation FigRPCStartServer

void __FigRPCStartServer_block_invoke(uint64_t a1)
{
  FigMachPortReleaseReceiveRight_(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, 0, 0);
  FigMachPortReleaseSendRight_(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, 0, 0);
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __FigRPCStartServer_block_invoke_2()
{
  return dispatch_mig_server();
}

@end
