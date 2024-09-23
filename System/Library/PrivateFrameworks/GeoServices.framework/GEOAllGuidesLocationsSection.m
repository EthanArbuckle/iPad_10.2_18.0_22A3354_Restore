@implementation GEOAllGuidesLocationsSection

- (GEOAllGuidesLocationsSection)initWithAllGuidesLocationSection:(id)a3 mapsResults:(id)a4
{
  id *v7;
  id v8;
  GEOAllGuidesLocationsSection *v9;
  void *v10;
  _QWORD *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  GEOAllGuidesLocationsSection *v15;
  objc_super v17;

  v7 = (id *)a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOAllGuidesLocationsSection;
  v9 = -[GEOAllGuidesLocationsSection init](&v17, sel_init);
  if (v9)
  {
    -[GEOPDAllGuidesLocationsSection entrys](v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v11 && (-[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)v11), v11[9]))
    {
      v9->_isWorldwideSection = 1;
    }
    else
    {
      if (v7)
      {
        -[GEOPDAllGuidesLocationsSection _readSectionHeader]((uint64_t)v7);
        v12 = v7[4] != 0;
      }
      else
      {
        v12 = 0;
      }
      -[GEOPDAllGuidesLocationsSection sectionHeader](v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[GEOPDAllGuidesLocationsSectionHeader sectionHeaderType]((uint64_t)v13);

      if (!v12 || !v14)
      {

        v15 = 0;
        goto LABEL_11;
      }
    }
    objc_storeStrong((id *)&v9->_section, a3);
    objc_storeStrong((id *)&v9->_mapsResults, a4);

  }
  v15 = v9;
LABEL_11:

  return v15;
}

- (NSString)sectionTitle
{
  void *v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  GEOPDPlace *v10;
  GEOPDPlace *place;
  void *v12;

  -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (-[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)v4), !v4[9]))
  {
    -[GEOPDAllGuidesLocationsSection sectionHeader]((id *)&self->_section->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOPDAllGuidesLocationsSectionHeader sectionHeaderType]((uint64_t)v5);

    if (v6 == 2)
    {
      if (!self->_place)
      {
        -[GEOAllGuidesLocationsSection placeResultForSection:mapsResults:](self, "placeResultForSection:mapsResults:", self->_section, self->_mapsResults);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "place");
        v10 = (GEOPDPlace *)objc_claimAutoreleasedReturnValue();
        place = self->_place;
        self->_place = v10;

        +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_place);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bestLocalizedString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bestLocalizedString");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = (void *)v8;
LABEL_11:

      goto LABEL_12;
    }
    if (v6 == 1)
    {
      -[GEOPDAllGuidesLocationsSection sectionHeader]((id *)&self->_section->super.super.isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAllGuidesLocationsSectionHeader headerString]((id *)v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_12:

  return (NSString *)v9;
}

- (NSArray)guideLocationIdentifiers
{
  void *v2;
  void *v3;

  -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_87);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

GEOMapItemIdentifier *__56__GEOAllGuidesLocationsSection_guideLocationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;

  v2 = a2;
  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDGuidesLocationEntry placeId](v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v4);
  return v5;
}

- (NSDictionary)pdGuideLocationEntries
{
  NSDictionary *entriesDictionary;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  _QWORD v13[4];
  id v14;

  if (-[GEOAllGuidesLocationsSection isWorldwideSection](self, "isWorldwideSection"))
    return (NSDictionary *)0;
  entriesDictionary = self->_entriesDictionary;
  if (entriesDictionary)
    return entriesDictionary;
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__GEOAllGuidesLocationsSection_pdGuideLocationEntries__block_invoke;
  v13[3] = &unk_1E1BFF5A0;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v10 = (NSDictionary *)objc_msgSend(v9, "copy");
  v11 = self->_entriesDictionary;
  self->_entriesDictionary = v10;

  v12 = self->_entriesDictionary;
  return v12;
}

void __54__GEOAllGuidesLocationsSection_pdGuideLocationEntries__block_invoke(uint64_t a1, void *a2)
{
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;
  id *v6;

  v6 = a2;
  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDGuidesLocationEntry placeId](v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);

}

- (NSArray)guideLocations
{
  void *v3;
  void *v4;

  -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOGuideLocation guideLocationsForEntries:mapsResults:](GEOGuideLocation, "guideLocationsForEntries:mapsResults:", v3, self->_mapsResults);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)placeResultForSection:(id)a3 mapsResults:(id)a4
{
  id *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = (id *)a3;
  v6 = a4;
  -[GEOPDAllGuidesLocationsSection sectionHeader](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__43;
  v18 = __Block_byref_object_dispose__43;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__GEOAllGuidesLocationsSection_placeResultForSection_mapsResults___block_invoke;
  v11[3] = &unk_1E1C06B00;
  v8 = v7;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __66__GEOAllGuidesLocationsSection_placeResultForSection_mapsResults___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  GEOMapItemIdentifier *v8;
  void *v9;
  void *v10;
  GEOMapItemIdentifier *v11;
  GEOMapItemIdentifier *v12;
  void *v13;
  GEOMapItemIdentifier *v14;
  id v15;

  v15 = a2;
  if (objc_msgSend(v15, "resultType") == 1)
  {
    if (objc_msgSend(v15, "hasPlace"))
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        -[GEOPDAllGuidesLocationsSectionHeader _readPlaceId](*(_QWORD *)(a1 + 32));
        if (*(_QWORD *)(v7 + 32))
        {
          v8 = [GEOMapItemIdentifier alloc];
          objc_msgSend(v15, "place");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapsId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v8, "initWithMapsIdentifier:", v10);

          v12 = [GEOMapItemIdentifier alloc];
          -[GEOPDAllGuidesLocationsSectionHeader placeId](*(id **)(a1 + 32));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v12, "initWithMapsIdentifier:", v13);

          if (-[GEOMapItemIdentifier isEqualToGEOMapItemIdentifier:](v11, "isEqualToGEOMapItemIdentifier:", v14))
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
            *a4 = 1;
          }

        }
      }
    }
  }

}

- (BOOL)isWorldwideSection
{
  return self->_isWorldwideSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_entriesDictionary, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_mapsResults, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

@end
