@implementation HMAssistantAccessControl

uint64_t __119__HMAssistantAccessControl_HFAdditions__hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages_currentUserIsOwner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsMultiUser") ^ 1;
}

uint64_t __119__HMAssistantAccessControl_HFAdditions__hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages_currentUserIsOwner___block_invoke_1(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsMultiUser");
}

uint64_t __119__HMAssistantAccessControl_HFAdditions__hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages_currentUserIsOwner___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsMultiUserLanguage:", *(_QWORD *)(a1 + 32));
}

@end
