@implementation ICAccessibilityNeedsAccessibilityElements

void __ICAccessibilityNeedsAccessibilityElements_block_invoke(uint64_t a1)
{
  id v2;

  +[ICAccessibility sharedInstance](ICAccessibility, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "icaxRespondsToSelector:fromExtrasProtocol:", sel_needsAccessibilityElements, &unk_1EECD84F0))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "needsAccessibilityElements");

}

@end
