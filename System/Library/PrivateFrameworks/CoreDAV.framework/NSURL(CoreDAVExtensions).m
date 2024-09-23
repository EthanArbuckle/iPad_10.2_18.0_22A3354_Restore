@implementation NSURL(CoreDAVExtensions)

+ (id)CDVURLWithScheme:()CoreDAVExtensions user:password:host:port:path:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCDVScheme:user:password:host:port:path:query:fragment:", v18, v17, v16, v15, v14, v13, 0, 0);

  return v19;
}

+ (id)CDVURLWithScheme:()CoreDAVExtensions host:port:path:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCDVScheme:user:password:host:port:path:query:fragment:", v12, 0, 0, v11, v10, v9, 0, 0);

  return v13;
}

- (id)CDVURLWithScheme:()CoreDAVExtensions userandpass:host:port:path:parameters:encodePercents:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v15);
  objc_msgSend(v21, "appendString:", CFSTR("://"));
  objc_msgSend(v21, "appendString:", v16);
  if (a9)
  {
    objc_msgSend(v17, "CDVStringByAddingPercentEscapesForHREF");
    v22 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v22;
  }
  objc_msgSend(v21, "appendString:", v17);
  if (v18)
    objc_msgSend(v21, "appendString:", v18);
  if (v19)
  {
    if (a9)
      objc_msgSend(v19, "CDVStringByAddingPercentEscapesForHREFIncludingPercent");
    else
      objc_msgSend(v19, "CDVStringByAddingPercentEscapesForHREF");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendString:", v23);

  }
  objc_msgSend(v21, "appendString:", v20);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24 || (a9 & 1) != 0)
  {
    v26 = v24;
  }
  else
  {
    LOBYTE(v29) = 1;
    objc_msgSend(a1, "CDVURLWithScheme:userandpass:host:port:path:parameters:encodePercents:", v15, v16, v17, v18, v19, v20, v29);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;

  return v27;
}

- (uint64_t)initWithCDVScheme:()CoreDAVExtensions user:password:host:port:path:parameterString:query:fragment:
{
  return objc_msgSend(a1, "initWithCDVScheme:user:password:host:port:path:query:fragment:");
}

- (uint64_t)initWithCDVScheme:()CoreDAVExtensions user:password:host:port:path:query:fragment:
{
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;

  v16 = a3;
  v48 = a4;
  v17 = a5;
  v18 = v16;
  v47 = v17;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v46 = a9;
  v22 = a10;
  if (!v18 || (v23 = v22, !objc_msgSend(v18, "length")))
  {
    v38 = (void *)MEMORY[0x24BDBCE88];
    v39 = *MEMORY[0x24BDBCAB8];
    v40 = CFSTR("The value for 'scheme' should be non-nil and non-empty");
    goto LABEL_26;
  }
  v45 = v23;
  if (!v19 || !objc_msgSend(v19, "length"))
  {
    v38 = (void *)MEMORY[0x24BDBCE88];
    v39 = *MEMORY[0x24BDBCAB8];
    v40 = CFSTR("The value for 'host' should be non-nil and non-empty");
LABEL_26:
    objc_msgSend(v38, "exceptionWithName:reason:userInfo:", v39, v40, 0);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v41);
  }
  v43 = v18;
  v44 = v21;
  if (v20)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", 0);
    if (objc_msgSend(v20, "compare:", v24) == -1)
    {
      v25 = a1;
      v28 = 0;
    }
    else
    {
      v25 = a1;
      objc_msgSend((id)objc_opt_class(), "CDVDefaultPortForScheme:", v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 && (v27 = objc_msgSend(v20, "unsignedLongValue"), v27 == objc_msgSend(v26, "unsignedLongValue")))
        v28 = 0;
      else
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(":%lu"), objc_msgSend(v20, "unsignedLongValue"));

    }
  }
  else
  {
    v25 = a1;
    v28 = 0;
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", &stru_24C1DBD70);
  if (v48)
  {
    objc_msgSend(v48, "CDVStringByAddingPercentEscapesForUserOrPassword");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "appendString:", v30);

    if (v47)
    {
      objc_msgSend(v29, "appendString:", CFSTR(":"));
      objc_msgSend(v47, "CDVStringByAddingPercentEscapesForUserOrPassword");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "appendString:", v31);

    }
    objc_msgSend(v29, "appendString:", CFSTR("@"));
  }
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", &stru_24C1DBD70);
  v33 = v32;
  if (v46)
  {
    objc_msgSend(v32, "appendString:", CFSTR("?"));
    objc_msgSend(v33, "appendString:", v46);
  }
  if (v45)
  {
    objc_msgSend(v33, "appendString:", CFSTR("#"));
    objc_msgSend(v33, "appendString:", v45);
  }
  LOBYTE(v42) = 0;
  objc_msgSend(v25, "CDVURLWithScheme:userandpass:host:port:path:parameters:encodePercents:", v43, v29, v19, v28, v21, v33, v42);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "absoluteString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v25, "initWithString:", v35);

  return v36;
}

+ (id)CDVDefaultPortForScheme:()CoreDAVExtensions
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v4 = 443;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("ftp")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = 21;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v5;
}

- (id)CDVURLWithUser:()CoreDAVExtensions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(a1, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CDVPassword");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CDVRawPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fragment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithCDVScheme:user:password:host:port:path:query:fragment:", v6, v4, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (id)CDVURLWithPassword:()CoreDAVExtensions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(a1, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CDVRawPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fragment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithCDVScheme:user:password:host:port:path:query:fragment:", v6, v7, v4, v8, v9, v10, v11, v12);

  return v13;
}

- (id)CDVURLWithPath:()CoreDAVExtensions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(a1, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CDVPassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fragment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithCDVScheme:user:password:host:port:path:query:fragment:", v6, v7, v8, v9, v10, v4, v11, v12);

  return v13;
}

- (id)CDVPassword
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "password");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByRemovingPercentEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (CFStringRef)CDVRawPath
{
  return (id)CFURLCopyPath(a1);
}

- (id)CDVRawLastPathComponent
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "CDVRawPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("/"));
  objc_msgSend(a1, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && (objc_msgSend(v4, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (id)CDVRawLastPathComponentPreservingEscapes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "CDVRawPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)CDVURLByDeletingLastPathComponent
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;

  objc_msgSend(a1, "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4 > v6)
  {
    v7 = a1;

    v2 = v7;
  }
  return v2;
}

- (id)CDVServerURL
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "scheme");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(a1, "host"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_msgSend(a1, "port");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDBCF48];
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "host");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v5)
    {
      objc_msgSend(a1, "port");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@://%@:%@/"), v8, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@://%@/"), v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLWithString:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)CDVServerURLWithPath:()CoreDAVExtensions
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(a1, "CDVRawPath");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24C1DBD70;
  }
  objc_msgSend(a1, "port");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (v5 && v6)
  {
    if (v8)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@:%@%@"), v6, v5, v8, v7);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@%@"), v6, v5, v7, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (uint64_t)CDVIsEqualToURL:()CoreDAVExtensions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(a1, "isFileURL") && objc_msgSend(v4, "isFileURL"))
  {
    objc_msgSend(a1, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)CDVFileSystemSafePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("_"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("@"), CFSTR("_"), 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)CDVfixedURLByAppendingPathComponent:()CoreDAVExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CDVStringByAppendingSlashIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)CDVIsSafeRedirectForRequestURL:()CoreDAVExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hasPrefix:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
