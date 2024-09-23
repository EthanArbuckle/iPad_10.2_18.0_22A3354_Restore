@implementation GEOAllCollectionsViewResultFilter

- (GEOAllCollectionsViewResultFilter)initWithAllCollectionsViewResultFilter:(id)a3 withPlaces:(id)a4
{
  _BYTE *v7;
  id v8;
  GEOAllCollectionsViewResultFilter *v9;
  GEOAllCollectionsViewResultFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOAllCollectionsViewResultFilter;
  v9 = -[GEOAllCollectionsViewResultFilter init](&v12, sel_init);
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      -[GEOPDAllCollectionsViewResultFilter _readFilterAddress]((uint64_t)v7);
      if (*((_QWORD *)v7 + 3)
        || (-[GEOPDAllCollectionsViewResultFilter _readFilterKeyword]((uint64_t)v7), *((_QWORD *)v7 + 4)))
      {
        if ((v7[56] & 1) != 0)
        {
          objc_storeStrong((id *)&v10->_resultFilter, a3);
          objc_storeStrong((id *)&v10->_places, a4);
        }
      }
    }
  }

  return v10;
}

- (int64_t)filterType
{
  int64_t result;

  LODWORD(result) = -[GEOPDAllCollectionsViewResultFilter filterType]((uint64_t)self->_resultFilter);
  if (result >= 3)
    return 0;
  else
    return result;
}

- (GEOAllCollectionsViewResultFilterTypeAddress)addressFilter
{
  GEOAllCollectionsViewResultFilterTypeAddress *v3;
  void *v4;
  GEOAllCollectionsViewResultFilterTypeAddress *v5;
  uint8_t v7[16];

  if (-[GEOPDAllCollectionsViewResultFilter filterType]((uint64_t)self->_resultFilter) == 1)
  {
    v3 = [GEOAllCollectionsViewResultFilterTypeAddress alloc];
    -[GEOPDAllCollectionsViewResultFilter filterAddress]((id *)&self->_resultFilter->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[GEOAllCollectionsViewResultFilterTypeAddress initWithFilterAddressIdentifier:withPlaces:](v3, "initWithFilterAddressIdentifier:withPlaces:", v4, self->_places);

    return v5;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _resultFilter.filterType == GEOPDAllCollectionsViewResultFilterType_ALL_COLLECTIONS_VIEW_RESULT_FILTER_TYPE_ADDRESS", v7, 2u);
    }
    return (GEOAllCollectionsViewResultFilterTypeAddress *)0;
  }
}

- (GEOAllCollectionsViewResultFilterTypeKeyword)keywordFilter
{
  GEOAllCollectionsViewResultFilterTypeKeyword *v3;
  void *v4;
  GEOAllCollectionsViewResultFilterTypeKeyword *v5;
  uint8_t v7[16];

  if (-[GEOPDAllCollectionsViewResultFilter filterType]((uint64_t)self->_resultFilter) == 2)
  {
    v3 = [GEOAllCollectionsViewResultFilterTypeKeyword alloc];
    -[GEOPDAllCollectionsViewResultFilter filterKeyword]((id *)&self->_resultFilter->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[GEOAllCollectionsViewResultFilterTypeKeyword initWithFilterKeywordIdentifier:](v3, "initWithFilterKeywordIdentifier:", v4);

    return v5;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _resultFilter.filterType == GEOPDAllCollectionsViewResultFilterType_ALL_COLLECTIONS_VIEW_RESULT_FILTER_TYPE_KEYWORD", v7, 2u);
    }
    return (GEOAllCollectionsViewResultFilterTypeKeyword *)0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_resultFilter, 0);
}

@end
