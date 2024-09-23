@implementation __NSDictionaryObjectEnumerator

- (id)nextObject
{
  id result;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)__NSDictionaryObjectEnumerator;
  result = -[__NSFastEnumerationEnumerator nextObject](&v4, sel_nextObject);
  if (result)
    return (id)objc_msgSend(self->super._origObj, "objectForKey:", result);
  return result;
}

@end
