@implementation FigVideoReceiverConnectionHelperGetTypeID

uint64_t __FigVideoReceiverConnectionHelperGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  sFigVideoReceiverConnectionHelperID = result;
  return result;
}

@end
