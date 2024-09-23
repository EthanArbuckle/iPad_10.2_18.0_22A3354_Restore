@implementation GEOViewportFrame

- (double)initWithAltitude:(double)a3 latitude:(double)a4 longitude:(float)a5 heading:(float)a6 pitch:(float)a7 distance:(uint64_t)a8 minViewTargetBounds:(char)a9 maxViewTargetBounds:(uint64_t)a10 hasViewTargetBounds:(uint64_t)a11
{
  double *result;
  objc_super v28;

  v28.receiver = a1;
  v28.super_class = (Class)GEOViewportFrame;
  result = (double *)objc_msgSendSuper2(&v28, sel_init);
  if (result)
  {
    result[3] = a2;
    result[4] = a3;
    *((float *)result + 3) = a5;
    *((float *)result + 4) = a6;
    *((float *)result + 5) = a7;
    result[5] = a4;
    *((_QWORD *)result + 6) = a15;
    *((_QWORD *)result + 7) = a16;
    *((_QWORD *)result + 8) = a17;
    *((_QWORD *)result + 9) = a18;
    *((_QWORD *)result + 10) = a19;
    *((_QWORD *)result + 11) = a20;
    *((_BYTE *)result + 8) = a9;
  }
  return result;
}

- (GEOViewportFrame)initWithGEOPDViewportFrame:(id)a3
{
  id *v4;
  id *v5;
  void *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  int v26;
  int v27;
  int v28;
  _BOOL8 v29;
  double v30;
  double v31;
  double v32;
  GEOViewportFrame *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = (id *)a3;
  -[GEOPDViewportFrame viewTargetBounds](v4);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBoundingCube min](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOPDViewportFrame viewTargetBounds](v4);
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBoundingCube max](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "latitude");
  v38 = v9;
  objc_msgSend(v6, "longitude");
  v37 = v10;
  objc_msgSend(v6, "altitude");
  v36 = v11;
  objc_msgSend(v8, "latitude");
  v35 = v12;
  objc_msgSend(v8, "longitude");
  v14 = v13;
  objc_msgSend(v8, "altitude");
  v16 = v15;
  -[GEOPDViewportFrame targetPoint](v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "altitude");
  v19 = v18;
  -[GEOPDViewportFrame targetPoint](v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "latitude");
  v22 = v21;
  -[GEOPDViewportFrame targetPoint](v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "longitude");
  v25 = v24;
  if (v4)
  {
    v26 = *((_DWORD *)v4 + 14);
    v27 = *((_DWORD *)v4 + 15);
    v28 = *((_DWORD *)v4 + 13);
    -[GEOPDViewportFrame _readViewTargetBounds]((uint64_t)v4);
    v29 = v4[4] != 0;
  }
  else
  {
    v29 = 0;
    v28 = 0;
    v26 = 0;
    v27 = 0;
  }

  LODWORD(v30) = v26;
  LODWORD(v31) = v27;
  LODWORD(v32) = v28;
  v33 = -[GEOViewportFrame initWithAltitude:latitude:longitude:heading:pitch:distance:minViewTargetBounds:maxViewTargetBounds:hasViewTargetBounds:](self, "initWithAltitude:latitude:longitude:heading:pitch:distance:minViewTargetBounds:maxViewTargetBounds:hasViewTargetBounds:", v29, v19, v22, v25, v30, v31, v32, v38, v37, v36, v35, v14, v16);

  return v33;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (float)heading
{
  return self->_heading;
}

- (float)pitch
{
  return self->_pitch;
}

- (float)distance
{
  return self->_distance;
}

- ($1AB5FA073B851C12C2339EC22442E995)minViewTargetBounds
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_minViewTargetBounds.latitude;
  longitude = self->_minViewTargetBounds.longitude;
  altitude = self->_minViewTargetBounds.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)maxViewTargetBounds
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_maxViewTargetBounds.latitude;
  longitude = self->_maxViewTargetBounds.longitude;
  altitude = self->_maxViewTargetBounds.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (BOOL)hasViewTargetBounds
{
  return self->_hasViewTargetBounds;
}

@end
