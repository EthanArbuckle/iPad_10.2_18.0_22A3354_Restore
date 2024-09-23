@implementation VCPProtoMovieFaceprintResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieFaceprintResult;
  -[VCPProtoMovieFaceprintResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieFaceprintResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *faceprintBlob;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_faceID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("faceID"));

  faceprintBlob = self->_faceprintBlob;
  if (faceprintBlob)
    objc_msgSend(v3, "setObject:forKey:", faceprintBlob, CFSTR("faceprintBlob"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieFaceprintResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_faceID;
  objc_msgSend(a3, "setFaceprintBlob:", self->_faceprintBlob);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_faceID;
  v6 = -[NSData copyWithZone:](self->_faceprintBlob, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *faceprintBlob;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_faceID == *((_DWORD *)v4 + 2))
  {
    faceprintBlob = self->_faceprintBlob;
    if ((unint64_t)faceprintBlob | v4[2])
      v6 = -[NSData isEqual:](faceprintBlob, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_faceID;
  return -[NSData hash](self->_faceprintBlob, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_faceID = *((_DWORD *)a3 + 2);
  if (*((_QWORD *)a3 + 2))
    -[VCPProtoMovieFaceprintResult setFaceprintBlob:](self, "setFaceprintBlob:");
}

- (unsigned)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(unsigned int)a3
{
  self->_faceID = a3;
}

- (NSData)faceprintBlob
{
  return self->_faceprintBlob;
}

- (void)setFaceprintBlob:(id)a3
{
  objc_storeStrong((id *)&self->_faceprintBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintBlob, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  VCPProtoMovieFaceprintResult *v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("faceId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("facePrint"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(VCPProtoMovieFaceprintResult);
    -[VCPProtoMovieFaceprintResult setFaceID:](v8, "setFaceID:", objc_msgSend(v4, "unsignedIntValue"));
    -[VCPProtoMovieFaceprintResult setFaceprintBlob:](v8, "setFaceprintBlob:", v6);
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("attributes");
  v8[0] = CFSTR("faceId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoMovieFaceprintResult faceID](self, "faceID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("facePrint");
  -[VCPProtoMovieFaceprintResult faceprintBlob](self, "faceprintBlob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
