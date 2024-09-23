@implementation GEOPlaceTemplate

- (GEOMapItemIdentifier)mapItemIdentifier
{
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;

  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDTemplateData mapsId]((id *)&self->_templateData->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v4);

  return v5;
}

- (GEOPlaceTemplate)initWithPlaceTemplate:(id)a3 attributionMap:(id)a4
{
  id *v7;
  id v8;
  void *v9;
  GEOPlaceTemplate *v10;
  GEOPlaceTemplate *v11;
  id v12;
  id *v13;
  void *v14;
  uint64_t v15;
  NSTimeZone *timeZone;
  GEOPlaceTemplate *v17;
  objc_super v19;

  v7 = (id *)a3;
  v8 = a4;
  -[GEOPDTemplateData mapsId](v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)GEOPlaceTemplate;
    v10 = -[GEOPlaceTemplate init](&v19, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_templateData, a3);
      v12 = objc_alloc(MEMORY[0x1E0C99E80]);
      -[GEOPDTemplateData timezone]((id *)&v11->_templateData->super.super.isa);
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOTimezone identifier](v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "initWithName:", v14);
      timeZone = v11->_timeZone;
      v11->_timeZone = (NSTimeZone *)v15;

      objc_storeWeak((id *)&v11->_attributionMap, v8);
    }
    self = v11;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (GEOPlaceTemplate)initWithIdentifier:(id)a3 supportsAreaHighlight:(BOOL)a4
{
  id v6;
  GEOPDTemplateData *v7;
  GEOPlaceTemplate *v8;

  v6 = a3;
  v7 = objc_alloc_init(GEOPDTemplateData);
  -[GEOPDTemplateData setMapsId:]((uint64_t)v7, v6);

  if (v7)
  {
    *(_WORD *)&v7->_flags |= 0x200u;
    *(_WORD *)&v7->_flags |= 1u;
    v7->_areaHighlight = a4;
  }
  v8 = -[GEOPlaceTemplate initWithPlaceTemplate:attributionMap:](self, "initWithPlaceTemplate:attributionMap:", v7, 0);

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attributionMap);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_templateData, 0);
}

- (BOOL)supportsAreaHighlight
{
  GEOPDTemplateData *templateData;

  templateData = self->_templateData;
  return templateData && templateData->_areaHighlight;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  GEOFeatureStyleAttributes *v3;
  void *v4;
  GEOFeatureStyleAttributes *v5;

  v3 = [GEOFeatureStyleAttributes alloc];
  -[GEOPDTemplateData poiIcon]((id *)&self->_templateData->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOFeatureStyleAttributes initWithPlaceDataStyleAttributes:](v3, "initWithPlaceDataStyleAttributes:", v4);

  return v5;
}

- (NSString)placeName
{
  return (NSString *)-[GEOPDTemplateData placeName](self->_templateData, "placeName");
}

- (GEOPlaceLineTemplate)subtitleLine
{
  GEOPlaceLineTemplate *v3;
  void *v4;
  NSTimeZone *timeZone;
  id WeakRetained;
  GEOPlaceLineTemplate *v7;

  v3 = [GEOPlaceLineTemplate alloc];
  -[GEOPDTemplateData subtitle]((id *)&self->_templateData->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  WeakRetained = objc_loadWeakRetained((id *)&self->_attributionMap);
  v7 = -[GEOPlaceLineTemplate initWithDataItem:timeZone:attributionMap:](v3, "initWithDataItem:timeZone:attributionMap:", v4, timeZone, WeakRetained);

  return v7;
}

- (GEOPlaceLineTemplate)footerLine
{
  GEOPlaceLineTemplate *v3;
  void *v4;
  NSTimeZone *timeZone;
  id WeakRetained;
  GEOPlaceLineTemplate *v7;

  v3 = [GEOPlaceLineTemplate alloc];
  -[GEOPDTemplateData footer]((id *)&self->_templateData->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  WeakRetained = objc_loadWeakRetained((id *)&self->_attributionMap);
  v7 = -[GEOPlaceLineTemplate initWithDataItem:timeZone:attributionMap:](v3, "initWithDataItem:timeZone:attributionMap:", v4, timeZone, WeakRetained);

  return v7;
}

- (GEOMapItemPhoto)heroImage
{
  _GEOPlaceDataPhoto *v3;
  void *v4;
  _GEOPlaceDataPhoto *v5;

  v3 = [_GEOPlaceDataPhoto alloc];
  -[GEOPDTemplateData photo]((id *)&self->_templateData->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_GEOPlaceDataPhoto initWithPhoto:](v3, "initWithPhoto:", v4);

  return (GEOMapItemPhoto *)v5;
}

- (BOOL)hasRichData
{
  return self->_hasRichData;
}

@end
