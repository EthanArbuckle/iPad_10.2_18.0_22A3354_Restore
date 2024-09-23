@implementation FigDataQueueServer

void __FigDataQueueServer_EnsureServerAndCopyXPCEndpoint_block_invoke()
{
  CFDictionaryRef v0;
  CFDictionaryRef v1;
  int v2;

  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v0 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CA54E0], MEMORY[0x1E0C9AE50], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v0)
  {
    v1 = v0;
    v2 = FigXPCServerStartWithNewXPCEndpoint();
    CFRelease(v1);
  }
  else
  {
    v2 = FigSignalErrorAt();
  }
  FigDataQueueServer_EnsureServerAndCopyXPCEndpoint_sFigDataQueueServerStartError = v2;
}

@end
