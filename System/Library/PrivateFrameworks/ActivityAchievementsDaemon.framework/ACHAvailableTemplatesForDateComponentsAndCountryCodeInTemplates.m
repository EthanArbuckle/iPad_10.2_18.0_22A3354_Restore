@implementation ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates

uint64_t __ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates_block_invoke(uint64_t a1, void *a2)
{
  return ACHTemplateIsAvailableForCalendarAndDate(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

@end
