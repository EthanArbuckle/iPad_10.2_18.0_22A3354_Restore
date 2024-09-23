@implementation GEOGuidesHomeRepeatableSection

- (GEOGuidesHomeRepeatableSection)initWithGuidesHomeRepeatableSection:(id)a3 mapsResults:(id)a4
{
  id v7;
  id v8;
  GEOGuidesHomeRepeatableSection *v9;
  GEOGuidesHomeRepeatableSection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOGuidesHomeRepeatableSection;
  v9 = -[GEOGuidesHomeRepeatableSection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pdRepeatableSection, a3);
    objc_storeStrong((id *)&v10->_mapsResults, a4);
  }

  return v10;
}

- (NSArray)guideLocations
{
  void *v3;
  void *v4;

  -[GEOPDGuidesHomeRepeatableSection guidesLocationEntrys]((id *)&self->_pdRepeatableSection->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOGuideLocation guideLocationsForEntries:mapsResults:](GEOGuideLocation, "guideLocationsForEntries:mapsResults:", v3, self->_mapsResults);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)curatedGuides
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *mapsResults;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[GEOPDGuidesHomeRepeatableSection carouselGuideIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  mapsResults = self->_mapsResults;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke;
  v18[3] = &unk_1E1BFF5C8;
  v9 = v3;
  v19 = v9;
  -[NSArray enumerateObjectsUsingBlock:](mapsResults, "enumerateObjectsUsingBlock:", v18);
  -[GEOPDGuidesHomeRepeatableSection carouselGuideIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke_2;
  v15[3] = &unk_1E1C21030;
  v16 = v9;
  v17 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  v13 = (void *)objc_msgSend(v11, "copy");
  return (NSArray *)v13;
}

void __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke(uint64_t a1, void *a2)
{
  GEOMapItemIdentifier *v3;
  id *v4;
  void *v5;
  GEOMapItemIdentifier *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "resultType") == 2 && objc_msgSend(v9, "hasCollection"))
  {
    v3 = [GEOMapItemIdentifier alloc];
    objc_msgSend(v9, "collection");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCollectionResult collectionId](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v5);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "collection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

void __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  GEOCollectionResult *v5;
  GEOMapItemIdentifier *v6;

  v3 = a2;
  v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOCollectionResult initWithCollectionResult:]([GEOCollectionResult alloc], "initWithCollectionResult:", v4);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (NSArray)publishers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *mapsResults;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[GEOPDGuidesHomeRepeatableSection publisherIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  mapsResults = self->_mapsResults;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke;
  v18[3] = &unk_1E1BFF5C8;
  v9 = v3;
  v19 = v9;
  -[NSArray enumerateObjectsUsingBlock:](mapsResults, "enumerateObjectsUsingBlock:", v18);
  -[GEOPDGuidesHomeRepeatableSection publisherIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke_2;
  v15[3] = &unk_1E1C21030;
  v16 = v9;
  v17 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  v13 = (void *)objc_msgSend(v11, "copy");
  return (NSArray *)v13;
}

void __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke(uint64_t a1, void *a2)
{
  GEOMapItemIdentifier *v3;
  id *v4;
  void *v5;
  GEOMapItemIdentifier *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "resultType") == 3 && objc_msgSend(v9, "hasPublisher"))
  {
    v3 = [GEOMapItemIdentifier alloc];
    objc_msgSend(v9, "publisher");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPublisherResult publisherId](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v5);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "publisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

void __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  GEOPublisherResult *v5;
  GEOMapItemIdentifier *v6;

  v3 = a2;
  v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPublisherResult initWithPublisherResult:]([GEOPublisherResult alloc], "initWithPublisherResult:", v4);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (int64_t)sectionType
{
  unsigned int v2;

  v2 = -[GEOPDGuidesHomeRepeatableSection sectionType]((uint64_t)self->_pdRepeatableSection) - 1;
  if (v2 > 3)
    return 0;
  else
    return qword_189CE4100[v2];
}

- (int64_t)contentType
{
  int v2;

  v2 = -[GEOPDGuidesHomeRepeatableSection contentType]((uint64_t)self->_pdRepeatableSection);
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (NSString)title
{
  return -[GEOPDGuidesHomeRepeatableSection name]((id *)&self->_pdRepeatableSection->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResults, 0);
  objc_storeStrong((id *)&self->_pdRepeatableSection, 0);
}

@end
