@implementation VCPProtoImageFeatureResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageFeatureResult;
  -[VCPProtoImageFeatureResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageFeatureResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *featureBlob;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  featureBlob = self->_featureBlob;
  if (featureBlob)
    objc_msgSend(v3, "setObject:forKey:", featureBlob, CFSTR("featureBlob"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageFeatureResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setFeatureBlob:", self->_featureBlob);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_featureBlob, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *featureBlob;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    featureBlob = self->_featureBlob;
    if ((unint64_t)featureBlob | v4[1])
      v6 = -[NSData isEqual:](featureBlob, "isEqual:");
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
  return -[NSData hash](self->_featureBlob, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[VCPProtoImageFeatureResult setFeatureBlob:](self, "setFeatureBlob:");
}

- (NSData)featureBlob
{
  return self->_featureBlob;
}

- (void)setFeatureBlob:(id)a3
{
  objc_storeStrong((id *)&self->_featureBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureBlob, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  VCPProtoImageFeatureResult *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("featureVector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoImageFeatureResult);
    -[VCPProtoImageFeatureResult setFeatureBlob:](v5, "setFeatureBlob:", v4);
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
  v6 = CFSTR("featureVector");
  -[VCPProtoImageFeatureResult featureBlob](self, "featureBlob");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
