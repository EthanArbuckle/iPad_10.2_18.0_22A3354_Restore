@implementation AFConnectionUserInteractionAssertion

- (AFConnectionUserInteractionAssertion)initWithCompletion:(id)a3
{
  id v4;
  AFConnectionUserInteractionAssertion *v5;
  AFSafetyBlock *v6;
  uint64_t v7;
  AFSafetyBlock *safetyBlock;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFConnectionUserInteractionAssertion;
  v5 = -[AFConnectionUserInteractionAssertion init](&v12, sel_init);
  if (v5)
  {
    v6 = [AFSafetyBlock alloc];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__AFConnectionUserInteractionAssertion_initWithCompletion___block_invoke;
    v10[3] = &unk_1E3A31A20;
    v11 = v4;
    v7 = -[AFSafetyBlock initWithBlock:](v6, "initWithBlock:", v10);
    safetyBlock = v5->_safetyBlock;
    v5->_safetyBlock = (AFSafetyBlock *)v7;

  }
  return v5;
}

- (void)releaseAssertion
{
  -[AFSafetyBlock invoke](self->_safetyBlock, "invoke");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyBlock, 0);
}

uint64_t __59__AFConnectionUserInteractionAssertion_initWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
