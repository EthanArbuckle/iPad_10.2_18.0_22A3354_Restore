@implementation GEODotPlaceMapItem

- (GEODotPlaceMapItem)init
{
  GEODotPlaceMapItem *result;

  result = (GEODotPlaceMapItem *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEODotPlaceMapItem)initWithDotPlace:(id)a3
{
  id v5;
  GEODotPlaceMapItem *v6;
  GEODotPlaceMapItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEODotPlaceMapItem;
  v6 = -[GEODotPlaceMapItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dotPlace, a3);

  return v7;
}

- (GEOMapItemIdentifier)_identifier
{
  return -[GEODotPlace identifier](self->_dotPlace, "identifier");
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEODotPlace identifier](self->_dotPlace, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEODotPlace latLng](self->_dotPlace, "latLng");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (NSString)name
{
  return -[GEODotPlace name](self->_dotPlace, "name");
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  GEOFeatureStyleAttributes *v3;
  void *v4;
  GEOFeatureStyleAttributes *v5;

  v3 = [GEOFeatureStyleAttributes alloc];
  -[GEODotPlace styleAttributes](self->_dotPlace, "styleAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOFeatureStyleAttributes initWithGEOStyleAttributes:](v3, "initWithGEOStyleAttributes:", v4);

  return v5;
}

- (unint64_t)_muid
{
  void *v2;
  unint64_t v3;

  -[GEODotPlace identifier](self->_dotPlace, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "muid");

  return v3;
}

- (BOOL)_hasMUID
{
  return -[GEODotPlaceMapItem _muid](self, "_muid") != 0;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (GEODotPlace)dotPlace
{
  return self->_dotPlace;
}

- (void)setDotPlace:(id)a3
{
  objc_storeStrong((id *)&self->_dotPlace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotPlace, 0);
}

@end
