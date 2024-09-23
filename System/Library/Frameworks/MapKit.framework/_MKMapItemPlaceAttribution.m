@implementation _MKMapItemPlaceAttribution

- (_MKMapItemPlaceAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5;
  _MKMapItemPlaceAttribution *v6;
  _MKMapItemPlaceAttribution *v7;
  _MKMapItemPlaceAttribution *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemPlaceAttribution;
  v6 = -[_MKMapItemAttribution initWithGEOMapItemAttribution:](&v10, sel_initWithGEOMapItemAttribution_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoPlaceAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)checkInURLs
{
  return (NSArray *)-[GEOMapItemPlaceAttribution checkInURLs](self->_geoPlaceAttribution, "checkInURLs");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoPlaceAttribution, 0);
}

@end
