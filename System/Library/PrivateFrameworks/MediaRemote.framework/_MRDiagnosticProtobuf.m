@implementation _MRDiagnosticProtobuf

- (void)setDateGenerated:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateGenerated = a3;
}

- (void)setHasDateGenerated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateGenerated
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDiagnosticInfo
{
  return self->_diagnosticInfo != 0;
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
  v8.super_class = (Class)_MRDiagnosticProtobuf;
  -[_MRDiagnosticProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDiagnosticProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *diagnosticInfo;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateGenerated);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("dateGenerated"));

  }
  diagnosticInfo = self->_diagnosticInfo;
  if (diagnosticInfo)
    objc_msgSend(v3, "setObject:forKey:", diagnosticInfo, CFSTR("diagnosticInfo"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRDiagnosticProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_diagnosticInfo)
  {
    PBDataWriterWriteStringField();
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
    v4[1] = *(_QWORD *)&self->_dateGenerated;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_diagnosticInfo)
  {
    v5 = v4;
    objc_msgSend(v4, "setDiagnosticInfo:");
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
    *(double *)(v5 + 8) = self->_dateGenerated;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_diagnosticInfo, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *diagnosticInfo;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_dateGenerated != *((double *)v4 + 1))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  diagnosticInfo = self->_diagnosticInfo;
  if ((unint64_t)diagnosticInfo | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](diagnosticInfo, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  double dateGenerated;
  double v5;
  long double v6;
  double v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dateGenerated = self->_dateGenerated;
    v5 = -dateGenerated;
    if (dateGenerated >= 0.0)
      v5 = self->_dateGenerated;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  return -[NSString hash](self->_diagnosticInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (((_BYTE)v4[3] & 1) != 0)
  {
    self->_dateGenerated = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[_MRDiagnosticProtobuf setDiagnosticInfo:](self, "setDiagnosticInfo:");
    v4 = v5;
  }

}

- (double)dateGenerated
{
  return self->_dateGenerated;
}

- (NSString)diagnosticInfo
{
  return self->_diagnosticInfo;
}

- (void)setDiagnosticInfo:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticInfo, 0);
}

@end
