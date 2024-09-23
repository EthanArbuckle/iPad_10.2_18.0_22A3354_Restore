@implementation __NSDate

- (double)timeIntervalSinceReferenceDate
{
  return self->_time;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)__NSDate;
  -[__NSDate dealloc](&v2, sel_dealloc);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &___immutablePlaceholderDate;
}

- (__NSDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  return (__NSDate *)-[NSDate initWithTimeIntervalSinceReferenceDate:]([NSDate alloc], "initWithTimeIntervalSinceReferenceDate:", a3);
}

@end
