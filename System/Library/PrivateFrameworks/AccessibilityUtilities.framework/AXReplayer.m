@implementation AXReplayer

+ (id)replayer
{
  if (replayer_onceToken != -1)
    dispatch_once(&replayer_onceToken, &__block_literal_global_39);
  return (id)replayer__Replayer;
}

void __22__AXReplayer_replayer__block_invoke()
{
  AXReplayer *v0;
  void *v1;

  v0 = objc_alloc_init(AXReplayer);
  v1 = (void *)replayer__Replayer;
  replayer__Replayer = (uint64_t)v0;

}

- (void)replayWithName:(id)a3 attempts:(int64_t)a4 interval:(double)a5 async:(BOOL)a6 queue:(id)a7 replayBlock:(id)a8 completion:(id)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v12 = a6;
  v19 = a3;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  if (!v16)
    _AXAssert();
  +[_AXReplayInstance replayBlock:name:attempts:interval:async:queue:completion:](_AXReplayInstance, "replayBlock:name:attempts:interval:async:queue:completion:", v16, v19, a4, v12, v15, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dispatch");

}

@end
