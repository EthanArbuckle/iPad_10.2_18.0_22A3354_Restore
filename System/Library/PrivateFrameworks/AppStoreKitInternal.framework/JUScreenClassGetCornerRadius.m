@implementation JUScreenClassGetCornerRadius

double __JUScreenClassGetCornerRadius_block_invoke()
{
  float v0;
  double result;

  MGGetFloat32Answer();
  result = v0;
  JUScreenClassGetCornerRadius_cornerRadius = *(_QWORD *)&result;
  return result;
}

@end
