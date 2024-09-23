@implementation GEOVenueFilterItem

- (GEOVenueFilterItem)init
{
  GEOVenueFilterItem *result;

  result = (GEOVenueFilterItem *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOVenueFilterItem)initWithLabel:(id)a3 filterID:(id)a4
{
  id v7;
  id v8;
  GEOVenueFilterItem *v9;
  GEOVenueFilterItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOVenueFilterItem;
  v9 = -[GEOVenueFilterItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filterID, a4);
    objc_storeStrong((id *)&v10->_label, a3);
    v10->_describesParentVenue = 0;
  }

  return v10;
}

- (GEOVenueFilterItem)initWithFilterElementInfo:(id)a3
{
  id *v4;
  GEOVenueIdentifier *v5;
  void *v6;
  GEOVenueIdentifier *v7;
  GEOVenueLabel *v8;
  void *v9;
  GEOVenueLabel *v10;
  BOOL v11;
  GEOVenueFilterItem *v12;

  v4 = (id *)a3;
  v5 = [GEOVenueIdentifier alloc];
  -[GEOPDFilterElementInfo filterIds](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOVenueIdentifier initWithVenueIdentifiers:](v5, "initWithVenueIdentifiers:", v6);

  v8 = [GEOVenueLabel alloc];
  -[GEOPDFilterElementInfo label](v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[GEOVenueLabel initWithLabel:](v8, "initWithLabel:", v9);
  if (v7)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[GEOVenueFilterItem initWithLabel:filterID:](self, "initWithLabel:filterID:", v10, v7);
    v12 = self;
  }

  return v12;
}

- (GEOVenueIdentifier)filterID
{
  return self->_filterID;
}

- (GEOVenueLabel)label
{
  return self->_label;
}

- (BOOL)describesParentVenue
{
  return self->_describesParentVenue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_filterID, 0);
}

@end
