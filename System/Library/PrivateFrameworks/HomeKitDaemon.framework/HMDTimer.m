@implementation HMDTimer

- (HMDTimer)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return (HMDTimer *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

- (id)backoffTimerWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4 exponentialFactor:(int64_t)a5 options:(unint64_t)a6
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F170]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", a5, a6, a3, a4);
}

@end
