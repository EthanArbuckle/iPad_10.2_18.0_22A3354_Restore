@implementation NSProcessInfo(GEOExtras)

- (id)processStartTime
{
  if (qword_1ECDBBCA8 != -1)
    dispatch_once(&qword_1ECDBBCA8, &__block_literal_global_58);
  return (id)_MergedGlobals_214;
}

- (id)systemStartTime
{
  if (qword_1ECDBBCB8 != -1)
    dispatch_once(&qword_1ECDBBCB8, &__block_literal_global_2);
  return (id)qword_1ECDBBCB0;
}

@end
