@implementation GEOResultTypeSearchFilter

- (GEOResultTypeSearchFilter)init
{
  GEOResultTypeSearchFilter *result;

  result = (GEOResultTypeSearchFilter *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOResultTypeSearchFilter)initWithResultTypes:(unint64_t)a3
{
  GEOResultTypeSearchFilter *v4;
  GEOResultTypeSearchFilter *v5;
  GEOResultTypeSearchFilter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOResultTypeSearchFilter;
  v4 = -[GEOResultTypeSearchFilter init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_types = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
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
    v9 = -[GEOResultTypeSearchFilter _modern_applyToSearchParameters:error:](self, "_modern_applyToSearchParameters:error:", v8, a4);
  else
    v9 = -[GEOResultTypeSearchFilter _legacy_applyToSearchParameters:error:](self, "_legacy_applyToSearchParameters:error:", v8, a4);
  v10 = v9;

  return v10;
}

- (BOOL)_legacy_applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  GEOPDSSearchFilter *v8;
  unint64_t types;
  _WORD *v10;
  __int16 v11;
  uint64_t v12;
  int v13;
  void *v14;
  int v15;
  BOOL v16;

  v6 = a3;
  v7 = (uint64_t)v6;
  if (!v6 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v6), !*(_QWORD *)(v7 + 240)))
  {
    v8 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v7, v8);

  }
  types = self->_types;
  -[GEOPDSearchParameters searchFilter]((id *)v7);
  v10 = (_WORD *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (v11 = v10[58], v10, (v11 & 1) == 0))
  {
    if ((~(_BYTE)types & 3) == 0)
    {
      -[GEOPDSearchParameters searchFilter]((id *)v7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        *(_WORD *)(v12 + 116) |= 0x400u;
        *(_WORD *)(v12 + 116) |= 1u;
        v13 = 3;
LABEL_23:
        *(_DWORD *)(v12 + 108) = v13;
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    if ((types & 1) != 0)
    {
      -[GEOPDSearchParameters searchFilter]((id *)v7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        *(_WORD *)(v12 + 116) |= 0x400u;
        *(_WORD *)(v12 + 116) |= 1u;
        v13 = 2;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if ((types & 2) != 0)
    {
      -[GEOPDSearchParameters searchFilter]((id *)v7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        *(_WORD *)(v12 + 116) |= 0x400u;
        *(_WORD *)(v12 + 116) |= 1u;
        v13 = 1;
        goto LABEL_23;
      }
LABEL_24:

    }
LABEL_25:
    v16 = 1;
    goto LABEL_26;
  }
  -[GEOPDSearchParameters searchFilter]((id *)v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOPDSSearchFilter searchIntentFilter]((uint64_t)v14);

  if (v15 == 1)
  {
    if ((types & 2) != 0)
      goto LABEL_25;
    if (!a4)
      goto LABEL_13;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("ResultType filter conflicts with previous filter"));
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (v15 != 2 || (types & 1) != 0)
    goto LABEL_25;
  if (a4)
    goto LABEL_20;
LABEL_13:
  v16 = 0;
LABEL_26:

  return v16;
}

- (BOOL)_modern_applyToSearchParameters:(id)a3 error:(id *)a4
{
  id *v5;
  id *v6;
  GEOPDSSearchFilter *v7;
  unint64_t types;

  v5 = (id *)a3;
  v6 = v5;
  if (self->_types)
  {
    -[GEOPDSearchParameters searchFilter](v5);
    v7 = (GEOPDSSearchFilter *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(GEOPDSSearchFilter);
      -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v6, v7);
    }
    types = self->_types;
    if ((types & 1) != 0)
    {
      -[GEOPDSSearchFilter addResultTypeFilter:]((uint64_t)v7);
      types = self->_types;
      if ((types & 2) == 0)
      {
LABEL_6:
        if ((types & 4) == 0)
        {
LABEL_8:

          goto LABEL_9;
        }
LABEL_7:
        -[GEOPDSSearchFilter addResultTypeFilter:]((uint64_t)v7);
        goto LABEL_8;
      }
    }
    else if ((types & 2) == 0)
    {
      goto LABEL_6;
    }
    -[GEOPDSSearchFilter addResultTypeFilter:]((uint64_t)v7);
    if ((self->_types & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_9:

  return 1;
}

- (unint64_t)types
{
  return self->_types;
}

@end
