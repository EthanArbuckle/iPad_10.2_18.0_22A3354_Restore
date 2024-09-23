@implementation GDGeoHashVisitEvent

- (GDGeoHashVisitEvent)initWithDate:(id)a3 geoHash:(unint64_t)a4 isEnter:(BOOL)a5 level:(int64_t)a6
{
  id v11;
  GDGeoHashVisitEvent *v12;
  GDGeoHashVisitEvent *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDGeoHashVisitEvent;
  v12 = -[GDGeoHashVisitEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a3);
    v13->_isEnter = a5;
    v13->_geoHash = a4;
    v13->_level = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  GDGeoHashVisitEvent *v4;
  GDGeoHashVisitEvent *v5;
  GDGeoHashVisitEvent *v6;
  int isEnter;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t geoHash;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSDate *date;
  void *v19;
  const char *v20;
  uint64_t v21;
  char isEqualToDate;

  v4 = (GDGeoHashVisitEvent *)a3;
  v5 = v4;
  if (self == v4)
  {
    isEqualToDate = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    isEnter = self->_isEnter;
    if (isEnter == objc_msgSend_isEnter(v6, v8, v9, v10)
      && (geoHash = self->_geoHash, geoHash == objc_msgSend_geoHash(v6, v11, v12, v13)))
    {
      date = self->_date;
      objc_msgSend_date(v6, v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDate = objc_msgSend_isEqualToDate_(date, v20, (uint64_t)v19, v21);

    }
    else
    {
      isEqualToDate = 0;
    }

  }
  else
  {
    isEqualToDate = 0;
  }

  return isEqualToDate;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)geoHash
{
  return self->_geoHash;
}

- (BOOL)isEnter
{
  return self->_isEnter;
}

- (int64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
