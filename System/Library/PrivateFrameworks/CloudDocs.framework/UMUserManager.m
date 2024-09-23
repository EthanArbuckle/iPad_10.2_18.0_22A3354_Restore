@implementation UMUserManager

void __47__UMUserManager_BRAdditions__br_isInSyncBubble__block_invoke()
{
  void *v0;
  int v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isSharedIPad") & 1) != 0)
  {
    objc_msgSend(v2, "currentUser");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "uid");
    br_isInSyncBubble_res = v1 != geteuid();

  }
  else
  {
    br_isInSyncBubble_res = 0;
  }

}

@end
