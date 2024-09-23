@implementation GEODotPlace

- (GEODotPlace)init
{
  GEODotPlace *result;

  result = (GEODotPlace *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEODotPlace)initWithDotPlace:(id)a3
{
  id *v4;
  GEODotPlace *v5;
  GEOMapItemIdentifier *v6;
  void *v7;
  uint64_t v8;
  GEOMapItemIdentifier *identifier;
  uint64_t v10;
  GEOLatLng *latLng;
  uint64_t v12;
  GEOStyleAttributes *styleAttributes;
  uint64_t v14;
  NSString *name;
  objc_super v17;

  v4 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)GEODotPlace;
  v5 = -[GEODotPlace init](&v17, sel_init);
  if (v5)
  {
    v6 = [GEOMapItemIdentifier alloc];
    -[GEOPDDotPlace mapsId](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v6, "initWithMapsIdentifier:", v7);
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v8;

    -[GEOPDDotPlace latLng](v4);
    v10 = objc_claimAutoreleasedReturnValue();
    latLng = v5->_latLng;
    v5->_latLng = (GEOLatLng *)v10;

    -[GEOPDDotPlace styleAttributes](v4);
    v12 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v12;

    -[GEOPDDotPlace name](v4);
    v14 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v14;

  }
  return v5;
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
