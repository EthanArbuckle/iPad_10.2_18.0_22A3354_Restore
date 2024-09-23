@implementation _HMFCallerAsyncContext

- (void)performBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)description
{
  return CFSTR("HMFCallerAsyncContext");
}

@end
