@implementation _NADefaultQueueingStrategy

- (void)enqueueObject:(id)a3 buffer:(id)a4
{
  objc_msgSend(a4, "addObject:", a3);
}

@end
