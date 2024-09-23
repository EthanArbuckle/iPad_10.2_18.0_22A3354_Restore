@implementation BCOAuth2RequestFactory

+ (id)makeRequestObjectWithDictionary:(id)a3 version:(int64_t)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;

  v5 = a3;
  v6 = off_24E064790;
  if (a4 <= 1)
    v6 = off_24E064760;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "_initWithDictionary:", v5);

  return v7;
}

@end
