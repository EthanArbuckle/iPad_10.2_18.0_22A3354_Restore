@implementation GEOMapFeatureRoad

- (unint64_t)roadID
{
  $6366EE65C6D470F280F0091217CA7A4B *p_roadKey;
  unint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8_t v8[8];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_roadKey = &self->_roadKey;
  result = self->_roadKey.roadID;
  if (!result)
  {
    *(_QWORD *)&v9 = -[GEOMapFeatureRoad tileKey](self, "tileKey");
    *((_QWORD *)&v9 + 1) = v5;
    v6 = (v5 >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v5) >> 8) | (HIBYTE(v5) << 16)) << 32);
    v7 = *(_QWORD *)((char *)&v9 + 1);
    if (*(_QWORD *)((_BYTE *)&v9 + 1) & 0xC000000000000000 | BYTE1(v5)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: tileKey.standard.x < (1 << kGEOMapFeatureRoadKeyTileXSize)", v8, 2u);
    }
    if ((v6 & 0x3FF000000) != 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: tileKey.standard.y < (1 << kGEOMapFeatureRoadKeyTileYSize)", v8, 2u);
    }
    if (-[GEOMapFeatureRoad featureIndex](self, "featureIndex") >= 0x4000
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: self.featureIndex < (1 << kGEOMapFeatureRoadKeyFeatureIndexSize)", v8, 2u);
    }
    *(_DWORD *)((char *)&p_roadKey->var0 + 2) = (v7 >> 30) & 0xFFFF0000 | (unsigned __int16)(v6 >> 8);
    LOWORD(p_roadKey->roadID) = (2 * (-[GEOMapFeatureRoad featureIndex](self, "featureIndex") & 0x3FFF)) | p_roadKey->roadID & 0x8001;
    LOWORD(p_roadKey->roadID) = p_roadKey->roadID & 0xFFFE | -[GEOMapFeatureRoad isFlipped](self, "isFlipped");
    return p_roadKey->roadID;
  }
  return result;
}

- (unint64_t)muid
{
  void *v2;
  unint64_t v3;

  -[GEOMapFeatureRoad feature](self, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "muid");

  return v3;
}

- (int64_t)signedMuid
{
  int64_t v3;
  void *v4;
  int v5;

  v3 = -[GEOMapFeatureRoad muid](self, "muid");
  -[GEOMapFeatureRoad feature](self, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRoadSegmentReversed");

  if (v5 != -[GEOMapFeatureRoad isFlipped](self, "isFlipped"))
    return -v3;
  else
    return v3;
}

- (GEOMapFeatureJunction)startJunction
{
  if (self->super._isFlipped)
    -[GEOMapFeatureRoad _junctionB](self, "_junctionB");
  else
    -[GEOMapFeatureRoad _junctionA](self, "_junctionA");
  return (GEOMapFeatureJunction *)(id)objc_claimAutoreleasedReturnValue();
}

- (GEOMapFeatureJunction)endJunction
{
  if (self->super._isFlipped)
    -[GEOMapFeatureRoad _junctionA](self, "_junctionA");
  else
    -[GEOMapFeatureRoad _junctionB](self, "_junctionB");
  return (GEOMapFeatureJunction *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)roadClass
{
  void *v3;
  void *v4;
  int v5;

  -[GEOMapFeatureRoad feature](self, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOMapFeatureRoad feature](self, "feature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "roadClass");

  }
  else
  {
    v5 = 9;
  }

  return v5;
}

- (int)formOfWay
{
  void *v3;
  void *v4;
  int v5;

  -[GEOMapFeatureRoad feature](self, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOMapFeatureRoad feature](self, "feature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "formOfWay");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)travelDirection
{
  void *v3;
  void *v4;
  int v5;
  void *v7;
  int v8;

  -[GEOMapFeatureRoad feature](self, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 255;
  -[GEOMapFeatureRoad feature](self, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "travelDirection");

  if (v5 == 1)
  {
    if (self->super._isFlipped)
      return 2;
  }
  else if (v5 == 2 && self->super._isFlipped)
  {
    return 1;
  }
  -[GEOMapFeatureRoad feature](self, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "travelDirection");

  return v8;
}

- (BOOL)isValidTravelDirection
{
  return -[GEOMapFeatureRoad travelDirection](self, "travelDirection") < 2;
}

- (int64_t)laneCount
{
  void *v2;
  geo::codec *v3;
  uint64_t v5;

  v5 = 0;
  -[GEOMapFeatureRoad feature](self, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = GEOMultiSectionFeatureCharacteristicPoints(v2, (GeoCodecsRoadFeature *)&v5);

  if (v3)
    return *((unsigned int *)v3 + 4);
  else
    return -1;
}

- (double)roadWidth
{
  void *v2;
  double v3;

  -[GEOMapFeatureRoad feature](self, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)objc_msgSend(v2, "roadWidth") * 0.01;

  return v3;
}

- (unint64_t)speedLimit
{
  if (self->super._isFlipped)
    return -[GEOMapFeatureRoad _diagnosticsOnly_reverseSpeedLimit](self, "_diagnosticsOnly_reverseSpeedLimit");
  else
    return -[GEOMapFeatureRoad _diagnosticsOnly_forwardSpeedLimit](self, "_diagnosticsOnly_forwardSpeedLimit");
}

- (BOOL)speedLimitIsMPH
{
  void *v2;
  char v3;

  -[GEOMapFeatureRoad feature](self, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displaySpeedLimitIsMPH");

  return v3;
}

- (BOOL)isDrivable
{
  void *v2;
  char v3;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDrivable");

  return v3;
}

- (BOOL)isWalkable
{
  void *v2;
  char v3;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWalkable");

  return v3;
}

- (BOOL)isRoadPedestrianNavigable
{
  void *v2;
  char v3;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRoadPedestrianNavigable");

  return v3;
}

- (int)walkableSide
{
  void *v3;
  uint64_t v4;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "walkableSide");

  if (self->super._isFlipped)
    return -[GEOMapFeatureRoad _flippedWalkableSideFor:](self, "_flippedWalkableSideFor:", v4);
  else
    return v4;
}

- (int)sidewalkSide
{
  void *v3;
  uint64_t v4;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sidewalkSide");

  if (self->super._isFlipped)
    return -[GEOMapFeatureRoad _flippedSidewalkSideFor:](self, "_flippedSidewalkSideFor:", v4);
  else
    return v4;
}

- (int)bikeableSide
{
  void *v3;
  uint64_t v4;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bikeableSide");

  if (self->super._isFlipped)
    return -[GEOMapFeatureRoad _flippedBikeableSideFor:](self, "_flippedBikeableSideFor:", v4);
  else
    return v4;
}

- (int)bikeLaneSide
{
  void *v3;
  uint64_t v4;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bikeLaneSide");

  if (self->super._isFlipped)
    return -[GEOMapFeatureRoad _flippedBikeLaneSideFor:](self, "_flippedBikeLaneSideFor:", v4);
  else
    return v4;
}

- (BOOL)isTunnel
{
  void *v2;
  char v3;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTunnel");

  return v3;
}

- (BOOL)isBridge
{
  void *v2;
  char v3;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBridge");

  return v3;
}

- (BOOL)isRail
{
  void *v2;
  char v3;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRailway");

  return v3;
}

- (int)rampType
{
  void *v2;
  int v3;

  -[GEOMapFeatureRoad _attributes](self, "_attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rampType");

  return v3;
}

- (NSString)internalRoadName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[GEOMapFeatureRoad feature](self, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "name"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[GEOMapFeatureRoad feature](self, "feature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithUTF8String:", objc_msgSend(v7, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (void)flip
{
  unint64_t coordinateCount;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 *tempCoordinates2d;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $1AB5FA073B851C12C2339EC22442E995 *coordinates3d;
  $1AB5FA073B851C12C2339EC22442E995 *v14;
  double var2;
  __int128 v16;
  unint64_t v17;
  double *v18;
  double v19;
  double *v20;
  unint64_t roadID;

  self->super._isFlipped ^= 1u;
  if (self->super._tempCoordinates2d)
  {
    coordinateCount = self->super._coordinateCount;
    if (coordinateCount >= 2)
    {
      v3 = 0;
      v4 = 0;
      v5 = -(uint64_t)(coordinateCount >> 1);
      do
      {
        tempCoordinates2d = self->super._tempCoordinates2d;
        v7 = tempCoordinates2d[v3];
        v8 = 16 * (v4 + self->super._coordinateCount) - 16;
        tempCoordinates2d[v3] = *($F24F406B2B787EFB06265DBA3D28CBD5 *)((char *)tempCoordinates2d + v8);
        *($F24F406B2B787EFB06265DBA3D28CBD5 *)((char *)self->super._tempCoordinates2d + v8) = v7;
        --v4;
        ++v3;
      }
      while (v5 != v4);
    }
  }
  if (self->super._coordinates3d)
  {
    v9 = self->super._coordinateCount;
    if (v9 >= 2)
    {
      v10 = 0;
      v11 = 0;
      v12 = -(uint64_t)(v9 >> 1);
      do
      {
        coordinates3d = self->super._coordinates3d;
        v14 = &coordinates3d[v10];
        var2 = coordinates3d[v10].var2;
        v16 = *(_OWORD *)&coordinates3d[v10].var0;
        v17 = 24 * (v11 + self->super._coordinateCount) - 24;
        v18 = (double *)((char *)&coordinates3d->var0 + v17);
        v19 = v18[2];
        *(_OWORD *)&v14->var0 = *(_OWORD *)v18;
        v14->var2 = v19;
        v20 = (double *)((char *)&self->super._coordinates3d->var0 + v17);
        *(_OWORD *)v20 = v16;
        v20[2] = var2;
        --v11;
        ++v10;
      }
      while (v12 != v11);
    }
  }
  roadID = self->_roadKey.roadID;
  if (roadID)
    LOWORD(self->_roadKey.roadID) = roadID & 0xFFFE | self->super._isFlipped;
}

- (id)flippedCopy
{
  void *v2;

  v2 = (void *)-[GEOMapFeatureRoad copy](self, "copy");
  objc_msgSend(v2, "flip");
  return v2;
}

- (id)localizedRoadName:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t LocalizedLabelCount;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[GEOMapFeatureRoad feature](self, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v17 = 0;
    v18 = 0;
    if (!a3)
      goto LABEL_29;
    goto LABEL_28;
  }
  -[GEOMapFeatureRoad feature](self, "feature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LocalizedLabelCount = GEOFeatureGetLocalizedLabelCount(v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", LocalizedLabelCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (LocalizedLabelCount)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v31 = 0;
      v32 = 0;
      GEOFeatureGetLocalizedLabel(v7, 0, &v32, &v31);
      if (v32)
        v13 = v31 == 0;
      else
        v13 = 1;
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v15);

      }
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31);
        v16 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v16;
      }
      ++v11;
    }
    while (LocalizedLabelCount != v11);
  }
  else
  {
    v12 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v24, (_QWORD)v27);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v18 = (void *)v25;
          v17 = v24;

          goto LABEL_27;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v21)
        continue;
      break;
    }
  }

  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
LABEL_27:

  if (a3)
LABEL_28:
    *a3 = objc_retainAutorelease(v17);
LABEL_29:

  return v18;
}

- (id)_junctionA
{
  GEOMapFeatureJunction *v3;
  GEOMapFeatureJunction *junctionA;

  if (!self->_checkedJunctionA)
  {
    +[GEOMapFeatureJunction junctionForRoadFeature:startJunction:](GEOMapFeatureJunction, "junctionForRoadFeature:startJunction:", self->_feature, 1);
    v3 = (GEOMapFeatureJunction *)objc_claimAutoreleasedReturnValue();
    junctionA = self->_junctionA;
    self->_junctionA = v3;

    self->_checkedJunctionA = 1;
  }
  return self->_junctionA;
}

- (id)_junctionB
{
  GEOMapFeatureJunction *v3;
  GEOMapFeatureJunction *junctionB;

  if (!self->_checkedJunctionB)
  {
    +[GEOMapFeatureJunction junctionForRoadFeature:startJunction:](GEOMapFeatureJunction, "junctionForRoadFeature:startJunction:", self->_feature, 0);
    v3 = (GEOMapFeatureJunction *)objc_claimAutoreleasedReturnValue();
    junctionB = self->_junctionB;
    self->_junctionB = v3;

    self->_checkedJunctionB = 1;
  }
  return self->_junctionB;
}

- (int)_flippedWalkableSideFor:(int)a3
{
  int v3;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = a3;
  if (a3 == 1)
    return 2;
  else
    return v3;
}

- (int)_flippedSidewalkSideFor:(int)a3
{
  int v3;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = a3;
  if (a3 == 1)
    return 2;
  else
    return v3;
}

- (int)_flippedBikeableSideFor:(int)a3
{
  int v3;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = a3;
  if (a3 == 1)
    return 2;
  else
    return v3;
}

- (int)_flippedBikeLaneSideFor:(int)a3
{
  int v3;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = a3;
  if (a3 == 1)
    return 2;
  else
    return v3;
}

- (id)_containingTile
{
  return self->_tile;
}

- (id)_attributes
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOMapFeatureRoad feature](self, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  GeoCodecsVectorTilePoint *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  __int128 v15;
  GEOMultiSectionFeature *feature;
  void *v17;
  void *v18;
  int IndexforMultiSectionFeature;
  NSObject *v20;
  __int128 v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float var1;
  float var0;
  NSObject *v33;
  long double v34;
  long double v35;
  double v36;
  double v37;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _BYTE buf[12];
  __int16 v43;
  _BYTE v44[10];
  double v45;
  __int16 v46;
  double v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v6 = (GeoCodecsVectorTilePoint *)GEOMultiSectionFeaturePoints(self->_feature, a3, &v41);
  if (a4)
  {
    v7 = v41;
    *a4 = v41;
    if (v7 <= 1)
    {
      -[GEOMapFeatureRoad _containingTile](self, "_containingTile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "tileKey");
      v10 = *(_BYTE *)(v9 + 10);
      v11 = *(_QWORD *)v9;
      v12 = *(_QWORD *)v9 << 32;
      v13 = BYTE4(*(_QWORD *)v9) | ((((*(_QWORD *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34);
      *(_QWORD *)&buf[1] = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v9 >> 8) & 0x3F) << 40);
      buf[0] = v11;
      v14 = v11;
      *((_QWORD *)&v15 + 1) = (v13 | ((unint64_t)(v10 & 0xF) << 48)) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v10 >> 4) << 52);
      *(_QWORD *)&v15 = v12;
      *(_QWORD *)&v48 = *(_QWORD *)buf;
      *((_QWORD *)&v48 + 1) = v15 >> 56;
      feature = self->_feature;
      objc_msgSend(v8, "lines");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      IndexforMultiSectionFeature = getIndexforMultiSectionFeature(feature, v18);

      GEOGetGEOMapFeatureAccessLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        if ((v14 & 0x7F) == 0xC)
        {
          *((_QWORD *)&v21 + 1) = *(unsigned __int16 *)((char *)&v48 + 9) | ((unint64_t)BYTE11(v48) << 16);
          *(_QWORD *)&v21 = *(_QWORD *)((char *)&v48 + 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v21 >> 6), BYTE1(v48) & 0x3F, ((*(unsigned __int16 *)((char *)&v48 + 9) | (BYTE11(v48) << 16)) >> 6) & 0x3FFF, v39, v40);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)((char *)&v48 + 1) >> 46) | (*(_DWORD *)((char *)&v48 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)((char *)&v48 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v48 + 13) | (HIBYTE(v48) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)((char *)&v48 + 1) >> 40) & 0x3FLL, v14 & 0x7F, *(unsigned __int16 *)((char *)&v48 + 13) >> 2);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v22;
        v43 = 1024;
        *(_DWORD *)v44 = IndexforMultiSectionFeature;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v7;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Tile %@ contains a road at index (%u) with fewer than two points (%d)", buf, 0x18u);

      }
      v23 = GEOMapRectForGEOTileKey((uint64_t)&v48);
      if (v7)
      {
        v27 = v23;
        v28 = v24;
        v29 = v25;
        v30 = v26;
        var0 = v6->var0;
        var1 = v6->var1;
        GEOGetGEOMapFeatureAccessLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = exp(((v28 + (float)(1.0 - var1) * v30) * 0.0078125 + -1048576.0) / 333772.107);
          v35 = atan(v34);
          v36 = v6->var0;
          v37 = v6->var1;
          *(_DWORD *)buf = 134218752;
          *(double *)&buf[4] = v36;
          v43 = 2048;
          *(double *)v44 = v37;
          *(_WORD *)&v44[8] = 2048;
          v45 = (v35 * -2.0 + 1.57079633) * 57.2957795;
          v46 = 2048;
          v47 = (v27 + var0 * v29) * 0.0078125 * 0.000171661377 + -180.0;
          _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_ERROR, "[%0.5f, %0.5f] (%0.9f, %0.9f)", buf, 0x2Au);
        }

      }
    }
  }
  return v6;
}

- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  float *result;
  unint64_t v6;

  v6 = 0;
  result = (float *)GEOMultiSectionFeatureElevations(self->_feature, a3, &v6);
  if (a4)
    *a4 = v6;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOMapFeatureRoad;
  v4 = -[GEOMapFeatureLine copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_storeStrong((id *)v4 + 6, self->_feature);
  objc_storeStrong((id *)v4 + 12, self->_tile);
  *($6366EE65C6D470F280F0091217CA7A4B *)(v4 + 56) = self->_roadKey;
  v5 = -[GEOMapFeatureJunction copy](self->_junctionA, "copy");
  v6 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v5;

  v7 = -[GEOMapFeatureJunction copy](self->_junctionB, "copy");
  v8 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v7;

  v4[88] = self->_checkedJunctionA;
  v4[89] = self->_checkedJunctionB;
  return v4;
}

- (GEOMapFeatureRoad)initWithFeature:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  GEOMapFeatureRoad *v8;
  GEOMapFeatureRoad *v9;
  void *v10;
  uint64_t v11;
  GEOVectorTile *tile;
  GEOMapFeatureRoad *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "feature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containingTile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOMapFeatureRoad;
    v8 = -[GEOMapFeatureLine init](&v16, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_feature, a3);
      objc_msgSend(v5, "feature");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containingTile");
      v11 = objc_claimAutoreleasedReturnValue();
      tile = v9->_tile;
      v9->_tile = (GEOVectorTile *)v11;

      v9->super._isFlipped = objc_msgSend(v5, "isRoadSegmentReversed");
    }
    self = v9;
    v13 = self;
  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Cannot create GEOMapFeatureRoad because incoming feature has no backing vector tile", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (uint64_t)tileKey
{
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_containingTile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (uint64_t *)objc_msgSend(v1, "tileKey");

  if (v2)
  {
    v3 = *v2;
    *(_QWORD *)((char *)v6 + 1) = (*v2 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*v2 >> 8) & 0x3F) << 40);
    LOBYTE(v6[0]) = v3;
    return v6[0];
  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Error getting tile key from backing vector tile", (uint8_t *)v6, 2u);
    }

    return 1;
  }
}

- (GEOMultiSectionFeature)feature
{
  return self->_feature;
}

- (unint64_t)featureIndex
{
  GEOMultiSectionFeature *feature;
  void *v3;
  void *v4;
  void *v5;
  unint64_t IndexforMultiSectionFeature;

  feature = self->_feature;
  -[GEOMapFeatureRoad _containingTile](self, "_containingTile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IndexforMultiSectionFeature = getIndexforMultiSectionFeature(feature, v5);

  return IndexforMultiSectionFeature;
}

- (BOOL)isFlipped
{
  return self->super._isFlipped;
}

- (GEOMultiSectionFeature)startFeature
{
  return self->_feature;
}

- (GEOMultiSectionFeature)endFeature
{
  return self->_feature;
}

- (unint64_t)_diagnosticsOnly_forwardSpeedLimit
{
  return -[GEOMultiSectionFeature displaySpeedLimit](self->_feature, "displaySpeedLimit");
}

- (unint64_t)_diagnosticsOnly_reverseSpeedLimit
{
  return -[GEOMultiSectionFeature reverseDirectionDisplaySpeedLimit](self->_feature, "reverseDirectionDisplaySpeedLimit");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v11;
  double var0;
  double var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureRoad internalRoadName](self, "internalRoadName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("No name");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%d)"), v7, -[GEOMapFeatureRoad featureIndex](self, "featureIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GEOMapFeatureRoad muid](self, "muid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GEOMapFeatureRoad roadID](self, "roadID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount") >= 2)
  {
    v11 = -[GEOMapFeatureLine coordinates](self, "coordinates");
    var0 = v11->var0;
    var1 = v11->var1;
    v14 = -[GEOMapFeatureLine coordinates](self, "coordinates");
    v15 = &v14[-[GEOMapFeatureLine coordinateCount](self, "coordinateCount")];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d coordinates (%0.6f,%0.6f) to (%0.6f,%0.6f)"), -[GEOMapFeatureLine coordinateCount](self, "coordinateCount"), *(_QWORD *)&var0, *(_QWORD *)&var1, *(_QWORD *)&v15[-1].var0, *(_QWORD *)&v15[-1].var1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = -[GEOMapFeatureRoad travelDirection](self, "travelDirection");
  v18 = CFSTR("VALID_IN_BOTH_DIRECTIONS");
  switch((int)v17)
  {
    case 0:
      break;
    case 1:
      v18 = CFSTR("VALID_IN_POSITIVE_LINE_DIRECTION");
      break;
    case 2:
      v18 = CFSTR("VALID_IN_NEGATIVE_LINE_DIRECTION");
      break;
    case 3:
    case 4:
    case 5:
      goto LABEL_9;
    case 6:
      v18 = CFSTR("INVALID_IN_BOTH_DIRECTIONS");
      break;
    default:
      if ((_DWORD)v17 == 255)
      {
        v18 = CFSTR("UNKNOWN");
      }
      else
      {
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  unint64_t v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[9];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureRoad description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = -[GEOMapFeatureRoad formOfWay](self, "formOfWay");
  if (v5 < 0x17 && ((0x7EDDDFu >> v5) & 1) != 0)
  {
    v6 = off_1E1C02560[(int)v5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = -[GEOMapFeatureRoad walkableSide](self, "walkableSide");
  if (v8 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C02618[(int)v8];
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = -[GEOMapFeatureRoad bikeableSide](self, "bikeableSide");
  if (v11 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E1C02638[(int)v11];
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = -[GEOMapFeatureRoad bikeLaneSide](self, "bikeLaneSide");
  if (v14 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E1C02658[(int)v14];
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  *(_QWORD *)v28 = -[GEOMapFeatureRoad tileKey](self, "tileKey");
  v28[8] = v17;
  if ((v28[0] & 0x7F) == 0xC)
  {
    *((_QWORD *)&v18 + 1) = (unsigned __int16)(v17 >> 8) | ((unint64_t)BYTE3(v17) << 16);
    *(_QWORD *)&v18 = *(_QWORD *)&v28[1];
    v23 = v18 >> 6;
    v24 = v28[1] & 0x3F;
    v25 = (DWORD2(v18) >> 6) & 0x3FFF;
    v19 = CFSTR("%llu_%d_type_%d");
  }
  else
  {
    v26 = v28[0] & 0x7F;
    v27 = (unsigned __int16)(HIDWORD(v17) >> 8) >> 2;
    v23 = ((*(_QWORD *)&v28[1] >> 46) | ((v17 >> 8) << 18)) & 0x3FFFFFF;
    v24 = (((v17 >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v17) >> 8) | (HIBYTE(v17) << 16)) << 32)) >> 8) & 0x3FFFFFF;
    v25 = (*(_QWORD *)&v28[1] >> 40) & 0x3FLL;
    v19 = CFSTR("%d.%d.%d_provider_%d_type_%d");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, v23, v24, v25, v26, v27, *(_QWORD *)v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_junctionB, 0);
  objc_storeStrong((id *)&self->_junctionA, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)firstCoordinate
{
  $1AB5FA073B851C12C2339EC22442E995 *v3;
  double var0;
  double var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[GEOMapFeatureLine coordinateCount](self, "coordinateCount"))
  {
    v3 = -[GEOMapFeatureLine coordinates3d](self, "coordinates3d");
    var0 = v3->var0;
    var1 = v3->var1;
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

- (void)updateForDesiredRoadDirectionality:(unint64_t)a3 isOutboundRoad:(BOOL)a4
{
  if (a3 - 2 < 2)
  {
    if ((((a3 != 2) ^ a4) & 1) != 0)
      return;
LABEL_6:
    -[GEOMapFeatureRoad flip](self, "flip");
    return;
  }
  if (a3 == 1 && -[GEOMapFeatureRoad travelDirection](self, "travelDirection", 1, a4) == 2)
    goto LABEL_6;
}

@end
