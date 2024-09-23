@implementation ICUtilities

+ (BOOL)isInternalInstall
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");

  return os_variant_has_internal_content();
}

+ (BOOL)isInternetReachable
{
  void *v2;
  uint64_t v3;

  +[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentReachabilityStatus");

  return v3 != 0;
}

+ (_NSRange)range:(_NSRange)a3 liesWithinRange:(_NSRange)a4 assert:(BOOL)a5
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  NSRange v18;
  _NSRange result;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a4.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  v6 = a5;
  length = a4.length;
  location = a4.location;
  v9 = a3.length;
  v10 = a3.location;
  v11 = NSIntersectionRange(a3, a4);
  if (v9)
  {
    if (v10 == v11.location && v9 == v11.length)
      goto LABEL_25;
  }
  else if (v10 >= location && v10 - location < length)
  {
    v9 = 0;
    goto LABEL_25;
  }
  if (v6)
  {
    v17.location = v10;
    v17.length = v9;
    NSStringFromRange(v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18.location = location;
    v18.length = length;
    NSStringFromRange(v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICUtilities range:liesWithinRange:assert:]", 1, 0, CFSTR("range %@ doesn't lie within range %@"), v12, v13);

  }
  if (v11.length)
    v14 = v11.location;
  else
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
    v10 = v14;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
    v9 = v11.length;
  else
    v9 = 0;
LABEL_25:
  v15 = v10;
  v16 = v9;
  result.length = v16;
  result.location = v15;
  return result;
}

+ (BOOL)isSeedInstall
{
  return 0;
}

@end
