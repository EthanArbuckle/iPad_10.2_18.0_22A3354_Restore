@implementation GetTypeID

uint64_t __receiverConfigurationActivationBlock_GetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  receiverConfigurationActivationBlock_GetTypeID_sReceiverConfigurationActivationBlockTypeID = result;
  return result;
}

@end
