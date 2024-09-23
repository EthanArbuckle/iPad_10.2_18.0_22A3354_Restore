@implementation BMPBSiriQueryResult

- (BOOL)hasQid
{
  return self->_qid != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)BMPBSiriQueryResult;
  -[BMPBSiriQueryResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSiriQueryResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *qid;
  NSString *domain;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  qid = self->_qid;
  if (qid)
    objc_msgSend(v3, "setObject:forKey:", qid, CFSTR("qid"));
  domain = self->_domain;
  if (domain)
    objc_msgSend(v4, "setObject:forKey:", domain, CFSTR("domain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("confidence"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriQueryResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_qid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_qid)
  {
    objc_msgSend(v4, "setQid:");
    v4 = v5;
  }
  if (self->_domain)
  {
    objc_msgSend(v5, "setDomain:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_confidence;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_qid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *qid;
  NSString *domain;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  qid = self->_qid;
  if ((unint64_t)qid | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](qid, "isEqual:"))
      goto LABEL_10;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_confidence == *((double *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double confidence;
  double v7;
  long double v8;
  double v9;

  v3 = -[NSString hash](self->_qid, "hash");
  v4 = -[NSString hash](self->_domain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    confidence = self->_confidence;
    v7 = -confidence;
    if (confidence >= 0.0)
      v7 = self->_confidence;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBSiriQueryResult setQid:](self, "setQid:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBSiriQueryResult setDomain:](self, "setDomain:");
    v4 = v5;
  }
  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_confidence = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)qid
{
  return self->_qid;
}

- (void)setQid:(id)a3
{
  objc_storeStrong((id *)&self->_qid, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qid, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
