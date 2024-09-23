@implementation FigCaptureExternalCameraReplacesBuiltIn

void __FigCaptureExternalCameraReplacesBuiltIn_block_invoke()
{
  if (FigCaptureIsRunningInVirtualization_sOnceToken != -1)
    dispatch_once(&FigCaptureIsRunningInVirtualization_sOnceToken, &__block_literal_global_70);
  FigCaptureExternalCameraReplacesBuiltIn_sExternalReplacesBuiltIn = FigCaptureIsRunningInVirtualization_sAnswer;
}

@end
