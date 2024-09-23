@implementation GEOComposedRouteLaneChangeInfo

- (id)description
{
  double v2;
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  GEOPolylineCoordinateRangeAsString(*(_QWORD *)&self->_routeCoordinateRange.start, *(_QWORD *)&self->_routeCoordinateRange.end, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@] (%f, %f) to (%f, %f) | %d lanes"), v5, *(_QWORD *)&self->_startCoordinate.latitude, *(_QWORD *)&self->_startCoordinate.longitude, *(_QWORD *)&self->_endCoordinate.latitude, *(_QWORD *)&self->_endCoordinate.longitude, self->_laneCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t laneCount;
  id v5;

  laneCount = self->_laneCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", laneCount, CFSTR("_laneCount"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_routeCoordinateRange, 16, CFSTR("_routeCoordinateRange"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_startCoordinate, 24, CFSTR("_startCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_endCoordinate, 24, CFSTR("_endCoordinate"));

}

- (GEOComposedRouteLaneChangeInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteLaneChangeInfo *v5;
  id v6;
  const void *v7;
  size_t v8;
  id v9;
  const void *v10;
  size_t v11;
  const void *v12;
  size_t v13;
  GEOComposedRouteLaneChangeInfo *v14;
  unint64_t v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedRouteLaneChangeInfo;
  v5 = -[GEOComposedRouteLaneChangeInfo init](&v17, sel_init);
  if (v5)
  {
    v5->_laneCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_laneCount"));
    v16 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinateRange"), &v16);
    if (v16 && v7)
    {
      if (v16 >= 0x10)
        v8 = 16;
      else
        v8 = v16;
      memcpy(&v5->_routeCoordinateRange, v7, v8);
    }
    v16 = 0;
    v9 = objc_retainAutorelease(v6);
    v10 = (const void *)objc_msgSend(v9, "decodeBytesForKey:returnedLength:", CFSTR("_startCoordinate"), &v16);
    if (v16 && v10)
    {
      if (v16 >= 0x18)
        v11 = 24;
      else
        v11 = v16;
      memcpy(&v5->_startCoordinate, v10, v11);
    }
    v16 = 0;
    v12 = (const void *)objc_msgSend(objc_retainAutorelease(v9), "decodeBytesForKey:returnedLength:", CFSTR("_endCoordinate"), &v16);
    if (v16 && v12)
    {
      if (v16 >= 0x18)
        v13 = 24;
      else
        v13 = v16;
      memcpy(&v5->_endCoordinate, v12, v13);
    }
    v14 = v5;
  }

  return v5;
}

- (unint64_t)laneCount
{
  return self->_laneCount;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_routeCoordinateRange.end;
  start = self->_routeCoordinateRange.start;
  result.end = end;
  result.start = start;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)startCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_startCoordinate.latitude;
  longitude = self->_startCoordinate.longitude;
  altitude = self->_startCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_endCoordinate.latitude;
  longitude = self->_endCoordinate.longitude;
  altitude = self->_endCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (GEOComposedRouteLaneChangeInfo)initWithGeoLaneChangeInfo:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 distanceOffset:(double)a6
{
  id v10;
  id v11;
  GEOComposedRouteLaneChangeInfo *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  BOOL v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  GEOComposedRouteLaneChangeInfo *v38;
  objc_super v40;

  v10 = a3;
  v11 = a5;
  v40.receiver = self;
  v40.super_class = (Class)GEOComposedRouteLaneChangeInfo;
  v12 = -[GEOComposedRouteLaneChangeInfo init](&v40, sel_init);
  if (v12)
  {
    v12->_laneCount = objc_msgSend(v10, "numValidLanes");
    objc_msgSend(v11, "distanceFromStartToStartOfPathIndex:", a4);
    v14 = v13;
    v15 = objc_msgSend(v11, "routeCoordinateRangeForPathIndex:", a4);
    v17 = v16;
    v18 = v14 + a6;
    v19 = v14 + a6 + (float)objc_msgSend(v10, "startOffsetCm") * 0.01;
    v20 = (float)objc_msgSend(v10, "endOffsetCm");
    v21 = objc_msgSend(v11, "routeCoordinateForDistanceAfterStart:", v19);
    if ((_DWORD)v17 == (_DWORD)v15)
    {
      v22 = v15;
      v23 = v17;
      if (*((float *)&v17 + 1) == *((float *)&v15 + 1)
        || (v22 = v15, v23 = v17, *((float *)&v17 + 1) >= *((float *)&v15 + 1)))
      {
LABEL_8:
        v24 = *((float *)&v22 + 1);
        if ((_DWORD)v22 == (_DWORD)v21)
        {
          v25 = *((float *)&v22 + 1) != *((float *)&v21 + 1) && *((float *)&v22 + 1) < *((float *)&v21 + 1);
          v26 = v22;
          if (!v25)
          {
LABEL_13:
            if ((_DWORD)v22 == (_DWORD)v23)
            {
              if (v24 == *((float *)&v23 + 1) || v24 >= *((float *)&v23 + 1))
              {
LABEL_21:
                v12->_routeCoordinateRange.start = (PolylineCoordinate)v23;
                v27 = objc_msgSend(v11, "routeCoordinateForDistanceAfterStart:", v18 + v20 * 0.01);
                if ((_DWORD)v17 == (_DWORD)v15)
                {
                  if (*((float *)&v17 + 1) == *((float *)&v15 + 1) || *((float *)&v17 + 1) >= *((float *)&v15 + 1))
                    goto LABEL_24;
                }
                else if (v17 >= v15)
                {
LABEL_24:
                  v28 = v15;
                  v15 = v17;
                  goto LABEL_27;
                }
                v28 = v17;
LABEL_27:
                v29 = *((float *)&v28 + 1);
                if ((_DWORD)v28 == (_DWORD)v27)
                {
                  v30 = *((float *)&v28 + 1) != *((float *)&v27 + 1) && *((float *)&v28 + 1) < *((float *)&v27 + 1);
                  v31 = v28;
                  if (!v30)
                  {
LABEL_32:
                    if ((_DWORD)v28 == (_DWORD)v15)
                    {
                      if (v29 == *((float *)&v15 + 1) || v29 >= *((float *)&v15 + 1))
                        goto LABEL_40;
                    }
                    else if (v28 >= v15)
                    {
LABEL_40:
                      v12->_routeCoordinateRange.end = (PolylineCoordinate)v15;
                      objc_msgSend(v11, "coordinateForRouteCoordinate:", *(_QWORD *)&v12->_routeCoordinateRange.start);
                      v12->_startCoordinate.latitude = v32;
                      v12->_startCoordinate.longitude = v33;
                      v12->_startCoordinate.altitude = v34;
                      objc_msgSend(v11, "coordinateForRouteCoordinate:", *(_QWORD *)&v12->_routeCoordinateRange.end);
                      v12->_endCoordinate.latitude = v35;
                      v12->_endCoordinate.longitude = v36;
                      v12->_endCoordinate.altitude = v37;
                      v38 = v12;
                      goto LABEL_41;
                    }
                    v15 = v31;
                    goto LABEL_40;
                  }
                }
                else
                {
                  v31 = v28;
                  if (v28 >= v27)
                    goto LABEL_32;
                }
                v29 = *((float *)&v27 + 1);
                LODWORD(v28) = v27;
                v31 = v27;
                goto LABEL_32;
              }
            }
            else if (v22 >= v23)
            {
              goto LABEL_21;
            }
            v23 = v26;
            goto LABEL_21;
          }
        }
        else
        {
          v26 = v22;
          if (v22 >= v21)
            goto LABEL_13;
        }
        v24 = *((float *)&v21 + 1);
        LODWORD(v22) = v21;
        v26 = v21;
        goto LABEL_13;
      }
    }
    else
    {
      v22 = v15;
      v23 = v17;
      if (v17 >= v15)
        goto LABEL_8;
    }
    v22 = v17;
    v23 = v15;
    goto LABEL_8;
  }
LABEL_41:

  return v12;
}

@end
