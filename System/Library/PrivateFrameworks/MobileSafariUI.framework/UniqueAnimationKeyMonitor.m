@implementation UniqueAnimationKeyMonitor

- (UniqueAnimationKeyMonitor)initWithUniqueAnimationCounter:(id)a3
{
  id v5;
  UniqueAnimationKeyMonitor *v6;
  UniqueAnimationKeyMonitor *v7;
  UniqueAnimationKeyMonitor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniqueAnimationKeyMonitor;
  v6 = -[UniqueAnimationKeyMonitor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_counter, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UniqueAnimationKeyCounter didFinishUsingAnimationKey](self->_counter, "didFinishUsingAnimationKey");
  v3.receiver = self;
  v3.super_class = (Class)UniqueAnimationKeyMonitor;
  -[UniqueAnimationKeyMonitor dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counter, 0);
}

@end
