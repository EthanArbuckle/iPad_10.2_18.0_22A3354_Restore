@implementation ARCamera(OUCamera)

- (double)pose
{
  simd_float4x4 v2;

  objc_msgSend(x0_0, "transform");
  return RenderPoseToVisionPose(v2);
}

@end
