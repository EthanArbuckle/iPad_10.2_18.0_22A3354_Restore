@implementation WKSecurityOrigin

- (id)safari_userVisibleName
{
  unsigned __int16 v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  if (a1)
  {
    v2 = objc_msgSend(a1, "port");
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "protocol");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_webkit_decodeHostName");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v2)
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@:%d"), v4, v6, v2);
    else
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@"), v4, v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
