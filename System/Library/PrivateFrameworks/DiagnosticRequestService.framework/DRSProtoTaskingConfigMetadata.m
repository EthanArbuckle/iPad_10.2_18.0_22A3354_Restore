@implementation DRSProtoTaskingConfigMetadata

- (BOOL)hasTaskingDeviceMetadata
{
  return self->_taskingDeviceMetadata != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
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
  v8.super_class = (Class)DRSProtoTaskingConfigMetadata;
  -[DRSProtoTaskingConfigMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingConfigMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DRSProtoTaskingDeviceMetadata *taskingDeviceMetadata;
  void *v5;
  NSString *uuid;
  NSString *teamId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  if (taskingDeviceMetadata)
  {
    -[DRSProtoTaskingDeviceMetadata dictionaryRepresentation](taskingDeviceMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tasking_device_metadata"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  teamId = self->_teamId;
  if (teamId)
    objc_msgSend(v3, "setObject:forKey:", teamId, CFSTR("team_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingConfigMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskingDeviceMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskingDeviceMetadata)
  {
    objc_msgSend(v4, "setTaskingDeviceMetadata:");
    v4 = v5;
  }
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    v4 = v5;
  }
  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DRSProtoTaskingDeviceMetadata copyWithZone:](self->_taskingDeviceMetadata, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_teamId, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  DRSProtoTaskingDeviceMetadata *taskingDeviceMetadata;
  NSString *uuid;
  NSString *teamId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((taskingDeviceMetadata = self->_taskingDeviceMetadata, !((unint64_t)taskingDeviceMetadata | v4[1]))
     || -[DRSProtoTaskingDeviceMetadata isEqual:](taskingDeviceMetadata, "isEqual:"))
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[3])) || -[NSString isEqual:](uuid, "isEqual:")))
  {
    teamId = self->_teamId;
    if ((unint64_t)teamId | v4[2])
      v8 = -[NSString isEqual:](teamId, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[DRSProtoTaskingDeviceMetadata hash](self->_taskingDeviceMetadata, "hash");
  v4 = -[NSString hash](self->_uuid, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_teamId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  DRSProtoTaskingDeviceMetadata *taskingDeviceMetadata;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  v6 = v4[1];
  v7 = v4;
  if (taskingDeviceMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingDeviceMetadata mergeFrom:](taskingDeviceMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingConfigMetadata setTaskingDeviceMetadata:](self, "setTaskingDeviceMetadata:");
  }
  v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[DRSProtoTaskingConfigMetadata setUuid:](self, "setUuid:");
    v4 = v7;
  }
  if (v4[2])
  {
    -[DRSProtoTaskingConfigMetadata setTeamId:](self, "setTeamId:");
    v4 = v7;
  }

}

- (DRSProtoTaskingDeviceMetadata)taskingDeviceMetadata
{
  return self->_taskingDeviceMetadata;
}

- (void)setTaskingDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_taskingDeviceMetadata, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
  objc_storeStrong((id *)&self->_teamId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_taskingDeviceMetadata, 0);
}

@end
