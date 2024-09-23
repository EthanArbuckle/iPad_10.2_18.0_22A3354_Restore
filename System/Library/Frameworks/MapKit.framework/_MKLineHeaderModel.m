@implementation _MKLineHeaderModel

- (_MKLineHeaderModel)init
{
  _MKLineHeaderModel *v2;
  uint64_t v3;
  NSMutableArray *tokens;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKLineHeaderModel;
  v2 = -[_MKLineHeaderModel init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    tokens = v2->_tokens;
    v2->_tokens = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)colorProvider
{
  id colorProvider;

  if (self->_colorProvider)
    colorProvider = self->_colorProvider;
  else
    colorProvider = &__block_literal_global_61;
  return (id)MEMORY[0x18D778DB8](colorProvider, a2);
}

- (void)addToken:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_tokens, "addObject:");
}

- (void)insertToken:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v6 = a3;
  if (v6)
  {
    v8 = v6;
    v7 = -[NSMutableArray count](self->_tokens, "count");
    v6 = v8;
    if (v7 > a4)
    {
      -[NSMutableArray insertObject:atIndex:](self->_tokens, "insertObject:atIndex:", v8, a4);
      v6 = v8;
    }
  }

}

- (void)removeToken:(id)a3
{
  if (a3)
    -[NSMutableArray removeObject:](self->_tokens, "removeObject:");
}

- (id)contentAttributedString
{
  id v3;
  void (**colorProvider)(id, void *);
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *fontAttribute;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *obj;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v28 = (void *)-[NSDictionary mutableCopy](self->_fontAttribute, "mutableCopy");
  colorProvider = (void (**)(id, void *))self->_colorProvider;
  if (colorProvider)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_ownerView);
    objc_msgSend(WeakRetained, "mk_theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    colorProvider[2](colorProvider, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CEA0A0]);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_tokens;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v35;
    v10 = *MEMORY[0x1E0CEA098];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v3, "length") && (objc_msgSend(v12, "isEmpty") & 1) == 0)
        {
          v13 = objc_alloc(MEMORY[0x1E0CB3498]);
          -[_MKLineHeaderModel _placeCardHeaderSeparatorString](self, "_placeCardHeaderSeparatorString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v28);
          objc_msgSend(v3, "appendAttributedString:", v15);

        }
        objc_msgSend(v12, "attributedString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");

        if (v17)
        {
          v30 = 0;
          v31 = &v30;
          v32 = 0x2020000000;
          v33 = 1;
          v18 = objc_msgSend(v17, "length");
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __45___MKLineHeaderModel_contentAttributedString__block_invoke;
          v29[3] = &unk_1E20DB810;
          v29[4] = &v30;
          objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v18, 0, v29);
          if (*((_BYTE *)v31 + 24))
          {
            fontAttribute = self->_fontAttribute;
            if (fontAttribute)
              objc_msgSend(v17, "addAttributes:range:", fontAttribute, 0, objc_msgSend(v17, "length"));
          }
          _Block_object_dispose(&v30, 8);
        }
        else
        {
          objc_msgSend(v12, "string");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length") == 0;

          if (v21)
          {
            v17 = 0;
          }
          else
          {
            v22 = objc_alloc(MEMORY[0x1E0CB3778]);
            objc_msgSend(v12, "string");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v28);

          }
        }
        if (objc_msgSend(v17, "length"))
          objc_msgSend(v3, "appendAttributedString:", v17);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }

  if (self->_shouldUseEmptyPlaceholder && !objc_msgSend(v3, "length"))
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", CFSTR(" "), v28);

    v3 = (id)v24;
  }
  v25 = (void *)objc_msgSend(v3, "copy");

  return v25;
}

- (id)_placeCardHeaderSeparatorString
{
  __CFString *v2;

  v2 = (__CFString *)_placeCardHeaderSeparatorString_separatorString;
  if (!_placeCardHeaderSeparatorString_separatorString)
  {
    v2 = CFSTR(" · ");
    _placeCardHeaderSeparatorString_separatorString = (uint64_t)CFSTR(" · ");
  }
  return v2;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(&stru_1E20DFC00, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_tokens;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[_MKLineHeaderModel contentAttributedString](self, "contentAttributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@\n%@"), v11, v3, (_QWORD)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (UIView)ownerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_ownerView);
}

- (void)setOwnerView:(id)a3
{
  objc_storeWeak((id *)&self->_ownerView, a3);
}

- (NSDictionary)fontAttribute
{
  return self->_fontAttribute;
}

- (void)setFontAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldUseEmptyPlaceholder
{
  return self->_shouldUseEmptyPlaceholder;
}

- (void)setShouldUseEmptyPlaceholder:(BOOL)a3
{
  self->_shouldUseEmptyPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorProvider, 0);
  objc_storeStrong((id *)&self->_fontAttribute, 0);
  objc_destroyWeak((id *)&self->_ownerView);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
