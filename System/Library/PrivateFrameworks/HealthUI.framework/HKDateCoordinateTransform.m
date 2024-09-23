@implementation HKDateCoordinateTransform

- (HKDateCoordinateTransform)initWithCurrentCalendar:(id)a3
{
  id v5;
  HKDateCoordinateTransform *v6;
  HKDateCoordinateTransform *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDateCoordinateTransform;
  v6 = -[HKDateCoordinateTransform init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currentCalendar, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return -[HKDateCoordinateTransform isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (double)coordinateForValue:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCoordinateTransform.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[NSDate class]]"));

  }
  -[HKDateCoordinateTransform currentCalendar](self, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_durationSinceReferenceDateForDate:calendarUnit:", v5, 16);
  v8 = v7;

  return v8;
}

- (id)valueForCoordinate:(double)a3
{
  void *v4;
  void *v5;

  -[HKDateCoordinateTransform currentCalendar](self, "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dateWithDurationSinceReferenceDate:calendarUnit:", 16, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
}

@end
