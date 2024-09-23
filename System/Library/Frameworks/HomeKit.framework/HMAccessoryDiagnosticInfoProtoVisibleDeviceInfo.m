@implementation HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo

- (BOOL)hasIdsIdentifierString
{
  return self->_idsIdentifierString != 0;
}

- (BOOL)hasMediaRouteIdString
{
  return self->_mediaRouteIdString != 0;
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
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo;
  -[HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *idsIdentifierString;
  NSString *mediaRouteIdString;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  idsIdentifierString = self->_idsIdentifierString;
  if (idsIdentifierString)
    objc_msgSend(v3, "setObject:forKey:", idsIdentifierString, CFSTR("idsIdentifierString"));
  mediaRouteIdString = self->_mediaRouteIdString;
  if (mediaRouteIdString)
    objc_msgSend(v4, "setObject:forKey:", mediaRouteIdString, CFSTR("mediaRouteIdString"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_idsIdentifierString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_mediaRouteIdString)
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
  if (self->_idsIdentifierString)
  {
    objc_msgSend(v4, "setIdsIdentifierString:");
    v4 = v5;
  }
  if (self->_mediaRouteIdString)
  {
    objc_msgSend(v5, "setMediaRouteIdString:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_idsIdentifierString, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_mediaRouteIdString, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *idsIdentifierString;
  NSString *mediaRouteIdString;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((idsIdentifierString = self->_idsIdentifierString, !((unint64_t)idsIdentifierString | v4[1]))
     || -[NSString isEqual:](idsIdentifierString, "isEqual:")))
  {
    mediaRouteIdString = self->_mediaRouteIdString;
    if ((unint64_t)mediaRouteIdString | v4[2])
      v7 = -[NSString isEqual:](mediaRouteIdString, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_idsIdentifierString, "hash");
  return -[NSString hash](self->_mediaRouteIdString, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo setIdsIdentifierString:](self, "setIdsIdentifierString:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo setMediaRouteIdString:](self, "setMediaRouteIdString:");
    v4 = v5;
  }

}

- (NSString)idsIdentifierString
{
  return self->_idsIdentifierString;
}

- (void)setIdsIdentifierString:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifierString, a3);
}

- (NSString)mediaRouteIdString
{
  return self->_mediaRouteIdString;
}

- (void)setMediaRouteIdString:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRouteIdString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdString, 0);
  objc_storeStrong((id *)&self->_idsIdentifierString, 0);
}

@end
