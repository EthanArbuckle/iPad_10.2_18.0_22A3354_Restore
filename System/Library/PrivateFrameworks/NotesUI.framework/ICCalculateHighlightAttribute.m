@implementation ICCalculateHighlightAttribute

- (ICCalculateHighlightAttribute)init
{
  ICCalculateHighlightAttribute *v2;
  ICCalculateHighlightAttribute *v3;
  uint64_t v4;
  NSArray *errors;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICCalculateHighlightAttribute;
  v2 = -[ICCalculateHighlightAttribute init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    errors = v3->_errors;
    v3->_errors = (NSArray *)v4;

  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICCalculateHighlightAttribute type](self, "type");
  v7 = CFSTR("None");
  if (v6 == 1)
    v7 = CFSTR("Variable");
  if (v6 == 2)
    v7 = CFSTR("Result");
  v8 = v7;
  -[ICCalculateHighlightAttribute errors](self, "errors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %@, errors: %@>"), v5, self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "type");
  if (v6 == -[ICCalculateHighlightAttribute type](self, "type"))
  {
    objc_msgSend(v5, "errors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCalculateHighlightAttribute errors](self, "errors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICCalculateHighlightAttribute type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ICCalculateHighlightAttribute errors](self, "errors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v8 = ICHashWithObject(*(void **)(*((_QWORD *)&v23 + 1) + 8 * i)) - v8 + 32 * v8;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v21 = ICHashWithHashKeys(v4, v14, v15, v16, v17, v18, v19, v20, v8);
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICCalculateHighlightAttribute *v4;
  void *v5;
  void *v6;

  v4 = -[ICCalculateHighlightAttribute init](+[ICCalculateHighlightAttribute allocWithZone:](ICCalculateHighlightAttribute, "allocWithZone:", a3), "init");
  -[ICCalculateHighlightAttribute setType:](v4, "setType:", -[ICCalculateHighlightAttribute type](self, "type"));
  -[ICCalculateHighlightAttribute errors](self, "errors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[ICCalculateHighlightAttribute setErrors:](v4, "setErrors:", v6);

  return v4;
}

- (UIColor)color
{
  void *v2;

  if (-[ICCalculateHighlightAttribute type](self, "type") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICControlAccentColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (UIColor *)v2;
}

- (int64_t)underlineStyle
{
  if (ICInternalSettingsIsMathDebugHighlightingEnabled())
    return 2;
  else
    return 0;
}

- (UIColor)underlineColor
{
  void *v3;
  void *v4;

  if (ICInternalSettingsIsMathDebugHighlightingEnabled())
  {
    -[ICCalculateHighlightAttribute errors](self, "errors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIColor *)v4;
}

- (NSString)tooltip
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICCalculateHighlightAttribute errors](self, "errors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICCalculateHighlightAttribute errors](self, "errors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_map:", &__block_literal_global_68);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

uint64_t __40__ICCalculateHighlightAttribute_tooltip__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedDescription");
}

- (NSArray)suggestions
{
  void *v2;
  void *v3;

  -[ICCalculateHighlightAttribute errors](self, "errors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_flatMap:", &__block_literal_global_15_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __44__ICCalculateHighlightAttribute_suggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D09E48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v5;

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
