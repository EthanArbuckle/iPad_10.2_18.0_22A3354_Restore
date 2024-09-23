@implementation NSMutableArray(HMFQueue)

- (id)hmf_dequeue
{
  void *v2;

  objc_msgSend(a1, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return v2;
}

- (id)hmf_maybeDequeue
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "hmf_dequeue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
