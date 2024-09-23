@implementation GEOComposedRouteAdvisoryItemDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteAdvisoryItemDetail)initWithRestrictionDetails:(id)a3
{
  id v4;
  GEOComposedRouteAdvisoryItemDetail *v5;
  void *v6;
  uint64_t v7;
  GEOServerFormattedString *title;
  GEOComposedString *v9;
  void *v10;
  uint64_t v11;
  GEOComposedString *titleString;
  void *v13;
  uint64_t v14;
  NSArray *details;
  void *v16;
  uint64_t v17;
  NSArray *detailStrings;
  GEOComposedRouteAdvisoryItemDetail *v19;
  objc_super v21;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)GEOComposedRouteAdvisoryItemDetail;
    v5 = -[GEOComposedRouteAdvisoryItemDetail init](&v21, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      title = v5->_title;
      v5->_title = (GEOServerFormattedString *)v7;

      v9 = [GEOComposedString alloc];
      objc_msgSend(v4, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[GEOComposedString initWithGeoFormattedString:](v9, "initWithGeoFormattedString:", v10);
      titleString = v5->_titleString;
      v5->_titleString = (GEOComposedString *)v11;

      objc_msgSend(v4, "messageStrings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      details = v5->_details;
      v5->_details = (NSArray *)v14;

      objc_msgSend(v4, "messageStrings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_geo_map:", &__block_literal_global_23);
      v17 = objc_claimAutoreleasedReturnValue();
      detailStrings = v5->_detailStrings;
      v5->_detailStrings = (NSArray *)v17;

    }
    self = v5;
    v19 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: restrictionDetails", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

GEOComposedString *__65__GEOComposedRouteAdvisoryItemDetail_initWithRestrictionDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

- (GEOComposedRouteAdvisoryItemDetail)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteAdvisoryItemDetail *v5;
  uint64_t v6;
  GEOServerFormattedString *title;
  uint64_t v8;
  GEOComposedString *titleString;
  uint64_t v10;
  NSArray *details;
  uint64_t v12;
  NSArray *detailStrings;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedRouteAdvisoryItemDetail;
  v5 = -[GEOComposedRouteAdvisoryItemDetail init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (GEOServerFormattedString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleString"));
    v8 = objc_claimAutoreleasedReturnValue();
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_details"));
    v10 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (NSArray *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_detailStrings"));
    v12 = objc_claimAutoreleasedReturnValue();
    detailStrings = v5->_detailStrings;
    v5->_detailStrings = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOServerFormattedString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleString, CFSTR("_titleString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_details, CFSTR("_details"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailStrings, CFSTR("_detailStrings"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_title);
  v5 = -[GEOComposedString copy](self->_titleString, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSArray copy](self->_details, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_detailStrings, 1);
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  return (id)v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ title: %@\ndetails: %@"), v5, self->_titleString, self->_detailStrings);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOServerFormattedString)title
{
  return self->_title;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (NSArray)details
{
  return self->_details;
}

- (NSArray)detailStrings
{
  return self->_detailStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailStrings, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
