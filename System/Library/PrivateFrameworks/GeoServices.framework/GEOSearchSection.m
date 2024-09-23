@implementation GEOSearchSection

- (GEOSearchSection)init
{
  GEOSearchSection *result;

  result = (GEOSearchSection *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSearchSection)initWithName:(id)a3 sectionType:(int64_t)a4 sectionGuide:(id)a5 sectionPlace:(id)a6
{
  id v11;
  id v12;
  id v13;
  GEOSearchSection *v14;
  GEOSearchSection *v15;
  GEOSearchSection *v16;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a4)
  {
    v18.receiver = self;
    v18.super_class = (Class)GEOSearchSection;
    v14 = -[GEOSearchSection init](&v18, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_name, a3);
      v15->_sectionType = a4;
      objc_storeStrong((id *)&v15->_sectionGuide, a5);
      objc_storeStrong((id *)&v15->_sectionPlace, a6);
    }
    self = v15;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (GEOSearchSection)initWithSearchSection:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  int v9;
  GEOSearchSectionGuide *v10;
  void *v11;
  GEOSearchSectionGuide *v12;
  GEOSearchSectionPlace *v13;
  void *v14;
  GEOSearchSectionPlace *v15;
  uint64_t v16;
  GEOSearchSection *v17;

  v6 = (id *)a3;
  v7 = a4;
  -[GEOPDSearchSection name](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOPDSearchSection sectionType]((uint64_t)v6);
  if (v6)
  {
    -[GEOPDSearchSection _readSectionGuide]((uint64_t)v6);
    if (v6[4])
    {
      v10 = [GEOSearchSectionGuide alloc];
      -[GEOPDSearchSection sectionGuide](v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOSearchSectionGuide initWithSearchSectionGuide:mapsResults:](v10, "initWithSearchSectionGuide:mapsResults:", v11, v7);

    }
    else
    {
      v12 = 0;
    }
    -[GEOPDSearchSection _readSectionPlace]((uint64_t)v6);
    if (v6[5])
    {
      v13 = [GEOSearchSectionPlace alloc];
      -[GEOPDSearchSection sectionPlace](v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[GEOSearchSectionPlace initWithSearchSectionPlace:](v13, "initWithSearchSectionPlace:", v14);

      goto LABEL_9;
    }
  }
  else
  {
    v12 = 0;
  }
  v15 = 0;
LABEL_9:
  if (v9 == 1)
    v16 = 1;
  else
    v16 = 2 * (v9 == 2);
  v17 = -[GEOSearchSection initWithName:sectionType:sectionGuide:sectionPlace:](self, "initWithName:sectionType:sectionGuide:sectionPlace:", v8, v16, v12, v15);

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (GEOSearchSectionGuide)sectionGuide
{
  return self->_sectionGuide;
}

- (GEOSearchSectionPlace)sectionPlace
{
  return self->_sectionPlace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionPlace, 0);
  objc_storeStrong((id *)&self->_sectionGuide, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
