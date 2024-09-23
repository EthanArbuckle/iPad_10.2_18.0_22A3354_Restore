@implementation NSData(NSURLSession_Additions)

- (void)_isSafeResumeDataForBackgroundDownload
{
  void *result;

  result = (void *)objc_msgSend(a1, "_requestFromResumeData");
  if (result)
    return (void *)objc_msgSend(result, "_isSafeRequestForBackgroundDownload");
  return result;
}

- (id)_requestFromResumeData
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;

  if (!a1)
    goto LABEL_5;
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a1, 0);
  objc_msgSend(v2, "setDecodingFailurePolicy:", 1);
  if (resumeDataClasses(void)::onceToken != -1)
    dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_3214);
  v3 = (id)objc_msgSend((id)objc_msgSend(v2, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, CFSTR("NSKeyedArchiveRootObjectKey")), "mutableCopy");
  objc_msgSend(v2, "finishDecoding");
  if (!v3)
LABEL_5:
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a1, 0, 0, 0);
  v4 = objc_msgSend(v3, "objectForKey:", CFSTR("NSURLSessionResumeCurrentRequest"));
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
  if (!v5)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
    if (v6)
    {
      v7 = v6;
      if (resumeDataClasses(void)::onceToken != -1)
        dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_3214);
      v5 = (id)objc_msgSend((id)objc_msgSend(v7, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, CFSTR("NSKeyedArchiveRootObjectKey")), "copy");
      objc_msgSend(v7, "finishDecoding");
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
