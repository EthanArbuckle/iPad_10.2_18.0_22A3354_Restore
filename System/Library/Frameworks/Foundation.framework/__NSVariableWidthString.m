@implementation __NSVariableWidthString

- (__NSVariableWidthString)initWithString:(id)a3 widthVariants:(id)a4
{
  __NSVariableWidthString *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)__NSVariableWidthString;
  v6 = -[NSString init](&v8, sel_init);
  if (v6)
  {
    v6->_variants = (NSDictionary *)objc_msgSend(a4, "copy");
    v6->_defaultString = (NSString *)objc_msgSend(a3, "copy");
  }
  return v6;
}

- (__NSVariableWidthString)initWithWidthVariants:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  BOOL v14;
  const __CFString *v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_19;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_msgSend(a3, "allKeys");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (!v6)
    goto LABEL_19;
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "integerValue");
      if (v8)
        v14 = v13 < v9;
      else
        v14 = 1;
      if (v14)
      {
        v8 = v12;
        v9 = v13;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  }
  while (v7);
  if (v8)
    v16 = (const __CFString *)objc_msgSend(a3, "objectForKey:", v8);
  else
LABEL_19:
    v16 = &stru_1E0F56070;
  return -[__NSVariableWidthString initWithString:widthVariants:](self, "initWithString:widthVariants:", v16, a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSVariableWidthString;
  -[__NSVariableWidthString dealloc](&v3, sel_dealloc);
}

- (id)variantFittingPresentationWidth:(int64_t)a3
{
  NSString *v5;
  __NSVariableWidthString *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_variants)
    goto LABEL_15;
  v5 = -[NSDictionary objectForKey:](self->_variants, "objectForKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
  if (!v5)
  {
    if (!-[NSDictionary count](self->_variants, "count"))
      goto LABEL_15;
    v7 = -[NSArray sortedArrayUsingComparator:](-[NSDictionary allKeys](self->_variants, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_3);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (!v8)
      goto LABEL_15;
    v9 = v8;
    v5 = 0;
    v10 = *(_QWORD *)v16;
LABEL_8:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
      if (objc_msgSend(v12, "integerValue") > a3)
        break;
      v5 = -[NSDictionary objectForKey:](self->_variants, "objectForKey:", v12);
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        if (v9)
          goto LABEL_8;
        break;
      }
    }
    if (!v5)
      goto LABEL_15;
  }
  if (v5 != self->_defaultString)
    v6 = -[__NSVariableWidthString initWithString:widthVariants:]([__NSVariableWidthString alloc], "initWithString:widthVariants:", v5, self->_variants);
  else
LABEL_15:
    v6 = self;
  return v6;
}

- (id)formatConfiguration
{
  if (self->_defaultString && (objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[NSString performSelector:](self->_defaultString, "performSelector:", sel_formatConfiguration);
  else
    return 0;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_defaultString, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->_defaultString, "getCharacters:range:", a3, a4.location, a4.length);
}

- (unint64_t)length
{
  return -[NSString length](self->_defaultString, "length");
}

- (id)_widthVariants
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSDictionary count](self->_variants, "count"))
  {
    v4 = -[NSArray sortedArrayUsingComparator:](-[NSDictionary allKeys](self->_variants, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_3);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObject:", -[NSDictionary objectForKeyedSubscript:](self->_variants, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)));
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v6);
    }
  }
  else
  {
    objc_msgSend(v3, "addObject:", self);
  }
  return v3;
}

@end
