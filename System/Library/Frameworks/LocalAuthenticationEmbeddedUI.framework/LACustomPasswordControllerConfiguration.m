@implementation LACustomPasswordControllerConfiguration

- (id)initWithPrompt:(void *)a3 verifyPromptPrompt:(void *)a4 mode:
{
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)LACustomPasswordControllerConfiguration;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
      +[LACustomPasswordControllerStyle sheetStyle](LACustomPasswordControllerStyle, "sheetStyle");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[6];
      a1[6] = (id)v11;

    }
  }

  return a1;
}

+ (LACustomPasswordControllerConfiguration)registerCustomPasswordConfiguration
{
  return (LACustomPasswordControllerConfiguration *)-[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], 0, 0, (void *)1);
}

+ (LACustomPasswordControllerConfiguration)enterCustomPasswordConfiguration
{
  return (LACustomPasswordControllerConfiguration *)-[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], 0, 0, 0);
}

+ (id)registerCustomPasswordControllerConfigurationWithPrompt:(id)a3 verifyPrompt:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], v6, v5, (void *)1);

  return v7;
}

+ (id)enterCustomPasswordConfigurationWithPrompt:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], v3, 0, 0);

  return v4;
}

- (id)prompt
{
  return self->_prompt;
}

- (id)verifyPrompt
{
  return self->_verifyPrompt;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, a3);
}

- (int64_t)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int64_t)a3
{
  self->_passwordType = a3;
}

- (LACustomPasswordControllerStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_verifyPrompt, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
}

@end
