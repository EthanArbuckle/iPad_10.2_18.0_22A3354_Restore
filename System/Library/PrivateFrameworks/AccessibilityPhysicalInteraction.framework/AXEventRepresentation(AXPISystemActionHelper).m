@implementation AXEventRepresentation(AXPISystemActionHelper)

- (void)setPostHIDEventDirectly:()AXPISystemActionHelper
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &PostHIDDirectly, v2, (void *)1);

}

- (uint64_t)postHIDEventDirectly
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &PostHIDDirectly);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
