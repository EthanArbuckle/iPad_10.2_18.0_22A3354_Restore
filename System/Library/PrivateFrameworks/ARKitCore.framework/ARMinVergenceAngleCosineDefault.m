@implementation ARMinVergenceAngleCosineDefault

void __ARMinVergenceAngleCosineDefault_block_invoke()
{
  double v0;

  +[ARKitUserDefaults doubleForKey:](ARKitUserDefaults, "doubleForKey:", CFSTR("com.apple.arkit.worldtracking.minVergenceAngle"));
  ARMinVergenceAngleCosineDefault_sMinVergenceAngleCosine = cos(v0 * 3.14159265 / 180.0);
}

@end
