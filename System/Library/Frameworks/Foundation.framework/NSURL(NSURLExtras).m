@implementation NSURL(NSURLExtras)

+ (uint64_t)_web_URLWithString:()NSURLExtras relativeToURL:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "_URLWithDataAsString:relativeToURL:");
}

+ (id)_web_URLWithComponents:()NSURLExtras
{
  int v4;
  id result;

  if (!*(_QWORD *)a3
    && !*(_QWORD *)(a3 + 8)
    && !*(_QWORD *)(a3 + 16)
    && !*(_QWORD *)(a3 + 24)
    && *(_QWORD *)(a3 + 32) == -1
    && !*(_QWORD *)(a3 + 40)
    && !*(_QWORD *)(a3 + 48)
    && !*(_QWORD *)(a3 + 56))
  {
    return 0;
  }
  if (objc_msgSend(*(id *)(a3 + 40), "length"))
  {
    v4 = objc_msgSend(*(id *)(a3 + 40), "characterAtIndex:", 0);
    result = 0;
    if (v4 != 47)
      return result;
    if (objc_msgSend(*(id *)(a3 + 40), "length") != 1)
      objc_msgSend(*(id *)(a3 + 40), "componentsSeparatedByString:", CFSTR("/"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", &stru_1E0F56070);
  }
  return (id)_CFURLCreateFromComponents();
}

- (double)_web_URLComponents
{
  double v1;
  _QWORD *v2;
  _QWORD *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  double result;

  *(_QWORD *)&v1 = MEMORY[0x1E0C80A78](a1).n128_u64[0];
  v3 = v2;
  v5 = objc_msgSend(v4, "absoluteURL", v1);
  if (!v5)
    goto LABEL_12;
  v6 = (void *)v5;
  if (_CFURLCopyComponents())
  {
    v7 = 0;
    v8 = 0;
    v14 = 0;
    v15 = 0;
    *v3 = v7;
    v3[1] = 0;
    v3[2] = 0;
    v3[3] = v8;
    v3[4] = 0;
    v3[5] = 0;
    v3[6] = v14;
    v3[7] = v15;
    return result;
  }
  if (((v9 = (void *)objc_msgSend(v6, "scheme"), (objc_msgSend(v9, "isEqualToString:", CFSTR("http")) & 1) != 0)
     || (objc_msgSend(v9, "isEqualToString:", CFSTR("https")) & 1) != 0
     || (objc_msgSend(v9, "isEqualToString:", CFSTR("file")) & 1) != 0
     || objc_msgSend(v9, "isEqualToString:", CFSTR("ftp")))
    && ((v10 = (void *)objc_msgSend(v6, "absoluteString"),
         v11 = objc_msgSend(v9, "length"),
         v12 = objc_msgSend(v10, "length"),
         v12 > v11)
     && objc_msgSend(v10, "characterAtIndex:", v11) != 47
     || v12 >= v11 + 2 && (++v11, objc_msgSend(v10, "characterAtIndex:", v11) != 47)))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithString:relativeToURL:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@"), v9, objc_msgSend((id)objc_msgSend(v6, "absoluteString"), "substringFromIndex:", v11), 0), 0);
    if (v13)
    {
      objc_msgSend(v13, "_web_URLComponents");
    }
    else
    {
      result = 0.0;
      *((_OWORD *)v3 + 2) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *(_OWORD *)v3 = 0u;
      *((_OWORD *)v3 + 1) = 0u;
    }
  }
  else
  {
LABEL_12:
    result = 0.0;
    *(_OWORD *)v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    v3[4] = -1;
    v3[5] = 0;
    v3[6] = 0;
    v3[7] = 0;
  }
  return result;
}

- (uint64_t)_web_scriptIfJavaScriptURL
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "absoluteString");
  if (objc_msgSend(v1, "_web_hasCaseInsensitivePrefix:", CFSTR("javascript:")))
    return objc_msgSend((id)objc_msgSend(v1, "substringFromIndex:", 11), "_web_stringByReplacingValidPercentEscapes_nowarn");
  else
    return 0;
}

- (uint64_t)_web_suggestedFilenameWithMIMEType:()NSURLExtras
{
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "path"), "lastPathComponent");
  v6 = (void *)objc_msgSend(v5, "_web_filenameByFixingIllegalCharacters");
  if (objc_msgSend(v6, "length") && !objc_msgSend(v5, "isEqualToString:", CFSTR("/")))
  {
    v7 = (void *)objc_msgSend(v6, "pathExtension");
    if (!a3)
      return (uint64_t)v6;
  }
  else
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "_hostString"), "_web_filenameByFixingIllegalCharacters");
    if (!objc_msgSend(v6, "length"))
      v6 = (void *)NSURLLocalizedString("unknown");
    v7 = 0;
    if (!a3)
      return (uint64_t)v6;
  }
  if (((objc_msgSend(a3, "isEqualToString:", CFSTR("application/tar")) & 1) != 0
     || objc_msgSend(a3, "isEqualToString:", CFSTR("application/x-tar")))
    && (objc_msgSend(v6, "rangeOfString:options:", CFSTR(".tar"), 1) != 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v6, "rangeOfString:options:", CFSTR(".tgz"), 13) != 0x7FFFFFFFFFFFFFFFLL))
  {
    return (uint64_t)v6;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("application/octet-stream")) & 1) != 0)
    return (uint64_t)v6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("text/plain")) & 1) != 0)
    return (uint64_t)v6;
  v9 = +[NSURLFileTypeMappings sharedMappings](NSURLFileTypeMappings, "sharedMappings");
  v10 = (void *)objc_msgSend(v9, "extensionsForMIMEType:", a3);
  if (objc_msgSend(v7, "length"))
  {
    if (!v10 || (objc_msgSend(v10, "containsObject:", v7) & 1) != 0)
      return (uint64_t)v6;
  }
  v11 = (void *)objc_msgSend(v9, "preferredExtensionForMIMEType:", a3);
  if (!objc_msgSend(v11, "length"))
    return (uint64_t)v6;
  return objc_msgSend(v6, "stringByAppendingPathExtension:", v11);
}

- (uint64_t)_web_isJavaScriptURL
{
  return objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "_web_isJavaScriptURL");
}

@end
