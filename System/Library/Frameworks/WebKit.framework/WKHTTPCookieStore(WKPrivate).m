@implementation WKHTTPCookieStore(WKPrivate)

- (uint64_t)_getCookiesForURL:()WKPrivate completionHandler:
{
  uint64_t v2;
  CFTypeRef v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = coreCookiesToNSCookies(a2);
  return (*(uint64_t (**)(uint64_t, CFTypeRef))(v2 + 16))(v2, v3);
}

- (uint64_t)_setCookieAcceptPolicy:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_flushCookiesToDiskWithCompletionHandler:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
