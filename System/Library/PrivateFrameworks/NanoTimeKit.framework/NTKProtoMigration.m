@implementation NTKProtoMigration

- (BOOL)hasFrom
{
  return self->_from != 0;
}

- (BOOL)hasTo
{
  return self->_to != 0;
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
  v8.super_class = (Class)NTKProtoMigration;
  -[NTKProtoMigration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKProtoMigration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *from;
  NSString *to;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  from = self->_from;
  if (from)
    objc_msgSend(v3, "setObject:forKey:", from, CFSTR("from"));
  to = self->_to;
  if (to)
    objc_msgSend(v4, "setObject:forKey:", to, CFSTR("to"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoMigrationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_from)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_to)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_from)
  {
    objc_msgSend(v4, "setFrom:");
    v4 = v5;
  }
  if (self->_to)
  {
    objc_msgSend(v5, "setTo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_from, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_to, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *from;
  NSString *to;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((from = self->_from, !((unint64_t)from | v4[1])) || -[NSString isEqual:](from, "isEqual:")))
  {
    to = self->_to;
    if ((unint64_t)to | v4[2])
      v7 = -[NSString isEqual:](to, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_from, "hash");
  return -[NSString hash](self->_to, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[NTKProtoMigration setFrom:](self, "setFrom:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[NTKProtoMigration setTo:](self, "setTo:");
    v4 = v5;
  }

}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (NSString)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_storeStrong((id *)&self->_to, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
}

@end
