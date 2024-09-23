@implementation ZL26isHarvestingForThisProcessv

void *___ZL26isHarvestingForThisProcessv_block_invoke(uint64_t a1)
{
  void *v1;
  void *result;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", *(_QWORD *)(a1 + 32), 1);
  result = (void *)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  if (result)
    result = (void *)objc_msgSend(v1, "containsString:", objc_msgSend(result, "processName"));
  isHarvestingForThisProcess(void)::isListed = (char)result;
  return result;
}

@end
