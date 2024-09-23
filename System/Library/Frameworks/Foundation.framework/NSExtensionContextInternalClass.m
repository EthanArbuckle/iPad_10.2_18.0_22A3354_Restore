@implementation NSExtensionContextInternalClass

uint64_t ___NSExtensionContextInternalClass_block_invoke()
{
  uint64_t result;

  if (softLinkEXGetExtensionContextInternalClass)
    result = softLinkEXGetExtensionContextInternalClass();
  else
    result = 0;
  qword_1ECD09D50 = result;
  return result;
}

@end
