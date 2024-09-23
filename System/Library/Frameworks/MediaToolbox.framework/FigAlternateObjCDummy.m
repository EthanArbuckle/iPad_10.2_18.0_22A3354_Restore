@implementation FigAlternateObjCDummy

- (id)videoAttributes
{
  return objc_alloc_init(FigAlternateObjCVideoAttributesDummy);
}

- (id)audioAttributes
{
  return objc_alloc_init(FigAlternateObjCAudioAttributesDummy);
}

@end
