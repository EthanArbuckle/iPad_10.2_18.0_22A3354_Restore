@implementation NSString

void __50__NSString_BSObjCInterface__bsobjc_typeQualifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("rnNoORV"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;

}

+ (id)bsobjc_typeQualifiers
{
  objc_opt_self();
  if (qword_1ECD39890 != -1)
    dispatch_once(&qword_1ECD39890, &__block_literal_global_11);
  return (id)_MergedGlobals_13;
}

- (id)bsobjc_structName
{
  id v1;
  void *v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v9;
  id v10;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "hasPrefix:", CFSTR("{")) & 1) == 0
      && !objc_msgSend(v2, "scanUpToString:intoString:", CFSTR("{"), 0))
    {
      v1 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v2, "scanString:intoString:", CFSTR("{"), 0);
    v10 = 0;
    v3 = objc_msgSend(v2, "scanUpToString:intoString:", CFSTR("="), &v10);
    v4 = v10;
    v5 = v4;
    if (v3)
    {
      v6 = objc_msgSend(v4, "copy");
    }
    else
    {
      v9 = v4;
      v7 = objc_msgSend(v2, "scanUpToString:intoString:", CFSTR("}"), &v9);
      v1 = v9;

      if (!v7)
      {
LABEL_10:

        return v1;
      }
      v6 = objc_msgSend(v1, "copy");
      v5 = v1;
    }
    v1 = (id)v6;

    goto LABEL_10;
  }
  return v1;
}

@end
