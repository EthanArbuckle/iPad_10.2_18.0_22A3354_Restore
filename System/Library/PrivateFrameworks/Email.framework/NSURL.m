@implementation NSURL

void __52__NSURL_EMNSURLAdditions__em_mailToFromQueryItemKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)em_mailToFromQueryItemKey_mailToFromQueryItem;
  em_mailToFromQueryItemKey_mailToFromQueryItem = v0;

}

- (BOOL)_isValidMessageID:(_BOOL8)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
    a1 = (unint64_t)objc_msgSend(v3, "length") >= 3
      && objc_msgSend(v4, "characterAtIndex:", 0) == 60
      && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1) == 62;

  return a1;
}

- (id)_databaseID
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  if (a1
    && objc_msgSend(a1, "ef_hasScheme:", CFSTR("x-apple-mail"))
    && objc_msgSend(a1, "ef_hasHost:", CFSTR("message"))
    && (objc_msgSend(a1, "pathComponents"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        v3 >= 2)
    && (objc_msgSend(a1, "path"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(a1, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("/")))
    {
      objc_msgSend(v5, "substringFromIndex:", 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v7, "setNumberStyle:", 0);
    objc_msgSend(v7, "numberFromString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)_hasAccountScheme
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "ef_hasScheme:", CFSTR("as")) & 1) != 0
      || (objc_msgSend(v1, "ef_hasScheme:", CFSTR("ews")) & 1) != 0
      || (objc_msgSend(v1, "ef_hasScheme:", CFSTR("imap")) & 1) != 0
      || (objc_msgSend(v1, "ef_hasScheme:", CFSTR("local")) & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(v1, "ef_hasScheme:", CFSTR("pop"));
    }
  }
  return result;
}

@end
