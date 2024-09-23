@implementation MUCoordinateViewModel

- (MUCoordinateViewModel)initWithMapItem:(id)a3 isUserLocation:(BOOL)a4
{
  id v7;
  MUCoordinateViewModel *v8;
  MUCoordinateViewModel *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUCoordinateViewModel;
  v8 = -[MUCoordinateViewModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_isUserLocation = a4;
  }

  return v9;
}

- (NSString)titleString
{
  return (NSString *)_MULocalizedStringFromThisBundle(CFSTR("Coordinates [Placecard]"));
}

- (NSString)valueString
{
  MUCoordinateStringFormatter *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc_init(MUCoordinateStringFormatter);
  if (self->_isUserLocation)
  {
    objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation");

    v6 = v5 ^ 1u;
  }
  else
  {
    v6 = 0;
  }
  -[MUCoordinateStringFormatter setCoarseLocation:](v3, "setCoarseLocation:", v6);
  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  -[MUCoordinateStringFormatter stringFromCoordinate:](v3, "stringFromCoordinate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
