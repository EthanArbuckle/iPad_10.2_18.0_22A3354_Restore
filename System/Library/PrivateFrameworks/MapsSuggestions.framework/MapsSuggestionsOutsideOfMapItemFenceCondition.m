@implementation MapsSuggestionsOutsideOfMapItemFenceCondition

- (MapsSuggestionsOutsideOfMapItemFenceCondition)initWithMapItem:(id)a3 radius:(double)a4
{
  id v7;
  MapsSuggestionsOutsideOfMapItemFenceCondition *v8;
  MapsSuggestionsOutsideOfMapItemFenceCondition *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsOutsideOfMapItemFenceCondition;
  v8 = -[MapsSuggestionsBaseCondition initWithName:](&v11, sel_initWithName_, CFSTR("MapsSuggestionsOutsideOfMapItemFence"));
  v9 = v8;
  if (v8)
  {
    v8->_radius = a4;
    objc_storeStrong((id *)&v8->_mapItem, a3);
  }

  return v9;
}

- (BOOL)isTrue
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;

  MapsSuggestionsCurrentBestLocation();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "coordinate");
    v6 = v5;
    objc_msgSend(v4, "coordinate");
    v8 = v7;
    -[GEOMapItemStorage geoFenceMapRegion](self->_mapItem, "geoFenceMapRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsCoordinate:radius:", v6, v8, self->_radius) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
