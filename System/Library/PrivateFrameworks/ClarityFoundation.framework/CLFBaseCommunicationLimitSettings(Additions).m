@implementation CLFBaseCommunicationLimitSettings(Additions)

- (void)setOutgoingCommunicationLimit:()Additions .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "incomingCommunicationLimit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_20D4E9000, a3, OS_LOG_TYPE_FAULT, "Attempted to set outgoing communication limit to \"%@\", which was less restrictive than incoming communication limit \"%@\".", (uint8_t *)&v6, 0x16u);

}

@end
