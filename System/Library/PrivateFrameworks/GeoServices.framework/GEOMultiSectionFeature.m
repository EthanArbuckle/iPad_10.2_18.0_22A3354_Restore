@implementation GEOMultiSectionFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6;
  GEOMultiSectionFeature *v7;
  GEOMultiSectionFeature *v8;
  GEOFeature *v9;
  GEOFeature *feature;
  objc_super v12;

  v6 = a4;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOMultiSectionFeature;
    v7 = -[GEOMultiSectionFeature init](&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_multiSectionFeature = a3;
      v9 = -[GEOFeature init:withVectorTile:]([GEOFeature alloc], "init:withVectorTile:", a3, v6);
      feature = v8->_feature;
      v8->_feature = v9;

    }
    self = v8;
    a3 = self;
  }

  return a3;
}

- (void)get
{
  return self->_multiSectionFeature;
}

- (void)getRoad
{
  return self->_roadFeature;
}

- (GEOMultiSectionFeature)initWithRoad:(void *)a3 withVectorTile:(id)a4
{
  id v6;
  GEOMultiSectionFeature *v7;
  GEOMultiSectionFeature *v8;
  GEOFeature *v9;
  GEOFeature *feature;
  objc_super v12;

  v6 = a4;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOMultiSectionFeature;
    v7 = -[GEOMultiSectionFeature init](&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_multiSectionFeature = a3;
      v7->_roadFeature = a3;
      v9 = -[GEOFeature init:withVectorTile:]([GEOFeature alloc], "init:withVectorTile:", a3, v6);
      feature = v8->_feature;
      v8->_feature = v9;

      -[GEOFeature _setType:](v8->_feature, "_setType:", *((unsigned __int8 *)v8->_roadFeature + 154));
    }
    self = v8;
    a3 = self;
  }

  return (GEOMultiSectionFeature *)a3;
}

- (int)type
{
  unsigned __int8 *roadFeature;

  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature)
    return roadFeature[154];
  else
    return 0;
}

- (GEOFeature)feature
{
  return self->_feature;
}

- (unint64_t)sectionOffset
{
  unsigned int *multiSectionFeature;

  multiSectionFeature = (unsigned int *)self->_multiSectionFeature;
  if (multiSectionFeature)
    return multiSectionFeature[24];
  else
    return 0;
}

- (unint64_t)sectionCount
{
  unsigned int *multiSectionFeature;

  multiSectionFeature = (unsigned int *)self->_multiSectionFeature;
  if (multiSectionFeature)
    return multiSectionFeature[25];
  else
    return 0;
}

- (int)roadClass
{
  unsigned __int8 *roadFeature;

  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature)
    return roadFeature[151];
  else
    return 0;
}

- (int)formOfWay
{
  unsigned __int8 *roadFeature;

  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature)
    return roadFeature[152];
  else
    return 0;
}

- (int)travelDirection
{
  unsigned __int8 *roadFeature;

  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature)
    return roadFeature[153];
  else
    return 0;
}

- (unint64_t)roadPointIndex
{
  unsigned int *roadFeature;

  roadFeature = (unsigned int *)self->_roadFeature;
  if (roadFeature)
    return roadFeature[33];
  else
    return 0;
}

- (unint64_t)roadPointCount
{
  unsigned __int16 *roadFeature;

  roadFeature = (unsigned __int16 *)self->_roadFeature;
  if (roadFeature)
    return roadFeature[72];
  else
    return 0;
}

- (unsigned)lineCrossingIndex
{
  _DWORD *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return roadFeature[34];
  else
    return 0;
}

- (unsigned)lineCrossingCount
{
  unsigned __int16 *roadFeature;

  roadFeature = (unsigned __int16 *)self->_roadFeature;
  if (roadFeature)
    return roadFeature[73];
  else
    return 0;
}

- (GeoCodecsVectorTileRect)bounds
{
  GeoCodecsVectorTileRect *multiSectionFeature;

  multiSectionFeature = (GeoCodecsVectorTileRect *)self->_multiSectionFeature;
  if (multiSectionFeature)
    return multiSectionFeature + 5;
  else
    return 0;
}

- (GeoCodecsLaneGeometry)laneGeometry
{
  void *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return (GeoCodecsLaneGeometry *)*((_QWORD *)roadFeature + 14);
  else
    return 0;
}

- (GeoCodecsAddressRange)addressRange
{
  GeoCodecsAddressRange *roadFeature;

  roadFeature = (GeoCodecsAddressRange *)self->_roadFeature;
  if (roadFeature)
    return roadFeature + 15;
  else
    return 0;
}

- (unsigned)speedLimit
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return roadFeature[156];
  else
    return 0;
}

- (BOOL)displaySpeedIsLimited
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[157] != 0;
}

- (unsigned)displaySpeedLimit
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return roadFeature[158];
  else
    return 0;
}

- (BOOL)displaySpeedLimitIsMPH
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[159] != 0;
}

- (BOOL)reverseDirectionDisplaySpeedIsLimited
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[160] != 0;
}

- (unsigned)reverseDirectionDisplaySpeedLimit
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return roadFeature[161];
  else
    return 0;
}

- (BOOL)reverseDirectionDisplaySpeedLimitIsMPH
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[162] != 0;
}

- (unsigned)roadWidth
{
  _WORD *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return roadFeature[74];
  else
    return 0;
}

- (unsigned)speedLimitShieldId
{
  _DWORD *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return roadFeature[32];
  else
    return 0;
}

- (unint64_t)muid
{
  _QWORD *roadFeature;

  roadFeature = self->_roadFeature;
  if (roadFeature)
    return roadFeature[13];
  else
    return 0;
}

- (BOOL)isRoadSegmentReversed
{
  _BYTE *roadFeature;

  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[155] != 0;
}

@end
