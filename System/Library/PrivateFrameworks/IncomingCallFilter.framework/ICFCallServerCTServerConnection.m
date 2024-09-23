@implementation ICFCallServerCTServerConnection

void *__ICFCallServerCTServerConnection_block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x20BD09E80]("_CTServerConnectionCreateWithIdentifier", CFSTR("CoreTelephony"));
  ICFCallServerCTServerConnection___CTServerConnectionCreateWithIdentifier = result;
  return result;
}

void *__ICFCallServerCTServerConnection_block_invoke_2()
{
  void *result;

  result = (void *)MEMORY[0x20BD09E80]("_CTServerConnectionSetTargetQueue", CFSTR("CoreTelephony"));
  ICFCallServerCTServerConnection___CTServerConnectionSetTargetQueue = result;
  return result;
}

@end
