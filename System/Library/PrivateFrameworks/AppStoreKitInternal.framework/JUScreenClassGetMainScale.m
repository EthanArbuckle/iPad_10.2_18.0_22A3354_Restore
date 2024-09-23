@implementation JUScreenClassGetMainScale

double __JUScreenClassGetMainScale_block_invoke()
{
  float v0;
  double result;

  MGGetFloat32Answer();
  result = v0;
  JUScreenClassGetMainScale_scale = *(_QWORD *)&result;
  return result;
}

@end
