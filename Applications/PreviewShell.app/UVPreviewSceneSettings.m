@implementation UVPreviewSceneSettings

- (id)copyRemovingTargetOfEventDeferringEnvironments
{
  id v2;
  id v3;

  v2 = -[UVPreviewSceneSettings mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "setTargetOfEventDeferringEnvironments:", 0);
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

@end
