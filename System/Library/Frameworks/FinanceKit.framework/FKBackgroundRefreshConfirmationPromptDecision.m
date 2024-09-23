@implementation FKBackgroundRefreshConfirmationPromptDecision

- (FKBackgroundRefreshConfirmationPromptDecision)initWithShouldShowPrompt:(BOOL)a3 token:(id)a4
{
  id v6;
  FKBackgroundRefreshConfirmationPromptDecision *v7;
  FKBackgroundRefreshConfirmationPromptDecision *v8;
  uint64_t v9;
  FKBackgroundRefreshConfirmationPromptToken *token;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKBackgroundRefreshConfirmationPromptDecision;
  v7 = -[FKBackgroundRefreshConfirmationPromptDecision init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_shouldShowPrompt = a3;
    v9 = objc_msgSend(v6, "copy");
    token = v8->_token;
    v8->_token = (FKBackgroundRefreshConfirmationPromptToken *)v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FKBackgroundRefreshConfirmationPromptDecision initWithShouldShowPrompt:token:]([FKBackgroundRefreshConfirmationPromptDecision alloc], "initWithShouldShowPrompt:token:", self->_shouldShowPrompt, self->_token);
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldShowPrompt);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_token);
  v5 = FKCombinedHash(17, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FKBackgroundRefreshConfirmationPromptDecision *v4;
  FKBackgroundRefreshConfirmationPromptDecision *v5;
  char v6;

  v4 = (FKBackgroundRefreshConfirmationPromptDecision *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && self->_shouldShowPrompt == v5->_shouldShowPrompt)
  {
    v6 = FKEqualObjects(self->_token, v5->_token);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowPrompt
{
  return self->_shouldShowPrompt;
}

- (FKBackgroundRefreshConfirmationPromptToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
