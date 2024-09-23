@implementation DKReporterController

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x22E320B74](self, a2);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DKReporterController isPresent](self, "isPresent"))
  {
    -[DKReporterController populateAttributes:](self, "populateAttributes:", v4);
    -[DKReporterController componentIdentity](self, "componentIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DKComponent componentWithIdentity:attributes:](DKComponent, "componentWithIdentity:attributes:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v7);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[DKReporterController teardown](self, "teardown");
  +[DKReport reportWithComponents:](DKReport, "reportWithComponents:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKReporterController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __29__DKReporterController_start__block_invoke;
  v10[3] = &unk_24F99AA50;
  v10[4] = self;
  objc_msgSend(v9, "completeWithReport:completion:", v8, v10);

  objc_autoreleasePoolPop(v3);
}

void __29__DKReporterController_start__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeRequestReturningItems:completionHandler:", MEMORY[0x24BDBD1A8], 0);

}

- (BOOL)isPresent
{
  return 0;
}

- (DKComponentIdentity)componentIdentity
{
  return self->_componentIdentity;
}

- (void)setComponentIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_componentIdentity, a3);
}

- (DKReporterContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_componentIdentity, 0);
}

@end
