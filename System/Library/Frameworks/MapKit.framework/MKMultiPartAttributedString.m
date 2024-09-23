@implementation MKMultiPartAttributedString

- (MKMultiPartAttributedString)initWithComponents:(id)a3 separators:(id)a4
{
  id v6;
  id v7;
  MKMultiPartAttributedString *v8;
  uint64_t v9;
  NSArray *separators;
  uint64_t v11;
  NSArray *components;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKMultiPartAttributedString;
  v8 = -[MKMultiPartAttributedString init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    separators = v8->_separators;
    v8->_separators = (NSArray *)v9;

    v11 = objc_msgSend(v6, "copy");
    components = v8->_components;
    v8->_components = (NSArray *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithComponents:separators:", self->_components, self->_separators);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  if (!objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    v10 = 0;
    goto LABEL_17;
  }
  -[MKMultiPartAttributedString components](self, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "components"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[MKMultiPartAttributedString components](self, "components");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_14;
    }
    v9 = 1;
  }
  else
  {
    v15 = 0;
    v9 = 0;
  }
  -[MKMultiPartAttributedString separators](self, "separators");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "separators");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = 1;
LABEL_19:

      if ((v9 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  -[MKMultiPartAttributedString separators](self, "separators");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "separators");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "isEqual:", v13);

  if (!v11)
    goto LABEL_19;

  if (v9)
  {
LABEL_13:

  }
LABEL_14:
  if (!v8)

LABEL_17:
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MKMultiPartAttributedString components](self, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MKMultiPartAttributedString separators](self, "separators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MKMultiPartAttributedString components](self, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartAttributedString separators](self, "separators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p\nparts=%@\nseparators =%@\n>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSAttributedString)attributedString
{
  NSAttributedString *attributedString;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSAttributedString *v18;
  NSAttributedString *v19;

  attributedString = self->_attributedString;
  if (!attributedString)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    -[MKMultiPartAttributedString components](self, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      do
      {
        -[MKMultiPartAttributedString components](self, "components");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "appendAttributedString:", v9);
        v10 = v7 + 1;
        -[MKMultiPartAttributedString components](self, "components");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v7 + 1 < v12)
        {
          -[MKMultiPartAttributedString separators](self, "separators");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7 >= objc_msgSend(v13, "count"))
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E20DFC00);
          }
          else
          {
            -[MKMultiPartAttributedString separators](self, "separators");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", v7);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v4, "appendAttributedString:", v15);

        }
        -[MKMultiPartAttributedString components](self, "components");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        v7 = v10;
      }
      while (v10 < v17);
    }
    v18 = (NSAttributedString *)objc_msgSend(v4, "copy");
    v19 = self->_attributedString;
    self->_attributedString = v18;

    attributedString = self->_attributedString;
  }
  return attributedString;
}

- (id)debugDescription
{
  NSAttributedString *attributedString;
  void *v4;
  void *v5;

  attributedString = self->_attributedString;
  if (attributedString)
  {
    -[NSAttributedString debugDescription](attributedString, "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKMultiPartAttributedString components](self, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSArray)components
{
  return self->_components;
}

- (NSArray)separators
{
  return self->_separators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separators, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

+ (id)multiPartAttributedStringWithComponents:(id)a3 repeatedSeparator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v9 = 1;
    do
    {
      objc_msgSend(v8, "addObject:", v7);
      ++v9;
    }
    while (v9 < objc_msgSend(v6, "count"));
  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithComponents:separators:", v6, v8);

  return v10;
}

+ (id)multiPartAttributedStringWithString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithComponents:separators:", v7, MEMORY[0x1E0C9AA60]);

  return v8;
}

+ (id)_mapkit_multiPartAttributedStringForServerFormattedString:(id)a3 defaultAttributes:(id)a4
{
  void *v4;
  id v5;
  id v6;
  MKServerFormattedStringParameters *v7;
  MKServerFormattedString *v8;

  v4 = a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    v7 = -[MKServerFormattedStringParameters initWithInstructionsDistanceDetailLevel:variableOverrides:]([MKServerFormattedStringParameters alloc], "initWithInstructionsDistanceDetailLevel:variableOverrides:", 0, 0);
    v8 = -[MKServerFormattedString initWithGeoServerString:parameters:]([MKServerFormattedString alloc], "initWithGeoServerString:parameters:", v6, v7);

    -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v8, "multiPartAttributedStringWithAttributes:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)_mapkit_multiPartAttributedStringForServerFormattedStrings:(id)a3 defaultAttributes:(id)a4 repeatedSeparator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  MKMultiPartAttributedString *v15;
  void *v16;
  void *v17;
  MKMultiPartAttributedString *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __156__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForServerFormattedStrings_defaultAttributes_repeatedSeparator___block_invoke;
    v20[3] = &unk_1E20DF3B8;
    v13 = v12;
    v21 = v13;
    v22 = v10;
    v25 = a1;
    v23 = v9;
    v14 = v11;
    v24 = v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);
    if (objc_msgSend(v14, "count"))
    {
      v15 = [MKMultiPartAttributedString alloc];
      v16 = (void *)objc_msgSend(v14, "copy");
      v17 = (void *)objc_msgSend(v13, "copy");
      v18 = -[MKMultiPartAttributedString initWithComponents:separators:](v15, "initWithComponents:separators:", v16, v17);

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __156__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForServerFormattedStrings_defaultAttributes_repeatedSeparator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 64), "_mapkit_multiPartAttributedStringForServerFormattedString:defaultAttributes:", v11, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 56);
    objc_msgSend(v5, "components");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "separators");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

  }
}

+ (id)_mapkit_multiPartAttributedStringForComposedStrings:(id)a3 defaultAttributes:(id)a4 repeatedSeparator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  MKMultiPartAttributedString *v14;
  void *v15;
  void *v16;
  MKMultiPartAttributedString *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __149__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForComposedStrings_defaultAttributes_repeatedSeparator___block_invoke;
    v22 = &unk_1E20DF3E0;
    v12 = v11;
    v23 = v12;
    v24 = v9;
    v25 = v8;
    v13 = v10;
    v26 = v13;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v19);
    if (objc_msgSend(v13, "count", v19, v20, v21, v22))
    {
      v14 = [MKMultiPartAttributedString alloc];
      v15 = (void *)objc_msgSend(v13, "copy");
      v16 = (void *)objc_msgSend(v12, "copy");
      v17 = -[MKMultiPartAttributedString initWithComponents:separators:](v14, "initWithComponents:separators:", v15, v16);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __149__MKMultiPartAttributedString_TransitFormattedStringExtras___mapkit_multiPartAttributedStringForComposedStrings_defaultAttributes_repeatedSeparator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  MKServerFormattedString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  v5 = -[MKServerFormattedString initWithComposedString:]([MKServerFormattedString alloc], "initWithComposedString:", v12);
  -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v5, "multiPartAttributedStringWithAttributes:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 56);
    objc_msgSend(v6, "components");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v7, "separators");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

  }
}

@end
