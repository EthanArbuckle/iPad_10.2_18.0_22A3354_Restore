@implementation NSURL(AttachmentURLUtilities)

- (uint64_t)mf_isValidAttachmentURL
{
  return objc_msgSend((id)objc_msgSend(a1, "scheme"), "hasPrefix:", CFSTR("x-attach"));
}

- (BOOL)mf_isResourceURL
{
  return objc_msgSend((id)objc_msgSend(a1, "scheme"), "caseInsensitiveCompare:", CFSTR("cid")) == 0;
}

- (uint64_t)mf_rowID
{
  void *v2;
  uint64_t result;

  if (!objc_msgSend(a1, "mf_isValidAttachmentURL"))
    return 0xFFFFFFFFLL;
  v2 = (void *)objc_msgSend(a1, "host");
  if (!v2)
    return 0xFFFFFFFFLL;
  result = objc_msgSend(v2, "integerValue");
  if (result < 0)
    return -1;
  return result;
}

- (uint64_t)mf_partNumbers
{
  void *v2;

  if (objc_msgSend(a1, "mf_isValidAttachmentURL")
    && (v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "pathComponents"), objc_msgSend(v2, "count")))
  {
    return objc_msgSend(v2, "subarrayWithRange:", 1, objc_msgSend(v2, "count") - 1);
  }
  else
  {
    return 0;
  }
}

- (uint64_t)mf_lastPartNumber
{
  return objc_msgSend((id)objc_msgSend(a1, "mf_partNumbers"), "lastObject");
}

- (uint64_t)mf_firstPartNumber
{
  void *v1;
  uint64_t result;

  v1 = (void *)objc_msgSend(a1, "mf_partNumbers");
  result = objc_msgSend(v1, "count");
  if (result)
    return objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  return result;
}

@end
