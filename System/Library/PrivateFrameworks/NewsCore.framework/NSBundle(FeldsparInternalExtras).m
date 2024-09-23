@implementation NSBundle(FeldsparInternalExtras)

+ (id)fc_feldsparCoreInternalExtrasBundle
{
  if (qword_1ED0F84B0 != -1)
    dispatch_once(&qword_1ED0F84B0, &__block_literal_global_107);
  return (id)qword_1ED0F84B8;
}

@end
