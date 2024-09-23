@implementation _MKMultiPartLabelMetrics

- (_MKMultiPartLabelMetrics)initWithMultiPartString:(id)a3
{
  id v4;
  _MKMultiPartLabelMetrics *v5;
  _MKMultiPartLabelMetrics *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableAttributedString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _MKMultiPartStringComponent *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _MKMultiPartStringComponent *v24;
  uint64_t v25;
  NSAttributedString *originalAttributedString;
  NSMutableAttributedString *attributedString;
  NSMutableAttributedString *v28;
  uint64_t v29;
  NSArray *separators;
  uint64_t v31;
  NSArray *components;
  _MKMultiPartLabelMetrics *v34;
  void *v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_MKMultiPartLabelMetrics;
  v5 = -[_MKMultiPartLabelMetrics init](&v42, sel_init);
  v6 = v5;
  if (v5)
  {
    v34 = v5;
    v7 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "components");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "separators");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "components");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (!v12)
      goto LABEL_14;
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v39;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v18 = -[_MKMultiPartStringComponent initWithAttributedString:range:]([_MKMultiPartStringComponent alloc], "initWithAttributedString:range:", v17, -[NSMutableAttributedString length](v11, "length"), objc_msgSend(v17, "length"));
        objc_msgSend(v37, "addObject:", v18);

        -[NSMutableAttributedString appendAttributedString:](v11, "appendAttributedString:", v17);
        objc_msgSend(v4, "components");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v14 + i + 1 < v20)
        {
          objc_msgSend(v4, "separators");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 + i < (unint64_t)objc_msgSend(v21, "count"))
          {
            objc_msgSend(v4, "separators");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", v14 + i);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
              continue;
            v24 = -[_MKMultiPartStringComponent initWithAttributedString:range:]([_MKMultiPartStringComponent alloc], "initWithAttributedString:range:", v23, -[NSMutableAttributedString length](v11, "length"), objc_msgSend(v23, "length"));
            objc_msgSend(v35, "addObject:", v24);

            -[NSMutableAttributedString appendAttributedString:](v11, "appendAttributedString:", v23);
            v21 = v23;
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      v14 += i;
      if (!v13)
      {
LABEL_14:

        v25 = -[NSMutableAttributedString copy](v11, "copy");
        v6 = v34;
        originalAttributedString = v34->_originalAttributedString;
        v34->_originalAttributedString = (NSAttributedString *)v25;

        attributedString = v34->_attributedString;
        v34->_attributedString = v11;
        v28 = v11;

        v29 = objc_msgSend(v35, "copy");
        separators = v34->_separators;
        v34->_separators = (NSArray *)v29;

        v31 = objc_msgSend(v37, "copy");
        components = v34->_components;
        v34->_components = (NSArray *)v31;

        break;
      }
    }
  }

  return v6;
}

- (BOOL)replaceSeparatorAtIndex:(unint64_t)a3 withString:(id)a4
{
  __CFString *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  _BOOL4 v29;
  void *v30;
  BOOL v31;

  v6 = (__CFString *)a4;
  -[_MKMultiPartLabelMetrics separators](self, "separators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v31 = 0;
    v10 = v6;
  }
  else
  {
    v9 = &stru_1E20DFC00;
    if (v6)
      v9 = v6;
    v10 = v9;

    -[_MKMultiPartLabelMetrics separators](self, "separators");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MKMultiPartLabelMetrics attributedString](self, "attributedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "range");
    objc_msgSend(v14, "substringWithRange:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if (!v20)
      goto LABEL_8;
    -[_MKMultiPartLabelMetrics attributedString](self, "attributedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "range");
    objc_msgSend(v21, "replaceCharactersInRange:withString:", v22, v23, v10);

    objc_msgSend(v12, "setRange:", objc_msgSend(v12, "range"), -[__CFString length](v10, "length"));
    v24 = -[__CFString length](v10, "length");
    objc_msgSend(v12, "attributedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v24 - objc_msgSend(v25, "length");

    -[_MKMultiPartLabelMetrics separators](self, "separators");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = a3 + 1;
    v29 = -[_MKMultiPartLabelMetrics _shiftLocationOfStrings:startingAtIndex:shiftValue:](self, "_shiftLocationOfStrings:startingAtIndex:shiftValue:", v27, v28, v26);

    if (v29)
    {
      -[_MKMultiPartLabelMetrics components](self, "components");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_MKMultiPartLabelMetrics _shiftLocationOfStrings:startingAtIndex:shiftValue:](self, "_shiftLocationOfStrings:startingAtIndex:shiftValue:", v30, v28, v26);

    }
    else
    {
LABEL_8:
      v31 = 0;
    }

  }
  return v31;
}

- (BOOL)_shiftLocationOfStrings:(id)a3 startingAtIndex:(unint64_t)a4 shiftValue:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v7 = a3;
  if (objc_msgSend(v7, "count") <= a4)
  {
LABEL_4:
    v11 = 1;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "range") + a5;
      if (v10 < 0)
        break;
      objc_msgSend(v8, "setRange:", v10, v9);

      if (++a4 >= objc_msgSend(v7, "count"))
        goto LABEL_4;
    }

    v11 = 0;
  }

  return v11;
}

- (void)reset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableAttributedString *v20;
  NSMutableAttributedString *attributedString;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[_MKMultiPartLabelMetrics setCurrentSeparatorIndex:](self, "setCurrentSeparatorIndex:", 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[_MKMultiPartLabelMetrics separators](self, "separators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "originalRange");
        objc_msgSend(v8, "setRange:", v9, v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_MKMultiPartLabelMetrics components](self, "components", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        v17 = objc_msgSend(v16, "originalRange");
        objc_msgSend(v16, "setRange:", v17, v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  -[_MKMultiPartLabelMetrics originalAttributedString](self, "originalAttributedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (NSMutableAttributedString *)objc_msgSend(v19, "mutableCopy");
  attributedString = self->_attributedString;
  self->_attributedString = v20;

}

- (NSAttributedString)originalAttributedString
{
  return self->_originalAttributedString;
}

- (NSArray)separators
{
  return self->_separators;
}

- (NSArray)components
{
  return self->_components;
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (unint64_t)currentSeparatorIndex
{
  return self->_currentSeparatorIndex;
}

- (void)setCurrentSeparatorIndex:(unint64_t)a3
{
  self->_currentSeparatorIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_separators, 0);
  objc_storeStrong((id *)&self->_originalAttributedString, 0);
}

@end
