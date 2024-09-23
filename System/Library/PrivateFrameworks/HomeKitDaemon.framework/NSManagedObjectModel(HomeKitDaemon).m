@implementation NSManagedObjectModel(HomeKitDaemon)

- (uint64_t)hmd_isImmutable
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "isEditable") ^ 1;
  else
    return 0;
}

- (uint64_t)hmd_makeImmutable
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "_setIsEditable:", 0);
  return result;
}

@end
