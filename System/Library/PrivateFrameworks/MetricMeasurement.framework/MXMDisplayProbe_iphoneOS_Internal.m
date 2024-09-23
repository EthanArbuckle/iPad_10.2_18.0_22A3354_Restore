@implementation MXMDisplayProbe_iphoneOS_Internal

+ (unint64_t)_displayIndexWithDescriptor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x24BDE5660];
  v4 = a3;
  objc_msgSend(v3, "displays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "display");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "indexOfObject:", v6);
  return v7;
}

+ (id)_allDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MXMDisplayDescriptor *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDE5660], "displays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x24BDE5660], "displays", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = -[MXMDisplayDescriptor initWithDisplay:]([MXMDisplayDescriptor alloc], "initWithDisplay:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)initPrivateWithDescriptor:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  MXMDisplayProbe_iphoneOS_Internal *v9;
  MXMDisplayProbe_iphoneOS_Internal *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MXMDisplayProbe_iphoneOS_Internal;
  v9 = -[MXMDisplayProbe_iphoneOS_Internal init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayDescriptor, a3);
    v10->_pollRate = 0.0;
    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_lastSample.timestamp = NAN;
  }

  return v10;
}

- (void)_start
{
  self->_pollRate = 0.2;
  -[MXMDisplayProbe_iphoneOS_Internal _loop](self, "_loop");
}

- (void)_stop
{
  MXMDisplayProbe_iphoneOS_Internal *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_pollRate = 0.0;
  objc_sync_exit(obj);

}

- (void)_loop
{
  NSObject *queue;
  MXMDisplayProbe_iphoneOS_Internal *v4;
  double pollRate;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__MXMDisplayProbe_iphoneOS_Internal__loop__block_invoke;
  block[3] = &unk_24D1931C8;
  block[4] = self;
  dispatch_async(queue, block);
  v4 = self;
  objc_sync_enter(v4);
  pollRate = v4->_pollRate;
  if (pollRate > 0.0)
  {
    usleep((pollRate * 1000000.0));
    -[MXMDisplayProbe_iphoneOS_Internal _loop](v4, "_loop");
  }
  objc_sync_exit(v4);

}

- ($175F2685EF764341F5DD80B75CC65478)_pollDisplayForSample
{
  CFTimeInterval v3;
  unint64_t FrameCounterByIndex;
  double v5;
  $175F2685EF764341F5DD80B75CC65478 result;

  v3 = CACurrentMediaTime();
  objc_msgSend((id)objc_opt_class(), "_displayIndexWithDescriptor:", self->_displayDescriptor);
  FrameCounterByIndex = CARenderServerGetFrameCounterByIndex();
  v5 = v3;
  result.var1 = FrameCounterByIndex;
  result.var0 = v5;
  return result;
}

- (MXMDisplayProbePlatformDelegate)delegate
{
  return (MXMDisplayProbePlatformDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_displayDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
