@implementation ECLocalActionReplayer

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ECLocalActionReplayer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (OS_os_log *)(id)log_log_1;
}

void __28__ECLocalActionReplayer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

- (ECLocalActionReplayer)init
{
  -[ECLocalActionReplayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECLocalActionReplayer init]", "ECLocalActionReplayer.m", 20, "0");
}

- (ECLocalActionReplayer)initWithAction:(id)a3
{
  id v5;
  ECLocalActionReplayer *v6;
  ECLocalActionReplayer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECLocalActionReplayer;
  v6 = -[ECLocalActionReplayer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_action, a3);

  return v7;
}

- (id)replayAction
{
  -[ECLocalActionReplayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECLocalActionReplayer replayAction]", "ECLocalActionReplayer.m", 32, "0");
}

- (id)failActionWithError:(id)a3
{
  id v3;
  ECLocalMessageActionResults *v4;

  v3 = a3;
  v4 = -[ECLocalMessageActionResults initWithError:]([ECLocalMessageActionResults alloc], "initWithError:", v3);

  return v4;
}

- (ECLocalActionReplayerDelegate)delegate
{
  return (ECLocalActionReplayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ECLocalMessageAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
