@implementation HDCodableRoutineLocationResponse

- (BOOL)hasLocationOfInterest
{
  return self->_locationOfInterest != 0;
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
  v8.super_class = (Class)HDCodableRoutineLocationResponse;
  -[HDCodableRoutineLocationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRoutineLocationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableRoutineLocation *locationOfInterest;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest)
  {
    -[HDCodableRoutineLocation dictionaryRepresentation](locationOfInterest, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("locationOfInterest"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineLocationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_locationOfInterest)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  HDCodableRoutineLocation *locationOfInterest;

  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest)
    objc_msgSend(a3, "setLocationOfInterest:", locationOfInterest);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableRoutineLocation copyWithZone:](self->_locationOfInterest, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDCodableRoutineLocation *locationOfInterest;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    locationOfInterest = self->_locationOfInterest;
    if ((unint64_t)locationOfInterest | v4[1])
      v6 = -[HDCodableRoutineLocation isEqual:](locationOfInterest, "isEqual:");
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
  return -[HDCodableRoutineLocation hash](self->_locationOfInterest, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableRoutineLocation *locationOfInterest;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  locationOfInterest = self->_locationOfInterest;
  v6 = v4[1];
  if (locationOfInterest)
  {
    if (v6)
    {
      v7 = v4;
      -[HDCodableRoutineLocation mergeFrom:](locationOfInterest, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[HDCodableRoutineLocationResponse setLocationOfInterest:](self, "setLocationOfInterest:");
    goto LABEL_6;
  }

}

- (HDCodableRoutineLocation)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
}

@end
