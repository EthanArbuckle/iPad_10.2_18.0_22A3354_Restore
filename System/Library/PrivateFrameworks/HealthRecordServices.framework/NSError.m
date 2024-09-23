@implementation NSError

uint64_t __60__NSError_HealthRecordsServices__hrs_isReloginRequiredError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hrs_isReloginRequiredError");
}

uint64_t __71__NSError_HealthRecordsServices___hrs_accumulatedErrorsForUserInfoKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __84__NSError_HealthRecordsServices__hrs_hasResourceFetchErrorsIndicatingRateLimitation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hrs_hasResourceFetchErrorsIndicatingRateLimitation");
}

uint64_t __92__NSError_HealthRecordsServices__hrs_completeDescriptionRedactingSensitiveItemsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:", *(unsigned __int8 *)(a1 + 32));
}

void __89__NSError_HealthRecordsServices__hrs_userInfoValueForKey_prefixedWith_redactIfNecessary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

@end
