@implementation WKNSString

- (id)_web_createTarget
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  void *v5;
  WTF::StringImpl *v6;

  -[WKObject _apiObject](self, "_apiObject");
  WTF::String::isolatedCopy();
  WTF::String::createCFString((WTF::String *)&v6);
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      WTF::StringImpl::destroy(v3, v2);
    else
      *(_DWORD *)v3 -= 2;
  }
  return v5;
}

- (Class)superclass
{
  return (Class)objc_msgSend(MEMORY[0x1E0CB3940], "superclass");
}

- (Class)class
{
  return (Class)objc_opt_class();
}

@end
