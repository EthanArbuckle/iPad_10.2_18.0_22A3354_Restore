@implementation NSXPCConnection(AKAdaptiveServiceShouldHandle)

- (uint64_t)shouldHandleInvalidation
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &_AKAdaptiveServiceShouldHandleInvalidationKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setShouldHandleInvalidation:()AKAdaptiveServiceShouldHandle
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_AKAdaptiveServiceShouldHandleInvalidationKey, v2, (void *)0x301);

}

@end
