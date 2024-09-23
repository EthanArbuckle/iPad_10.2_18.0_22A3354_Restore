@implementation GKLocalPlayer(GKFaceTimeSupport)

+ (id)accountName
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "accountName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
