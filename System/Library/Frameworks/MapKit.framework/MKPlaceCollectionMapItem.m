@implementation MKPlaceCollectionMapItem

- (MKPlaceCollectionMapItem)initWithMapItem:(id)a3 placeCollectionItem:(id)a4
{
  id v7;
  id v8;
  MKPlaceCollectionMapItem *v9;
  MKPlaceCollectionMapItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPlaceCollectionMapItem;
  v9 = -[MKPlaceCollectionMapItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_placeCollectionItem, a4);
  }

  return v10;
}

- (GEOQuickLink)appClip
{
  GEOPlaceCollectionItem *placeCollectionItem;
  void *v4;
  id v5;
  id v6;
  void *v7;

  placeCollectionItem = self->_placeCollectionItem;
  if (placeCollectionItem)
  {
    -[GEOPlaceCollectionItem appClip](placeCollectionItem, "appClip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "type") == 2)
    {
      v5 = v4;
      v6 = v5;
    }
    else if ((-[GEOPlaceCollectionItem disableAppClipFallback](self->_placeCollectionItem, "disableAppClipFallback") & 1) != 0)
    {
      v6 = 0;
      v5 = v4;
    }
    else
    {
      -[MKMapItem _quickLinks](self->_mapItem, "_quickLinks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "type") == 2)
        v6 = v5;
      else
        v6 = 0;

    }
  }
  else
  {
    v6 = 0;
  }
  return (GEOQuickLink *)v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MKPlaceCollectionMapItem mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionMapItem placeCollectionItem](self, "placeCollectionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOPlaceCollectionItem)placeCollectionItem
{
  return self->_placeCollectionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollectionItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
