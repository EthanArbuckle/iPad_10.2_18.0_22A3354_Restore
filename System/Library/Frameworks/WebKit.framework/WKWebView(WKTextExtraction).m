@implementation WKWebView(WKTextExtraction)

- (void)_requestTextExtractionForSwift:
{
  const void *v2;

  v2 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v2)
    CFRelease(v2);
}

- (uint64_t)_requestTextExtractionForSwift:
{
  return objc_msgSend(*(id *)(a1 + 32), "fulfill:", a2);
}

- (uint64_t)_requestTextExtraction:()WKTextExtraction completionHandler:
{
  id WeakRetained;
  _QWORD *v5;
  CFTypeRef v6;
  _QWORD *v8;
  CFTypeRef cf;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = &off_1E34BDAA0;
  v5[1] = WeakRetained;
  v8 = v5;
  if (*(_DWORD *)(a2 + 80) || *(_BYTE *)a2)
    cf = 0;
  else
    WebKit::createItemRecursive(a2, &v8);
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  return (*(uint64_t (**)(_QWORD *))(*v5 + 8))(v5);
}

@end
