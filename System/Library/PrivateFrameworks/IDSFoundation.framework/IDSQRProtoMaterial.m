@implementation IDSQRProtoMaterial

- (void)clearMaterialInfos
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_materialInfos, a2, v2, v3);
}

- (void)addMaterialInfo:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *materialInfos;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  materialInfos = self->_materialInfos;
  v9 = (char *)v4;
  if (!materialInfos)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_materialInfos;
    self->_materialInfos = v7;

    v4 = v9;
    materialInfos = self->_materialInfos;
  }
  objc_msgSend_addObject_(materialInfos, v4, (uint64_t)v4, v5);

}

- (unint64_t)materialInfosCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_materialInfos, a2, v2, v3);
}

- (id)materialInfoAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_materialInfos, a2, a3, v3);
}

+ (Class)materialInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoMaterial;
  -[IDSQRProtoMaterial description](&v13, sel_description);
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
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  id v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  double v25;
  void *v26;
  NSMutableArray *v27;
  const char *v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, self->_ownerParticipantId, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("owner_participant_id"));

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v11, self->_receiverParticipantId, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, v15, CFSTR("receiver_participant_id"));

  if (objc_msgSend_count(self->_materialInfos, v16, v17, v18))
  {
    v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v23 = objc_msgSend_count(self->_materialInfos, v20, v21, v22);
    v26 = (void *)objc_msgSend_initWithCapacity_(v19, v24, v23, v25);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v27 = self->_materialInfos;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v43, v29, v47, 16);
    if (v30)
    {
      v34 = v30;
      v35 = *(_QWORD *)v44;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v27);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v43 + 1) + 8 * v36), v31, v32, v33, (_QWORD)v43);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v26, v38, (uint64_t)v37, v39);

          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v31, (uint64_t)&v43, v33, v47, 16);
      }
      while (v34);
    }

    objc_msgSend_setObject_forKey_(v5, v40, (uint64_t)v26, v41, CFSTR("material_info"));
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoMaterialReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_materialInfos;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v7, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v14, v13, v18, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  double v21;
  id v22;

  v4 = a3;
  v4[1] = self->_ownerParticipantId;
  v22 = v4;
  v4[2] = self->_receiverParticipantId;
  if (objc_msgSend_materialInfosCount(self, v5, v6, v7))
  {
    objc_msgSend_clearMaterialInfos(v22, v8, v9, v10);
    v14 = objc_msgSend_materialInfosCount(self, v11, v12, v13);
    if (v14)
    {
      v17 = v14;
      for (i = 0; i != v17; ++i)
      {
        objc_msgSend_materialInfoAtIndex_(self, v15, i, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addMaterialInfo_(v22, v20, (uint64_t)v19, v21);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  _QWORD *v12;
  NSMutableArray *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v12[1] = self->_ownerParticipantId;
  v12[2] = self->_receiverParticipantId;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_materialInfos;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v15, v30, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v13);
        v22 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v21), v17, (uint64_t)a3, v18, (_QWORD)v26);
        objc_msgSend_addMaterialInfo_(v12, v23, (uint64_t)v22, v24);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v26, v18, v30, 16);
    }
    while (v19);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSMutableArray *materialInfos;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && self->_ownerParticipantId == v4[1]
    && self->_receiverParticipantId == v4[2])
  {
    materialInfos = self->_materialInfos;
    v11 = v4[3];
    if ((unint64_t)materialInfos | v11)
      isEqual = objc_msgSend_isEqual_(materialInfos, v8, v11, v9);
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
  double v3;
  unint64_t v4;

  v4 = (2654435761u * self->_receiverParticipantId) ^ (2654435761u * self->_ownerParticipantId);
  return v4 ^ objc_msgSend_hash(self->_materialInfos, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_ownerParticipantId = *((_QWORD *)v4 + 1);
  self->_receiverParticipantId = *((_QWORD *)v4 + 2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *((id *)v4 + 3);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v7, v18, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend_addMaterialInfo_(self, v9, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v10, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v14, v10, v18, 16);
    }
    while (v11);
  }

}

- (unint64_t)ownerParticipantId
{
  return self->_ownerParticipantId;
}

- (void)setOwnerParticipantId:(unint64_t)a3
{
  self->_ownerParticipantId = a3;
}

- (unint64_t)receiverParticipantId
{
  return self->_receiverParticipantId;
}

- (void)setReceiverParticipantId:(unint64_t)a3
{
  self->_receiverParticipantId = a3;
}

- (NSMutableArray)materialInfos
{
  return self->_materialInfos;
}

- (void)setMaterialInfos:(id)a3
{
  objc_storeStrong((id *)&self->_materialInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialInfos, 0);
}

@end
