@implementation WKAccessibilityWebPageObjectBase

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)setHasMainFramePlugin:(BOOL)a3
{
  self->m_hasMainFramePlugin = a3;
}

- (void)setWebPage:(NakedPtr<WebKit::WebPage>)a3
{
  uint64_t v4;
  uint64_t v5;

  self->m_page.m_ptr = *(WebPage **)a3.m_ptr;
  if (*(_QWORD *)a3.m_ptr)
  {
    self->m_pageID.m_identifier = *(_QWORD *)(*(_QWORD *)a3.m_ptr + 40);
    v4 = WebKit::WebPage::mainFrame(*(WebKit::WebPage **)a3.m_ptr);
    if (v4 && !*(_BYTE *)(v4 + 144))
    {
      v5 = *(_QWORD *)(v4 + 296);
      if (v5)
        LODWORD(v5) = (*(unsigned __int16 *)(v5 + 3358) >> 3) & 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
    self->m_hasMainFramePlugin = v5;
  }
  else
  {
    self->m_pageID.m_identifier = 0;
    self->m_hasMainFramePlugin = 0;
  }
}

- (NakedPtr<WebCore::AXObjectCache>)axObjectCache
{
  WebCore::Document **v2;
  WebCore::Document **v3;
  WebPage *m_ptr;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  WebCore::Document *v8;

  v3 = v2;
  m_ptr = self->m_page.m_ptr;
  if (m_ptr
    && (v5 = *((_QWORD *)m_ptr + 6)) != 0
    && ((v6 = *(_QWORD *)(v5 + 160)) != 0 ? (v7 = *(_BYTE *)(v6 + 144) == 0) : (v7 = 0),
        v7 || *(_BYTE *)(v6 + 144) && (v6 = *(_QWORD *)(v6 + 88)) != 0 && !*(_BYTE *)(v6 + 144)))
  {
    v8 = *(WebCore::Document **)(v6 + 296);
    if (v8)
      v8 = (WebCore::Document *)WebCore::Document::axObjectCache(v8);
  }
  else
  {
    v8 = 0;
  }
  *v3 = v8;
  return (NakedPtr<WebCore::AXObjectCache>)v8;
}

- (id)accessibilityPluginObject
{
  _QWORD *v2;
  _QWORD *v3;
  WKAccessibilityWebPageObjectBase *v5;
  _QWORD *v6;
  void *v7;

  v5 = self;
  v7 = 0;
  v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v2 = off_1E34D9190;
  v2[1] = &v7;
  v2[2] = &v5;
  v6 = v2;
  WTF::callOnMainRunLoopAndWait();
  v3 = v6;
  v6 = 0;
  if (v3)
    (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  return v7;
}

- (id)accessibilityRootObjectWrapper
{
  _QWORD *v2;
  _QWORD *v3;
  CFTypeRef v4;
  CFTypeRef v5;
  CFTypeRef v6;
  CFTypeRef v7;
  CFTypeRef v9;
  _QWORD *v10;
  CFTypeRef cf;

  v9 = self;
  if (self)
    CFRetain(self);
  cf = 0;
  v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v2 = off_1E34D91B8;
  v2[1] = &cf;
  v2[2] = &v9;
  v10 = v2;
  WTF::callOnMainThreadAndWait();
  v3 = v10;
  v10 = 0;
  if (v3)
    (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  v4 = cf;
  cf = 0;
  v5 = (id)CFMakeCollectable(v4);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  v7 = v9;
  v9 = 0;
  if (v7)
    CFRelease(v7);
  return (id)v5;
}

- (void)setRemoteFrameOffset:(IntPoint)a3
{
  self->m_remoteFrameOffset = a3;
}

- (IntPoint)accessibilityRemoteFrameOffset
{
  return self->m_remoteFrameOffset;
}

- (void)setRemoteParent:(id)a3
{
  WTF::RetainPtr<objc_object *>::operator=((const void **)&self->m_parent.m_ptr, a3);
}

- (id)accessibilityFocusedUIElement
{
  return (id)objc_msgSend(-[WKAccessibilityWebPageObjectBase accessibilityRootObjectWrapper](self, "accessibilityRootObjectWrapper"), "accessibilityFocusedUIElement");
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->m_parent.m_ptr;
  self->m_parent.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (uint64_t)accessibilityPluginObject
{
  if (*(_QWORD *)(**(_QWORD **)(result + 16) + 8))
    **(_QWORD **)(result + 8) = 0;
  return result;
}

- (void)accessibilityRootObjectWrapper
{
  uint64_t v2;
  unsigned __int8 v3;
  void *v4;
  const void *v5;
  uint64_t v6;
  const void **v7;
  const void *v8;
  WebCore::AXObjectCache *v9;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = atomic_load(MEMORY[0x1E0DCF730]);
  if ((v3 & 1) == 0)
    atomic_store(1u, MEMORY[0x1E0DCF730]);
  v4 = *(void **)v2;
  if (*(_BYTE *)(*(_QWORD *)v2 + 40))
  {
    v5 = (const void *)objc_msgSend(v4, "accessibilityPluginObject");
    if (!v5)
      goto LABEL_11;
    goto LABEL_5;
  }
  objc_msgSend(v4, "axObjectCache");
  if (v9 && (v6 = WebCore::AXObjectCache::rootObject(v9)) != 0)
  {
    v5 = *(const void **)(v6 + 24);
    if (v5)
LABEL_5:
      CFRetain(v5);
  }
  else
  {
    v5 = 0;
  }
LABEL_11:
  v7 = *(const void ***)(a1 + 8);
  v8 = *v7;
  *v7 = v5;
  if (v8)
    CFRelease(v8);
}

@end
