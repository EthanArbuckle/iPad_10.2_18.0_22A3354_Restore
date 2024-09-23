@implementation ForJetUIOnly

double __ForJetUIOnly_MainScreenScale_block_invoke()
{
  float v0;
  double result;

  MGGetFloat32Answer();
  result = v0;
  ForJetUIOnly_MainScreenScale_scale = *(_QWORD *)&result;
  return result;
}

@end
