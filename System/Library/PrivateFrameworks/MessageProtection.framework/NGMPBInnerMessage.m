@implementation NGMPBInnerMessage

- (id)attributes
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NGMPBInnerMessage hasKtGossipData](self, "hasKtGossipData"))
  {
    -[NGMPBInnerMessage ktGossipData](self, "ktGossipData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, NGMEncryptedAttributeKTGossipData);

  }
  return v3;
}

- (void)setCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCounter
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasKtGossipData
{
  return self->_ktGossipData != 0;
}

- (BOOL)hasDebugInfo
{
  return self->_debugInfo != 0;
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
  v8.super_class = (Class)NGMPBInnerMessage;
  -[NGMPBInnerMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBInnerMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *message;
  void *v6;
  NSData *ktGossipData;
  NSData *debugInfo;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  message = self->_message;
  if (message)
    objc_msgSend(v3, "setObject:forKey:", message, CFSTR("message"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counter);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("counter"));

  }
  ktGossipData = self->_ktGossipData;
  if (ktGossipData)
    objc_msgSend(v4, "setObject:forKey:", ktGossipData, CFSTR("ktGossipData"));
  debugInfo = self->_debugInfo;
  if (debugInfo)
    objc_msgSend(v4, "setObject:forKey:", debugInfo, CFSTR("debugInfo"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBInnerMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_message)
    -[NGMPBInnerMessage writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_ktGossipData)
    PBDataWriterWriteDataField();
  v5 = v6;
  if (self->_debugInfo)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setMessage:", self->_message);
  v4 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_counter;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  if (self->_ktGossipData)
  {
    objc_msgSend(v5, "setKtGossipData:");
    v4 = v5;
  }
  if (self->_debugInfo)
  {
    objc_msgSend(v5, "setDebugInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_message, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_counter;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_ktGossipData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_debugInfo, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *message;
  NSData *ktGossipData;
  NSData *debugInfo;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  message = self->_message;
  if ((unint64_t)message | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](message, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_counter != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  ktGossipData = self->_ktGossipData;
  if ((unint64_t)ktGossipData | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](ktGossipData, "isEqual:"))
  {
    goto LABEL_13;
  }
  debugInfo = self->_debugInfo;
  if ((unint64_t)debugInfo | *((_QWORD *)v4 + 2))
    v8 = -[NSData isEqual:](debugInfo, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_message, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_counter;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSData hash](self->_ktGossipData, "hash");
  return v5 ^ v6 ^ -[NSData hash](self->_debugInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NGMPBInnerMessage setMessage:](self, "setMessage:");
    v4 = v5;
  }
  if ((v4[10] & 1) != 0)
  {
    self->_counter = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NGMPBInnerMessage setKtGossipData:](self, "setKtGossipData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NGMPBInnerMessage setDebugInfo:](self, "setDebugInfo:");
    v4 = v5;
  }

}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (unsigned)counter
{
  return self->_counter;
}

- (NSData)ktGossipData
{
  return self->_ktGossipData;
}

- (void)setKtGossipData:(id)a3
{
  objc_storeStrong((id *)&self->_ktGossipData, a3);
}

- (NSData)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_ktGossipData, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBInnerMessage writeTo:]", "NGMPBInnerMessage.m", 126, "nil != self->_message");
}

@end
