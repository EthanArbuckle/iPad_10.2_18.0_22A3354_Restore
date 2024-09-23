@implementation NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse

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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse;
  -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NPKProtoStandaloneError *error;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  responseHeader = self->_responseHeader;
  if (responseHeader)
  {
    -[NPKProtoStandaloneResponseHeader dictionaryRepresentation](responseHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("responseHeader"));

  }
  error = self->_error;
  if (error)
  {
    -[NPKProtoStandaloneError dictionaryRepresentation](error, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_responseHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_error)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setResponseHeader:", self->_responseHeader);
  if (self->_error)
    objc_msgSend(v4, "setError:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandaloneResponseHeader copyWithZone:](self->_responseHeader, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NPKProtoStandaloneError copyWithZone:](self->_error, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneResponseHeader *responseHeader;
  NPKProtoStandaloneError *error;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((responseHeader = self->_responseHeader, !((unint64_t)responseHeader | v4[2]))
     || -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1])
      v7 = -[NPKProtoStandaloneError isEqual:](error, "isEqual:");
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

  v3 = -[NPKProtoStandaloneResponseHeader hash](self->_responseHeader, "hash");
  return -[NPKProtoStandaloneError hash](self->_error, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneResponseHeader *responseHeader;
  uint64_t v6;
  NPKProtoStandaloneError *error;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  responseHeader = self->_responseHeader;
  v6 = v4[2];
  v9 = v4;
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
    -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse setResponseHeader:](self, "setResponseHeader:");
  }
  v4 = v9;
LABEL_7:
  error = self->_error;
  v8 = v4[1];
  if (error)
  {
    if (v8)
    {
      -[NPKProtoStandaloneError mergeFrom:](error, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse setError:](self, "setError:");
    goto LABEL_12;
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
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse.m", 114, "self->_responseHeader != nil");
}

@end
