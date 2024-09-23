@implementation DRSProtoClientDeviceMetadata

- (BOOL)hasBuildVariant
{
  return self->_buildVariant != 0;
}

- (BOOL)hasDeviceCategory
{
  return self->_deviceCategory != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasPlatform
{
  return self->_platform != 0;
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
  v8.super_class = (Class)DRSProtoClientDeviceMetadata;
  -[DRSProtoClientDeviceMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoClientDeviceMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *buildVariant;
  NSString *deviceCategory;
  NSString *deviceModel;
  NSString *platform;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  buildVariant = self->_buildVariant;
  if (buildVariant)
    objc_msgSend(v3, "setObject:forKey:", buildVariant, CFSTR("build_variant"));
  deviceCategory = self->_deviceCategory;
  if (deviceCategory)
    objc_msgSend(v4, "setObject:forKey:", deviceCategory, CFSTR("device_category"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v4, "setObject:forKey:", deviceModel, CFSTR("device_model"));
  platform = self->_platform;
  if (platform)
    objc_msgSend(v4, "setObject:forKey:", platform, CFSTR("platform"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoClientDeviceMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_buildVariant)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_platform)
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
  if (self->_buildVariant)
  {
    objc_msgSend(v4, "setBuildVariant:");
    v4 = v5;
  }
  if (self->_deviceCategory)
  {
    objc_msgSend(v5, "setDeviceCategory:");
    v4 = v5;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v5, "setDeviceModel:");
    v4 = v5;
  }
  if (self->_platform)
  {
    objc_msgSend(v5, "setPlatform:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_buildVariant, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_deviceCategory, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_platform, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *buildVariant;
  NSString *deviceCategory;
  NSString *deviceModel;
  NSString *platform;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((buildVariant = self->_buildVariant, !((unint64_t)buildVariant | v4[1]))
     || -[NSString isEqual:](buildVariant, "isEqual:"))
    && ((deviceCategory = self->_deviceCategory, !((unint64_t)deviceCategory | v4[2]))
     || -[NSString isEqual:](deviceCategory, "isEqual:"))
    && ((deviceModel = self->_deviceModel, !((unint64_t)deviceModel | v4[3]))
     || -[NSString isEqual:](deviceModel, "isEqual:")))
  {
    platform = self->_platform;
    if ((unint64_t)platform | v4[4])
      v9 = -[NSString isEqual:](platform, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_buildVariant, "hash");
  v4 = -[NSString hash](self->_deviceCategory, "hash") ^ v3;
  v5 = -[NSString hash](self->_deviceModel, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_platform, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[DRSProtoClientDeviceMetadata setBuildVariant:](self, "setBuildVariant:");
  if (v4[2])
    -[DRSProtoClientDeviceMetadata setDeviceCategory:](self, "setDeviceCategory:");
  if (v4[3])
    -[DRSProtoClientDeviceMetadata setDeviceModel:](self, "setDeviceModel:");
  if (v4[4])
    -[DRSProtoClientDeviceMetadata setPlatform:](self, "setPlatform:");

}

- (NSString)buildVariant
{
  return self->_buildVariant;
}

- (void)setBuildVariant:(id)a3
{
  objc_storeStrong((id *)&self->_buildVariant, a3);
}

- (NSString)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCategory, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceCategory, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);
}

@end
