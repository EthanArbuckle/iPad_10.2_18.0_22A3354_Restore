@implementation LWCRTypeErrorContext

- (LWCRTypeErrorContext)init
{
  LWCRTypeErrorContext *v2;
  uint64_t v3;
  NSMutableArray *keyContext;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LWCRTypeErrorContext;
  v2 = -[LWCRTypeErrorContext init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    keyContext = v2->keyContext;
    v2->keyContext = (NSMutableArray *)v3;

    v2->code = 0;
  }
  return v2;
}

- (void)pushKey:(id)a3
{
  -[NSMutableArray addObject:](self->keyContext, "addObject:", a3);
}

- (void)popKey
{
  -[NSMutableArray removeLastObject](self->keyContext, "removeLastObject");
}

- (void)setError:(unsigned int)a3
{
  self->code = a3;
}

- (id)synthesizeError
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Error: %s, Context: "), LWCRTypeVerificationBackend_errorStringForCode(self->code));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->keyContext;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        if (v7 + (int)i < 1)
          objc_msgSend(v3, "appendString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        else
          objc_msgSend(v3, "appendFormat:", CFSTR(" -> %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v7 += v6;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LWCRVerificationError"), self->code, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keyContext, 0);
}

@end
