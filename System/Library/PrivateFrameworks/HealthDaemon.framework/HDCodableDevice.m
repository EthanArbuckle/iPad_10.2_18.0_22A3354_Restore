@implementation HDCodableDevice

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (BOOL)hasHardwareVersion
{
  return self->_hardwareVersion != 0;
}

- (BOOL)hasFirmwareVersion
{
  return self->_firmwareVersion != 0;
}

- (BOOL)hasSoftwareVersion
{
  return self->_softwareVersion != 0;
}

- (BOOL)hasLocalIdentifier
{
  return self->_localIdentifier != 0;
}

- (BOOL)hasFDAUDI
{
  return self->_fDAUDI != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableDevice;
  -[HDCodableDevice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *manufacturer;
  NSString *model;
  NSString *hardwareVersion;
  NSString *firmwareVersion;
  NSString *softwareVersion;
  NSString *localIdentifier;
  NSString *fDAUDI;
  NSData *uuid;
  void *v14;
  HDCodableSyncIdentity *syncIdentity;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  manufacturer = self->_manufacturer;
  if (manufacturer)
    objc_msgSend(v4, "setObject:forKey:", manufacturer, CFSTR("manufacturer"));
  model = self->_model;
  if (model)
    objc_msgSend(v4, "setObject:forKey:", model, CFSTR("model"));
  hardwareVersion = self->_hardwareVersion;
  if (hardwareVersion)
    objc_msgSend(v4, "setObject:forKey:", hardwareVersion, CFSTR("hardwareVersion"));
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion)
    objc_msgSend(v4, "setObject:forKey:", firmwareVersion, CFSTR("firmwareVersion"));
  softwareVersion = self->_softwareVersion;
  if (softwareVersion)
    objc_msgSend(v4, "setObject:forKey:", softwareVersion, CFSTR("softwareVersion"));
  localIdentifier = self->_localIdentifier;
  if (localIdentifier)
    objc_msgSend(v4, "setObject:forKey:", localIdentifier, CFSTR("localIdentifier"));
  fDAUDI = self->_fDAUDI;
  if (fDAUDI)
    objc_msgSend(v4, "setObject:forKey:", fDAUDI, CFSTR("FDAUDI"));
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v4, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("creationDate"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_manufacturer)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hardwareVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_firmwareVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_softwareVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_localIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_fDAUDI)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_manufacturer)
  {
    objc_msgSend(v5, "setManufacturer:");
    v4 = v5;
  }
  if (self->_model)
  {
    objc_msgSend(v5, "setModel:");
    v4 = v5;
  }
  if (self->_hardwareVersion)
  {
    objc_msgSend(v5, "setHardwareVersion:");
    v4 = v5;
  }
  if (self->_firmwareVersion)
  {
    objc_msgSend(v5, "setFirmwareVersion:");
    v4 = v5;
  }
  if (self->_softwareVersion)
  {
    objc_msgSend(v5, "setSoftwareVersion:");
    v4 = v5;
  }
  if (self->_localIdentifier)
  {
    objc_msgSend(v5, "setLocalIdentifier:");
    v4 = v5;
  }
  if (self->_fDAUDI)
  {
    objc_msgSend(v5, "setFDAUDI:");
    v4 = v5;
  }
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_manufacturer, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_hardwareVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_firmwareVersion, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[NSString copyWithZone:](self->_softwareVersion, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[NSString copyWithZone:](self->_localIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  v20 = -[NSString copyWithZone:](self->_fDAUDI, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;

  v22 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v22;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v24 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *manufacturer;
  NSString *model;
  NSString *hardwareVersion;
  NSString *firmwareVersion;
  NSString *softwareVersion;
  NSString *localIdentifier;
  NSString *fDAUDI;
  NSData *uuid;
  HDCodableSyncIdentity *syncIdentity;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_27;
  }
  manufacturer = self->_manufacturer;
  if ((unint64_t)manufacturer | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](manufacturer, "isEqual:"))
      goto LABEL_27;
  }
  model = self->_model;
  if ((unint64_t)model | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](model, "isEqual:"))
      goto LABEL_27;
  }
  hardwareVersion = self->_hardwareVersion;
  if ((unint64_t)hardwareVersion | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](hardwareVersion, "isEqual:"))
      goto LABEL_27;
  }
  firmwareVersion = self->_firmwareVersion;
  if ((unint64_t)firmwareVersion | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](firmwareVersion, "isEqual:"))
      goto LABEL_27;
  }
  softwareVersion = self->_softwareVersion;
  if ((unint64_t)softwareVersion | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](softwareVersion, "isEqual:"))
      goto LABEL_27;
  }
  localIdentifier = self->_localIdentifier;
  if ((unint64_t)localIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](localIdentifier, "isEqual:"))
      goto LABEL_27;
  }
  fDAUDI = self->_fDAUDI;
  if ((unint64_t)fDAUDI | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](fDAUDI, "isEqual:"))
      goto LABEL_27;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
LABEL_27:
    v15 = 0;
    goto LABEL_28;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 10))
    v15 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v15 = 1;
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  double creationDate;
  double v14;
  long double v15;
  double v16;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_manufacturer, "hash");
  v5 = -[NSString hash](self->_model, "hash");
  v6 = -[NSString hash](self->_hardwareVersion, "hash");
  v7 = -[NSString hash](self->_firmwareVersion, "hash");
  v8 = -[NSString hash](self->_softwareVersion, "hash");
  v9 = -[NSString hash](self->_localIdentifier, "hash");
  v10 = -[NSString hash](self->_fDAUDI, "hash");
  v11 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    creationDate = self->_creationDate;
    v14 = -creationDate;
    if (creationDate >= 0.0)
      v14 = self->_creationDate;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v6;
  double *v7;

  v4 = (double *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableDevice setName:](self, "setName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableDevice setManufacturer:](self, "setManufacturer:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableDevice setModel:](self, "setModel:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableDevice setHardwareVersion:](self, "setHardwareVersion:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableDevice setFirmwareVersion:](self, "setFirmwareVersion:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCodableDevice setSoftwareVersion:](self, "setSoftwareVersion:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableDevice setLocalIdentifier:](self, "setLocalIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableDevice setFDAUDI:](self, "setFDAUDI:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[HDCodableDevice setUuid:](self, "setUuid:");
    v4 = v7;
  }
  if (((_BYTE)v4[12] & 1) != 0)
  {
    self->_creationDate = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  syncIdentity = self->_syncIdentity;
  v6 = *((_QWORD *)v4 + 10);
  if (syncIdentity)
  {
    if (v6)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_26:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HDCodableDevice setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_26;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareVersion, a3);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareVersion, a3);
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_softwareVersion, a3);
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localIdentifier, a3);
}

- (NSString)fDAUDI
{
  return self->_fDAUDI;
}

- (void)setFDAUDI:(id)a3
{
  objc_storeStrong((id *)&self->_fDAUDI, a3);
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_fDAUDI, 0);
}

@end
