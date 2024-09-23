@implementation APSAsyncLoggerGetTypeID

uint64_t __APSAsyncLoggerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APSAsyncLoggerGetTypeID_typeID = result;
  return result;
}

@end
