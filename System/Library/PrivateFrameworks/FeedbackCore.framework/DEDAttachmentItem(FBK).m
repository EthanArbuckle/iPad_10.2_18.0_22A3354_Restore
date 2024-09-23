@implementation DEDAttachmentItem(FBK)

- (uint64_t)pointsToReachableDir
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  id v7;

  objc_msgSend(a1, "attachedPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v7, *MEMORY[0x24BDBCC60], 0);
  v4 = v7;

  if (v3 && objc_msgSend(v4, "BOOLValue"))
    v5 = objc_msgSend(a1, "isLocal");
  else
    v5 = 0;

  return v5;
}

@end
