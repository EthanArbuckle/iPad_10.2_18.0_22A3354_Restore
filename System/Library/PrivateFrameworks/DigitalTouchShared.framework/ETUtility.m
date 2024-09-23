@implementation ETUtility

+ (id)dateFormatWithMilliseconds:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = dateFormatterWithMilliseconds_createFormatterOnceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&dateFormatterWithMilliseconds_createFormatterOnceToken, &__block_literal_global_4);
  objc_msgSend((id)dateFormatterWithMilliseconds_dateFormatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)destinationFromMessageIdentifier:(id)a3 keepPrefix:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    if (v4)
    {
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ETUtility removePrefixFromDestination:](ETUtility, "removePrefixFromDestination:", v7);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = &stru_24F6E7BA8;
  }

  return v6;
}

+ (id)removePrefixFromDestination:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("mailto:"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    && (v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("tel:")), v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v5 + v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (BOOL)isRetailDemo
{
  return objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode");
}

+ (BOOL)shouldArchiveSentMessages
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.ET"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ETArchiveSentMessages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (int64_t)lastInteractiveZoomLevel
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.ET"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ETLastInteractiveZoomLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = 3;
  if (v5 < 3)
    v6 = v5;
  if (v6 <= 1)
    return 1;
  else
    return v6;
}

+ (id)imageWithEllipseDiameter:(double)a3 strokeWidth:(double)a4 strokeColor:(id)a5 fillDiameter:(double)a6 fillColor:(id)a7 edgeOverlap:(double)a8
{
  id v13;
  id v14;
  double v15;
  CGContext *CurrentContext;
  CGContext *v17;
  CGFloat v18;
  void *v19;
  CGSize v21;
  CGRect v22;
  CGRect v23;

  v13 = a5;
  v14 = a7;
  v15 = a3 + a8;
  v21.width = v15;
  v21.height = v15;
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v17 = CurrentContext;
  if (a4 != 0.0)
  {
    v18 = a8 * 0.5 + a4;
    CGContextSetLineWidth(CurrentContext, v18);
    CGContextSetStrokeColorWithColor(v17, (CGColorRef)objc_msgSend(objc_retainAutorelease(v13), "CGColor"));
    v22.origin.x = (v18 - a8) * 0.5;
    v22.size.width = v15 - v18;
    v22.origin.y = v22.origin.x;
    v22.size.height = v15 - v18;
    CGContextAddEllipseInRect(v17, v22);
    CGContextStrokePath(v17);
  }
  if (a6 != 0.0)
  {
    CGContextSetFillColorWithColor(v17, (CGColorRef)objc_msgSend(objc_retainAutorelease(v14), "CGColor"));
    v23.origin.x = (v15 - a8 - a6) * 0.5;
    v23.origin.y = v23.origin.x;
    v23.size.width = a6;
    v23.size.height = a6;
    CGContextAddEllipseInRect(v17, v23);
    CGContextFillPath(v17);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v19;
}

@end
