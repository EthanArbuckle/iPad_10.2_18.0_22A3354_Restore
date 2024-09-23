@implementation WKFullKeyboardAccessWatcher

- (WKFullKeyboardAccessWatcher)init
{
  WKFullKeyboardAccessWatcher *v2;
  WKFullKeyboardAccessWatcher *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKFullKeyboardAccessWatcher;
  v2 = -[WKFullKeyboardAccessWatcher init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WKFullKeyboardAccessWatcher retrieveKeyboardUIModeFromPreferences:](v2, "retrieveKeyboardUIModeFromPreferences:", 0);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    if (*MEMORY[0x1E0DDE0B8])
      objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_retrieveKeyboardUIModeFromPreferences_, *MEMORY[0x1E0DDE0B8], 0);
  }
  return v3;
}

- (void)retrieveKeyboardUIModeFromPreferences:(id)a3
{
  int fullKeyboardAccessEnabled;
  int v5;

  fullKeyboardAccessEnabled = self->fullKeyboardAccessEnabled;
  v5 = _AXSFullKeyboardAccessEnabled() != 0;
  self->fullKeyboardAccessEnabled = v5;
  if (fullKeyboardAccessEnabled != v5)
    -[WKFullKeyboardAccessWatcher notifyAllProcessPools](self, "notifyAllProcessPools");
}

+ (BOOL)fullKeyboardAccessEnabled
{
  WKFullKeyboardAccessWatcher *v2;

  if (_MergedGlobals_133 == 1)
  {
    v2 = (WKFullKeyboardAccessWatcher *)qword_1EE341810;
  }
  else
  {
    v2 = objc_alloc_init(WKFullKeyboardAccessWatcher);
    qword_1EE341810 = (uint64_t)v2;
    _MergedGlobals_133 = 1;
  }
  return v2->fullKeyboardAccessEnabled;
}

- (void)notifyAllProcessPools
{
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unsigned int v8;
  BOOL fullKeyboardAccessEnabled;

  WebKit::WebProcessPool::allProcessPools((uint64_t)&v7);
  if (v8)
  {
    v4 = v7;
    v5 = 8 * v8;
    do
    {
      v6 = *v4++;
      fullKeyboardAccessEnabled = self->fullKeyboardAccessEnabled;
      WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::FullKeyboardAccessModeChanged>(v6, (char *)&fullKeyboardAccessEnabled, 0);
      v5 -= 8;
    }
    while (v5);
  }
  WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v7, v3);
}

@end
