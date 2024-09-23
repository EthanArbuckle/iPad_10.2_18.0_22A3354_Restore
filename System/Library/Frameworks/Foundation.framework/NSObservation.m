@implementation NSObservation

- (void)_observerStorageOfSize:(unint64_t)a3
{
  abort();
}

- (id)_observerStorage
{
  abort();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSObservation == a1)
    return &___placeholderObservation;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSObservation;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

@end
