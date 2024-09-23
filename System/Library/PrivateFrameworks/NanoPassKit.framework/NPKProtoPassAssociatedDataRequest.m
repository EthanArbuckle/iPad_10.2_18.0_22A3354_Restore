@implementation NPKProtoPassAssociatedDataRequest

- (void)setPassRequestedData:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_passRequestedData = a3;
}

- (void)setHasPassRequestedData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPassRequestedData
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NPKProtoPassAssociatedDataRequest;
  -[NPKProtoPassAssociatedDataRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassAssociatedDataRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passUniqueID;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passUniqueID = self->_passUniqueID;
  if (passUniqueID)
    objc_msgSend(v3, "setObject:forKey:", passUniqueID, CFSTR("passUniqueID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_passRequestedData);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("passRequestedData"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassAssociatedDataRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_passUniqueID)
    -[NPKProtoPassAssociatedDataRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setPassUniqueID:", self->_passUniqueID);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_passRequestedData;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passUniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_passRequestedData;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passUniqueID;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  passUniqueID = self->_passUniqueID;
  if ((unint64_t)passUniqueID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](passUniqueID, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_passRequestedData == *((_QWORD *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_passUniqueID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_passRequestedData;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[NPKProtoPassAssociatedDataRequest setPassUniqueID:](self, "setPassUniqueID:");
    v4 = v5;
  }
  if ((v4[3] & 1) != 0)
  {
    self->_passRequestedData = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueID, a3);
}

- (unint64_t)passRequestedData
{
  return self->_passRequestedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassAssociatedDataRequest writeTo:]", "NPKProtoPassAssociatedDataRequest.m", 96, "nil != self->_passUniqueID");
}

@end
