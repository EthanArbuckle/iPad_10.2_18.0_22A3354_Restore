@implementation FigXPCPlaybackCoordinatorServerStartAsSubserver

uint64_t __FigXPCPlaybackCoordinatorServerStartAsSubserver_block_invoke(uint64_t result)
{
  gPlaybackCoordinatorServer = *(_QWORD *)(result + 32);
  return result;
}

@end
