@implementation NSFileHandle

uint64_t __62__NSFileHandle_HealthKit__hk_enumerateLinesWithError_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "readDataUpToLength:error:", 4096, a2);
}

@end
