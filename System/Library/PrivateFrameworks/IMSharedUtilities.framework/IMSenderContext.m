@implementation IMSenderContext

- (BOOL)isFromMe
{
  return -[IMSenderContext_Impl isFromMe](self->swiftImpl, "isFromMe");
}

- (BOOL)isTrustedSender
{
  return -[IMSenderContext_Impl isTrustedSender](self->swiftImpl, "isTrustedSender");
}

- (NSString)serviceName
{
  return -[IMSenderContext_Impl serviceName](self->swiftImpl, "serviceName");
}

- (IMSenderContext)initWithSenderContext_Impl:(id)a3
{
  id v5;
  IMSenderContext *v6;
  IMSenderContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMSenderContext;
  v6 = -[IMSenderContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->swiftImpl, a3);

  return v7;
}

+ (id)contextWithKnownSender:(BOOL)a3
{
  _BOOL8 v3;
  IMSenderContext *v4;
  void *v5;
  IMSenderContext *v6;

  v3 = a3;
  v4 = [IMSenderContext alloc];
  +[IMSenderContext_Impl contextWithKnownSender:](IMSenderContext_Impl, "contextWithKnownSender:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IMSenderContext initWithSenderContext_Impl:](v4, "initWithSenderContext_Impl:", v5);

  return v6;
}

+ (id)fromMeContext
{
  IMSenderContext *v2;
  void *v3;
  IMSenderContext *v4;

  v2 = [IMSenderContext alloc];
  +[IMSenderContext_Impl fromMeContext](IMSenderContext_Impl, "fromMeContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMSenderContext initWithSenderContext_Impl:](v2, "initWithSenderContext_Impl:", v3);

  return v4;
}

+ (id)untrustedContext
{
  IMSenderContext *v2;
  void *v3;
  IMSenderContext *v4;

  v2 = [IMSenderContext alloc];
  +[IMSenderContext_Impl untrustedContext](IMSenderContext_Impl, "untrustedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMSenderContext initWithSenderContext_Impl:](v2, "initWithSenderContext_Impl:", v3);

  return v4;
}

+ (id)businessChatContext
{
  IMSenderContext *v2;
  void *v3;
  IMSenderContext *v4;

  v2 = [IMSenderContext alloc];
  +[IMSenderContext_Impl businessChatContext](IMSenderContext_Impl, "businessChatContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMSenderContext initWithSenderContext_Impl:](v2, "initWithSenderContext_Impl:", v3);

  return v4;
}

+ (id)contextWithKnownSender:(BOOL)a3 serviceName:(id)a4
{
  _BOOL8 v4;
  id v5;
  IMSenderContext *v6;
  void *v7;
  IMSenderContext *v8;

  v4 = a3;
  v5 = a4;
  v6 = [IMSenderContext alloc];
  +[IMSenderContext_Impl contextWithKnownSender:serviceName:](IMSenderContext_Impl, "contextWithKnownSender:serviceName:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IMSenderContext initWithSenderContext_Impl:](v6, "initWithSenderContext_Impl:", v7);
  return v8;
}

+ (id)fromMeContextWithServiceName:(id)a3
{
  id v3;
  IMSenderContext *v4;
  void *v5;
  IMSenderContext *v6;

  v3 = a3;
  v4 = [IMSenderContext alloc];
  +[IMSenderContext_Impl fromMeContextWithServiceName:](IMSenderContext_Impl, "fromMeContextWithServiceName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[IMSenderContext initWithSenderContext_Impl:](v4, "initWithSenderContext_Impl:", v5);
  return v6;
}

+ (id)untrustedContextWithServiceName:(id)a3
{
  id v3;
  IMSenderContext *v4;
  void *v5;
  IMSenderContext *v6;

  v3 = a3;
  v4 = [IMSenderContext alloc];
  +[IMSenderContext_Impl untrustedContextWithServiceName:](IMSenderContext_Impl, "untrustedContextWithServiceName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[IMSenderContext initWithSenderContext_Impl:](v4, "initWithSenderContext_Impl:", v5);
  return v6;
}

+ (id)businessChatContextWithServiceName:(id)a3
{
  id v3;
  IMSenderContext *v4;
  void *v5;
  IMSenderContext *v6;

  v3 = a3;
  v4 = [IMSenderContext alloc];
  +[IMSenderContext_Impl businessChatContextWithServiceName:](IMSenderContext_Impl, "businessChatContextWithServiceName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[IMSenderContext initWithSenderContext_Impl:](v4, "initWithSenderContext_Impl:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return MEMORY[0x1E0DE7D20](IMSenderContext_Impl, sel_supportsSecureCoding);
}

- (void)encodeWithCoder:(id)a3
{
  MEMORY[0x1E0DE7D20](self->swiftImpl, sel_encodeWithCoder_);
}

- (IMSenderContext)initWithCoder:(id)a3
{
  id v4;
  IMSenderContext *v5;
  IMSenderContext_Impl *v6;
  IMSenderContext_Impl *swiftImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMSenderContext;
  v5 = -[IMSenderContext init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMSenderContext_Impl initWithCoder:]([IMSenderContext_Impl alloc], "initWithCoder:", v4);
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->swiftImpl, 0);
}

@end
