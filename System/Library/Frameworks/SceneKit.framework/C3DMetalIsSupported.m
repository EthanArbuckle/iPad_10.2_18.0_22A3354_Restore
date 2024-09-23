@implementation C3DMetalIsSupported

void __C3DMetalIsSupported_block_invoke()
{
  char v0;
  char v1;
  char v2;
  id v3;

  v3 = MTLCreateSystemDefaultDevice();
  C3DMetalIsSupported_supported = v3 != 0;
  v0 = objc_msgSend(v3, "supportsFeatureSet:", 1);
  kASTCIsSupported |= v0;
  v1 = objc_msgSend(v3, "supportsFeatureSet:", 3);
  kASTCIsSupported |= v1;
  v2 = objc_msgSend(v3, "supportsFeatureSet:", 4);
  kASTCIsSupported |= v2;

}

@end
