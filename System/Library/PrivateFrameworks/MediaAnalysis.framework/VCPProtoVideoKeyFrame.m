@implementation VCPProtoVideoKeyFrame

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoVideoKeyFrame;
  -[VCPProtoVideoKeyFrame description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoVideoKeyFrame dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  VCPProtoTime *timestamp;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  if (timestamp)
  {
    -[VCPProtoTime dictionaryRepresentation](timestamp, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timestamp"));

  }
  *(float *)&v4 = self->_curationScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("curationScore"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoKeyFrameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  VCPProtoTime *timestamp;
  float *v5;

  timestamp = self->_timestamp;
  v5 = (float *)a3;
  objc_msgSend(v5, "setTimestamp:", timestamp);
  v5[2] = self->_curationScore;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTime copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(float *)(v5 + 8) = self->_curationScore;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTime *timestamp;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timestamp = self->_timestamp, !((unint64_t)timestamp | *((_QWORD *)v4 + 2)))
     || -[VCPProtoTime isEqual:](timestamp, "isEqual:"))
    && self->_curationScore == *((float *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  float curationScore;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  float v10;
  unint64_t v11;

  v3 = -[VCPProtoTime hash](self->_timestamp, "hash");
  curationScore = self->_curationScore;
  v5 = -curationScore;
  if (curationScore >= 0.0)
    v5 = self->_curationScore;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabsf(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTime *timestamp;
  uint64_t v6;
  id v7;

  v4 = a3;
  timestamp = self->_timestamp;
  v6 = *((_QWORD *)v4 + 2);
  if (timestamp)
  {
    if (v6)
    {
      v7 = v4;
      -[VCPProtoTime mergeFrom:](timestamp, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[VCPProtoVideoKeyFrame setTimestamp:](self, "setTimestamp:");
    goto LABEL_6;
  }
  self->_curationScore = *((float *)v4 + 2);

}

- (VCPProtoTime)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (float)curationScore
{
  return self->_curationScore;
}

- (void)setCurationScore:(float)a3
{
  self->_curationScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
