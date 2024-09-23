@implementation FCCKPUniqueFieldFailure

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPUniqueFieldFailure;
  -[FCCKPUniqueFieldFailure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPUniqueFieldFailure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPIdentifier *identifierForConstraintFailure;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifierForConstraintFailure = self->_identifierForConstraintFailure;
  if (identifierForConstraintFailure)
  {
    -[FCCKPIdentifier dictionaryRepresentation](identifierForConstraintFailure, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifierForConstraintFailure"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPUniqueFieldFailureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifierForConstraintFailure)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPIdentifier copyWithZone:](self->_identifierForConstraintFailure, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCCKPIdentifier *identifierForConstraintFailure;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    identifierForConstraintFailure = self->_identifierForConstraintFailure;
    if ((unint64_t)identifierForConstraintFailure | v4[1])
      v6 = -[FCCKPIdentifier isEqual:](identifierForConstraintFailure, "isEqual:");
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
  return -[FCCKPIdentifier hash](self->_identifierForConstraintFailure, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierForConstraintFailure, 0);
}

@end
