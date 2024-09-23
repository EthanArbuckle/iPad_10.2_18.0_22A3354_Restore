@implementation CKDPDistributedTimestampsSiteVersionVectors

- (BOOL)hasPreviousVector
{
  return self->_previousVector != 0;
}

- (BOOL)hasContentsVector
{
  return self->_contentsVector != 0;
}

- (BOOL)hasRemovalsVector
{
  return self->_removalsVector != 0;
}

- (BOOL)hasDependenciesVector
{
  return self->_dependenciesVector != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKDPDistributedTimestampsSiteVersionVectors;
  -[CKDPDistributedTimestampsSiteVersionVectors description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CKDPDistributedTimestampsVersionVector *previousVector;
  void *v10;
  const char *v11;
  CKDPDistributedTimestampsVersionVector *contentsVector;
  void *v13;
  const char *v14;
  CKDPDistributedTimestampsVersionVector *removalsVector;
  void *v16;
  const char *v17;
  CKDPDistributedTimestampsVersionVector *dependenciesVector;
  void *v19;
  const char *v20;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  previousVector = self->_previousVector;
  if (previousVector)
  {
    objc_msgSend_dictionaryRepresentation(previousVector, v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, (uint64_t)CFSTR("previousVector"));

  }
  contentsVector = self->_contentsVector;
  if (contentsVector)
  {
    objc_msgSend_dictionaryRepresentation(contentsVector, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, (uint64_t)CFSTR("contentsVector"));

  }
  removalsVector = self->_removalsVector;
  if (removalsVector)
  {
    objc_msgSend_dictionaryRepresentation(removalsVector, v5, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, (uint64_t)CFSTR("removalsVector"));

  }
  dependenciesVector = self->_dependenciesVector;
  if (dependenciesVector)
  {
    objc_msgSend_dictionaryRepresentation(dependenciesVector, v5, v6, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v19, (uint64_t)CFSTR("dependenciesVector"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDistributedTimestampsSiteVersionVectorsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_previousVector)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_contentsVector)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_removalsVector)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_dependenciesVector)
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
  CKDPDistributedTimestampsVersionVector *previousVector;
  CKDPDistributedTimestampsVersionVector *contentsVector;
  CKDPDistributedTimestampsVersionVector *removalsVector;
  CKDPDistributedTimestampsVersionVector *dependenciesVector;
  id v11;

  v4 = a3;
  previousVector = self->_previousVector;
  v11 = v4;
  if (previousVector)
  {
    objc_msgSend_setPreviousVector_(v4, v5, (uint64_t)previousVector, v6);
    v4 = v11;
  }
  contentsVector = self->_contentsVector;
  if (contentsVector)
  {
    objc_msgSend_setContentsVector_(v11, v5, (uint64_t)contentsVector, v6);
    v4 = v11;
  }
  removalsVector = self->_removalsVector;
  if (removalsVector)
  {
    objc_msgSend_setRemovalsVector_(v11, v5, (uint64_t)removalsVector, v6);
    v4 = v11;
  }
  dependenciesVector = self->_dependenciesVector;
  if (dependenciesVector)
  {
    objc_msgSend_setDependenciesVector_(v11, v5, (uint64_t)dependenciesVector, v6);
    v4 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_previousVector, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[3];
  v12[3] = v15;

  v19 = objc_msgSend_copyWithZone_(self->_contentsVector, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[1];
  v12[1] = v19;

  v23 = objc_msgSend_copyWithZone_(self->_removalsVector, v21, (uint64_t)a3, v22);
  v24 = (void *)v12[4];
  v12[4] = v23;

  v27 = objc_msgSend_copyWithZone_(self->_dependenciesVector, v25, (uint64_t)a3, v26);
  v28 = (void *)v12[2];
  v12[2] = v27;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKDPDistributedTimestampsVersionVector *previousVector;
  uint64_t v11;
  CKDPDistributedTimestampsVersionVector *contentsVector;
  uint64_t v13;
  CKDPDistributedTimestampsVersionVector *removalsVector;
  uint64_t v15;
  CKDPDistributedTimestampsVersionVector *dependenciesVector;
  uint64_t v17;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((previousVector = self->_previousVector, v11 = v4[3], !((unint64_t)previousVector | v11))
     || objc_msgSend_isEqual_(previousVector, v8, v11, v9))
    && ((contentsVector = self->_contentsVector, v13 = v4[1], !((unint64_t)contentsVector | v13))
     || objc_msgSend_isEqual_(contentsVector, v8, v13, v9))
    && ((removalsVector = self->_removalsVector, v15 = v4[4], !((unint64_t)removalsVector | v15))
     || objc_msgSend_isEqual_(removalsVector, v8, v15, v9)))
  {
    dependenciesVector = self->_dependenciesVector;
    v17 = v4[2];
    if ((unint64_t)dependenciesVector | v17)
      isEqual = objc_msgSend_isEqual_(dependenciesVector, v8, v17, v9);
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
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = objc_msgSend_hash(self->_previousVector, a2, v2, v3);
  v9 = objc_msgSend_hash(self->_contentsVector, v6, v7, v8) ^ v5;
  v13 = objc_msgSend_hash(self->_removalsVector, v10, v11, v12);
  return v9 ^ v13 ^ objc_msgSend_hash(self->_dependenciesVector, v14, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  CKDPDistributedTimestampsVersionVector *previousVector;
  uint64_t v7;
  CKDPDistributedTimestampsVersionVector *contentsVector;
  uint64_t v9;
  CKDPDistributedTimestampsVersionVector *removalsVector;
  uint64_t v11;
  CKDPDistributedTimestampsVersionVector *dependenciesVector;
  uint64_t v13;
  _QWORD *v14;

  v4 = a3;
  previousVector = self->_previousVector;
  v7 = v4[3];
  v14 = v4;
  if (previousVector)
  {
    if (!v7)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(previousVector, (const char *)v4, v7, v5);
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    objc_msgSend_setPreviousVector_(self, (const char *)v4, v7, v5);
  }
  v4 = v14;
LABEL_7:
  contentsVector = self->_contentsVector;
  v9 = v4[1];
  if (contentsVector)
  {
    if (!v9)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(contentsVector, (const char *)v4, v9, v5);
  }
  else
  {
    if (!v9)
      goto LABEL_13;
    objc_msgSend_setContentsVector_(self, (const char *)v4, v9, v5);
  }
  v4 = v14;
LABEL_13:
  removalsVector = self->_removalsVector;
  v11 = v4[4];
  if (removalsVector)
  {
    if (!v11)
      goto LABEL_19;
    objc_msgSend_mergeFrom_(removalsVector, (const char *)v4, v11, v5);
  }
  else
  {
    if (!v11)
      goto LABEL_19;
    objc_msgSend_setRemovalsVector_(self, (const char *)v4, v11, v5);
  }
  v4 = v14;
LABEL_19:
  dependenciesVector = self->_dependenciesVector;
  v13 = v4[2];
  if (dependenciesVector)
  {
    if (v13)
    {
      objc_msgSend_mergeFrom_(dependenciesVector, (const char *)v4, v13, v5);
LABEL_24:
      v4 = v14;
    }
  }
  else if (v13)
  {
    objc_msgSend_setDependenciesVector_(self, (const char *)v4, v13, v5);
    goto LABEL_24;
  }

}

- (CKDPDistributedTimestampsVersionVector)previousVector
{
  return self->_previousVector;
}

- (void)setPreviousVector:(id)a3
{
  objc_storeStrong((id *)&self->_previousVector, a3);
}

- (CKDPDistributedTimestampsVersionVector)contentsVector
{
  return self->_contentsVector;
}

- (void)setContentsVector:(id)a3
{
  objc_storeStrong((id *)&self->_contentsVector, a3);
}

- (CKDPDistributedTimestampsVersionVector)removalsVector
{
  return self->_removalsVector;
}

- (void)setRemovalsVector:(id)a3
{
  objc_storeStrong((id *)&self->_removalsVector, a3);
}

- (CKDPDistributedTimestampsVersionVector)dependenciesVector
{
  return self->_dependenciesVector;
}

- (void)setDependenciesVector:(id)a3
{
  objc_storeStrong((id *)&self->_dependenciesVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalsVector, 0);
  objc_storeStrong((id *)&self->_previousVector, 0);
  objc_storeStrong((id *)&self->_dependenciesVector, 0);
  objc_storeStrong((id *)&self->_contentsVector, 0);
}

@end
