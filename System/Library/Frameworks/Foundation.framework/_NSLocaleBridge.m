@implementation _NSLocaleBridge

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)_prefForKey:(id)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_NSLocaleBridge;
  return -[_NSLocaleBridge _prefForKey:](&v4, sel__prefForKey_, a3);
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  return 0;
}

@end
