@implementation _SWCollaborationOptionsPickerGroup

- (_SWCollaborationOptionsPickerGroup)initWithTitle:(id)a3 identifier:(id)a4 footer:(id)a5 options:(id)a6
{
  return -[_SWCollaborationOptionsPickerGroup initWithTitle:identifier:footer:options:selectedOptionIdentifierIndex:](self, "initWithTitle:identifier:footer:options:selectedOptionIdentifierIndex:", a3, a4, a5, a6, 0);
}

- (_SWCollaborationOptionsPickerGroup)initWithTitle:(id)a3 identifier:(id)a4 footer:(id)a5 options:(id)a6 selectedOptionIdentifierIndex:(int64_t)a7
{
  id v12;
  _SWCollaborationOptionsPickerGroup *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  objc_super v20;

  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_SWCollaborationOptionsPickerGroup;
  v13 = -[_SWCollaborationOptionsGroup initWithTitle:identifier:footer:options:](&v20, sel_initWithTitle_identifier_footer_options_, a3, a4, a5, v12);
  if (objc_msgSend(v12, "count") <= (unint64_t)a7)
  {
    -[_SWCollaborationOptionsPickerGroup _defaultSelectedOptionIdentifier](v13, "_defaultSelectedOptionIdentifier");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "objectAtIndex:", a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &stru_1E217B478;
    if (v15)
      v17 = (__CFString *)v15;
    v18 = v17;

  }
  -[_SWCollaborationOptionsPickerGroup setSelectedOptionIdentifier:](v13, "setSelectedOptionIdentifier:", v18);

  return v13;
}

- (id)_defaultSelectedOptionIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  -[_SWCollaborationOptionsGroup options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E217B478;
  v6 = v4;

  return v6;
}

- (void)setOptions:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SWCollaborationOptionsPickerGroup;
  -[_SWCollaborationOptionsGroup setOptions:](&v5, sel_setOptions_, a3);
  -[_SWCollaborationOptionsPickerGroup _defaultSelectedOptionIdentifier](self, "_defaultSelectedOptionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWCollaborationOptionsPickerGroup setSelectedOptionIdentifier:](self, "setSelectedOptionIdentifier:", v4);

}

- (void)setSelectedOptionIdentifier:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  _BOOL8 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_SWCollaborationOptionsPickerGroup selectedOptionIdentifier](self, "selectedOptionIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[_SWCollaborationOptionsGroup options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "identifier");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v5)
          {

            objc_storeStrong((id *)&self->_selectedOptionIdentifier, a3);
            self->_isUpdatingSelectionState = 1;
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            -[_SWCollaborationOptionsGroup options](self, "options", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v22;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v22 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
                  objc_msgSend(v18, "identifier");
                  v19 = (id)objc_claimAutoreleasedReturnValue();
                  v20 = v19 == v5;

                  objc_msgSend(v18, "setSelected:", v20);
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              }
              while (v15);
            }

            self->_isUpdatingSelectionState = 0;
            goto LABEL_19;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
LABEL_19:

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SWCollaborationOptionsGroup title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SWCollaborationOptionsGroup title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    v5 = (void *)objc_opt_new();
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_SWCollaborationOptionsGroup options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v5, "length"))
          objc_msgSend(v5, "appendString:", CFSTR("\n"));
        objc_msgSend(v5, "appendFormat:", CFSTR("- %@"), v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[SWCollaborationOptionsGroup footer](self, "footer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SWCollaborationOptionsGroup footer](self, "footer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v13);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SWCollaborationOptionsPickerGroup;
  v4 = -[SWCollaborationOptionsGroup copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setSelectedOptionIdentifier:", self->_selectedOptionIdentifier);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWCollaborationOptionsPickerGroup)initWithCoder:(id)a3
{
  id v4;
  _SWCollaborationOptionsPickerGroup *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SWCollaborationOptionsPickerGroup;
  v5 = -[SWCollaborationOptionsGroup initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedOption"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    -[_SWCollaborationOptionsGroup options](v5, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 >= v9)
    {
      -[_SWCollaborationOptionsPickerGroup _defaultSelectedOptionIdentifier](v5, "_defaultSelectedOptionIdentifier");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_SWCollaborationOptionsGroup options](v5, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = &stru_1E217B478;
      if (v12)
        v14 = (__CFString *)v12;
      v15 = v14;

    }
    -[_SWCollaborationOptionsPickerGroup setSelectedOptionIdentifier:](v5, "setSelectedOptionIdentifier:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  NSString *selectedOptionIdentifier;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SWCollaborationOptionsPickerGroup;
  -[SWCollaborationOptionsGroup encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_SWCollaborationOptionsGroup options](self, "options", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      objc_msgSend(v9, "identifier");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      selectedOptionIdentifier = self->_selectedOptionIdentifier;

      if (v10 == selectedOptionIdentifier)
        break;
      if (v6 == (id)++v8)
      {
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    v6 = v9;

    if (v6)
    {
      -[_SWCollaborationOptionsGroup options](self, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indexOfObject:", v6);

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedOption"));
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

  }
}

- (NSString)selectedOptionIdentifier
{
  return self->_selectedOptionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedOptionIdentifier, 0);
}

@end
