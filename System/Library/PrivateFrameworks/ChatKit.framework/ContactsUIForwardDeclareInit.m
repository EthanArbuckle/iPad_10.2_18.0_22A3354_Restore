@implementation ContactsUIForwardDeclareInit

uint64_t ___ContactsUIForwardDeclareInit_block_invoke()
{
  uint64_t result;

  _CKCNMeCardSharingOnboardingEditViewController = MEMORY[0x193FF3C18](CFSTR("CNMeCardSharingOnboardingEditViewController"), CFSTR("ContactsUI"));
  _CKCNMeCardSharingOnboardingAudienceViewController = MEMORY[0x193FF3C18](CFSTR("CNMeCardSharingOnboardingAudienceViewController"), CFSTR("ContactsUI"));
  _CKCNSharingProfileOnboardingFlowManager = MEMORY[0x193FF3C18](CFSTR("CNSharingProfileOnboardingFlowManager"), CFSTR("ContactsUI"));
  result = MEMORY[0x193FF3C18](CFSTR("CNSharedProfileOnboardingController"), CFSTR("ContactsUI"));
  _CKCNSharedProfileOnboardingController = result;
  return result;
}

uint64_t ___ContactsUIForwardDeclareInit_block_invoke_0()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("CNSharingProfileAvatarItemProvider"), CFSTR("ContactsUI"));
  _CKCNSharingProfileAvatarItemProvider = result;
  return result;
}

@end
