@implementation RPCompanionLinkClient(COCompanionLinkClientFlag)

- (uint64_t)co_CompanionLinkClientFlags
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_co_CompanionLinkClientFlags);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)co_SetCompanionLinkClientFlags:()COCompanionLinkClientFlag
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_co_CompanionLinkClientFlags, v2, (void *)0x303);

}

@end
