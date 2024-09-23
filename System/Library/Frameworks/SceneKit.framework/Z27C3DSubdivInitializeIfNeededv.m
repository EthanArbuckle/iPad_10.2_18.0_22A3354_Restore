@implementation Z27C3DSubdivInitializeIfNeededv

void *___Z27C3DSubdivInitializeIfNeededv_block_invoke()
{
  void (*v0)(const char *);

  OpenSubdiv::v3_1_1::Far::SetErrorCallback(_C3DSubdivErrorCallbackFunc);
  return OpenSubdiv::v3_1_1::Far::SetWarningCallback(_C3DSubdivWarningCallbackFunc, v0);
}

@end
