@implementation HMDBackgroundSystemTask

- (HMDBackgroundSystemTask)initWithUnderlyingTask:(id)a3
{
  id v5;
  HMDBackgroundSystemTask *v6;
  HMDBackgroundSystemTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundSystemTask;
  v6 = -[HMDBackgroundSystemTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingTask, a3);

  return v7;
}

- (void)setTaskCompleted
{
  id v2;

  -[HMDBackgroundSystemTask underlyingTask](self, "underlyingTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTaskCompleted");

}

- (BGSystemTask)underlyingTask
{
  return self->_underlyingTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingTask, 0);
}

@end
