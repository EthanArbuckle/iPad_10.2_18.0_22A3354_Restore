@implementation GEORoadMatcherCandidateSegment

- (GEORoadMatcherCandidateSegment)init
{
  GEORoadMatcherCandidateSegment *result;

  result = (GEORoadMatcherCandidateSegment *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORoadMatcherCandidateSegment)initWithCoordinate:(id)a3 angle:(double)a4 road:(id)a5 startCoordinate:(id)a6 endCoordinate:(id)a7 penalties:(id)a8
{
  double var2;
  double var1;
  double var0;
  double v13;
  double v14;
  id v16;
  id v17;
  GEORoadMatcherCandidateSegment *v18;
  GEORoadMatcherCandidateSegment *v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  GEORoadMatcherCandidateSegment *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  var2 = a6.var2;
  var1 = a6.var1;
  var0 = a6.var0;
  v13 = a3.var1;
  v14 = a3.var0;
  v49 = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v17 = a8;
  v47.receiver = self;
  v47.super_class = (Class)GEORoadMatcherCandidateSegment;
  v18 = -[GEORoadMatcherCandidateSegment init](&v47, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_road, a5);
    v20 = GEOBearingFromCoordinateToCoordinate(var0, var1, a7.var0, a7.var1);
    v21 = fmod(v20, 360.0);
    v19->_segmentAngle = fmod(v21 + 360.0, 360.0) + 0.0;
    v24 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(var0, var1, var2, a7.var0, a7.var1, a7.var2, v22, v23, v14, v13);
    v26 = v25;
    v19->_coordinateOnSegment.latitude = v24;
    v19->_coordinateOnSegment.longitude = v25;
    v19->_coordinateOnSegment.altitude = v27;
    v19->_distanceFromSegment = GEOCalculateDistanceRadius(v24, v25, v14, v13, 6367000.0);
    objc_msgSend(v16, "roadWidth");
    v19->_score = v19->_distanceFromSegment + v28 * -0.5;
    objc_msgSend(v16, "startJunction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endJunction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_distanceInMetersFromJunction = 1.79769313e308;
    if (objc_msgSend(v29, "connectivityJunction"))
    {
      objc_msgSend(v29, "coordinate");
      v19->_distanceInMetersFromJunction = GEOCalculateDistanceRadius(v24, v26, v31, v32, 6367000.0);
      objc_storeStrong((id *)&v19->_junction, v29);
    }
    if (v30)
    {
      objc_msgSend(v30, "coordinate");
      v35 = GEOCalculateDistanceRadius(v24, v26, v33, v34, 6367000.0);
      if (v19->_distanceInMetersFromJunction > v35)
      {
        v19->_distanceInMetersFromJunction = v35;
        objc_storeStrong((id *)&v19->_junction, v30);
      }
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v36 = v17;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v44;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v44 != v38)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v39), "penaltyForCandidate:", v19);
          v19->_score = v40 + v19->_score;
          ++v39;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v37);
    }

    v41 = v19;
  }

  return v19;
}

- (double)score
{
  return self->_score;
}

- (GEOMapFeatureRoad)road
{
  return self->_road;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnSegment
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_coordinateOnSegment.latitude;
  longitude = self->_coordinateOnSegment.longitude;
  altitude = self->_coordinateOnSegment.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)distanceFromSegment
{
  return self->_distanceFromSegment;
}

- (double)segmentAngle
{
  return self->_segmentAngle;
}

- (GEOMapFeatureJunction)junction
{
  return self->_junction;
}

- (double)distanceFromJunction
{
  return self->_distanceInMetersFromJunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_road, 0);
}

@end
