@implementation FigEndpointUIAgentHelper

uint64_t __FigEndpointUIAgentHelper_GetSharedHelper_block_invoke()
{
  uint64_t result;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (dword_1EE2B3DC8 >= 0x100)
    dword_1EE2B3DC8 = 0;
  result = FigSimpleMutexCreate();
  qword_1EE2B2840 = 0;
  unk_1EE2B2848 = 0;
  FigEndpointUIAgentHelper_GetSharedHelper_endpointUIAgentHelperObj = result;
  return result;
}

@end
