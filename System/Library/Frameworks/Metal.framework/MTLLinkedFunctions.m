@implementation MTLLinkedFunctions

+ (MTLLinkedFunctions)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLLinkedFunctions *)+[MTLLinkedFunctionsInternal allocWithZone:](MTLLinkedFunctionsInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLLinkedFunctions;
  return (MTLLinkedFunctions *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLLinkedFunctions)linkedFunctions
{
  return (MTLLinkedFunctions *)objc_alloc_init(MTLLinkedFunctionsInternal);
}

- (NSArray)privateFunctions
{
  return self->_privateFunctions;
}

- (void)setPrivateFunctions:(NSArray *)privateFunctions
{
  objc_setProperty_nonatomic_copy(self, a2, privateFunctions, 8);
}

@end
