@implementation CPLSyncIndicator

+ (void)_doProtected:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = _doProtected__onceToken_13263;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_doProtected__onceToken_13263, &__block_literal_global_13264);
    v5 = v6;
  }
  dispatch_sync((dispatch_queue_t)_doProtected__queue, v5);

}

+ (void)showSyncIndicator
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__CPLSyncIndicator_showSyncIndicator__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "_doProtected:", v2);
}

+ (void)hideSyncIndicator
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__CPLSyncIndicator_hideSyncIndicator__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "_doProtected:", v2);
}

+ (void)setForeground:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__CPLSyncIndicator_setForeground___block_invoke;
  v3[3] = &__block_descriptor_41_e5_v8__0l;
  v4 = a3;
  v3[4] = a1;
  objc_msgSend(a1, "_doProtected:", v3);
}

uint64_t __34__CPLSyncIndicator_setForeground___block_invoke(uint64_t result)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(result + 40);
  if (v1 != _foreground)
  {
    _foreground = *(_BYTE *)(result + 40);
    if (_showSyncIndicator == 1)
    {
      v2 = *(void **)(result + 32);
      if (v1)
        return objc_msgSend(v2, "_reallyShowSyncIndicator");
      else
        return objc_msgSend(v2, "_reallyHideSyncIndicator");
    }
  }
  return result;
}

uint64_t __37__CPLSyncIndicator_hideSyncIndicator__block_invoke(uint64_t result)
{
  if (_showSyncIndicator == 1)
  {
    if (_foreground)
      result = objc_msgSend(*(id *)(result + 32), "_reallyHideSyncIndicator");
    _showSyncIndicator = 0;
  }
  return result;
}

uint64_t __37__CPLSyncIndicator_showSyncIndicator__block_invoke(uint64_t result)
{
  if ((_showSyncIndicator & 1) == 0)
  {
    if (_foreground)
      result = objc_msgSend(*(id *)(result + 32), "_reallyShowSyncIndicator");
    _showSyncIndicator = 1;
  }
  return result;
}

void __33__CPLSyncIndicator__doProtected___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.cpl.syncindicator", 0);
  v1 = (void *)_doProtected__queue;
  _doProtected__queue = (uint64_t)v0;

}

@end
