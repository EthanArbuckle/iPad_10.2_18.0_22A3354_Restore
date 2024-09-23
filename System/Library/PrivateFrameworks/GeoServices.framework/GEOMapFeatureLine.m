@implementation GEOMapFeatureLine

- (GEOMapFeatureLine)init
{
  GEOMapFeatureLine *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureLine;
  result = -[GEOMapFeatureLine init](&v3, sel_init);
  if (result)
  {
    result->_coordinateCount = 0x7FFFFFFFFFFFFFFFLL;
    result->_isFlipped = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_tempCoordinates2d);
  free(self->_coordinates3d);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureLine;
  -[GEOMapFeatureLine dealloc](&v3, sel_dealloc);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *result;
  $1AB5FA073B851C12C2339EC22442E995 *v4;
  unint64_t v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6;

  result = self->_tempCoordinates2d;
  if (!result)
  {
    v4 = -[GEOMapFeatureLine coordinates3d](self, "coordinates3d");
    self->_tempCoordinates2d = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16* -[GEOMapFeatureLine coordinateCount](self, "coordinateCount"), 0x1000040451B5BE8uLL);
    if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount"))
    {
      v5 = 0;
      do
      {
        v6 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&v4->var0;
        ++v4;
        self->_tempCoordinates2d[v5++] = v6;
      }
      while (v5 < -[GEOMapFeatureLine coordinateCount](self, "coordinateCount"));
    }
    return self->_tempCoordinates2d;
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinates3d
{
  $1AB5FA073B851C12C2339EC22442E995 *coordinates3d;
  GeoCodecsVectorTilePoint *v4;
  unint64_t v5;
  float *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  _BOOL4 isFlipped;
  float *p_var1;
  uint64_t v22;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  double *p_var0;
  float v29;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  unint64_t v35;
  __int128 buf;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  coordinates3d = self->_coordinates3d;
  if (!coordinates3d)
  {
    v35 = 0;
    v4 = -[GEOMapFeatureLine _tilePointsForSection:outCount:](self, "_tilePointsForSection:outCount:", 0, &v35);
    v5 = v35;
    if (v35)
    {
      v34 = 0;
      v6 = -[GEOMapFeatureLine _elevationsForSection:outCount:](self, "_elevationsForSection:outCount:", 0, &v34);
      v5 = v35;
      if (v6 && v34 != v35)
      {
        GEOGetGEOMapFeatureAccessLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109376;
          DWORD1(buf) = v34;
          WORD4(buf) = 1024;
          *(_DWORD *)((char *)&buf + 10) = v35;
          _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Feature has elevations but elevations count (%d) does not match tile points count (%d). Ignoring elevations.", (uint8_t *)&buf, 0xEu);
        }

        v6 = 0;
        v5 = v35;
      }
    }
    else
    {
      v6 = 0;
    }
    self->_coordinateCount = v5;
    self->_coordinates3d = ($1AB5FA073B851C12C2339EC22442E995 *)malloc_type_malloc(24 * v5, 0x1000040504FFAC1uLL);
    -[GEOMapFeatureLine _containingTile](self, "_containingTile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tileKey");
    v10 = *(_QWORD *)v9;
    v11 = *(_QWORD *)v9 << 32;
    v12 = BYTE4(*(_QWORD *)v9) | ((((*(_QWORD *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v9 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v9 + 10) >> 4) << 52);
    *(_QWORD *)((char *)&buf + 1) = v11 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v9 >> 8) & 0x3F) << 40);
    LOBYTE(buf) = v10;
    *((_QWORD *)&v13 + 1) = v12;
    *(_QWORD *)&v13 = v11;
    *((_QWORD *)&buf + 1) = v13 >> 56;
    v14 = GEOMapRectForGEOTileKey((uint64_t)&buf);
    v32 = v16;
    v33 = v14;
    v31 = v17;
    if (v35)
    {
      v18 = v15;
      v19 = 0;
      isFlipped = self->_isFlipped;
      p_var1 = &v4->var1;
      v22 = -1;
      coordinates3d = self->_coordinates3d;
      do
      {
        v23 = v33 + *(p_var1 - 1) * v31;
        v24 = exp(((v32 + (float)(1.0 - *p_var1) * v18) * 0.0078125 + -1048576.0) / 333772.107);
        v25 = (atan(v24) * -2.0 + 1.57079633) * 57.2957795;
        v26 = v35;
        v27 = v22 + v35;
        if (!isFlipped)
          v27 = v19;
        p_var0 = &coordinates3d[v27].var0;
        *p_var0 = v25;
        p_var0[1] = v23 * 0.0078125 * 0.000171661377 + -180.0;
        if (v6)
          v29 = v6[v19];
        else
          v29 = 0.0;
        coordinates3d[v27].var2 = v29;
        ++v19;
        --v22;
        p_var1 += 2;
      }
      while (v19 < v26);
    }
    else
    {
      coordinates3d = self->_coordinates3d;
    }

  }
  return coordinates3d;
}

- (unint64_t)coordinateCount
{
  unint64_t result;

  result = self->_coordinateCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GEOMapFeatureLine coordinates3d](self, "coordinates3d");
    return self->_coordinateCount;
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)firstCoordinate
{
  $1AB5FA073B851C12C2339EC22442E995 *coordinates3d;
  double var0;
  double var1;
  double var2;
  $1AB5FA073B851C12C2339EC22442E995 result;

  if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount"))
  {
    coordinates3d = self->_coordinates3d;
    var0 = coordinates3d->var0;
    var1 = coordinates3d->var1;
    var2 = coordinates3d->var2;
  }
  else
  {
    var2 = 1.79769313e308;
    var0 = -180.0;
    var1 = -180.0;
  }
  result.var2 = var2;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)firstCoordinate2D
{
  $1AB5FA073B851C12C2339EC22442E995 *coordinates3d;
  double var0;
  double var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount"))
  {
    coordinates3d = self->_coordinates3d;
    var0 = coordinates3d->var0;
    var1 = coordinates3d->var1;
  }
  else
  {
    var0 = -180.0;
    var1 = -180.0;
  }
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)lastCoordinate
{
  $1AB5FA073B851C12C2339EC22442E995 *v3;
  double var0;
  double var1;
  double var2;
  $1AB5FA073B851C12C2339EC22442E995 result;

  if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount"))
  {
    v3 = &self->_coordinates3d[self->_coordinateCount];
    var0 = v3[-1].var0;
    var1 = v3[-1].var1;
    var2 = v3[-1].var2;
  }
  else
  {
    var2 = 1.79769313e308;
    var0 = -180.0;
    var1 = -180.0;
  }
  result.var2 = var2;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)lastCoordinate2D
{
  $1AB5FA073B851C12C2339EC22442E995 *v3;
  double var0;
  double var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount"))
  {
    v3 = &self->_coordinates3d[self->_coordinateCount];
    var0 = v3[-1].var0;
    var1 = v3[-1].var1;
  }
  else
  {
    var0 = -180.0;
    var1 = -180.0;
  }
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- (double)length
{
  long double length;
  $1AB5FA073B851C12C2339EC22442E995 *v4;
  unint64_t coordinateCount;
  unint64_t v6;
  double *p_var1;

  length = self->_length;
  if (length == 0.0)
  {
    v4 = -[GEOMapFeatureLine coordinates3d](self, "coordinates3d");
    coordinateCount = self->_coordinateCount;
    length = self->_length;
    v6 = coordinateCount - 1;
    if (coordinateCount != 1)
    {
      p_var1 = &v4[1].var1;
      do
      {
        length = GEOCalculateDistanceRadius(*(p_var1 - 4), *(p_var1 - 3), *(p_var1 - 1), *p_var1, 6367000.0) + length;
        self->_length = length;
        p_var1 += 3;
        --v6;
      }
      while (v6);
    }
  }
  return length;
}

- (double)closestDistance2DFromCoordinate:(id)a3
{
  double v4;

  v4 = 1.79769313e308;
  -[GEOMapFeatureLine closestCoordinateFromCoordinate:outDistance:](self, "closestCoordinateFromCoordinate:outDistance:", &v4, a3.var0, a3.var1, a3.var2);
  return v4;
}

- ($1AB5FA073B851C12C2339EC22442E995)closestCoordinateFromCoordinate:(id)a3 outDistance:(double *)a4
{
  $1AB5FA073B851C12C2339EC22442E995 *v6;
  unint64_t v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double var2;
  unint64_t v13;
  double *p_var2;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  double var0;
  double var1;
  double v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  $1AB5FA073B851C12C2339EC22442E995 *v37;
  uint64_t v38;
  $1AB5FA073B851C12C2339EC22442E995 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = -[GEOMapFeatureLine coordinates3d](self, "coordinates3d");
  v7 = -[GEOMapFeatureLine coordinateCount](self, "coordinateCount");
  v9 = v7;
  if (v7 >= 2 && v6)
  {
    v11 = v6->var0;
    v10 = v6->var1;
    var2 = v6->var2;
    v13 = v7 - 1;
    p_var2 = &v6[1].var2;
    v15 = 1.79769313e308;
    *(double *)&v30 = -180.0;
    *(double *)&v28 = -180.0;
    *(double *)&v29 = 1.79769313e308;
    do
    {
      v16 = v11;
      v17 = v10;
      v11 = *(p_var2 - 2);
      v10 = *(p_var2 - 1);
      v33 = *p_var2;
      v18 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v16, v17, var2, v11, v10, *p_var2, v11, v8, var0, var1);
      v20 = v19;
      v22 = v21;
      v23 = GEOCalculateDistanceRadius(v18, v19, var0, var1, 6367000.0);
      if (v23 < v15)
      {
        *(double *)&v28 = v18;
        v29 = v22;
        *(double *)&v30 = v20;
        v15 = v23;
      }
      p_var2 += 3;
      --v13;
      var2 = v33;
    }
    while (v13);
    v25 = *(double *)&v29;
    v24 = *(double *)&v30;
    v26 = *(double *)&v28;
    if (!a4)
      goto LABEL_13;
LABEL_12:
    *a4 = v15;
    goto LABEL_13;
  }
  GEOGetGEOMapFeatureAccessLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    v35 = v9;
    v36 = 2048;
    v37 = v6;
    _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_ERROR, "Error calling -[GEOMapFeatureLine closestDistance2DFromCoordinate:] because of bad geometry. Coordinate count: %d, coordinates: %p.", buf, 0x12u);
  }

  v15 = 1.79769313e308;
  v26 = -180.0;
  v24 = -180.0;
  v25 = 1.79769313e308;
  if (a4)
    goto LABEL_12;
LABEL_13:
  result.var2 = v25;
  result.var1 = v24;
  result.var0 = v26;
  return result;
}

- (id)coordinatesDescription
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  $1AB5FA073B851C12C2339EC22442E995 *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOMapFeatureLine coordinateCount](self, "coordinateCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = -[GEOMapFeatureLine coordinates3d](self, "coordinates3d");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%2d] %0.6f, %0.6f | %0.2fm"), v5, *(_QWORD *)&v6[v4].var0, *(_QWORD *)&v6[v4].var1, *(_QWORD *)&v6[v4].var2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v5;
      ++v4;
    }
    while (v5 < -[GEOMapFeatureLine coordinateCount](self, "coordinateCount"));
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = -[GEOMapFeatureLine coordinateCount](self, "coordinateCount");
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Coordinates: %d\n%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_containingTile
{
  uint8_t v3[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Must be implemented by subclasses.", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v3, 2u);
  }
  return 0;
}

- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  uint8_t v5[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Must be implemented by subclasses.", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v5, 2u);
  }
  return 0;
}

- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  uint8_t v5[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Must be implemented by subclasses.", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v5, 2u);
  }
  return 0;
}

- (id)_formattedProtobufEnum:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "capitalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_1E1C241D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  unint64_t coordinateCount;
  size_t v6;
  void *v7;
  unint64_t v8;
  size_t v9;
  void *v10;
  id v11;
  uint8_t v13[16];

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (!self->_tempCoordinates2d)
    goto LABEL_5;
  coordinateCount = self->_coordinateCount;
  if (!coordinateCount)
    goto LABEL_5;
  v6 = 16 * coordinateCount;
  v7 = malloc_type_malloc(16 * coordinateCount, 0x66F83386uLL);
  *(_QWORD *)(v4 + 8) = v7;
  if (v7)
  {
    memcpy(v7, self->_tempCoordinates2d, v6);
LABEL_5:
    if (self->_coordinates3d)
    {
      v8 = self->_coordinateCount;
      if (v8)
      {
        v9 = 24 * v8;
        v10 = malloc_type_malloc(24 * v8, 0x1842897FuLL);
        *(_QWORD *)(v4 + 16) = v10;
        memcpy(v10, self->_coordinates3d, v9);
      }
    }
    *(_QWORD *)(v4 + 24) = self->_coordinateCount;
    *(double *)(v4 + 32) = self->_length;
    *(_BYTE *)(v4 + 40) = self->_isFlipped;
    v11 = (id)v4;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: copy->_tempCoordinates2d != ((void *)0)", v13, 2u);
  }
  v11 = 0;
LABEL_9:

  return v11;
}

@end
