@implementation GEOGuidesHomeResultFilter

- (GEOGuidesHomeResultFilter)initWithGuidesHomeResultFilter:(id)a3
{
  id v5;
  GEOGuidesHomeResultFilter *v6;
  GEOGuidesHomeResultFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOGuidesHomeResultFilter;
  v6 = -[GEOGuidesHomeResultFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resultFilter, a3);

  return v7;
}

- (int64_t)filterType
{
  return -[GEOPDGuidesHomeResultFilter filterType]((uint64_t)self->_resultFilter) != 0;
}

- (GEOGuidesHomeResultFilterTypeConcept)conceptFilter
{
  GEOGuidesHomeResultFilterTypeConcept *v3;
  void *v4;
  GEOGuidesHomeResultFilterTypeConcept *v5;
  uint8_t v7[16];

  if (-[GEOPDGuidesHomeResultFilter filterType]((uint64_t)self->_resultFilter) == 1)
  {
    v3 = [GEOGuidesHomeResultFilterTypeConcept alloc];
    -[GEOPDGuidesHomeResultFilter filterConcept]((id *)&self->_resultFilter->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[GEOGuidesHomeResultFilterTypeConcept initWithGuidesHomeResultFilterTypeConcept:](v3, "initWithGuidesHomeResultFilterTypeConcept:", v4);

    return v5;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _resultFilter.filterType == GEOPDGuidesHomeResultFilterType_GUIDES_HOME_RESULT_FILTER_TYPE_CONCEPT", v7, 2u);
    }
    return (GEOGuidesHomeResultFilterTypeConcept *)0;
  }
}

- (GEOPDGuidesHomeResultFilter)pdResultFilter
{
  return self->_resultFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFilter, 0);
}

@end
