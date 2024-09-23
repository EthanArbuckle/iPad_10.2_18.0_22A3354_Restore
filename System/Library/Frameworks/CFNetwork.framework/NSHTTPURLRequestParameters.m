@implementation NSHTTPURLRequestParameters

- (NSHTTPURLRequestParameters)init
{
  NSHTTPURLRequestParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLRequestParameters;
  result = -[NSHTTPURLRequestParameters init](&v3, sel_init);
  if (result)
    result->shouldHandleCookies = 1;
  return result;
}

- (NSHTTPURLRequestParameters)initWithCoder:(id)a3
{
  NSHTTPURLRequestParameters *v4;
  char v6;
  int v7;
  int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSHTTPURLRequestParameters;
  v4 = -[NSHTTPURLRequestParameters init](&v9, sel_init);
  if (v4)
  {
    v8 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v8, 4);
    if (v8 >= 2)
    {
      v4->method = (NSString *)(id)objc_msgSend(a3, "decodeObject");
      v4->fields = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObject");
      v4->extraCookies = (NSArray *)(id)objc_msgSend(a3, "decodeObject");
      v4->data = (NSData *)(id)objc_msgSend(a3, "decodeObject");
      v7 = 0;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v7, 4);
      v4->pageNotFoundCacheLifetime = v7;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", &v4->shouldHandleCookies, 1);
      if (v8 == 3)
      {
        v6 = 0;
        objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", &v6, 1);
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLRequestParameters;
  -[NSHTTPURLRequestParameters dealloc](&v3, sel_dealloc);
}

@end
