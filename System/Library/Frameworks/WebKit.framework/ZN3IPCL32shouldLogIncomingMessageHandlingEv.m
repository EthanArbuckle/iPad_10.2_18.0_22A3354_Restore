@implementation ZN3IPCL32shouldLogIncomingMessageHandlingEv

char *___ZN3IPCL32shouldLogIncomingMessageHandlingEv_block_invoke()
{
  char *result;

  result = getenv("WEBKIT_LOG_INCOMING_MESSAGES");
  byte_1ECE7344A = result != 0;
  return result;
}

@end
