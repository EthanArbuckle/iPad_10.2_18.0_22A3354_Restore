@implementation NSError

uint64_t __61__NSError_AppleMediaServices__ams_underlyingErrorWithDomain___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_hasDomain:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__NSError_AppleMediaServices__ams_underlyingErrorWithDomain_code___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_hasDomain:code:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
