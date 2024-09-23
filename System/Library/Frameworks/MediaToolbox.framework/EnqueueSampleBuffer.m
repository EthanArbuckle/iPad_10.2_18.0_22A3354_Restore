@implementation EnqueueSampleBuffer

uint64_t __audioRendererCentral_EnqueueSampleBuffer_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = CMBaseObjectGetDerivedStorage();
  if (!*(_QWORD *)(result + 88))
  {
    v1 = result;
    FigServer_GetClientPIDFromAuditToken();
    result = FigOSTransactionCreate();
    *(_QWORD *)(v1 + 88) = result;
  }
  return result;
}

@end
