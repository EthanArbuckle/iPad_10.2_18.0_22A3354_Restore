@implementation TDAsset

- (void)setScaleFactor:(unsigned int)a3
{
  -[TDAsset willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("scaleFactor"));
  self->_scaleFactor = a3;
  -[TDAsset didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("scaleFactor"));
}

- (unsigned)scaleFactor
{
  unsigned int scaleFactor;

  -[TDAsset willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("scaleFactor"));
  scaleFactor = self->_scaleFactor;
  -[TDAsset didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("scaleFactor"));
  return scaleFactor;
}

- (id)_sourceRelativePathComponents
{
  void *v3;
  void *v4;

  v3 = (void *)-[TDAsset name](self, "name");
  v4 = (void *)-[TDAsset category](self, "category");
  if (objc_msgSend(v4, "length"))
    return (id)objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  else
    return v3;
}

- (id)sourceRelativePath
{
  id v3;
  void *v4;

  v3 = -[TDAsset _sourceRelativePathComponents](self, "_sourceRelativePathComponents");
  v4 = (void *)objc_msgSend((id)-[TDAsset source](self, "source"), "path");
  if (objc_msgSend(v4, "length"))
    return (id)objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  else
    return v3;
}

- (id)fileURLWithDocument:(id)a3
{
  id v5;
  void *v6;

  v5 = -[TDAsset _sourceRelativePathComponents](self, "_sourceRelativePathComponents");
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)-[TDAsset source](self, "source"), "fileURLWithDocument:", a3), "path");
  if (objc_msgSend(v6, "length"))
    v5 = (id)objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  if (v5)
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 0);
  else
    return 0;
}

- (BOOL)hasProduction
{
  NSLog(CFSTR("Calling hasProduction on abstract TDAsset entity"), a2);
  return 0;
}

+ (id)_filenameRegex
{
  if (_filenameRegex_onceToken != -1)
    dispatch_once(&_filenameRegex_onceToken, &__block_literal_global_0);
  return (id)_filenameRegex_sFilenameRegex;
}

uint64_t __25__TDAsset__filenameRegex__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("(Template)?((-568h)|(-163r))?(@[[:digit:]]+x)?(~[[:alnum:]]+)?.(\\w+)$"), 1, 0);
  _filenameRegex_sFilenameRegex = result;
  return result;
}

- (NSString)baseName
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", -[TDAsset name](self, "name"), 0, 0, objc_msgSend((id)-[TDAsset name](self, "name"), "length"));
  if (objc_msgSend(v3, "count")
    && (v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "rangeAtIndex:", 0), v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return (NSString *)objc_msgSend((id)-[TDAsset name](self, "name"), "substringToIndex:", v4);
  }
  else
  {
    return 0;
  }
}

+ (unsigned)scaleFactorFromImageFilename:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a3, "length"))
    v4 = (void *)objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  else
    v4 = 0;
  if (objc_msgSend(v4, "count")
    && (v5 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", 0), "rangeAtIndex:", 5), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", v5 + 1, v6 - 2), "intValue");
  }
  else
  {
    return 1;
  }
}

+ (BOOL)isTemplateFromImageFilename:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  v4 = objc_msgSend(v3, "count");
  if (v4)
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "rangeAtIndex:", 1) != 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

+ (int64_t)idiomFromImageFilename:(id)a3
{
  void *v4;
  int64_t result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = (void *)objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  result = objc_msgSend(v4, "count");
  if (result)
  {
    v6 = (void *)objc_msgSend(v4, "objectAtIndex:", 0);
    v7 = objc_msgSend(v6, "rangeAtIndex:", 6);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v6, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL)
        return 0;
      if (objc_msgSend(v6, "rangeAtIndex:", 3) == 0x7FFFFFFFFFFFFFFFLL)
        return 2;
      else
        return 1;
    }
    else
    {
      v9 = (void *)objc_msgSend(a3, "substringWithRange:", v7, v8);
      if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("~ipad")))
      {
        if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("~iphone")))
        {
          if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("~appletv")))
          {
            if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("~stark")))
            {
              if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("~watch")))
                return 0;
              return 5;
            }
            else
            {
              return 4;
            }
          }
          else
          {
            return 3;
          }
        }
        else
        {
          return 1;
        }
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

+ (int64_t)subtypeFromImageFilename:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  if (!objc_msgSend(v3, "count"))
    return 0;
  v4 = (void *)objc_msgSend(v3, "objectAtIndex:", 0);
  if (objc_msgSend(v4, "rangeAtIndex:", 3) != 0x7FFFFFFFFFFFFFFFLL)
    return 568;
  if (objc_msgSend(v4, "rangeAtIndex:", 4) == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return 163;
}

@end
