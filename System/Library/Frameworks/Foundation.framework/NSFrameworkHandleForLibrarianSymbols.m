@implementation NSFrameworkHandleForLibrarianSymbols

void *___NSFrameworkHandleForLibrarianSymbols_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 256);
  qword_1ECD09780 = (uint64_t)result;
  return result;
}

@end
