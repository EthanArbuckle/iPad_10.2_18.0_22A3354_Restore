@implementation HMDHH2AutoMigrationHasSharedUserOrPendingInvitation

uint64_t __HMDHH2AutoMigrationHasSharedUserOrPendingInvitation_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPending");
}

@end
