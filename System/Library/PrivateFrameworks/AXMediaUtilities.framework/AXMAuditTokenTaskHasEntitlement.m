@implementation AXMAuditTokenTaskHasEntitlement

id __AXMAuditTokenTaskHasEntitlement_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v3 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(v3 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __AXMCopyValueForEntitlementFromAuditTokenTask_block_invoke;
  v5[3] = &__block_descriptor_40_e17_____SecTask__8__0l;
  v5[4] = v2;
  _AXMCopyValueForEntitlementUsingTaskCreationBlock(v1, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
