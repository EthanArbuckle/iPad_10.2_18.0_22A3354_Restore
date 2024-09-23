@implementation EKCalendar(ATX)

- (uint64_t)atx_isAllowedCalendar
{
  void *v3;
  int v4;

  if (objc_msgSend(a1, "type") == 3 || (objc_msgSend(a1, "isSubscribed") & 1) != 0)
    return 0;
  objc_msgSend(a1, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDelegate");

  return v4 ^ 1u;
}

@end
