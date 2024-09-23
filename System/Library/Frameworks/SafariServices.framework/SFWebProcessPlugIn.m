@implementation SFWebProcessPlugIn

FILE *__61___SFWebProcessPlugIn_webProcessPlugIn_initializeWithObject___block_invoke(uint64_t a1)
{
  FILE *result;

  result = fopen((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"), "a");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

@end
