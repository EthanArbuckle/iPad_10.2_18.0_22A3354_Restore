@implementation MUCoordinateStringFormatter

- (id)stringFromCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  longitude = a3.longitude;
  v11[2] = *MEMORY[0x1E0C80C00];
  -[MUCoordinateStringFormatter _coordinatePartStringForValue:positiveSymbol:negativeSymbol:](self, "_coordinatePartStringForValue:positiveSymbol:negativeSymbol:", 1, 5, a3.latitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCoordinateStringFormatter _coordinatePartStringForValue:positiveSymbol:negativeSymbol:](self, "_coordinatePartStringForValue:positiveSymbol:negativeSymbol:", 7, 3, longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MULocalizedStringFromThisBundle(CFSTR("Coordinates delimeter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_coordinatePartStringForValue:(double)a3 positiveSymbol:(int)a4 negativeSymbol:(int)a5
{
  double v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  if (a3 >= 0.0)
    v6 = a3;
  else
    v6 = -a3;
  MKLocalizedAbbreviationForCompassPoint();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MUCoordinateStringFormatter isCoarseLocation](self, "isCoarseLocation"))
    v8 = CFSTR("Coordinates value [Placecard][Coarse Location]");
  else
    v8 = CFSTR("Coordinates value [Placecard][Precise Location]");
  _MULocalizedStringFromThisBundle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v9, *(_QWORD *)&v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isCoarseLocation
{
  return self->_coarseLocation;
}

- (void)setCoarseLocation:(BOOL)a3
{
  self->_coarseLocation = a3;
}

@end
