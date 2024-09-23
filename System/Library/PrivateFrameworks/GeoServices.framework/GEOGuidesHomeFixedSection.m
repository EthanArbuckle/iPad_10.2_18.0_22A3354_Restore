@implementation GEOGuidesHomeFixedSection

- (GEOGuidesHomeFixedSection)initWithGuidesHomeFixedSection:(id)a3 mapsResults:(id)a4
{
  id v7;
  id v8;
  GEOGuidesHomeFixedSection *v9;
  GEOGuidesHomeFixedSection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOGuidesHomeFixedSection;
  v9 = -[GEOGuidesHomeFixedSection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pdFixedSection, a3);
    objc_storeStrong((id *)&v10->_mapsResults, a4);
  }

  return v10;
}

- (int64_t)sectionType
{
  uint64_t v2;

  v2 = -[GEOPDGuidesHomeFixedSection sectionType]((uint64_t)self->_pdFixedSection) - 1;
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

- (NSString)title
{
  return -[GEOPDGuidesHomeFixedSection name]((id *)&self->_pdFixedSection->super.super.isa);
}

- (NSArray)featuredGuides
{
  NSArray *mapsResults;
  void *v4;
  void *v5;
  void *v6;
  GEOMapItemIdentifier *v7;
  void *v8;
  void *v9;
  GEOMapItemIdentifier *v10;
  id v11;
  GEOMapItemIdentifier *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  GEOMapItemIdentifier *v19;
  id v20;
  uint8_t buf[16];

  if (-[GEOGuidesHomeFixedSection sectionType](self, "sectionType") == 1)
  {
    mapsResults = self->_mapsResults;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_166);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](mapsResults, "filteredArrayUsingPredicate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [GEOMapItemIdentifier alloc];
    -[GEOPDGuidesHomeFixedSection featuredGuideIds]((id *)&self->_pdFixedSection->super.super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v7, "initWithMapsIdentifier:", v9);

    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __43__GEOGuidesHomeFixedSection_featuredGuides__block_invoke_2;
    v18 = &unk_1E1C065D0;
    v19 = v10;
    v20 = v6;
    v11 = v6;
    v12 = v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v15);
    v13 = (void *)objc_msgSend(v11, "copy", v15, v16, v17, v18);

    return (NSArray *)v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FEATURED_GUIDES", buf, 2u);
    }
    return (NSArray *)0;
  }
}

uint64_t __43__GEOGuidesHomeFixedSection_featuredGuides__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 2)
    v3 = objc_msgSend(v2, "hasCollection");
  else
    v3 = 0;

  return v3;
}

void __43__GEOGuidesHomeFixedSection_featuredGuides__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  GEOMapItemIdentifier *v6;
  id *v7;
  void *v8;
  GEOMapItemIdentifier *v9;
  GEOCollectionResult *v10;
  void *v11;
  GEOCollectionResult *v12;
  id v13;

  v13 = a2;
  v6 = [GEOMapItemIdentifier alloc];
  objc_msgSend(v13, "collection");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCollectionResult collectionId](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v6, "initWithMapsIdentifier:", v8);

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToGEOMapItemIdentifier:", v9))
  {
    v10 = [GEOCollectionResult alloc];
    objc_msgSend(v13, "collection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOCollectionResult initWithCollectionResult:](v10, "initWithCollectionResult:", v11);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      *a4 = 1;
    }

  }
}

- (NSArray)filters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  if (-[GEOGuidesHomeFixedSection sectionType](self, "sectionType") == 2)
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    -[GEOPDGuidesHomeFixedSection browseByInterestFilters]((id *)&self->_pdFixedSection->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOPDGuidesHomeFixedSection browseByInterestFilters]((id *)&self->_pdFixedSection->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__GEOGuidesHomeFixedSection_filters__block_invoke;
    v10[3] = &unk_1E1C13CD8;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

    v8 = (void *)objc_msgSend(v7, "copy");
    return (NSArray *)v8;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FILTERS", buf, 2u);
    }
    return (NSArray *)0;
  }
}

void __36__GEOGuidesHomeFixedSection_filters__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOGuidesHomeResultFilter *v4;
  GEOGuidesHomeResultFilter *v5;

  v3 = a2;
  v5 = -[GEOGuidesHomeResultFilter initWithGuidesHomeResultFilter:]([GEOGuidesHomeResultFilter alloc], "initWithGuidesHomeResultFilter:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (NSArray)filteredGuides
{
  uint8_t v4[16];

  if (-[GEOGuidesHomeFixedSection sectionType](self, "sectionType") == 3)
  {
    -[GEOGuidesHomeFixedSection guideResultsFromMapResults](self, "guideResultsFromMapResults");
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES", v4, 2u);
    }
    return (NSArray *)0;
  }
}

- (NSArray)filteredGuideIds
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  if (-[GEOGuidesHomeFixedSection sectionType](self, "sectionType") != 3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      return (NSArray *)0;
    v13 = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES";
    v11 = (uint8_t *)&v13;
LABEL_10:
    _os_log_fault_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, v10, v11, 2u);
    return (NSArray *)0;
  }
  -[GEOPDGuidesHomeFixedSection filteredGuideIds]((id *)&self->_pdFixedSection->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      return (NSArray *)0;
    v12 = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Assertion failed: _pdFixedSection.filteredGuideIds.count > 0";
    v11 = (uint8_t *)&v12;
    goto LABEL_10;
  }
  -[GEOPDGuidesHomeFixedSection filteredGuideIds]((id *)&self->_pdFixedSection->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSArray *)v7;
}

- (id)guideResultsFromMapResults
{
  NSArray *mapsResults;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  mapsResults = self->_mapsResults;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_7_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](mapsResults, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__GEOGuidesHomeFixedSection_guideResultsFromMapResults__block_invoke_2;
  v9[3] = &unk_1E1BFF5C8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

uint64_t __55__GEOGuidesHomeFixedSection_guideResultsFromMapResults__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 2)
    v3 = objc_msgSend(v2, "hasCollection");
  else
    v3 = 0;

  return v3;
}

void __55__GEOGuidesHomeFixedSection_guideResultsFromMapResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  GEOCollectionResult *v4;
  void *v5;
  GEOCollectionResult *v6;
  GEOCollectionResult *v7;

  v3 = a2;
  v4 = [GEOCollectionResult alloc];
  objc_msgSend(v3, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GEOCollectionResult initWithCollectionResult:](v4, "initWithCollectionResult:", v5);
  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v6 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResults, 0);
  objc_storeStrong((id *)&self->_pdFixedSection, 0);
}

@end
