@implementation FBSScene

- (int)_uvPreviewShellHostProcessPid
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSScene hostHandle](self, "hostHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "auditToken"));
  v4 = objc_msgSend(v3, "pid");

  return v4;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)+[UIWindowScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", self);
}

@end
