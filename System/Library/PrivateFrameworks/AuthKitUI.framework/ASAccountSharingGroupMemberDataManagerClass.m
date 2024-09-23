@implementation ASAccountSharingGroupMemberDataManagerClass

Class __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  double v6;

  AuthenticationServicesLibrary();
  result = objc_getClass("_ASAccountSharingGroupMemberDataManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_ASAccountSharingGroupMemberDataManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  }
  else
  {
    v3 = (void *)__get_ASAccountSharingGroupMemberDataManagerClass_block_invoke_cold_1();
    return (Class)+[AKSignInWithAppleAvatarManager avatarImageForUserHandle:diameter:](v3, v4, v5, v6);
  }
  return result;
}

uint64_t __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2_cold_1(v0);
}

@end
