@implementation NSURL(WKExtras)

+ (uint64_t)_web_URLWithWTFString:()WKExtras
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10[5];
  WTF::StringImpl *v11;

  WTF::URL::URL((WTF::URL *)v10);
  MEMORY[0x19AEABB24](&v11, v10, a3, 0);
  v5 = v10[0];
  v10[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
  v7 = WTF::URL::operator NSURL *();
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  return v7;
}

@end
