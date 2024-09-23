@implementation MADProtoFaceprint

- (void)setFaceprintVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_faceprintVersion = a3;
}

- (void)setHasFaceprintVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFaceprintVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFaceprintData
{
  return self->_faceprintData != 0;
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
  v8.super_class = (Class)MADProtoFaceprint;
  -[MADProtoFaceprint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoFaceprint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *faceprintData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_faceprintVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("faceprintVersion"));

  }
  faceprintData = self->_faceprintData;
  if (faceprintData)
    objc_msgSend(v3, "setObject:forKey:", faceprintData, CFSTR("faceprintData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoFaceprintReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_faceprintData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_faceprintVersion;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_faceprintData)
  {
    v5 = v4;
    objc_msgSend(v4, "setFaceprintData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_faceprintVersion;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_faceprintData, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *faceprintData;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_faceprintVersion != *((_QWORD *)v4 + 1))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  faceprintData = self->_faceprintData;
  if ((unint64_t)faceprintData | *((_QWORD *)v4 + 2))
    v6 = -[NSData isEqual:](faceprintData, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_faceprintVersion;
  else
    v2 = 0;
  return -[NSData hash](self->_faceprintData, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((v4[3] & 1) != 0)
  {
    self->_faceprintVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    v5 = v4;
    -[MADProtoFaceprint setFaceprintData:](self, "setFaceprintData:");
    v4 = v5;
  }

}

- (int64_t)faceprintVersion
{
  return self->_faceprintVersion;
}

- (NSData)faceprintData
{
  return self->_faceprintData;
}

- (void)setFaceprintData:(id)a3
{
  objc_storeStrong((id *)&self->_faceprintData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintData, 0);
}

+ (id)protoFromPhotosFaceprint:(id)a3
{
  id v3;
  MADProtoFaceprint *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MADProtoFaceprint);
  -[MADProtoFaceprint setFaceprintVersion:](v4, "setFaceprintVersion:", objc_msgSend(v3, "faceprintVersion"));
  objc_msgSend(v3, "faceprintData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MADProtoFaceprint setFaceprintData:](v4, "setFaceprintData:", v5);
  return v4;
}

- (id)vcpFaceprintWithDetectionType:(signed __int16)a3
{
  _BOOL8 v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = a3 != 1;
  v5 = -[MADProtoFaceprint faceprintVersion](self, "faceprintVersion");
  -[MADProtoFaceprint faceprintData](self, "faceprintData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
