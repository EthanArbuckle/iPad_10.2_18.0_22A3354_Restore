@implementation NSSearchPathEnumerator

- (id)nextObject
{
  id result;
  char __s[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  result = (id)__CFGetNextSearchPathEnumeration();
  self->state = (int64_t)result;
  if (result)
    return -[NSFileManager stringWithFileSystemRepresentation:length:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
  return result;
}

- (NSSearchPathEnumerator)initWithDirectory:(unint64_t)a3 domains:(unint64_t)a4
{
  NSSearchPathEnumerator *v6;
  NSSearchPathEnumerator *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSSearchPathEnumerator;
  v6 = -[NSSearchPathEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->directory = a3;
    v6->domainMask = a4;
    v6->state = __CFStartSearchPathEnumeration();
  }
  return v7;
}

@end
