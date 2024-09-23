@implementation NSDictionary

- (int64_t)compareCredentialDictionaryAscending:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", CFSTR("acct")));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("acct")));
  v7 = &stru_100008450;
  if (v5)
    v8 = (__CFString *)v5;
  else
    v8 = &stru_100008450;
  if (v6)
    v9 = (__CFString *)v6;
  else
    v9 = &stru_100008450;
  v10 = -[__CFString localizedCaseInsensitiveCompare:](v8, "localizedCaseInsensitiveCompare:", v9);
  if (!v10)
  {
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", CFSTR("srvr")));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("srvr")));
    if (!v11)
      v11 = &stru_100008450;
    if (v12)
      v7 = (__CFString *)v12;
    v10 = -[__CFString localizedCaseInsensitiveCompare:](v11, "localizedCaseInsensitiveCompare:", v7);

  }
  return (int64_t)v10;
}

@end
