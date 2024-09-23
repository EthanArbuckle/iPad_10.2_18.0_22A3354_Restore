@implementation GEOLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawCoordinate, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_coarseMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOLocation)initWithGEOCoordinate:(id)a3
{
  return -[GEOLocation initWithGEOCoordinate:isUserLocation:floorOrdinal:](self, "initWithGEOCoordinate:isUserLocation:floorOrdinal:", 0, 0x7FFFFFFFLL, a3.var0, a3.var1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOLocation latLng](self, "latLng");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (GEOLatLng)latLng
{
  -[GEOLocation _readLatLng]((uint64_t)self);
  return self->_latLng;
}

- (void)_readLatLng
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 182) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatLng_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)clearSensitiveFieldsForCoarseLocation
{
  _BOOL4 v3;
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t v6;

  v3 = -[GEOLocation hasIsShifted](self, "hasIsShifted");
  v4 = -[GEOLocation isShifted](self, "isShifted");
  v5 = -[GEOLocation hasReferenceFrame](self, "hasReferenceFrame");
  v6 = -[GEOLocation referenceFrame](self, "referenceFrame");
  -[GEOLocation clearSensitiveFields:](self, "clearSensitiveFields:", 0);
  -[GEOLocation setAltitude:](self, "setAltitude:", 0);
  -[GEOLocation setHasAltitude:](self, "setHasAltitude:", 0);
  -[GEOLocation setVerticalAccuracy:](self, "setVerticalAccuracy:", -1.0);
  -[GEOLocation setCourse:](self, "setCourse:", 0.0);
  -[GEOLocation setHasCourse:](self, "setHasCourse:", 0);
  -[GEOLocation setCourseAccuracy:](self, "setCourseAccuracy:", 0.0);
  -[GEOLocation setHasCourseAccuracy:](self, "setHasCourseAccuracy:", 0);
  -[GEOLocation setSpeed:](self, "setSpeed:", 0.0);
  -[GEOLocation setHasSpeed:](self, "setHasSpeed:", 0);
  -[GEOLocation setSpeedAccuracy:](self, "setSpeedAccuracy:", 0.0);
  -[GEOLocation setHasSpeedAccuracy:](self, "setHasSpeedAccuracy:", 0);
  -[GEOLocation setRawCoordinate:](self, "setRawCoordinate:", 0);
  -[GEOLocation setRawCourse:](self, "setRawCourse:", 0.0);
  -[GEOLocation setHasRawCourse:](self, "setHasRawCourse:", 0);
  if (v3)
    -[GEOLocation setIsShifted:](self, "setIsShifted:", v4);
  if (v5)
    -[GEOLocation setReferenceFrame:](self, "setReferenceFrame:", v6);
}

- (void)setVerticalAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000200u;
  self->_verticalAccuracy = a3;
}

- (void)setAltitude:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000400u;
  self->_altitude = a3;
}

- (void)setCourseAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000001u;
  self->_courseAccuracy = a3;
}

- (void)setCourse:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000002u;
  self->_course = a3;
}

- (void)setRawCourse:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000010u;
  self->_rawCourse = a3;
}

- (void)setRawCoordinate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x3000000u;
  objc_storeStrong((id *)&self->_rawCoordinate, a3);
}

- (void)setSpeedAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000020u;
  self->_speedAccuracy = a3;
}

- (void)setSpeed:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000040u;
  self->_speed = a3;
}

- (void)setHasSpeedAccuracy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554464;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (void)setHasSpeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554496;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (void)setHasRawCourse:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554448;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (void)setHasCourseAccuracy:(BOOL)a3
{
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x2000000);
}

- (void)setHasCourse:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554434;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (void)setHasAltitude:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33555456;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)isShifted
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x100000) != 0 && self->_isShifted;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLocationClearSensitiveFields(self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;
  id v12;
  void *v13;
  $7795A3DA557233CC8B57BE35C358A0B5 v14;
  id v15;
  void *v16;
  $7795A3DA557233CC8B57BE35C358A0B5 v17;
  PBUnknownFields *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLocation readAll:](self, "readAll:", 0);
    v9 = -[GEOLatLng copyWithZone:](self->_latLng, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v9;

    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x40000) != 0)
    {
      *(_DWORD *)(v5 + 172) = self->_type;
      *(_DWORD *)(v5 + 180) |= 0x40000u;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 0x80) == 0)
      {
LABEL_7:
        if ((*(_WORD *)&flags & 0x400) == 0)
          goto LABEL_8;
        goto LABEL_33;
      }
    }
    else if ((*(_BYTE *)&flags & 0x80) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 104) = self->_timestamp;
    *(_DWORD *)(v5 + 180) |= 0x80u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_9;
      goto LABEL_34;
    }
LABEL_33:
    *(_DWORD *)(v5 + 140) = self->_altitude;
    *(_DWORD *)(v5 + 180) |= 0x400u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_35;
    }
LABEL_34:
    *(double *)(v5 + 56) = self->_horizontalAccuracy;
    *(_DWORD *)(v5 + 180) |= 8u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&flags & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_36;
    }
LABEL_35:
    *(double *)(v5 + 120) = self->_verticalAccuracy;
    *(_DWORD *)(v5 + 180) |= 0x200u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_12;
      goto LABEL_37;
    }
LABEL_36:
    *(double *)(v5 + 96) = self->_speed;
    *(_DWORD *)(v5 + 180) |= 0x40u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&flags & 2) == 0)
        goto LABEL_13;
      goto LABEL_38;
    }
LABEL_37:
    *(double *)(v5 + 48) = self->_heading;
    *(_DWORD *)(v5 + 180) |= 4u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_14;
      goto LABEL_39;
    }
LABEL_38:
    *(double *)(v5 + 40) = self->_course;
    *(_DWORD *)(v5 + 180) |= 2u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&flags & 0x2000) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
LABEL_39:
    *(double *)(v5 + 32) = self->_courseAccuracy;
    *(_DWORD *)(v5 + 180) |= 1u;
    if ((*(_DWORD *)&self->_flags & 0x2000) == 0)
    {
LABEL_16:
      v12 = -[GEOCoarseLocationMetadata copyWithZone:](self->_coarseMetadata, "copyWithZone:", a3);
      v13 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v12;

      v14 = self->_flags;
      if ((*(_WORD *)&v14 & 0x800) != 0)
      {
        *(_DWORD *)(v5 + 144) = self->_courseType;
        *(_DWORD *)(v5 + 180) |= 0x800u;
        v14 = self->_flags;
        if ((*(_BYTE *)&v14 & 0x20) == 0)
        {
LABEL_18:
          if ((*(_DWORD *)&v14 & 0x80000) == 0)
            goto LABEL_19;
          goto LABEL_43;
        }
      }
      else if ((*(_BYTE *)&v14 & 0x20) == 0)
      {
        goto LABEL_18;
      }
      *(double *)(v5 + 88) = self->_speedAccuracy;
      *(_DWORD *)(v5 + 180) |= 0x20u;
      v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x80000) == 0)
      {
LABEL_19:
        if ((*(_DWORD *)&v14 & 0x100000) == 0)
          goto LABEL_20;
        goto LABEL_44;
      }
LABEL_43:
      *(_BYTE *)(v5 + 176) = self->_isMatchedLocation;
      *(_DWORD *)(v5 + 180) |= 0x80000u;
      v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x100000) == 0)
      {
LABEL_20:
        if ((*(_WORD *)&v14 & 0x100) == 0)
          goto LABEL_21;
        goto LABEL_45;
      }
LABEL_44:
      *(_BYTE *)(v5 + 177) = self->_isShifted;
      *(_DWORD *)(v5 + 180) |= 0x100000u;
      v14 = self->_flags;
      if ((*(_WORD *)&v14 & 0x100) == 0)
      {
LABEL_21:
        if ((*(_WORD *)&v14 & 0x8000) == 0)
          goto LABEL_23;
        goto LABEL_22;
      }
LABEL_45:
      *(_QWORD *)(v5 + 112) = self->_transitID;
      *(_DWORD *)(v5 + 180) |= 0x100u;
      if ((*(_DWORD *)&self->_flags & 0x8000) == 0)
      {
LABEL_23:
        v15 = -[GEOLatLng copyWithZone:](self->_rawCoordinate, "copyWithZone:", a3);
        v16 = *(void **)(v5 + 72);
        *(_QWORD *)(v5 + 72) = v15;

        v17 = self->_flags;
        if ((*(_BYTE *)&v17 & 0x10) != 0)
        {
          *(double *)(v5 + 80) = self->_rawCourse;
          *(_DWORD *)(v5 + 180) |= 0x10u;
          v17 = self->_flags;
          if ((*(_WORD *)&v17 & 0x4000) == 0)
          {
LABEL_25:
            if ((*(_WORD *)&v17 & 0x1000) == 0)
              goto LABEL_26;
            goto LABEL_49;
          }
        }
        else if ((*(_WORD *)&v17 & 0x4000) == 0)
        {
          goto LABEL_25;
        }
        *(_DWORD *)(v5 + 156) = self->_matchQuality;
        *(_DWORD *)(v5 + 180) |= 0x4000u;
        v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x1000) == 0)
        {
LABEL_26:
          if ((*(_DWORD *)&v17 & 0x10000) == 0)
            goto LABEL_27;
          goto LABEL_50;
        }
LABEL_49:
        *(_DWORD *)(v5 + 148) = self->_formOfWay;
        *(_DWORD *)(v5 + 180) |= 0x1000u;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x10000) == 0)
        {
LABEL_27:
          if ((*(_DWORD *)&v17 & 0x20000) == 0)
          {
LABEL_29:
            v18 = self->_unknownFields;
            v8 = *(id *)(v5 + 16);
            *(_QWORD *)(v5 + 16) = v18;
            goto LABEL_30;
          }
LABEL_28:
          *(_DWORD *)(v5 + 168) = self->_transportType;
          *(_DWORD *)(v5 + 180) |= 0x20000u;
          goto LABEL_29;
        }
LABEL_50:
        *(_DWORD *)(v5 + 164) = self->_roadClass;
        *(_DWORD *)(v5 + 180) |= 0x10000u;
        if ((*(_DWORD *)&self->_flags & 0x20000) == 0)
          goto LABEL_29;
        goto LABEL_28;
      }
LABEL_22:
      *(_DWORD *)(v5 + 160) = self->_referenceFrame;
      *(_DWORD *)(v5 + 180) |= 0x8000u;
      goto LABEL_23;
    }
LABEL_15:
    *(_DWORD *)(v5 + 152) = self->_levelOrdinal;
    *(_DWORD *)(v5 + 180) |= 0x2000u;
    goto LABEL_16;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 3) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLocationReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_30:
  return (id)v5;
}

- (GEOLocation)init
{
  GEOLocation *v2;
  GEOLocation *v3;
  GEOLocation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLocation;
  v2 = -[GEOLocation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasSpeedAccuracy
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)hasIsMatchedLocation
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)hasReferenceFrame
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (BOOL)hasIsShifted
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)hasTransitID
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4 floorOrdinal:(int)a5
{
  uint64_t v5;
  GEOLatLng *v7;
  GEOLocation *v8;

  v5 = *(_QWORD *)&a5;
  v7 = -[GEOLatLng initWithLatitude:longitude:]([GEOLatLng alloc], "initWithLatitude:longitude:", a3, a4);
  v8 = -[GEOLocation initWithLocation:isUserLocation:floorOrdinal:](self, "initWithLocation:isUserLocation:floorOrdinal:", v7, 0, v5);

  return v8;
}

- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4 isUserLocation:(BOOL)a5 floorOrdinal:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  GEOLatLng *v9;
  GEOLocation *v10;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v9 = -[GEOLatLng initWithLatitude:longitude:]([GEOLatLng alloc], "initWithLatitude:longitude:", a3, a4);
  v10 = -[GEOLocation initWithLocation:isUserLocation:floorOrdinal:](self, "initWithLocation:isUserLocation:floorOrdinal:", v9, v7, v6);

  return v10;
}

- (GEOLocation)initWithLocation:(id)a3 isUserLocation:(BOOL)a4 floorOrdinal:(int)a5
{
  uint64_t v5;
  _BOOL4 v6;
  id v8;
  GEOLocation *v9;
  GEOLocation *v10;
  void *v11;
  GEOLocation *v12;
  objc_super v14;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOLocation;
  v9 = -[GEOLocation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[GEOLocation setLatLng:](v9, "setLatLng:", v8);
    if (v6)
    {
      -[GEOLocation latLng](v10, "latLng");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setGtLog:", 1);

    }
    if ((_DWORD)v5 != 0x7FFFFFFF)
      -[GEOLocation setLevelOrdinal:](v10, "setLevelOrdinal:", v5);
    v12 = v10;
  }

  return v10;
}

- (void)setLatLng:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2800000u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (void)setTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000080u;
  self->_timestamp = a3;
}

- (int)referenceFrame
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x8000) != 0)
    return self->_referenceFrame;
  else
    return 0;
}

- (void)setHeading:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000004u;
  self->_heading = a3;
}

- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4
{
  return -[GEOLocation initWithLatitude:longitude:floorOrdinal:](self, "initWithLatitude:longitude:floorOrdinal:", 0x7FFFFFFFLL, a3, a4);
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2040000u;
  self->_type = a3;
}

- (void)setIsShifted:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2100000u;
  self->_isShifted = a3;
}

- (void)setIsMatchedLocation:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2080000u;
  self->_isMatchedLocation = a3;
}

- (double)course
{
  return self->_course;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)speed
{
  return self->_speed;
}

- (int)altitude
{
  return self->_altitude;
}

- (GEOLatLng)rawCoordinate
{
  -[GEOLocation _readRawCoordinate]((uint64_t)self);
  return self->_rawCoordinate;
}

- (void)_readRawCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 183) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRawCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)setLevelOrdinal:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2002000u;
  self->_levelOrdinal = a3;
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;
  id v6;
  $7795A3DA557233CC8B57BE35C358A0B5 v7;
  $7795A3DA557233CC8B57BE35C358A0B5 v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*((_WORD *)&self->_flags + 1) & 0x3C0) == 0)
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "writeData:", v10);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_54;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLocation readAll:](self, "readAll:", 0);
  PBDataWriterWriteSubmessage();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = self->_flags;
  }
  v6 = v11;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v11;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v6 = v11;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  v6 = v11;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  v6 = v11;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  v6 = v11;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  v6 = v11;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  v6 = v11;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt32Field();
    v6 = v11;
  }
LABEL_16:
  if (self->_coarseMetadata)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v11;
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x20) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v7 & 0x80000) == 0)
        goto LABEL_21;
      goto LABEL_44;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteDoubleField();
  v6 = v11;
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  v6 = v11;
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  v6 = v11;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  v6 = v11;
  if ((*(_DWORD *)&self->_flags & 0x8000) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt32Field();
    v6 = v11;
  }
LABEL_25:
  if (self->_rawCoordinate)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v11;
    v8 = self->_flags;
    if ((*(_WORD *)&v8 & 0x4000) == 0)
    {
LABEL_29:
      if ((*(_WORD *)&v8 & 0x1000) == 0)
        goto LABEL_30;
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteInt32Field();
  v6 = v11;
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
      goto LABEL_31;
LABEL_51:
    PBDataWriterWriteInt32Field();
    v6 = v11;
    if ((*(_DWORD *)&self->_flags & 0x20000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  v6 = v11;
  v8 = self->_flags;
  if ((*(_DWORD *)&v8 & 0x10000) != 0)
    goto LABEL_51;
LABEL_31:
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
  {
LABEL_32:
    PBDataWriterWriteInt32Field();
    v6 = v11;
  }
LABEL_33:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_54:

}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_644;
    else
      v8 = (int *)&readAll__nonRecursiveTag_645;
    GEOLocationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_latLng, "readAll:", 1);
    -[GEOCoarseLocationMetadata readAll:](self->_coarseMetadata, "readAll:", 1);
    -[GEOLatLng readAll:](self->_rawCoordinate, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2008000u;
  self->_referenceFrame = a3;
}

- (void)setCoarseMetadata:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2400000u;
  objc_storeStrong((id *)&self->_coarseMetadata, a3);
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000008u;
  self->_horizontalAccuracy = a3;
}

- (GEOCoarseLocationMetadata)coarseMetadata
{
  -[GEOLocation _readCoarseMetadata]((uint64_t)self);
  return self->_coarseMetadata;
}

- (void)_readCoarseMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 182) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoarseMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (id)dictionaryRepresentation
{
  return -[GEOLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  unsigned int v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  int v25;
  int v26;
  __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  int v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  uint64_t v42;
  __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  _QWORD v56[4];
  id v57;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "latLng");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("latLng"));
  }

  v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 0x40000) != 0)
  {
    v9 = *(_DWORD *)(a1 + 172) - 1;
    if (v9 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 172));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C13A30[v9];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("type"));

    v8 = *(_DWORD *)(a1 + 180);
  }
  if ((v8 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("timestamp"));

    v8 = *(_DWORD *)(a1 + 180);
    if ((v8 & 0x400) == 0)
    {
LABEL_14:
      if ((v8 & 8) == 0)
        goto LABEL_15;
      goto LABEL_30;
    }
  }
  else if ((v8 & 0x400) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 140));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("altitude"));

  v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 8) == 0)
  {
LABEL_15:
    if ((v8 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("horizontalAccuracy"));

  v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 0x200) == 0)
  {
LABEL_16:
    if ((v8 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 120));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("verticalAccuracy"));

  v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 0x40) == 0)
  {
LABEL_17:
    if ((v8 & 4) == 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 96));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("speed"));

  v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 4) == 0)
  {
LABEL_18:
    if ((v8 & 2) == 0)
      goto LABEL_19;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("heading"));

  v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 2) == 0)
  {
LABEL_19:
    if ((v8 & 1) == 0)
      goto LABEL_20;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("course"));

  v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 1) == 0)
  {
LABEL_20:
    if ((v8 & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("courseAccuracy");
  else
    v23 = CFSTR("course_accuracy");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  if ((*(_DWORD *)(a1 + 180) & 0x2000) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 152));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("levelOrdinal");
    else
      v12 = CFSTR("level_ordinal");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
LABEL_25:
  objc_msgSend((id)a1, "coarseMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("coarseMetadata"));
  }

  v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x800) != 0)
  {
    v26 = *(_DWORD *)(a1 + 144);
    if (v26)
    {
      if (v26 == 1)
      {
        v27 = CFSTR("DEAD_RECKONING");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 144));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v27 = CFSTR("UNKNOWN");
    }
    if (a2)
      v28 = CFSTR("courseType");
    else
      v28 = CFSTR("course_type");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v25 = *(_DWORD *)(a1 + 180);
    if ((v25 & 0x20) == 0)
    {
LABEL_44:
      if ((v25 & 0x80000) == 0)
        goto LABEL_45;
      goto LABEL_59;
    }
  }
  else if ((v25 & 0x20) == 0)
  {
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("speedAccuracy"));

  v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x80000) == 0)
  {
LABEL_45:
    if ((v25 & 0x100000) == 0)
      goto LABEL_46;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 176));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("isMatchedLocation"));

  v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x100000) == 0)
  {
LABEL_46:
    if ((v25 & 0x100) == 0)
      goto LABEL_47;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 177));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("isShifted"));

  v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x100) == 0)
  {
LABEL_47:
    if ((v25 & 0x8000) == 0)
      goto LABEL_66;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 112));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("transitID"));

  if ((*(_DWORD *)(a1 + 180) & 0x8000) == 0)
    goto LABEL_66;
LABEL_62:
  v33 = *(int *)(a1 + 160);
  if (v33 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 160));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_1E1C13A50[v33];
  }
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("referenceFrame"));

LABEL_66:
  objc_msgSend((id)a1, "rawCoordinate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v35, "jsonRepresentation");
    else
      objc_msgSend(v35, "dictionaryRepresentation");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("rawCoordinate"));
  }

  v38 = *(_DWORD *)(a1 + 180);
  if ((v38 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("rawCourse"));

    v38 = *(_DWORD *)(a1 + 180);
    if ((v38 & 0x4000) == 0)
    {
LABEL_73:
      if ((v38 & 0x1000) == 0)
        goto LABEL_74;
      goto LABEL_82;
    }
  }
  else if ((v38 & 0x4000) == 0)
  {
    goto LABEL_73;
  }
  v40 = *(int *)(a1 + 156);
  if (v40 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 156));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = off_1E1C13A68[v40];
  }
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("matchQuality"));

  v38 = *(_DWORD *)(a1 + 180);
  if ((v38 & 0x1000) == 0)
  {
LABEL_74:
    if ((v38 & 0x10000) == 0)
      goto LABEL_75;
LABEL_87:
    v44 = *(int *)(a1 + 164);
    if (v44 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 164));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = off_1E1C13B38[v44];
    }
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("roadClass"));

    if ((*(_DWORD *)(a1 + 180) & 0x20000) == 0)
      goto LABEL_95;
    goto LABEL_91;
  }
LABEL_82:
  v42 = *(int *)(a1 + 148);
  if (v42 < 0x17 && ((0x7EDDDFu >> v42) & 1) != 0)
  {
    v43 = off_1E1C13A80[v42];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 148));
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("formOfWay"));

  v38 = *(_DWORD *)(a1 + 180);
  if ((v38 & 0x10000) != 0)
    goto LABEL_87;
LABEL_75:
  if ((v38 & 0x20000) != 0)
  {
LABEL_91:
    v46 = *(int *)(a1 + 168);
    if (v46 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 168));
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_1E1C13B88[v46];
    }
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("transportType"));

  }
LABEL_95:
  v48 = *(void **)(a1 + 16);
  if (v48)
  {
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __41__GEOLocation__dictionaryRepresentation___block_invoke;
      v56[3] = &unk_1E1C00600;
      v52 = v51;
      v57 = v52;
      objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v56);
      v53 = v52;

      v50 = v53;
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("Unknown Fields"));

  }
  v54 = v4;

  return v54;
}

- (GEOLocation)initWithLocation:(id)a3
{
  return -[GEOLocation initWithLocation:floorOrdinal:](self, "initWithLocation:floorOrdinal:", a3, 0x7FFFFFFFLL);
}

- (GEOLocation)initWithLocation:(id)a3 floorOrdinal:(int)a4
{
  return -[GEOLocation initWithLocation:isUserLocation:floorOrdinal:](self, "initWithLocation:isUserLocation:floorOrdinal:", a3, 0, 0x7FFFFFFFLL);
}

- (GEOLocation)initWithGEOCoordinate:(id)a3 isUserLocation:(BOOL)a4
{
  return -[GEOLocation initWithGEOCoordinate:isUserLocation:floorOrdinal:](self, "initWithGEOCoordinate:isUserLocation:floorOrdinal:", a4, 0x7FFFFFFFLL, a3.var0, a3.var1);
}

- (GEOLocation)initWithGEOCoordinate:(id)a3 floorOrdinal:(int)a4
{
  return -[GEOLocation initWithLatitude:longitude:isUserLocation:floorOrdinal:](self, "initWithLatitude:longitude:isUserLocation:floorOrdinal:", 0, *(_QWORD *)&a4, a3.var0, a3.var1);
}

- (BOOL)hasAccurateCourse
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;

  v3 = -[GEOLocation hasCourse](self, "hasCourse");
  if (v3)
  {
    v3 = -[GEOLocation hasCourseAccuracy](self, "hasCourseAccuracy");
    if (v3)
    {
      -[GEOLocation course](self, "course");
      if (v4 >= 0.0 && (-[GEOLocation courseAccuracy](self, "courseAccuracy"), v5 >= 0.0))
      {
        -[GEOLocation courseAccuracy](self, "courseAccuracy");
        LOBYTE(v3) = v6 < 180.0;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (void)applyCoarseLocationRandomizationWithMaximumDistance:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  GEOLatLng *v16;
  NSObject *v17;
  double v18;
  int v19;
  long double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[GEOLocation coordinate](self, "coordinate");
  v6 = v5;
  v8 = v7;
  v9 = (double)arc4random_uniform((a3 + a3)) - a3;
  v10 = (double)arc4random_uniform((a3 + a3)) - a3;
  v11 = 1.0 / GEOMapPointsPerMeterAtLatitude(v6);
  v12 = v9 / v11 + GEOMapPointForCoordinate(v6, v8);
  v14 = exp(((v13 + v10 / v11) * 0.0078125 + -1048576.0) / 333772.107);
  v15 = (atan(v14) * -2.0 + 1.57079633) * 57.2957795;
  v16 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v15, v12 * 0.0078125 * 0.000171661377 + -180.0);
  -[GEOLocation setLatLng:](self, "setLatLng:", v16);

  GEOGetCoarseLocationLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = 134283521;
    v20 = GEOCalculateDistanceRadius(v6, v8, v15, v12 * 0.0078125 * 0.000171661377 + -180.0, 6367000.0);
    _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "Moved representative point by %{private}.1f meters", (uint8_t *)&v19, 0xCu);
  }

  -[GEOLocation horizontalAccuracy](self, "horizontalAccuracy");
  -[GEOLocation setHorizontalAccuracy:](self, "setHorizontalAccuracy:", sqrt((a3 + a3) * a3) + v18);
}

- (GEOLocation)initWithData:(id)a3
{
  GEOLocation *v3;
  GEOLocation *v4;
  GEOLocation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLocation;
  v3 = -[GEOLocation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x40000) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setHasType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33816576;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E1C13A30[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GPS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IP_ADDRESS")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554560;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)hasAltitude
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554440;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554944;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFDFFFDFF | v3);
}

- (BOOL)hasVerticalAccuracy
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)hasSpeed
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHasHeading:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554436;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasHeading
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)hasCourse
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (BOOL)hasCourseAccuracy
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)levelOrdinal
{
  return self->_levelOrdinal;
}

- (void)setHasLevelOrdinal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33562624;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasLevelOrdinal
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)hasCoarseMetadata
{
  -[GEOLocation _readCoarseMetadata]((uint64_t)self);
  return self->_coarseMetadata != 0;
}

- (int)courseType
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x800) != 0)
    return self->_courseType;
  else
    return 0;
}

- (void)setCourseType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000800u;
  self->_courseType = a3;
}

- (void)setHasCourseType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33556480;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasCourseType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)courseTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("DEAD_RECKONING");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCourseType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DEAD_RECKONING"));

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOLocation;
  -[GEOLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOLocation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOLocation)initWithDictionary:(id)a3
{
  return (GEOLocation *)-[GEOLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  GEOCoarseLocationMetadata *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  GEOLatLng *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;

  v5 = a2;
  if (a1)
  {
    a1 = (id)objc_msgSend(a1, "init");

    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latLng"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOLatLng initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOLatLng initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setLatLng:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GPS")) & 1) != 0)
        {
          v12 = 1;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WIFI")) & 1) != 0)
        {
          v12 = 2;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CELL")) & 1) != 0)
        {
          v12 = 3;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("IP_ADDRESS")))
        {
          v12 = 4;
        }
        else
        {
          v12 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_22;
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setType:", v12);
LABEL_22:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("altitude"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAltitude:", objc_msgSend(v14, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "doubleValue");
        objc_msgSend(a1, "setHorizontalAccuracy:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("verticalAccuracy"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "doubleValue");
        objc_msgSend(a1, "setVerticalAccuracy:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("speed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(a1, "setSpeed:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("heading"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(a1, "setHeading:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("course"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "doubleValue");
        objc_msgSend(a1, "setCourse:");
      }

      if (a3)
        v20 = CFSTR("courseAccuracy");
      else
        v20 = CFSTR("course_accuracy");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v21, "doubleValue");
        objc_msgSend(a1, "setCourseAccuracy:");
      }

      if (a3)
        v22 = CFSTR("levelOrdinal");
      else
        v22 = CFSTR("level_ordinal");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLevelOrdinal:", objc_msgSend(v23, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coarseMetadata"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOCoarseLocationMetadata alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOCoarseLocationMetadata initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOCoarseLocationMetadata initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setCoarseMetadata:", v26);

      }
      if (a3)
        v28 = CFSTR("courseType");
      else
        v28 = CFSTR("course_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v29;
        if ((objc_msgSend(v30, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          v31 = 0;
        else
          v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("DEAD_RECKONING"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_62;
        v31 = objc_msgSend(v29, "intValue");
      }
      objc_msgSend(a1, "setCourseType:", v31);
LABEL_62:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("speedAccuracy"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v32, "doubleValue");
        objc_msgSend(a1, "setSpeedAccuracy:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isMatchedLocation"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsMatchedLocation:", objc_msgSend(v33, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isShifted"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsShifted:", objc_msgSend(v34, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitID:", objc_msgSend(v35, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("referenceFrame"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = v36;
        if ((objc_msgSend(v37, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v38 = 0;
        }
        else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
        {
          v38 = 1;
        }
        else if (objc_msgSend(v37, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
        {
          v38 = 2;
        }
        else
        {
          v38 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_82;
        v38 = objc_msgSend(v36, "intValue");
      }
      objc_msgSend(a1, "setReferenceFrame:", v38);
LABEL_82:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rawCoordinate"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v41 = -[GEOLatLng initWithJSON:](v40, "initWithJSON:", v39);
        else
          v41 = -[GEOLatLng initWithDictionary:](v40, "initWithDictionary:", v39);
        v42 = (void *)v41;
        objc_msgSend(a1, "setRawCoordinate:", v41);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rawCourse"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v43, "doubleValue");
        objc_msgSend(a1, "setRawCourse:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchQuality"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v44;
        if ((objc_msgSend(v45, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v46 = 0;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("STRONG")) & 1) != 0)
        {
          v46 = 1;
        }
        else if (objc_msgSend(v45, "isEqualToString:", CFSTR("AMBIGUOUS")))
        {
          v46 = 2;
        }
        else
        {
          v46 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_101;
        v46 = objc_msgSend(v44, "intValue");
      }
      objc_msgSend(a1, "setMatchQuality:", v46);
LABEL_101:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("formOfWay"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v47;
        if ((objc_msgSend(v48, "isEqualToString:", CFSTR("FOW_UNKNOWN")) & 1) != 0)
        {
          v49 = 0;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_MOTORWAY")) & 1) != 0)
        {
          v49 = 1;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_MULTI_CARRIAGEWAY_WHICH_IS_NOT_A_MOTORWAY")) & 1) != 0)
        {
          v49 = 2;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_A_SINGLE_CARRIAGEWAY_DEFAULT")) & 1) != 0)
        {
          v49 = 3;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_A_ROUNDABOUT")) & 1) != 0)
        {
          v49 = 4;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_AN_ETA_PARKING_PLACE")) & 1) != 0)
        {
          v49 = 6;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_AN_ETA_PARKING_GARAGE_BUILDING")) & 1) != 0)
        {
          v49 = 7;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_AN_ETA_UNSTRUCTURED_TRAFFIC_SQUARE")) & 1) != 0)
        {
          v49 = 8;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_A_SLIP_ROAD")) & 1) != 0)
        {
          v49 = 10;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_A_SERVICE_ROAD")) & 1) != 0)
        {
          v49 = 11;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("ENTRANCE_EXIT_TO_FROM_A_CAR_PARK")) & 1) != 0)
        {
          v49 = 12;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_A_PEDESTRIAN_ZONE")) & 1) != 0)
        {
          v49 = 14;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PART_OF_A_WALKWAY")) & 1) != 0)
        {
          v49 = 15;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("SPECIAL_TRAFFIC_FIGURES")) & 1) != 0)
        {
          v49 = 17;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("FOW_ETA_GALLERY")) & 1) != 0)
        {
          v49 = 18;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("FOW_STAIRS")) & 1) != 0)
        {
          v49 = 19;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("ROAD_FOR_AUTHORITIES")) & 1) != 0)
        {
          v49 = 20;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("FOW_CONNECTOR")) & 1) != 0)
        {
          v49 = 21;
        }
        else if (objc_msgSend(v48, "isEqualToString:", CFSTR("FOW_CUL_DE_SAC")))
        {
          v49 = 22;
        }
        else
        {
          v49 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_145;
        v49 = objc_msgSend(v47, "intValue");
      }
      objc_msgSend(a1, "setFormOfWay:", v49);
LABEL_145:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roadClass"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = v50;
        if ((objc_msgSend(v51, "isEqualToString:", CFSTR("MOTORWAY_FREEWAY_OR_OTHER_MAJOR_ROAD")) & 1) != 0)
        {
          v52 = 0;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("A_MAJOR_ROAD_LESS_IMPORTANT_THAN_A_MOTORWAY")) & 1) != 0)
        {
          v52 = 1;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("OTHER_MAJOR_ROAD")) & 1) != 0)
        {
          v52 = 2;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("SECONDARY_ROAD")) & 1) != 0)
        {
          v52 = 3;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("LOCAL_CONNECTING_ROAD")) & 1) != 0)
        {
          v52 = 4;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("LOCAL_ROAD_OF_HIGH_IMPORTANCE")) & 1) != 0)
        {
          v52 = 5;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("LOCAL_ROAD")) & 1) != 0)
        {
          v52 = 6;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("LOCAL_ROAD_OF_MINOR_IMPORTANCE")) & 1) != 0)
        {
          v52 = 7;
        }
        else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("OTHER_ROAD")) & 1) != 0)
        {
          v52 = 8;
        }
        else if (objc_msgSend(v51, "isEqualToString:", CFSTR("UNKNOWN_ROAD")))
        {
          v52 = 9;
        }
        else
        {
          v52 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_171;
        v52 = objc_msgSend(v50, "intValue");
      }
      objc_msgSend(a1, "setRoadClass:", v52);
LABEL_171:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = v53;
        if ((objc_msgSend(v54, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
        {
          v55 = 0;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
        {
          v55 = 1;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
        {
          v55 = 2;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
        {
          v55 = 3;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
        {
          v55 = 4;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
        {
          v55 = 5;
        }
        else if (objc_msgSend(v54, "isEqualToString:", CFSTR("RIDESHARE")))
        {
          v55 = 6;
        }
        else
        {
          v55 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_191:

          a1 = a1;
          goto LABEL_192;
        }
        v55 = objc_msgSend(v53, "intValue");
      }
      objc_msgSend(a1, "setTransportType:", v55);
      goto LABEL_191;
    }
  }
LABEL_192:

  return a1;
}

- (GEOLocation)initWithJSON:(id)a3
{
  return (GEOLocation *)-[GEOLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocationReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOLocation _readLatLng]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_latLng, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLocation _readRawCoordinate]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_rawCoordinate, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;
  $7795A3DA557233CC8B57BE35C358A0B5 v6;
  $7795A3DA557233CC8B57BE35C358A0B5 v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOLocation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 32) = self->_readerMarkPos;
  *((_DWORD *)v8 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v8, "setLatLng:", self->_latLng);
  v4 = v8;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    *((_DWORD *)v8 + 43) = self->_type;
    *((_DWORD *)v8 + 45) |= 0x40000u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&flags & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v8[13] = *(id *)&self->_timestamp;
  *((_DWORD *)v8 + 45) |= 0x80u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v8 + 35) = self->_altitude;
  *((_DWORD *)v8 + 45) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  v8[7] = *(id *)&self->_horizontalAccuracy;
  *((_DWORD *)v8 + 45) |= 8u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  v8[15] = *(id *)&self->_verticalAccuracy;
  *((_DWORD *)v8 + 45) |= 0x200u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  v8[12] = *(id *)&self->_speed;
  *((_DWORD *)v8 + 45) |= 0x40u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  v8[6] = *(id *)&self->_heading;
  *((_DWORD *)v8 + 45) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  v8[5] = *(id *)&self->_course;
  *((_DWORD *)v8 + 45) |= 2u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_38:
  v8[4] = *(id *)&self->_courseAccuracy;
  *((_DWORD *)v8 + 45) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_11:
    *((_DWORD *)v8 + 38) = self->_levelOrdinal;
    *((_DWORD *)v8 + 45) |= 0x2000u;
  }
LABEL_12:
  if (self->_coarseMetadata)
  {
    objc_msgSend(v8, "setCoarseMetadata:");
    v4 = v8;
  }
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_courseType;
    *((_DWORD *)v4 + 45) |= 0x800u;
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 0x20) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x80000) == 0)
        goto LABEL_17;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  v4[11] = *(id *)&self->_speedAccuracy;
  *((_DWORD *)v4 + 45) |= 0x20u;
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  *((_BYTE *)v4 + 176) = self->_isMatchedLocation;
  *((_DWORD *)v4 + 45) |= 0x80000u;
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  *((_BYTE *)v4 + 177) = self->_isShifted;
  *((_DWORD *)v4 + 45) |= 0x100000u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_44:
  v4[14] = (id)self->_transitID;
  *((_DWORD *)v4 + 45) |= 0x100u;
  if ((*(_DWORD *)&self->_flags & 0x8000) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 40) = self->_referenceFrame;
    *((_DWORD *)v4 + 45) |= 0x8000u;
  }
LABEL_21:
  if (self->_rawCoordinate)
  {
    objc_msgSend(v8, "setRawCoordinate:");
    v4 = v8;
  }
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x10) != 0)
  {
    v4[10] = *(id *)&self->_rawCourse;
    *((_DWORD *)v4 + 45) |= 0x10u;
    v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x4000) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v7 & 0x1000) == 0)
        goto LABEL_26;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v4 + 39) = self->_matchQuality;
  *((_DWORD *)v4 + 45) |= 0x4000u;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_27;
LABEL_49:
    *((_DWORD *)v4 + 41) = self->_roadClass;
    *((_DWORD *)v4 + 45) |= 0x10000u;
    if ((*(_DWORD *)&self->_flags & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_48:
  *((_DWORD *)v4 + 37) = self->_formOfWay;
  *((_DWORD *)v4 + 45) |= 0x1000u;
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
    goto LABEL_49;
LABEL_27:
  if ((*(_DWORD *)&v7 & 0x20000) != 0)
  {
LABEL_28:
    *((_DWORD *)v4 + 42) = self->_transportType;
    *((_DWORD *)v4 + 45) |= 0x20000u;
  }
LABEL_29:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *latLng;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;
  int v7;
  GEOCoarseLocationMetadata *coarseMetadata;
  GEOLatLng *rawCoordinate;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_121;
  -[GEOLocation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:"))
      goto LABEL_121;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 45);
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_type != *((_DWORD *)v4 + 43))
      goto LABEL_121;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_timestamp != *((double *)v4 + 13))
      goto LABEL_121;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_altitude != *((_DWORD *)v4 + 35))
      goto LABEL_121;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_horizontalAccuracy != *((double *)v4 + 7))
      goto LABEL_121;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_verticalAccuracy != *((double *)v4 + 15))
      goto LABEL_121;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_speed != *((double *)v4 + 12))
      goto LABEL_121;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_heading != *((double *)v4 + 6))
      goto LABEL_121;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_course != *((double *)v4 + 5))
      goto LABEL_121;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_courseAccuracy != *((double *)v4 + 4))
      goto LABEL_121;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_levelOrdinal != *((_DWORD *)v4 + 38))
      goto LABEL_121;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_121;
  }
  coarseMetadata = self->_coarseMetadata;
  if ((unint64_t)coarseMetadata | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOCoarseLocationMetadata isEqual:](coarseMetadata, "isEqual:"))
      goto LABEL_121;
    flags = self->_flags;
    v7 = *((_DWORD *)v4 + 45);
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_courseType != *((_DWORD *)v4 + 36))
      goto LABEL_121;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_speedAccuracy != *((double *)v4 + 11))
      goto LABEL_121;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0)
      goto LABEL_121;
    if (self->_isMatchedLocation)
    {
      if (!*((_BYTE *)v4 + 176))
        goto LABEL_121;
    }
    else if (*((_BYTE *)v4 + 176))
    {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0)
      goto LABEL_121;
    if (self->_isShifted)
    {
      if (!*((_BYTE *)v4 + 177))
        goto LABEL_121;
    }
    else if (*((_BYTE *)v4 + 177))
    {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_transitID != *((_QWORD *)v4 + 14))
      goto LABEL_121;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 40))
      goto LABEL_121;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_121;
  }
  rawCoordinate = self->_rawCoordinate;
  if ((unint64_t)rawCoordinate | *((_QWORD *)v4 + 9))
  {
    if (-[GEOLatLng isEqual:](rawCoordinate, "isEqual:"))
    {
      flags = self->_flags;
      v7 = *((_DWORD *)v4 + 45);
      goto LABEL_96;
    }
LABEL_121:
    v10 = 0;
    goto LABEL_122;
  }
LABEL_96:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_rawCourse != *((double *)v4 + 10))
      goto LABEL_121;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_matchQuality != *((_DWORD *)v4 + 39))
      goto LABEL_121;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_formOfWay != *((_DWORD *)v4 + 37))
      goto LABEL_121;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_roadClass != *((_DWORD *)v4 + 41))
      goto LABEL_121;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_transportType != *((_DWORD *)v4 + 42))
      goto LABEL_121;
    v10 = 1;
  }
  else
  {
    v10 = (v7 & 0x20000) == 0;
  }
LABEL_122:

  return v10;
}

- (unint64_t)hash
{
  $7795A3DA557233CC8B57BE35C358A0B5 flags;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  double horizontalAccuracy;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double verticalAccuracy;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double speed;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double heading;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double course;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double courseAccuracy;
  double v36;
  long double v37;
  double v38;
  $7795A3DA557233CC8B57BE35C358A0B5 v39;
  unint64_t v40;
  double speedAccuracy;
  double v42;
  long double v43;
  double v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  $7795A3DA557233CC8B57BE35C358A0B5 v48;
  unint64_t v49;
  double rawCourse;
  double v51;
  long double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;

  -[GEOLocation readAll:](self, "readAll:", 1);
  v70 = -[GEOLatLng hash](self->_latLng, "hash");
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    v69 = 2654435761 * self->_type;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v69 = 0;
  if ((*(_BYTE *)&flags & 0x80) == 0)
    goto LABEL_8;
LABEL_3:
  timestamp = self->_timestamp;
  v5 = -timestamp;
  if (timestamp >= 0.0)
    v5 = self->_timestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    v68 = 2654435761 * self->_altitude;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_13;
LABEL_18:
    v13 = 0;
    goto LABEL_21;
  }
  v68 = 0;
  if ((*(_BYTE *)&flags & 8) == 0)
    goto LABEL_18;
LABEL_13:
  horizontalAccuracy = self->_horizontalAccuracy;
  v10 = -horizontalAccuracy;
  if (horizontalAccuracy >= 0.0)
    v10 = self->_horizontalAccuracy;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_21:
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    verticalAccuracy = self->_verticalAccuracy;
    v16 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0)
      v16 = self->_verticalAccuracy;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    speed = self->_speed;
    v21 = -speed;
    if (speed >= 0.0)
      v21 = self->_speed;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    heading = self->_heading;
    v26 = -heading;
    if (heading >= 0.0)
      v26 = self->_heading;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    course = self->_course;
    v31 = -course;
    if (course >= 0.0)
      v31 = self->_course;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    courseAccuracy = self->_courseAccuracy;
    v36 = -courseAccuracy;
    if (courseAccuracy >= 0.0)
      v36 = self->_courseAccuracy;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v67 = v13;
  v65 = v34;
  if ((*(_WORD *)&flags & 0x2000) != 0)
    v64 = 2654435761 * self->_levelOrdinal;
  else
    v64 = 0;
  v63 = -[GEOCoarseLocationMetadata hash](self->_coarseMetadata, "hash");
  v39 = self->_flags;
  if ((*(_WORD *)&v39 & 0x800) != 0)
    v62 = 2654435761 * self->_courseType;
  else
    v62 = 0;
  v66 = v19;
  if ((*(_BYTE *)&v39 & 0x20) != 0)
  {
    speedAccuracy = self->_speedAccuracy;
    v42 = -speedAccuracy;
    if (speedAccuracy >= 0.0)
      v42 = self->_speedAccuracy;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  if ((*(_DWORD *)&v39 & 0x80000) != 0)
  {
    v61 = 2654435761 * self->_isMatchedLocation;
    if ((*(_DWORD *)&v39 & 0x100000) != 0)
      goto LABEL_77;
  }
  else
  {
    v61 = 0;
    if ((*(_DWORD *)&v39 & 0x100000) != 0)
    {
LABEL_77:
      v59 = 2654435761 * self->_isShifted;
      goto LABEL_80;
    }
  }
  v59 = 0;
LABEL_80:
  if ((*(_WORD *)&v39 & 0x100) != 0)
    v45 = 2654435761u * self->_transitID;
  else
    v45 = 0;
  if ((*(_WORD *)&v39 & 0x8000) != 0)
    v46 = 2654435761 * self->_referenceFrame;
  else
    v46 = 0;
  v47 = -[GEOLatLng hash](self->_rawCoordinate, "hash", v59);
  v48 = self->_flags;
  if ((*(_BYTE *)&v48 & 0x10) != 0)
  {
    rawCourse = self->_rawCourse;
    v51 = -rawCourse;
    if (rawCourse >= 0.0)
      v51 = self->_rawCourse;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  if ((*(_WORD *)&v48 & 0x4000) != 0)
  {
    v54 = 2654435761 * self->_matchQuality;
    if ((*(_WORD *)&v48 & 0x1000) != 0)
    {
LABEL_96:
      v55 = 2654435761 * self->_formOfWay;
      if ((*(_DWORD *)&v48 & 0x10000) != 0)
        goto LABEL_97;
LABEL_101:
      v56 = 0;
      if ((*(_DWORD *)&v48 & 0x20000) != 0)
        goto LABEL_98;
LABEL_102:
      v57 = 0;
      return v69 ^ v70 ^ v8 ^ v68 ^ v67 ^ v14 ^ v66 ^ v24 ^ v29 ^ v65 ^ v64 ^ v63 ^ v62 ^ v40 ^ v61 ^ v60 ^ v45 ^ v46 ^ v47 ^ v49 ^ v54 ^ v55 ^ v56 ^ v57;
    }
  }
  else
  {
    v54 = 0;
    if ((*(_WORD *)&v48 & 0x1000) != 0)
      goto LABEL_96;
  }
  v55 = 0;
  if ((*(_DWORD *)&v48 & 0x10000) == 0)
    goto LABEL_101;
LABEL_97:
  v56 = 2654435761 * self->_roadClass;
  if ((*(_DWORD *)&v48 & 0x20000) == 0)
    goto LABEL_102;
LABEL_98:
  v57 = 2654435761 * self->_transportType;
  return v69 ^ v70 ^ v8 ^ v68 ^ v67 ^ v14 ^ v66 ^ v24 ^ v29 ^ v65 ^ v64 ^ v63 ^ v62 ^ v40 ^ v61 ^ v60 ^ v45 ^ v46 ^ v47 ^ v49 ^ v54 ^ v55 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *latLng;
  uint64_t v6;
  int v7;
  GEOCoarseLocationMetadata *coarseMetadata;
  uint64_t v9;
  int v10;
  GEOLatLng *rawCoordinate;
  uint64_t v12;
  int v13;
  _QWORD *v14;

  v14 = a3;
  objc_msgSend(v14, "readAll:", 0);
  v4 = v14;
  latLng = self->_latLng;
  v6 = v14[8];
  if (latLng)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLocation setLatLng:](self, "setLatLng:");
  }
  v4 = v14;
LABEL_7:
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x40000) != 0)
  {
    self->_type = *((_DWORD *)v4 + 43);
    *(_DWORD *)&self->_flags |= 0x40000u;
    v7 = *((_DWORD *)v4 + 45);
    if ((v7 & 0x80) == 0)
    {
LABEL_9:
      if ((v7 & 0x400) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  self->_timestamp = (double)v4[13];
  *(_DWORD *)&self->_flags |= 0x80u;
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x400) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_altitude = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x400u;
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 8) == 0)
  {
LABEL_11:
    if ((v7 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_horizontalAccuracy = (double)v4[7];
  *(_DWORD *)&self->_flags |= 8u;
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x200) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_verticalAccuracy = (double)v4[15];
  *(_DWORD *)&self->_flags |= 0x200u;
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x40) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  self->_speed = (double)v4[12];
  *(_DWORD *)&self->_flags |= 0x40u;
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 4) == 0)
  {
LABEL_14:
    if ((v7 & 2) == 0)
      goto LABEL_15;
    goto LABEL_28;
  }
LABEL_27:
  self->_heading = (double)v4[6];
  *(_DWORD *)&self->_flags |= 4u;
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 2) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0)
      goto LABEL_16;
    goto LABEL_29;
  }
LABEL_28:
  self->_course = (double)v4[5];
  *(_DWORD *)&self->_flags |= 2u;
  v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  self->_courseAccuracy = (double)v4[4];
  *(_DWORD *)&self->_flags |= 1u;
  if ((*((_DWORD *)v4 + 45) & 0x2000) != 0)
  {
LABEL_17:
    self->_levelOrdinal = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 0x2000u;
  }
LABEL_18:
  coarseMetadata = self->_coarseMetadata;
  v9 = v4[3];
  if (coarseMetadata)
  {
    if (!v9)
      goto LABEL_34;
    -[GEOCoarseLocationMetadata mergeFrom:](coarseMetadata, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_34;
    -[GEOLocation setCoarseMetadata:](self, "setCoarseMetadata:");
  }
  v4 = v14;
LABEL_34:
  v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x800) != 0)
  {
    self->_courseType = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x800u;
    v10 = *((_DWORD *)v4 + 45);
    if ((v10 & 0x20) == 0)
    {
LABEL_36:
      if ((v10 & 0x80000) == 0)
        goto LABEL_37;
      goto LABEL_46;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_36;
  }
  self->_speedAccuracy = (double)v4[11];
  *(_DWORD *)&self->_flags |= 0x20u;
  v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x80000) == 0)
  {
LABEL_37:
    if ((v10 & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_47;
  }
LABEL_46:
  self->_isMatchedLocation = *((_BYTE *)v4 + 176);
  *(_DWORD *)&self->_flags |= 0x80000u;
  v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x100000) == 0)
  {
LABEL_38:
    if ((v10 & 0x100) == 0)
      goto LABEL_39;
    goto LABEL_48;
  }
LABEL_47:
  self->_isShifted = *((_BYTE *)v4 + 177);
  *(_DWORD *)&self->_flags |= 0x100000u;
  v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x100) == 0)
  {
LABEL_39:
    if ((v10 & 0x8000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_48:
  self->_transitID = v4[14];
  *(_DWORD *)&self->_flags |= 0x100u;
  if ((*((_DWORD *)v4 + 45) & 0x8000) != 0)
  {
LABEL_40:
    self->_referenceFrame = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_flags |= 0x8000u;
  }
LABEL_41:
  rawCoordinate = self->_rawCoordinate;
  v12 = v4[9];
  if (rawCoordinate)
  {
    if (!v12)
      goto LABEL_53;
    -[GEOLatLng mergeFrom:](rawCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_53;
    -[GEOLocation setRawCoordinate:](self, "setRawCoordinate:");
  }
  v4 = v14;
LABEL_53:
  v13 = *((_DWORD *)v4 + 45);
  if ((v13 & 0x10) != 0)
  {
    self->_rawCourse = (double)v4[10];
    *(_DWORD *)&self->_flags |= 0x10u;
    v13 = *((_DWORD *)v4 + 45);
    if ((v13 & 0x4000) == 0)
    {
LABEL_55:
      if ((v13 & 0x1000) == 0)
        goto LABEL_56;
      goto LABEL_62;
    }
  }
  else if ((v13 & 0x4000) == 0)
  {
    goto LABEL_55;
  }
  self->_matchQuality = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_flags |= 0x4000u;
  v13 = *((_DWORD *)v4 + 45);
  if ((v13 & 0x1000) == 0)
  {
LABEL_56:
    if ((v13 & 0x10000) == 0)
      goto LABEL_57;
LABEL_63:
    self->_roadClass = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 0x10000u;
    if ((*((_DWORD *)v4 + 45) & 0x20000) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
LABEL_62:
  self->_formOfWay = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_flags |= 0x1000u;
  v13 = *((_DWORD *)v4 + 45);
  if ((v13 & 0x10000) != 0)
    goto LABEL_63;
LABEL_57:
  if ((v13 & 0x20000) != 0)
  {
LABEL_58:
    self->_transportType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 0x20000u;
  }
LABEL_59:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 2) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOLocationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_648);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2200000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOLocation readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_latLng, "clearUnknownFields:", 1);
    -[GEOCoarseLocationMetadata clearUnknownFields:](self->_coarseMetadata, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_rawCoordinate, "clearUnknownFields:", 1);
  }
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (BOOL)isMatchedLocation
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x80000) != 0 && self->_isMatchedLocation;
}

- (void)setHasIsMatchedLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 34078720;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v3);
}

- (void)setHasIsShifted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 34603008;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v3);
}

- (unint64_t)transitID
{
  return self->_transitID;
}

- (void)setTransitID:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x2000100u;
  self->_transitID = a3;
}

- (void)setHasTransitID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554688;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33587200;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C13A50[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReferenceFrame:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasRawCoordinate
{
  -[GEOLocation _readRawCoordinate]((uint64_t)self);
  return self->_rawCoordinate != 0;
}

- (double)rawCourse
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;
  double result;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  result = -1.0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_rawCourse;
  return result;
}

- (BOOL)hasRawCourse
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int)matchQuality
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x4000) != 0)
    return self->_matchQuality;
  else
    return 0;
}

- (void)setMatchQuality:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2004000u;
  self->_matchQuality = a3;
}

- (void)setHasMatchQuality:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33570816;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasMatchQuality
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (id)matchQualityAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C13A68[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMatchQuality:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRONG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AMBIGUOUS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)formOfWay
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0)
    return self->_formOfWay;
  else
    return 0;
}

- (void)setFormOfWay:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2001000u;
  self->_formOfWay = a3;
}

- (void)setHasFormOfWay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33558528;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasFormOfWay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)formOfWayAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x17 && ((0x7EDDDFu >> a3) & 1) != 0)
  {
    v3 = off_1E1C13A80[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsFormOfWay:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOW_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_MOTORWAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_MULTI_CARRIAGEWAY_WHICH_IS_NOT_A_MOTORWAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_A_SINGLE_CARRIAGEWAY_DEFAULT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_A_ROUNDABOUT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_AN_ETA_PARKING_PLACE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_AN_ETA_PARKING_GARAGE_BUILDING")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_AN_ETA_UNSTRUCTURED_TRAFFIC_SQUARE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_A_SLIP_ROAD")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_A_SERVICE_ROAD")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRANCE_EXIT_TO_FROM_A_CAR_PARK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_A_PEDESTRIAN_ZONE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PART_OF_A_WALKWAY")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPECIAL_TRAFFIC_FIGURES")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOW_ETA_GALLERY")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOW_STAIRS")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROAD_FOR_AUTHORITIES")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOW_CONNECTOR")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FOW_CUL_DE_SAC")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)roadClass
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x10000) != 0)
    return self->_roadClass;
  else
    return 9;
}

- (void)setRoadClass:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2010000u;
  self->_roadClass = a3;
}

- (void)setHasRoadClass:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33619968;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasRoadClass
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (id)roadClassAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C13B38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRoadClass:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTORWAY_FREEWAY_OR_OTHER_MAJOR_ROAD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("A_MAJOR_ROAD_LESS_IMPORTANT_THAN_A_MOTORWAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER_MAJOR_ROAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECONDARY_ROAD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_CONNECTING_ROAD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_ROAD_OF_HIGH_IMPORTANCE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_ROAD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_ROAD_OF_MINOR_IMPORTANCE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER_ROAD")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ROAD")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  $7795A3DA557233CC8B57BE35C358A0B5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x20000) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2020000u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33685504;
  else
    v3 = 0x2000000;
  self->_flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasTransportType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C13B88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
