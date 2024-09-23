@implementation NSURL(MCExtensibleSingleSignOnPayloadExtensions)

- (id)normalizedURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setScheme:", v3);

  objc_msgSend(v1, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHost:", v5);

  objc_msgSend(v1, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
    objc_msgSend(v1, "setPath:", CFSTR("/"));
  objc_msgSend(v1, "setQuery:", 0);
  objc_msgSend(v1, "setFragment:", 0);
  objc_msgSend(v1, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
