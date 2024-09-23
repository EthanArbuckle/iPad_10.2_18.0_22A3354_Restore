@implementation __NSTaggedDate

- (double)timeIntervalSinceReferenceDate
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v3 = 0;
    v5 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v5 = 0;
    v2 = v5 ^ (unint64_t)self;
    v4 = v2 & 7;
    do
    {
      if (v4 == *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v3))
        goto LABEL_8;
      ++v3;
    }
    while (v3 != 7);
  }
  do
  {
    __break(1u);
LABEL_8:
    ;
  }
  while (v3 != 6);
  v6 = 0xFFFFFFFFFFFFFFFLL;
  if (v4 == 7)
    v6 = 0xFFFFFFFFFFFFFLL;
  return decodeTaggedTimeInterval(v6 & (v2 >> 3));
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &___immutablePlaceholderDate;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)__NSTaggedDate;
  -[__NSTaggedDate dealloc](&v2, sel_dealloc);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (__NSTaggedDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  return (__NSTaggedDate *)-[NSDate initWithTimeIntervalSinceReferenceDate:]([NSDate alloc], "initWithTimeIntervalSinceReferenceDate:", a3);
}

@end
