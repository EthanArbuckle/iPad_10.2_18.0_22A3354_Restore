@implementation _SUUIVideoPreviewNotificationObserver

- (_SUUIVideoPreviewNotificationObserver)initWithObservers:(id)a3
{
  id v4;
  _SUUIVideoPreviewNotificationObserver *v5;
  uint64_t v6;
  NSArray *observers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SUUIVideoPreviewNotificationObserver;
  v5 = -[_SUUIVideoPreviewNotificationObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    observers = v5->_observers;
    v5->_observers = (NSArray *)v6;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_observers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)_SUUIVideoPreviewNotificationObserver;
  -[_SUUIVideoPreviewNotificationObserver dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
