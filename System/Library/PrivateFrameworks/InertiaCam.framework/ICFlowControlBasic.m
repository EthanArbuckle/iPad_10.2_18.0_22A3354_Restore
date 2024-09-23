@implementation ICFlowControlBasic

- (ICFlowControlBasic)initWithCancel:(id)a3
{
  id v4;
  ICFlowControlBasic *v5;
  ICFlowControlBasic *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICFlowControlBasic;
  v5 = -[ICFlowControlBasic init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICFlowControlBasic setShouldBeCanceled:](v5, "setShouldBeCanceled:", v4);

  return v6;
}

- (ICFlowControlBasic)initWithProgress:(id)a3
{
  id v4;
  ICFlowControlBasic *v5;
  ICFlowControlBasic *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICFlowControlBasic;
  v5 = -[ICFlowControlBasic init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICFlowControlBasic setReportProgress:](v5, "setReportProgress:", v4);

  return v6;
}

- (void)ICReportProgress:(float)a3
{
  void *v5;
  void (**v6)(float);

  -[ICFlowControlBasic reportProgress](self, "reportProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICFlowControlBasic reportProgress](self, "reportProgress");
    v6 = (void (**)(float))objc_claimAutoreleasedReturnValue();
    v6[2](a3);

  }
}

- (BOOL)ICShouldBeCanceled
{
  void *v3;
  uint64_t (**v4)(void);

  -[ICFlowControlBasic shouldBeCanceled](self, "shouldBeCanceled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICFlowControlBasic shouldBeCanceled](self, "shouldBeCanceled");
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = v4[2]();

  }
  return (char)v3;
}

- (id)shouldBeCanceled
{
  return self->shouldBeCanceled;
}

- (void)setShouldBeCanceled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)reportProgress
{
  return self->reportProgress;
}

- (void)setReportProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->reportProgress, 0);
  objc_storeStrong(&self->shouldBeCanceled, 0);
}

@end
