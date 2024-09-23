@implementation WDEmptyUserActivityResponder

+ (id)emptyUserActivityResponder
{
  if (emptyUserActivityResponder_onceToken != -1)
    dispatch_once(&emptyUserActivityResponder_onceToken, &__block_literal_global);
  return (id)emptyUserActivityResponder__emptyUserActivityResponder;
}

void __58__WDEmptyUserActivityResponder_emptyUserActivityResponder__block_invoke()
{
  WDEmptyUserActivityResponder *v0;
  void *v1;

  v0 = objc_alloc_init(WDEmptyUserActivityResponder);
  v1 = (void *)emptyUserActivityResponder__emptyUserActivityResponder;
  emptyUserActivityResponder__emptyUserActivityResponder = (uint64_t)v0;

}

@end
