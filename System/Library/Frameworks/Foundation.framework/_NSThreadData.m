@implementation _NSThreadData

- (_NSThreadData)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSThreadData;
  return -[_NSThreadData init](&v3, sel_init);
}

@end
