@implementation GEOCyclingRouteMatcher

- (GEOCyclingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v6;
  id v7;
  GEOCyclingRouteMatcher *v8;
  GEOCyclingRouteMatcher *v9;
  GEOCyclingRouteMatcher *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOCyclingRouteMatcher;
  v8 = -[GEORouteMatcher initWithRoute:auditToken:](&v12, sel_initWithRoute_auditToken_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[GEORouteMatcher setShouldSnapRouteMatchToRoute:](v8, "setShouldSnapRouteMatchToRoute:", 1);
    v10 = v9;
  }

  return v9;
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  _QWORD *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  long double v30;
  double v31;
  _GEOCandidateRouteMatch *v32;
  _GEOCandidateRouteMatch *v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  $AB5116BA7E623E054F959CECB034F4E7 v39;
  unint64_t v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40 = 0xBF80000000000000;
  objc_msgSend(v9, "coordinate");
  v19 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v8, &v39.latitude, (uint64_t)&v40, v11, v12, v13, v14, v15, v16, v17, v18);
  -[GEORouteMatcher route](self, "route");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "courseAtRouteCoordinateIndex:", v40);
  v22 = v21;

  objc_msgSend(v9, "horizontalAccuracy");
  -[GEOCyclingRouteMatcher _maxMatchDistance:routeCoordinate:previousMatchGood:](self, "_maxMatchDistance:routeCoordinate:previousMatchGood:", v40, objc_msgSend(v10, "isGoodMatch"), v23);
  v25 = v24;
  objc_msgSend(v9, "course");
  v26 = 0.0;
  v27 = 0.0;
  if (v28 >= 0.0)
  {
    objc_msgSend(v9, "course");
    v30 = fmod(v22 - v29 + 180.0, 360.0);
    v31 = fabs(fmod(v30 + 360.0, 360.0) + -180.0);
    if (v31 < 15.0)
      v31 = 15.0;
    if (v31 <= 30.0)
      v27 = (30.0 - v31) / 15.0;
    else
      v27 = 0.0;
    v26 = 0.3;
  }
  v32 = objc_alloc_init(_GEOCandidateRouteMatch);
  v33 = v32;
  if (v32)
  {
    v34 = ((v25 - v19) / v25 + v26 * v27) / (v26 + 1.0);
    v32->_isGoodMatch = v34 > 0.0;
    v32->_score = v34;
    v32->_distanceFromRoute = v19;
    v32->_routeCoordinate = (PolylineCoordinate)v40;
    v32->_locationCoordinate = v39;
  }
  if (v8)
    v35 = (void *)v8[7];
  else
    v35 = 0;
  v36 = v35;
  v37 = objc_msgSend(v36, "stepIndex");
  if (v33)
    v33->_stepIndex = v37;

  return v33;
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "routeCoordinate");
  objc_msgSend(v10, "horizontalAccuracy");
  -[GEOCyclingRouteMatcher _modifiedHorizontalAccuracy:routeCoordinate:](self, "_modifiedHorizontalAccuracy:routeCoordinate:", v11);
  objc_msgSend(v8, "setModifiedHorizontalAccuracy:");
  objc_msgSend(v8, "setModifiedCourseAccuracy:", -1.0);
  if ((objc_msgSend(v8, "isGoodMatch") & 1) == 0)
  {
    objc_msgSend(v10, "horizontalAccuracy");
    -[GEOCyclingRouteMatcher _maxMatchDistance:routeCoordinate:previousMatchGood:](self, "_maxMatchDistance:routeCoordinate:previousMatchGood:", v11, 0);
    objc_msgSend(v8, "updateOffRouteProgress:minDistanceToGetOnRoute:", v9);
  }
  if (objc_msgSend(v9, "isGoodMatch"))
  {
    if (objc_msgSend(v8, "isGoodMatch"))
    {
      v12 = objc_msgSend(v8, "stepIndex");
      if (v12 != objc_msgSend(v9, "stepIndex"))
      {
        v13 = self->_newStepProgressions + 1;
        self->_newStepProgressions = v13;
        if (v13 < 3)
          goto LABEL_10;
        -[GEORouteMatcher route](self, "route");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "step");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "routeCoordinateForDistance:afterRouteCoordinate:", objc_msgSend(v15, "startRouteCoordinate"), 8.0);

        v17 = objc_msgSend(v8, "routeCoordinate");
        if (v17 < v16
          || (_DWORD)v17 == (_DWORD)v16 && *((float *)&v17 + 1) < *((float *)&v16 + 1))
        {
LABEL_10:
          objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
        }
        else
        {
          self->_newStepProgressions = 0;
        }
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)GEOCyclingRouteMatcher;
  -[GEORouteMatcher _finishRouteMatch:previousRouteMatch:forLocation:](&v18, sel__finishRouteMatch_previousRouteMatch_forLocation_, v8, v9, v10);

}

- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousMatchGood:(BOOL)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  if (a5)
    v6 = 15.0;
  else
    v6 = 10.0;
  if (a5)
    v7 = 1.5;
  else
    v7 = 1.0;
  -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", a4);
  v9 = v8 * 0.5;
  v10 = v7 * a3;
  if (a3 < 0.0)
    v10 = v6;
  result = v10 + 3.7 + v9;
  if (result > 50.0)
    return 50.0;
  return result;
}

- (double)_modifiedHorizontalAccuracy:(double)a3 routeCoordinate:(PolylineCoordinate)a4
{
  double result;
  double v6;

  result = -1.0;
  if (a3 >= 0.0)
  {
    -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", a4, -1.0);
    return v6 + a3;
  }
  return result;
}

- (BOOL)_supportsSnapping
{
  void *v3;
  char v4;
  void *v5;

  -[GEORouteMatcher route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "usesZilch") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[GEORouteMatcher route](self, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "usesRoutingPathPoints");

  }
  return v4;
}

@end
