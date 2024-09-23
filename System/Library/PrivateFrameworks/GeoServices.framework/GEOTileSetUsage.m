@implementation GEOTileSetUsage

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

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOTileSetUsage;
  -[GEOTileSetUsage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileSetUsage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_BYTE *)(a1 + 16);
    if ((v3 & 2) != 0)
    {
      v4 = CFSTR("RASTER_STANDARD");
      switch(*(_DWORD *)(a1 + 12))
      {
        case 0:
          break;
        case 1:
          v4 = CFSTR("VECTOR_STANDARD");
          break;
        case 2:
          v4 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
          break;
        case 3:
          v4 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
          break;
        case 4:
          v4 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
          break;
        case 5:
          v4 = CFSTR("RASTER_STANDARD_BACKGROUND");
          break;
        case 6:
          v4 = CFSTR("RASTER_HYBRID");
          break;
        case 7:
          v4 = CFSTR("RASTER_SATELLITE");
          break;
        case 8:
          v4 = CFSTR("RASTER_TERRAIN");
          break;
        case 0xB:
          v4 = CFSTR("VECTOR_BUILDINGS");
          break;
        case 0xC:
          v4 = CFSTR("VECTOR_TRAFFIC");
          break;
        case 0xD:
          v4 = CFSTR("VECTOR_POI");
          break;
        case 0xE:
          v4 = CFSTR("SPUTNIK_METADATA");
          break;
        case 0xF:
          v4 = CFSTR("SPUTNIK_C3M");
          break;
        case 0x10:
          v4 = CFSTR("SPUTNIK_DSM");
          break;
        case 0x11:
          v4 = CFSTR("SPUTNIK_DSM_GLOBAL");
          break;
        case 0x12:
          v4 = CFSTR("VECTOR_REALISTIC");
          break;
        case 0x13:
          v4 = CFSTR("VECTOR_LEGACY_REALISTIC");
          break;
        case 0x14:
          v4 = CFSTR("VECTOR_ROADS");
          break;
        case 0x15:
          v4 = CFSTR("RASTER_VEGETATION");
          break;
        case 0x16:
          v4 = CFSTR("VECTOR_TRAFFIC_SKELETON");
          break;
        case 0x17:
          v4 = CFSTR("RASTER_COASTLINE_MASK");
          break;
        case 0x18:
          v4 = CFSTR("RASTER_HILLSHADE");
          break;
        case 0x19:
          v4 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
          break;
        case 0x1A:
          v4 = CFSTR("VECTOR_TRAFFIC_STATIC");
          break;
        case 0x1B:
          v4 = CFSTR("RASTER_COASTLINE_DROP_MASK");
          break;
        case 0x1C:
          v4 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
          break;
        case 0x1D:
          v4 = CFSTR("VECTOR_SPEED_PROFILES");
          break;
        case 0x1E:
          v4 = CFSTR("VECTOR_VENUES");
          break;
        case 0x1F:
          v4 = CFSTR("RASTER_DOWN_SAMPLED");
          break;
        case 0x20:
          v4 = CFSTR("RASTER_COLOR_BALANCED");
          break;
        case 0x21:
          v4 = CFSTR("RASTER_SATELLITE_NIGHT");
          break;
        case 0x22:
          v4 = CFSTR("SPUTNIK_VECTOR_BORDER");
          break;
        case 0x23:
          v4 = CFSTR("RASTER_SATELLITE_DIGITIZE");
          break;
        case 0x24:
          v4 = CFSTR("RASTER_HILLSHADE_PARKS");
          break;
        case 0x25:
          v4 = CFSTR("VECTOR_TRANSIT");
          break;
        case 0x26:
          v4 = CFSTR("RASTER_STANDARD_BASE");
          break;
        case 0x27:
          v4 = CFSTR("RASTER_STANDARD_LABELS");
          break;
        case 0x28:
          v4 = CFSTR("RASTER_HYBRID_ROADS");
          break;
        case 0x29:
          v4 = CFSTR("RASTER_HYBRID_LABELS");
          break;
        case 0x2A:
          v4 = CFSTR("FLYOVER_C3M_MESH");
          break;
        case 0x2B:
          v4 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
          break;
        case 0x2C:
          v4 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
          break;
        case 0x2D:
          v4 = CFSTR("RASTER_SATELLITE_ASTC");
          break;
        case 0x2E:
          v4 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
          break;
        case 0x2F:
          v4 = CFSTR("VECTOR_TRANSIT_SELECTION");
          break;
        case 0x30:
          v4 = CFSTR("VECTOR_COVERAGE");
          break;
        case 0x34:
          v4 = CFSTR("FLYOVER_METADATA");
          break;
        case 0x35:
          v4 = CFSTR("VECTOR_ROAD_NETWORK");
          break;
        case 0x36:
          v4 = CFSTR("VECTOR_LAND_COVER");
          break;
        case 0x37:
          v4 = CFSTR("VECTOR_DEBUG");
          break;
        case 0x38:
          v4 = CFSTR("VECTOR_STREET_POI");
          break;
        case 0x39:
          v4 = CFSTR("MUNIN_METADATA");
          break;
        case 0x3A:
          v4 = CFSTR("VECTOR_SPR_MERCATOR");
          break;
        case 0x3B:
          v4 = CFSTR("VECTOR_SPR_MODELS");
          break;
        case 0x3C:
          v4 = CFSTR("VECTOR_SPR_MATERIALS");
          break;
        case 0x3D:
          v4 = CFSTR("VECTOR_SPR_METADATA");
          break;
        case 0x3E:
          v4 = CFSTR("VECTOR_TRACKS");
          break;
        case 0x3F:
          v4 = CFSTR("VECTOR_RESERVED_2");
          break;
        case 0x40:
          v4 = CFSTR("VECTOR_STREET_LANDMARKS");
          break;
        case 0x41:
          v4 = CFSTR("COARSE_LOCATION_POLYGONS");
          break;
        case 0x42:
          v4 = CFSTR("VECTOR_SPR_ROADS");
          break;
        case 0x43:
          v4 = CFSTR("VECTOR_SPR_STANDARD");
          break;
        case 0x44:
          v4 = CFSTR("VECTOR_POI_V2");
          break;
        case 0x45:
          v4 = CFSTR("VECTOR_POLYGON_SELECTION");
          break;
        case 0x46:
          v4 = CFSTR("VL_METADATA");
          break;
        case 0x47:
          v4 = CFSTR("VL_DATA");
          break;
        case 0x48:
          v4 = CFSTR("PROACTIVE_APP_CLIP");
          break;
        case 0x49:
          v4 = CFSTR("VECTOR_BUILDINGS_V2");
          break;
        case 0x4A:
          v4 = CFSTR("POI_BUSYNESS");
          break;
        case 0x4B:
          v4 = CFSTR("POI_DP_BUSYNESS");
          break;
        case 0x4C:
          v4 = CFSTR("SMART_INTERFACE_SELECTION");
          break;
        case 0x4D:
          v4 = CFSTR("VECTOR_ASSETS");
          break;
        case 0x4E:
          v4 = CFSTR("SPR_ASSET_METADATA");
          break;
        case 0x4F:
          v4 = CFSTR("VECTOR_SPR_POLAR");
          break;
        case 0x50:
          v4 = CFSTR("SMART_DATA_MODE");
          break;
        case 0x51:
          v4 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
          break;
        case 0x52:
          v4 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
          break;
        case 0x53:
          v4 = CFSTR("VECTOR_TOPOGRAPHIC");
          break;
        case 0x54:
          v4 = CFSTR("VECTOR_POI_V2_UPDATE");
          break;
        case 0x55:
          v4 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
          break;
        case 0x56:
          v4 = CFSTR("VECTOR_TRAFFIC_V2");
          break;
        case 0x57:
          v4 = CFSTR("VECTOR_ROAD_SELECTION");
          break;
        case 0x58:
          v4 = CFSTR("VECTOR_REGION_METADATA");
          break;
        case 0x59:
          v4 = CFSTR("RAY_TRACING");
          break;
        case 0x5A:
          v4 = CFSTR("VECTOR_CONTOURS");
          break;
        case 0x5B:
          v4 = CFSTR("RASTER_SATELLITE_POLAR");
          break;
        case 0x5C:
          v4 = CFSTR("VMAP4_ELEVATION");
          break;
        case 0x5D:
          v4 = CFSTR("VMAP4_ELEVATION_POLAR");
          break;
        case 0x5E:
          v4 = CFSTR("CELLULAR_COVERAGE_PLMN");
          break;
        case 0x5F:
          v4 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
          break;
        case 0x60:
          v4 = CFSTR("UNUSED_96");
          break;
        case 0x61:
          v4 = CFSTR("UNUSED_97");
          break;
        case 0x62:
          v4 = CFSTR("UNUSED_98");
          break;
        case 0x63:
          v4 = CFSTR("UNUSED_99");
          break;
        case 0x64:
          v4 = CFSTR("UNUSED_100");
          break;
        case 0x65:
          v4 = CFSTR("UNUSED_101");
          break;
        case 0x66:
          v4 = CFSTR("UNUSED_102");
          break;
        case 0x67:
          v4 = CFSTR("UNUSED_103");
          break;
        case 0x68:
          v4 = CFSTR("UNUSED_104");
          break;
        case 0x69:
          v4 = CFSTR("UNUSED_105");
          break;
        case 0x6A:
          v4 = CFSTR("UNUSED_106");
          break;
        case 0x6B:
          v4 = CFSTR("UNUSED_107");
          break;
        case 0x6C:
          v4 = CFSTR("UNUSED_108");
          break;
        case 0x6D:
          v4 = CFSTR("UNUSED_109");
          break;
        case 0x6E:
          v4 = CFSTR("UNUSED_110");
          break;
        case 0x6F:
          v4 = CFSTR("UNUSED_111");
          break;
        case 0x70:
          v4 = CFSTR("UNUSED_112");
          break;
        case 0x71:
          v4 = CFSTR("UNUSED_113");
          break;
        case 0x72:
          v4 = CFSTR("UNUSED_114");
          break;
        case 0x73:
          v4 = CFSTR("UNUSED_115");
          break;
        case 0x74:
          v4 = CFSTR("UNUSED_116");
          break;
        case 0x75:
          v4 = CFSTR("UNUSED_117");
          break;
        case 0x76:
          v4 = CFSTR("UNUSED_118");
          break;
        case 0x77:
          v4 = CFSTR("UNUSED_119");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 12));
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("style"));

      v3 = *(_BYTE *)(a1 + 16);
    }
    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 8));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("count"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOTileSetUsage)initWithDictionary:(id)a3
{
  return (GEOTileSetUsage *)-[GEOTileSetUsage _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if (!a1)
    goto LABEL_242;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_242;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
    {
      v6 = 11;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
    {
      v6 = 12;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
    {
      v6 = 13;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
    {
      v6 = 14;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
    {
      v6 = 15;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
    {
      v6 = 16;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
    {
      v6 = 17;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
    {
      v6 = 18;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
    {
      v6 = 19;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
    {
      v6 = 20;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
    {
      v6 = 21;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
    {
      v6 = 22;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
    {
      v6 = 23;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
    {
      v6 = 24;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
    {
      v6 = 25;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
    {
      v6 = 26;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
    {
      v6 = 27;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
    {
      v6 = 28;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
    {
      v6 = 29;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
    {
      v6 = 30;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
    {
      v6 = 31;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
    {
      v6 = 32;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
    {
      v6 = 33;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
    {
      v6 = 34;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
    {
      v6 = 35;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
    {
      v6 = 36;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
    {
      v6 = 37;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
    {
      v6 = 38;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
    {
      v6 = 39;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
    {
      v6 = 40;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
    {
      v6 = 41;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
    {
      v6 = 42;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
    {
      v6 = 43;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
    {
      v6 = 44;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
    {
      v6 = 45;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
    {
      v6 = 46;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
    {
      v6 = 47;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
    {
      v6 = 48;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
    {
      v6 = 52;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
    {
      v6 = 53;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
    {
      v6 = 54;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
    {
      v6 = 55;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
    {
      v6 = 56;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
    {
      v6 = 57;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
    {
      v6 = 58;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
    {
      v6 = 59;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
    {
      v6 = 60;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
    {
      v6 = 61;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
    {
      v6 = 62;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
    {
      v6 = 63;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
    {
      v6 = 64;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
    {
      v6 = 65;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
    {
      v6 = 66;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
    {
      v6 = 67;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
    {
      v6 = 68;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
    {
      v6 = 69;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
    {
      v6 = 70;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
    {
      v6 = 71;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
    {
      v6 = 72;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
    {
      v6 = 73;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
    {
      v6 = 74;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
    {
      v6 = 75;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
    {
      v6 = 76;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
    {
      v6 = 77;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
    {
      v6 = 78;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
    {
      v6 = 79;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
    {
      v6 = 80;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
    {
      v6 = 81;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
    {
      v6 = 82;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
    {
      v6 = 83;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
    {
      v6 = 84;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
    {
      v6 = 85;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
    {
      v6 = 86;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
    {
      v6 = 87;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
    {
      v6 = 88;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
    {
      v6 = 89;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
    {
      v6 = 90;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
    {
      v6 = 91;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
    {
      v6 = 92;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
    {
      v6 = 93;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
    {
      v6 = 94;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
    {
      v6 = 95;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
    {
      v6 = 96;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
    {
      v6 = 97;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
    {
      v6 = 98;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
    {
      v6 = 99;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
    {
      v6 = 100;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
    {
      v6 = 101;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
    {
      v6 = 102;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
    {
      v6 = 103;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
    {
      v6 = 104;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
    {
      v6 = 105;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
    {
      v6 = 106;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
    {
      v6 = 107;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
    {
      v6 = 108;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
    {
      v6 = 109;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
    {
      v6 = 110;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
    {
      v6 = 111;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
    {
      v6 = 112;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
    {
      v6 = 113;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
    {
      v6 = 114;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
    {
      v6 = 115;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
    {
      v6 = 116;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
    {
      v6 = 117;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
    {
      v6 = 118;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("UNUSED_119")))
    {
      v6 = 119;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_238;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_238:
    objc_msgSend(a1, "setStyle:", v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCount:", objc_msgSend(v7, "unsignedIntValue"));

LABEL_242:
  return a1;
}

- (GEOTileSetUsage)initWithJSON:(id)a3
{
  return (GEOTileSetUsage *)-[GEOTileSetUsage _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTileSetUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTileSetUsageReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOTileSetUsage readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_style;
    *((_BYTE *)v5 + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[2] = self->_count;
    *((_BYTE *)v5 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_style;
    *((_BYTE *)result + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_count;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOTileSetUsage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_style != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_count != *((_DWORD *)v4 + 2))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOTileSetUsage readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_style;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_count;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_style = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 1) != 0)
  {
    self->_count = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
