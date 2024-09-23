@implementation HFListFormatter

- (void)dealloc
{
  objc_super v3;

  -[HFListFormatter _invaildateFormatter](self, "_invaildateFormatter");
  v3.receiver = self;
  v3.super_class = (Class)HFListFormatter;
  -[HFListFormatter dealloc](&v3, sel_dealloc);
}

- (void)_invaildateFormatter
{
  if (-[HFListFormatter formatter](self, "formatter"))
  {
    -[HFListFormatter formatter](self, "formatter");
    ulistfmt_close();
    -[HFListFormatter setFormatter:](self, "setFormatter:", 0);
  }
}

- (NSLocale)locale
{
  NSLocale *locale;

  locale = self->_locale;
  if (locale)
    return locale;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  return (NSLocale *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLocale:(id)a3
{
  NSLocale *v5;
  NSLocale *v6;

  v5 = (NSLocale *)a3;
  if (self->_locale != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_locale, a3);
    -[HFListFormatter _invaildateFormatter](self, "_invaildateFormatter");
    v5 = v6;
  }

}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[HFListFormatter listStyle](self, "listStyle") == 1)
      {
        -[HFListFormatter _formatOrListWithElements:](self, "_formatOrListWithElements:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else if (-[HFListFormatter listStyle](self, "listStyle"))
      {
        if (-[HFListFormatter listStyle](self, "listStyle") != 2)
        {
          v7 = 0;
          goto LABEL_11;
        }
        -[HFListFormatter _formatSentenceListWithElements:](self, "_formatSentenceListWithElements:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HFListFormatter _formatAndListWithElements:](self, "_formatAndListWithElements:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v7 = (void *)v6;
LABEL_11:

      goto LABEL_12;
    }
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (id)_formatSentenceListWithElements:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "count");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HFListFormatter__formatSentenceListWithElements___block_invoke;
  v8[3] = &unk_1EA73BFC8;
  v6 = v4;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __51__HFListFormatter__formatSentenceListWithElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@"), a2);
  v6 = a1 + 32;
  v5 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v6 + 8) - 1 == a3)
    v7 = CFSTR("HFSentenceListFormatTerminator");
  else
    v7 = CFSTR("HFSentenceListFormatSeparator");
  _HFLocalizedStringWithDefaultValue(v7, v7, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v8);

}

- (id)_formatOrListWithElements:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "count");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__HFListFormatter__formatOrListWithElements___block_invoke;
  v8[3] = &unk_1EA73BFC8;
  v6 = v4;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __45__HFListFormatter__formatOrListWithElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  __CFString *v7;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@"), a2);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 - a3 >= 3)
  {
    v6 = *(void **)(a1 + 32);
    v7 = CFSTR("HFOrListFormatSeparator");
LABEL_11:
    _HFLocalizedStringWithDefaultValue(v7, v7, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v9);

    return;
  }
  if (v5 >= 3 && v5 - a3 == 2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = CFSTR("HFOrListFormatSeparatorFinal");
    goto LABEL_11;
  }
  if (!a3 && v5 == 2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = CFSTR("HFOrListFormatSeparatorFinalTwoElements");
    goto LABEL_11;
  }
}

- (id)_formatAndListWithElements:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void **v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  int j;
  uint64_t i;
  void *v25;
  id v27[2];
  id v28;
  int v29;
  _QWORD v30[502];

  v30[500] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = 0;
  if (-[HFListFormatter formatter](self, "formatter"))
    goto LABEL_3;
  -[HFListFormatter locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCString:maxLength:encoding:", v30, 100, 4);

  -[HFListFormatter setFormatter:](self, "setFormatter:", ulistfmt_open());
  v6 = 0;
  if (-[HFListFormatter formatter](self, "formatter"))
  {
LABEL_3:
    v27[0] = self;
    v7 = v28;
    v8 = objc_msgSend(v28, "count", v27[0]);
    if (v8 >= 0x64)
      v9 = 100;
    else
      v9 = v8;
    v10 = objc_msgSend(v28, "count");
    v27[1] = v27;
    MEMORY[0x1E0C80A78](v10);
    v13 = (id *)((char *)v27 - v12);
    if (v11 >= 0x200)
      v14 = 512;
    else
      v14 = v11;
    bzero((char *)v27 - v12, v14);
    v15 = objc_msgSend(v7, "count");
    MEMORY[0x1E0C80A78](v15);
    v17 = (char *)v27 - v16;
    if (v9)
    {
      v18 = 0;
      while (1)
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v20 = objc_msgSend(v19, "length");
        if (v20 >= 0x1F4)
          v21 = 500;
        else
          v21 = v20;
        v22 = malloc_type_malloc(2 * v21, 0x1000040BDFB0063uLL);
        objc_msgSend(v19, "getCharacters:range:", v22, 0, v21);
        v13[v18] = v22;
        *(_DWORD *)&v17[4 * v18] = v21;

        if (v9 == ++v18)
          goto LABEL_16;
      }
      if (v18)
      {
        for (i = 0; i != v18; ++i)
        {
          v25 = v13[i];
          if (v25)
            free(v25);
        }
      }

      v6 = 0;
    }
    else
    {
LABEL_16:
      objc_msgSend(v27[0], "formatter");
      for (j = ulistfmt_format(); v9; --v9)
      {
        if (*v13)
          free(*v13);
        ++v13;
      }
      if (v29 < 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v30, j);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

- (unint64_t)listStyle
{
  return self->_listStyle;
}

- (void)setListStyle:(unint64_t)a3
{
  self->_listStyle = a3;
}

- (UListFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(UListFormatter *)a3
{
  self->_formatter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
