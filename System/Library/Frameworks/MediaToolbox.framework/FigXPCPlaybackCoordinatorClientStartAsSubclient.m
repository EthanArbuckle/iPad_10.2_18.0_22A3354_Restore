@implementation FigXPCPlaybackCoordinatorClientStartAsSubclient

uint64_t __FigXPCPlaybackCoordinatorClientStartAsSubclient_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  gCoordinatorRemoteClient = *(_QWORD *)(result + 32);
  gHostingServerDeathNoticeName = v1;
  return result;
}

@end
