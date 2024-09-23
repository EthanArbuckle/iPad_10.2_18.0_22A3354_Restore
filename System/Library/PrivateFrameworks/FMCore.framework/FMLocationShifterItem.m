@implementation FMLocationShifterItem

- (FMLocationShifterItem)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Use initWithCoordinate:accuracy:timestamp:"));

  return 0;
}

- (FMLocationShifterItem)initWithCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 timestamp:(id)a5 context:(id)a6
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v12;
  id v13;
  FMLocationShifterItem *v14;
  FMLocationShifterItem *v15;
  objc_super v17;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMLocationShifterItem;
  v14 = -[FMLocationShifterItem init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_coordinate.latitude = latitude;
    v14->_coordinate.longitude = longitude;
    v14->_accuracy = a4;
    objc_storeStrong((id *)&v14->_timestamp, a5);
    objc_storeStrong(&v15->_context, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMLocationShifterItem coordinate](self, "coordinate");
  v6 = v5;
  -[FMLocationShifterItem coordinate](self, "coordinate");
  v8 = v7;
  -[FMLocationShifterItem accuracy](self, "accuracy");
  v10 = v9;
  -[FMLocationShifterItem context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FMLocationShifterItem shifted](self, "shifted");
  -[FMLocationShifterItem error](self, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %.6f, %.6f @ %.3f ctx:%p s:%d e:%@>"), v4, self, v6, v8, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (id)context
{
  return self->_context;
}

- (BOOL)shifted
{
  return self->_shifted;
}

- (void)setShifted:(BOOL)a3
{
  self->_shifted = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
