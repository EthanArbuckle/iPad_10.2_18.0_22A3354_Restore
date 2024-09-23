@implementation MFExchangeConnection

- (id)_fetchArgumentForMessageUidsAndFlags
{
  return CFSTR("(UID FLAGS BODY.PEEK[HEADER.FIELDS (content-class)])");
}

- (id)_fetchArgumentForMessageSkeletonsWithAllHeaders
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFExchangeConnection;
  -[MFIMAPConnection _fetchArgumentForMessageSkeletonsWithAllHeaders](&v9, sel__fetchArgumentForMessageSkeletonsWithAllHeaders);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "length");
    v5 = v4 - 3;
    if (v4 >= 3)
    {
      objc_msgSend(v3, "substringFromIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(CFSTR(")])"), "isEqualToString:", v6))
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v7;
        objc_msgSend(v7, "insertString:atIndex:", CFSTR(" content-class"), v5);
      }

    }
  }
  return v3;
}

- (BOOL)_isFetchResponseValid:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(a3, "fetchResultWithType:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithData:", v4);
  objc_msgSend(v5, "mf_convertNetworkLineEndingsToUnix");
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46110]), "initWithHeaderData:encoding:", v6, 1);
  objc_msgSend(v7, "firstHeaderForKey:", CFSTR("content-class"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isEqualToString:", CFSTR("urn:content-classes:message")) & 1) == 0)
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("urn:content-classes:appointment"));
  else
    v10 = 1;

  return v10;
}

@end
