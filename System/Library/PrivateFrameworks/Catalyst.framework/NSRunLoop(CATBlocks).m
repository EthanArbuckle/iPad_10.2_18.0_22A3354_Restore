@implementation NSRunLoop(CATBlocks)

+ (void)cat_performBlock:()CATBlocks
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF18];
  v4 = a3;
  objc_msgSend(v3, "currentRunLoop");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cat_performBlock:", v4);

}

+ (void)cat_performBlockOnMainRunLoop:()CATBlocks
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF18];
  v4 = a3;
  objc_msgSend(v3, "mainRunLoop");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cat_performBlock:", v4);

}

- (void)cat_performBlock:()CATBlocks
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v9[0] = *MEMORY[0x24BDBCB80];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "currentMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObject:", v8);
  objc_msgSend(a1, "cat_performInModes:block:", v7, v4);

}

- (void)cat_performInModes:()CATBlocks block:
{
  id v6;
  id v7;
  __CFRunLoop *v8;

  v6 = a4;
  v7 = a3;
  v8 = (__CFRunLoop *)objc_msgSend(a1, "getCFRunLoop");
  CFRunLoopPerformBlock(v8, v7, v6);

  CFRunLoopWakeUp(v8);
}

@end
