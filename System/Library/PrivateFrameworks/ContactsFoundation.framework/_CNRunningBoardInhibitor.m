@implementation _CNRunningBoardInhibitor

+ (id)os_log
{
  if (os_log_cn_once_token_1_16 != -1)
    dispatch_once(&os_log_cn_once_token_1_16, &__block_literal_global_86);
  return (id)os_log_cn_once_object_1_16;
}

- (_CNRunningBoardInhibitor)initWithExplanation:(id)a3
{
  id v4;
  _CNRunningBoardInhibitor *v5;
  uint64_t v6;
  NSString *explanation;
  _CNRunningBoardInhibitor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNRunningBoardInhibitor;
  v5 = -[_CNRunningBoardInhibitor init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("explanation"), self->_explanation);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("assertion"), self->_assertion);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)start
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F80C000, a2, OS_LOG_TYPE_ERROR, "Failed to take runningboard assertion, error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)stop
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CNRunningBoardInhibitor;
  -[CNInhibitor stop](&v4, sel_stop);
  -[_CNRunningBoardInhibitor assertion](self, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_CNRunningBoardInhibitor setAssertion:](self, "setAssertion:", 0);
}

+ (id)runningBoardTarget
{
  if (runningBoardTarget_cn_once_token_5 != -1)
    dispatch_once(&runningBoardTarget_cn_once_token_5, &__block_literal_global_18_0);
  return (id)runningBoardTarget_cn_once_object_5;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

@end
