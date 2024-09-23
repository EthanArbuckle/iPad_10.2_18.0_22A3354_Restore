@implementation CalDAVUtils

+ (id)dropBoxLocationForUID:(id)a3 dropBoxPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  +[CalDAVUtils stringFromUIDWithPathSafeCharacters:](CalDAVUtils, "stringFromUIDWithPathSafeCharacters:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.dropbox"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendSlashIfNeeded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)stringFromUIDWithPathSafeCharacters:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("http://")))
    {
      objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("http://"), &stru_24C1FD208);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("https://")))
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("https://"), &stru_24C1FD208);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
    if (v6)
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_24C1FD208);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    objc_msgSend(v4, "rangeOfString:", CFSTR("/"));
    if (v8)
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
    objc_msgSend(v4, "rangeOfString:", CFSTR("."));
    if (v10)
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_24C1FD208);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
  }
  if (objc_msgSend(v4, "length"))
    v12 = v4;
  else
    v12 = CFSTR("attachment-directory-for-events-with-malformed-uri");

  return v12;
}

+ (id)headersFromHeaders:(id)a3 replacingPreconditionsWithScheduleTag:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x24BE1AA90]);
    objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x24BE1AA88]);
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("If-Schedule-Tag-Match"));

  }
  return v8;
}

@end
