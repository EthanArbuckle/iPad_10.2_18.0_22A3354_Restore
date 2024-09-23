@implementation DDGenericURLPreviewAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a3;
  if (v5
    || _DDResultIsURL((uint64_t)a4)
    && (_DDURLFromResult((uint64_t)a4), (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("upi")) & 1) != 0)
      LOBYTE(v8) = 0;
    else
      v8 = dd_urlLooksSuspicious(v5) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)menuActions
{
  void *v3;
  void *v4;
  DDTextMessageAction *v5;
  void *v6;
  DDCopyAction *v7;
  DDCopyAction **v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  DDCopyAction *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  DDCopyAction *v23;
  DDCopyAction *v24;
  uint64_t v25;
  _BYTE v26[128];
  DDCopyAction *v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[DDAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || -[DDAction result](self, "result")
    && (_DDURLFromResult((uint64_t)-[DDAction result](self, "result")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    if (+[DDTextMessageAction isShowMessageURL:](DDTextMessageAction, "isShowMessageURL:", v3))
    {
      v5 = -[DDTextMessageAction initWithURL:result:context:]([DDTextMessageAction alloc], "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
      v28[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

      v7 = -[DDCopyAction initWithURL:result:context:]([DDCopyAction alloc], "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
      v27 = v7;
      v8 = &v27;
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      +[DDAction actionsWithURL:result:context:](DDOpenURLAction, "actionsWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v25 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
        }
        while (v11);
      }

      v15 = -[DDCopyAction initWithURL:result:context:]([DDCopyAction alloc], "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
      v24 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

      v7 = -[DDShareAction initWithURL:result:context:]([DDShareAction alloc], "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
      v23 = v7;
      v8 = &v23;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

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

  v3 = self->super.super._url;
  if (!v3)
  {
    v3 = (NSURL *)self->super.super._result;
    if (v3)
    {
      _DDURLFromResult((uint64_t)v3);
      v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

@end
