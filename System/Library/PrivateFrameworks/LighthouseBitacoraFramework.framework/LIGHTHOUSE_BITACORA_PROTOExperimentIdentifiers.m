@implementation LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers

- (BOOL)hasTrialExperimentID
{
  return self->_trialExperimentID != 0;
}

- (BOOL)hasTrialDeploymentID
{
  return self->_trialDeploymentID != 0;
}

- (BOOL)hasTrialTreatmentID
{
  return self->_trialTreatmentID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers;
  -[LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("%@ %@"), v11, v12, v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSString *trialExperimentID;
  NSString *trialDeploymentID;
  NSString *trialTreatmentID;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  trialExperimentID = self->_trialExperimentID;
  if (trialExperimentID)
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)trialExperimentID, (uint64_t)CFSTR("trialExperimentID"), v8);
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID)
    objc_msgSend_setObject_forKey_(v9, v7, (uint64_t)trialDeploymentID, (uint64_t)CFSTR("trialDeploymentID"), v8);
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID)
    objc_msgSend_setObject_forKey_(v9, v7, (uint64_t)trialTreatmentID, (uint64_t)CFSTR("trialTreatmentID"), v8);
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_trialExperimentID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_trialDeploymentID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_trialTreatmentID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *trialExperimentID;
  NSString *trialDeploymentID;
  NSString *trialTreatmentID;
  id v11;

  v4 = a3;
  trialExperimentID = self->_trialExperimentID;
  v11 = v4;
  if (trialExperimentID)
  {
    objc_msgSend_setTrialExperimentID_(v4, v5, (uint64_t)trialExperimentID, v6, v7);
    v4 = v11;
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID)
  {
    objc_msgSend_setTrialDeploymentID_(v11, v5, (uint64_t)trialDeploymentID, v6, v7);
    v4 = v11;
  }
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID)
  {
    objc_msgSend_setTrialTreatmentID_(v11, v5, (uint64_t)trialTreatmentID, v6, v7);
    v4 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = objc_msgSend_copyWithZone_(self->_trialExperimentID, v15, (uint64_t)a3, v16, v17);
  v19 = (void *)v14[2];
  v14[2] = v18;

  v23 = objc_msgSend_copyWithZone_(self->_trialDeploymentID, v20, (uint64_t)a3, v21, v22);
  v24 = (void *)v14[1];
  v14[1] = v23;

  v28 = objc_msgSend_copyWithZone_(self->_trialTreatmentID, v25, (uint64_t)a3, v26, v27);
  v29 = (void *)v14[3];
  v14[3] = v28;

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *trialExperimentID;
  uint64_t v13;
  NSString *trialDeploymentID;
  uint64_t v15;
  NSString *trialTreatmentID;
  uint64_t v17;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)
    && ((trialExperimentID = self->_trialExperimentID, v13 = v4[2], !((unint64_t)trialExperimentID | v13))
     || objc_msgSend_isEqual_(trialExperimentID, v9, v13, v10, v11))
    && ((trialDeploymentID = self->_trialDeploymentID, v15 = v4[1], !((unint64_t)trialDeploymentID | v15))
     || objc_msgSend_isEqual_(trialDeploymentID, v9, v15, v10, v11)))
  {
    trialTreatmentID = self->_trialTreatmentID;
    v17 = v4[3];
    if ((unint64_t)trialTreatmentID | v17)
      isEqual = objc_msgSend_isEqual_(trialTreatmentID, v9, v17, v10, v11);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = objc_msgSend_hash(self->_trialExperimentID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_trialDeploymentID, v7, v8, v9, v10) ^ v6;
  return v11 ^ objc_msgSend_hash(self->_trialTreatmentID, v12, v13, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  v7 = v10[2];
  if (v7)
    objc_msgSend_setTrialExperimentID_(self, v4, v7, v5, v6);
  v8 = v10[1];
  if (v8)
    objc_msgSend_setTrialDeploymentID_(self, v4, v8, v5, v6);
  v9 = v10[3];
  if (v9)
    objc_msgSend_setTrialTreatmentID_(self, v4, v9, v5, v6);

}

- (NSString)trialExperimentID
{
  return self->_trialExperimentID;
}

- (void)setTrialExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentID, a3);
}

- (NSString)trialDeploymentID
{
  return self->_trialDeploymentID;
}

- (void)setTrialDeploymentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialDeploymentID, a3);
}

- (NSString)trialTreatmentID
{
  return self->_trialTreatmentID;
}

- (void)setTrialTreatmentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialDeploymentID, 0);
}

@end
