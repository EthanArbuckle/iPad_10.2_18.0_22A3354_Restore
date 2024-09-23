@implementation NSURLQueryItem(GEOMapURLParser)

- (id)_geo_unescapedValue
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
