@implementation NSURL(AttachmentURLUtilities)

- (uint64_t)mf_isValidAttachmentURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("x-attach"));

  return v2;
}

- (uint64_t)mf_isResourceURL
{
  return objc_msgSend(a1, "ef_hasScheme:", *MEMORY[0x1E0D46C08]);
}

- (uint64_t)mf_rowID
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *MEMORY[0x1E0D1DC08];
  if (objc_msgSend(a1, "mf_isValidAttachmentURL"))
  {
    objc_msgSend(a1, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "longLongValue");
      if (v5 >= 0)
        v2 = v5;
    }

  }
  return v2;
}

- (id)mf_partNumbers
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "mf_isValidAttachmentURL"))
  {
    objc_msgSend(a1, "absoluteString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)mf_lastPartNumber
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "mf_partNumbers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)mf_firstPartNumber
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "mf_partNumbers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
