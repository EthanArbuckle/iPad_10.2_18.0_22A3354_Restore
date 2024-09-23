@implementation NSString(ImageCaptureCoreAdditions)

+ (id)stringFromOSType:()ImageCaptureCoreAdditions
{
  void *v3;
  void *v4;
  unsigned int v6;

  if (!a3)
    return 0;
  v6 = bswap32(a3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v6, 4);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 30);

  return v4;
}

- (id)asciiString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 0, 128);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    v7 = CFSTR("{empty}");
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x13)
  {
    objc_msgSend(v5, "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v5 = v6;
LABEL_5:

    v5 = (void *)v7;
  }
  return v5;
}

@end
