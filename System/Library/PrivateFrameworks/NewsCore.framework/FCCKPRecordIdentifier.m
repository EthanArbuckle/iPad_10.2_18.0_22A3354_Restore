@implementation FCCKPRecordIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setZoneIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setValue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

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
  v8.super_class = (Class)FCCKPRecordIdentifier;
  -[FCCKPRecordIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPIdentifier *value;
  void *v5;
  FCCKPRecordZoneIdentifier *zoneIdentifier;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value)
  {
    -[FCCKPIdentifier dictionaryRepresentation](value, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("value"));

  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    -[FCCKPRecordZoneIdentifier dictionaryRepresentation](zoneIdentifier, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("zoneIdentifier"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPIdentifier copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[FCCKPRecordZoneIdentifier copyWithZone:](self->_zoneIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCCKPIdentifier *value;
  FCCKPRecordZoneIdentifier *zoneIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((value = self->_value, !((unint64_t)value | v4[1])) || -[FCCKPIdentifier isEqual:](value, "isEqual:")))
  {
    zoneIdentifier = self->_zoneIdentifier;
    if ((unint64_t)zoneIdentifier | v4[2])
      v7 = -[FCCKPRecordZoneIdentifier isEqual:](zoneIdentifier, "isEqual:");
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

  v3 = -[FCCKPIdentifier hash](self->_value, "hash");
  return -[FCCKPRecordZoneIdentifier hash](self->_zoneIdentifier, "hash") ^ v3;
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
    -[FCCKPIdentifier mergeFrom:](v4, v5);
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
      -[FCCKPRecordZoneIdentifier mergeFrom:](*(_QWORD *)(a1 + 16), v6);
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
