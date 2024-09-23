@implementation __HMFBooleanFalse

- (BOOL)BOOLValue
{
  return 0;
}

+ (id)new
{
  if (qword_1ED013298 != -1)
    dispatch_once(&qword_1ED013298, &__block_literal_global_101);
  return (id)qword_1ED0132A0;
}

@end
