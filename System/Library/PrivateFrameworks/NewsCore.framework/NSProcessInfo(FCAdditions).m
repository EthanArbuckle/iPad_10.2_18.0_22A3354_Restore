@implementation NSProcessInfo(FCAdditions)

- (id)fc_processLaunchDate
{
  if (qword_1ED0F7F68 != -1)
    dispatch_once(&qword_1ED0F7F68, &__block_literal_global_46);
  return (id)_MergedGlobals_155;
}

@end
