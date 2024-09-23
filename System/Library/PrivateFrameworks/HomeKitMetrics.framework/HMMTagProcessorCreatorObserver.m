@implementation HMMTagProcessorCreatorObserver

- (HMMTagProcessorCreatorObserver)initWithCreationBlock:(id)a3
{
  id v4;
  HMMTagProcessorCreatorObserver *v5;
  uint64_t v6;
  id creationBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTagProcessorCreatorObserver;
  v5 = -[HMMTagProcessorCreatorObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D17B7A7C](v4);
    creationBlock = v5->_creationBlock;
    v5->_creationBlock = (id)v6;

  }
  return v5;
}

- (void)observeTaggedEvent:(id)a3 addProcessorBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a4;
  v6 = a3;
  -[HMMTagProcessorCreatorObserver creationBlock](self, "creationBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v7)[2](v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9[2](v9, v8);

}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_creationBlock, 0);
}

+ (void)addObserverForStartTags:(id)a3 usingCreatorBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  HMMTagProcessorCreatorObserver *v8;

  v5 = a4;
  v6 = a3;
  v8 = -[HMMTagProcessorCreatorObserver initWithCreationBlock:]([HMMTagProcessorCreatorObserver alloc], "initWithCreationBlock:", v5);

  +[HMMTagManager sharedInstance](HMMTagManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerTagObserver:forTags:", v8, v6);

}

@end
