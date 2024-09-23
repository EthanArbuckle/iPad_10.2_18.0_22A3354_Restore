@implementation NSError(MessageAdditions)

- (uint64_t)mf_isUserCancelledError
{
  if (objc_msgSend(a1, "code") == 1028)
    return objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", objc_msgSend(a1, "domain"));
  else
    return 0;
}

- (uint64_t)mf_isSMIMEError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = objc_msgSend(a1, "domain");
  v3 = objc_msgSend(a1, "code");
  LODWORD(result) = objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", v2);
  if ((unint64_t)(v3 - 1035) < 2)
    return result;
  else
    return 0;
}

- (uint64_t)mf_shouldBeReportedToUser
{
  if ((objc_msgSend(a1, "mf_isUserCancelledError") & 1) != 0)
    return 0;
  if (objc_msgSend(a1, "code") == 1029)
    return objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", objc_msgSend(a1, "domain")) ^ 1;
  return 1;
}

- (uint64_t)mf_moreInfo
{
  return objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("_MFMoreInfo"));
}

- (uint64_t)mf_shortDescription
{
  return objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("_MFShortDescription"));
}

- (BOOL)mf_shouldFailDownload
{
  if (!objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", objc_msgSend(a1, "domain")))
    return 1;
  if (objc_msgSend(a1, "code") == 1036)
    return 0;
  return objc_msgSend(a1, "code") != 1035;
}

@end
