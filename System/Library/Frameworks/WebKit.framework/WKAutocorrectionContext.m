@implementation WKAutocorrectionContext

+ (id)emptyAutocorrectionContext
{
  WTF::StringImpl *v2;
  void *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9[2];
  WTF::StringImpl *v10[2];
  __int128 v11;

  *(_OWORD *)v9 = 0u;
  *(_OWORD *)v10 = 0u;
  v11 = xmmword_1978CEF10;
  v3 = (void *)objc_msgSend(a1, "autocorrectionContextWithWebContext:", v9);
  v4 = v10[1];
  v10[1] = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  v5 = v10[0];
  v10[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v2);
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v9[1];
  v9[1] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v2);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v9[0];
  v9[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v2);
    else
      *(_DWORD *)v7 -= 2;
  }
  return v3;
}

+ (id)autocorrectionContextWithWebContext:(const void *)a3
{
  WKAutocorrectionContext *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = objc_alloc_init(WKAutocorrectionContext);
  if (*(_QWORD *)a3 && *(_DWORD *)(*(_QWORD *)a3 + 4))
    v5 = WTF::StringImpl::operator NSString *();
  else
    v5 = 0;
  -[UIWKAutocorrectionContext setContextBeforeSelection:](v4, "setContextBeforeSelection:", v5);
  v6 = *((_QWORD *)a3 + 2);
  if (v6 && *(_DWORD *)(v6 + 4))
    v7 = WTF::StringImpl::operator NSString *();
  else
    v7 = 0;
  -[UIWKAutocorrectionContext setSelectedText:](v4, "setSelectedText:", v7);
  v8 = *((_QWORD *)a3 + 1);
  if (v8 && *(_DWORD *)(v8 + 4))
    v9 = WTF::StringImpl::operator NSString *();
  else
    v9 = 0;
  -[UIWKAutocorrectionContext setMarkedText:](v4, "setMarkedText:", v9);
  v10 = *((_QWORD *)a3 + 3);
  if (v10 && *(_DWORD *)(v10 + 4))
    v11 = WTF::StringImpl::operator NSString *();
  else
    v11 = 0;
  -[UIWKAutocorrectionContext setContextAfterSelection:](v4, "setContextAfterSelection:", v11);
  v12 = *((_QWORD *)a3 + 4);
  if (v12 == -1)
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v13 = *((_QWORD *)a3 + 4);
  if (v12 == -1)
    v14 = 0;
  else
    v14 = *((_QWORD *)a3 + 5);
  -[UIWKAutocorrectionContext setRangeInMarkedText:](v4, "setRangeInMarkedText:", v13, v14);
  return (id)(id)CFMakeCollectable(v4);
}

@end
