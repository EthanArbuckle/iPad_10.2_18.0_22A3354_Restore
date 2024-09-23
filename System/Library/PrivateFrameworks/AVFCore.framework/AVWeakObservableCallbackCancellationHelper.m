@implementation AVWeakObservableCallbackCancellationHelper

- (void)addCallbackToCancel:(id)a3
{
  -[NSMutableArray addObject:](self->_callbackRegistrations, "addObject:", a3);
}

- (AVWeakObservableCallbackCancellationHelper)init
{
  AVWeakObservableCallbackCancellationHelper *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVWeakObservableCallbackCancellationHelper;
  v2 = -[AVWeakObservableCallbackCancellationHelper init](&v4, sel_init);
  if (v2)
    v2->_callbackRegistrations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVWeakObservableCallbackCancellationHelper;
  -[AVWeakObservableCallbackCancellationHelper dealloc](&v3, sel_dealloc);
}

- (void)cancelAllCallbacks
{
  NSMutableArray *callbackRegistrations;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  callbackRegistrations = self->_callbackRegistrations;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](callbackRegistrations, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(callbackRegistrations);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "cancelCallbacks");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](callbackRegistrations, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

@end
