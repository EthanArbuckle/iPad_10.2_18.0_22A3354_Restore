@implementation MSPTransitStorageLine

- (MSPTransitStorageLine)initWithLine:(id)a3
{
  id v4;
  MSPTransitStorageLine *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  MSPTransitStorageSystem *v12;
  void *v13;
  MSPTransitStorageSystem *v14;
  void *v15;
  MSPTransitStorageArtwork *v16;
  void *v17;
  MSPTransitStorageArtwork *v18;
  void *v19;
  MSPTransitStorageArtwork *v20;
  void *v21;
  MSPTransitStorageArtwork *v22;
  void *v23;
  MSPTransitStorageArtwork *v24;
  void *v25;
  MSPTransitStorageArtwork *v26;
  void *v27;
  MSPTransitStorageArtwork *v28;
  void *v29;
  MSPTransitStorageArtwork *v30;
  MSPTransitStorageLine *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSPTransitStorageLine;
  v5 = -[MSPTransitStorageLine init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageLine setMuid:](v5, "setMuid:", objc_msgSend(v6, "muid"));
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageLine setName:](v5, "setName:", v7);

    objc_msgSend(v4, "lineColorString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageLine setLineColorString:](v5, "setLineColorString:", v8);

    if (objc_msgSend(v6, "hasCoordinate"))
    {
      v9 = objc_alloc(MEMORY[0x1E0D27140]);
      objc_msgSend(v6, "coordinate");
      v10 = (void *)objc_msgSend(v9, "initWithCoordinate:");
      -[MSPTransitStorageLine setLocationHint:](v5, "setLocationHint:", v10);

    }
    objc_msgSend(v4, "system");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = [MSPTransitStorageSystem alloc];
      objc_msgSend(v4, "system");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[MSPTransitStorageSystem initWithSystem:](v12, "initWithSystem:", v13);
      -[MSPTransitStorageLine setSystem:](v5, "setSystem:", v14);

    }
    objc_msgSend(v4, "artwork");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [MSPTransitStorageArtwork alloc];
      objc_msgSend(v4, "artwork");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MSPTransitStorageArtwork initWithArtwork:](v16, "initWithArtwork:", v17);
      -[MSPTransitStorageLine setArtwork:](v5, "setArtwork:", v18);

    }
    objc_msgSend(v4, "modeArtwork");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = [MSPTransitStorageArtwork alloc];
      objc_msgSend(v4, "modeArtwork");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MSPTransitStorageArtwork initWithArtwork:](v20, "initWithArtwork:", v21);
      -[MSPTransitStorageLine setModeArtwork:](v5, "setModeArtwork:", v22);

    }
    objc_msgSend(v4, "alternateArtwork");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = [MSPTransitStorageArtwork alloc];
      objc_msgSend(v4, "alternateArtwork");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[MSPTransitStorageArtwork initWithArtwork:](v24, "initWithArtwork:", v25);
      -[MSPTransitStorageLine setAlternateArtwork:](v5, "setAlternateArtwork:", v26);

    }
    objc_msgSend(v4, "headerArtwork");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = [MSPTransitStorageArtwork alloc];
      objc_msgSend(v4, "headerArtwork");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[MSPTransitStorageArtwork initWithArtwork:](v28, "initWithArtwork:", v29);
      -[MSPTransitStorageLine setHeaderArtwork:](v5, "setHeaderArtwork:", v30);

    }
    v31 = v5;

  }
  return v5;
}

- (GEOMapItemIdentifier)identifier
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D271C0]);
  v4 = -[MSPTransitStorageLine muid](self, "muid");
  if (-[MSPTransitStorageLine hasLocationHint](self, "hasLocationHint"))
  {
    -[MSPTransitStorageLine locationHint](self, "locationHint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    v6 = (void *)objc_msgSend(v3, "initWithMUID:resultProviderID:coordinate:", v4, 0);

  }
  else
  {
    v6 = (void *)objc_msgSend(v3, "initWithMUID:resultProviderID:coordinate:", v4, 0, -180.0, -180.0);
  }
  return (GEOMapItemIdentifier *)v6;
}

- (unint64_t)departureTimeDisplayStyle
{
  return 0;
}

- (NSArray)operatingHours
{
  return 0;
}

- (BOOL)showVehicleNumber
{
  return 0;
}

- (BOOL)departuresAreVehicleSpecific
{
  return 0;
}

- (BOOL)isBus
{
  return 0;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasLineColorString
{
  return self->_lineColorString != 0;
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (BOOL)hasModeArtwork
{
  return self->_modeArtwork != 0;
}

- (BOOL)hasSystem
{
  return self->_system != 0;
}

- (BOOL)hasAlternateArtwork
{
  return self->_alternateArtwork != 0;
}

- (BOOL)hasLocationHint
{
  return self->_locationHint != 0;
}

- (BOOL)hasHeaderArtwork
{
  return self->_headerArtwork != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageLine;
  -[MSPTransitStorageLine description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageLine dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *lineColorString;
  MSPTransitStorageArtwork *artwork;
  void *v8;
  MSPTransitStorageArtwork *modeArtwork;
  void *v10;
  MSPTransitStorageSystem *system;
  void *v12;
  MSPTransitStorageArtwork *alternateArtwork;
  void *v14;
  GEOLatLng *locationHint;
  void *v16;
  MSPTransitStorageArtwork *headerArtwork;
  void *v18;
  PBUnknownFields *unknownFields;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_muid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("muid"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  lineColorString = self->_lineColorString;
  if (lineColorString)
    objc_msgSend(v3, "setObject:forKey:", lineColorString, CFSTR("line_color_string"));
  artwork = self->_artwork;
  if (artwork)
  {
    -[MSPTransitStorageArtwork dictionaryRepresentation](artwork, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("artwork"));

  }
  modeArtwork = self->_modeArtwork;
  if (modeArtwork)
  {
    -[MSPTransitStorageArtwork dictionaryRepresentation](modeArtwork, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("mode_artwork"));

  }
  system = self->_system;
  if (system)
  {
    -[MSPTransitStorageSystem dictionaryRepresentation](system, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("system"));

  }
  alternateArtwork = self->_alternateArtwork;
  if (alternateArtwork)
  {
    -[MSPTransitStorageArtwork dictionaryRepresentation](alternateArtwork, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("alternate_artwork"));

  }
  locationHint = self->_locationHint;
  if (locationHint)
  {
    -[GEOLatLng dictionaryRepresentation](locationHint, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("location_hint"));

  }
  headerArtwork = self->_headerArtwork;
  if (headerArtwork)
  {
    -[MSPTransitStorageArtwork dictionaryRepresentation](headerArtwork, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("header_artwork"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageLineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_lineColorString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_artwork)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_modeArtwork)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_system)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_alternateArtwork)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_locationHint)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_headerArtwork)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_muid;
    *((_BYTE *)v4 + 88) |= 1u;
  }
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_lineColorString)
  {
    objc_msgSend(v5, "setLineColorString:");
    v4 = v5;
  }
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
    v4 = v5;
  }
  if (self->_modeArtwork)
  {
    objc_msgSend(v5, "setModeArtwork:");
    v4 = v5;
  }
  if (self->_system)
  {
    objc_msgSend(v5, "setSystem:");
    v4 = v5;
  }
  if (self->_alternateArtwork)
  {
    objc_msgSend(v5, "setAlternateArtwork:");
    v4 = v5;
  }
  if (self->_locationHint)
  {
    objc_msgSend(v5, "setLocationHint:");
    v4 = v5;
  }
  if (self->_headerArtwork)
  {
    objc_msgSend(v5, "setHeaderArtwork:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_muid;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v7;

  v9 = -[NSString copyWithZone:](self->_lineColorString, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  v11 = -[MSPTransitStorageArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v13 = -[MSPTransitStorageArtwork copyWithZone:](self->_modeArtwork, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = -[MSPTransitStorageSystem copyWithZone:](self->_system, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v15;

  v17 = -[MSPTransitStorageArtwork copyWithZone:](self->_alternateArtwork, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v17;

  v19 = -[GEOLatLng copyWithZone:](self->_locationHint, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v19;

  v21 = -[MSPTransitStorageArtwork copyWithZone:](self->_headerArtwork, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v21;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *lineColorString;
  MSPTransitStorageArtwork *artwork;
  MSPTransitStorageArtwork *modeArtwork;
  MSPTransitStorageSystem *system;
  MSPTransitStorageArtwork *alternateArtwork;
  GEOLatLng *locationHint;
  MSPTransitStorageArtwork *headerArtwork;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_23;
  lineColorString = self->_lineColorString;
  if ((unint64_t)lineColorString | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](lineColorString, "isEqual:"))
      goto LABEL_23;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 4))
  {
    if (!-[MSPTransitStorageArtwork isEqual:](artwork, "isEqual:"))
      goto LABEL_23;
  }
  modeArtwork = self->_modeArtwork;
  if ((unint64_t)modeArtwork | *((_QWORD *)v4 + 8))
  {
    if (!-[MSPTransitStorageArtwork isEqual:](modeArtwork, "isEqual:"))
      goto LABEL_23;
  }
  system = self->_system;
  if ((unint64_t)system | *((_QWORD *)v4 + 10))
  {
    if (!-[MSPTransitStorageSystem isEqual:](system, "isEqual:"))
      goto LABEL_23;
  }
  alternateArtwork = self->_alternateArtwork;
  if ((unint64_t)alternateArtwork | *((_QWORD *)v4 + 3))
  {
    if (!-[MSPTransitStorageArtwork isEqual:](alternateArtwork, "isEqual:"))
      goto LABEL_23;
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](locationHint, "isEqual:"))
      goto LABEL_23;
  }
  headerArtwork = self->_headerArtwork;
  if ((unint64_t)headerArtwork | *((_QWORD *)v4 + 5))
    v13 = -[MSPTransitStorageArtwork isEqual:](headerArtwork, "isEqual:");
  else
    v13 = 1;
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[NSString hash](self->_lineColorString, "hash");
  v6 = v4 ^ v5 ^ -[MSPTransitStorageArtwork hash](self->_artwork, "hash");
  v7 = -[MSPTransitStorageArtwork hash](self->_modeArtwork, "hash");
  v8 = v7 ^ -[MSPTransitStorageSystem hash](self->_system, "hash");
  v9 = v6 ^ v8 ^ -[MSPTransitStorageArtwork hash](self->_alternateArtwork, "hash");
  v10 = -[GEOLatLng hash](self->_locationHint, "hash");
  return v9 ^ v10 ^ -[MSPTransitStorageArtwork hash](self->_headerArtwork, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  MSPTransitStorageArtwork *artwork;
  uint64_t v7;
  MSPTransitStorageArtwork *modeArtwork;
  uint64_t v9;
  MSPTransitStorageSystem *system;
  uint64_t v11;
  MSPTransitStorageArtwork *alternateArtwork;
  uint64_t v13;
  GEOLatLng *locationHint;
  uint64_t v15;
  MSPTransitStorageArtwork *headerArtwork;
  uint64_t v17;
  _QWORD *v18;

  v4 = a3;
  v5 = v4;
  if ((v4[11] & 1) != 0)
  {
    self->_muid = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  v18 = v4;
  if (v4[9])
  {
    -[MSPTransitStorageLine setName:](self, "setName:");
    v5 = v18;
  }
  if (v5[6])
  {
    -[MSPTransitStorageLine setLineColorString:](self, "setLineColorString:");
    v5 = v18;
  }
  artwork = self->_artwork;
  v7 = v5[4];
  if (artwork)
  {
    if (!v7)
      goto LABEL_13;
    -[MSPTransitStorageArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[MSPTransitStorageLine setArtwork:](self, "setArtwork:");
  }
  v5 = v18;
LABEL_13:
  modeArtwork = self->_modeArtwork;
  v9 = v5[8];
  if (modeArtwork)
  {
    if (!v9)
      goto LABEL_19;
    -[MSPTransitStorageArtwork mergeFrom:](modeArtwork, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[MSPTransitStorageLine setModeArtwork:](self, "setModeArtwork:");
  }
  v5 = v18;
LABEL_19:
  system = self->_system;
  v11 = v5[10];
  if (system)
  {
    if (!v11)
      goto LABEL_25;
    -[MSPTransitStorageSystem mergeFrom:](system, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_25;
    -[MSPTransitStorageLine setSystem:](self, "setSystem:");
  }
  v5 = v18;
LABEL_25:
  alternateArtwork = self->_alternateArtwork;
  v13 = v5[3];
  if (alternateArtwork)
  {
    if (!v13)
      goto LABEL_31;
    -[MSPTransitStorageArtwork mergeFrom:](alternateArtwork, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_31;
    -[MSPTransitStorageLine setAlternateArtwork:](self, "setAlternateArtwork:");
  }
  v5 = v18;
LABEL_31:
  locationHint = self->_locationHint;
  v15 = v5[7];
  if (locationHint)
  {
    if (!v15)
      goto LABEL_37;
    -[GEOLatLng mergeFrom:](locationHint, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_37;
    -[MSPTransitStorageLine setLocationHint:](self, "setLocationHint:");
  }
  v5 = v18;
LABEL_37:
  headerArtwork = self->_headerArtwork;
  v17 = v5[5];
  if (headerArtwork)
  {
    if (v17)
    {
      -[MSPTransitStorageArtwork mergeFrom:](headerArtwork, "mergeFrom:");
LABEL_42:
      v5 = v18;
    }
  }
  else if (v17)
  {
    -[MSPTransitStorageLine setHeaderArtwork:](self, "setHeaderArtwork:");
    goto LABEL_42;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)lineColorString
{
  return self->_lineColorString;
}

- (void)setLineColorString:(id)a3
{
  objc_storeStrong((id *)&self->_lineColorString, a3);
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)self->_modeArtwork;
}

- (void)setModeArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_modeArtwork, a3);
}

- (GEOTransitSystem)system
{
  return (GEOTransitSystem *)self->_system;
}

- (void)setSystem:(id)a3
{
  objc_storeStrong((id *)&self->_system, a3);
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)self->_alternateArtwork;
}

- (void)setAlternateArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_alternateArtwork, a3);
}

- (GEOLatLng)locationHint
{
  return self->_locationHint;
}

- (void)setLocationHint:(id)a3
{
  objc_storeStrong((id *)&self->_locationHint, a3);
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)self->_headerArtwork;
}

- (void)setHeaderArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_headerArtwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modeArtwork, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_lineColorString, 0);
  objc_storeStrong((id *)&self->_headerArtwork, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_alternateArtwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
