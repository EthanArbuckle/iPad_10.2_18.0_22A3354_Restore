@implementation ZN6WebKit21WebExtensionAPIAction7setIconERNS

__CFString *___ZN6WebKit21WebExtensionAPIAction7setIconERNS_8WebFrameEP12NSDictionaryON3WTF3RefINS_27WebExtensionCallbackHandlerENS5_12RawPtrTraitsIS7_EENS5_21DefaultRefDerefTraitsIS7_EEEEPU15__autoreleasingP8NSString_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v6;
  __CFString *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14[5];
  WTF::StringImpl *v15[5];
  WTF::StringImpl *v16;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("data:")) & 1) != 0)
    return (__CFString *)v4;
  WebKit::WebFrame::url(*(WebKit::WebFrame **)(a1 + 32), (uint64_t)v14);
  MEMORY[0x19AEABCC8](&v13, v4);
  MEMORY[0x19AEABB24](v15, v14, &v13, 0);
  WTF::URL::path((WTF::URL *)v15);
  if ((v6 & 0xFF00000000) != 0)
    WTF::String::String();
  else
    WTF::String::String();
  if (v16)
    v7 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v7 = &stru_1E351F1B8;

  v9 = v16;
  v16 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
  v10 = v15[0];
  v15[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v8);
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v14[0];
  v14[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v8);
    else
      *(_DWORD *)v12 -= 2;
  }
  return v7;
}

@end
