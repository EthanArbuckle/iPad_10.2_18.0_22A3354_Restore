@implementation _MFMessageObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_376);
  return (id)sharedObserver_sharedObserver;
}

- (_MFMessageObserver)init
{
  _MFMessageObserver *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *completionMap;
  __CFNotificationCenter *DistributedCenter;
  __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFMessageObserver;
  v2 = -[_MFMessageObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionMap = v2->_completionMap;
    v2->_completionMap = v3;

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    getIMMessageSentDistributedNotification[0]();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)_MFMessageSentCallback, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v2;
}

+ (void)observeMessageGUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "sharedObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observeMessageGUID:completion:", v8, v6);

}

- (void)observeMessageGUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = _Block_copy(a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_completionMap, "setObject:forKeyedSubscript:");

}

+ (void)invokeCompletionForMessageGUID:(id)a3 didSend:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invokeCompletionForMessageGUID:didSend:", v7, v4);

}

- (void)invokeCompletionForMessageGUID:(id)a3 didSend:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_completionMap, "objectForKeyedSubscript:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v4);
    -[_MFMessageObserver removeCompletionForMessageGUID:](self, "removeCompletionForMessageGUID:", v8);
  }

}

+ (void)removeCompletionForMessageGUID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "sharedObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeCompletionForMessageGUID:", v5);

}

- (void)removeCompletionForMessageGUID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_completionMap, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionMap, 0);
}

@end
