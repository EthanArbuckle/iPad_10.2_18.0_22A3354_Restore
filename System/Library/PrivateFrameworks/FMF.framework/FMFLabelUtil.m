@implementation FMFLabelUtil

+ (id)defaultLabelKeys
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_defaultLabelKeys;
  if (!_defaultLabelKeys)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("_$!<home>!$_"), CFSTR("_$!<work>!$_"), CFSTR("_$!<school>!$_"), CFSTR("_$!<gym>!$_"), 0);
    v4 = (void *)_defaultLabelKeys;
    _defaultLabelKeys = v3;

    v2 = (void *)_defaultLabelKeys;
  }
  return v2;
}

+ (BOOL)isDefaultLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "defaultLabelKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

@end
