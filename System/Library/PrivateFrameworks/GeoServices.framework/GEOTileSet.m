@implementation GEOTileSet

- (GEOTileSet)init
{
  GEOTileSet *v2;
  GEOTileSet *v3;
  GEOTileSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTileSet;
  v2 = -[GEOTileSet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileSet)initWithData:(id)a3
{
  GEOTileSet *v3;
  GEOTileSet *v4;
  GEOTileSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTileSet;
  v3 = -[GEOTileSet initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 129) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaseURL_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasBaseURL
{
  -[GEOTileSet _readBaseURL]((uint64_t)self);
  return self->_baseURL != 0;
}

- (NSString)baseURL
{
  -[GEOTileSet _readBaseURL]((uint64_t)self);
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void)_readMultiTileURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 129) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMultiTileURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMultiTileURL
{
  -[GEOTileSet _readMultiTileURL]((uint64_t)self);
  return self->_multiTileURL != 0;
}

- (NSString)multiTileURL
{
  -[GEOTileSet _readMultiTileURL]((uint64_t)self);
  return self->_multiTileURL;
}

- (void)setMultiTileURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_multiTileURL, a3);
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_style = a3;
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

- (void)_readValidVersions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 129) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValidVersions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)validVersions
{
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  return self->_validVersions;
}

- (void)setValidVersions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *validVersions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  validVersions = self->_validVersions;
  self->_validVersions = v4;

}

- (void)clearValidVersions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_validVersions, "removeAllObjects");
}

- (void)addValidVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  -[GEOTileSet _addNoFlagsValidVersion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsValidVersion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)validVersionsCount
{
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  return -[NSMutableArray count](self->_validVersions, "count");
}

- (id)validVersionAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_validVersions, "objectAtIndex:", a3);
}

+ (Class)validVersionType
{
  return (Class)objc_opt_class();
}

- (int)scale
{
  return self->_scale;
}

- (void)setScale:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_scale = a3;
}

- (id)scaleAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C20EE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScale:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NODPI")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LODPI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIDPI")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)size
{
  return self->_size;
}

- (void)setSize:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_size = a3;
}

- (id)sizeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C20F00[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSize:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX128")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX256")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PX512")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLocalizationURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 129) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizationURL_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLocalizationURL
{
  -[GEOTileSet _readLocalizationURL]((uint64_t)self);
  return self->_localizationURL != 0;
}

- (NSString)localizationURL
{
  -[GEOTileSet _readLocalizationURL]((uint64_t)self);
  return self->_localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_localizationURL, a3);
}

- (void)_readSupportedLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 129) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedLanguages_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)supportedLanguages
{
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  return self->_supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *supportedLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  supportedLanguages = self->_supportedLanguages;
  self->_supportedLanguages = v4;

}

- (void)clearSupportedLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_supportedLanguages, "removeAllObjects");
}

- (void)addSupportedLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  -[GEOTileSet _addNoFlagsSupportedLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)supportedLanguagesCount
{
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_supportedLanguages, "count");
}

- (id)supportedLanguageAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedLanguages, "objectAtIndex:", a3);
}

+ (Class)supportedLanguageType
{
  return (Class)objc_opt_class();
}

- (BOOL)multiTileURLUsesStatusCodes
{
  return self->_multiTileURLUsesStatusCodes;
}

- (void)setMultiTileURLUsesStatusCodes:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_multiTileURLUsesStatusCodes = a3;
}

- (void)setHasMultiTileURLUsesStatusCodes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65568;
  else
    v3 = 0x10000;
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasMultiTileURLUsesStatusCodes
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (int)updateBehavior
{
  os_unfair_lock_s *p_readerLock;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_updateBehavior;
  else
    return 1;
}

- (void)setUpdateBehavior:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_updateBehavior = a3;
}

- (void)setHasUpdateBehavior:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65552;
  else
    v3 = 0x10000;
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasUpdateBehavior
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)updateBehaviorAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH");
  if (a3 == 1)
  {
    v3 = CFSTR("TILE_UPDATE_BEHAVIOR_ETAG");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsUpdateBehavior:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_ETAG"));

  return v4;
}

- (void)_readCountryRegionAllowlists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 129) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryRegionAllowlists_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)countryRegionAllowlists
{
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  return self->_countryRegionAllowlists;
}

- (void)setCountryRegionAllowlists:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *countryRegionAllowlists;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  countryRegionAllowlists = self->_countryRegionAllowlists;
  self->_countryRegionAllowlists = v4;

}

- (void)clearCountryRegionAllowlists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_countryRegionAllowlists, "removeAllObjects");
}

- (void)addCountryRegionAllowlist:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  -[GEOTileSet _addNoFlagsCountryRegionAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsCountryRegionAllowlist:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)countryRegionAllowlistsCount
{
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  return -[NSMutableArray count](self->_countryRegionAllowlists, "count");
}

- (id)countryRegionAllowlistAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_countryRegionAllowlists, "objectAtIndex:", a3);
}

+ (Class)countryRegionAllowlistType
{
  return (Class)objc_opt_class();
}

- (int)checksumType
{
  os_unfair_lock_s *p_readerLock;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_checksumType;
  else
    return 0;
}

- (void)setChecksumType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_checksumType = a3;
}

- (void)setHasChecksumType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65538;
  else
    v3 = 0x10000;
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasChecksumType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)checksumTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("CHECKSUM_TYPE_NONE");
  if (a3 == 1)
  {
    v3 = CFSTR("CHECKSUM_TYPE_APPENDED_MD5");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsChecksumType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHECKSUM_TYPE_NONE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CHECKSUM_TYPE_APPENDED_MD5"));

  return v4;
}

- (unsigned)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_dataSet = a3;
}

- (void)setHasDataSet:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65540;
  else
    v3 = 0x10000;
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataSet
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)requestStyle
{
  os_unfair_lock_s *p_readerLock;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_requestStyle;
  else
    return 0;
}

- (void)setRequestStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_requestStyle = a3;
}

- (void)setHasRequestStyle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65544;
  else
    v3 = 0x10000;
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRequestStyle
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)requestStyleAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("REQUEST_STYLE_LEGACY");
  if (a3 == 1)
  {
    v3 = CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRequestStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_STYLE_LEGACY")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"));

  return v4;
}

- (BOOL)useAuthProxy
{
  os_unfair_lock_s *p_readerLock;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 0x80) != 0 && self->_useAuthProxy;
}

- (void)setUseAuthProxy:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_useAuthProxy = a3;
}

- (void)setHasUseAuthProxy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65664;
  else
    v3 = 0x10000;
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasUseAuthProxy
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)supportsMultipathTCP
{
  os_unfair_lock_s *p_readerLock;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 0x40) != 0 && self->_supportsMultipathTCP;
}

- (void)setSupportsMultipathTCP:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_supportsMultipathTCP = a3;
}

- (void)setHasSupportsMultipathTCP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65600;
  else
    v3 = 0x10000;
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasSupportsMultipathTCP
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (unsigned)alternativeMultipathTCPPort
{
  return self->_alternativeMultipathTCPPort;
}

- (void)setAlternativeMultipathTCPPort:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_alternativeMultipathTCPPort = a3;
}

- (void)setHasAlternativeMultipathTCPPort:(BOOL)a3
{
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasAlternativeMultipathTCPPort
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readDeviceSKUAllowlists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 129) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSKUAllowlists_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)deviceSKUAllowlists
{
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  return self->_deviceSKUAllowlists;
}

- (void)setDeviceSKUAllowlists:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceSKUAllowlists;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  self->_deviceSKUAllowlists = v4;

}

- (void)clearDeviceSKUAllowlists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_deviceSKUAllowlists, "removeAllObjects");
}

- (void)addDeviceSKUAllowlist:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  -[GEOTileSet _addNoFlagsDeviceSKUAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsDeviceSKUAllowlist:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)deviceSKUAllowlistsCount
{
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceSKUAllowlists, "count");
}

- (id)deviceSKUAllowlistAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceSKUAllowlists, "objectAtIndex:", a3);
}

+ (Class)deviceSKUAllowlistType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOTileSet;
  -[GEOTileSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTileSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  int v29;
  void *v30;
  int v31;
  __CFString *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  id v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  int v53;
  __CFString *v54;
  void *v55;
  int v56;
  __CFString *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("baseURL"));

  objc_msgSend((id)a1, "multiTileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("multiTileURL"));

  v7 = CFSTR("RASTER_STANDARD");
  switch(*(_DWORD *)(a1 + 116))
  {
    case 0:
      break;
    case 1:
      v7 = CFSTR("VECTOR_STANDARD");
      break;
    case 2:
      v7 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
      break;
    case 3:
      v7 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
      break;
    case 4:
      v7 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
      break;
    case 5:
      v7 = CFSTR("RASTER_STANDARD_BACKGROUND");
      break;
    case 6:
      v7 = CFSTR("RASTER_HYBRID");
      break;
    case 7:
      v7 = CFSTR("RASTER_SATELLITE");
      break;
    case 8:
      v7 = CFSTR("RASTER_TERRAIN");
      break;
    case 0xB:
      v7 = CFSTR("VECTOR_BUILDINGS");
      break;
    case 0xC:
      v7 = CFSTR("VECTOR_TRAFFIC");
      break;
    case 0xD:
      v7 = CFSTR("VECTOR_POI");
      break;
    case 0xE:
      v7 = CFSTR("SPUTNIK_METADATA");
      break;
    case 0xF:
      v7 = CFSTR("SPUTNIK_C3M");
      break;
    case 0x10:
      v7 = CFSTR("SPUTNIK_DSM");
      break;
    case 0x11:
      v7 = CFSTR("SPUTNIK_DSM_GLOBAL");
      break;
    case 0x12:
      v7 = CFSTR("VECTOR_REALISTIC");
      break;
    case 0x13:
      v7 = CFSTR("VECTOR_LEGACY_REALISTIC");
      break;
    case 0x14:
      v7 = CFSTR("VECTOR_ROADS");
      break;
    case 0x15:
      v7 = CFSTR("RASTER_VEGETATION");
      break;
    case 0x16:
      v7 = CFSTR("VECTOR_TRAFFIC_SKELETON");
      break;
    case 0x17:
      v7 = CFSTR("RASTER_COASTLINE_MASK");
      break;
    case 0x18:
      v7 = CFSTR("RASTER_HILLSHADE");
      break;
    case 0x19:
      v7 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
      break;
    case 0x1A:
      v7 = CFSTR("VECTOR_TRAFFIC_STATIC");
      break;
    case 0x1B:
      v7 = CFSTR("RASTER_COASTLINE_DROP_MASK");
      break;
    case 0x1C:
      v7 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
      break;
    case 0x1D:
      v7 = CFSTR("VECTOR_SPEED_PROFILES");
      break;
    case 0x1E:
      v7 = CFSTR("VECTOR_VENUES");
      break;
    case 0x1F:
      v7 = CFSTR("RASTER_DOWN_SAMPLED");
      break;
    case 0x20:
      v7 = CFSTR("RASTER_COLOR_BALANCED");
      break;
    case 0x21:
      v7 = CFSTR("RASTER_SATELLITE_NIGHT");
      break;
    case 0x22:
      v7 = CFSTR("SPUTNIK_VECTOR_BORDER");
      break;
    case 0x23:
      v7 = CFSTR("RASTER_SATELLITE_DIGITIZE");
      break;
    case 0x24:
      v7 = CFSTR("RASTER_HILLSHADE_PARKS");
      break;
    case 0x25:
      v7 = CFSTR("VECTOR_TRANSIT");
      break;
    case 0x26:
      v7 = CFSTR("RASTER_STANDARD_BASE");
      break;
    case 0x27:
      v7 = CFSTR("RASTER_STANDARD_LABELS");
      break;
    case 0x28:
      v7 = CFSTR("RASTER_HYBRID_ROADS");
      break;
    case 0x29:
      v7 = CFSTR("RASTER_HYBRID_LABELS");
      break;
    case 0x2A:
      v7 = CFSTR("FLYOVER_C3M_MESH");
      break;
    case 0x2B:
      v7 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
      break;
    case 0x2C:
      v7 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
      break;
    case 0x2D:
      v7 = CFSTR("RASTER_SATELLITE_ASTC");
      break;
    case 0x2E:
      v7 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
      break;
    case 0x2F:
      v7 = CFSTR("VECTOR_TRANSIT_SELECTION");
      break;
    case 0x30:
      v7 = CFSTR("VECTOR_COVERAGE");
      break;
    case 0x34:
      v7 = CFSTR("FLYOVER_METADATA");
      break;
    case 0x35:
      v7 = CFSTR("VECTOR_ROAD_NETWORK");
      break;
    case 0x36:
      v7 = CFSTR("VECTOR_LAND_COVER");
      break;
    case 0x37:
      v7 = CFSTR("VECTOR_DEBUG");
      break;
    case 0x38:
      v7 = CFSTR("VECTOR_STREET_POI");
      break;
    case 0x39:
      v7 = CFSTR("MUNIN_METADATA");
      break;
    case 0x3A:
      v7 = CFSTR("VECTOR_SPR_MERCATOR");
      break;
    case 0x3B:
      v7 = CFSTR("VECTOR_SPR_MODELS");
      break;
    case 0x3C:
      v7 = CFSTR("VECTOR_SPR_MATERIALS");
      break;
    case 0x3D:
      v7 = CFSTR("VECTOR_SPR_METADATA");
      break;
    case 0x3E:
      v7 = CFSTR("VECTOR_TRACKS");
      break;
    case 0x3F:
      v7 = CFSTR("VECTOR_RESERVED_2");
      break;
    case 0x40:
      v7 = CFSTR("VECTOR_STREET_LANDMARKS");
      break;
    case 0x41:
      v7 = CFSTR("COARSE_LOCATION_POLYGONS");
      break;
    case 0x42:
      v7 = CFSTR("VECTOR_SPR_ROADS");
      break;
    case 0x43:
      v7 = CFSTR("VECTOR_SPR_STANDARD");
      break;
    case 0x44:
      v7 = CFSTR("VECTOR_POI_V2");
      break;
    case 0x45:
      v7 = CFSTR("VECTOR_POLYGON_SELECTION");
      break;
    case 0x46:
      v7 = CFSTR("VL_METADATA");
      break;
    case 0x47:
      v7 = CFSTR("VL_DATA");
      break;
    case 0x48:
      v7 = CFSTR("PROACTIVE_APP_CLIP");
      break;
    case 0x49:
      v7 = CFSTR("VECTOR_BUILDINGS_V2");
      break;
    case 0x4A:
      v7 = CFSTR("POI_BUSYNESS");
      break;
    case 0x4B:
      v7 = CFSTR("POI_DP_BUSYNESS");
      break;
    case 0x4C:
      v7 = CFSTR("SMART_INTERFACE_SELECTION");
      break;
    case 0x4D:
      v7 = CFSTR("VECTOR_ASSETS");
      break;
    case 0x4E:
      v7 = CFSTR("SPR_ASSET_METADATA");
      break;
    case 0x4F:
      v7 = CFSTR("VECTOR_SPR_POLAR");
      break;
    case 0x50:
      v7 = CFSTR("SMART_DATA_MODE");
      break;
    case 0x51:
      v7 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
      break;
    case 0x52:
      v7 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
      break;
    case 0x53:
      v7 = CFSTR("VECTOR_TOPOGRAPHIC");
      break;
    case 0x54:
      v7 = CFSTR("VECTOR_POI_V2_UPDATE");
      break;
    case 0x55:
      v7 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
      break;
    case 0x56:
      v7 = CFSTR("VECTOR_TRAFFIC_V2");
      break;
    case 0x57:
      v7 = CFSTR("VECTOR_ROAD_SELECTION");
      break;
    case 0x58:
      v7 = CFSTR("VECTOR_REGION_METADATA");
      break;
    case 0x59:
      v7 = CFSTR("RAY_TRACING");
      break;
    case 0x5A:
      v7 = CFSTR("VECTOR_CONTOURS");
      break;
    case 0x5B:
      v7 = CFSTR("RASTER_SATELLITE_POLAR");
      break;
    case 0x5C:
      v7 = CFSTR("VMAP4_ELEVATION");
      break;
    case 0x5D:
      v7 = CFSTR("VMAP4_ELEVATION_POLAR");
      break;
    case 0x5E:
      v7 = CFSTR("CELLULAR_COVERAGE_PLMN");
      break;
    case 0x5F:
      v7 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
      break;
    case 0x60:
      v7 = CFSTR("UNUSED_96");
      break;
    case 0x61:
      v7 = CFSTR("UNUSED_97");
      break;
    case 0x62:
      v7 = CFSTR("UNUSED_98");
      break;
    case 0x63:
      v7 = CFSTR("UNUSED_99");
      break;
    case 0x64:
      v7 = CFSTR("UNUSED_100");
      break;
    case 0x65:
      v7 = CFSTR("UNUSED_101");
      break;
    case 0x66:
      v7 = CFSTR("UNUSED_102");
      break;
    case 0x67:
      v7 = CFSTR("UNUSED_103");
      break;
    case 0x68:
      v7 = CFSTR("UNUSED_104");
      break;
    case 0x69:
      v7 = CFSTR("UNUSED_105");
      break;
    case 0x6A:
      v7 = CFSTR("UNUSED_106");
      break;
    case 0x6B:
      v7 = CFSTR("UNUSED_107");
      break;
    case 0x6C:
      v7 = CFSTR("UNUSED_108");
      break;
    case 0x6D:
      v7 = CFSTR("UNUSED_109");
      break;
    case 0x6E:
      v7 = CFSTR("UNUSED_110");
      break;
    case 0x6F:
      v7 = CFSTR("UNUSED_111");
      break;
    case 0x70:
      v7 = CFSTR("UNUSED_112");
      break;
    case 0x71:
      v7 = CFSTR("UNUSED_113");
      break;
    case 0x72:
      v7 = CFSTR("UNUSED_114");
      break;
    case 0x73:
      v7 = CFSTR("UNUSED_115");
      break;
    case 0x74:
      v7 = CFSTR("UNUSED_116");
      break;
    case 0x75:
      v7 = CFSTR("UNUSED_117");
      break;
    case 0x76:
      v7 = CFSTR("UNUSED_118");
      break;
    case 0x77:
      v7 = CFSTR("UNUSED_119");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 116));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("style"));

  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v9 = *(id *)(a1 + 72);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v71 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("validVersion"));
  }
  v16 = *(int *)(a1 + 108);
  if (v16 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 108));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E1C20EE8[v16];
  }
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("scale"));

  v18 = *(int *)(a1 + 112);
  if (v18 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 112));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E1C20F00[v18];
  }
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("size"));

  objc_msgSend((id)a1, "localizationURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("localizationURL"));

  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v22 = *(id *)(a1 + 64);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v67 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "addObject:", v28);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v24);
    }

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("supportedLanguage"));
  }
  v29 = *(_DWORD *)(a1 + 128);
  if ((v29 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 124));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("multiTileURLUsesStatusCodes"));

    v29 = *(_DWORD *)(a1 + 128);
  }
  if ((v29 & 0x10) != 0)
  {
    v31 = *(_DWORD *)(a1 + 120);
    if (v31)
    {
      if (v31 == 1)
      {
        v32 = CFSTR("TILE_UPDATE_BEHAVIOR_ETAG");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 120));
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v32 = CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH");
    }
    if (a2)
      v33 = CFSTR("updateBehavior");
    else
      v33 = CFSTR("update_behavior");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v35 = *(id *)(a1 + 32);
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v63;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v63 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v40, "jsonRepresentation");
          else
            objc_msgSend(v40, "dictionaryRepresentation");
          v41 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "addObject:", v41);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("countryRegionWhitelist"));
  }
  v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 2) != 0)
  {
    v53 = *(_DWORD *)(a1 + 96);
    if (v53)
    {
      if (v53 == 1)
      {
        v54 = CFSTR("CHECKSUM_TYPE_APPENDED_MD5");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 96));
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v54 = CFSTR("CHECKSUM_TYPE_NONE");
    }
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("checksumType"));

    v42 = *(_DWORD *)(a1 + 128);
    if ((v42 & 4) == 0)
    {
LABEL_180:
      if ((v42 & 8) == 0)
        goto LABEL_181;
      goto LABEL_199;
    }
  }
  else if ((v42 & 4) == 0)
  {
    goto LABEL_180;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("dataSet"));

  v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 8) == 0)
  {
LABEL_181:
    if ((v42 & 0x80) == 0)
      goto LABEL_182;
    goto LABEL_205;
  }
LABEL_199:
  v56 = *(_DWORD *)(a1 + 104);
  if (v56)
  {
    if (v56 == 1)
    {
      v57 = CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 104));
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v57 = CFSTR("REQUEST_STYLE_LEGACY");
  }
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("requestStyle"));

  v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 0x80) == 0)
  {
LABEL_182:
    if ((v42 & 0x40) == 0)
      goto LABEL_183;
LABEL_206:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 125));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("supportsMultipathTCP"));

    if ((*(_DWORD *)(a1 + 128) & 1) == 0)
      goto LABEL_185;
    goto LABEL_184;
  }
LABEL_205:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 126));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("useAuthProxy"));

  v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 0x40) != 0)
    goto LABEL_206;
LABEL_183:
  if ((v42 & 1) != 0)
  {
LABEL_184:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("alternativeMultipathTCPPort"));

  }
LABEL_185:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)a1, "deviceSKUAllowlists");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("deviceSKUWhitelist"));

  }
  v45 = *(void **)(a1 + 16);
  if (v45)
  {
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __40__GEOTileSet__dictionaryRepresentation___block_invoke;
      v60[3] = &unk_1E1C00600;
      v49 = v48;
      v61 = v49;
      objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v60);
      v50 = v49;

      v47 = v50;
    }
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("Unknown Fields"));

  }
  v51 = v4;

  return v51;
}

- (id)jsonRepresentation
{
  return -[GEOTileSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOTileSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTileSet)initWithDictionary:(id)a3
{
  return (GEOTileSet *)-[GEOTileSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  GEOTileSetVersion *v21;
  GEOTileSetVersion *v22;
  id v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  id v46;
  void *v47;
  id v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  unint64_t *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  uint64_t v74;
  GEOLanguage *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t m;
  uint64_t v89;
  GEOCountryRegionTuple *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t n;
  void *v109;
  void *v110;
  void *v112;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  int v119;
  void *v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  __int128 v150;
  uint64_t v151;
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v113 = a2;
  if (!a1)
    goto LABEL_413;
  v5 = (id)objc_msgSend(a1, "init");

  if (!v5)
  {
    a1 = 0;
    goto LABEL_413;
  }
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("baseURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setBaseURL:", v7);

  }
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("multiTileURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v5, "setMultiTileURL:", v9);

  }
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("style"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v120 = v5;
  v119 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
    {
      v12 = 5;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
    {
      v12 = 6;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
    {
      v12 = 7;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
    {
      v12 = 8;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
    {
      v12 = 11;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
    {
      v12 = 12;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
    {
      v12 = 13;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
    {
      v12 = 14;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
    {
      v12 = 15;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
    {
      v12 = 16;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
    {
      v12 = 17;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
    {
      v12 = 18;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
    {
      v12 = 19;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
    {
      v12 = 20;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
    {
      v12 = 21;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
    {
      v12 = 22;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
    {
      v12 = 23;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
    {
      v12 = 24;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
    {
      v12 = 25;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
    {
      v12 = 26;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
    {
      v12 = 27;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
    {
      v12 = 28;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
    {
      v12 = 29;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
    {
      v12 = 30;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
    {
      v12 = 31;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
    {
      v12 = 32;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
    {
      v12 = 33;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
    {
      v12 = 34;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
    {
      v12 = 35;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
    {
      v12 = 36;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
    {
      v12 = 37;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
    {
      v12 = 38;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
    {
      v12 = 39;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
    {
      v12 = 40;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
    {
      v12 = 41;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
    {
      v12 = 42;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
    {
      v12 = 43;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
    {
      v12 = 44;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
    {
      v12 = 45;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
    {
      v12 = 46;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
    {
      v12 = 47;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
    {
      v12 = 48;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
    {
      v12 = 52;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
    {
      v12 = 53;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
    {
      v12 = 54;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
    {
      v12 = 55;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
    {
      v12 = 56;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
    {
      v12 = 57;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
    {
      v12 = 58;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
    {
      v12 = 59;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
    {
      v12 = 60;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
    {
      v12 = 61;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
    {
      v12 = 62;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
    {
      v12 = 63;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
    {
      v12 = 64;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
    {
      v12 = 65;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
    {
      v12 = 66;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
    {
      v12 = 67;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
    {
      v12 = 68;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
    {
      v12 = 69;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
    {
      v12 = 70;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
    {
      v12 = 71;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
    {
      v12 = 72;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
    {
      v12 = 73;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
    {
      v12 = 74;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
    {
      v12 = 75;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
    {
      v12 = 76;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
    {
      v12 = 77;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
    {
      v12 = 78;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
    {
      v12 = 79;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
    {
      v12 = 80;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
    {
      v12 = 81;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
    {
      v12 = 82;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
    {
      v12 = 83;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
    {
      v12 = 84;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
    {
      v12 = 85;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
    {
      v12 = 86;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
    {
      v12 = 87;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
    {
      v12 = 88;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
    {
      v12 = 89;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
    {
      v12 = 90;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
    {
      v12 = 91;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
    {
      v12 = 92;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
    {
      v12 = 93;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
    {
      v12 = 94;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
    {
      v12 = 95;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
    {
      v12 = 96;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
    {
      v12 = 97;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
    {
      v12 = 98;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
    {
      v12 = 99;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
    {
      v12 = 100;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
    {
      v12 = 101;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
    {
      v12 = 102;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
    {
      v12 = 103;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
    {
      v12 = 104;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
    {
      v12 = 105;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
    {
      v12 = 106;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
    {
      v12 = 107;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
    {
      v12 = 108;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
    {
      v12 = 109;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
    {
      v12 = 110;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
    {
      v12 = 111;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
    {
      v12 = 112;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
    {
      v12 = 113;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
    {
      v12 = 114;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
    {
      v12 = 115;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
    {
      v12 = 116;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
    {
      v12 = 117;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
    {
      v12 = 118;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("UNUSED_119")))
    {
      v12 = 119;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_244;
    v12 = objc_msgSend(v10, "intValue");
  }
  objc_msgSend(v5, "setStyle:", v12);
LABEL_244:

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("validVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0x1E0C99000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v112 = v13;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v134, v149, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v135;
      v116 = *(_QWORD *)v135;
      v117 = v15;
      do
      {
        v19 = 0;
        v118 = v17;
        do
        {
          if (*(_QWORD *)v135 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = [GEOTileSetVersion alloc];
            if (v21)
            {
              v22 = v21;
              v23 = v20;
              v24 = -[GEOTileSetVersion init](v22, "init");
              if (v24)
              {
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("identifier"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v26 = objc_msgSend(v25, "unsignedIntValue");
                  *(_BYTE *)(v24 + 96) |= 0x20u;
                  *(_DWORD *)(v24 + 84) = v26;
                }

                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("availableTiles"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v121 = v23;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v28 = v14;
                  v29 = v19;
                  v144 = 0u;
                  v145 = 0u;
                  v142 = 0u;
                  v143 = 0u;
                  v30 = v27;
                  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v142, v152, 16);
                  if (v31)
                  {
                    v32 = v31;
                    v33 = *(_QWORD *)v143;
                    do
                    {
                      for (i = 0; i != v32; ++i)
                      {
                        if (*(_QWORD *)v143 != v33)
                          objc_enumerationMutation(v30);
                        v35 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v150 = 0uLL;
                          v151 = 0;
                          _GEOTileSetRegionFromDictionaryRepresentation(v35, &v150);
                          -[GEOTileSetVersion _readAvailableTiles](v24);
                          if (-[GEOTileSetVersion _reserveAvailableTiles:](v24, 1uLL))
                          {
                            v36 = *(_QWORD *)(v24 + 24) + 24 * *(_QWORD *)(v24 + 32);
                            *(_OWORD *)v36 = v150;
                            *(_QWORD *)(v36 + 16) = v151;
                            ++*(_QWORD *)(v24 + 32);
                          }
                          os_unfair_lock_lock_with_options();
                          *(_BYTE *)(v24 + 96) |= 8u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v24 + 80));
                          *(_BYTE *)(v24 + 96) |= 0x20u;
                        }
                      }
                      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v142, v152, 16);
                    }
                    while (v32);
                  }

                  v18 = v116;
                  v19 = v29;
                  v14 = v28;
                  v23 = v121;
                  v15 = v117;
                  v17 = v118;
                }

                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("timeToLiveSeconds"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v38 = objc_msgSend(v37, "unsignedIntValue");
                  *(_BYTE *)(v24 + 96) |= 0x20u;
                  *(_BYTE *)(v24 + 96) |= 2u;
                  *(_DWORD *)(v24 + 92) = v38;
                }

                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("genericTile"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v114 = v39;
                  v115 = v19;
                  v140 = 0u;
                  v141 = 0u;
                  v138 = 0u;
                  v139 = 0u;
                  v40 = v39;
                  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v138, &v150, 16);
                  if (!v41)
                    goto LABEL_299;
                  v42 = v41;
                  v43 = *(_QWORD *)v139;
                  while (1)
                  {
                    for (j = 0; j != v42; ++j)
                    {
                      if (*(_QWORD *)v139 != v43)
                        objc_enumerationMutation(v40);
                      v45 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v46 = v45;
                        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("tileType"));
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v48 = v47;
                          if ((objc_msgSend(v48, "isEqualToString:", CFSTR("WATER")) & 1) != 0)
                          {
                            v49 = 1;
                          }
                          else if (objc_msgSend(v48, "isEqualToString:", CFSTR("NO_TILE")))
                          {
                            v49 = 2;
                          }
                          else
                          {
                            v49 = 1;
                          }

                          v50 = 0x400000000;
LABEL_286:
                          v51 = v50 | v49;
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v49 = objc_msgSend(v47, "intValue");
                            v50 = 0;
                            goto LABEL_286;
                          }
                          v51 = 0;
                        }

                        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("textureIndex"));
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v51 |= 0x200000000uLL;
                          v53 = objc_msgSend(v52, "unsignedIntValue");
                        }
                        else
                        {
                          v53 = 0;
                        }

                        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("resourceIndex"));
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v51 |= 0x100000000uLL;
                          v55 = objc_msgSend(v54, "unsignedIntValue");
                        }
                        else
                        {
                          v55 = 0;
                        }

                        -[GEOTileSetVersion _readGenericTiles](v24);
                        if (-[GEOTileSetVersion _reserveGenericTiles:](v24, 1uLL))
                        {
                          v56 = (unint64_t *)(*(_QWORD *)(v24 + 48) + 16 * *(_QWORD *)(v24 + 56));
                          *v56 = v55 | (unint64_t)(v53 << 32);
                          v56[1] = v51;
                          ++*(_QWORD *)(v24 + 56);
                        }
                        os_unfair_lock_lock_with_options();
                        *(_BYTE *)(v24 + 96) |= 0x10u;
                        os_unfair_lock_unlock((os_unfair_lock_t)(v24 + 80));
                        *(_BYTE *)(v24 + 96) |= 0x20u;
                        continue;
                      }
                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v138, &v150, 16);
                    if (!v42)
                    {
LABEL_299:

                      v14 = 0x1E0C99000uLL;
                      v15 = v117;
                      v17 = v118;
                      v19 = v115;
                      v18 = v116;
                      v23 = v121;
                      v39 = v114;
                      break;
                    }
                  }
                }

                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("supportedLanguagesVersion"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v58 = objc_msgSend(v57, "unsignedIntValue");
                  *(_BYTE *)(v24 + 96) |= 0x20u;
                  *(_BYTE *)(v24 + 96) |= 1u;
                  *(_DWORD *)(v24 + 88) = v58;
                }

              }
            }
            else
            {
              v24 = 0;
            }
            v5 = v120;
            objc_msgSend(v120, "addValidVersion:", v24, v112);

            a3 = v119;
          }
          ++v19;
        }
        while (v19 != v17);
        v59 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v134, v149, 16);
        v17 = v59;
      }
      while (v59);
    }

    v13 = v112;
  }

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("scale"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = v60;
    if ((objc_msgSend(v61, "isEqualToString:", CFSTR("NODPI")) & 1) != 0)
    {
      v62 = 0;
    }
    else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("LODPI")) & 1) != 0)
    {
      v62 = 1;
    }
    else if (objc_msgSend(v61, "isEqualToString:", CFSTR("HIDPI")))
    {
      v62 = 2;
    }
    else
    {
      v62 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_322;
    v62 = objc_msgSend(v60, "intValue");
  }
  objc_msgSend(v5, "setScale:", v62, v112);
LABEL_322:

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("size"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = v63;
    if ((objc_msgSend(v64, "isEqualToString:", CFSTR("PX128")) & 1) != 0)
    {
      v65 = 0;
    }
    else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("PX256")) & 1) != 0)
    {
      v65 = 1;
    }
    else if (objc_msgSend(v64, "isEqualToString:", CFSTR("PX512")))
    {
      v65 = 2;
    }
    else
    {
      v65 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_334;
    v65 = objc_msgSend(v63, "intValue");
  }
  objc_msgSend(v5, "setSize:", v65, v112);
LABEL_334:

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("localizationURL"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = (void *)objc_msgSend(v66, "copy");
    objc_msgSend(v5, "setLocalizationURL:", v67);

  }
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("supportedLanguage"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v69 = v68;
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v130, v148, 16);
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v131;
      do
      {
        for (k = 0; k != v71; ++k)
        {
          if (*(_QWORD *)v131 != v72)
            objc_enumerationMutation(v69);
          v74 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v75 = [GEOLanguage alloc];
            if ((a3 & 1) != 0)
              v76 = -[GEOLanguage initWithJSON:](v75, "initWithJSON:", v74);
            else
              v76 = -[GEOLanguage initWithDictionary:](v75, "initWithDictionary:", v74);
            v77 = (void *)v76;
            objc_msgSend(v5, "addSupportedLanguage:", v76, v112);

          }
        }
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v130, v148, 16);
      }
      while (v71);
    }

  }
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("multiTileURLUsesStatusCodes"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setMultiTileURLUsesStatusCodes:", objc_msgSend(v78, "BOOLValue"));

  if (a3)
    v79 = CFSTR("updateBehavior");
  else
    v79 = CFSTR("update_behavior");
  objc_msgSend(v113, "objectForKeyedSubscript:", v79, v112);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = v80;
    if ((objc_msgSend(v81, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH")) & 1) != 0)
      v82 = 0;
    else
      v82 = objc_msgSend(v81, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_ETAG"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_363;
    v82 = objc_msgSend(v80, "intValue");
  }
  objc_msgSend(v5, "setUpdateBehavior:", v82);
LABEL_363:

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("countryRegionWhitelist"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v84 = v83;
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v126, v147, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v127;
      do
      {
        for (m = 0; m != v86; ++m)
        {
          if (*(_QWORD *)v127 != v87)
            objc_enumerationMutation(v84);
          v89 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v90 = [GEOCountryRegionTuple alloc];
            if ((a3 & 1) != 0)
              v91 = -[GEOCountryRegionTuple initWithJSON:](v90, "initWithJSON:", v89);
            else
              v91 = -[GEOCountryRegionTuple initWithDictionary:](v90, "initWithDictionary:", v89);
            v92 = (void *)v91;
            objc_msgSend(v5, "addCountryRegionAllowlist:", v91);

          }
        }
        v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v126, v147, 16);
      }
      while (v86);
    }

  }
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("checksumType"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = v93;
    if ((objc_msgSend(v94, "isEqualToString:", CFSTR("CHECKSUM_TYPE_NONE")) & 1) != 0)
      v95 = 0;
    else
      v95 = objc_msgSend(v94, "isEqualToString:", CFSTR("CHECKSUM_TYPE_APPENDED_MD5"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_385;
    v95 = objc_msgSend(v93, "intValue");
  }
  objc_msgSend(v5, "setChecksumType:", v95);
LABEL_385:

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("dataSet"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setDataSet:", objc_msgSend(v96, "unsignedIntValue"));

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("requestStyle"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v98 = v97;
    if ((objc_msgSend(v98, "isEqualToString:", CFSTR("REQUEST_STYLE_LEGACY")) & 1) != 0)
      v99 = 0;
    else
      v99 = objc_msgSend(v98, "isEqualToString:", CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"));

    goto LABEL_394;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = objc_msgSend(v97, "intValue");
LABEL_394:
    objc_msgSend(v5, "setRequestStyle:", v99);
  }

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("useAuthProxy"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setUseAuthProxy:", objc_msgSend(v100, "BOOLValue"));

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("supportsMultipathTCP"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSupportsMultipathTCP:", objc_msgSend(v101, "BOOLValue"));

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("alternativeMultipathTCPPort"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAlternativeMultipathTCPPort:", objc_msgSend(v102, "unsignedIntValue"));

  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("deviceSKUWhitelist"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v104 = v103;
    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v122, v146, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v123;
      do
      {
        for (n = 0; n != v106; ++n)
        {
          if (*(_QWORD *)v123 != v107)
            objc_enumerationMutation(v104);
          v109 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v110 = (void *)objc_msgSend(v109, "copy");
            objc_msgSend(v5, "addDeviceSKUAllowlist:", v110);

          }
        }
        v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v122, v146, 16);
      }
      while (v106);
    }

  }
  a1 = v5;

LABEL_413:
  return a1;
}

- (GEOTileSet)initWithJSON:(id)a3
{
  return (GEOTileSet *)-[GEOTileSet _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_152;
    else
      v8 = (int *)&readAll__nonRecursiveTag_153;
    GEOTileSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTileSetCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTileSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTileSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $C3508E6C0C635A9429EF77D2804AA6E5 v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PBDataReader *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTileSetIsDirty((uint64_t)self) & 1) == 0)
  {
    v24 = self->_reader;
    objc_sync_enter(v24);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v25);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v24);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTileSet readAll:](self, "readAll:", 0);
    if (self->_baseURL)
      PBDataWriterWriteStringField();
    if (self->_multiTileURL)
      PBDataWriterWriteStringField();
    PBDataWriterWriteInt32Field();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v6 = self->_validVersions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v7);
    }

    PBDataWriterWriteInt32Field();
    PBDataWriterWriteInt32Field();
    if (self->_localizationURL)
      PBDataWriterWriteStringField();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = self->_supportedLanguages;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v11);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x10) != 0)
      PBDataWriterWriteInt32Field();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = self->_countryRegionAllowlists;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      }
      while (v16);
    }

    v19 = self->_flags;
    if ((*(_BYTE *)&v19 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 1) != 0)
      PBDataWriterWriteUint32Field();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = self->_deviceSKUAllowlists;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v20);
          PBDataWriterWriteStringField();
          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
      }
      while (v21);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v26);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  $C3508E6C0C635A9429EF77D2804AA6E5 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  id *v22;

  v22 = (id *)a3;
  -[GEOTileSet readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v22 + 1, self->_reader);
  *((_DWORD *)v22 + 20) = self->_readerMarkPos;
  *((_DWORD *)v22 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_baseURL)
    objc_msgSend(v22, "setBaseURL:");
  if (self->_multiTileURL)
    objc_msgSend(v22, "setMultiTileURL:");
  *((_DWORD *)v22 + 29) = self->_style;
  if (-[GEOTileSet validVersionsCount](self, "validVersionsCount"))
  {
    objc_msgSend(v22, "clearValidVersions");
    v4 = -[GEOTileSet validVersionsCount](self, "validVersionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTileSet validVersionAtIndex:](self, "validVersionAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addValidVersion:", v7);

      }
    }
  }
  *((_DWORD *)v22 + 27) = self->_scale;
  *((_DWORD *)v22 + 28) = self->_size;
  if (self->_localizationURL)
    objc_msgSend(v22, "setLocalizationURL:");
  if (-[GEOTileSet supportedLanguagesCount](self, "supportedLanguagesCount"))
  {
    objc_msgSend(v22, "clearSupportedLanguages");
    v8 = -[GEOTileSet supportedLanguagesCount](self, "supportedLanguagesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOTileSet supportedLanguageAtIndex:](self, "supportedLanguageAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSupportedLanguage:", v11);

      }
    }
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *((_BYTE *)v22 + 124) = self->_multiTileURLUsesStatusCodes;
    *((_DWORD *)v22 + 32) |= 0x20u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v22 + 30) = self->_updateBehavior;
    *((_DWORD *)v22 + 32) |= 0x10u;
  }
  if (-[GEOTileSet countryRegionAllowlistsCount](self, "countryRegionAllowlistsCount"))
  {
    objc_msgSend(v22, "clearCountryRegionAllowlists");
    v13 = -[GEOTileSet countryRegionAllowlistsCount](self, "countryRegionAllowlistsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOTileSet countryRegionAllowlistAtIndex:](self, "countryRegionAllowlistAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addCountryRegionAllowlist:", v16);

      }
    }
  }
  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 2) != 0)
  {
    *((_DWORD *)v22 + 24) = self->_checksumType;
    *((_DWORD *)v22 + 32) |= 2u;
    v17 = self->_flags;
    if ((*(_BYTE *)&v17 & 4) == 0)
    {
LABEL_25:
      if ((*(_BYTE *)&v17 & 8) == 0)
        goto LABEL_26;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&v17 & 4) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v22 + 25) = self->_dataSet;
  *((_DWORD *)v22 + 32) |= 4u;
  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 8) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v17 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v22 + 26) = self->_requestStyle;
  *((_DWORD *)v22 + 32) |= 8u;
  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 0x80) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v17 & 0x40) == 0)
      goto LABEL_28;
LABEL_39:
    *((_BYTE *)v22 + 125) = self->_supportsMultipathTCP;
    *((_DWORD *)v22 + 32) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 1) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_38:
  *((_BYTE *)v22 + 126) = self->_useAuthProxy;
  *((_DWORD *)v22 + 32) |= 0x80u;
  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 0x40) != 0)
    goto LABEL_39;
LABEL_28:
  if ((*(_BYTE *)&v17 & 1) != 0)
  {
LABEL_29:
    *((_DWORD *)v22 + 23) = self->_alternativeMultipathTCPPort;
    *((_DWORD *)v22 + 32) |= 1u;
  }
LABEL_30:
  if (-[GEOTileSet deviceSKUAllowlistsCount](self, "deviceSKUAllowlistsCount"))
  {
    objc_msgSend(v22, "clearDeviceSKUAllowlists");
    v18 = -[GEOTileSet deviceSKUAllowlistsCount](self, "deviceSKUAllowlistsCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[GEOTileSet deviceSKUAllowlistAtIndex:](self, "deviceSKUAllowlistAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addDeviceSKUAllowlist:", v21);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  $C3508E6C0C635A9429EF77D2804AA6E5 v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  PBUnknownFields *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTileSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_45;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTileSet readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_baseURL, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_multiTileURL, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  *(_DWORD *)(v5 + 116) = self->_style;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v13 = self->_validVersions;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addValidVersion:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v14);
  }

  *(_DWORD *)(v5 + 108) = self->_scale;
  *(_DWORD *)(v5 + 112) = self->_size;
  v18 = -[NSString copyWithZone:](self->_localizationURL, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v18;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = self->_supportedLanguages;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSupportedLanguage:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v21);
  }

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 124) = self->_multiTileURLUsesStatusCodes;
    *(_DWORD *)(v5 + 128) |= 0x20u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_updateBehavior;
    *(_DWORD *)(v5 + 128) |= 0x10u;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = self->_countryRegionAllowlists;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(v26);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCountryRegionAllowlist:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v27);
  }

  v31 = self->_flags;
  if ((*(_BYTE *)&v31 & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_checksumType;
    *(_DWORD *)(v5 + 128) |= 2u;
    v31 = self->_flags;
    if ((*(_BYTE *)&v31 & 4) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v31 & 8) == 0)
        goto LABEL_33;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&v31 & 4) == 0)
  {
    goto LABEL_32;
  }
  *(_DWORD *)(v5 + 100) = self->_dataSet;
  *(_DWORD *)(v5 + 128) |= 4u;
  v31 = self->_flags;
  if ((*(_BYTE *)&v31 & 8) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v31 & 0x80) == 0)
      goto LABEL_34;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 104) = self->_requestStyle;
  *(_DWORD *)(v5 + 128) |= 8u;
  v31 = self->_flags;
  if ((*(_BYTE *)&v31 & 0x80) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v31 & 0x40) == 0)
      goto LABEL_35;
LABEL_50:
    *(_BYTE *)(v5 + 125) = self->_supportsMultipathTCP;
    *(_DWORD *)(v5 + 128) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 1) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_49:
  *(_BYTE *)(v5 + 126) = self->_useAuthProxy;
  *(_DWORD *)(v5 + 128) |= 0x80u;
  v31 = self->_flags;
  if ((*(_BYTE *)&v31 & 0x40) != 0)
    goto LABEL_50;
LABEL_35:
  if ((*(_BYTE *)&v31 & 1) != 0)
  {
LABEL_36:
    *(_DWORD *)(v5 + 92) = self->_alternativeMultipathTCPPort;
    *(_DWORD *)(v5 + 128) |= 1u;
  }
LABEL_37:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = self->_deviceSKUAllowlists;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v40;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(v32);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend((id)v5, "addDeviceSKUAllowlist:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    }
    while (v33);
  }

  v37 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v37;
LABEL_45:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *baseURL;
  NSString *multiTileURL;
  NSMutableArray *validVersions;
  NSString *localizationURL;
  NSMutableArray *supportedLanguages;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;
  int v11;
  NSMutableArray *countryRegionAllowlists;
  NSMutableArray *deviceSKUAllowlists;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_69;
  -[GEOTileSet readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  baseURL = self->_baseURL;
  if ((unint64_t)baseURL | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](baseURL, "isEqual:"))
      goto LABEL_69;
  }
  multiTileURL = self->_multiTileURL;
  if ((unint64_t)multiTileURL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](multiTileURL, "isEqual:"))
      goto LABEL_69;
  }
  if (self->_style != *((_DWORD *)v4 + 29))
    goto LABEL_69;
  validVersions = self->_validVersions;
  if ((unint64_t)validVersions | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](validVersions, "isEqual:"))
      goto LABEL_69;
  }
  if (self->_scale != *((_DWORD *)v4 + 27))
    goto LABEL_69;
  if (self->_size != *((_DWORD *)v4 + 28))
    goto LABEL_69;
  localizationURL = self->_localizationURL;
  if ((unint64_t)localizationURL | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](localizationURL, "isEqual:"))
      goto LABEL_69;
  }
  supportedLanguages = self->_supportedLanguages;
  if ((unint64_t)supportedLanguages | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](supportedLanguages, "isEqual:"))
      goto LABEL_69;
  }
  flags = self->_flags;
  v11 = *((_DWORD *)v4 + 32);
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0)
      goto LABEL_69;
    if (self->_multiTileURLUsesStatusCodes)
    {
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_69;
    }
    else if (*((_BYTE *)v4 + 124))
    {
      goto LABEL_69;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_updateBehavior != *((_DWORD *)v4 + 30))
      goto LABEL_69;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_69;
  }
  countryRegionAllowlists = self->_countryRegionAllowlists;
  if ((unint64_t)countryRegionAllowlists | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](countryRegionAllowlists, "isEqual:"))
      goto LABEL_69;
    flags = self->_flags;
    v11 = *((_DWORD *)v4 + 32);
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_checksumType != *((_DWORD *)v4 + 24))
      goto LABEL_69;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dataSet != *((_DWORD *)v4 + 25))
      goto LABEL_69;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_requestStyle != *((_DWORD *)v4 + 26))
      goto LABEL_69;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0)
      goto LABEL_69;
    if (self->_useAuthProxy)
    {
      if (!*((_BYTE *)v4 + 126))
        goto LABEL_69;
    }
    else if (*((_BYTE *)v4 + 126))
    {
      goto LABEL_69;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v11 & 0x40) != 0)
    {
      if (self->_supportsMultipathTCP)
      {
        if (!*((_BYTE *)v4 + 125))
          goto LABEL_69;
        goto LABEL_62;
      }
      if (!*((_BYTE *)v4 + 125))
        goto LABEL_62;
    }
LABEL_69:
    v14 = 0;
    goto LABEL_70;
  }
  if ((v11 & 0x40) != 0)
    goto LABEL_69;
LABEL_62:
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_alternativeMultipathTCPPort != *((_DWORD *)v4 + 23))
      goto LABEL_69;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_69;
  }
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  if ((unint64_t)deviceSKUAllowlists | *((_QWORD *)v4 + 5))
    v14 = -[NSMutableArray isEqual:](deviceSKUAllowlists, "isEqual:");
  else
    v14 = 1;
LABEL_70:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t scale;
  uint64_t size;
  NSUInteger v7;
  uint64_t v8;
  $C3508E6C0C635A9429EF77D2804AA6E5 flags;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $C3508E6C0C635A9429EF77D2804AA6E5 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t style;
  NSUInteger v22;
  NSUInteger v23;

  -[GEOTileSet readAll:](self, "readAll:", 1);
  v23 = -[NSString hash](self->_baseURL, "hash");
  v3 = -[NSString hash](self->_multiTileURL, "hash");
  style = self->_style;
  v22 = v3;
  v4 = -[NSMutableArray hash](self->_validVersions, "hash");
  scale = self->_scale;
  size = self->_size;
  v7 = -[NSString hash](self->_localizationURL, "hash");
  v8 = -[NSMutableArray hash](self->_supportedLanguages, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    v10 = 2654435761 * self->_multiTileURLUsesStatusCodes;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
LABEL_3:
      v11 = 2654435761 * self->_updateBehavior;
      goto LABEL_6;
    }
  }
  v11 = 0;
LABEL_6:
  v12 = -[NSMutableArray hash](self->_countryRegionAllowlists, "hash");
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
    v14 = 2654435761 * self->_checksumType;
    if ((*(_BYTE *)&v13 & 4) != 0)
    {
LABEL_8:
      v15 = 2654435761 * self->_dataSet;
      if ((*(_BYTE *)&v13 & 8) != 0)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 4) != 0)
      goto LABEL_8;
  }
  v15 = 0;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
LABEL_9:
    v16 = 2654435761 * self->_requestStyle;
    if ((*(_BYTE *)&v13 & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_15:
  v16 = 0;
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
LABEL_10:
    v17 = 2654435761 * self->_useAuthProxy;
    if ((*(_BYTE *)&v13 & 0x40) != 0)
      goto LABEL_11;
LABEL_17:
    v18 = 0;
    if ((*(_BYTE *)&v13 & 1) != 0)
      goto LABEL_12;
LABEL_18:
    v19 = 0;
    return v22 ^ v23 ^ v4 ^ (2654435761 * style) ^ (2654435761 * scale) ^ (2654435761 * size) ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[NSMutableArray hash](self->_deviceSKUAllowlists, "hash");
  }
LABEL_16:
  v17 = 0;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
    goto LABEL_17;
LABEL_11:
  v18 = 2654435761 * self->_supportsMultipathTCP;
  if ((*(_BYTE *)&v13 & 1) == 0)
    goto LABEL_18;
LABEL_12:
  v19 = 2654435761 * self->_alternativeMultipathTCPPort;
  return v22 ^ v23 ^ v4 ^ (2654435761 * style) ^ (2654435761 * scale) ^ (2654435761 * size) ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[NSMutableArray hash](self->_deviceSKUAllowlists, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEOTileSet setBaseURL:](self, "setBaseURL:");
  if (*((_QWORD *)v4 + 7))
    -[GEOTileSet setMultiTileURL:](self, "setMultiTileURL:");
  self->_style = *((_DWORD *)v4 + 29);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = *((id *)v4 + 9);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        -[GEOTileSet addValidVersion:](self, "addValidVersion:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v7);
  }

  self->_scale = *((_DWORD *)v4 + 27);
  self->_size = *((_DWORD *)v4 + 28);
  if (*((_QWORD *)v4 + 6))
    -[GEOTileSet setLocalizationURL:](self, "setLocalizationURL:");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = *((id *)v4 + 8);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        -[GEOTileSet addSupportedLanguage:](self, "addSupportedLanguage:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v12);
  }

  v15 = *((_DWORD *)v4 + 32);
  if ((v15 & 0x20) != 0)
  {
    self->_multiTileURLUsesStatusCodes = *((_BYTE *)v4 + 124);
    *(_DWORD *)&self->_flags |= 0x20u;
    v15 = *((_DWORD *)v4 + 32);
  }
  if ((v15 & 0x10) != 0)
  {
    self->_updateBehavior = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = *((id *)v4 + 4);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        -[GEOTileSet addCountryRegionAllowlist:](self, "addCountryRegionAllowlist:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v18);
  }

  v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 2) != 0)
  {
    self->_checksumType = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_flags |= 2u;
    v21 = *((_DWORD *)v4 + 32);
    if ((v21 & 4) == 0)
    {
LABEL_34:
      if ((v21 & 8) == 0)
        goto LABEL_35;
      goto LABEL_49;
    }
  }
  else if ((v21 & 4) == 0)
  {
    goto LABEL_34;
  }
  self->_dataSet = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_flags |= 4u;
  v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 8) == 0)
  {
LABEL_35:
    if ((v21 & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_50;
  }
LABEL_49:
  self->_requestStyle = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_flags |= 8u;
  v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 0x80) == 0)
  {
LABEL_36:
    if ((v21 & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_51;
  }
LABEL_50:
  self->_useAuthProxy = *((_BYTE *)v4 + 126);
  *(_DWORD *)&self->_flags |= 0x80u;
  v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 0x40) == 0)
  {
LABEL_37:
    if ((v21 & 1) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_51:
  self->_supportsMultipathTCP = *((_BYTE *)v4 + 125);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v4 + 32) & 1) != 0)
  {
LABEL_38:
    self->_alternativeMultipathTCPPort = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_flags |= 1u;
  }
LABEL_39:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v4 + 5);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[GEOTileSet addDeviceSKUAllowlist:](self, "addDeviceSKUAllowlist:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTileSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_156);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTileSet readAll:](self, "readAll:", 0);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = self->_validVersions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v11);
          if (v12)
          {
            os_unfair_lock_lock_with_options();
            *(_BYTE *)(v12 + 96) |= 4u;
            *(_BYTE *)(v12 + 96) |= 0x20u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 80));
            v13 = *(void **)(v12 + 16);
            *(_QWORD *)(v12 + 16) = 0;

            -[GEOTileSetVersion readAll:](v12, 0);
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v9);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_supportedLanguages;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v18++), "clearUnknownFields:", 1);
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v16);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = self->_countryRegionAllowlists;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "clearUnknownFields:", 1, (_QWORD)v24);
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v21);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validVersions, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_multiTileURL, 0);
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_deviceSKUAllowlists, 0);
  objc_storeStrong((id *)&self->_countryRegionAllowlists, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
