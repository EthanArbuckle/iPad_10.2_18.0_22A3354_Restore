@implementation MNLocationMatchInfo

- (MNLocationMatchInfo)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  MNLocationMatchInfo *v15;
  MNLocationMatchInfo *v16;
  MNLocationMatchInfo *v17;
  objc_super v19;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v19.receiver = self;
  v19.super_class = (Class)MNLocationMatchInfo;
  v15 = -[MNLocationMatchInfo init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_matchQuality = a3;
    v15->_matchCoordinate.latitude = latitude;
    v15->_matchCoordinate.longitude = longitude;
    v15->_matchCourse = a5;
    v15->_matchFormOfWay = a6;
    v15->_matchRoadClass = a7;
    v15->_matchShifted = a8;
    v17 = v15;
  }

  return v16;
}

- (int64_t)matchQuality
{
  return self->_matchQuality;
}

- (CLLocationCoordinate2D)matchCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_matchCoordinate.latitude;
  longitude = self->_matchCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (double)matchCourse
{
  return self->_matchCourse;
}

- (int)matchFormOfWay
{
  return self->_matchFormOfWay;
}

- (int)matchRoadClass
{
  return self->_matchRoadClass;
}

- (BOOL)matchShifted
{
  return self->_matchShifted;
}

@end
