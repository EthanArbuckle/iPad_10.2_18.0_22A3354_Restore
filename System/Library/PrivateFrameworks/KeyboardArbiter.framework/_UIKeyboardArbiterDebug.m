@implementation _UIKeyboardArbiterDebug

- (void)errorWithMessage:(id)a3
{
  _UIKeyboardArbiterDebug *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[_UIKeyboardArbiterDebugEntryString entryWithMessage:type:](_UIKeyboardArbiterDebugEntryString, "entryWithMessage:type:", v6, CFSTR("Error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterDebug addEntry:](v4, "addEntry:", v5);

  objc_sync_exit(v4);
}

+ (id)sharedInstance
{
  if (qword_253E78FE0 != -1)
    dispatch_once(&qword_253E78FE0, &__block_literal_global_3);
  return (id)qword_253E78FD8;
}

- (_UIKeyboardArbiterDebug)debugWithMessage:(id)a3
{
  _UIKeyboardArbiterDebug *v4;
  void *v5;
  _UIKeyboardArbiterDebug *result;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[_UIKeyboardArbiterDebugEntryString entryWithMessage:type:](_UIKeyboardArbiterDebugEntryString, "entryWithMessage:type:", v7, CFSTR("Debug"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterDebug addEntry:](v4, "addEntry:", v5);

  objc_sync_exit(v4);
  return result;
}

- (void)addEntry:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!self->_disable && !-[_UIKeyboardArbiterDebug pause](self, "pause"))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36___UIKeyboardArbiterDebug_addEntry___block_invoke;
    v6[3] = &unk_24DAA00C0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

- (BOOL)pause
{
  return self->_pause;
}

- (void)addAsynchronousData:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47___UIKeyboardArbiterDebug_addAsynchronousData___block_invoke;
  v3[3] = &unk_24DAA0930;
  v3[4] = self;
  (*((void (**)(id, _QWORD *))a3 + 2))(a3, v3);
}

- (_UIKeyboardArbiterDebug)init
{
  _UIKeyboardArbiterDebug *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  uint64_t v6;
  NSMutableArray *entries;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardArbiterDebug;
  v2 = -[_UIKeyboardArbiterDebug init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.UIKit.keyboard-arbiter.debug", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_importantCount = 0;
    v5 = (void *)CFPreferencesCopyAppValue(CFSTR("DisableKeyboardDebugInfo"), CFSTR("com.apple.keyboard"));
    v2->_disable = objc_msgSend(v5, "BOOLValue");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v6;

  }
  return v2;
}

- (void)infoWithMessage:(id)a3
{
  _UIKeyboardArbiterDebug *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[_UIKeyboardArbiterDebugEntryString entryWithMessage:type:](_UIKeyboardArbiterDebugEntryString, "entryWithMessage:type:", v6, CFSTR("Info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterDebug addEntry:](v4, "addEntry:", v5);

  objc_sync_exit(v4);
}

- (void)getDebugInfoDictionariesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DAA0980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setPause:(BOOL)a3
{
  self->_pause = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
