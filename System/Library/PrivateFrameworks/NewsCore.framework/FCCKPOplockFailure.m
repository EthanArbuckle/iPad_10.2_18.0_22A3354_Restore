@implementation FCCKPOplockFailure

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPOplockFailure;
  -[FCCKPOplockFailure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPOplockFailure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPRecord *recordForOplockFailure;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  recordForOplockFailure = self->_recordForOplockFailure;
  if (recordForOplockFailure)
  {
    -[FCCKPRecord dictionaryRepresentation](recordForOplockFailure, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("recordForOplockFailure"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPOplockFailureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_recordForOplockFailure)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPRecord copyWithZone:](self->_recordForOplockFailure, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCCKPRecord *recordForOplockFailure;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    recordForOplockFailure = self->_recordForOplockFailure;
    if ((unint64_t)recordForOplockFailure | v4[1])
      v6 = -[FCCKPRecord isEqual:](recordForOplockFailure, "isEqual:");
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
  return -[FCCKPRecord hash](self->_recordForOplockFailure, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordForOplockFailure, 0);
}

@end
