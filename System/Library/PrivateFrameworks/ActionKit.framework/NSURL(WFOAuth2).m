@implementation NSURL(WFOAuth2)

- (id)wfo_URLByAppendingQueryItems:()WFOAuth2
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "queryItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setQueryItems:", v8);

    }
    else
    {
      objc_msgSend(v5, "setQueryItems:", v4);
    }

    objc_msgSend(v5, "URL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a1;
  }

  return v9;
}

- (id)wfo_normalizedURLComponents
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(a1, "absoluteURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsWithURL:resolvingAgainstBaseURL:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setQuery:", 0);
  objc_msgSend(v3, "setFragment:", 0);
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("/"));

  if (v5)
  {
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v7, "length") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPath:", v8);

  }
  return v3;
}

- (uint64_t)wfo_isEqualToRedirectURI:()WFOAuth2
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(a1, "wfo_normalizedURLComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfo_normalizedURLComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

@end
