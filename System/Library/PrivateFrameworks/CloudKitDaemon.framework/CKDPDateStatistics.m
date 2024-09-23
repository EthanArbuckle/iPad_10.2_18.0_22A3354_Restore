@implementation CKDPDateStatistics

- (BOOL)hasCreation
{
  return self->_creation != 0;
}

- (BOOL)hasModification
{
  return self->_modification != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPDateStatistics;
  -[CKDPDateStatistics description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPDate *creation;
  void *v8;
  const char *v9;
  CKDPDate *modification;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  creation = self->_creation;
  if (creation)
  {
    objc_msgSend_dictionaryRepresentation(creation, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("creation"));

  }
  modification = self->_modification;
  if (modification)
  {
    objc_msgSend_dictionaryRepresentation(modification, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("modification"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDateStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_creation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_modification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPDate *creation;
  CKDPDate *modification;
  id v8;

  v4 = a3;
  creation = self->_creation;
  v8 = v4;
  if (creation)
  {
    objc_msgSend_setCreation_(v4, v5, (uint64_t)creation);
    v4 = v8;
  }
  modification = self->_modification;
  if (modification)
  {
    objc_msgSend_setModification_(v8, v5, (uint64_t)modification);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_creation, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_modification, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPDate *creation;
  uint64_t v9;
  CKDPDate *modification;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((creation = self->_creation, v9 = v4[1], !((unint64_t)creation | v9))
     || objc_msgSend_isEqual_(creation, v7, v9)))
  {
    modification = self->_modification;
    v11 = v4[2];
    if ((unint64_t)modification | v11)
      isEqual = objc_msgSend_isEqual_(modification, v7, v11);
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
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_creation, a2, v2);
  return objc_msgSend_hash(self->_modification, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPDate *creation;
  uint64_t v6;
  CKDPDate *modification;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  creation = self->_creation;
  v6 = v4[1];
  v9 = v4;
  if (creation)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(creation, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setCreation_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  modification = self->_modification;
  v8 = v4[2];
  if (modification)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(modification, (const char *)v4, v8);
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setModification_(self, (const char *)v4, v8);
    goto LABEL_12;
  }

}

- (CKDPDate)creation
{
  return self->_creation;
}

- (void)setCreation:(id)a3
{
  objc_storeStrong((id *)&self->_creation, a3);
}

- (CKDPDate)modification
{
  return self->_modification;
}

- (void)setModification:(id)a3
{
  objc_storeStrong((id *)&self->_modification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modification, 0);
  objc_storeStrong((id *)&self->_creation, 0);
}

@end
