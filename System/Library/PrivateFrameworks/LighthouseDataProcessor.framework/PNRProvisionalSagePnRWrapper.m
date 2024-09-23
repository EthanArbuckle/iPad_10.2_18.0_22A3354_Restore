@implementation PNRProvisionalSagePnRWrapper

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return CFSTR("com.apple.aiml.pnr.SagePnRWrapper");
}

- (id)getVersion
{
  return &unk_2510B5AD0;
}

- (id)qualifiedMessageName
{
  if (-[PNRProvisionalSagePnRWrapper whichEventtype](self, "whichEventtype") == 101)
    return CFSTR("com.apple.aiml.pnr.ProvisionalSagePnRWrapper.ProvisionalSagePnREvent");
  else
    return CFSTR("com.apple.aiml.pnr.ProvisionalSagePnRWrapper");
}

- (void)setSagePnR:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichEventtype = v3;
  objc_storeStrong((id *)&self->_sagePnR, a3);
}

- (PNRProvisionalSagePnREvent)sagePnR
{
  if (self->_whichEventtype == 101)
    return self->_sagePnR;
  else
    return (PNRProvisionalSagePnREvent *)0;
}

- (void)deleteSagePnR
{
  PNRProvisionalSagePnREvent *sagePnR;

  if (self->_whichEventtype == 101)
  {
    self->_whichEventtype = 0;
    sagePnR = self->_sagePnR;
    self->_sagePnR = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSagePnRWrapperReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PNRProvisionalSagePnRWrapper sagePnR](self, "sagePnR");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRProvisionalSagePnRWrapper sagePnR](self, "sagePnR");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEventtype;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichEventtype = self->_whichEventtype;
    if (whichEventtype == objc_msgSend(v4, "whichEventtype"))
    {
      -[PNRProvisionalSagePnRWrapper sagePnR](self, "sagePnR");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sagePnR");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[PNRProvisionalSagePnRWrapper sagePnR](self, "sagePnR");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[PNRProvisionalSagePnRWrapper sagePnR](self, "sagePnR");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sagePnR");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  return -[PNRProvisionalSagePnREvent hash](self->_sagePnR, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_sagePnR)
  {
    -[PNRProvisionalSagePnRWrapper sagePnR](self, "sagePnR");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sagePnR"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sagePnR"));

    }
  }
  -[PNRProvisionalSagePnRWrapper willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRProvisionalSagePnRWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRProvisionalSagePnRWrapper)initWithJSON:(id)a3
{
  void *v4;
  PNRProvisionalSagePnRWrapper *v5;
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
    self = -[PNRProvisionalSagePnRWrapper initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalSagePnRWrapper)initWithDictionary:(id)a3
{
  id v4;
  PNRProvisionalSagePnRWrapper *v5;
  void *v6;
  PNRProvisionalSagePnREvent *v7;
  PNRProvisionalSagePnRWrapper *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PNRProvisionalSagePnRWrapper;
  v5 = -[PNRProvisionalSagePnRWrapper init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sagePnR"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PNRProvisionalSagePnREvent initWithDictionary:]([PNRProvisionalSagePnREvent alloc], "initWithDictionary:", v6);
      -[PNRProvisionalSagePnRWrapper setSagePnR:](v5, "setSagePnR:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichEventtype
{
  return self->_whichEventtype;
}

- (BOOL)hasSagePnR
{
  return self->_hasSagePnR;
}

- (void)setHasSagePnR:(BOOL)a3
{
  self->_hasSagePnR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sagePnR, 0);
}

@end
