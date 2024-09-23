@implementation GEOAddressFilter

+ (id)filterIncludingAllOptions
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptionsToInclude:optionsToExclude:", -1, 0);
}

+ (id)filterExcludingAllOptions
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptionsToInclude:optionsToExclude:", 0, -1);
}

- (GEOAddressFilter)initWithOptionsToInclude:(unint64_t)a3 optionsToExclude:(unint64_t)a4
{
  GEOAddressFilter *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAddressFilter;
  result = -[GEOAddressFilter init](&v7, sel_init);
  if (result)
  {
    result->_optionsToInclude = a3;
    result->_optionsToExclude = a4;
  }
  return result;
}

- (BOOL)_applyToSubTypeFilter:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  const __CFString *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 0;
  v7 = 0;
  v8 = MEMORY[0x1E0C81028];
  while (1)
  {
    v9 = _applyToSubTypeFilter_error__allOptions[v7];
    v10 = self->_optionsToInclude & v9;
    v11 = self->_optionsToExclude & v9;
    if (v10 | v11)
      break;
LABEL_28:
    v6 = v7++ > 4;
    if (v7 == 6)
    {
      v6 = 1;
      goto LABEL_47;
    }
  }
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    switch(v9)
    {
      case 0:
      case 8:
        if (!v10)
          goto LABEL_26;
        goto LABEL_24;
      case 1:
        if (!v10)
          goto LABEL_26;
        goto LABEL_24;
      case 2:
        if (!v10)
          goto LABEL_26;
        goto LABEL_24;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        if (!v10)
          goto LABEL_26;
        goto LABEL_24;
      default:
        if (v9 == 16)
        {
          if (v10)
            goto LABEL_24;
        }
        else if (v9 == 32)
        {
          if (v10)
            goto LABEL_24;
        }
        else
        {
LABEL_15:
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v22) = v9;
            _os_log_fault_impl(&dword_1885A9000, v8, OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid single option: %#x", buf, 8u);
          }
          if (v10)
          {
LABEL_24:
            -[GEOPDAddressResultSubTypeFilter addIncludeAddressSubTypeFilter:]((uint64_t)v5);
            goto LABEL_28;
          }
        }
LABEL_26:
        if (v11)
          -[GEOPDAddressResultSubTypeFilter addExcludeAddressSubTypeFilter:]((uint64_t)v5);
        break;
    }
    goto LABEL_28;
  }
  v13 = CFSTR("<none>");
  v14 = a4;
  switch(v9)
  {
    case 0:
      break;
    case 1:
      v13 = CFSTR("Country");
      break;
    case 2:
      v13 = CFSTR("AdministrativeArea");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_35;
    case 4:
      v13 = CFSTR("SubAdministrativeArea");
      break;
    case 8:
      v13 = CFSTR("Locality");
      break;
    default:
      v14 = a4;
      if (v9 == 16)
      {
        v13 = CFSTR("SubLocality");
      }
      else if (v9 == 32)
      {
        v13 = CFSTR("PostalCode");
      }
      else
      {
LABEL_35:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v9;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid single option: %#x", buf, 8u);
        }
        v13 = CFSTR("<invalid>");
      }
      break;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Option %@ is both included and excluded"), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "GEOErrorWithCode:reason:", -12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  GEOGetPlaceRequestLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_FAULT, "Invalid GEOAddressFilter: option %@ is both included and excluded", buf, 0xCu);
  }

  if (v14)
    *v14 = objc_retainAutorelease(v17);

LABEL_47:
  return v6;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id *v6;
  id *v7;
  GEOPDSSearchFilter *v8;
  GEOPDAddressResultSubTypeFilter *v9;
  BOOL v11;

  v6 = (id *)a3;
  v7 = v6;
  if (*(_OWORD *)&self->_optionsToInclude == 0)
  {
    v11 = 1;
  }
  else
  {
    -[GEOPDSearchParameters searchFilter](v6);
    v8 = (GEOPDSSearchFilter *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(GEOPDSSearchFilter);
      -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v7, v8);
    }
    -[GEOPDSSearchFilter addressResultSubTypeFilter]((id *)&v8->super.super.isa);
    v9 = (GEOPDAddressResultSubTypeFilter *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(GEOPDAddressResultSubTypeFilter);
      -[GEOPDSSearchFilter setAddressResultSubTypeFilter:]((uint64_t)v8, v9);
    }
    v11 = -[GEOAddressFilter _applyToSubTypeFilter:error:](self, "_applyToSubTypeFilter:error:", v9, a4);

  }
  return v11;
}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  GEOPDAutocompleteFilter *v8;
  GEOPDAddressResultSubTypeFilter *v9;
  BOOL v11;

  v6 = a3;
  v7 = v6;
  if (*(_OWORD *)&self->_optionsToInclude == 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v6, "autocompleteFilter");
    v8 = (GEOPDAutocompleteFilter *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(GEOPDAutocompleteFilter);
      objc_msgSend(v7, "setAutocompleteFilter:", v8);
    }
    -[GEOPDAutocompleteFilter addressResultSubTypeFilter](v8, "addressResultSubTypeFilter");
    v9 = (GEOPDAddressResultSubTypeFilter *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(GEOPDAddressResultSubTypeFilter);
      -[GEOPDAutocompleteFilter setAddressResultSubTypeFilter:](v8, "setAddressResultSubTypeFilter:", v9);
    }
    v11 = -[GEOAddressFilter _applyToSubTypeFilter:error:](self, "_applyToSubTypeFilter:error:", v9, a4);

  }
  return v11;
}

- (unint64_t)optionsToInclude
{
  return self->_optionsToInclude;
}

- (unint64_t)optionsToExclude
{
  return self->_optionsToExclude;
}

@end
