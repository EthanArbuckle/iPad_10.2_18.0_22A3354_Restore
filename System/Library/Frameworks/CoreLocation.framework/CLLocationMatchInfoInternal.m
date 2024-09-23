@implementation CLLocationMatchInfoInternal

- (CLLocationMatchInfoInternal)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8 matchDataArray:(id)a9
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationMatchInfoInternal *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CLLocationMatchInfoInternal *v21;
  objc_super v23;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v23.receiver = self;
  v23.super_class = (Class)CLLocationMatchInfoInternal;
  v17 = -[CLLocationMatchInfoInternal init](&v23, sel_init);
  v21 = v17;
  if (v17)
  {
    v17->fMatchQuality = a3;
    v17->fMatchCoordinate.latitude = latitude;
    v17->fMatchCoordinate.longitude = longitude;
    v17->fMatchCourse = a5;
    v17->fMatchFormOfWay = a6;
    v17->fMatchRoadClass = a7;
    v17->fMatchShifted = a8;
    v17->fMatchDataArray = (NSData *)objc_msgSend_copy(a9, v18, v19, v20);
  }
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationMatchInfoInternal;
  -[CLLocationMatchInfoInternal dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithMatchQuality_matchCoordinate_matchCourse_matchFormOfWay_matchRoadClass_matchShifted_matchDataArray_(v8, v9, self->fMatchQuality, self->fMatchFormOfWay, self->fMatchRoadClass, self->fMatchShifted, self->fMatchDataArray, self->fMatchCoordinate.latitude, self->fMatchCoordinate.longitude, self->fMatchCourse);
}

@end
