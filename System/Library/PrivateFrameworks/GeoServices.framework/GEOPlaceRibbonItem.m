@implementation GEOPlaceRibbonItem

- (id)initAmenityWithAmenityItem:(id)a3
{
  id v4;
  GEOPlaceRibbonItem *v5;
  GEOPlaceRibbonItem *v6;
  GEOAmenityRibbonItem *v7;
  GEOAmenityRibbonItem *amenityItem;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceRibbonItem;
  v5 = -[GEOPlaceRibbonItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 3;
    v7 = -[GEOAmenityRibbonItem initWithRibbonItem:]([GEOAmenityRibbonItem alloc], "initWithRibbonItem:", v4);
    amenityItem = v6->_amenityItem;
    v6->_amenityItem = v7;

  }
  return v6;
}

- (GEOPlaceRibbonItem)initWithFactoidRibbonItem:(id)a3
{
  id v4;
  GEOPlaceRibbonItem *v5;
  GEOPlaceRibbonItem *v6;
  GEOFactoidRibbonItem *v7;
  GEOFactoidRibbonItem *factoidItem;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceRibbonItem;
  v5 = -[GEOPlaceRibbonItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 6;
    v7 = -[GEOFactoidRibbonItem initWithFactoidRibbonItem:]([GEOFactoidRibbonItem alloc], "initWithFactoidRibbonItem:", v4);
    factoidItem = v6->_factoidItem;
    v6->_factoidItem = v7;

  }
  return v6;
}

- (GEOPlaceRibbonItem)initWithType:(int)a3
{
  GEOPlaceRibbonItem *result;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceRibbonItem;
  result = -[GEOPlaceRibbonItem init](&v6, sel_init);
  if (result)
  {
    if ((a3 - 1) >= 9)
      v5 = 0;
    else
      v5 = a3;
    result->_type = v5;
  }
  return result;
}

- (BOOL)isValid
{
  BOOL v2;
  unsigned int type;
  void *v5;

  v2 = 0;
  type = self->_type;
  if (type <= 9)
  {
    if (((1 << type) & 0x3B6) != 0)
    {
      return 1;
    }
    else if (type == 3)
    {
      -[GEOAmenityRibbonItem indexesWithinAmenityComponent](self->_amenityItem, "indexesWithinAmenityComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v5, "count") != 0;

    }
    else if (type == 6)
    {
      return self->_factoidItem != 0;
    }
  }
  return v2;
}

- (GEOAmenityRibbonItem)amenityItem
{
  return self->_amenityItem;
}

- (GEOFactoidRibbonItem)factoidItem
{
  return self->_factoidItem;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoidItem, 0);
  objc_storeStrong((id *)&self->_amenityItem, 0);
}

@end
