@implementation NSNull(MKAdditions)

+ (id)_mapkit_fakeNil
{
  if (qword_1ECE2DAD0 != -1)
    dispatch_once(&qword_1ECE2DAD0, &__block_literal_global_156);
  return (id)qword_1ECE2DAC8;
}

@end
