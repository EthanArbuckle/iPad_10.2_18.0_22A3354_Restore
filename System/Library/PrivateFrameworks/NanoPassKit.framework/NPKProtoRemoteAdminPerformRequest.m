@implementation NPKProtoRemoteAdminPerformRequest

- (BOOL)hasInfoDictionary
{
  return self->_infoDictionary != 0;
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
  v8.super_class = (Class)NPKProtoRemoteAdminPerformRequest;
  -[NPKProtoRemoteAdminPerformRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemoteAdminPerformRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *url;
  NSString *seid;
  NSString *command;
  NSData *infoDictionary;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  url = self->_url;
  if (url)
    objc_msgSend(v3, "setObject:forKey:", url, CFSTR("url"));
  seid = self->_seid;
  if (seid)
    objc_msgSend(v4, "setObject:forKey:", seid, CFSTR("seid"));
  command = self->_command;
  if (command)
    objc_msgSend(v4, "setObject:forKey:", command, CFSTR("command"));
  infoDictionary = self->_infoDictionary;
  if (infoDictionary)
    objc_msgSend(v4, "setObject:forKey:", infoDictionary, CFSTR("infoDictionary"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemoteAdminPerformRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_url)
    -[NPKProtoRemoteAdminPerformRequest writeTo:].cold.1();
  PBDataWriterWriteDataField();
  if (!self->_seid)
    -[NPKProtoRemoteAdminPerformRequest writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (!self->_command)
    -[NPKProtoRemoteAdminPerformRequest writeTo:].cold.3();
  PBDataWriterWriteStringField();
  if (self->_infoDictionary)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setUrl:", self->_url);
  objc_msgSend(v4, "setSeid:", self->_seid);
  objc_msgSend(v4, "setCommand:", self->_command);
  if (self->_infoDictionary)
    objc_msgSend(v4, "setInfoDictionary:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_url, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_seid, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_command, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSData copyWithZone:](self->_infoDictionary, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *url;
  NSString *seid;
  NSString *command;
  NSData *infoDictionary;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((url = self->_url, !((unint64_t)url | v4[4])) || -[NSData isEqual:](url, "isEqual:"))
    && ((seid = self->_seid, !((unint64_t)seid | v4[3])) || -[NSString isEqual:](seid, "isEqual:"))
    && ((command = self->_command, !((unint64_t)command | v4[1]))
     || -[NSString isEqual:](command, "isEqual:")))
  {
    infoDictionary = self->_infoDictionary;
    if ((unint64_t)infoDictionary | v4[2])
      v9 = -[NSData isEqual:](infoDictionary, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSData hash](self->_url, "hash");
  v4 = -[NSString hash](self->_seid, "hash") ^ v3;
  v5 = -[NSString hash](self->_command, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_infoDictionary, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[NPKProtoRemoteAdminPerformRequest setUrl:](self, "setUrl:");
  if (v4[3])
    -[NPKProtoRemoteAdminPerformRequest setSeid:](self, "setSeid:");
  if (v4[1])
    -[NPKProtoRemoteAdminPerformRequest setCommand:](self, "setCommand:");
  if (v4[2])
    -[NPKProtoRemoteAdminPerformRequest setInfoDictionary:](self, "setInfoDictionary:");

}

- (NSData)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
  objc_storeStrong((id *)&self->_seid, a3);
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (NSData)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_infoDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemoteAdminPerformRequest writeTo:]", "NPKProtoRemoteAdminPerformRequest.m", 109, "nil != self->_url");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoRemoteAdminPerformRequest writeTo:]", "NPKProtoRemoteAdminPerformRequest.m", 114, "nil != self->_seid");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[NPKProtoRemoteAdminPerformRequest writeTo:]", "NPKProtoRemoteAdminPerformRequest.m", 119, "nil != self->_command");
}

@end
