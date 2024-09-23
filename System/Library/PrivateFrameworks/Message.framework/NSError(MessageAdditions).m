@implementation NSError(MessageAdditions)

- (uint64_t)mf_isUserCancelledError
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "ef_isCancelledError") & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "code") != 1028)
    return 0;
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "isEqualToString:", CFSTR("MFMessageErrorDomain"));

  return v2;
}

- (id)mf_shortDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("_MFShortDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)mf_isSMIMEError
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "code");
  v4 = objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", v2);
  if ((unint64_t)(v3 - 1035) < 2)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)mf_shouldBeReportedToUser
{
  void *v3;
  int v4;

  if ((objc_msgSend(a1, "mf_isUserCancelledError") & 1) != 0)
    return 0;
  if (objc_msgSend(a1, "code") != 1029)
    return 1;
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", v3);

  return v4 ^ 1u;
}

- (id)mf_moreInfo
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("_MFMoreInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)mf_shouldFailDownload
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", v2))
    v3 = objc_msgSend(a1, "code") != 1036 && objc_msgSend(a1, "code") != 1035;
  else
    v3 = 1;

  return v3;
}

@end
