@implementation BKSDisplayBrightnessTransactionGetTypeID

uint64_t __BKSDisplayBrightnessTransactionGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __BKSDisplayBrightnessTransactionTypeID = result;
  return result;
}

@end
