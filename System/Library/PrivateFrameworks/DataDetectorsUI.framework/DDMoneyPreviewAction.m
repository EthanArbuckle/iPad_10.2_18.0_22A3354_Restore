@implementation DDMoneyPreviewAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Send with Apple Cash"));
}

- (id)iconName
{
  return CFSTR("applepaycash");
}

- (void)performFromView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  uint64_t v8;
  double v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = 0.0;
  if (DDResultCurrencyExtraction())
  {
    if (v9 > 0.0 && v8 != 0)
    {
      +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate", v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithDouble:", v9);
        v10[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleMoneyActionWithAmount:currencies:", v5, v6);

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No money action delegate set, can't perform the action", v7, 2u);
      }

    }
  }
}

- (id)menuActions
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSURL *url;
  __DDResult *v10;
  NSDictionary *context;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  double v25;
  void *v26;
  _BYTE v27[128];
  void *v28;
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24 = 0;
      v25 = 0.0;
      if (DDResultCurrencyExtraction())
        v5 = v25;
    }
    +[DDAction actionWithURL:result:context:](DDMoneyPreviewAction, "actionWithURL:result:context:", self->super.super.super._url, self->super.super.super._result, self->super.super.super._context, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  v8 = +[DDConversionAction actionAvailableForResult:](DDConversionAction, "actionAvailableForResult:", self->super.super.super._result);
  url = self->super.super.super._url;
  v10 = self->super.super.super._result;
  context = self->super.super.super._context;
  if (v8)
  {
    +[DDAction actionWithURL:result:context:](DDConversionAction, "actionWithURL:result:context:", url, v10, context);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    objc_msgSend(v12, "specialCaseActions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v16);
    }
  }
  else
  {
    +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", url, v10, context);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);
  }

  return v4;
}

@end
