@implementation GEOGuidesHomeResult

- (GEOGuidesHomeResult)initWithGuidesHomeFixedSection:(id)a3 mapsResults:(id)a4
{
  id v7;
  id v8;
  GEOGuidesHomeResult *v9;
  GEOGuidesHomeResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOGuidesHomeResult;
  v9 = -[GEOGuidesHomeResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pdGuideHomeResult, a3);
    objc_storeStrong((id *)&v10->_mapsResults, a4);
  }

  return v10;
}

- (id)guideLocationName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSArray *mapsResults;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  mapsResults = self->_mapsResults;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __41__GEOGuidesHomeResult_guideLocationName___block_invoke;
  v15[3] = &unk_1E1BFF5C8;
  v8 = v6;
  v16 = v8;
  -[NSArray enumerateObjectsUsingBlock:](mapsResults, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(v5, "guideLocationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "place");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bestLocalizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __41__GEOGuidesHomeResult_guideLocationName___block_invoke(uint64_t a1, void *a2)
{
  GEOMapItemIdentifier *v3;
  void *v4;
  void *v5;
  GEOMapItemIdentifier *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "resultType") == 1 && objc_msgSend(v7, "hasPlace"))
  {
    v3 = [GEOMapItemIdentifier alloc];
    objc_msgSend(v7, "place");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
  }

}

- (GEOGuidesHomeFixedSection)featuredGuidesSection
{
  GEOPDGuidesHomeResult *pdGuideHomeResult;
  GEOGuidesHomeFixedSection *v4;
  void *v5;
  GEOGuidesHomeFixedSection *v6;

  pdGuideHomeResult = self->_pdGuideHomeResult;
  if (pdGuideHomeResult
    && (-[GEOPDGuidesHomeResult _readFeaturedGuides]((uint64_t)self->_pdGuideHomeResult),
        pdGuideHomeResult->_featuredGuides))
  {
    v4 = [GEOGuidesHomeFixedSection alloc];
    -[GEOPDGuidesHomeResult featuredGuides]((id *)&self->_pdGuideHomeResult->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOGuidesHomeFixedSection initWithGuidesHomeFixedSection:mapsResults:](v4, "initWithGuidesHomeFixedSection:mapsResults:", v5, self->_mapsResults);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (GEOGuidesHomeFixedSection)filtersSection
{
  GEOPDGuidesHomeResult *pdGuideHomeResult;
  GEOGuidesHomeFixedSection *v4;
  void *v5;
  GEOGuidesHomeFixedSection *v6;

  pdGuideHomeResult = self->_pdGuideHomeResult;
  if (pdGuideHomeResult
    && (-[GEOPDGuidesHomeResult _readFilters]((uint64_t)self->_pdGuideHomeResult), pdGuideHomeResult->_filters))
  {
    v4 = [GEOGuidesHomeFixedSection alloc];
    -[GEOPDGuidesHomeResult filters]((id *)&self->_pdGuideHomeResult->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOGuidesHomeFixedSection initWithGuidesHomeFixedSection:mapsResults:](v4, "initWithGuidesHomeFixedSection:mapsResults:", v5, self->_mapsResults);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (GEOGuidesHomeFixedSection)filteredGuidesSection
{
  void *v3;
  GEOGuidesHomeFixedSection *v4;
  void *v5;
  GEOGuidesHomeFixedSection *v6;

  -[GEOPDGuidesHomeResult filteredGuides]((id *)&self->_pdGuideHomeResult->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [GEOGuidesHomeFixedSection alloc];
    -[GEOPDGuidesHomeResult filteredGuides]((id *)&self->_pdGuideHomeResult->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOGuidesHomeFixedSection initWithGuidesHomeFixedSection:mapsResults:](v4, "initWithGuidesHomeFixedSection:mapsResults:", v5, self->_mapsResults);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)repeatableSections
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  GEOGuidesHomeResult *v13;
  id v14;

  -[GEOPDGuidesHomeResult repeatableSections]((id *)&self->_pdGuideHomeResult->super.super.isa);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[GEOPDGuidesHomeResult repeatableSections]((id *)&self->_pdGuideHomeResult->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v7 = 0;
      return (NSArray *)v7;
    }
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[GEOPDGuidesHomeResult repeatableSections]((id *)&self->_pdGuideHomeResult->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __41__GEOGuidesHomeResult_repeatableSections__block_invoke;
    v12 = &unk_1E1C21F38;
    v13 = self;
    v14 = v5;
    v3 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v9);

    v7 = (void *)objc_msgSend(v3, "copy", v9, v10, v11, v12, v13);
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

void __41__GEOGuidesHomeResult_repeatableSections__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOGuidesHomeRepeatableSection *v4;
  GEOGuidesHomeRepeatableSection *v5;

  v3 = a2;
  v5 = -[GEOGuidesHomeRepeatableSection initWithGuidesHomeRepeatableSection:mapsResults:]([GEOGuidesHomeRepeatableSection alloc], "initWithGuidesHomeRepeatableSection:mapsResults:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResults, 0);
  objc_storeStrong((id *)&self->_pdGuideHomeResult, 0);
}

@end
