@implementation UNNotificationContent(ArgonSupport)

- (uint64_t)argon_artworkUsed
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("argon_artworkUsed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

@end
