@implementation NSKeyedUnarchiver(CPLCodingProxy)

- (uint64_t)_cplDecodeBoolForKey:()CPLCodingProxy
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "decodeBoolForKey:", v4);
    objc_msgSend(a1, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "__setError:", 0);
      v6 = objc_msgSend(a1, "decodeIntForKey:", v4) != 0;
    }
  }

  return v6;
}

- (uint64_t)_cplDecodeCharForKey:()CPLCodingProxy
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "decodeIntForKey:", v4);
    objc_msgSend(a1, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "__setError:", 0);
      LOBYTE(v6) = objc_msgSend(a1, "decodeBoolForKey:", v4);
    }
  }

  return (char)v6;
}

@end
