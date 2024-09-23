@implementation NPKProtoStandaloneInitializationResponse

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NPKProtoStandaloneInitializationResponse;
  -[NPKProtoStandaloneInitializationResponse dealloc](&v3, sel_dealloc);
}

- (unint64_t)supportedServerVersionsCount
{
  return self->_supportedServerVersions.count;
}

- (int)supportedServerVersions
{
  return self->_supportedServerVersions.list;
}

- (void)clearSupportedServerVersions
{
  PBRepeatedInt32Clear();
}

- (void)addSupportedServerVersions:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)supportedServerVersionsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedServerVersions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_supportedServerVersions = &self->_supportedServerVersions;
  count = self->_supportedServerVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_supportedServerVersions->list[a3];
}

- (void)setSupportedServerVersions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)supportedServerVersionsAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("Version1");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSupportedServerVersions:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("Version1"));
  return 1;
}

- (BOOL)hasClientInfoHTTPHeader
{
  return self->_clientInfoHTTPHeader != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
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
  v8.super_class = (Class)NPKProtoStandaloneInitializationResponse;
  -[NPKProtoStandaloneInitializationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneInitializationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandaloneResponseHeader *responseHeader;
  void *v5;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedServerVersions;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  NSString *clientInfoHTTPHeader;
  NPKProtoStandaloneError *error;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  responseHeader = self->_responseHeader;
  if (responseHeader)
  {
    -[NPKProtoStandaloneResponseHeader dictionaryRepresentation](responseHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("responseHeader"));

  }
  p_supportedServerVersions = &self->_supportedServerVersions;
  if (self->_supportedServerVersions.count)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_supportedServerVersions.count)
    {
      v8 = 0;
      do
      {
        v9 = CFSTR("Version1");
        if (p_supportedServerVersions->list[v8] != 1)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), p_supportedServerVersions->list[v8]);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "addObject:", v9);

        ++v8;
      }
      while (v8 < self->_supportedServerVersions.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("supportedServerVersions"));

  }
  clientInfoHTTPHeader = self->_clientInfoHTTPHeader;
  if (clientInfoHTTPHeader)
    objc_msgSend(v3, "setObject:forKey:", clientInfoHTTPHeader, CFSTR("clientInfoHTTPHeader"));
  error = self->_error;
  if (error)
  {
    -[NPKProtoStandaloneError dictionaryRepresentation](error, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneInitializationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_responseHeader)
    -[NPKProtoStandaloneInitializationResponse writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_supportedServerVersions.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_supportedServerVersions.count);
  }
  if (self->_clientInfoHTTPHeader)
    PBDataWriterWriteStringField();
  v6 = v7;
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setResponseHeader:", self->_responseHeader);
  if (-[NPKProtoStandaloneInitializationResponse supportedServerVersionsCount](self, "supportedServerVersionsCount"))
  {
    objc_msgSend(v8, "clearSupportedServerVersions");
    v4 = -[NPKProtoStandaloneInitializationResponse supportedServerVersionsCount](self, "supportedServerVersionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addSupportedServerVersions:", -[NPKProtoStandaloneInitializationResponse supportedServerVersionsAtIndex:](self, "supportedServerVersionsAtIndex:", i));
    }
  }
  if (self->_clientInfoHTTPHeader)
    objc_msgSend(v8, "setClientInfoHTTPHeader:");
  v7 = v8;
  if (self->_error)
  {
    objc_msgSend(v8, "setError:");
    v7 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandaloneResponseHeader copyWithZone:](self->_responseHeader, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  PBRepeatedInt32Copy();
  v8 = -[NSString copyWithZone:](self->_clientInfoHTTPHeader, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NPKProtoStandaloneError copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneResponseHeader *responseHeader;
  NSString *clientInfoHTTPHeader;
  NPKProtoStandaloneError *error;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((responseHeader = self->_responseHeader, !((unint64_t)responseHeader | v4[6]))
     || -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((clientInfoHTTPHeader = self->_clientInfoHTTPHeader, !((unint64_t)clientInfoHTTPHeader | v4[4]))
     || -[NSString isEqual:](clientInfoHTTPHeader, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[5])
      v8 = -[NPKProtoStandaloneError isEqual:](error, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NPKProtoStandaloneResponseHeader hash](self->_responseHeader, "hash");
  v4 = PBRepeatedInt32Hash() ^ v3;
  v5 = -[NSString hash](self->_clientInfoHTTPHeader, "hash");
  return v4 ^ v5 ^ -[NPKProtoStandaloneError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneResponseHeader *responseHeader;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD *v10;
  NPKProtoStandaloneError *error;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  responseHeader = self->_responseHeader;
  v6 = v4[6];
  v13 = v4;
  if (responseHeader)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandaloneResponseHeader mergeFrom:](responseHeader, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandaloneInitializationResponse setResponseHeader:](self, "setResponseHeader:");
  }
  v4 = v13;
LABEL_7:
  v7 = objc_msgSend(v4, "supportedServerVersionsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[NPKProtoStandaloneInitializationResponse addSupportedServerVersions:](self, "addSupportedServerVersions:", objc_msgSend(v13, "supportedServerVersionsAtIndex:", i));
  }
  v10 = v13;
  if (v13[4])
  {
    -[NPKProtoStandaloneInitializationResponse setClientInfoHTTPHeader:](self, "setClientInfoHTTPHeader:");
    v10 = v13;
  }
  error = self->_error;
  v12 = v10[5];
  if (error)
  {
    if (v12)
    {
      -[NPKProtoStandaloneError mergeFrom:](error, "mergeFrom:");
LABEL_17:
      v10 = v13;
    }
  }
  else if (v12)
  {
    -[NPKProtoStandaloneInitializationResponse setError:](self, "setError:");
    goto LABEL_17;
  }

}

- (NPKProtoStandaloneResponseHeader)responseHeader
{
  return self->_responseHeader;
}

- (void)setResponseHeader:(id)a3
{
  objc_storeStrong((id *)&self->_responseHeader, a3);
}

- (NSString)clientInfoHTTPHeader
{
  return self->_clientInfoHTTPHeader;
}

- (void)setClientInfoHTTPHeader:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfoHTTPHeader, a3);
}

- (NPKProtoStandaloneError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clientInfoHTTPHeader, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandaloneInitializationResponse writeTo:]", "NPKProtoStandaloneInitializationResponse.m", 202, "self->_responseHeader != nil");
}

@end
