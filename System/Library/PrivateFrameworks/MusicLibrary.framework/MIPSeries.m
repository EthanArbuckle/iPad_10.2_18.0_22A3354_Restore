@implementation MIPSeries

- (void)setStoreId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_storeId = a3;
}

- (void)setHasStoreId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStoreId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasSortName
{
  return self->_sortName != 0;
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
  v8.super_class = (Class)MIPSeries;
  -[MIPSeries description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPSeries dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *sortName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_storeId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("storeId"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  sortName = self->_sortName;
  if (sortName)
    objc_msgSend(v3, "setObject:forKey:", sortName, CFSTR("sortName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPSeriesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sortName)
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
    v4[1] = self->_storeId;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_sortName)
  {
    objc_msgSend(v5, "setSortName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_storeId;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_sortName, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *sortName;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_storeId != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_11;
  sortName = self->_sortName;
  if ((unint64_t)sortName | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](sortName, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_storeId;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sortName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((v4[4] & 1) != 0)
  {
    self->_storeId = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (v4[2])
  {
    -[MIPSeries setName:](self, "setName:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[MIPSeries setSortName:](self, "setSortName:");
    v4 = v5;
  }

}

- (int64_t)storeId
{
  return self->_storeId;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)sortName
{
  return self->_sortName;
}

- (void)setSortName:(id)a3
{
  objc_storeStrong((id *)&self->_sortName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
