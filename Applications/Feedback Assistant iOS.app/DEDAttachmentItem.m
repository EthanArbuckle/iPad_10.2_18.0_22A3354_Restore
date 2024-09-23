@implementation DEDAttachmentItem

- (BOOL)pointsToReachableDir
{
  void *v3;
  unsigned int v4;
  id v5;
  unsigned __int8 v6;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DEDAttachmentItem attachedPath](self, "attachedPath"));
  v8 = 0;
  v4 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v8, NSURLIsDirectoryKey, 0);
  v5 = v8;

  if (v4 && objc_msgSend(v5, "BOOLValue"))
    v6 = -[DEDAttachmentItem isLocal](self, "isLocal");
  else
    v6 = 0;

  return v6;
}

@end
