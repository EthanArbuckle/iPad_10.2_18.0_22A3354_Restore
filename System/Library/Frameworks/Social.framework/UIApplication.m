@implementation UIApplication

void __97__UIApplication_SLUIApplicationAdditions__shouldShowNetworkActivityIndicatorInRemoteApplication___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  int v7;

  if (__activityRequestCounter == 1)
  {
    if (*(_BYTE *)(a1 + 32))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB37C0];
    v5 = SLHideNetworkActivityIndicatorNotification;
  }
  else
  {
    if (__activityRequestCounter || !*(_BYTE *)(a1 + 32))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB37C0];
    v5 = SLShowNetworkActivityIndicatorNotification;
  }
  objc_msgSend(v4, "notificationWithName:object:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotification:", v6);

LABEL_8:
  if (*(_BYTE *)(a1 + 32))
    v7 = __activityRequestCounter + 1;
  else
    v7 = __activityRequestCounter - 1;
  __activityRequestCounter = v7;
  _SLLog(v1, 6, CFSTR("activityRequestCounter=%i"));
}

@end
