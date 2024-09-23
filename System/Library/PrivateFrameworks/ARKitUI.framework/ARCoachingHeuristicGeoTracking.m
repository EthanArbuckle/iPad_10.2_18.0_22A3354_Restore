@implementation ARCoachingHeuristicGeoTracking

- (int64_t)requirements
{
  return self->_requirements;
}

- (BOOL)satisfied
{
  return self->_requirements == 0;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "geoTrackingStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v8, "geoTrackingStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

    if (v7 <= 3)
      self->_requirements = qword_1DCCA12C0[v7];
  }

}

@end
