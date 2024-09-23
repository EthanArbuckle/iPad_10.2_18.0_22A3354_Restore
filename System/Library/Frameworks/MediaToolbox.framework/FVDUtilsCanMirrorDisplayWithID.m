@implementation FVDUtilsCanMirrorDisplayWithID

uint64_t __FVDUtilsCanMirrorDisplayWithID_block_invoke()
{
  uint64_t result;

  result = FigVirtualDisplayPrefsGetBooleanWithDefault(CFSTR("allow_fvd_as_mirroring_source"), FVDUtilsCanMirrorDisplayWithID_allowFVDSource);
  FVDUtilsCanMirrorDisplayWithID_allowFVDSource = result;
  return result;
}

@end
