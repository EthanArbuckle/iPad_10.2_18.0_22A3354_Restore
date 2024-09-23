@implementation NSString(Normalization)

- (const)getUnicodeNormalization
{
  id v1;
  const char *v2;
  id v3;
  int v4;
  id v5;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;

  v1 = objc_retainAutorelease(a1);
  v2 = (const char *)objc_msgSend(v1, "UTF8String");
  objc_msgSend(v1, "decomposedStringWithCanonicalMapping");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = strcmp(v2, (const char *)objc_msgSend(v3, "UTF8String"));

  if (!v4)
    return CFSTR("D");
  objc_msgSend(v1, "precomposedStringWithCanonicalMapping");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = strcmp(v2, (const char *)objc_msgSend(v5, "UTF8String"));

  if (!v6)
    return CFSTR("C");
  objc_msgSend(v1, "decomposedStringWithCompatibilityMapping");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = strcmp(v2, (const char *)objc_msgSend(v7, "UTF8String"));

  if (!v8)
    return CFSTR("KD");
  objc_msgSend(v1, "precomposedStringWithCompatibilityMapping");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = strcmp(v2, (const char *)objc_msgSend(v9, "UTF8String"));

  if (v10)
    return CFSTR("(undefined)");
  else
    return CFSTR("KC");
}

@end
