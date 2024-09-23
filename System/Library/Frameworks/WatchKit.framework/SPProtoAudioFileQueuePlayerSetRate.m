@implementation SPProtoAudioFileQueuePlayerSetRate

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFileQueuePlayerSetRate;
  -[SPProtoAudioFileQueuePlayerSetRate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFileQueuePlayerSetRate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *identifier;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  *(float *)&v4 = self->_rate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("rate"));

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFileQueuePlayerSetRateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  NSString *identifier;
  float *v5;

  identifier = self->_identifier;
  v5 = (float *)a3;
  objc_msgSend(v5, "setIdentifier:", identifier);
  v5[4] = self->_rate;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(float *)(v5 + 16) = self->_rate;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | *((_QWORD *)v4 + 1)))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_rate == *((float *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  float rate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_identifier, "hash");
  rate = self->_rate;
  v5 = rate;
  if (rate < 0.0)
    v5 = -rate;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabs(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  float *v5;

  v4 = (float *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[SPProtoAudioFileQueuePlayerSetRate setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  self->_rate = v4[4];

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)sockPuppetMessage
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setSetRate:](v3, "setSetRate:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
