@implementation IRReplayEventsContainerMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRReplayEventsContainerMO"));
}

- (id)convert
{
  id v3;
  void *v4;
  id v5;
  IRReplayEventsContainerDO *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[IRReplayEventsContainerMO replayEvent](self, "replayEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__IRReplayEventsContainerMO_convert__block_invoke;
  v8[3] = &unk_2510455C8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = -[IRReplayEventsContainerDO initWithReplayEvents:]([IRReplayEventsContainerDO alloc], "initWithReplayEvents:", v5);
  return v6;
}

void __36__IRReplayEventsContainerMO_convert__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "convert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
