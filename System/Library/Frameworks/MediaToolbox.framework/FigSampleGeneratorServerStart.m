@implementation FigSampleGeneratorServerStart

dispatch_queue_t __FigSampleGeneratorServerStart_block_invoke()
{
  int v0;
  dispatch_queue_t result;

  if (FigServer_IsMediaparserd())
  {
    v0 = FigSignalErrorAt();
  }
  else
  {
    FigServer_IsMediaplaybackd();
    v0 = FigXPCServerStart();
  }
  FigSampleGeneratorServerStart_sFigSampleGeneratorServerStartError = v0;
  result = dispatch_queue_create("com.apple.coremedia.samplegenerator.transport", 0);
  gFigSampleGeneratorServerCallbackQueue = (uint64_t)result;
  return result;
}

@end
