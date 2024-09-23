@implementation GEOMapItemVenueContents

- (GEOMapItemVenueContents)init
{
  GEOMapItemVenueContents *result;

  result = (GEOMapItemVenueContents *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapItemVenueContents)initWithTitle:(id)a3 items:(id)a4
{
  id v7;
  id v8;
  GEOMapItemVenueContents *v9;
  GEOMapItemVenueContents *v10;
  uint64_t v11;
  NSArray *items;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapItemVenueContents;
  v9 = -[GEOMapItemVenueContents init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    v11 = objc_msgSend(v8, "copy");
    items = v10->_items;
    v10->_items = (NSArray *)v11;

  }
  return v10;
}

- (GEOMapItemVenueContents)initWithItemList:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  GEOMapItemVenueContents *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (uint64_t)v4;
  if (v4 && (-[GEOPDVenueItemList _readTitle]((uint64_t)v4), *(_QWORD *)(v5 + 32)))
  {
    -[GEOPDVenueItemList title]((id *)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {
      v7 = 0;
      goto LABEL_8;
    }
    -[GEOPDVenueItemList _readItems](v5);
    v7 = (GEOMapItemVenueContents *)objc_msgSend(*(id *)(v5 + 24), "count");

    if (v7)
    {
      -[GEOPDVenueItemList title]((id *)v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDVenueItemList items]((id *)v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");
      self = -[GEOMapItemVenueContents initWithTitle:items:](self, "initWithTitle:items:", v6, v9);

      v7 = self;
LABEL_8:

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
