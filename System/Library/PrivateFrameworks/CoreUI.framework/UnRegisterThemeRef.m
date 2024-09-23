@implementation UnRegisterThemeRef

void ___UnRegisterThemeRef_block_invoke(uint64_t a1, NSMapTable *table)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];

  v4 = NSMapGet(table, *(const void **)(a1 + 32));
  v5 = v4;
  NSMapRemove(table, *(const void **)(a1 + 32));
  _CUILog(3, (uint64_t)"CoreUI: CUIThemeStore unregister themeRef %d", v6, v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = ___UnRegisterThemeRef_block_invoke_2;
  block[3] = &unk_1E41B23F8;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void ___UnRegisterThemeRef_block_invoke_2(uint64_t a1)
{

}

@end
