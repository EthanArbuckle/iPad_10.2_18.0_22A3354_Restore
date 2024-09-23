@implementation FigImageQueueGaugeXPCRemoteStartAsSubClient

uint64_t __FigImageQueueGaugeXPCRemoteStartAsSubClient_block_invoke(uint64_t result)
{
  gImageQueueGaugeRemoteClient = *(_QWORD *)(result + 32);
  return result;
}

@end
