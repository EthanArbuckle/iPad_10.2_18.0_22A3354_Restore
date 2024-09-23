@implementation GEORPFeatureHandle

- (void)dealloc
{
  objc_super v3;

  -[GEORPFeatureHandle clearStyleAttributes](self, "clearStyleAttributes");
  v3.receiver = self;
  v3.super_class = (Class)GEORPFeatureHandle;
  -[GEORPFeatureHandle dealloc](&v3, sel_dealloc);
}

- (unsigned)featureIndex
{
  return self->_featureIndex;
}

- (void)setFeatureIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_featureIndex = a3;
}

- (void)setHasFeatureIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFeatureIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)featureTileX
{
  return self->_featureTileX;
}

- (void)setFeatureTileX:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_featureTileX = a3;
}

- (void)setHasFeatureTileX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasFeatureTileX
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)featureTileY
{
  return self->_featureTileY;
}

- (void)setFeatureTileY:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_featureTileY = a3;
}

- (void)setHasFeatureTileY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasFeatureTileY
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)featureTileZ
{
  return self->_featureTileZ;
}

- (void)setFeatureTileZ:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_featureTileZ = a3;
}

- (void)setHasFeatureTileZ:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasFeatureTileZ
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)style
{
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    return self->_style;
  else
    return 0;
}

- (void)setStyle:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasStyle
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)styleAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("RASTER_STANDARD");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("VECTOR_STANDARD");
      return v3;
    case 2:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
    case 3:
      return CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
    case 4:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
    case 5:
      return CFSTR("RASTER_STANDARD_BACKGROUND");
    case 6:
      return CFSTR("RASTER_HYBRID");
    case 7:
      return CFSTR("RASTER_SATELLITE");
    case 8:
      return CFSTR("RASTER_TERRAIN");
    case 11:
      return CFSTR("VECTOR_BUILDINGS");
    case 12:
      return CFSTR("VECTOR_TRAFFIC");
    case 13:
      return CFSTR("VECTOR_POI");
    case 14:
      return CFSTR("SPUTNIK_METADATA");
    case 15:
      return CFSTR("SPUTNIK_C3M");
    case 16:
      return CFSTR("SPUTNIK_DSM");
    case 17:
      return CFSTR("SPUTNIK_DSM_GLOBAL");
    case 18:
      return CFSTR("VECTOR_REALISTIC");
    case 19:
      return CFSTR("VECTOR_LEGACY_REALISTIC");
    case 20:
      return CFSTR("VECTOR_ROADS");
    case 21:
      return CFSTR("RASTER_VEGETATION");
    case 22:
      return CFSTR("VECTOR_TRAFFIC_SKELETON");
    case 23:
      return CFSTR("RASTER_COASTLINE_MASK");
    case 24:
      return CFSTR("RASTER_HILLSHADE");
    case 25:
      return CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
    case 26:
      return CFSTR("VECTOR_TRAFFIC_STATIC");
    case 27:
      return CFSTR("RASTER_COASTLINE_DROP_MASK");
    case 28:
      return CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
    case 29:
      return CFSTR("VECTOR_SPEED_PROFILES");
    case 30:
      return CFSTR("VECTOR_VENUES");
    case 31:
      return CFSTR("RASTER_DOWN_SAMPLED");
    case 32:
      return CFSTR("RASTER_COLOR_BALANCED");
    case 33:
      return CFSTR("RASTER_SATELLITE_NIGHT");
    case 34:
      return CFSTR("SPUTNIK_VECTOR_BORDER");
    case 35:
      return CFSTR("RASTER_SATELLITE_DIGITIZE");
    case 36:
      return CFSTR("RASTER_HILLSHADE_PARKS");
    case 37:
      return CFSTR("VECTOR_TRANSIT");
    case 38:
      return CFSTR("RASTER_STANDARD_BASE");
    case 39:
      return CFSTR("RASTER_STANDARD_LABELS");
    case 40:
      return CFSTR("RASTER_HYBRID_ROADS");
    case 41:
      return CFSTR("RASTER_HYBRID_LABELS");
    case 42:
      return CFSTR("FLYOVER_C3M_MESH");
    case 43:
      return CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
    case 44:
      return CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
    case 45:
      return CFSTR("RASTER_SATELLITE_ASTC");
    case 46:
      return CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
    case 47:
      return CFSTR("VECTOR_TRANSIT_SELECTION");
    case 48:
      return CFSTR("VECTOR_COVERAGE");
    case 52:
      return CFSTR("FLYOVER_METADATA");
    case 53:
      return CFSTR("VECTOR_ROAD_NETWORK");
    case 54:
      return CFSTR("VECTOR_LAND_COVER");
    case 55:
      return CFSTR("VECTOR_DEBUG");
    case 56:
      return CFSTR("VECTOR_STREET_POI");
    case 57:
      return CFSTR("MUNIN_METADATA");
    case 58:
      return CFSTR("VECTOR_SPR_MERCATOR");
    case 59:
      return CFSTR("VECTOR_SPR_MODELS");
    case 60:
      return CFSTR("VECTOR_SPR_MATERIALS");
    case 61:
      return CFSTR("VECTOR_SPR_METADATA");
    case 62:
      return CFSTR("VECTOR_TRACKS");
    case 63:
      return CFSTR("VECTOR_RESERVED_2");
    case 64:
      return CFSTR("VECTOR_STREET_LANDMARKS");
    case 65:
      return CFSTR("COARSE_LOCATION_POLYGONS");
    case 66:
      return CFSTR("VECTOR_SPR_ROADS");
    case 67:
      return CFSTR("VECTOR_SPR_STANDARD");
    case 68:
      return CFSTR("VECTOR_POI_V2");
    case 69:
      return CFSTR("VECTOR_POLYGON_SELECTION");
    case 70:
      return CFSTR("VL_METADATA");
    case 71:
      return CFSTR("VL_DATA");
    case 72:
      return CFSTR("PROACTIVE_APP_CLIP");
    case 73:
      return CFSTR("VECTOR_BUILDINGS_V2");
    case 74:
      return CFSTR("POI_BUSYNESS");
    case 75:
      return CFSTR("POI_DP_BUSYNESS");
    case 76:
      return CFSTR("SMART_INTERFACE_SELECTION");
    case 77:
      return CFSTR("VECTOR_ASSETS");
    case 78:
      return CFSTR("SPR_ASSET_METADATA");
    case 79:
      return CFSTR("VECTOR_SPR_POLAR");
    case 80:
      return CFSTR("SMART_DATA_MODE");
    case 81:
      return CFSTR("CELLULAR_PERFORMANCE_SCORE");
    case 82:
      return CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
    case 83:
      return CFSTR("VECTOR_TOPOGRAPHIC");
    case 84:
      return CFSTR("VECTOR_POI_V2_UPDATE");
    case 85:
      return CFSTR("VECTOR_LIVE_DATA_UPDATES");
    case 86:
      return CFSTR("VECTOR_TRAFFIC_V2");
    case 87:
      return CFSTR("VECTOR_ROAD_SELECTION");
    case 88:
      return CFSTR("VECTOR_REGION_METADATA");
    case 89:
      return CFSTR("RAY_TRACING");
    case 90:
      return CFSTR("VECTOR_CONTOURS");
    case 91:
      return CFSTR("RASTER_SATELLITE_POLAR");
    case 92:
      return CFSTR("VMAP4_ELEVATION");
    case 93:
      return CFSTR("VMAP4_ELEVATION_POLAR");
    case 94:
      return CFSTR("CELLULAR_COVERAGE_PLMN");
    case 95:
      return CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
    case 96:
      return CFSTR("UNUSED_96");
    case 97:
      return CFSTR("UNUSED_97");
    case 98:
      return CFSTR("UNUSED_98");
    case 99:
      return CFSTR("UNUSED_99");
    case 100:
      return CFSTR("UNUSED_100");
    case 101:
      return CFSTR("UNUSED_101");
    case 102:
      return CFSTR("UNUSED_102");
    case 103:
      return CFSTR("UNUSED_103");
    case 104:
      return CFSTR("UNUSED_104");
    case 105:
      return CFSTR("UNUSED_105");
    case 106:
      return CFSTR("UNUSED_106");
    case 107:
      return CFSTR("UNUSED_107");
    case 108:
      return CFSTR("UNUSED_108");
    case 109:
      return CFSTR("UNUSED_109");
    case 110:
      return CFSTR("UNUSED_110");
    case 111:
      return CFSTR("UNUSED_111");
    case 112:
      return CFSTR("UNUSED_112");
    case 113:
      return CFSTR("UNUSED_113");
    case 114:
      return CFSTR("UNUSED_114");
    case 115:
      return CFSTR("UNUSED_115");
    case 116:
      return CFSTR("UNUSED_116");
    case 117:
      return CFSTR("UNUSED_117");
    case 118:
      return CFSTR("UNUSED_118");
    case 119:
      return CFSTR("UNUSED_119");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
  {
    v4 = 92;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
  {
    v4 = 93;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
  {
    v4 = 94;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
  {
    v4 = 112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
  {
    v4 = 113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
  {
    v4 = 114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
  {
    v4 = 115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
  {
    v4 = 116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
  {
    v4 = 117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
  {
    v4 = 118;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_119")))
  {
    v4 = 119;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIdentifier
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C0EBB0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POLYGON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_NODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINES")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)styleAttributesCount
{
  return self->_styleAttributesCount;
}

- (GEORPFeatureHandleStyleAttribute)styleAttributes
{
  return self->_styleAttributes;
}

- (uint64_t)_reserveStyleAttributes:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 16);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 24);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (8 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 8 * v9, 0x88EFDBD6uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)(a1 + 8) = result;
      bzero((void *)(result + 8 * *(_QWORD *)(a1 + 16)), 8 * (v9 - *(_QWORD *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (void)clearStyleAttributes
{
  self->_styleAttributesSpace = 0;
  self->_styleAttributesCount = 0;
  free(self->_styleAttributes);
  self->_styleAttributes = 0;
}

- (void)addStyleAttribute:(GEORPFeatureHandleStyleAttribute)a3
{
  if (-[GEORPFeatureHandle _reserveStyleAttributes:]((uint64_t)self, 1uLL))
    self->_styleAttributes[self->_styleAttributesCount++] = a3;
}

- (GEORPFeatureHandleStyleAttribute)styleAttributeAtIndex:(unint64_t)a3
{
  unint64_t styleAttributesCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  styleAttributesCount = self->_styleAttributesCount;
  if (styleAttributesCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, styleAttributesCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return self->_styleAttributes[a3];
}

- (void)setStyleAttributes:(GEORPFeatureHandleStyleAttribute *)a3 count:(unint64_t)a4
{
  -[GEORPFeatureHandle clearStyleAttributes](self, "clearStyleAttributes");
  if (-[GEORPFeatureHandle _reserveStyleAttributes:]((uint64_t)self, a4))
  {
    memcpy(self->_styleAttributes, a3, 8 * a4);
    self->_styleAttributesCount = a4;
  }
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
  v8.super_class = (Class)GEORPFeatureHandle;
  -[GEORPFeatureHandle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeatureHandle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeatureHandle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  const __CFString *v22;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("featureIndex");
    else
      v7 = CFSTR("feature_index");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 60);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("featureTileX");
    else
      v9 = CFSTR("feature_tile_x");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_BYTE *)(a1 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        goto LABEL_10;
      goto LABEL_22;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("featureTileY");
  else
    v11 = CFSTR("feature_tile_y");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("featureTileZ");
  else
    v13 = CFSTR("feature_tile_z");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_143;
  }
LABEL_26:
  v14 = CFSTR("RASTER_STANDARD");
  switch(*(_DWORD *)(a1 + 52))
  {
    case 0:
      break;
    case 1:
      v14 = CFSTR("VECTOR_STANDARD");
      break;
    case 2:
      v14 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
      break;
    case 3:
      v14 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
      break;
    case 4:
      v14 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
      break;
    case 5:
      v14 = CFSTR("RASTER_STANDARD_BACKGROUND");
      break;
    case 6:
      v14 = CFSTR("RASTER_HYBRID");
      break;
    case 7:
      v14 = CFSTR("RASTER_SATELLITE");
      break;
    case 8:
      v14 = CFSTR("RASTER_TERRAIN");
      break;
    case 0xB:
      v14 = CFSTR("VECTOR_BUILDINGS");
      break;
    case 0xC:
      v14 = CFSTR("VECTOR_TRAFFIC");
      break;
    case 0xD:
      v14 = CFSTR("VECTOR_POI");
      break;
    case 0xE:
      v14 = CFSTR("SPUTNIK_METADATA");
      break;
    case 0xF:
      v14 = CFSTR("SPUTNIK_C3M");
      break;
    case 0x10:
      v14 = CFSTR("SPUTNIK_DSM");
      break;
    case 0x11:
      v14 = CFSTR("SPUTNIK_DSM_GLOBAL");
      break;
    case 0x12:
      v14 = CFSTR("VECTOR_REALISTIC");
      break;
    case 0x13:
      v14 = CFSTR("VECTOR_LEGACY_REALISTIC");
      break;
    case 0x14:
      v14 = CFSTR("VECTOR_ROADS");
      break;
    case 0x15:
      v14 = CFSTR("RASTER_VEGETATION");
      break;
    case 0x16:
      v14 = CFSTR("VECTOR_TRAFFIC_SKELETON");
      break;
    case 0x17:
      v14 = CFSTR("RASTER_COASTLINE_MASK");
      break;
    case 0x18:
      v14 = CFSTR("RASTER_HILLSHADE");
      break;
    case 0x19:
      v14 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
      break;
    case 0x1A:
      v14 = CFSTR("VECTOR_TRAFFIC_STATIC");
      break;
    case 0x1B:
      v14 = CFSTR("RASTER_COASTLINE_DROP_MASK");
      break;
    case 0x1C:
      v14 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
      break;
    case 0x1D:
      v14 = CFSTR("VECTOR_SPEED_PROFILES");
      break;
    case 0x1E:
      v14 = CFSTR("VECTOR_VENUES");
      break;
    case 0x1F:
      v14 = CFSTR("RASTER_DOWN_SAMPLED");
      break;
    case 0x20:
      v14 = CFSTR("RASTER_COLOR_BALANCED");
      break;
    case 0x21:
      v14 = CFSTR("RASTER_SATELLITE_NIGHT");
      break;
    case 0x22:
      v14 = CFSTR("SPUTNIK_VECTOR_BORDER");
      break;
    case 0x23:
      v14 = CFSTR("RASTER_SATELLITE_DIGITIZE");
      break;
    case 0x24:
      v14 = CFSTR("RASTER_HILLSHADE_PARKS");
      break;
    case 0x25:
      v14 = CFSTR("VECTOR_TRANSIT");
      break;
    case 0x26:
      v14 = CFSTR("RASTER_STANDARD_BASE");
      break;
    case 0x27:
      v14 = CFSTR("RASTER_STANDARD_LABELS");
      break;
    case 0x28:
      v14 = CFSTR("RASTER_HYBRID_ROADS");
      break;
    case 0x29:
      v14 = CFSTR("RASTER_HYBRID_LABELS");
      break;
    case 0x2A:
      v14 = CFSTR("FLYOVER_C3M_MESH");
      break;
    case 0x2B:
      v14 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
      break;
    case 0x2C:
      v14 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
      break;
    case 0x2D:
      v14 = CFSTR("RASTER_SATELLITE_ASTC");
      break;
    case 0x2E:
      v14 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
      break;
    case 0x2F:
      v14 = CFSTR("VECTOR_TRANSIT_SELECTION");
      break;
    case 0x30:
      v14 = CFSTR("VECTOR_COVERAGE");
      break;
    case 0x34:
      v14 = CFSTR("FLYOVER_METADATA");
      break;
    case 0x35:
      v14 = CFSTR("VECTOR_ROAD_NETWORK");
      break;
    case 0x36:
      v14 = CFSTR("VECTOR_LAND_COVER");
      break;
    case 0x37:
      v14 = CFSTR("VECTOR_DEBUG");
      break;
    case 0x38:
      v14 = CFSTR("VECTOR_STREET_POI");
      break;
    case 0x39:
      v14 = CFSTR("MUNIN_METADATA");
      break;
    case 0x3A:
      v14 = CFSTR("VECTOR_SPR_MERCATOR");
      break;
    case 0x3B:
      v14 = CFSTR("VECTOR_SPR_MODELS");
      break;
    case 0x3C:
      v14 = CFSTR("VECTOR_SPR_MATERIALS");
      break;
    case 0x3D:
      v14 = CFSTR("VECTOR_SPR_METADATA");
      break;
    case 0x3E:
      v14 = CFSTR("VECTOR_TRACKS");
      break;
    case 0x3F:
      v14 = CFSTR("VECTOR_RESERVED_2");
      break;
    case 0x40:
      v14 = CFSTR("VECTOR_STREET_LANDMARKS");
      break;
    case 0x41:
      v14 = CFSTR("COARSE_LOCATION_POLYGONS");
      break;
    case 0x42:
      v14 = CFSTR("VECTOR_SPR_ROADS");
      break;
    case 0x43:
      v14 = CFSTR("VECTOR_SPR_STANDARD");
      break;
    case 0x44:
      v14 = CFSTR("VECTOR_POI_V2");
      break;
    case 0x45:
      v14 = CFSTR("VECTOR_POLYGON_SELECTION");
      break;
    case 0x46:
      v14 = CFSTR("VL_METADATA");
      break;
    case 0x47:
      v14 = CFSTR("VL_DATA");
      break;
    case 0x48:
      v14 = CFSTR("PROACTIVE_APP_CLIP");
      break;
    case 0x49:
      v14 = CFSTR("VECTOR_BUILDINGS_V2");
      break;
    case 0x4A:
      v14 = CFSTR("POI_BUSYNESS");
      break;
    case 0x4B:
      v14 = CFSTR("POI_DP_BUSYNESS");
      break;
    case 0x4C:
      v14 = CFSTR("SMART_INTERFACE_SELECTION");
      break;
    case 0x4D:
      v14 = CFSTR("VECTOR_ASSETS");
      break;
    case 0x4E:
      v14 = CFSTR("SPR_ASSET_METADATA");
      break;
    case 0x4F:
      v14 = CFSTR("VECTOR_SPR_POLAR");
      break;
    case 0x50:
      v14 = CFSTR("SMART_DATA_MODE");
      break;
    case 0x51:
      v14 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
      break;
    case 0x52:
      v14 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
      break;
    case 0x53:
      v14 = CFSTR("VECTOR_TOPOGRAPHIC");
      break;
    case 0x54:
      v14 = CFSTR("VECTOR_POI_V2_UPDATE");
      break;
    case 0x55:
      v14 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
      break;
    case 0x56:
      v14 = CFSTR("VECTOR_TRAFFIC_V2");
      break;
    case 0x57:
      v14 = CFSTR("VECTOR_ROAD_SELECTION");
      break;
    case 0x58:
      v14 = CFSTR("VECTOR_REGION_METADATA");
      break;
    case 0x59:
      v14 = CFSTR("RAY_TRACING");
      break;
    case 0x5A:
      v14 = CFSTR("VECTOR_CONTOURS");
      break;
    case 0x5B:
      v14 = CFSTR("RASTER_SATELLITE_POLAR");
      break;
    case 0x5C:
      v14 = CFSTR("VMAP4_ELEVATION");
      break;
    case 0x5D:
      v14 = CFSTR("VMAP4_ELEVATION_POLAR");
      break;
    case 0x5E:
      v14 = CFSTR("CELLULAR_COVERAGE_PLMN");
      break;
    case 0x5F:
      v14 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
      break;
    case 0x60:
      v14 = CFSTR("UNUSED_96");
      break;
    case 0x61:
      v14 = CFSTR("UNUSED_97");
      break;
    case 0x62:
      v14 = CFSTR("UNUSED_98");
      break;
    case 0x63:
      v14 = CFSTR("UNUSED_99");
      break;
    case 0x64:
      v14 = CFSTR("UNUSED_100");
      break;
    case 0x65:
      v14 = CFSTR("UNUSED_101");
      break;
    case 0x66:
      v14 = CFSTR("UNUSED_102");
      break;
    case 0x67:
      v14 = CFSTR("UNUSED_103");
      break;
    case 0x68:
      v14 = CFSTR("UNUSED_104");
      break;
    case 0x69:
      v14 = CFSTR("UNUSED_105");
      break;
    case 0x6A:
      v14 = CFSTR("UNUSED_106");
      break;
    case 0x6B:
      v14 = CFSTR("UNUSED_107");
      break;
    case 0x6C:
      v14 = CFSTR("UNUSED_108");
      break;
    case 0x6D:
      v14 = CFSTR("UNUSED_109");
      break;
    case 0x6E:
      v14 = CFSTR("UNUSED_110");
      break;
    case 0x6F:
      v14 = CFSTR("UNUSED_111");
      break;
    case 0x70:
      v14 = CFSTR("UNUSED_112");
      break;
    case 0x71:
      v14 = CFSTR("UNUSED_113");
      break;
    case 0x72:
      v14 = CFSTR("UNUSED_114");
      break;
    case 0x73:
      v14 = CFSTR("UNUSED_115");
      break;
    case 0x74:
      v14 = CFSTR("UNUSED_116");
      break;
    case 0x75:
      v14 = CFSTR("UNUSED_117");
      break;
    case 0x76:
      v14 = CFSTR("UNUSED_118");
      break;
    case 0x77:
      v14 = CFSTR("UNUSED_119");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("style"));

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_148;
    goto LABEL_144;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("identifier"));

  if ((*(_BYTE *)(a1 + 60) & 0x40) == 0)
    goto LABEL_148;
LABEL_144:
  v16 = *(int *)(a1 + 56);
  if (v16 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E1C0EBB0[v16];
  }
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("type"));

LABEL_148:
  if (*(_QWORD *)(a1 + 16))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 16));
    if (*(_QWORD *)(a1 + 16))
    {
      v19 = 0;
      v20 = 0;
      do
      {
        _GEORPFeatureHandleStyleAttributeDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 8) + v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v21);

        ++v20;
        v19 += 8;
      }
      while (v20 < *(_QWORD *)(a1 + 16));
    }
    if (a2)
      v22 = CFSTR("styleAttribute");
    else
      v22 = CFSTR("style_attribute");
    objc_msgSend(v4, "setObject:forKey:", v18, v22);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeatureHandle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeatureHandle)initWithDictionary:(id)a3
{
  return (GEORPFeatureHandle *)-[GEORPFeatureHandle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_300;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_300;
  if (a3)
    v6 = CFSTR("featureIndex");
  else
    v6 = CFSTR("feature_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFeatureIndex:", objc_msgSend(v7, "unsignedIntValue"));

  if (a3)
    v8 = CFSTR("featureTileX");
  else
    v8 = CFSTR("feature_tile_x");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFeatureTileX:", objc_msgSend(v9, "unsignedIntValue"));

  if (a3)
    v10 = CFSTR("featureTileY");
  else
    v10 = CFSTR("feature_tile_y");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFeatureTileY:", objc_msgSend(v11, "unsignedIntValue"));

  if (a3)
    v12 = CFSTR("featureTileZ");
  else
    v12 = CFSTR("feature_tile_z");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFeatureTileZ:", objc_msgSend(v13, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("style"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v16 = 3;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v16 = 4;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
    {
      v16 = 5;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
    {
      v16 = 6;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
    {
      v16 = 7;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
    {
      v16 = 8;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
    {
      v16 = 11;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
    {
      v16 = 12;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
    {
      v16 = 13;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
    {
      v16 = 14;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
    {
      v16 = 15;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
    {
      v16 = 16;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
    {
      v16 = 17;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
    {
      v16 = 18;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
    {
      v16 = 19;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
    {
      v16 = 20;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
    {
      v16 = 21;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
    {
      v16 = 22;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
    {
      v16 = 23;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
    {
      v16 = 24;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
    {
      v16 = 25;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
    {
      v16 = 26;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
    {
      v16 = 27;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
    {
      v16 = 28;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
    {
      v16 = 29;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
    {
      v16 = 30;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
    {
      v16 = 31;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
    {
      v16 = 32;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
    {
      v16 = 33;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
    {
      v16 = 34;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
    {
      v16 = 35;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
    {
      v16 = 36;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
    {
      v16 = 37;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
    {
      v16 = 38;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
    {
      v16 = 39;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
    {
      v16 = 40;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
    {
      v16 = 41;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
    {
      v16 = 42;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
    {
      v16 = 43;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
    {
      v16 = 44;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
    {
      v16 = 45;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
    {
      v16 = 46;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
    {
      v16 = 47;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
    {
      v16 = 48;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
    {
      v16 = 52;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
    {
      v16 = 53;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
    {
      v16 = 54;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
    {
      v16 = 55;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
    {
      v16 = 56;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
    {
      v16 = 57;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
    {
      v16 = 58;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
    {
      v16 = 59;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
    {
      v16 = 60;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
    {
      v16 = 61;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
    {
      v16 = 62;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
    {
      v16 = 63;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
    {
      v16 = 64;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
    {
      v16 = 65;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
    {
      v16 = 66;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
    {
      v16 = 67;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
    {
      v16 = 68;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
    {
      v16 = 69;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
    {
      v16 = 70;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
    {
      v16 = 71;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
    {
      v16 = 72;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
    {
      v16 = 73;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
    {
      v16 = 74;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
    {
      v16 = 75;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
    {
      v16 = 76;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
    {
      v16 = 77;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
    {
      v16 = 78;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
    {
      v16 = 79;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
    {
      v16 = 80;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
    {
      v16 = 81;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
    {
      v16 = 82;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
    {
      v16 = 83;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
    {
      v16 = 84;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
    {
      v16 = 85;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
    {
      v16 = 86;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
    {
      v16 = 87;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
    {
      v16 = 88;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
    {
      v16 = 89;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
    {
      v16 = 90;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
    {
      v16 = 91;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
    {
      v16 = 92;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
    {
      v16 = 93;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
    {
      v16 = 94;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
    {
      v16 = 95;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
    {
      v16 = 96;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
    {
      v16 = 97;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
    {
      v16 = 98;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
    {
      v16 = 99;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
    {
      v16 = 100;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
    {
      v16 = 101;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
    {
      v16 = 102;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
    {
      v16 = 103;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
    {
      v16 = 104;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
    {
      v16 = 105;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
    {
      v16 = 106;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
    {
      v16 = 107;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
    {
      v16 = 108;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
    {
      v16 = 109;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
    {
      v16 = 110;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
    {
      v16 = 111;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
    {
      v16 = 112;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
    {
      v16 = 113;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
    {
      v16 = 114;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
    {
      v16 = 115;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
    {
      v16 = 116;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
    {
      v16 = 117;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
    {
      v16 = 118;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("UNUSED_119")))
    {
      v16 = 119;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_259;
    v16 = objc_msgSend(v14, "intValue");
  }
  objc_msgSend(a1, "setStyle:", v16);
LABEL_259:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v17, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("LINE")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("POLYGON")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("TRANSIT_NODE")) & 1) != 0)
    {
      v20 = 4;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT")) & 1) != 0)
    {
      v20 = 5;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("TRANSIT_LINE")) & 1) != 0)
    {
      v20 = 6;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("TRANSIT_LINES")) & 1) != 0)
    {
      v20 = 7;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT")))
    {
      v20 = 8;
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_284;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v18, "intValue");
LABEL_284:
    objc_msgSend(a1, "setType:", v20);
  }

  if (a3)
    v21 = CFSTR("styleAttribute");
  else
    v21 = CFSTR("style_attribute");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v32;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = 0;
            _GEORPFeatureHandleStyleAttributeFromDictionaryRepresentation(v28, &v30);
            objc_msgSend(a1, "addStyleAttribute:", v30);
          }
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v25);
    }

  }
LABEL_300:

  return a1;
}

- (GEORPFeatureHandle)initWithJSON:(id)a3
{
  return (GEORPFeatureHandle *)-[GEORPFeatureHandle _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeatureHandleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeatureHandleReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:
  if (self->_styleAttributesCount)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      PBDataWriterWriteInt32Field();
      PBDataWriterWriteInt32Field();
      PBDataWriterRecallMark();
      ++v7;
      v6 += 8;
    }
    while (v7 < self->_styleAttributesCount);
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  _DWORD *v8;

  v8 = a3;
  -[GEORPFeatureHandle readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v8[8] = self->_featureIndex;
    *((_BYTE *)v8 + 60) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v8[9] = self->_featureTileX;
  *((_BYTE *)v8 + 60) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v8[10] = self->_featureTileY;
  *((_BYTE *)v8 + 60) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v8[11] = self->_featureTileZ;
  *((_BYTE *)v8 + 60) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
LABEL_19:
    v8[12] = self->_identifier;
    *((_BYTE *)v8 + 60) |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_18:
  v8[13] = self->_style;
  *((_BYTE *)v8 + 60) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_19;
LABEL_7:
  if ((flags & 0x40) != 0)
  {
LABEL_8:
    v8[14] = self->_type;
    *((_BYTE *)v8 + 60) |= 0x40u;
  }
LABEL_9:
  if (-[GEORPFeatureHandle styleAttributesCount](self, "styleAttributesCount"))
  {
    objc_msgSend(v8, "clearStyleAttributes");
    v5 = -[GEORPFeatureHandle styleAttributesCount](self, "styleAttributesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addStyleAttribute:", -[GEORPFeatureHandle styleAttributeAtIndex:](self, "styleAttributeAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char flags;
  unint64_t styleAttributesCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_featureIndex;
    *(_BYTE *)(v4 + 60) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 36) = self->_featureTileX;
  *(_BYTE *)(v4 + 60) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v4 + 40) = self->_featureTileY;
  *(_BYTE *)(v4 + 60) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v4 + 44) = self->_featureTileZ;
  *(_BYTE *)(v4 + 60) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v4 + 52) = self->_style;
  *(_BYTE *)(v4 + 60) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  *(_DWORD *)(v4 + 48) = self->_identifier;
  *(_BYTE *)(v4 + 60) |= 0x10u;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v4 + 56) = self->_type;
    *(_BYTE *)(v4 + 60) |= 0x40u;
  }
LABEL_9:
  styleAttributesCount = self->_styleAttributesCount;
  if (styleAttributesCount)
  {
    -[GEORPFeatureHandle _reserveStyleAttributes:](v4, styleAttributesCount);
    memcpy(*(void **)(v5 + 8), self->_styleAttributes, 8 * self->_styleAttributesCount);
    *(_QWORD *)(v5 + 16) = self->_styleAttributesCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t styleAttributesCount;
  BOOL v6;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  -[GEORPFeatureHandle readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_featureIndex != *((_DWORD *)v4 + 8))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_featureTileX != *((_DWORD *)v4 + 9))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_featureTileY != *((_DWORD *)v4 + 10))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_featureTileZ != *((_DWORD *)v4 + 11))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) == 0 || self->_style != *((_DWORD *)v4 + 13))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_identifier != *((_DWORD *)v4 + 12))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x40) != 0)
  {
    goto LABEL_39;
  }
  styleAttributesCount = self->_styleAttributesCount;
  if ((const void *)styleAttributesCount != v4[2])
  {
LABEL_39:
    v6 = 0;
    goto LABEL_40;
  }
  v6 = memcmp(self->_styleAttributes, v4[1], 8 * styleAttributesCount) == 0;
LABEL_40:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[GEORPFeatureHandle readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_featureIndex;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_featureTileX;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_featureTileY;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_featureTileZ;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_style;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_7;
LABEL_14:
    v8 = 0;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ PBHashBytes();
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_identifier;
  if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v9 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = *((_BYTE *)v8 + 60);
  if ((v4 & 1) != 0)
  {
    self->_featureIndex = *((_DWORD *)v8 + 8);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v8 + 60);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v8 + 60) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_featureTileX = *((_DWORD *)v8 + 9);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v8 + 60);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_featureTileY = *((_DWORD *)v8 + 10);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v8 + 60);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_featureTileZ = *((_DWORD *)v8 + 11);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v8 + 60);
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_style = *((_DWORD *)v8 + 13);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v8 + 60);
  if ((v4 & 0x10) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_18:
  self->_identifier = *((_DWORD *)v8 + 12);
  *(_BYTE *)&self->_flags |= 0x10u;
  if ((*((_BYTE *)v8 + 60) & 0x40) != 0)
  {
LABEL_8:
    self->_type = *((_DWORD *)v8 + 14);
    *(_BYTE *)&self->_flags |= 0x40u;
  }
LABEL_9:
  v5 = objc_msgSend(v8, "styleAttributesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEORPFeatureHandle addStyleAttribute:](self, "addStyleAttribute:", objc_msgSend(v8, "styleAttributeAtIndex:", i));
  }

}

@end
