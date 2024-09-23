@implementation NSUndoManager(IC)

+ (id)shared
{
  if (shared_token != -1)
    dispatch_once(&shared_token, &__block_literal_global_25);
  return (id)shared_sharedUndoManager;
}

- (uint64_t)ic_isUndoingOrRedoing
{
  if ((objc_msgSend(a1, "isUndoing") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isRedoing");
}

@end
