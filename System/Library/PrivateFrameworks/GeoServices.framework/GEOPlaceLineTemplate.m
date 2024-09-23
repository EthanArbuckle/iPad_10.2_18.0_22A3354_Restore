@implementation GEOPlaceLineTemplate

+ (BOOL)isDataItemValid:(id)a3
{
  char *v3;
  int *v4;
  BOOL v5;

  v3 = (char *)a3;
  switch(-[GEOPDDataItem type]((uint64_t)v3))
  {
    case 1u:
      if (!v3)
        goto LABEL_14;
      -[GEOPDDataItem _readRatingData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__ratingData;
      goto LABEL_12;
    case 2u:
      if (!v3)
        goto LABEL_14;
      -[GEOPDDataItem _readCategoryData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__categoryData;
      goto LABEL_12;
    case 3u:
      if (!v3)
        goto LABEL_14;
      -[GEOPDDataItem _readFactoidData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__factoidData;
      goto LABEL_12;
    case 4u:
      if (!v3)
        goto LABEL_14;
      -[GEOPDDataItem _readBusinessHoursData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__businessHoursData;
      goto LABEL_12;
    case 5u:
      if (!v3)
        goto LABEL_14;
      -[GEOPDDataItem _readLocationData]((uint64_t)v3);
      v4 = &OBJC_IVAR___GEOPDDataItem__locationData;
LABEL_12:
      v5 = *(_QWORD *)&v3[*v4] != 0;
      break;
    default:
LABEL_14:
      v5 = 0;
      break;
  }

  return v5;
}

- (GEOPlaceLineTemplate)initWithDataItem:(id)a3 timeZone:(id)a4 attributionMap:(id)a5
{
  id v9;
  id v10;
  id v11;
  GEOPlaceLineTemplate *v12;
  id *p_isa;
  GEOPlaceLineTemplate *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (+[GEOPlaceLineTemplate isDataItemValid:](GEOPlaceLineTemplate, "isDataItemValid:", v9))
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOPlaceLineTemplate;
    v12 = -[GEOPlaceLineTemplate init](&v16, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_attributionMap, a5);
      objc_storeStrong(p_isa + 1, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (GEOBusinessHours)businessHours
{
  GEOBusinessHours *v3;
  id *v4;
  void *v5;
  GEOBusinessHours *v6;

  v3 = [GEOBusinessHours alloc];
  -[GEOPDDataItem businessHoursData]((id *)&self->_dataItem->super.super.isa);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBusinessHoursData businessHours](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOBusinessHours initWithGEOPDBusinessHours:timeZone:](v3, "initWithGEOPDBusinessHours:timeZone:", v5, self->_timeZone);

  return v6;
}

- (NSString)categoryName
{
  return (NSString *)-[GEOPDDataItem categoryName](self->_dataItem, "categoryName");
}

- (GEOFactoid)factoid
{
  GEOFactoid *v3;
  id *v4;
  void *v5;
  GEOFactoid *v6;

  v3 = [GEOFactoid alloc];
  -[GEOPDDataItem factoidData]((id *)&self->_dataItem->super.super.isa);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDFactoidData factoid](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOFactoid initWithFactoid:](v3, "initWithFactoid:", v5);

  return v6;
}

- (NSString)locationName
{
  return (NSString *)-[GEOPDDataItem locationName](self->_dataItem, "locationName");
}

- (GEORatingSummary)ratingSummary
{
  GEORatingSummary *v3;
  void *v4;
  GEORatingSummary *v5;

  v3 = [GEORatingSummary alloc];
  -[GEOPDDataItem ratingData]((id *)&self->_dataItem->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEORatingSummary initWithRatingData:attributionMap:](v3, "initWithRatingData:attributionMap:", v4, self->_attributionMap);

  return v5;
}

- (int)type
{
  unsigned int v2;

  v2 = -[GEOPDDataItem type]((uint64_t)self->_dataItem) - 1;
  if (v2 > 5)
    return 0;
  else
    return dword_189CE3B68[v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_dataItem, 0);
}

@end
