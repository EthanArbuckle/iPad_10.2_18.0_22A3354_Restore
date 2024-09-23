@implementation HRWDEmptyUserActivityResponder

+ (id)emptyUserActivityResponder
{
  if (emptyUserActivityResponder_onceToken != -1)
    dispatch_once(&emptyUserActivityResponder_onceToken, &__block_literal_global_4);
  return (id)emptyUserActivityResponder__emptyUserActivityResponder;
}

void __60__HRWDEmptyUserActivityResponder_emptyUserActivityResponder__block_invoke()
{
  HRWDEmptyUserActivityResponder *v0;
  void *v1;

  v0 = objc_alloc_init(HRWDEmptyUserActivityResponder);
  v1 = (void *)emptyUserActivityResponder__emptyUserActivityResponder;
  emptyUserActivityResponder__emptyUserActivityResponder = (uint64_t)v0;

}

@end
