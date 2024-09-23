@implementation NSHTTPCookieInternal

- (NSHTTPCookieInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieInternal;
  return -[NSHTTPCookieInternal init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  BOOL result;
  uint64_t v7;

  v4 = -[NSHTTPCookieInternal _inner](self, "_inner");
  v5 = objc_msgSend(a3, "_inner");
  if (!(v4 | v5))
    return 1;
  v7 = v5;
  result = 0;
  if (v4)
  {
    if (v7)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  }
  return result;
}

@end
