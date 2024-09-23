@implementation _CPExperimentInfo

- (BOOL)readFrom:(id)a3
{
  return _CPExperimentInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_CPExperimentInfo namespaceId](self, "namespaceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPExperimentInfo experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPExperimentInfo treatmentId](self, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_CPExperimentInfo deploymentId](self, "deploymentId"))
    PBDataWriterWriteInt32Field();
  v7 = -[_CPExperimentInfo version](self, "version");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
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
  BOOL v22;
  int deploymentId;
  int version;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_CPExperimentInfo namespaceId](self, "namespaceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespaceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_CPExperimentInfo namespaceId](self, "namespaceId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPExperimentInfo namespaceId](self, "namespaceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namespaceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_CPExperimentInfo experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_CPExperimentInfo experimentId](self, "experimentId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPExperimentInfo experimentId](self, "experimentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_CPExperimentInfo treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[_CPExperimentInfo treatmentId](self, "treatmentId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_CPExperimentInfo treatmentId](self, "treatmentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  deploymentId = self->_deploymentId;
  if (deploymentId == objc_msgSend(v4, "deploymentId"))
  {
    version = self->_version;
    v22 = version == objc_msgSend(v4, "version");
    goto LABEL_18;
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_namespaceId, "hash");
  v4 = -[NSString hash](self->_experimentId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_treatmentId, "hash") ^ (2654435761 * self->_deploymentId) ^ (2654435761 * self->_version);
}

- (NSString)namespaceId
{
  return self->_namespaceId;
}

- (void)setNamespaceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(int)a3
{
  self->_deploymentId = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_namespaceId, 0);
}

@end
