@implementation EDCategoryPowerLogDidCreateInstance

void __EDCategoryPowerLogDidCreateInstance_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (categoryEnablementPowerLogIdentifier_onceToken != -1)
    dispatch_once(&categoryEnablementPowerLogIdentifier_onceToken, &__block_literal_global_18);
  v4 = CFSTR("MailCategorization");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PPSSendTelemetry();

}

@end
