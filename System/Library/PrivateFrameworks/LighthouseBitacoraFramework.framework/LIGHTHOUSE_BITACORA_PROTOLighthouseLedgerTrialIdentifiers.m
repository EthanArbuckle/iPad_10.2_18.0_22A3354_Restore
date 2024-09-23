@implementation LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers

- (BOOL)hasExperimentIdentifiers
{
  return self->_experimentIdentifiers != 0;
}

- (BOOL)hasBmltIdentifiers
{
  return self->_bmltIdentifiers != 0;
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
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers;
  -[LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers description](&v15, sel_description);
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
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *experimentIdentifiers;
  void *v12;
  const char *v13;
  uint64_t v14;
  LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *bmltIdentifiers;
  void *v16;
  const char *v17;
  uint64_t v18;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  experimentIdentifiers = self->_experimentIdentifiers;
  if (experimentIdentifiers)
  {
    objc_msgSend_dictionaryRepresentation(experimentIdentifiers, v6, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v13, (uint64_t)v12, (uint64_t)CFSTR("experimentIdentifiers"), v14);

  }
  bmltIdentifiers = self->_bmltIdentifiers;
  if (bmltIdentifiers)
  {
    objc_msgSend_dictionaryRepresentation(bmltIdentifiers, v6, v7, v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v17, (uint64_t)v16, (uint64_t)CFSTR("bmltIdentifiers"), v18);

  }
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_experimentIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bmltIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *experimentIdentifiers;
  LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *bmltIdentifiers;
  id v10;

  v4 = a3;
  experimentIdentifiers = self->_experimentIdentifiers;
  v10 = v4;
  if (experimentIdentifiers)
  {
    objc_msgSend_setExperimentIdentifiers_(v4, v5, (uint64_t)experimentIdentifiers, v6, v7);
    v4 = v10;
  }
  bmltIdentifiers = self->_bmltIdentifiers;
  if (bmltIdentifiers)
  {
    objc_msgSend_setBmltIdentifiers_(v10, v5, (uint64_t)bmltIdentifiers, v6, v7);
    v4 = v10;
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

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = objc_msgSend_copyWithZone_(self->_experimentIdentifiers, v15, (uint64_t)a3, v16, v17);
  v19 = (void *)v14[2];
  v14[2] = v18;

  v23 = objc_msgSend_copyWithZone_(self->_bmltIdentifiers, v20, (uint64_t)a3, v21, v22);
  v24 = (void *)v14[1];
  v14[1] = v23;

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
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *experimentIdentifiers;
  uint64_t v13;
  LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *bmltIdentifiers;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)
    && ((experimentIdentifiers = self->_experimentIdentifiers,
         v13 = v4[2],
         !((unint64_t)experimentIdentifiers | v13))
     || objc_msgSend_isEqual_(experimentIdentifiers, v9, v13, v10, v11)))
  {
    bmltIdentifiers = self->_bmltIdentifiers;
    v15 = v4[1];
    if ((unint64_t)bmltIdentifiers | v15)
      isEqual = objc_msgSend_isEqual_(bmltIdentifiers, v9, v15, v10, v11);
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

  v6 = objc_msgSend_hash(self->_experimentIdentifiers, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_bmltIdentifiers, v7, v8, v9, v10) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *experimentIdentifiers;
  uint64_t v8;
  LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *bmltIdentifiers;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  experimentIdentifiers = self->_experimentIdentifiers;
  v8 = v4[2];
  v11 = v4;
  if (experimentIdentifiers)
  {
    if (!v8)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(experimentIdentifiers, (const char *)v4, v8, v5, v6);
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    objc_msgSend_setExperimentIdentifiers_(self, (const char *)v4, v8, v5, v6);
  }
  v4 = v11;
LABEL_7:
  bmltIdentifiers = self->_bmltIdentifiers;
  v10 = v4[1];
  if (bmltIdentifiers)
  {
    if (v10)
    {
      objc_msgSend_mergeFrom_(bmltIdentifiers, (const char *)v4, v10, v5, v6);
LABEL_12:
      v4 = v11;
    }
  }
  else if (v10)
  {
    objc_msgSend_setBmltIdentifiers_(self, (const char *)v4, v10, v5, v6);
    goto LABEL_12;
  }

}

- (LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (void)setExperimentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_experimentIdentifiers, a3);
}

- (LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers)bmltIdentifiers
{
  return self->_bmltIdentifiers;
}

- (void)setBmltIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_bmltIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_bmltIdentifiers, 0);
}

@end
