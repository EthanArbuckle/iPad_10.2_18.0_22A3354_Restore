@implementation FCCKPDateStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modification, 0);
  objc_storeStrong((id *)&self->_creation, 0);
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
  v8.super_class = (Class)FCCKPDateStatistics;
  -[FCCKPDateStatistics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPDateStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPDate *creation;
  void *v5;
  FCCKPDate *modification;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  creation = self->_creation;
  if (creation)
  {
    -[FCCKPDate dictionaryRepresentation](creation, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("creation"));

  }
  modification = self->_modification;
  if (modification)
  {
    -[FCCKPDate dictionaryRepresentation](modification, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("modification"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPDateStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_creation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_modification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPDate copyWithZone:](self->_creation, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[FCCKPDate copyWithZone:](self->_modification, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCCKPDate *creation;
  FCCKPDate *modification;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((creation = self->_creation, !((unint64_t)creation | v4[1]))
     || -[FCCKPDate isEqual:](creation, "isEqual:")))
  {
    modification = self->_modification;
    if ((unint64_t)modification | v4[2])
      v7 = -[FCCKPDate isEqual:](modification, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[FCCKPDate hash](self->_creation, "hash");
  return -[FCCKPDate hash](self->_modification, "hash") ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v3 = a2;
  if (!a1)
    goto LABEL_14;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = (void *)v3[1];
  v7 = v3;
  if (v4)
  {
    if (!v5)
      goto LABEL_8;
    -[FCCKPDate mergeFrom:](v4, v5);
  }
  else
  {
    if (!v5)
      goto LABEL_8;
    objc_storeStrong((id *)(a1 + 8), v5);
  }
  v3 = v7;
LABEL_8:
  v6 = (void *)v3[2];
  if (*(_QWORD *)(a1 + 16))
  {
    if (v6)
    {
      -[FCCKPDate mergeFrom:](*(_QWORD *)(a1 + 16), v6);
LABEL_13:
      v3 = v7;
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(a1 + 16), v6);
    goto LABEL_13;
  }
LABEL_14:

}

@end
