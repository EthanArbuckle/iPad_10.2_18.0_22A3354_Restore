@implementation NSMutableURLRequest(AskPermission)

- (void)ap_setNullableValue:()AskPermission forHTTPHeaderField:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:");
  return a1;
}

@end
