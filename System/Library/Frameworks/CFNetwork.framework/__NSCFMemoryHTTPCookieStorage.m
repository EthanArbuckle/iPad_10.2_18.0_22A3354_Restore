@implementation __NSCFMemoryHTTPCookieStorage

- (__NSCFMemoryHTTPCookieStorage)init
{
  _QWORD *v3;
  __NSCFMemoryHTTPCookieStorage *v4;
  objc_super v6;

  v3 = _CookieStorageCreateInMemory((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (OpaqueCFHTTPCookieStorage *)a2);
  v6.receiver = self;
  v6.super_class = (Class)__NSCFMemoryHTTPCookieStorage;
  v4 = -[NSHTTPCookieStorage _initWithCFHTTPCookieStorage:](&v6, sel__initWithCFHTTPCookieStorage_, v3);
  if (v3)
    CFRelease(v3);
  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSCFMemoryHTTPCookieStorage;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ephemeral %@"), -[NSHTTPCookieStorage description](&v3, sel_description));
}

@end
