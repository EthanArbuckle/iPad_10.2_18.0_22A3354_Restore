@implementation DDChatBotAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  id v5;
  void *v6;
  char IsChatBot;
  BOOL v8;
  id v9;
  id v10;
  id v12;

  v5 = a3;
  if (!v5)
  {
    if (_DDResultIsURL((uint64_t)a4))
    {
      _DDURLFromResult((uint64_t)a4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  objc_msgSend(v5, "dd_emailFromMailtoScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsChatBot = dd_handleIsChatBot(v6);

  if ((IsChatBot & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v12 = 0;
    v9 = (id)objc_msgSend(v5, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, &v12, 0);
    v10 = v12;
    v8 = v10 != 0;

  }
  return v8;
}

- (id)menuActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[DDAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || -[DDAction result](self, "result")
    && (_DDURLFromResult((uint64_t)-[DDAction result](self, "result")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v14 + 1) + 8 * i)), "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
          v10 = (void *)v9;
          if (v9)
          {
            v18 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v11);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v6);
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)sheetActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[3];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[DDAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || -[DDAction result](self, "result")
    && (_DDURLFromResult((uint64_t)-[DDAction result](self, "result")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v12 + 1) + 8 * i)), "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)commitURL
{
  NSURL *v3;
  __DDResult *v4;
  DDTextMessageAction *v5;
  void *v6;

  v3 = self->super.super._url;
  if (!v3)
  {
    v4 = self->super.super._result;
    if (v4)
    {
      _DDURLFromResult((uint64_t)v4);
      v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  v5 = -[DDTextMessageAction initWithURL:result:context:]([DDTextMessageAction alloc], "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
  -[DDTextMessageAction notificationURL](v5, "notificationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
