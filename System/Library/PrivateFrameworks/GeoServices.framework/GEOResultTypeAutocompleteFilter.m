@implementation GEOResultTypeAutocompleteFilter

- (GEOResultTypeAutocompleteFilter)init
{
  GEOResultTypeAutocompleteFilter *result;

  result = (GEOResultTypeAutocompleteFilter *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOResultTypeAutocompleteFilter)initWithResultTypes:(unint64_t)a3
{
  GEOResultTypeAutocompleteFilter *v4;
  GEOResultTypeAutocompleteFilter *v5;
  GEOResultTypeAutocompleteFilter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOResultTypeAutocompleteFilter;
  v4 = -[GEOResultTypeAutocompleteFilter init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_types = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  int v6;
  void *v7;
  id v8;
  BOOL v9;
  BOOL v10;

  v6 = MapsFeaturesConfig_UseSearchResultTypeFilter;
  v7 = off_1EDF4B298;
  v8 = a3;
  if (GEOConfigGetBOOL(v6, (uint64_t)v7))
    v9 = -[GEOResultTypeAutocompleteFilter _modern_applyToAutocompleteParameters:error:](self, "_modern_applyToAutocompleteParameters:error:", v8, a4);
  else
    v9 = -[GEOResultTypeAutocompleteFilter _legacy_applyToAutocompleteParameters:error:](self, "_legacy_applyToAutocompleteParameters:error:", v8, a4);
  v10 = v9;

  return v10;
}

- (BOOL)_legacy_applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v6;
  GEOPDAutocompleteFilter *v7;
  unint64_t types;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;

  v6 = a3;
  if ((objc_msgSend(v6, "hasAutocompleteFilter") & 1) == 0)
  {
    v7 = objc_alloc_init(GEOPDAutocompleteFilter);
    objc_msgSend(v6, "setAutocompleteFilter:", v7);

  }
  types = self->_types;
  objc_msgSend(v6, "autocompleteFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "requestedEntryTypesCount");

  if (v10)
  {
    objc_msgSend(v6, "autocompleteFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "requestedEntryTypesCount");

    if (v12)
    {
      v13 = 0;
      while (1)
      {
        objc_msgSend(v6, "autocompleteFilter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "requestedEntryTypeAtIndex:", v13);

        if (!v15)
          goto LABEL_9;
        if (v15 != 2)
          break;
        if ((types & 1) == 0)
        {
LABEL_18:
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("ResultType filter conflicts with previous filter"));
            v20 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = 0;
          }
          goto LABEL_21;
        }
LABEL_12:
        ++v13;
        objc_msgSend(v6, "autocompleteFilter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "requestedEntryTypesCount");

        if (v13 >= v17)
          goto LABEL_13;
      }
      if (v15 != 1)
        goto LABEL_18;
LABEL_9:
      if ((types & 2) == 0)
        goto LABEL_18;
      goto LABEL_12;
    }
  }
LABEL_13:
  objc_msgSend(v6, "autocompleteFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clearRequestedEntryTypes");

  if ((types & 1) != 0)
  {
    objc_msgSend(v6, "autocompleteFilter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addRequestedEntryType:", 2);

  }
  if ((types & 2) != 0)
  {
    objc_msgSend(v6, "autocompleteFilter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1;
    objc_msgSend(v21, "addRequestedEntryType:", 1);

    objc_msgSend(v6, "autocompleteFilter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addRequestedEntryType:", 0);

  }
  else
  {
    v20 = 1;
  }
LABEL_21:

  return v20;
}

- (BOOL)_modern_applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  GEOPDAutocompleteFilter *v7;
  unint64_t types;

  v5 = a3;
  v6 = v5;
  if (self->_types)
  {
    objc_msgSend(v5, "autocompleteFilter");
    v7 = (GEOPDAutocompleteFilter *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(GEOPDAutocompleteFilter);
      objc_msgSend(v6, "setAutocompleteFilter:", v7);
    }
    types = self->_types;
    if ((types & 1) != 0)
    {
      -[GEOPDAutocompleteFilter addResultTypeFilter:](v7, "addResultTypeFilter:", 3);
      types = self->_types;
      if ((types & 2) == 0)
      {
LABEL_6:
        if ((types & 4) == 0)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    else if ((types & 2) == 0)
    {
      goto LABEL_6;
    }
    -[GEOPDAutocompleteFilter addResultTypeFilter:](v7, "addResultTypeFilter:", 1);
    types = self->_types;
    if ((types & 4) == 0)
    {
LABEL_7:
      if ((types & 8) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      -[GEOPDAutocompleteFilter addResultTypeFilter:](v7, "addResultTypeFilter:", 2);
      goto LABEL_9;
    }
LABEL_13:
    -[GEOPDAutocompleteFilter addResultTypeFilter:](v7, "addResultTypeFilter:", 4);
    if ((self->_types & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_10:

  return 1;
}

- (unint64_t)types
{
  return self->_types;
}

@end
