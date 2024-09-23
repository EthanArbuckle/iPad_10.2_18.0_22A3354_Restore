@implementation DRSProtoTaskingDeviceMetadata

- (BOOL)hasDeviceMetadata
{
  return self->_deviceMetadata != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
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
  v8.super_class = (Class)DRSProtoTaskingDeviceMetadata;
  -[DRSProtoTaskingDeviceMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingDeviceMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DRSProtoClientDeviceMetadata *deviceMetadata;
  void *v5;
  NSString *build;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceMetadata = self->_deviceMetadata;
  if (deviceMetadata)
  {
    -[DRSProtoClientDeviceMetadata dictionaryRepresentation](deviceMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("device_metadata"));

  }
  build = self->_build;
  if (build)
    objc_msgSend(v3, "setObject:forKey:", build, CFSTR("build"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingDeviceMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_deviceMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_build)
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
  if (self->_deviceMetadata)
  {
    objc_msgSend(v4, "setDeviceMetadata:");
    v4 = v5;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DRSProtoClientDeviceMetadata copyWithZone:](self->_deviceMetadata, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  DRSProtoClientDeviceMetadata *deviceMetadata;
  NSString *build;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((deviceMetadata = self->_deviceMetadata, !((unint64_t)deviceMetadata | v4[2]))
     || -[DRSProtoClientDeviceMetadata isEqual:](deviceMetadata, "isEqual:")))
  {
    build = self->_build;
    if ((unint64_t)build | v4[1])
      v7 = -[NSString isEqual:](build, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[DRSProtoClientDeviceMetadata hash](self->_deviceMetadata, "hash");
  return -[NSString hash](self->_build, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  DRSProtoClientDeviceMetadata *deviceMetadata;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  deviceMetadata = self->_deviceMetadata;
  v6 = v4[2];
  v7 = v4;
  if (deviceMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoClientDeviceMetadata mergeFrom:](deviceMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingDeviceMetadata setDeviceMetadata:](self, "setDeviceMetadata:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[DRSProtoTaskingDeviceMetadata setBuild:](self, "setBuild:");
    v4 = v7;
  }

}

- (DRSProtoClientDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
