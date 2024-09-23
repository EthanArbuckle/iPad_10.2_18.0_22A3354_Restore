@implementation _WKVisitedLinkStore

- (_WKVisitedLinkStore)init
{
  _WKVisitedLinkStore *v2;
  _WKVisitedLinkStore *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKVisitedLinkStore;
  v2 = -[_WKVisitedLinkStore init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *((_QWORD *)WebKit::VisitedLinkStore::VisitedLinkStore((WebKit::VisitedLinkStore *)-[_WKVisitedLinkStore _apiObject](v2, "_apiObject"))+ 1) = v2;
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_visitedLinkStore;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::VisitedLinkStore::~VisitedLinkStore((WebKit::VisitedLinkStore *)&self->_visitedLinkStore);
    v4.receiver = self;
    v4.super_class = (Class)_WKVisitedLinkStore;
    -[_WKVisitedLinkStore dealloc](&v4, sel_dealloc);
  }
}

- (void)addVisitedLinkWithURL:(id)a3
{
  const WTF::String *v4;
  WTF::StringImpl *v5;
  int v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  MEMORY[0x19AEABCC8](&v8, objc_msgSend(a3, "absoluteString"));
  v6 = WebCore::computeSharedStringHash((WebCore *)&v8, v4);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
  WebKit::SharedStringHashStore::scheduleAddition((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v6);
}

- (void)addVisitedLinkWithString:(id)a3
{
  const WTF::String *v4;
  int v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  MEMORY[0x19AEABCC8](&v8, a3);
  v5 = WebCore::computeSharedStringHash((WebCore *)&v8, v4);
  WebKit::SharedStringHashStore::scheduleAddition((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v5);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)removeAll
{
  WebKit::VisitedLinkStore::removeAll((WebKit::VisitedLinkStore *)&self->_visitedLinkStore);
}

- (BOOL)containsVisitedLinkWithURL:(id)a3
{
  const WTF::String *v4;
  WTF::StringImpl *v5;
  unsigned int v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, objc_msgSend(a3, "absoluteString"));
  v6 = WebCore::computeSharedStringHash((WebCore *)&v9, v4);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
  return WebKit::SharedStringHashStore::contains((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v6);
}

- (void)removeVisitedLinkWithURL:(id)a3
{
  const WTF::String *v4;
  WTF::StringImpl *v5;
  int v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  MEMORY[0x19AEABCC8](&v8, objc_msgSend(a3, "absoluteString"));
  v6 = WebCore::computeSharedStringHash((WebCore *)&v8, v4);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
  WebKit::SharedStringHashStore::scheduleRemoval((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v6);
}

@end
