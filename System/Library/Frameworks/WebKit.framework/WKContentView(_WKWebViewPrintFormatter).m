@implementation WKContentView(_WKWebViewPrintFormatter)

- (uint64_t)_attributesForPrintFormatter:()_WKWebViewPrintFormatter
{
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned int *)(a2 + 12);
  **(_QWORD **)(a1 + 8) = v3;
  v4 = qword_1ECE715C8;
  if (os_log_type_enabled((os_log_t)qword_1ECE715C8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "Computed pages for printing on background thread. Page count = %zu", (uint8_t *)&v6, 0xCu);
  }
  return WTF::BinarySemaphore::signal(*(WTF::BinarySemaphore **)(a1 + 16));
}

- (_QWORD)_createImage:()_WKWebViewPrintFormatter printFormatter:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3506890;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)_createImage:()_WKWebViewPrintFormatter printFormatter:
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v7;
  void *v8;
  uint64_t result;
  CFTypeRef cf;
  WebCore::ShareableBitmap *v11;

  v4 = *(_QWORD *)(a1 + 24);
  if (!*(_BYTE *)(a1 + 8))
  {
    *(_QWORD *)(v4 + 4264) = 0;
    goto LABEL_12;
  }
  v5 = (unsigned __int8 *)(v4 + 4248);
  if (__ldaxr((unsigned __int8 *)(v4 + 4248)))
  {
    __clrex();
  }
  else if (!__stxr(1u, v5))
  {
    goto LABEL_7;
  }
  MEMORY[0x19AEABB3C](v5);
LABEL_7:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 24) + 4256), "removeObject:", *(_QWORD *)(a1 + 16));
  v7 = __ldxr(v5);
  if (v7 != 1)
  {
    __clrex();
    goto LABEL_11;
  }
  if (__stlxr(0, v5))
LABEL_11:
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
LABEL_12:
  if (!*(_BYTE *)(a2 + 64))
    return objc_msgSend(*(id *)(a1 + 16), "_setPrintPreviewImage:", 0);
  WebCore::ShareableBitmap::create();
  if (v11)
  {
    WebCore::ShareableBitmap::makeCGImageCopy(v11);
    objc_msgSend(*(id *)(a1 + 16), "_setPrintPreviewImage:", cf);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 16), "_setPrintPreviewImage:", 0);
  }
  result = (uint64_t)v11;
  if (v11)
    return WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v11, v8);
  return result;
}

- (_QWORD)_createPDF:()_WKWebViewPrintFormatter printFormatter:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E35068E0;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)_createPDF:()_WKWebViewPrintFormatter printFormatter:
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E35068E0;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (void)_createPDF:()_WKWebViewPrintFormatter printFormatter:
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v7;
  WebCore::SharedBuffer *v8;
  CGDataProvider *v9;
  void *v10;
  CGPDFDocumentRef v11;
  const __CFData *data;

  v4 = *(_QWORD *)(a1 + 24);
  if (!*(_BYTE *)(a1 + 8))
  {
    *(_QWORD *)(v4 + 4264) = 0;
    goto LABEL_12;
  }
  v5 = (unsigned __int8 *)(v4 + 4248);
  if (__ldaxr((unsigned __int8 *)(v4 + 4248)))
  {
    __clrex();
LABEL_6:
    MEMORY[0x19AEABB3C](v5);
    goto LABEL_7;
  }
  if (__stxr(1u, v5))
    goto LABEL_6;
LABEL_7:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 24) + 4256), "removeObject:", *(_QWORD *)(a1 + 16));
  v7 = __ldxr(v5);
  if (v7 == 1)
  {
    if (!__stlxr(0, v5))
      goto LABEL_12;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v5);
LABEL_12:
  v8 = *a2;
  if (*a2 && *((_QWORD *)v8 + 6))
  {
    WebCore::SharedBuffer::createCFData(v8);
    v9 = CGDataProviderCreateWithCFData(data);
    v10 = *(void **)(a1 + 16);
    v11 = CGPDFDocumentCreateWithProvider(v9);
    objc_msgSend(v10, "_setPrintedDocument:", v11);
    if (v11)
      CFRelease(v11);
    if (v9)
      CFRelease(v9);
    if (data)
      CFRelease(data);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 16), "_setPrintedDocument:", 0);
  }
}

@end
