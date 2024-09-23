@implementation ATPResponse

- (BOOL)hasError
{
  return self->_error != 0;
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
  v8.super_class = (Class)ATPResponse;
  -[ATPResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATPResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATPError *error;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  if (error)
  {
    -[ATPError dictionaryRepresentation](error, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATPResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_error)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  ATPError *error;

  error = self->_error;
  if (error)
    objc_msgSend(a3, "setError:", error);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATPError copyWithZone:](self->_error, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ATPError *error;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1])
      v6 = -[ATPError isEqual:](error, "isEqual:");
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
  return -[ATPError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ATPError *error;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  error = self->_error;
  v6 = v4[1];
  if (error)
  {
    if (v6)
    {
      v7 = v4;
      -[ATPError mergeFrom:](error, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[ATPResponse setError:](self, "setError:");
    goto LABEL_6;
  }

}

- (ATPError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
