@implementation FigEndpointAuthRequestHandler

uint64_t __FigEndpointAuthRequestHandler_GetAuthRequestList_block_invoke()
{
  uint64_t result;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (dword_1EE2B3B40 >= 0x100)
    dword_1EE2B3B40 = 0;
  result = FigSimpleMutexCreate();
  FigEndpointAuthRequestHandler_GetAuthRequestList_authListObj = 0;
  xmmword_1EE2B23A8 = 0uLL;
  qword_1EE2B23A0 = result;
  return result;
}

@end
