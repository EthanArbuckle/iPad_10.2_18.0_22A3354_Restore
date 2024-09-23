@implementation FigRoutingManagerInit

void __FigRoutingManagerInit_block_invoke()
{
  uint64_t v0;

  if (FigRoutingManagerGetSharedManager_sFigRoutingManagerStateSetupOnce != -1)
    dispatch_once(&FigRoutingManagerGetSharedManager_sFigRoutingManagerStateSetupOnce, &__block_literal_global_3);
  v0 = (uint64_t)&qword_1EE2B2880;
  if (!qword_1EE2B2880)
    v0 = 8;
  MXDispatchAsync((uint64_t)"FigRoutingManagerInit_block_invoke", (uint64_t)"FigRoutingManager.m", 1852, 0, 0, *(NSObject **)v0, (uint64_t)&__block_literal_global_18);
}

@end
