@implementation UIApplication(GKAdditions)

- (id)_gkTargetForAction:()GKAdditions viaResponder:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      if ((objc_msgSend(v7, "canPerformAction:withSender:", a3, v6) & 1) != 0)
        break;
      objc_msgSend(v7, "nextResponder");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_gkSendAction:()GKAdditions viaResponder:withObject:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "_gkTargetForAction:viaResponder:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (v9)
      v12 = v9;
    else
      v12 = v8;
    objc_msgSend(v10, "_gkPerformSelector:withObject:", a3, v12);
  }

  return v11 != 0;
}

@end
