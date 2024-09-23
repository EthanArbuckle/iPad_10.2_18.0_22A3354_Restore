@implementation NSOwnedDictionaryProxy

- (void)superRelease
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)NSOwnedDictionaryProxy;
  -[NSOwnedDictionaryProxy release](&v2, sel_release);
}

- (void)release
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSOwnedDictionaryProxy;
  -[NSOwnedDictionaryProxy release](&v3, sel_release);
}

- (NSOwnedDictionaryProxy)retain
{
  id v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = self->_owner;
  v5.receiver = self;
  v5.super_class = (Class)NSOwnedDictionaryProxy;
  return -[NSOwnedDictionaryProxy retain](&v5, sel_retain);
}

- (NSOwnedDictionaryProxy)initWithOwner:(id)a3
{
  NSOwnedDictionaryProxy *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSOwnedDictionaryProxy;
  result = -[NSOwnedDictionaryProxy init](&v5, sel_init);
  if (result)
    result->_owner = a3;
  return result;
}

- (unint64_t)count
{
  return objc_msgSend(self->_owner, "ownedDictionaryCount");
}

- (id)keyEnumerator
{
  return (id)objc_msgSend(self->_owner, "ownedDictionaryKeyEnumerator");
}

- (id)objectForKey:(id)a3
{
  return (id)objc_msgSend(self->_owner, "ownedDictionaryObjectForKey:", a3);
}

@end
