@implementation _FPItemDecorationFallbackLookup

- (_FPItemDecorationFallbackLookup)initWithItems:(id)a3
{
  id v5;
  _FPItemDecorationFallbackLookup *v6;
  _FPItemDecorationFallbackLookup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FPItemDecorationFallbackLookup;
  v6 = -[_FPItemDecorationFallbackLookup init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

- (id)fp_valueForKeyPath:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "fp_valueForKeyPath:", v4, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {

          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = 0;
LABEL_11:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
