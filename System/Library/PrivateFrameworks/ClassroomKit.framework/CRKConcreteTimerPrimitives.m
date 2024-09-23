@implementation CRKConcreteTimerPrimitives

- (id)scheduleTimerWithIdentifier:(id)a3 timeInterval:(double)a4 fireHandler:(id)a5
{
  return +[CRKDispatchTimer scheduledTimerWithTimerInterval:queue:handler:](CRKDispatchTimer, "scheduledTimerWithTimerInterval:queue:handler:", MEMORY[0x24BDAC9B8], a5, a4);
}

@end
