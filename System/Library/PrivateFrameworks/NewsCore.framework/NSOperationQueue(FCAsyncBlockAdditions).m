@implementation NSOperationQueue(FCAsyncBlockAdditions)

- (void)fc_addAsyncOperationWithBlock:()FCAsyncBlockAdditions
{
  id v2;

  +[FCAsyncBlockOperation asyncBlockOperationWithBlock:](FCAsyncBlockOperation, "asyncBlockOperationWithBlock:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addOperation:", v2);

}

@end
