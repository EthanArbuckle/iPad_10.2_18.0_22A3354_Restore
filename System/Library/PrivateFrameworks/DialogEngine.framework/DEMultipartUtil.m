@implementation DEMultipartUtil

+ (id)getBoundary
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("--975D9D6D-0ADA-49B8-9005-D58E1A618FCD"), CFSTR("\r\n"), CFSTR("Content-Type: application/octet-stream"), CFSTR("\r\n"), CFSTR("\r\n"));
}

+ (id)getBoundaryData
{
  void *v2;
  void *v3;

  +[DEMultipartUtil getBoundary](DEMultipartUtil, "getBoundary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getPartEndData
{
  return (id)objc_msgSend(CFSTR("\r\n"), "dataUsingEncoding:", 4);
}

+ (id)getMessageEnd
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("--975D9D6D-0ADA-49B8-9005-D58E1A618FCD"), CFSTR("--"), CFSTR("\r\n"));
}

+ (id)getMessageEndData
{
  void *v2;
  void *v3;

  +[DEMultipartUtil getMessageEnd](DEMultipartUtil, "getMessageEnd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
