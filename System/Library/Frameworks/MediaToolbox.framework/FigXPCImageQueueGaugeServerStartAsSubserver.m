@implementation FigXPCImageQueueGaugeServerStartAsSubserver

uint64_t __FigXPCImageQueueGaugeServerStartAsSubserver_block_invoke(uint64_t result)
{
  gImageQueueGaugeServer = *(_QWORD *)(result + 32);
  return result;
}

@end
