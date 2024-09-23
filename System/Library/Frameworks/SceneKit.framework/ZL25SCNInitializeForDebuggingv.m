@implementation ZL25SCNInitializeForDebuggingv

char *___ZL25SCNInitializeForDebuggingv_block_invoke()
{
  char *result;

  result = strncpy(byte_1F03C74B1, (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "temporaryDirectory"), "path"), "stringByDeletingLastPathComponent"), "UTF8String"), 0x100uLL);
  result[256] = 0;
  return result;
}

@end
