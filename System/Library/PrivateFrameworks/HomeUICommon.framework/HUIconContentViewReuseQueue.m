@implementation HUIconContentViewReuseQueue

HUIconContentViewReuseQueue *__67__HUIconContentViewReuseQueue_globalReuseQueueForContentViewClass___block_invoke_3(uint64_t a1)
{
  return -[HUIconContentViewReuseQueue initWithContentViewClass:]([HUIconContentViewReuseQueue alloc], "initWithContentViewClass:", *(_QWORD *)(a1 + 32));
}

- (HUIconContentViewReuseQueue)initWithContentViewClass:(Class)a3
{
  HUIconContentViewReuseQueue *v4;
  HUIconContentViewReuseQueue *v5;
  uint64_t v6;
  NSMutableArray *reuseStack;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUIconContentViewReuseQueue;
  v4 = -[HUIconContentViewReuseQueue init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_contentViewClass, a3);
    v6 = objc_opt_new();
    reuseStack = v5->_reuseStack;
    v5->_reuseStack = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)dequeueContentView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  -[HUIconContentViewReuseQueue reuseStack](self, "reuseStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HUIconContentViewReuseQueue reuseStack](self, "reuseStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[HUIconContentViewReuseQueue reuseStack](self, "reuseStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLastObject");

  }
  else
  {
    v6 = objc_alloc_init(-[HUIconContentViewReuseQueue contentViewClass](self, "contentViewClass"));
  }
  return v6;
}

- (NSMutableArray)reuseStack
{
  return self->_reuseStack;
}

- (Class)contentViewClass
{
  return self->_contentViewClass;
}

+ (id)globalReuseQueueForContentViewClass:(Class)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  if (_MergedGlobals_8 != -1)
    dispatch_once(&_MergedGlobals_8, &__block_literal_global_2_0);
  v4 = (id)qword_25433F660;
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__HUIconContentViewReuseQueue_globalReuseQueueForContentViewClass___block_invoke_3;
  v8[3] = &__block_descriptor_40_e34___HUIconContentViewReuseQueue_8__0lu32l8;
  v8[4] = a3;
  objc_msgSend(v4, "na_objectForKey:withDefaultValue:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __67__HUIconContentViewReuseQueue_globalReuseQueueForContentViewClass___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_25433F660;
  qword_25433F660 = v0;

}

- (HUIconContentViewReuseQueue)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithContentViewClass_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUIconContentViewReuseQueue.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUIconContentViewReuseQueue init]",
    v5);

  return 0;
}

- (void)reapContentView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUIconContentViewReuseQueue reuseStack](self, "reuseStack");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseStack, 0);
  objc_storeStrong((id *)&self->_contentViewClass, 0);
}

@end
