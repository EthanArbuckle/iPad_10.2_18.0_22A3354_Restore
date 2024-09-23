@implementation GEORoadCoursePenalty

- (GEORoadCoursePenalty)init
{
  GEORoadCoursePenalty *result;

  result = (GEORoadCoursePenalty *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORoadCoursePenalty)initWithLocation:(id)a3
{
  id v5;
  GEORoadCoursePenalty *v6;
  GEORoadCoursePenalty *v7;
  GEORoadCoursePenalty *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORoadCoursePenalty;
  v6 = -[GEORoadCoursePenalty init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_location, a3);
    v7->_useRawLocations = 0;
    v8 = v7;
  }

  return v7;
}

- (void)setUseRawLocations:(BOOL)a3
{
  self->_useRawLocations = a3;
}

- (BOOL)useRawLocations
{
  return self->_useRawLocations;
}

- (double)penaltyForCandidate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  if (-[GEORoadCoursePenalty useRawLocations](self, "useRawLocations")
    && -[GEOLocation hasRawCourse](self->_location, "hasRawCourse"))
  {
    -[GEOLocation rawCourse](self->_location, "rawCourse");
  }
  else
  {
    -[GEOLocation course](self->_location, "course");
  }
  v6 = v5;
  objc_msgSend(v4, "road");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "roadWidth");
  v9 = v8;

  if (v6 < 0.0)
  {
LABEL_6:
    v10 = 0.0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "segmentAngle");
  v12 = fmod(v11 - v6 + 180.0, 360.0);
  v13 = fmod(v12 + 360.0, 360.0);
  objc_msgSend(v4, "distanceFromJunction");
  v14 = fabs(v13 + -180.0);
  if (v15 <= 11.1)
  {
    objc_msgSend(v4, "distanceFromSegment");
    if (v16 <= v9 * 0.5)
    {
      if (v14 > 60.0)
      {
        v10 = 150.0;
        goto LABEL_15;
      }
      goto LABEL_6;
    }
  }
  v10 = 0.0;
  if (v14 >= 15.0)
  {
    v10 = 10.0;
    if (v14 >= 30.0)
    {
      v10 = 25.0;
      if (v14 >= 45.0)
        v10 = dbl_189CCC4A0[v14 < 60.0];
    }
  }
LABEL_15:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
