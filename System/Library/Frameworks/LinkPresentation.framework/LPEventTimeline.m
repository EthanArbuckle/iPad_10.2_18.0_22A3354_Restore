@implementation LPEventTimeline

+ (id)eventWithType:(int64_t)a3 subtitle:(id)a4
{
  id v5;
  LPEvent *v6;

  v5 = a4;
  v6 = -[LPEvent initWithType:subtitle:]([LPEvent alloc], "initWithType:subtitle:", a3, v5);

  return v6;
}

@end
