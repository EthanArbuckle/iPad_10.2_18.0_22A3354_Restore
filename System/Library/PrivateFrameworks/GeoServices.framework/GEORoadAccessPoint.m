@implementation GEORoadAccessPoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  $D6763CC4B884D04D31D396FEECC92818 flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 52) = self->_isApproximate;
  *(_BYTE *)(v5 + 56) |= 0x80u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
LABEL_3:
    *(_DWORD *)(v5 + 24) = self->_cyclingDirection;
    *(_BYTE *)(v5 + 56) |= 1u;
    *(_BYTE *)&flags = self->_flags;
  }
LABEL_4:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_drivingDirection;
    *(_BYTE *)(v5 + 56) |= 2u;
    *(_BYTE *)&flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_6:
      if ((*(_BYTE *)&flags & 0x40) == 0)
        goto LABEL_7;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 44) = self->_transitDirection;
  *(_BYTE *)(v5 + 56) |= 0x20u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 48) = self->_walkingDirection;
  *(_BYTE *)(v5 + 56) |= 0x40u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_9;
LABEL_16:
    *(_DWORD *)(v5 + 36) = self->_significance;
    *(_BYTE *)(v5 + 56) |= 8u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_15:
  *(_DWORD *)(v5 + 32) = self->_parkingDirection;
  *(_BYTE *)(v5 + 56) |= 4u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
    goto LABEL_16;
LABEL_9:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 40) = self->_source;
    *(_BYTE *)(v5 + 56) |= 0x10u;
  }
LABEL_11:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4;
  $D6763CC4B884D04D31D396FEECC92818 flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
LABEL_5:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    *(_BYTE *)&flags = self->_flags;
  }
LABEL_6:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    *(_BYTE *)&flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&flags & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_11;
LABEL_18:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
    goto LABEL_18;
LABEL_11:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_13:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)isApproximate
{
  return self->_isApproximate;
}

- (void)setIsApproximate:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x80u;
  self->_isApproximate = a3;
}

- (void)setHasIsApproximate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
}

- (BOOL)hasIsApproximate
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)cyclingDirection
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_cyclingDirection;
  else
    return 0;
}

- (void)setCyclingDirection:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_cyclingDirection = a3;
}

- (void)setHasCyclingDirection:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCyclingDirection
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)cyclingDirectionAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C13C60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCyclingDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DESTINATION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)drivingDirection
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_drivingDirection;
  else
    return 0;
}

- (void)setDrivingDirection:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_drivingDirection = a3;
}

- (void)setHasDrivingDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDrivingDirection
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)drivingDirectionAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C13C60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDrivingDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DESTINATION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)transitDirection
{
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    return self->_transitDirection;
  else
    return 0;
}

- (void)setTransitDirection:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_transitDirection = a3;
}

- (void)setHasTransitDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasTransitDirection
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)transitDirectionAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C13C60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransitDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DESTINATION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)walkingDirection
{
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    return self->_walkingDirection;
  else
    return 0;
}

- (void)setWalkingDirection:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_walkingDirection = a3;
}

- (void)setHasWalkingDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasWalkingDirection
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)walkingDirectionAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C13C60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWalkingDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DESTINATION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)parkingDirection
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_parkingDirection;
  else
    return 0;
}

- (void)setParkingDirection:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_parkingDirection = a3;
}

- (void)setHasParkingDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasParkingDirection
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)parkingDirectionAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C13C60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParkingDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DESTINATION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)significance
{
  return self->_significance;
}

- (void)setSignificance:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_significance = a3;
}

- (void)setHasSignificance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasSignificance
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)source
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C13C88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BASEMAP_CURATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REVGEO_CALCULATED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEMINI_CURATED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ACCESS_POINT_SERVICE_CURATED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

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
  v8.super_class = (Class)GEORoadAccessPoint;
  -[GEORoadAccessPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoadAccessPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoadAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

  }
  v8 = *(char *)(a1 + 56);
  if (v8 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("isApproximate"));

    LOBYTE(v8) = *(_BYTE *)(a1 + 56);
    if ((v8 & 1) == 0)
    {
LABEL_9:
      if ((v8 & 2) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((v8 & 1) == 0)
  {
    goto LABEL_9;
  }
  v10 = *(int *)(a1 + 24);
  if (v10 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E1C13C60[v10];
  }
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("cyclingDirection"));

  LOBYTE(v8) = *(_BYTE *)(a1 + 56);
  if ((v8 & 2) == 0)
  {
LABEL_10:
    if ((v8 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_21:
  v12 = *(int *)(a1 + 28);
  if (v12 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E1C13C60[v12];
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("drivingDirection"));

  LOBYTE(v8) = *(_BYTE *)(a1 + 56);
  if ((v8 & 0x20) == 0)
  {
LABEL_11:
    if ((v8 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_25:
  v14 = *(int *)(a1 + 44);
  if (v14 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E1C13C60[v14];
  }
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("transitDirection"));

  LOBYTE(v8) = *(_BYTE *)(a1 + 56);
  if ((v8 & 0x40) == 0)
  {
LABEL_12:
    if ((v8 & 4) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_29:
  v16 = *(int *)(a1 + 48);
  if (v16 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 48));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E1C13C60[v16];
  }
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("walkingDirection"));

  LOBYTE(v8) = *(_BYTE *)(a1 + 56);
  if ((v8 & 4) == 0)
  {
LABEL_13:
    if ((v8 & 8) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_33:
  v18 = *(int *)(a1 + 32);
  if (v18 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E1C13C60[v18];
  }
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("parkingDirection"));

  LOBYTE(v8) = *(_BYTE *)(a1 + 56);
  if ((v8 & 8) == 0)
  {
LABEL_14:
    if ((v8 & 0x10) == 0)
      goto LABEL_42;
LABEL_38:
    v21 = *(int *)(a1 + 40);
    if (v21 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C13C88[v21];
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("source"));

    goto LABEL_42;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("significance"));

  if ((*(_BYTE *)(a1 + 56) & 0x10) != 0)
    goto LABEL_38;
LABEL_42:
  v23 = *(void **)(a1 + 8);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __48__GEORoadAccessPoint__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoadAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORoadAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORoadAccessPoint)initWithDictionary:(id)a3
{
  return (GEORoadAccessPoint *)-[GEORoadAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
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
        objc_msgSend(a1, "setLocation:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isApproximate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsApproximate:", objc_msgSend(v10, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cyclingDirection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
        {
          v13 = 2;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
        {
          v13 = 3;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("DESTINATION")))
        {
          v13 = 4;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_26;
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setCyclingDirection:", v13);
LABEL_26:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("drivingDirection"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v16 = 0;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
        {
          v16 = 1;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
        {
          v16 = 2;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
        {
          v16 = 3;
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("DESTINATION")))
        {
          v16 = 4;
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
          goto LABEL_42;
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setDrivingDirection:", v16);
LABEL_42:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitDirection"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v19 = 0;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
        {
          v19 = 1;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
        {
          v19 = 2;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
        {
          v19 = 3;
        }
        else if (objc_msgSend(v18, "isEqualToString:", CFSTR("DESTINATION")))
        {
          v19 = 4;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_58;
        v19 = objc_msgSend(v17, "intValue");
      }
      objc_msgSend(a1, "setTransitDirection:", v19);
LABEL_58:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkingDirection"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v22 = 0;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
        {
          v22 = 1;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
        {
          v22 = 2;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
        {
          v22 = 3;
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("DESTINATION")))
        {
          v22 = 4;
        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_74;
        v22 = objc_msgSend(v20, "intValue");
      }
      objc_msgSend(a1, "setWalkingDirection:", v22);
LABEL_74:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parkingDirection"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v23;
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v25 = 0;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ENTRY")) & 1) != 0)
        {
          v25 = 1;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("EXIT")) & 1) != 0)
        {
          v25 = 2;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ENTRY_EXIT")) & 1) != 0)
        {
          v25 = 3;
        }
        else if (objc_msgSend(v24, "isEqualToString:", CFSTR("DESTINATION")))
        {
          v25 = 4;
        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_90;
        v25 = objc_msgSend(v23, "intValue");
      }
      objc_msgSend(a1, "setParkingDirection:", v25);
LABEL_90:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("significance"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSignificance:", objc_msgSend(v26, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v27;
        if ((objc_msgSend(v28, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v29 = 0;
        }
        else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("BASEMAP_CURATED")) & 1) != 0)
        {
          v29 = 1;
        }
        else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("REVGEO_CALCULATED")) & 1) != 0)
        {
          v29 = 2;
        }
        else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("GEMINI_CURATED")) & 1) != 0)
        {
          v29 = 3;
        }
        else if (objc_msgSend(v28, "isEqualToString:", CFSTR("ACCESS_POINT_SERVICE_CURATED")))
        {
          v29 = 4;
        }
        else
        {
          v29 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_108:

          goto LABEL_109;
        }
        v29 = objc_msgSend(v27, "intValue");
      }
      objc_msgSend(a1, "setSource:", v29);
      goto LABEL_108;
    }
  }
LABEL_109:

  return a1;
}

- (GEORoadAccessPoint)initWithJSON:(id)a3
{
  return (GEORoadAccessPoint *)-[GEORoadAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoadAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoadAccessPointReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  $D6763CC4B884D04D31D396FEECC92818 flags;
  id v5;

  v5 = a3;
  -[GEORoadAccessPoint readAll:](self, "readAll:", 0);
  if (self->_location)
    objc_msgSend(v5, "setLocation:");
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  *((_BYTE *)v5 + 52) = self->_isApproximate;
  *((_BYTE *)v5 + 56) |= 0x80u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 6) = self->_cyclingDirection;
    *((_BYTE *)v5 + 56) |= 1u;
    *(_BYTE *)&flags = self->_flags;
  }
LABEL_6:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_drivingDirection;
    *((_BYTE *)v5 + 56) |= 2u;
    *(_BYTE *)&flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&flags & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_8;
  }
  *((_DWORD *)v5 + 11) = self->_transitDirection;
  *((_BYTE *)v5 + 56) |= 0x20u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 12) = self->_walkingDirection;
  *((_BYTE *)v5 + 56) |= 0x40u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_11;
LABEL_18:
    *((_DWORD *)v5 + 9) = self->_significance;
    *((_BYTE *)v5 + 56) |= 8u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_17:
  *((_DWORD *)v5 + 8) = self->_parkingDirection;
  *((_BYTE *)v5 + 56) |= 4u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
    goto LABEL_18;
LABEL_11:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v5 + 10) = self->_source;
    *((_BYTE *)v5 + 56) |= 0x10u;
  }
LABEL_13:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *location;
  $D6763CC4B884D04D31D396FEECC92818 flags;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  -[GEORoadAccessPoint readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
      goto LABEL_46;
  }
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x80) == 0)
      goto LABEL_6;
LABEL_46:
    v7 = 0;
    goto LABEL_47;
  }
  if ((*((_BYTE *)v4 + 56) & 0x80) == 0)
    goto LABEL_46;
  if (self->_isApproximate)
  {
    if (!*((_BYTE *)v4 + 52))
      goto LABEL_46;
  }
  else if (*((_BYTE *)v4 + 52))
  {
    goto LABEL_46;
  }
LABEL_6:
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_cyclingDirection != *((_DWORD *)v4 + 6))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_drivingDirection != *((_DWORD *)v4 + 7))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_transitDirection != *((_DWORD *)v4 + 11))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0 || self->_walkingDirection != *((_DWORD *)v4 + 12))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_parkingDirection != *((_DWORD *)v4 + 8))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_significance != *((_DWORD *)v4 + 9))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_46;
  }
  v7 = (*((_BYTE *)v4 + 56) & 0x10) == 0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_source != *((_DWORD *)v4 + 10))
      goto LABEL_46;
    v7 = 1;
  }
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[GEORoadAccessPoint readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    v4 = 2654435761 * self->_isApproximate;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
LABEL_3:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
  }
  v5 = 2654435761 * self->_cyclingDirection;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_drivingDirection;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_transitDirection;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_walkingDirection;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_parkingDirection;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_8;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_9;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  v9 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_16;
LABEL_8:
  v10 = 2654435761 * self->_significance;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_17;
LABEL_9:
  v11 = 2654435761 * self->_source;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *location;
  uint64_t v5;
  int v6;
  char *v7;

  v7 = (char *)a3;
  objc_msgSend(v7, "readAll:", 0);
  location = self->_location;
  v5 = *((_QWORD *)v7 + 2);
  if (location)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORoadAccessPoint setLocation:](self, "setLocation:");
  }
  v6 = v7[56];
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_isApproximate = v7[52];
  *(_BYTE *)&self->_flags |= 0x80u;
  LOBYTE(v6) = v7[56];
  if ((v6 & 1) != 0)
  {
LABEL_8:
    self->_cyclingDirection = *((_DWORD *)v7 + 6);
    *(_BYTE *)&self->_flags |= 1u;
    LOBYTE(v6) = v7[56];
  }
LABEL_9:
  if ((v6 & 2) != 0)
  {
    self->_drivingDirection = *((_DWORD *)v7 + 7);
    *(_BYTE *)&self->_flags |= 2u;
    LOBYTE(v6) = v7[56];
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_transitDirection = *((_DWORD *)v7 + 11);
  *(_BYTE *)&self->_flags |= 0x20u;
  LOBYTE(v6) = v7[56];
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_19:
  self->_walkingDirection = *((_DWORD *)v7 + 12);
  *(_BYTE *)&self->_flags |= 0x40u;
  LOBYTE(v6) = v7[56];
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 8) == 0)
      goto LABEL_14;
LABEL_21:
    self->_significance = *((_DWORD *)v7 + 9);
    *(_BYTE *)&self->_flags |= 8u;
    if ((v7[56] & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_20:
  self->_parkingDirection = *((_DWORD *)v7 + 8);
  *(_BYTE *)&self->_flags |= 4u;
  LOBYTE(v6) = v7[56];
  if ((v6 & 8) != 0)
    goto LABEL_21;
LABEL_14:
  if ((v6 & 0x10) != 0)
  {
LABEL_15:
    self->_source = *((_DWORD *)v7 + 10);
    *(_BYTE *)&self->_flags |= 0x10u;
  }
LABEL_16:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORoadAccessPoint readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_location, "clearUnknownFields:", 1);
  }
}

@end
