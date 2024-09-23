@implementation NSOperationQueue(HMMTROperationWithPriority)

- (void)addOperationWithBlock:()HMMTROperationWithPriority queuePriority:
{
  id v6;
  HMMTROperationWithPriority *v7;

  v6 = a3;
  v7 = -[HMMTROperationWithPriority initWithQueuePriority:block:]([HMMTROperationWithPriority alloc], "initWithQueuePriority:block:", a4, v6);

  objc_msgSend(a1, "addOperation:", v7);
}

@end
