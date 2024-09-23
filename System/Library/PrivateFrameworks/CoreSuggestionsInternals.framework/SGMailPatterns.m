@implementation SGMailPatterns

+ (id)replyAttributionPattern
{
  void *v2;
  void *v3;

  patterns_21107();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("ReplyAttribution/F"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)headerPattern:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  patterns_21107();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Header"), "stringByAppendingString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regex2ForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)headerPattern
{
  void *v2;
  void *v3;

  patterns_21107();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("Header"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)headersPattern
{
  void *v2;
  void *v3;

  patterns_21107();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("Headers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)quotedRegionStartPattern
{
  void *v2;
  void *v3;

  patterns_21107();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("QuotedRegionStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)messageSeparatorPattern
{
  void *v2;
  void *v3;

  patterns_21107();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("Separator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
