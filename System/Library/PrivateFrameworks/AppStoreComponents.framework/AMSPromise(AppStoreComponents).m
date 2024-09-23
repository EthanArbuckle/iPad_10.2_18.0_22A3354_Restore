@implementation AMSPromise(AppStoreComponents)

- (uint64_t)asc_isCanceledOrPending
{
  if ((objc_msgSend(a1, "isCancelled") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isFinished") ^ 1;
}

@end
