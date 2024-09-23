@implementation NSString(HTMLEncoding)

- (id)_navigation_stringByEscapingHTML
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("&quot;"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("&#39;"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<"), CFSTR("&lt;"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(">"), CFSTR("&gt;"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("—"), CFSTR("&mdash;"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_navigation_stringByReplacingNewLinesWithString:()HTMLEncoding
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_navigation_sanitizedStringForDisplayInHTML
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_navigation_stringByEscapingHTML");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_navigation_stringByReplacingNewLinesWithString:", CFSTR("<br>"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
