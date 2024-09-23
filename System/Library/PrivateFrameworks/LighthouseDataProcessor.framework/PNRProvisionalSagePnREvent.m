@implementation PNRProvisionalSagePnREvent

- (BOOL)hasSagePnRMetadata
{
  return self->_sagePnRMetadata != 0;
}

- (void)deleteSagePnRMetadata
{
  -[PNRProvisionalSagePnREvent setSagePnRMetadata:](self, "setSagePnRMetadata:", 0);
}

- (BOOL)hasRequestGrainMetricsDimension
{
  return self->_requestGrainMetricsDimension != 0;
}

- (void)deleteRequestGrainMetricsDimension
{
  -[PNRProvisionalSagePnREvent setRequestGrainMetricsDimension:](self, "setRequestGrainMetricsDimension:", 0);
}

- (BOOL)hasPlannerGrainMetricsDimension
{
  return self->_plannerGrainMetricsDimension != 0;
}

- (void)deletePlannerGrainMetricsDimension
{
  -[PNRProvisionalSagePnREvent setPlannerGrainMetricsDimension:](self, "setPlannerGrainMetricsDimension:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSagePnREventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PNRProvisionalSagePnREvent sagePnRMetadata](self, "sagePnRMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRProvisionalSagePnREvent sagePnRMetadata](self, "sagePnRMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalSagePnREvent requestGrainMetricsDimension](self, "requestGrainMetricsDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRProvisionalSagePnREvent requestGrainMetricsDimension](self, "requestGrainMetricsDimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalSagePnREvent plannerGrainMetricsDimension](self, "plannerGrainMetricsDimension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRProvisionalSagePnREvent plannerGrainMetricsDimension](self, "plannerGrainMetricsDimension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PNRProvisionalSagePnREvent sagePnRMetadata](self, "sagePnRMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sagePnRMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PNRProvisionalSagePnREvent sagePnRMetadata](self, "sagePnRMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRProvisionalSagePnREvent sagePnRMetadata](self, "sagePnRMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sagePnRMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PNRProvisionalSagePnREvent requestGrainMetricsDimension](self, "requestGrainMetricsDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestGrainMetricsDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PNRProvisionalSagePnREvent requestGrainMetricsDimension](self, "requestGrainMetricsDimension");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRProvisionalSagePnREvent requestGrainMetricsDimension](self, "requestGrainMetricsDimension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestGrainMetricsDimension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PNRProvisionalSagePnREvent plannerGrainMetricsDimension](self, "plannerGrainMetricsDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plannerGrainMetricsDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PNRProvisionalSagePnREvent plannerGrainMetricsDimension](self, "plannerGrainMetricsDimension");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PNRProvisionalSagePnREvent plannerGrainMetricsDimension](self, "plannerGrainMetricsDimension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plannerGrainMetricsDimension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PNRProvisionalSagePnRMetadata hash](self->_sagePnRMetadata, "hash");
  v4 = -[PNRProvisionalRequestGrainMetricsDimension hash](self->_requestGrainMetricsDimension, "hash") ^ v3;
  return v4 ^ -[PNRProvisionalPlannerGrainMetricsDimension hash](self->_plannerGrainMetricsDimension, "hash");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_plannerGrainMetricsDimension)
  {
    -[PNRProvisionalSagePnREvent plannerGrainMetricsDimension](self, "plannerGrainMetricsDimension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("plannerGrainMetricsDimension"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("plannerGrainMetricsDimension"));

    }
  }
  if (self->_requestGrainMetricsDimension)
  {
    -[PNRProvisionalSagePnREvent requestGrainMetricsDimension](self, "requestGrainMetricsDimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestGrainMetricsDimension"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requestGrainMetricsDimension"));

    }
  }
  if (self->_sagePnRMetadata)
  {
    -[PNRProvisionalSagePnREvent sagePnRMetadata](self, "sagePnRMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sagePnRMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("sagePnRMetadata"));

    }
  }
  -[PNRProvisionalSagePnREvent willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRProvisionalSagePnREvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRProvisionalSagePnREvent)initWithJSON:(id)a3
{
  void *v4;
  PNRProvisionalSagePnREvent *v5;
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
    self = -[PNRProvisionalSagePnREvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalSagePnREvent)initWithDictionary:(id)a3
{
  id v4;
  PNRProvisionalSagePnREvent *v5;
  void *v6;
  PNRProvisionalSagePnRMetadata *v7;
  void *v8;
  PNRProvisionalRequestGrainMetricsDimension *v9;
  void *v10;
  PNRProvisionalPlannerGrainMetricsDimension *v11;
  PNRProvisionalSagePnREvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PNRProvisionalSagePnREvent;
  v5 = -[PNRProvisionalSagePnREvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sagePnRMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PNRProvisionalSagePnRMetadata initWithDictionary:]([PNRProvisionalSagePnRMetadata alloc], "initWithDictionary:", v6);
      -[PNRProvisionalSagePnREvent setSagePnRMetadata:](v5, "setSagePnRMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestGrainMetricsDimension"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PNRProvisionalRequestGrainMetricsDimension initWithDictionary:]([PNRProvisionalRequestGrainMetricsDimension alloc], "initWithDictionary:", v8);
      -[PNRProvisionalSagePnREvent setRequestGrainMetricsDimension:](v5, "setRequestGrainMetricsDimension:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plannerGrainMetricsDimension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PNRProvisionalPlannerGrainMetricsDimension initWithDictionary:]([PNRProvisionalPlannerGrainMetricsDimension alloc], "initWithDictionary:", v10);
      -[PNRProvisionalSagePnREvent setPlannerGrainMetricsDimension:](v5, "setPlannerGrainMetricsDimension:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (PNRProvisionalSagePnRMetadata)sagePnRMetadata
{
  return self->_sagePnRMetadata;
}

- (void)setSagePnRMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_sagePnRMetadata, a3);
}

- (PNRProvisionalRequestGrainMetricsDimension)requestGrainMetricsDimension
{
  return self->_requestGrainMetricsDimension;
}

- (void)setRequestGrainMetricsDimension:(id)a3
{
  objc_storeStrong((id *)&self->_requestGrainMetricsDimension, a3);
}

- (PNRProvisionalPlannerGrainMetricsDimension)plannerGrainMetricsDimension
{
  return self->_plannerGrainMetricsDimension;
}

- (void)setPlannerGrainMetricsDimension:(id)a3
{
  objc_storeStrong((id *)&self->_plannerGrainMetricsDimension, a3);
}

- (void)setHasSagePnRMetadata:(BOOL)a3
{
  self->_hasSagePnRMetadata = a3;
}

- (void)setHasRequestGrainMetricsDimension:(BOOL)a3
{
  self->_hasRequestGrainMetricsDimension = a3;
}

- (void)setHasPlannerGrainMetricsDimension:(BOOL)a3
{
  self->_hasPlannerGrainMetricsDimension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plannerGrainMetricsDimension, 0);
  objc_storeStrong((id *)&self->_requestGrainMetricsDimension, 0);
  objc_storeStrong((id *)&self->_sagePnRMetadata, 0);
}

@end
