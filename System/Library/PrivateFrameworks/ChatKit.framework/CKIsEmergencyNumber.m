@implementation CKIsEmergencyNumber

uint64_t __CKIsEmergencyNumber_block_invoke()
{
  uint64_t result;
  _OWORD v1[2];
  uint64_t v2;

  if (sTestLocale_block_invoke__pred__CTServerConnectionCreateCoreTelephony != -1)
    dispatch_once(&sTestLocale_block_invoke__pred__CTServerConnectionCreateCoreTelephony, &__block_literal_global_875);
  v2 = 0;
  memset(v1, 0, sizeof(v1));
  result = sTestLocale_block_invoke___CTServerConnectionCreate(*MEMORY[0x1E0C9AE00], _CKUtilitiesCTServerFauxCreateCallback, v1);
  CKIsEmergencyNumber_sConnection = result;
  return result;
}

void *__CKIsEmergencyNumber_block_invoke_2()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("_CTServerConnectionCreate", CFSTR("CoreTelephony"));
  sTestLocale_block_invoke___CTServerConnectionCreate = result;
  return result;
}

void *__CKIsEmergencyNumber_block_invoke_3()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("_CTServerConnectionIsEmergencyNumber", CFSTR("CoreTelephony"));
  CKIsEmergencyNumber___CTServerConnectionIsEmergencyNumber = result;
  return result;
}

@end
