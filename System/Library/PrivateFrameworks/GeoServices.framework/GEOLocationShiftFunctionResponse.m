@implementation GEOLocationShiftFunctionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOLocationShiftFunctionResponse)initWithPolyLocationShiftResponse:(id)a3 originalCoordinate:(id)a4 version:(unsigned int)a5
{
  double var1;
  double var0;
  id v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  GEOLocationShiftFunctionResponse *v22;
  objc_super v24;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOLocationShiftFunctionResponse;
  v10 = -[GEOLocationShiftFunctionResponse init](&v24, sel_init);
  if (v10)
  {
    if (objc_msgSend(v9, "hasCenter"))
    {
      objc_msgSend(v9, "center");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lat");
      v13 = v12;
      objc_msgSend(v9, "center");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lng");
      *((_QWORD *)v10 + 1) = v13;
      *((_QWORD *)v10 + 2) = v15;

    }
    else
    {
      *((double *)v10 + 1) = var0;
      *((double *)v10 + 2) = var1;
    }
    objc_msgSend(v9, "radius");
    *((_QWORD *)v10 + 12) = v16;
    *((_DWORD *)v10 + 27) = a5;
    v17 = objc_msgSend(v9, "status");
    v10[104] = v17 == 0;
    if (!v17)
    {
      if (objc_msgSend(v9, "parametersCount") != 9)
      {
        v22 = 0;
        goto LABEL_9;
      }
      v18 = objc_msgSend(v9, "parameters");
      *(_OWORD *)(v10 + 24) = *(_OWORD *)v18;
      v20 = *(_OWORD *)(v18 + 32);
      v19 = *(_OWORD *)(v18 + 48);
      v21 = *(_QWORD *)(v18 + 64);
      *(_OWORD *)(v10 + 40) = *(_OWORD *)(v18 + 16);
      *((_QWORD *)v10 + 11) = v21;
      *(_OWORD *)(v10 + 72) = v19;
      *(_OWORD *)(v10 + 56) = v20;
    }
  }
  v22 = v10;
LABEL_9:

  return v22;
}

- (id)toServerResponse
{
  GEOPolyLocationShiftResponse *v3;
  GEOLatLng *v4;
  uint64_t i;

  v3 = objc_alloc_init(GEOPolyLocationShiftResponse);
  -[GEOPolyLocationShiftResponse setStatus:](v3, "setStatus:", !self->_shouldUsePolyShiftFunction);
  -[GEOPolyLocationShiftResponse setRadius:](v3, "setRadius:", self->_radius);
  v4 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", self->_originalCoordinate.latitude, self->_originalCoordinate.longitude);
  -[GEOPolyLocationShiftResponse setCenter:](v3, "setCenter:", v4);

  if (self->_shouldUsePolyShiftFunction)
  {
    for (i = 24; i != 96; i += 8)
      -[GEOPolyLocationShiftResponse addParameters:](v3, "addParameters:", *(double *)((char *)&self->super.isa + i));
  }
  return v3;
}

- (id)contractFunctionTo:(id)a3 withRadius:(double)a4
{
  id v6;
  GEOLocationShiftFunctionResponse *v7;
  double v8;
  double v9;
  double radius;
  GEOLocationShiftFunctionResponse *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  GEOLocationShiftFunctionResponse *v15;

  v6 = a3;
  v7 = objc_alloc_init(GEOLocationShiftFunctionResponse);
  if (v7)
  {
    objc_msgSend(v6, "coordinate");
    v7->_originalCoordinate.latitude = v8;
    v7->_originalCoordinate.longitude = v9;
    v7->_version = self->_version;
    radius = self->_radius;
    if (radius >= a4)
      radius = a4;
    v7->_radius = radius;
    v7->_shouldUsePolyShiftFunction = self->_shouldUsePolyShiftFunction;
    v11 = v7;
    if (self->_shouldUsePolyShiftFunction)
    {
      *(_OWORD *)v7->_params = *(_OWORD *)self->_params;
      v12 = *(_OWORD *)&self->_params[2];
      v13 = *(_OWORD *)&self->_params[4];
      v14 = *(_OWORD *)&self->_params[6];
      v7->_params[8] = self->_params[8];
      *(_OWORD *)&v7->_params[6] = v14;
      *(_OWORD *)&v7->_params[4] = v13;
      *(_OWORD *)&v7->_params[2] = v12;
      v11 = v7;
    }
  }
  else
  {
    v11 = self;
  }
  v15 = v11;

  return v15;
}

- (GEOLocationShiftFunctionResponse)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  GEOLocationShiftFunctionResponse *v16;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOLocationShiftFunctionResponse;
  v5 = -[GEOLocationShiftFunctionResponse init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("OriginalCoordinateLat"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("OriginalCoordinateLng"));
    *((_QWORD *)v5 + 1) = v7;
    *((_QWORD *)v5 + 2) = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Radius"));
    *((_QWORD *)v5 + 12) = v9;
    v10 = objc_msgSend(v4, "containsValueForKey:", CFSTR("Version"));
    if (v10)
      v10 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Version"));
    *((_DWORD *)v5 + 27) = v10;
    v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShouldShift"));
    v5[104] = v11;
    if (v11)
    {
      v18 = 0;
      v12 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("Parameters"), &v18);
      if (v18 != 72)
      {
        v16 = 0;
        goto LABEL_8;
      }
      *(_OWORD *)(v5 + 24) = *(_OWORD *)v12;
      v13 = *(_OWORD *)(v12 + 16);
      v14 = *(_OWORD *)(v12 + 32);
      v15 = *(_OWORD *)(v12 + 48);
      *((_QWORD *)v5 + 11) = *(_QWORD *)(v12 + 64);
      *(_OWORD *)(v5 + 72) = v15;
      *(_OWORD *)(v5 + 56) = v14;
      *(_OWORD *)(v5 + 40) = v13;
    }
  }
  v16 = v5;
LABEL_8:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("OriginalCoordinateLat"), self->_originalCoordinate.latitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("OriginalCoordinateLng"), self->_originalCoordinate.longitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Radius"), self->_radius);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldUsePolyShiftFunction, CFSTR("ShouldShift"));
  if (self->_shouldUsePolyShiftFunction)
    objc_msgSend(v4, "encodeBytes:length:forKey:", self->_params, 72, CFSTR("Parameters"));

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)shiftedCoordinateForCoordinate:(id)a3 accuracy:(double *)a4
{
  double var1;
  double var0;
  double v7;
  long double v8;
  long double v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (self->_shouldUsePolyShiftFunction)
  {
    v18 = self->_params[2] + a3.var0 * self->_params[1] + self->_params[0] * a3.var1;
    v7 = sin((a3.var1 + -105.0) * 15.0 * 3.14159265 / 180.0);
    v8 = sin((var1 + -105.0) * 60.0 * 3.14159265 / 180.0) * 40.0 + v7 * 150.0;
    v9 = v8 + sin((var1 + -105.0) * 180.0 * 3.14159265 / 180.0) * 20.0;
    v17 = sin((var1 + -105.0) * 360.0 * 3.14159265 / 180.0);
    v10 = sin((var1 + -105.0) * 1080.0 * 3.14159265 / 180.0);
    v19 = var1
        + (v18 + (v9 + v17 * 20.0 + v10 * 20.0) * 0.666666667)
        * (var0 * self->_params[3] / 1000000000.0 + self->_params[4] / 1000000.0);
    v16 = self->_params[7] + var0 * self->_params[6] + self->_params[5] * var1;
    v11 = sin((var0 + -35.0) * 15.0 * 3.14159265 / 180.0);
    v12 = sin((var0 + -35.0) * 60.0 * 3.14159265 / 180.0) * 40.0 + v11 * 160.0;
    v13 = v12 + sin((var0 + -35.0) * 180.0 * 3.14159265 / 180.0) * 20.0;
    var1 = v19;
    var0 = var0
         + (v16 + (v13 + v17 * 20.0 + v10 * 20.0) * 0.666666667)
         * (var0 * self->_params[8] / 1000000000.0 + 0.0000090539664);
  }
  v14 = var0;
  v15 = var1;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (BOOL)isValidForCoordinate:(id)a3
{
  return (a3.var1 - self->_originalCoordinate.longitude) * (a3.var1 - self->_originalCoordinate.longitude)
       + (a3.var0 - self->_originalCoordinate.latitude) * (a3.var0 - self->_originalCoordinate.latitude) <= self->_radius * self->_radius;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char *v5;
  int32x2_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (char *)v4;
    v6 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabdq_f64((float64x2_t)self->_originalCoordinate, *(float64x2_t *)(v5 + 8))));
    v7 = (v6.i32[0] & v6.i32[1] & 1) != 0
      && self->_radius == *((double *)v5 + 12)
      && self->_version == *((_DWORD *)v5 + 27);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)originalCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_originalCoordinate.latitude;
  longitude = self->_originalCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (unsigned)version
{
  return self->_version;
}

@end
