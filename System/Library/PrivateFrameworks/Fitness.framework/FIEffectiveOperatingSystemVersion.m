@implementation FIEffectiveOperatingSystemVersion

double __FIEffectiveOperatingSystemVersion_block_invoke()
{
  double result;
  __int128 v1;
  uint64_t v2;

  HKNSOperatingSystemVersionFromString();
  FIEffectiveOperatingSystemVersion_moonstoneVersion = v1;
  qword_254ABE248 = v2;
  HKNSOperatingSystemVersionFromString();
  result = *(double *)&v1;
  FIEffectiveOperatingSystemVersion_emptyVersion = v1;
  qword_254ABE260 = v2;
  return result;
}

@end
