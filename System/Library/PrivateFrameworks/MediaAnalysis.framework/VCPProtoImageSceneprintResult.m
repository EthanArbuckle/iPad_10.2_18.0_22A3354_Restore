@implementation VCPProtoImageSceneprintResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  VCPProtoImageSceneprintResult *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sceneprint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoImageSceneprintResult);
    -[VCPProtoImageSceneprintResult setSceneprintBlob:](v5, "setSceneprintBlob:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("attributes");
  v6 = CFSTR("sceneprint");
  -[VCPProtoImageSceneprintResult sceneprintBlob](self, "sceneprintBlob");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
  v8.super_class = (Class)VCPProtoImageSceneprintResult;
  -[VCPProtoImageSceneprintResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageSceneprintResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *sceneprintBlob;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sceneprintBlob = self->_sceneprintBlob;
  if (sceneprintBlob)
    objc_msgSend(v3, "setObject:forKey:", sceneprintBlob, CFSTR("sceneprintBlob"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageSceneprintResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setSceneprintBlob:", self->_sceneprintBlob);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_sceneprintBlob, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *sceneprintBlob;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    sceneprintBlob = self->_sceneprintBlob;
    if ((unint64_t)sceneprintBlob | v4[1])
      v6 = -[NSData isEqual:](sceneprintBlob, "isEqual:");
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
  return -[NSData hash](self->_sceneprintBlob, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[VCPProtoImageSceneprintResult setSceneprintBlob:](self, "setSceneprintBlob:");
}

- (NSData)sceneprintBlob
{
  return self->_sceneprintBlob;
}

- (void)setSceneprintBlob:(id)a3
{
  objc_storeStrong((id *)&self->_sceneprintBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprintBlob, 0);
}

@end
