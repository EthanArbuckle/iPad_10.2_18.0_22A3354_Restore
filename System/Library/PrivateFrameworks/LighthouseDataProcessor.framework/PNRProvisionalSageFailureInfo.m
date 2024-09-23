@implementation PNRProvisionalSageFailureInfo

- (BOOL)hasFailureType
{
  return self->_failureType != 0;
}

- (void)deleteFailureType
{
  -[PNRProvisionalSageFailureInfo setFailureType:](self, "setFailureType:", 0);
}

- (BOOL)hasFailureSubType
{
  return self->_failureSubType != 0;
}

- (void)deleteFailureSubType
{
  -[PNRProvisionalSageFailureInfo setFailureSubType:](self, "setFailureSubType:", 0);
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
  -[PNRProvisionalSageFailureInfo setError:](self, "setError:", 0);
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0;
}

- (void)deleteUnderlyingError
{
  -[PNRProvisionalSageFailureInfo setUnderlyingError:](self, "setUnderlyingError:", 0);
}

- (BOOL)hasUnderUnderlyingError
{
  return self->_underUnderlyingError != 0;
}

- (void)deleteUnderUnderlyingError
{
  -[PNRProvisionalSageFailureInfo setUnderUnderlyingError:](self, "setUnderUnderlyingError:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSageFailureInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PNRProvisionalSageFailureInfo failureType](self, "failureType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PNRProvisionalSageFailureInfo failureSubType](self, "failureSubType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PNRProvisionalSageFailureInfo error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRProvisionalSageFailureInfo error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalSageFailureInfo underlyingError](self, "underlyingError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRProvisionalSageFailureInfo underlyingError](self, "underlyingError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalSageFailureInfo underUnderlyingError](self, "underUnderlyingError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PNRProvisionalSageFailureInfo underUnderlyingError](self, "underUnderlyingError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[PNRProvisionalSageFailureInfo failureType](self, "failureType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PNRProvisionalSageFailureInfo failureType](self, "failureType");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRProvisionalSageFailureInfo failureType](self, "failureType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failureType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[PNRProvisionalSageFailureInfo failureSubType](self, "failureSubType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureSubType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PNRProvisionalSageFailureInfo failureSubType](self, "failureSubType");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRProvisionalSageFailureInfo failureSubType](self, "failureSubType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failureSubType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[PNRProvisionalSageFailureInfo error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PNRProvisionalSageFailureInfo error](self, "error");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PNRProvisionalSageFailureInfo error](self, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[PNRProvisionalSageFailureInfo underlyingError](self, "underlyingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PNRProvisionalSageFailureInfo underlyingError](self, "underlyingError");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PNRProvisionalSageFailureInfo underlyingError](self, "underlyingError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingError");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[PNRProvisionalSageFailureInfo underUnderlyingError](self, "underUnderlyingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underUnderlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PNRProvisionalSageFailureInfo underUnderlyingError](self, "underUnderlyingError");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[PNRProvisionalSageFailureInfo underUnderlyingError](self, "underUnderlyingError");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underUnderlyingError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_failureType, "hash");
  v4 = -[NSString hash](self->_failureSubType, "hash") ^ v3;
  v5 = -[PNRProvisionalSageErrorInfo hash](self->_error, "hash");
  v6 = v4 ^ v5 ^ -[PNRProvisionalSageErrorInfo hash](self->_underlyingError, "hash");
  return v6 ^ -[PNRProvisionalSageErrorInfo hash](self->_underUnderlyingError, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_error)
  {
    -[PNRProvisionalSageFailureInfo error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("error"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("error"));

    }
  }
  if (self->_failureSubType)
  {
    -[PNRProvisionalSageFailureInfo failureSubType](self, "failureSubType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failureSubType"));

  }
  if (self->_failureType)
  {
    -[PNRProvisionalSageFailureInfo failureType](self, "failureType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("failureType"));

  }
  if (self->_underUnderlyingError)
  {
    -[PNRProvisionalSageFailureInfo underUnderlyingError](self, "underUnderlyingError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("underUnderlyingError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("underUnderlyingError"));

    }
  }
  if (self->_underlyingError)
  {
    -[PNRProvisionalSageFailureInfo underlyingError](self, "underlyingError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("underlyingError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("underlyingError"));

    }
  }
  -[PNRProvisionalSageFailureInfo willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRProvisionalSageFailureInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalSageFailureInfo)initWithJSON:(id)a3
{
  void *v4;
  PNRProvisionalSageFailureInfo *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[PNRProvisionalSageFailureInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalSageFailureInfo)initWithDictionary:(id)a3
{
  id v4;
  PNRProvisionalSageFailureInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PNRProvisionalSageErrorInfo *v11;
  void *v12;
  PNRProvisionalSageErrorInfo *v13;
  void *v14;
  PNRProvisionalSageErrorInfo *v15;
  PNRProvisionalSageFailureInfo *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PNRProvisionalSageFailureInfo;
  v5 = -[PNRProvisionalSageFailureInfo init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PNRProvisionalSageFailureInfo setFailureType:](v5, "setFailureType:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureSubType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PNRProvisionalSageFailureInfo setFailureSubType:](v5, "setFailureSubType:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PNRProvisionalSageErrorInfo initWithDictionary:]([PNRProvisionalSageErrorInfo alloc], "initWithDictionary:", v10);
      -[PNRProvisionalSageFailureInfo setError:](v5, "setError:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underlyingError"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PNRProvisionalSageErrorInfo initWithDictionary:]([PNRProvisionalSageErrorInfo alloc], "initWithDictionary:", v12);
      -[PNRProvisionalSageFailureInfo setUnderlyingError:](v5, "setUnderlyingError:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underUnderlyingError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PNRProvisionalSageErrorInfo initWithDictionary:]([PNRProvisionalSageErrorInfo alloc], "initWithDictionary:", v14);
      -[PNRProvisionalSageFailureInfo setUnderUnderlyingError:](v5, "setUnderUnderlyingError:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (NSString)failureType
{
  return self->_failureType;
}

- (void)setFailureType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)failureSubType
{
  return self->_failureSubType;
}

- (void)setFailureSubType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PNRProvisionalSageErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (PNRProvisionalSageErrorInfo)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (PNRProvisionalSageErrorInfo)underUnderlyingError
{
  return self->_underUnderlyingError;
}

- (void)setUnderUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underUnderlyingError, a3);
}

- (void)setHasFailureType:(BOOL)a3
{
  self->_hasFailureType = a3;
}

- (void)setHasFailureSubType:(BOOL)a3
{
  self->_hasFailureSubType = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (void)setHasUnderlyingError:(BOOL)a3
{
  self->_hasUnderlyingError = a3;
}

- (void)setHasUnderUnderlyingError:(BOOL)a3
{
  self->_hasUnderUnderlyingError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underUnderlyingError, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_failureSubType, 0);
  objc_storeStrong((id *)&self->_failureType, 0);
}

@end
