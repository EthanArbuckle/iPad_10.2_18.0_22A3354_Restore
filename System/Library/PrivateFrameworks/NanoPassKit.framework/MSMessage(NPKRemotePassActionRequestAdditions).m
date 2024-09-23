@implementation MSMessage(NPKRemotePassActionRequestAdditions)

- (id)request
{
  void *v2;
  __objc2_class **v3;
  void *v4;

  objc_msgSend(a1, "remotePassAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "supportsTopUp") & 1) != 0)
  {
    v3 = off_24CFE5FE8;
  }
  else
  {
    if (!objc_msgSend(v2, "supportsCommutePlanRenewal"))
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = off_24CFE5FF8;
  }
  v4 = (void *)objc_msgSend(objc_alloc(*v3), "initWithUnderlyingMessage:", a1);
LABEL_7:

  return v4;
}

@end
