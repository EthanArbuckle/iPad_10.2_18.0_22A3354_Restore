@implementation ASSecureCloudShareItem(InvitationCodingSupport)

- (void)codableShareItem
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21381F000, a2, OS_LOG_TYPE_ERROR, "Error archiving share item error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
