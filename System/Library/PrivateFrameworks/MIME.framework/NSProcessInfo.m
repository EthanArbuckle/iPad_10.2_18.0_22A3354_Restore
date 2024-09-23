@implementation NSProcessInfo

id __57__NSProcessInfo_MIMEAdditions__mf_thermalStateObservable__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "thermalState"));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
