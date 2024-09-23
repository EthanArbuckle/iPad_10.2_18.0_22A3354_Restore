@implementation CalSubscribedCalendarAccountUtils

+ (id)hostStringFromURL:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "rangeOfHost");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      v6 = v4;
      objc_msgSend(v3, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringFromIndex:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)hostStringFromURLString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "hostStringFromURL:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
