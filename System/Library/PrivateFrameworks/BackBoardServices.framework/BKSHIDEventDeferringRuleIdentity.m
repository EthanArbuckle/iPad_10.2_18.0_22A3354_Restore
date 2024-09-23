@implementation BKSHIDEventDeferringRuleIdentity

uint64_t __66___BKSHIDEventDeferringRuleIdentity_appendDescriptionToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("[%d-%X]"), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
}

@end
