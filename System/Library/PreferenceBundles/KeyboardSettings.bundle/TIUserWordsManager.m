@implementation TIUserWordsManager

- (TIUserWordsManager)init
{
  TIUserWordsManager *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIUserWordsManager;
  v2 = -[TIUserWordsManager init](&v5, sel_init);
  if (v2)
  {
    v2->_textReplacementStore = (_KSTextReplacementClientStore *)objc_alloc_init(MEMORY[0x24BE5E698]);
    v2->_observers = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)ShortcutsDidChange, (CFStringRef)*MEMORY[0x24BE5E690], 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE5E690], 0);

  v4.receiver = self;
  v4.super_class = (Class)TIUserWordsManager;
  -[TIUserWordsManager dealloc](&v4, sel_dealloc);
}

- (NSArray)entries
{
  NSArray *result;

  result = self->_cache;
  if (!result)
  {
    -[TIUserWordsManager setCache:](self, "setCache:", -[_KSTextReplacementClientStore textReplacementEntries](self->_textReplacementStore, "textReplacementEntries"));
    return self->_cache;
  }
  return result;
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  _KSTextReplacementClientStore *textReplacementStore;
  _QWORD v6[6];

  textReplacementStore = self->_textReplacementStore;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke;
  v6[3] = &unk_24E7329B8;
  v6[4] = self;
  v6[5] = a5;
  -[_KSTextReplacementClientStore addEntries:removeEntries:withCompletionHandler:](textReplacementStore, "addEntries:removeEntries:withCompletionHandler:", a3, a4, v6);
}

void __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24E732990;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  block[5] = a2;
  block[6] = v3;
  block[4] = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "notifyObserversOfChange");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)requestSync
{
  -[_KSTextReplacementClientStore requestSyncWithCompletionBlock:](self->_textReplacementStore, "requestSyncWithCompletionBlock:", &__block_literal_global_8);
}

- (void)notifyObserversOfChange
{
  NSMutableArray *observers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TIUserWordsManager setCache:](self, "setCache:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  observers = self->_observers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(observers);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)addObserver:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_observers, "addObject:", v4);

  return v4;
}

- (void)removeObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", a3);
}

- (NSArray)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
