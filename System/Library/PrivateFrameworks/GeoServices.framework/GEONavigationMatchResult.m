@implementation GEONavigationMatchResult

- (GEONavigationMatchResult)initWithRouteMatch:(id)a3 location:(id)a4
{
  id v7;
  id v8;
  GEONavigationMatchResult *v9;
  GEONavigationMatchResult *v10;
  GEONavigationMatchResult *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEONavigationMatchResult;
  v9 = -[GEONavigationMatchResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    objc_storeStrong((id *)&v9->_routeMatch, a3);
    objc_storeStrong((id *)&v10->_rawLocation, a4);
    v11 = v10;
  }

  return v10;
}

- (GEONavigationMatchResult)initWithRoadMatch:(id)a3 location:(id)a4
{
  id v7;
  id v8;
  GEONavigationMatchResult *v9;
  GEONavigationMatchResult *v10;
  GEONavigationMatchResult *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEONavigationMatchResult;
  v9 = -[GEONavigationMatchResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 1;
    objc_storeStrong((id *)&v9->_roadMatch, a3);
    objc_storeStrong((id *)&v10->_rawLocation, a4);
    v11 = v10;
  }

  return v10;
}

- (GEONavigationMatchResult)initWithRawLocation:(id)a3
{
  id v5;
  GEONavigationMatchResult *v6;
  GEONavigationMatchResult *v7;
  GEONavigationMatchResult *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEONavigationMatchResult;
  v6 = -[GEONavigationMatchResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_rawLocation, a3);
    v8 = v7;
  }

  return v7;
}

+ (GEONavigationMatchResult)matchResultWithRouteMatch:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  GEONavigationMatchResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GEONavigationMatchResult initWithRouteMatch:location:]([GEONavigationMatchResult alloc], "initWithRouteMatch:location:", v6, v5);

  return v7;
}

+ (GEONavigationMatchResult)matchResultWithRoadMatch:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  GEONavigationMatchResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GEONavigationMatchResult initWithRoadMatch:location:]([GEONavigationMatchResult alloc], "initWithRoadMatch:location:", v6, v5);

  return v7;
}

+ (GEONavigationMatchResult)matchResultWithRawLocation:(id)a3
{
  id v3;
  GEONavigationMatchResult *v4;

  v3 = a3;
  v4 = -[GEONavigationMatchResult initWithRawLocation:]([GEONavigationMatchResult alloc], "initWithRawLocation:", v3);

  return v4;
}

- (void)setRouteMatch:(id)a3
{
  objc_storeStrong((id *)&self->_routeMatch, a3);
}

- (void)setDetailedMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_detailedMatchInfo, a3);
}

- (void)setLocationUnreliable:(BOOL)a3
{
  self->_locationUnreliable = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (GEORoadMatch)roadMatch
{
  return self->_roadMatch;
}

- (GEOLocation)rawLocation
{
  return self->_rawLocation;
}

- (GEONavigationMatchInfo)detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (BOOL)locationUnreliable
{
  return self->_locationUnreliable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedMatchInfo, 0);
  objc_storeStrong((id *)&self->_rawLocation, 0);
  objc_storeStrong((id *)&self->_roadMatch, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
}

@end
