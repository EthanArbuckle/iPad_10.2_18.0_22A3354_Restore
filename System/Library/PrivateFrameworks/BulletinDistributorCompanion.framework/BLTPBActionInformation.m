@implementation BLTPBActionInformation

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasContextNulls
{
  return self->_contextNulls != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBActionInformation;
  -[BLTPBActionInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBActionInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *context;
  NSData *contextNulls;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  context = self->_context;
  if (context)
    objc_msgSend(v3, "setObject:forKey:", context, CFSTR("context"));
  contextNulls = self->_contextNulls;
  if (contextNulls)
    objc_msgSend(v4, "setObject:forKey:", contextNulls, CFSTR("contextNulls"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBActionInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_context)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_contextNulls)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_context)
  {
    objc_msgSend(v4, "setContext:");
    v4 = v5;
  }
  if (self->_contextNulls)
  {
    objc_msgSend(v5, "setContextNulls:");
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
  v6 = -[NSData copyWithZone:](self->_context, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_contextNulls, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *context;
  NSData *contextNulls;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((context = self->_context, !((unint64_t)context | v4[1]))
     || -[NSData isEqual:](context, "isEqual:")))
  {
    contextNulls = self->_contextNulls;
    if ((unint64_t)contextNulls | v4[2])
      v7 = -[NSData isEqual:](contextNulls, "isEqual:");
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
  uint64_t v3;

  v3 = -[NSData hash](self->_context, "hash");
  return -[NSData hash](self->_contextNulls, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[BLTPBActionInformation setContext:](self, "setContext:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[BLTPBActionInformation setContextNulls:](self, "setContextNulls:");
    v4 = v5;
  }

}

- (NSData)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSData)contextNulls
{
  return self->_contextNulls;
}

- (void)setContextNulls:(id)a3
{
  objc_storeStrong((id *)&self->_contextNulls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextNulls, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
