@implementation APGetGuardServiceInterface

uint64_t __APGetGuardServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563DDB38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)APGetGuardServiceInterface_interface;
  APGetGuardServiceInterface_interface = v0;

  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_initiateAuthenticationWithShieldingForBundle_completion_, 1, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_initiateAuthenticationWithShieldingForBundle_completion_, 0, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForBundle_completion_, 1, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForBundle_completion_, 0, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_initiateAuthenticationWithShieldingForBundle_onBehalfOfProcessWithAuditToken_accessGrantReason_completion_, 1, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_initiateAuthenticationWithShieldingForBundle_onBehalfOfProcessWithAuditToken_accessGrantReason_completion_, 0, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_beginTransactionForAccessOfBundle_onBehalfOfProcessWithAuditToken_accessGrantReason_transactionUUID_completion_, 0, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_beginTransactionForAccessOfBundle_onBehalfOfProcessWithAuditToken_accessGrantReason_transactionUUID_completion_, 3, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_initiateAuthenticationWithShieldingForBundle_onBehalfOfProcessWithAuditToken_accessGrantReason_completion_, 0, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_endTransactionWithUUID_completion_, 0, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_endTransactionWithUUID_completion_, 0, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getIsChallengeCurrentlyRequiredForBundle_completion_, 0, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getIsChallengeCurrentlyRequiredForBundle_completion_, 0, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getIsChallengeCurrentlyRequiredForBundle_completion_, 1, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateUnconditionallyWithReason_completion_, 0, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateUnconditionallyWithReason_completion_, 1, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForShieldUnlockOfBundle_completion_, 0, 1);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForBundle_interfacePresentationTarget_completion_, 0, 0);
  objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_authenticateForBundle_interfacePresentationTarget_completion_, 0, 1);
  return objc_msgSend((id)APGetGuardServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_abortOngoingAuthWithCompletion_, 0, 1);
}

@end
