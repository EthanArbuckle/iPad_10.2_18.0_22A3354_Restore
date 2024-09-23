@implementation DDConversionPreviewAction

- (id)createViewController
{
  DDConversionAction *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DDConversionPreviewController *v8;
  BOOL v9;
  DDConversionPreviewController *v10;
  void *v11;

  if (+[DDConversionAction actionAvailableForResult:](DDConversionAction, "actionAvailableForResult:", self->super.super._result))
  {
    v3 = -[DDConversionAction initWithURL:result:context:]([DDConversionAction alloc], "initWithURL:result:context:", 0, self->super.super._result, self->super.super._context);
    -[DDConversionAction calculateResult](v3, "calculateResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formattedExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[DDConversionAction calculateResult](v3, "calculateResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formattedResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (v5)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      v10 = [DDConversionPreviewController alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ="), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[DDConversionPreviewController initWithTitle:subTitle:finance:](v10, "initWithTitle:subTitle:finance:", v11, v7, DDResultHasType());

    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)menuActions
{
  void *v2;
  void *v3;
  id v4;

  +[DDConversionAction allActionsForResult:context:](DDConversionAction, "allActionsForResult:context:", self->super.super._result, self->super.super._context);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)commitURL
{
  void *v2;

  v2 = self->super.super._result;
  if (v2)
  {
    if (DDResultHasType())
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://finance.yahoo.com/currency-converter/"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

@end
