@implementation GEOPDComponent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionDomains, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_commingledAttributions, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (BOOL)statusCodeIsValid
{
  return !self || (*(_WORD *)&self->_flags & 0x20) == 0 || (self->_status & 0xFFFFFFFD) == 0;
}

- (id)values
{
  if (a1)
    a1 = (id *)a1[6];
  return a1;
}

- (id)commingledAttributions
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (id)attribution
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  __int128 v23;
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
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_attribution)
    PBDataWriterWriteSubmessage();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = self->_values;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_versionDomains;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }

  if ((*(_WORD *)&self->_flags & 0x200) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_source)
    PBDataWriterWriteSubmessage();
  v16 = (__int16)self->_flags;
  if ((v16 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v16 = (__int16)self->_flags;
  }
  if ((v16 & 4) != 0)
    PBDataWriterWriteInt32Field();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_commingledAttributions;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

  v22 = (__int16)self->_flags;
  if ((v22 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v22 = (__int16)self->_flags;
  }
  if ((v22 & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v23);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 flags;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  __int16 v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int16 v31;
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
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_type;
    *(_WORD *)(v5 + 100) |= 0x80u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 80) = self->_status;
  *(_WORD *)(v5 + 100) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 84) = self->_ttl;
  *(_WORD *)(v5 + 100) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_42:
  *(_DWORD *)(v5 + 76) = self->_startIndex;
  *(_WORD *)(v5 + 100) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 92) = self->_valuesAvailable;
    *(_WORD *)(v5 + 100) |= 0x100u;
  }
LABEL_7:
  v8 = -[GEOPDAttribution copyWithZone:](self->_attribution, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = self->_values;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v14), "copyWithZone:", a3);
        -[GEOPDComponent addValue:](v6, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v12);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = self->_versionDomains;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "copyWithZone:", a3);
        -[GEOPDComponent addVersionDomain:](v6, v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v18);
  }

  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_version;
    *(_WORD *)(v6 + 100) |= 0x200u;
  }
  v22 = -[GEOPDSource copyWithZone:](self->_source, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v22;

  v24 = (__int16)self->_flags;
  if ((v24 & 2) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_cacheControl;
    *(_WORD *)(v6 + 100) |= 2u;
    v24 = (__int16)self->_flags;
  }
  if ((v24 & 4) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_componentId;
    *(_WORD *)(v6 + 100) |= 4u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = self->_commingledAttributions;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v29), "copyWithZone:", a3, (_QWORD)v33);
        -[GEOPDComponent addCommingledAttributions:](v6, v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v27);
  }

  v31 = (__int16)self->_flags;
  if ((v31 & 8) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_elevationModelUsed;
    *(_WORD *)(v6 + 100) |= 8u;
    v31 = (__int16)self->_flags;
  }
  if ((v31 & 1) != 0)
  {
    *(double *)(v6 + 40) = self->_timestampFirstSeen;
    *(_WORD *)(v6 + 100) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (void)addVersionDomain:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addValue:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)versionDomains
{
  if (a1)
    a1 = (id *)a1[7];
  return a1;
}

- (void)setTimestampFirstSeen:(double)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_timestampFirstSeen = a3;
}

- (BOOL)hasTimestampFirstSeen
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDComponent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __CFString *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  const __CFString *v46;
  __int16 v47;
  int v48;
  __CFString *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _QWORD v59[4];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 100);
  if ((v5 & 0x80) != 0)
  {
    v6 = CFSTR("COMPONENT_TYPE_UNKNOWN");
    switch(*(_DWORD *)(a1 + 88))
    {
      case 0:
        break;
      case 1:
        v6 = CFSTR("COMPONENT_TYPE_ENTITY");
        break;
      case 2:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_INFO");
        break;
      case 3:
        v6 = CFSTR("COMPONENT_TYPE_ROAD_ACCESS_INFO");
        break;
      case 4:
        v6 = CFSTR("COMPONENT_TYPE_BOUNDS");
        break;
      case 5:
        v6 = CFSTR("COMPONENT_TYPE_ADDRESS");
        break;
      case 6:
        v6 = CFSTR("COMPONENT_TYPE_RATING");
        break;
      case 7:
        v6 = CFSTR("COMPONENT_TYPE_REVIEW");
        break;
      case 8:
        v6 = CFSTR("COMPONENT_TYPE_PHOTO");
        break;
      case 9:
        v6 = CFSTR("COMPONENT_TYPE_HOURS");
        break;
      case 0xA:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO");
        break;
      case 0xB:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_SCHEDULE");
        break;
      case 0xC:
        v6 = CFSTR("COMPONENT_TYPE_ETA");
        break;
      case 0xD:
        v6 = CFSTR("COMPONENT_TYPE_FLYOVER");
        break;
      case 0xE:
        v6 = CFSTR("COMPONENT_TYPE_RAW_ATTRIBUTE");
        break;
      case 0xF:
        v6 = CFSTR("COMPONENT_TYPE_AMENITIES");
        break;
      case 0x10:
        v6 = CFSTR("COMPONENT_TYPE_STYLE_ATTRIBUTES");
        break;
      case 0x14:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_INCIDENT");
        break;
      case 0x15:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO");
        break;
      case 0x16:
        v6 = CFSTR("COMPONENT_TYPE_TEXT_BLOCK");
        break;
      case 0x17:
        v6 = CFSTR("COMPONENT_TYPE_FACTOID");
        break;
      case 0x18:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_ATTRIBUTION");
        break;
      case 0x19:
        v6 = CFSTR("COMPONENT_TYPE_BUSINESS_CLAIM");
        break;
      case 0x1A:
        v6 = CFSTR("COMPONENT_TYPE_CAPTIONED_PHOTO");
        break;
      case 0x1B:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO_SNIPPET");
        break;
      case 0x1D:
        v6 = CFSTR("COMPONENT_TYPE_EXTERNAL_ACTION");
        break;
      case 0x1E:
        v6 = CFSTR("COMPONENT_TYPE_RESULT_SNIPPET");
        break;
      case 0x1F:
        v6 = CFSTR("COMPONENT_TYPE_ADDRESS_OBJECT");
        break;
      case 0x20:
        v6 = CFSTR("COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT");
        break;
      case 0x21:
        v6 = CFSTR("COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK");
        break;
      case 0x22:
        v6 = CFSTR("COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT");
        break;
      case 0x24:
        v6 = CFSTR("COMPONENT_TYPE_TIP");
        break;
      case 0x25:
        v6 = CFSTR("COMPONENT_TYPE_PLACECARD_URL");
        break;
      case 0x26:
        v6 = CFSTR("COMPONENT_TYPE_ASSOCIATED_APP");
        break;
      case 0x27:
        v6 = CFSTR("COMPONENT_TYPE_MESSAGE_LINK");
        break;
      case 0x28:
        v6 = CFSTR("COMPONENT_TYPE_QUICK_LINK");
        break;
      case 0x29:
        v6 = CFSTR("COMPONENT_TYPE_RAP");
        break;
      case 0x2A:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_AREA");
        break;
      case 0x2B:
        v6 = CFSTR("COMPONENT_TYPE_LOCATION_EVENT");
        break;
      case 0x2C:
        v6 = CFSTR("COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS");
        break;
      case 0x2D:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_IDENTIFIER");
        break;
      case 0x2E:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_QUAD_NODES");
        break;
      case 0x2F:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_SIZE");
        break;
      case 0x30:
        v6 = CFSTR("COMPONENT_TYPE_VENUE_INFO");
        break;
      case 0x31:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST");
        break;
      case 0x32:
        v6 = CFSTR("COMPONENT_TYPE_CONTAINED_PLACE");
        break;
      case 0x33:
        v6 = CFSTR("COMPONENT_TYPE_WIFI_FINGERPRINT");
        break;
      case 0x34:
        v6 = CFSTR("COMPONENT_TYPE_ICON");
        break;
      case 0x35:
        v6 = CFSTR("COMPONENT_TYPE_PRICE_DESCRIPTION");
        break;
      case 0x36:
        v6 = CFSTR("COMPONENT_TYPE_BROWSE_CATEGORIES");
        break;
      case 0x37:
        v6 = CFSTR("COMPONENT_TYPE_STOREFRONT");
        break;
      case 0x38:
        v6 = CFSTR("COMPONENT_TYPE_GROUND_VIEW_LABEL");
        break;
      case 0x39:
        v6 = CFSTR("COMPONENT_TYPE_ANNOTATED_ITEM_LIST");
        break;
      case 0x3A:
        v6 = CFSTR("COMPONENT_TYPE_POI_EVENT");
        break;
      case 0x3B:
        v6 = CFSTR("COMPONENT_TYPE_STOREFRONT_PRESENTATION");
        break;
      case 0x3C:
        v6 = CFSTR("COMPONENT_TYPE_PLACECARD_LAYOUT");
        break;
      case 0x3D:
        v6 = CFSTR("COMPONENT_TYPE_PROTOTYPE_CONTAINER");
        break;
      case 0x3E:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION");
        break;
      case 0x3F:
        v6 = CFSTR("COMPONENT_TYPE_LINKED_SERVICE");
        break;
      case 0x40:
        v6 = CFSTR("COMPONENT_TYPE_BUSINESS_HOURS");
        break;
      case 0x41:
        v6 = CFSTR("COMPONENT_TYPE_COLLECTION");
        break;
      case 0x42:
        v6 = CFSTR("COMPONENT_TYPE_RELATED_PLACE");
        break;
      case 0x43:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP");
        break;
      case 0x44:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME");
        break;
      case 0x45:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY");
        break;
      case 0x46:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES");
        break;
      case 0x47:
        v6 = CFSTR("COMPONENT_TYPE_PUBLISHER");
        break;
      case 0x48:
        v6 = CFSTR("COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES");
        break;
      case 0x49:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_QUESTIONNAIRE");
        break;
      case 0x4A:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_COLLECTION_ITEM");
        break;
      case 0x4C:
        v6 = CFSTR("COMPONENT_TYPE_COLLECTION_IDS");
        break;
      case 0x4D:
        v6 = CFSTR("COMPONENT_TYPE_ISO_3166_CODE");
        break;
      case 0x4E:
        v6 = CFSTR("COMPONENT_TYPE_VENDOR_AMENITIES");
        break;
      case 0x4F:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE");
        break;
      case 0x51:
        v6 = CFSTR("COMPONENT_TYPE_STOREFRONT_FACES");
        break;
      case 0x52:
        v6 = CFSTR("COMPONENT_TYPE_GUIDE_GROUP");
        break;
      case 0x53:
        v6 = CFSTR("COMPONENT_TYPE_CONTAINMENT_PLACE");
        break;
      case 0x54:
        v6 = CFSTR("COMPONENT_TYPE_CATEGORIZED_PHOTOS");
        break;
      case 0x55:
        v6 = CFSTR("COMPONENT_TYPE_EXPLORE_GUIDES");
        break;
      case 0x56:
        v6 = CFSTR("COMPONENT_TYPE_ABOUT");
        break;
      case 0x57:
        v6 = CFSTR("COMPONENT_TYPE_LABEL_GEOMETRY");
        break;
      case 0x58:
        v6 = CFSTR("COMPONENT_TYPE_ENHANCED_PLACEMENT");
        break;
      case 0x59:
        v6 = CFSTR("COMPONENT_TYPE_TEMPLATE_PLACE");
        break;
      case 0x5A:
        v6 = CFSTR("COMPONENT_TYPE_SEARCH_ENRICHMENT");
        break;
      case 0x5B:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO");
        break;
      case 0x5C:
        v6 = CFSTR("COMPONENT_TYPE_BUSINESS_ASSETS");
        break;
      case 0x5D:
        v6 = CFSTR("COMPONENT_TYPE_ENRICHMENT_INFO");
        break;
      case 0x5E:
        v6 = CFSTR("COMPONENT_TYPE_ACTION_DATA");
        break;
      case 0x5F:
        v6 = CFSTR("COMPONENT_TYPE_ENRICHMENT_DATA");
        break;
      case 0x60:
        v6 = CFSTR("COMPONENT_TYPE_POI_CLAIM");
        break;
      case 0x61:
        v6 = CFSTR("COMPONENT_TYPE_EV_CHARGER");
        break;
      case 0x62:
        v6 = CFSTR("COMPONENT_TYPE_TRAIL_HEAD");
        break;
      case 0x63:
        v6 = CFSTR("COMPONENT_TYPE_TOOL_TIP");
        break;
      case 0x64:
        v6 = CFSTR("COMPONENT_TYPE_REFRESH_ID");
        break;
      case 0x65:
        v6 = CFSTR("COMPONENT_TYPE_ADDRESS_COMPONENTS");
        break;
      case 0x66:
        v6 = CFSTR("COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO");
        break;
      case 0x67:
        v6 = CFSTR("COMPONENT_TYPE_FORWARD_INFO");
        break;
      case 0x68:
        v6 = CFSTR("COMPONENT_TYPE_HIKE_ASSOCIATED_INFO");
        break;
      case 0x69:
        v6 = CFSTR("COMPONENT_TYPE_HIKE_SUMMARY");
        break;
      case 0x6A:
        v6 = CFSTR("COMPONENT_TYPE_HIKE_GEOMETRY");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 88));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    v5 = *(_WORD *)(a1 + 100);
  }
  if ((v5 & 0x20) != 0)
  {
    v7 = *(_DWORD *)(a1 + 80);
    if (v7 <= 29)
    {
      v8 = CFSTR("STATUS_SUCCESS");
      switch(v7)
      {
        case 0:
          goto LABEL_123;
        case 1:
          v8 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v8 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_118;
        case 5:
          v8 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v7 != 20)
            goto LABEL_118;
          v8 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_123;
    }
    if (v7 > 49)
    {
      if (v7 == 50)
      {
        v8 = CFSTR("STATUS_DEDUPED");
        goto LABEL_123;
      }
      if (v7 == 60)
      {
        v8 = CFSTR("VERSION_MISMATCH");
        goto LABEL_123;
      }
    }
    else
    {
      if (v7 == 30)
      {
        v8 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_123;
      }
      if (v7 == 40)
      {
        v8 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_123:
        objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("status"));

        v5 = *(_WORD *)(a1 + 100);
        goto LABEL_124;
      }
    }
LABEL_118:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 80));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_123;
  }
LABEL_124:
  if ((v5 & 0x40) == 0)
  {
    if ((v5 & 0x10) == 0)
      goto LABEL_126;
LABEL_135:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 76));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("startIndex");
    else
      v15 = CFSTR("start_index");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
      goto LABEL_131;
    goto LABEL_127;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("ttl"));

  v5 = *(_WORD *)(a1 + 100);
  if ((v5 & 0x10) != 0)
    goto LABEL_135;
LABEL_126:
  if ((v5 & 0x100) != 0)
  {
LABEL_127:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 92));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("valuesAvailable");
    else
      v10 = CFSTR("values_available");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
LABEL_131:
  v11 = *(id *)(a1 + 16);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("attribution"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v66 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("value"));
  }
  v25 = *(void **)(a1 + 56);
  if (v25)
  {
    v26 = v25;
    if (a2)
      v27 = CFSTR("versionDomain");
    else
      v27 = CFSTR("version_domain");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  if ((*(_WORD *)(a1 + 100) & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("version"));

  }
  v29 = *(id *)(a1 + 32);
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v29, "jsonRepresentation");
    else
      objc_msgSend(v29, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("source"));

  }
  v32 = *(_WORD *)(a1 + 100);
  if ((v32 & 2) != 0)
  {
    v33 = *(int *)(a1 + 64);
    if (v33 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E1C0B870[v33];
    }
    if (a2)
      v35 = CFSTR("cacheControl");
    else
      v35 = CFSTR("cache_control");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

    v32 = *(_WORD *)(a1 + 100);
  }
  if ((v32 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 68));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("componentId");
    else
      v37 = CFSTR("component_id");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v39 = *(id *)(a1 + 24);
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v62 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v44, "jsonRepresentation");
          else
            objc_msgSend(v44, "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v45);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v41);
    }

    if (a2)
      v46 = CFSTR("commingledAttributions");
    else
      v46 = CFSTR("commingled_attributions");
    objc_msgSend(v4, "setObject:forKey:", v38, v46);

  }
  v47 = *(_WORD *)(a1 + 100);
  if ((v47 & 8) != 0)
  {
    v48 = *(_DWORD *)(a1 + 72);
    if (v48)
    {
      if (v48 == 1)
      {
        v49 = CFSTR("ELEVATION_MODEL_WGS84");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 72));
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v49 = CFSTR("ELEVATION_MODEL_EGM96");
    }
    if (a2)
      v50 = CFSTR("elevationModelUsed");
    else
      v50 = CFSTR("elevation_model_used");
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

    v47 = *(_WORD *)(a1 + 100);
  }
  if ((v47 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("timestampFirstSeen"));

  }
  v52 = *(void **)(a1 + 8);
  if (v52)
  {
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __44__GEOPDComponent__dictionaryRepresentation___block_invoke;
      v59[3] = &unk_1E1C00600;
      v56 = v55;
      v60 = v56;
      objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v59);
      v57 = v56;

      v54 = v57;
    }
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((-[GEOPDComponentValue hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), a2) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    if (a2)
    {
      -[GEOPDAttribution clearUnknownFields:](*(_QWORD *)(a1 + 16), 1);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = *(id *)(a1 + 48);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v20;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v5);
            -[GEOPDComponentValue clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v7);
      }

      -[GEOPDSource clearUnknownFields:](*(_QWORD *)(a1 + 32), 1);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = *(id *)(a1 + 24);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            -[GEOPDAttribution clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), 1);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        }
        while (v12);
      }

    }
  }
}

- (void)setAttribution:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);

}

- (void)setValues:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)setVersionDomains:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);

}

- (id)source
{
  if (a1)
    a1 = (id *)a1[4];
  return a1;
}

- (void)setSource:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)addCommingledAttributions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
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
  v8.super_class = (Class)GEOPDComponent;
  -[GEOPDComponent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDComponent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDComponent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (char)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  void *v6;
  int *v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  GEOPDAttribution *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  GEOPDComponentValue *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  GEOPDSource *v46;
  id v47;
  const __CFString *v48;
  void *v49;
  int v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  id v58;
  int v59;
  const __CFString *v60;
  void *v61;
  int v62;
  const __CFString *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  GEOPDAttribution *v71;
  void *v72;
  uint64_t v73;
  const __CFString *v74;
  void *v75;
  id v76;
  int v77;
  void *v78;
  void *v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_350;
  a1 = (char *)(id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_350;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = &OBJC_IVAR___GEOXPCReply__methodName;
  v82 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENTITY")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_INFO")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ROAD_ACCESS_INFO")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_BOUNDS")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ADDRESS")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_RATING")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_REVIEW")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PHOTO")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_HOURS")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_INFO")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_SCHEDULE")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ETA")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_FLYOVER")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_RAW_ATTRIBUTE")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_AMENITIES")) & 1) != 0)
    {
      v9 = 15;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_STYLE_ATTRIBUTES")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_INCIDENT")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO")) & 1) != 0)
    {
      v9 = 21;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TEXT_BLOCK")) & 1) != 0)
    {
      v9 = 22;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_FACTOID")) & 1) != 0)
    {
      v9 = 23;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_ATTRIBUTION")) & 1) != 0)
    {
      v9 = 24;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_BUSINESS_CLAIM")) & 1) != 0)
    {
      v9 = 25;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_CAPTIONED_PHOTO")) & 1) != 0)
    {
      v9 = 26;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_INFO_SNIPPET")) & 1) != 0)
    {
      v9 = 27;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_EXTERNAL_ACTION")) & 1) != 0)
    {
      v9 = 29;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_RESULT_SNIPPET")) & 1) != 0)
    {
      v9 = 30;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ADDRESS_OBJECT")) & 1) != 0)
    {
      v9 = 31;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT")) & 1) != 0)
    {
      v9 = 32;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK")) & 1) != 0)
    {
      v9 = 33;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT")) & 1) != 0)
    {
      v9 = 34;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TIP")) & 1) != 0)
    {
      v9 = 36;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACECARD_URL")) & 1) != 0)
    {
      v9 = 37;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ASSOCIATED_APP")) & 1) != 0)
    {
      v9 = 38;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_MESSAGE_LINK")) & 1) != 0)
    {
      v9 = 39;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_QUICK_LINK")) & 1) != 0)
    {
      v9 = 40;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_RAP")) & 1) != 0)
    {
      v9 = 41;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_AREA")) & 1) != 0)
    {
      v9 = 42;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_LOCATION_EVENT")) & 1) != 0)
    {
      v9 = 43;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS")) & 1) != 0)
    {
      v9 = 44;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_IDENTIFIER")) & 1) != 0)
    {
      v9 = 45;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_QUAD_NODES")) & 1) != 0)
    {
      v9 = 46;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_SIZE")) & 1) != 0)
    {
      v9 = 47;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_VENUE_INFO")) & 1) != 0)
    {
      v9 = 48;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
    {
      v9 = 49;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_CONTAINED_PLACE")) & 1) != 0)
    {
      v9 = 50;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_WIFI_FINGERPRINT")) & 1) != 0)
    {
      v9 = 51;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ICON")) & 1) != 0)
    {
      v9 = 52;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PRICE_DESCRIPTION")) & 1) != 0)
    {
      v9 = 53;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_BROWSE_CATEGORIES")) & 1) != 0)
    {
      v9 = 54;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_STOREFRONT")) & 1) != 0)
    {
      v9 = 55;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
    {
      v9 = 56;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ANNOTATED_ITEM_LIST")) & 1) != 0)
    {
      v9 = 57;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_POI_EVENT")) & 1) != 0)
    {
      v9 = 58;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_STOREFRONT_PRESENTATION")) & 1) != 0)
    {
      v9 = 59;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACECARD_LAYOUT")) & 1) != 0)
    {
      v9 = 60;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PROTOTYPE_CONTAINER")) & 1) != 0)
    {
      v9 = 61;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
    {
      v9 = 62;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_LINKED_SERVICE")) & 1) != 0)
    {
      v9 = 63;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_BUSINESS_HOURS")) & 1) != 0)
    {
      v9 = 64;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_COLLECTION")) & 1) != 0)
    {
      v9 = 65;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_RELATED_PLACE")) & 1) != 0)
    {
      v9 = 66;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP")) & 1) != 0)
    {
      v9 = 67;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME")) & 1) != 0)
    {
      v9 = 68;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY")) & 1) != 0)
    {
      v9 = 69;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
    {
      v9 = 70;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PUBLISHER")) & 1) != 0)
    {
      v9 = 71;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
    {
      v9 = 72;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
    {
      v9 = 73;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_COLLECTION_ITEM")) & 1) != 0)
    {
      v9 = 74;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_COLLECTION_IDS")) & 1) != 0)
    {
      v9 = 76;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ISO_3166_CODE")) & 1) != 0)
    {
      v9 = 77;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_VENDOR_AMENITIES")) & 1) != 0)
    {
      v9 = 78;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE")) & 1) != 0)
    {
      v9 = 79;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_STOREFRONT_FACES")) & 1) != 0)
    {
      v9 = 81;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_GUIDE_GROUP")) & 1) != 0)
    {
      v9 = 82;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_CONTAINMENT_PLACE")) & 1) != 0)
    {
      v9 = 83;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_CATEGORIZED_PHOTOS")) & 1) != 0)
    {
      v9 = 84;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_EXPLORE_GUIDES")) & 1) != 0)
    {
      v9 = 85;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ABOUT")) & 1) != 0)
    {
      v9 = 86;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_LABEL_GEOMETRY")) & 1) != 0)
    {
      v9 = 87;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENHANCED_PLACEMENT")) & 1) != 0)
    {
      v9 = 88;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TEMPLATE_PLACE")) & 1) != 0)
    {
      v9 = 89;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_SEARCH_ENRICHMENT")) & 1) != 0)
    {
      v9 = 90;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO")) & 1) != 0)
    {
      v9 = 91;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_BUSINESS_ASSETS")) & 1) != 0)
    {
      v9 = 92;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENRICHMENT_INFO")) & 1) != 0)
    {
      v9 = 93;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ACTION_DATA")) & 1) != 0)
    {
      v9 = 94;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENRICHMENT_DATA")) & 1) != 0)
    {
      v9 = 95;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_POI_CLAIM")) & 1) != 0)
    {
      v9 = 96;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_EV_CHARGER")) & 1) != 0)
    {
      v9 = 97;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRAIL_HEAD")) & 1) != 0)
    {
      v9 = 98;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_TOOL_TIP")) & 1) != 0)
    {
      v9 = 99;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_REFRESH_ID")) & 1) != 0)
    {
      v9 = 100;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_ADDRESS_COMPONENTS")) & 1) != 0)
    {
      v9 = 101;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO")) & 1) != 0)
    {
      v9 = 102;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_FORWARD_INFO")) & 1) != 0)
    {
      v9 = 103;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_HIKE_ASSOCIATED_INFO")) & 1) != 0)
    {
      v9 = 104;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_HIKE_SUMMARY")) & 1) != 0)
    {
      v9 = 105;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("COMPONENT_TYPE_HIKE_GEOMETRY")))
    {
      v9 = 106;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_209;
    v9 = objc_msgSend(v6, "intValue");
  }
  *((_WORD *)a1 + 50) |= 0x80u;
  *((_DWORD *)a1 + 22) = v9;
LABEL_209:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v12 = 5;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v12 = 20;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v12 = 30;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v12 = 40;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v12 = 50;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v12 = 60;
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
      goto LABEL_233;
    v12 = objc_msgSend(v10, "intValue");
  }
  *((_WORD *)a1 + 50) |= 0x20u;
  *((_DWORD *)a1 + 20) = v12;
LABEL_233:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ttl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v13, "unsignedIntValue");
    *((_WORD *)a1 + 50) |= 0x40u;
    *((_DWORD *)a1 + 21) = v14;
  }

  if ((_DWORD)a3)
    v15 = CFSTR("startIndex");
  else
    v15 = CFSTR("start_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_msgSend(v16, "intValue");
    *((_WORD *)a1 + 50) |= 0x10u;
    *((_DWORD *)a1 + 19) = v17;
  }

  if ((_DWORD)a3)
    v18 = CFSTR("valuesAvailable");
  else
    v18 = CFSTR("values_available");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v19, "intValue");
    *((_WORD *)a1 + 50) |= 0x100u;
    *((_DWORD *)a1 + 23) = v20;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attribution"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOPDAttribution alloc];
    if (v22)
      v23 = (void *)-[GEOPDAttribution _initWithDictionary:isJSON:](v22, v21, a3);
    else
      v23 = 0;
    -[GEOPDComponent setAttribution:]((uint64_t)a1, v23);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v80 = v24;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v92;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v92 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v29);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = [GEOPDComponentValue alloc];
            if (v31)
              v32 = (void *)-[GEOPDComponentValue _initWithDictionary:isJSON:](v31, v30, a3);
            else
              v32 = 0;
            -[GEOPDComponent addValue:]((uint64_t)a1, v32);

          }
          ++v29;
        }
        while (v27 != v29);
        v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
        v27 = v33;
      }
      while (v33);
    }

    v24 = v80;
    v7 = &OBJC_IVAR___GEOXPCReply__methodName;
  }

  if ((_DWORD)a3)
    v34 = CFSTR("versionDomain");
  else
    v34 = CFSTR("version_domain");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34, v80);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v88 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v42 = (void *)objc_msgSend(v41, "copy");
            -[GEOPDComponent addVersionDomain:]((uint64_t)a1, v42);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      }
      while (v38);
    }

    v5 = v82;
    v7 = &OBJC_IVAR___GEOXPCReply__methodName;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = objc_msgSend(v43, "unsignedIntValue");
    *(_WORD *)&a1[v7[731]] |= 0x200u;
    *((_DWORD *)a1 + 24) = v44;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = [GEOPDSource alloc];
    if (v46)
    {
      v47 = v45;
      v46 = -[GEOPDSource init](v46, "init");
      if (v46)
      {
        if ((_DWORD)a3)
          v48 = CFSTR("resultProviderId");
        else
          v48 = CFSTR("result_provider_id");
        objc_msgSend(v47, "objectForKeyedSubscript:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = objc_msgSend(v49, "intValue");
          *(_BYTE *)&v46->_flags |= 0x10u;
          *(_BYTE *)&v46->_flags |= 1u;
          v46->_resultProviderId = v50;
        }

        if ((_DWORD)a3)
          v51 = CFSTR("sourceId");
        else
          v51 = CFSTR("source_id");
        objc_msgSend(v47, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v53 = (void *)objc_msgSend(v52, "copy");
          -[GEOPDSource setSourceId:]((uint64_t)v46, v53);

        }
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("version"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v55 = (void *)objc_msgSend(v54, "copy");
          -[GEOPDSource setVersion:]((uint64_t)v46, v55);

        }
        v7 = &OBJC_IVAR___GEOXPCReply__methodName;
      }

    }
    -[GEOPDComponent setSource:]((uint64_t)a1, v46);

  }
  if ((_DWORD)a3)
    v56 = CFSTR("cacheControl");
  else
    v56 = CFSTR("cache_control");
  objc_msgSend(v5, "objectForKeyedSubscript:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = v57;
    if ((objc_msgSend(v58, "isEqualToString:", CFSTR("UNKNOWN_CACHEABILITY")) & 1) != 0)
    {
      v59 = 0;
    }
    else if ((objc_msgSend(v58, "isEqualToString:", CFSTR("UNCACHEABLE")) & 1) != 0)
    {
      v59 = 1;
    }
    else if (objc_msgSend(v58, "isEqualToString:", CFSTR("CACHEABLE")))
    {
      v59 = 2;
    }
    else
    {
      v59 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_313;
    v59 = objc_msgSend(v57, "intValue");
  }
  *(_WORD *)&a1[v7[731]] |= 2u;
  *((_DWORD *)a1 + 16) = v59;
LABEL_313:

  if ((_DWORD)a3)
    v60 = CFSTR("componentId");
  else
    v60 = CFSTR("component_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = objc_msgSend(v61, "intValue");
    *(_WORD *)&a1[v7[731]] |= 4u;
    *((_DWORD *)a1 + 17) = v62;
  }

  if ((_DWORD)a3)
    v63 = CFSTR("commingledAttributions");
  else
    v63 = CFSTR("commingled_attributions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v81 = v64;
    v65 = v64;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v84;
      do
      {
        v69 = 0;
        do
        {
          if (*(_QWORD *)v84 != v68)
            objc_enumerationMutation(v65);
          v70 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v69);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v71 = [GEOPDAttribution alloc];
            if (v71)
              v72 = (void *)-[GEOPDAttribution _initWithDictionary:isJSON:](v71, v70, a3);
            else
              v72 = 0;
            -[GEOPDComponent addCommingledAttributions:]((uint64_t)a1, v72);

          }
          ++v69;
        }
        while (v67 != v69);
        v73 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
        v67 = v73;
      }
      while (v73);
    }

    v64 = v81;
    v5 = v82;
    v7 = &OBJC_IVAR___GEOXPCReply__methodName;
  }

  if ((_DWORD)a3)
    v74 = CFSTR("elevationModelUsed");
  else
    v74 = CFSTR("elevation_model_used");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74, v81);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = v75;
    if ((objc_msgSend(v76, "isEqualToString:", CFSTR("ELEVATION_MODEL_EGM96")) & 1) != 0)
      v77 = 0;
    else
      v77 = objc_msgSend(v76, "isEqualToString:", CFSTR("ELEVATION_MODEL_WGS84"));

    goto LABEL_346;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v77 = objc_msgSend(v75, "intValue");
LABEL_346:
    *(_WORD *)&a1[v7[731]] |= 8u;
    *((_DWORD *)a1 + 18) = v77;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampFirstSeen"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v78, "doubleValue");
    objc_msgSend(a1, "setTimestampFirstSeen:");
  }

  a1 = a1;
LABEL_350:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDComponentReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOPDAttribution *attribution;
  NSMutableArray *values;
  NSMutableArray *versionDomains;
  __int16 v10;
  __int16 v11;
  GEOPDSource *source;
  NSMutableArray *commingledAttributions;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_64;
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 50);
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_type != *((_DWORD *)v4 + 22))
      goto LABEL_64;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_64;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 20))
      goto LABEL_64;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_64;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_ttl != *((_DWORD *)v4 + 21))
      goto LABEL_64;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_64;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_startIndex != *((_DWORD *)v4 + 19))
      goto LABEL_64;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_64;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) == 0 || self->_valuesAvailable != *((_DWORD *)v4 + 23))
      goto LABEL_64;
  }
  else if ((*((_WORD *)v4 + 50) & 0x100) != 0)
  {
    goto LABEL_64;
  }
  attribution = self->_attribution;
  if ((unint64_t)attribution | *((_QWORD *)v4 + 2) && !-[GEOPDAttribution isEqual:](attribution, "isEqual:"))
    goto LABEL_64;
  values = self->_values;
  if ((unint64_t)values | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](values, "isEqual:"))
      goto LABEL_64;
  }
  versionDomains = self->_versionDomains;
  if ((unint64_t)versionDomains | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](versionDomains, "isEqual:"))
      goto LABEL_64;
  }
  v10 = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 50);
  if ((v10 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0 || self->_version != *((_DWORD *)v4 + 24))
      goto LABEL_64;
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_64;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDSource isEqual:](source, "isEqual:"))
      goto LABEL_64;
    v10 = (__int16)self->_flags;
    v11 = *((_WORD *)v4 + 50);
  }
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_cacheControl != *((_DWORD *)v4 + 16))
      goto LABEL_64;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_64;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_componentId != *((_DWORD *)v4 + 17))
      goto LABEL_64;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_64;
  }
  commingledAttributions = self->_commingledAttributions;
  if ((unint64_t)commingledAttributions | *((_QWORD *)v4 + 3))
  {
    if (-[NSMutableArray isEqual:](commingledAttributions, "isEqual:"))
    {
      v10 = (__int16)self->_flags;
      v11 = *((_WORD *)v4 + 50);
      goto LABEL_54;
    }
LABEL_64:
    v14 = 0;
    goto LABEL_65;
  }
LABEL_54:
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_elevationModelUsed != *((_DWORD *)v4 + 18))
      goto LABEL_64;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_64;
  }
  if ((v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_timestampFirstSeen != *((double *)v4 + 5))
      goto LABEL_64;
    v14 = 1;
  }
  else
  {
    v14 = (v11 & 1) == 0;
  }
LABEL_65:

  return v14;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  double timestampFirstSeen;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    v25 = 2654435761 * self->_type;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_status;
      if ((flags & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v25 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_3;
  }
  v24 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_4:
    v23 = 2654435761 * self->_ttl;
    if ((flags & 0x10) != 0)
      goto LABEL_5;
LABEL_10:
    v22 = 0;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v23 = 0;
  if ((flags & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v22 = 2654435761 * self->_startIndex;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_6:
    v21 = 2654435761 * self->_valuesAvailable;
    goto LABEL_12;
  }
LABEL_11:
  v21 = 0;
LABEL_12:
  v20 = -[GEOPDAttribution hash](self->_attribution, "hash");
  v4 = -[NSMutableArray hash](self->_values, "hash");
  v5 = -[NSMutableArray hash](self->_versionDomains, "hash");
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
    v6 = 2654435761 * self->_version;
  else
    v6 = 0;
  v7 = -[GEOPDSource hash](self->_source, "hash");
  v8 = (__int16)self->_flags;
  if ((v8 & 2) != 0)
  {
    v9 = 2654435761 * self->_cacheControl;
    if ((v8 & 4) != 0)
      goto LABEL_17;
  }
  else
  {
    v9 = 0;
    if ((v8 & 4) != 0)
    {
LABEL_17:
      v10 = 2654435761 * self->_componentId;
      goto LABEL_20;
    }
  }
  v10 = 0;
LABEL_20:
  v11 = -[NSMutableArray hash](self->_commingledAttributions, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 8) != 0)
  {
    v13 = 2654435761 * self->_elevationModelUsed;
    if ((v12 & 1) != 0)
      goto LABEL_22;
LABEL_27:
    v18 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v18;
  }
  v13 = 0;
  if ((v12 & 1) == 0)
    goto LABEL_27;
LABEL_22:
  timestampFirstSeen = self->_timestampFirstSeen;
  v15 = -timestampFirstSeen;
  if (timestampFirstSeen >= 0.0)
    v15 = self->_timestampFirstSeen;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v18;
}

- (void)mergeFrom:(uint64_t)a1
{
  _WORD *v3;
  id v4;
  __int16 v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  _DWORD *v20;
  void *v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  __int16 v29;
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
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_60;
  v5 = v3[50];
  if ((v5 & 0x80) != 0)
  {
    *(_DWORD *)(a1 + 88) = *((_DWORD *)v3 + 22);
    *(_WORD *)(a1 + 100) |= 0x80u;
    v5 = v3[50];
    if ((v5 & 0x20) == 0)
    {
LABEL_4:
      if ((v5 & 0x40) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 80) = *((_DWORD *)v3 + 20);
  *(_WORD *)(a1 + 100) |= 0x20u;
  v5 = v3[50];
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
LABEL_14:
    *(_DWORD *)(a1 + 76) = *((_DWORD *)v3 + 19);
    *(_WORD *)(a1 + 100) |= 0x10u;
    if ((v3[50] & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *(_DWORD *)(a1 + 84) = *((_DWORD *)v3 + 21);
  *(_WORD *)(a1 + 100) |= 0x40u;
  v5 = v3[50];
  if ((v5 & 0x10) != 0)
    goto LABEL_14;
LABEL_6:
  if ((v5 & 0x100) != 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 92) = *((_DWORD *)v3 + 23);
    *(_WORD *)(a1 + 100) |= 0x100u;
  }
LABEL_8:
  v6 = *(_QWORD *)(a1 + 16);
  v7 = (void *)*((_QWORD *)v4 + 2);
  if (v6)
  {
    if (v7)
      -[GEOPDAttribution mergeFrom:](v6, v7);
  }
  else if (v7)
  {
    -[GEOPDComponent setAttribution:](a1, v7);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = *((id *)v4 + 6);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        -[GEOPDComponent addValue:](a1, *(void **)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v10);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = *((id *)v4 + 7);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        -[GEOPDComponent addVersionDomain:](a1, *(void **)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v15);
  }

  if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    *(_DWORD *)(a1 + 96) = *((_DWORD *)v4 + 24);
    *(_WORD *)(a1 + 100) |= 0x200u;
  }
  v18 = *(_QWORD *)(a1 + 32);
  v19 = (void *)*((_QWORD *)v4 + 4);
  if (v18)
  {
    if (v19)
    {
      v20 = v19;
      -[GEOPDSource readAll:]((uint64_t)v20, 0);
      if ((v20[14] & 1) != 0)
      {
        *(_DWORD *)(v18 + 52) = v20[13];
        *(_BYTE *)(v18 + 56) |= 1u;
      }
      v21 = (void *)*((_QWORD *)v20 + 3);
      if (v21)
        -[GEOPDSource setSourceId:](v18, v21);
      v22 = (void *)*((_QWORD *)v20 + 4);
      if (v22)
        -[GEOPDSource setVersion:](v18, v22);

    }
  }
  else if (v19)
  {
    -[GEOPDComponent setSource:](a1, v19);
  }
  v23 = *((_WORD *)v4 + 50);
  if ((v23 & 2) != 0)
  {
    *(_DWORD *)(a1 + 64) = *((_DWORD *)v4 + 16);
    *(_WORD *)(a1 + 100) |= 2u;
    v23 = *((_WORD *)v4 + 50);
  }
  if ((v23 & 4) != 0)
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v4 + 17);
    *(_WORD *)(a1 + 100) |= 4u;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = *((id *)v4 + 3);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(v24);
        -[GEOPDComponent addCommingledAttributions:](a1, *(void **)(*((_QWORD *)&v30 + 1) + 8 * k));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v26);
  }

  v29 = *((_WORD *)v4 + 50);
  if ((v29 & 8) != 0)
  {
    *(_DWORD *)(a1 + 72) = *((_DWORD *)v4 + 18);
    *(_WORD *)(a1 + 100) |= 8u;
    v29 = *((_WORD *)v4 + 50);
  }
  if ((v29 & 1) != 0)
  {
    *(_QWORD *)(a1 + 40) = *((_QWORD *)v4 + 5);
    *(_WORD *)(a1 + 100) |= 1u;
  }
LABEL_60:

}

- (double)timestampFirstSeen
{
  return self->_timestampFirstSeen;
}

- (void)setHasTimestampFirstSeen:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

@end
