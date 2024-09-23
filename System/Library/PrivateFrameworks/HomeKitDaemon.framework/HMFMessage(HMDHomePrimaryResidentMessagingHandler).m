@implementation HMFMessage(HMDHomePrimaryResidentMessagingHandler)

- (BOOL)isRequestType
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  if (v3)
  {
    v4 = objc_msgSend(v3, "type");

    return v4 == 0;
  }
  else
  {
    objc_msgSend(v1, "responseHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

@end
