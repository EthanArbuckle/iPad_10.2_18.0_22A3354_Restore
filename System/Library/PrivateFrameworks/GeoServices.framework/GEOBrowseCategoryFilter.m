@implementation GEOBrowseCategoryFilter

- (GEOBrowseCategoryFilter)init
{
  GEOBrowseCategoryFilter *result;

  result = (GEOBrowseCategoryFilter *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOBrowseCategoryFilter)initWithCategory:(id)a3
{
  id v5;
  GEOBrowseCategoryFilter *v6;
  GEOBrowseCategoryFilter *v7;
  GEOBrowseCategoryFilter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOBrowseCategoryFilter;
  v6 = -[GEOBrowseCategoryFilter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  __CFString *v11;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "requestType") == 3)
  {
    objc_msgSend(v5, "allEntriesWithBrowse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOSearchCategory _suggestionEntryMetadata](self->_category, "_suggestionEntryMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCategorySuggestionEntryMetadata:", v7);

    -[GEOSearchCategory _autocompleteEntry](self->_category, "_autocompleteEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCategorySuggestionEntry:", v8);

  }
  else
  {
    GEOGetPlaceRequestLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v5, "requestType");
      if (v10 >= 0xB)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E1C0CE90[(int)v10];
      }
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Filtering based on a Nearby category is not supported for %{public}@ requests", buf, 0xCu);

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NO", buf, 2u);
    }
  }

  return 1;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (-[GEOPDSearchParameters searchType]((uint64_t)v5) != 2)
  {
    -[GEOSearchCategory _suggestionEntryMetadata](self->_category, "_suggestionEntryMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setSuggestionEntryMetadata:]((uint64_t)v5, v6);

    -[GEOSearchCategory _autocompleteEntry](self->_category, "_autocompleteEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setSuggestionEntry:]((uint64_t)v5, v7);

  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
