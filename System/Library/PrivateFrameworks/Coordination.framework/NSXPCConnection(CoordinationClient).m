@implementation NSXPCConnection(CoordinationClient)

- (void)co_setOriginalInterruptionHandler:()CoordinationClient
{
  id v4;

  v4 = (id)MEMORY[0x212BE9A2C](a3);
  objc_setAssociatedObject(a1, sel_co_originalInterruptionHandler, v4, (void *)1);

}

- (void)co_setOriginalInvalidationHandler:()CoordinationClient
{
  id v4;

  v4 = (id)MEMORY[0x212BE9A2C](a3);
  objc_setAssociatedObject(a1, sel_co_originalInvalidationHandler, v4, (void *)1);

}

- (id)co_originalInterruptionHandler
{
  return objc_getAssociatedObject(a1, sel_co_originalInterruptionHandler);
}

- (id)co_originalInvalidationHandler
{
  return objc_getAssociatedObject(a1, sel_co_originalInvalidationHandler);
}

@end
