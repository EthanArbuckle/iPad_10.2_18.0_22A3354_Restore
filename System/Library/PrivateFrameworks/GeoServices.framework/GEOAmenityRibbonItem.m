@implementation GEOAmenityRibbonItem

- (GEOAmenityRibbonItem)initWithRibbonItem:(id)a3
{
  id v5;
  GEOAmenityRibbonItem *v6;
  GEOAmenityRibbonItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAmenityRibbonItem;
  v6 = -[GEOAmenityRibbonItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_amenityItem, a3);

  return v7;
}

- (NSArray)indexesWithinAmenityComponent
{
  id v3;
  unint64_t i;
  GEOPDAmenityRibbonItem *amenityItem;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    amenityItem = self->_amenityItem;
    v6 = amenityItem ? amenityItem->_amenityItemIndexs.count : 0;
    if (i >= v6)
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GEOPDAmenityRibbonItem amenityItemIndexAtIndex:]((uint64_t)amenityItem, i));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  GEOGetPlaceCardLayoutLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Amenity ribbon item has the following component indices: %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amenityItem, 0);
}

@end
