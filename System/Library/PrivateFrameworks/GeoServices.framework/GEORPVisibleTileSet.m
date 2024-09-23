@implementation GEORPVisibleTileSet

- (void)dealloc
{
  objc_super v3;

  -[GEORPVisibleTileSet clearTileKeys](self, "clearTileKeys");
  v3.receiver = self;
  v3.super_class = (Class)GEORPVisibleTileSet;
  -[GEORPVisibleTileSet dealloc](&v3, sel_dealloc);
}

- (int)style
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_style;
  else
    return 0;
}

- (void)setStyle:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStyle
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  *(_BYTE *)&self->_flags |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIdentifier
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unint64_t)tileKeysCount
{
  return self->_tileKeysCount;
}

- (GEORPVisibleTileKey)tileKeys
{
  return self->_tileKeys;
}

- (uint64_t)_reserveTileKeys:(uint64_t)a1
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
    if (16 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 16 * v9, 0x16951399uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)(a1 + 8) = result;
      bzero((void *)(result + 16 * *(_QWORD *)(a1 + 16)), 16 * (v9 - *(_QWORD *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (void)clearTileKeys
{
  self->_tileKeysSpace = 0;
  self->_tileKeysCount = 0;
  free(self->_tileKeys);
  self->_tileKeys = 0;
}

- (void)addTileKey:(GEORPVisibleTileKey)a3
{
  uint64_t v3;
  uint64_t v4;
  GEORPVisibleTileKey *v6;

  v3 = *(_QWORD *)&a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  if (-[GEORPVisibleTileSet _reserveTileKeys:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_tileKeys[self->_tileKeysCount];
    *(_QWORD *)&v6->var0 = v4;
    *(_QWORD *)&v6->var2 = v3;
    ++self->_tileKeysCount;
  }
}

- (GEORPVisibleTileKey)tileKeyAtIndex:(unint64_t)a3
{
  unint64_t tileKeysCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEORPVisibleTileKey *v10;
  uint64_t v11;
  uint64_t v12;
  GEORPVisibleTileKey result;

  tileKeysCount = self->_tileKeysCount;
  if (tileKeysCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, tileKeysCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_tileKeys[a3];
  v11 = *(_QWORD *)&v10->var0;
  v12 = *(_QWORD *)&v10->var2;
  result.var2 = v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setTileKeys:(GEORPVisibleTileKey *)a3 count:(unint64_t)a4
{
  -[GEORPVisibleTileSet clearTileKeys](self, "clearTileKeys");
  if (-[GEORPVisibleTileSet _reserveTileKeys:]((uint64_t)self, a4))
  {
    memcpy(self->_tileKeys, a3, 16 * a4);
    self->_tileKeysCount = a4;
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
  v8.super_class = (Class)GEORPVisibleTileSet;
  -[GEORPVisibleTileSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPVisibleTileSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPVisibleTileSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 40);
    if ((v5 & 2) != 0)
    {
      v6 = CFSTR("RASTER_STANDARD");
      switch(*(_DWORD *)(a1 + 36))
      {
        case 0:
          break;
        case 1:
          v6 = CFSTR("VECTOR_STANDARD");
          break;
        case 2:
          v6 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
          break;
        case 3:
          v6 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
          break;
        case 4:
          v6 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
          break;
        case 5:
          v6 = CFSTR("RASTER_STANDARD_BACKGROUND");
          break;
        case 6:
          v6 = CFSTR("RASTER_HYBRID");
          break;
        case 7:
          v6 = CFSTR("RASTER_SATELLITE");
          break;
        case 8:
          v6 = CFSTR("RASTER_TERRAIN");
          break;
        case 0xB:
          v6 = CFSTR("VECTOR_BUILDINGS");
          break;
        case 0xC:
          v6 = CFSTR("VECTOR_TRAFFIC");
          break;
        case 0xD:
          v6 = CFSTR("VECTOR_POI");
          break;
        case 0xE:
          v6 = CFSTR("SPUTNIK_METADATA");
          break;
        case 0xF:
          v6 = CFSTR("SPUTNIK_C3M");
          break;
        case 0x10:
          v6 = CFSTR("SPUTNIK_DSM");
          break;
        case 0x11:
          v6 = CFSTR("SPUTNIK_DSM_GLOBAL");
          break;
        case 0x12:
          v6 = CFSTR("VECTOR_REALISTIC");
          break;
        case 0x13:
          v6 = CFSTR("VECTOR_LEGACY_REALISTIC");
          break;
        case 0x14:
          v6 = CFSTR("VECTOR_ROADS");
          break;
        case 0x15:
          v6 = CFSTR("RASTER_VEGETATION");
          break;
        case 0x16:
          v6 = CFSTR("VECTOR_TRAFFIC_SKELETON");
          break;
        case 0x17:
          v6 = CFSTR("RASTER_COASTLINE_MASK");
          break;
        case 0x18:
          v6 = CFSTR("RASTER_HILLSHADE");
          break;
        case 0x19:
          v6 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
          break;
        case 0x1A:
          v6 = CFSTR("VECTOR_TRAFFIC_STATIC");
          break;
        case 0x1B:
          v6 = CFSTR("RASTER_COASTLINE_DROP_MASK");
          break;
        case 0x1C:
          v6 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
          break;
        case 0x1D:
          v6 = CFSTR("VECTOR_SPEED_PROFILES");
          break;
        case 0x1E:
          v6 = CFSTR("VECTOR_VENUES");
          break;
        case 0x1F:
          v6 = CFSTR("RASTER_DOWN_SAMPLED");
          break;
        case 0x20:
          v6 = CFSTR("RASTER_COLOR_BALANCED");
          break;
        case 0x21:
          v6 = CFSTR("RASTER_SATELLITE_NIGHT");
          break;
        case 0x22:
          v6 = CFSTR("SPUTNIK_VECTOR_BORDER");
          break;
        case 0x23:
          v6 = CFSTR("RASTER_SATELLITE_DIGITIZE");
          break;
        case 0x24:
          v6 = CFSTR("RASTER_HILLSHADE_PARKS");
          break;
        case 0x25:
          v6 = CFSTR("VECTOR_TRANSIT");
          break;
        case 0x26:
          v6 = CFSTR("RASTER_STANDARD_BASE");
          break;
        case 0x27:
          v6 = CFSTR("RASTER_STANDARD_LABELS");
          break;
        case 0x28:
          v6 = CFSTR("RASTER_HYBRID_ROADS");
          break;
        case 0x29:
          v6 = CFSTR("RASTER_HYBRID_LABELS");
          break;
        case 0x2A:
          v6 = CFSTR("FLYOVER_C3M_MESH");
          break;
        case 0x2B:
          v6 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
          break;
        case 0x2C:
          v6 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
          break;
        case 0x2D:
          v6 = CFSTR("RASTER_SATELLITE_ASTC");
          break;
        case 0x2E:
          v6 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
          break;
        case 0x2F:
          v6 = CFSTR("VECTOR_TRANSIT_SELECTION");
          break;
        case 0x30:
          v6 = CFSTR("VECTOR_COVERAGE");
          break;
        case 0x34:
          v6 = CFSTR("FLYOVER_METADATA");
          break;
        case 0x35:
          v6 = CFSTR("VECTOR_ROAD_NETWORK");
          break;
        case 0x36:
          v6 = CFSTR("VECTOR_LAND_COVER");
          break;
        case 0x37:
          v6 = CFSTR("VECTOR_DEBUG");
          break;
        case 0x38:
          v6 = CFSTR("VECTOR_STREET_POI");
          break;
        case 0x39:
          v6 = CFSTR("MUNIN_METADATA");
          break;
        case 0x3A:
          v6 = CFSTR("VECTOR_SPR_MERCATOR");
          break;
        case 0x3B:
          v6 = CFSTR("VECTOR_SPR_MODELS");
          break;
        case 0x3C:
          v6 = CFSTR("VECTOR_SPR_MATERIALS");
          break;
        case 0x3D:
          v6 = CFSTR("VECTOR_SPR_METADATA");
          break;
        case 0x3E:
          v6 = CFSTR("VECTOR_TRACKS");
          break;
        case 0x3F:
          v6 = CFSTR("VECTOR_RESERVED_2");
          break;
        case 0x40:
          v6 = CFSTR("VECTOR_STREET_LANDMARKS");
          break;
        case 0x41:
          v6 = CFSTR("COARSE_LOCATION_POLYGONS");
          break;
        case 0x42:
          v6 = CFSTR("VECTOR_SPR_ROADS");
          break;
        case 0x43:
          v6 = CFSTR("VECTOR_SPR_STANDARD");
          break;
        case 0x44:
          v6 = CFSTR("VECTOR_POI_V2");
          break;
        case 0x45:
          v6 = CFSTR("VECTOR_POLYGON_SELECTION");
          break;
        case 0x46:
          v6 = CFSTR("VL_METADATA");
          break;
        case 0x47:
          v6 = CFSTR("VL_DATA");
          break;
        case 0x48:
          v6 = CFSTR("PROACTIVE_APP_CLIP");
          break;
        case 0x49:
          v6 = CFSTR("VECTOR_BUILDINGS_V2");
          break;
        case 0x4A:
          v6 = CFSTR("POI_BUSYNESS");
          break;
        case 0x4B:
          v6 = CFSTR("POI_DP_BUSYNESS");
          break;
        case 0x4C:
          v6 = CFSTR("SMART_INTERFACE_SELECTION");
          break;
        case 0x4D:
          v6 = CFSTR("VECTOR_ASSETS");
          break;
        case 0x4E:
          v6 = CFSTR("SPR_ASSET_METADATA");
          break;
        case 0x4F:
          v6 = CFSTR("VECTOR_SPR_POLAR");
          break;
        case 0x50:
          v6 = CFSTR("SMART_DATA_MODE");
          break;
        case 0x51:
          v6 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
          break;
        case 0x52:
          v6 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
          break;
        case 0x53:
          v6 = CFSTR("VECTOR_TOPOGRAPHIC");
          break;
        case 0x54:
          v6 = CFSTR("VECTOR_POI_V2_UPDATE");
          break;
        case 0x55:
          v6 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
          break;
        case 0x56:
          v6 = CFSTR("VECTOR_TRAFFIC_V2");
          break;
        case 0x57:
          v6 = CFSTR("VECTOR_ROAD_SELECTION");
          break;
        case 0x58:
          v6 = CFSTR("VECTOR_REGION_METADATA");
          break;
        case 0x59:
          v6 = CFSTR("RAY_TRACING");
          break;
        case 0x5A:
          v6 = CFSTR("VECTOR_CONTOURS");
          break;
        case 0x5B:
          v6 = CFSTR("RASTER_SATELLITE_POLAR");
          break;
        case 0x5C:
          v6 = CFSTR("VMAP4_ELEVATION");
          break;
        case 0x5D:
          v6 = CFSTR("VMAP4_ELEVATION_POLAR");
          break;
        case 0x5E:
          v6 = CFSTR("CELLULAR_COVERAGE_PLMN");
          break;
        case 0x5F:
          v6 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
          break;
        case 0x60:
          v6 = CFSTR("UNUSED_96");
          break;
        case 0x61:
          v6 = CFSTR("UNUSED_97");
          break;
        case 0x62:
          v6 = CFSTR("UNUSED_98");
          break;
        case 0x63:
          v6 = CFSTR("UNUSED_99");
          break;
        case 0x64:
          v6 = CFSTR("UNUSED_100");
          break;
        case 0x65:
          v6 = CFSTR("UNUSED_101");
          break;
        case 0x66:
          v6 = CFSTR("UNUSED_102");
          break;
        case 0x67:
          v6 = CFSTR("UNUSED_103");
          break;
        case 0x68:
          v6 = CFSTR("UNUSED_104");
          break;
        case 0x69:
          v6 = CFSTR("UNUSED_105");
          break;
        case 0x6A:
          v6 = CFSTR("UNUSED_106");
          break;
        case 0x6B:
          v6 = CFSTR("UNUSED_107");
          break;
        case 0x6C:
          v6 = CFSTR("UNUSED_108");
          break;
        case 0x6D:
          v6 = CFSTR("UNUSED_109");
          break;
        case 0x6E:
          v6 = CFSTR("UNUSED_110");
          break;
        case 0x6F:
          v6 = CFSTR("UNUSED_111");
          break;
        case 0x70:
          v6 = CFSTR("UNUSED_112");
          break;
        case 0x71:
          v6 = CFSTR("UNUSED_113");
          break;
        case 0x72:
          v6 = CFSTR("UNUSED_114");
          break;
        case 0x73:
          v6 = CFSTR("UNUSED_115");
          break;
        case 0x74:
          v6 = CFSTR("UNUSED_116");
          break;
        case 0x75:
          v6 = CFSTR("UNUSED_117");
          break;
        case 0x76:
          v6 = CFSTR("UNUSED_118");
          break;
        case 0x77:
          v6 = CFSTR("UNUSED_119");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 36));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("style"));

      v5 = *(_BYTE *)(a1 + 40);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("identifier"));

    }
    if (*(_QWORD *)(a1 + 16))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 16));
      if (*(_QWORD *)(a1 + 16))
      {
        v9 = 0;
        v10 = 0;
        do
        {
          _GEORPVisibleTileKeyDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 8) + v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v11);

          ++v10;
          v9 += 16;
        }
        while (v10 < *(_QWORD *)(a1 + 16));
      }
      if (a2)
        v12 = CFSTR("tileKey");
      else
        v12 = CFSTR("tile_key");
      objc_msgSend(v4, "setObject:forKey:", v8, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPVisibleTileSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPVisibleTileSet)initWithDictionary:(id)a3
{
  return (GEORPVisibleTileSet *)-[GEORPVisibleTileSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_256;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_256;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("style"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
    {
      v8 = 13;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
    {
      v8 = 14;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
    {
      v8 = 15;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
    {
      v8 = 16;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
    {
      v8 = 17;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
    {
      v8 = 18;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
    {
      v8 = 19;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
    {
      v8 = 21;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
    {
      v8 = 22;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
    {
      v8 = 23;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
    {
      v8 = 24;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
    {
      v8 = 25;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
    {
      v8 = 26;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
    {
      v8 = 27;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
    {
      v8 = 28;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
    {
      v8 = 29;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
    {
      v8 = 31;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
    {
      v8 = 32;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
    {
      v8 = 33;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
    {
      v8 = 34;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
    {
      v8 = 35;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
    {
      v8 = 36;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
    {
      v8 = 37;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
    {
      v8 = 38;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
    {
      v8 = 39;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
    {
      v8 = 40;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
    {
      v8 = 41;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
    {
      v8 = 42;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
    {
      v8 = 43;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
    {
      v8 = 44;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
    {
      v8 = 45;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
    {
      v8 = 46;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
    {
      v8 = 47;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
    {
      v8 = 48;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
    {
      v8 = 52;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
    {
      v8 = 53;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
    {
      v8 = 54;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
    {
      v8 = 55;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
    {
      v8 = 56;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
    {
      v8 = 57;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
    {
      v8 = 58;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
    {
      v8 = 59;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
    {
      v8 = 60;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
    {
      v8 = 61;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
    {
      v8 = 62;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
    {
      v8 = 63;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
    {
      v8 = 64;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
    {
      v8 = 65;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
    {
      v8 = 66;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
    {
      v8 = 67;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
    {
      v8 = 68;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
    {
      v8 = 69;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
    {
      v8 = 70;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
    {
      v8 = 71;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
    {
      v8 = 72;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
    {
      v8 = 73;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
    {
      v8 = 74;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
    {
      v8 = 75;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
    {
      v8 = 76;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
    {
      v8 = 77;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
    {
      v8 = 78;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
    {
      v8 = 79;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
    {
      v8 = 80;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
    {
      v8 = 81;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
    {
      v8 = 82;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
    {
      v8 = 83;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
    {
      v8 = 84;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
    {
      v8 = 85;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
    {
      v8 = 86;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
    {
      v8 = 87;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
    {
      v8 = 88;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
    {
      v8 = 89;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
    {
      v8 = 90;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
    {
      v8 = 91;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
    {
      v8 = 92;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
    {
      v8 = 93;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
    {
      v8 = 94;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
    {
      v8 = 95;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
    {
      v8 = 96;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
    {
      v8 = 97;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
    {
      v8 = 98;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
    {
      v8 = 99;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
    {
      v8 = 100;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
    {
      v8 = 101;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
    {
      v8 = 102;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
    {
      v8 = 103;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
    {
      v8 = 104;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
    {
      v8 = 105;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
    {
      v8 = 106;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
    {
      v8 = 107;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
    {
      v8 = 108;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
    {
      v8 = 109;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
    {
      v8 = 110;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
    {
      v8 = 111;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
    {
      v8 = 112;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
    {
      v8 = 113;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
    {
      v8 = 114;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
    {
      v8 = 115;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
    {
      v8 = 116;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
    {
      v8 = 117;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
    {
      v8 = 118;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("UNUSED_119")))
    {
      v8 = 119;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_238;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_238:
    objc_msgSend(a1, "setStyle:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v9, "unsignedIntValue"));

  if (a3)
    v10 = CFSTR("tileKey");
  else
    v10 = CFSTR("tile_key");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = 0;
            v20 = 0;
            _GEORPVisibleTileKeyFromDictionaryRepresentation(v17, (uint64_t)&v19);
            objc_msgSend(a1, "addTileKey:", v19, v20);
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

  }
LABEL_256:

  return a1;
}

- (GEORPVisibleTileSet)initWithJSON:(id)a3
{
  return (GEORPVisibleTileSet *)-[GEORPVisibleTileSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPVisibleTileSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPVisibleTileSetReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_tileKeysCount)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEORPVisibleTileKeyWriteTo((uint64_t)&self->_tileKeys[v6]);
      PBDataWriterRecallMark();
      ++v7;
      ++v6;
    }
    while (v7 < self->_tileKeysCount);
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;

  v10 = a3;
  -[GEORPVisibleTileSet readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v10[9] = self->_style;
    *((_BYTE *)v10 + 40) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v10[8] = self->_identifier;
    *((_BYTE *)v10 + 40) |= 1u;
  }
  if (-[GEORPVisibleTileSet tileKeysCount](self, "tileKeysCount"))
  {
    objc_msgSend(v10, "clearTileKeys");
    v5 = -[GEORPVisibleTileSet tileKeysCount](self, "tileKeysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = -[GEORPVisibleTileSet tileKeyAtIndex:](self, "tileKeyAtIndex:", i);
        objc_msgSend(v10, "addTileKey:", v8, v9);
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char flags;
  unint64_t tileKeysCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 36) = self->_style;
    *(_BYTE *)(v4 + 40) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_identifier;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
  tileKeysCount = self->_tileKeysCount;
  if (tileKeysCount)
  {
    -[GEORPVisibleTileSet _reserveTileKeys:](v4, tileKeysCount);
    memcpy(*(void **)(v5 + 8), self->_tileKeys, 16 * self->_tileKeysCount);
    *(_QWORD *)(v5 + 16) = self->_tileKeysCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t tileKeysCount;
  BOOL v6;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEORPVisibleTileSet readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[5] & 2) == 0 || self->_style != *((_DWORD *)v4 + 9))
      goto LABEL_14;
  }
  else if (((_BYTE)v4[5] & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (((_BYTE)v4[5] & 1) == 0 || self->_identifier != *((_DWORD *)v4 + 8))
      goto LABEL_14;
  }
  else if (((_BYTE)v4[5] & 1) != 0)
  {
    goto LABEL_14;
  }
  tileKeysCount = self->_tileKeysCount;
  if ((const void *)tileKeysCount != v4[2])
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = memcmp(self->_tileKeys, v4[1], 16 * tileKeysCount) == 0;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEORPVisibleTileSet readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_style;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ PBHashBytes();
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_identifier;
  return v4 ^ v3 ^ PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = *((_BYTE *)v10 + 40);
  if ((v4 & 2) != 0)
  {
    self->_style = *((_DWORD *)v10 + 9);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v10 + 40);
  }
  if ((v4 & 1) != 0)
  {
    self->_identifier = *((_DWORD *)v10 + 8);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v5 = objc_msgSend(v10, "tileKeysCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = objc_msgSend(v10, "tileKeyAtIndex:", i);
      -[GEORPVisibleTileSet addTileKey:](self, "addTileKey:", v8, v9);
    }
  }

}

@end
