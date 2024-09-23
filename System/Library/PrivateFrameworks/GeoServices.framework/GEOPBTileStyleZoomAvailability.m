@implementation GEOPBTileStyleZoomAvailability

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPBTileStyleZoomAvailability;
  -[GEOPBTileStyleZoomAvailability dealloc](&v3, sel_dealloc);
}

- (uint64_t)zoomAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 16);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 8) + 4 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOPBTileStyleZoomAvailability;
  -[GEOPBTileStyleZoomAvailability description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTileStyleZoomAvailability dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 40) & 2) != 0)
    {
      v3 = CFSTR("RASTER_STANDARD");
      switch(*(_DWORD *)(a1 + 36))
      {
        case 0:
          break;
        case 1:
          v3 = CFSTR("VECTOR_STANDARD");
          break;
        case 2:
          v3 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
          break;
        case 3:
          v3 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
          break;
        case 4:
          v3 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
          break;
        case 5:
          v3 = CFSTR("RASTER_STANDARD_BACKGROUND");
          break;
        case 6:
          v3 = CFSTR("RASTER_HYBRID");
          break;
        case 7:
          v3 = CFSTR("RASTER_SATELLITE");
          break;
        case 8:
          v3 = CFSTR("RASTER_TERRAIN");
          break;
        case 0xB:
          v3 = CFSTR("VECTOR_BUILDINGS");
          break;
        case 0xC:
          v3 = CFSTR("VECTOR_TRAFFIC");
          break;
        case 0xD:
          v3 = CFSTR("VECTOR_POI");
          break;
        case 0xE:
          v3 = CFSTR("SPUTNIK_METADATA");
          break;
        case 0xF:
          v3 = CFSTR("SPUTNIK_C3M");
          break;
        case 0x10:
          v3 = CFSTR("SPUTNIK_DSM");
          break;
        case 0x11:
          v3 = CFSTR("SPUTNIK_DSM_GLOBAL");
          break;
        case 0x12:
          v3 = CFSTR("VECTOR_REALISTIC");
          break;
        case 0x13:
          v3 = CFSTR("VECTOR_LEGACY_REALISTIC");
          break;
        case 0x14:
          v3 = CFSTR("VECTOR_ROADS");
          break;
        case 0x15:
          v3 = CFSTR("RASTER_VEGETATION");
          break;
        case 0x16:
          v3 = CFSTR("VECTOR_TRAFFIC_SKELETON");
          break;
        case 0x17:
          v3 = CFSTR("RASTER_COASTLINE_MASK");
          break;
        case 0x18:
          v3 = CFSTR("RASTER_HILLSHADE");
          break;
        case 0x19:
          v3 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
          break;
        case 0x1A:
          v3 = CFSTR("VECTOR_TRAFFIC_STATIC");
          break;
        case 0x1B:
          v3 = CFSTR("RASTER_COASTLINE_DROP_MASK");
          break;
        case 0x1C:
          v3 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
          break;
        case 0x1D:
          v3 = CFSTR("VECTOR_SPEED_PROFILES");
          break;
        case 0x1E:
          v3 = CFSTR("VECTOR_VENUES");
          break;
        case 0x1F:
          v3 = CFSTR("RASTER_DOWN_SAMPLED");
          break;
        case 0x20:
          v3 = CFSTR("RASTER_COLOR_BALANCED");
          break;
        case 0x21:
          v3 = CFSTR("RASTER_SATELLITE_NIGHT");
          break;
        case 0x22:
          v3 = CFSTR("SPUTNIK_VECTOR_BORDER");
          break;
        case 0x23:
          v3 = CFSTR("RASTER_SATELLITE_DIGITIZE");
          break;
        case 0x24:
          v3 = CFSTR("RASTER_HILLSHADE_PARKS");
          break;
        case 0x25:
          v3 = CFSTR("VECTOR_TRANSIT");
          break;
        case 0x26:
          v3 = CFSTR("RASTER_STANDARD_BASE");
          break;
        case 0x27:
          v3 = CFSTR("RASTER_STANDARD_LABELS");
          break;
        case 0x28:
          v3 = CFSTR("RASTER_HYBRID_ROADS");
          break;
        case 0x29:
          v3 = CFSTR("RASTER_HYBRID_LABELS");
          break;
        case 0x2A:
          v3 = CFSTR("FLYOVER_C3M_MESH");
          break;
        case 0x2B:
          v3 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
          break;
        case 0x2C:
          v3 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
          break;
        case 0x2D:
          v3 = CFSTR("RASTER_SATELLITE_ASTC");
          break;
        case 0x2E:
          v3 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
          break;
        case 0x2F:
          v3 = CFSTR("VECTOR_TRANSIT_SELECTION");
          break;
        case 0x30:
          v3 = CFSTR("VECTOR_COVERAGE");
          break;
        case 0x34:
          v3 = CFSTR("FLYOVER_METADATA");
          break;
        case 0x35:
          v3 = CFSTR("VECTOR_ROAD_NETWORK");
          break;
        case 0x36:
          v3 = CFSTR("VECTOR_LAND_COVER");
          break;
        case 0x37:
          v3 = CFSTR("VECTOR_DEBUG");
          break;
        case 0x38:
          v3 = CFSTR("VECTOR_STREET_POI");
          break;
        case 0x39:
          v3 = CFSTR("MUNIN_METADATA");
          break;
        case 0x3A:
          v3 = CFSTR("VECTOR_SPR_MERCATOR");
          break;
        case 0x3B:
          v3 = CFSTR("VECTOR_SPR_MODELS");
          break;
        case 0x3C:
          v3 = CFSTR("VECTOR_SPR_MATERIALS");
          break;
        case 0x3D:
          v3 = CFSTR("VECTOR_SPR_METADATA");
          break;
        case 0x3E:
          v3 = CFSTR("VECTOR_TRACKS");
          break;
        case 0x3F:
          v3 = CFSTR("VECTOR_RESERVED_2");
          break;
        case 0x40:
          v3 = CFSTR("VECTOR_STREET_LANDMARKS");
          break;
        case 0x41:
          v3 = CFSTR("COARSE_LOCATION_POLYGONS");
          break;
        case 0x42:
          v3 = CFSTR("VECTOR_SPR_ROADS");
          break;
        case 0x43:
          v3 = CFSTR("VECTOR_SPR_STANDARD");
          break;
        case 0x44:
          v3 = CFSTR("VECTOR_POI_V2");
          break;
        case 0x45:
          v3 = CFSTR("VECTOR_POLYGON_SELECTION");
          break;
        case 0x46:
          v3 = CFSTR("VL_METADATA");
          break;
        case 0x47:
          v3 = CFSTR("VL_DATA");
          break;
        case 0x48:
          v3 = CFSTR("PROACTIVE_APP_CLIP");
          break;
        case 0x49:
          v3 = CFSTR("VECTOR_BUILDINGS_V2");
          break;
        case 0x4A:
          v3 = CFSTR("POI_BUSYNESS");
          break;
        case 0x4B:
          v3 = CFSTR("POI_DP_BUSYNESS");
          break;
        case 0x4C:
          v3 = CFSTR("SMART_INTERFACE_SELECTION");
          break;
        case 0x4D:
          v3 = CFSTR("VECTOR_ASSETS");
          break;
        case 0x4E:
          v3 = CFSTR("SPR_ASSET_METADATA");
          break;
        case 0x4F:
          v3 = CFSTR("VECTOR_SPR_POLAR");
          break;
        case 0x50:
          v3 = CFSTR("SMART_DATA_MODE");
          break;
        case 0x51:
          v3 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
          break;
        case 0x52:
          v3 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
          break;
        case 0x53:
          v3 = CFSTR("VECTOR_TOPOGRAPHIC");
          break;
        case 0x54:
          v3 = CFSTR("VECTOR_POI_V2_UPDATE");
          break;
        case 0x55:
          v3 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
          break;
        case 0x56:
          v3 = CFSTR("VECTOR_TRAFFIC_V2");
          break;
        case 0x57:
          v3 = CFSTR("VECTOR_ROAD_SELECTION");
          break;
        case 0x58:
          v3 = CFSTR("VECTOR_REGION_METADATA");
          break;
        case 0x59:
          v3 = CFSTR("RAY_TRACING");
          break;
        case 0x5A:
          v3 = CFSTR("VECTOR_CONTOURS");
          break;
        case 0x5B:
          v3 = CFSTR("RASTER_SATELLITE_POLAR");
          break;
        case 0x5C:
          v3 = CFSTR("VMAP4_ELEVATION");
          break;
        case 0x5D:
          v3 = CFSTR("VMAP4_ELEVATION_POLAR");
          break;
        case 0x5E:
          v3 = CFSTR("CELLULAR_COVERAGE_PLMN");
          break;
        case 0x5F:
          v3 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
          break;
        case 0x60:
          v3 = CFSTR("UNUSED_96");
          break;
        case 0x61:
          v3 = CFSTR("UNUSED_97");
          break;
        case 0x62:
          v3 = CFSTR("UNUSED_98");
          break;
        case 0x63:
          v3 = CFSTR("UNUSED_99");
          break;
        case 0x64:
          v3 = CFSTR("UNUSED_100");
          break;
        case 0x65:
          v3 = CFSTR("UNUSED_101");
          break;
        case 0x66:
          v3 = CFSTR("UNUSED_102");
          break;
        case 0x67:
          v3 = CFSTR("UNUSED_103");
          break;
        case 0x68:
          v3 = CFSTR("UNUSED_104");
          break;
        case 0x69:
          v3 = CFSTR("UNUSED_105");
          break;
        case 0x6A:
          v3 = CFSTR("UNUSED_106");
          break;
        case 0x6B:
          v3 = CFSTR("UNUSED_107");
          break;
        case 0x6C:
          v3 = CFSTR("UNUSED_108");
          break;
        case 0x6D:
          v3 = CFSTR("UNUSED_109");
          break;
        case 0x6E:
          v3 = CFSTR("UNUSED_110");
          break;
        case 0x6F:
          v3 = CFSTR("UNUSED_111");
          break;
        case 0x70:
          v3 = CFSTR("UNUSED_112");
          break;
        case 0x71:
          v3 = CFSTR("UNUSED_113");
          break;
        case 0x72:
          v3 = CFSTR("UNUSED_114");
          break;
        case 0x73:
          v3 = CFSTR("UNUSED_115");
          break;
        case 0x74:
          v3 = CFSTR("UNUSED_116");
          break;
        case 0x75:
          v3 = CFSTR("UNUSED_117");
          break;
        case 0x76:
          v3 = CFSTR("UNUSED_118");
          break;
        case 0x77:
          v3 = CFSTR("UNUSED_119");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 36));
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("style"));

    }
    if (*(_QWORD *)(a1 + 16))
    {
      PBRepeatedUInt32NSArray();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("zoom"));

    }
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    {
      v5 = *(int *)(a1 + 32);
      if (v5 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C21E28[v5];
      }
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("size"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTileStyleZoomAvailabilityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_zooms.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_zooms.count);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 36) = self->_style;
    *(_BYTE *)(v4 + 40) |= 2u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_size;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_style != *((_DWORD *)v4 + 9))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_12;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_size != *((_DWORD *)v4 + 8))
      goto LABEL_12;
    v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_style;
  else
    v3 = 0;
  v4 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_size;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

@end
