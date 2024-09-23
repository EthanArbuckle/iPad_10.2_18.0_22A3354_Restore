@implementation IDSQRProtoPutMaterialIndication

- (void)clearMaterials
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_materials, a2, v2, v3);
}

- (void)addMaterials:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *materials;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  materials = self->_materials;
  v9 = (char *)v4;
  if (!materials)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_materials;
    self->_materials = v7;

    v4 = v9;
    materials = self->_materials;
  }
  objc_msgSend_addObject_(materials, v4, (uint64_t)v4, v5);

}

- (unint64_t)materialsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_materials, a2, v2, v3);
}

- (id)materialsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_materials, a2, a3, v3);
}

+ (Class)materialsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMissingMaterial
{
  return self->_missingMaterial != 0;
}

- (void)setTxnId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_txnId = a3;
}

- (void)setHasTxnId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxnId
{
  return *(_BYTE *)&self->_has & 1;
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
  v13.super_class = (Class)IDSQRProtoPutMaterialIndication;
  -[IDSQRProtoPutMaterialIndication description](&v13, sel_description);
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
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  NSMutableArray *v20;
  const char *v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  IDSQRProtoPutMaterialErrorIndication *missingMaterial;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
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
  if (objc_msgSend_count(self->_materials, v6, v7, v8))
  {
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(self->_materials, v13, v14, v15);
    v19 = (void *)objc_msgSend_initWithCapacity_(v12, v17, v16, v18);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v20 = self->_materials;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v43, v22, v47, 16);
    if (v23)
    {
      v27 = v23;
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v20);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v43 + 1) + 8 * i), v24, v25, v26, (_QWORD)v43);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v19, v31, (uint64_t)v30, v32);

        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v24, (uint64_t)&v43, v26, v47, 16);
      }
      while (v27);
    }

    objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v19, v34, CFSTR("materials"));
  }
  missingMaterial = self->_missingMaterial;
  if (missingMaterial)
  {
    objc_msgSend_dictionaryRepresentation(missingMaterial, v9, v10, v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v37, (uint64_t)v36, v38, CFSTR("missing_material"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v9, self->_txnId, v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v40, (uint64_t)v39, v41, CFSTR("txn_id"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPutMaterialIndicationReadFrom((uint64_t)self, (uint64_t)a3);
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
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_materials;
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

  if (self->_missingMaterial)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  double v18;
  IDSQRProtoPutMaterialErrorIndication *missingMaterial;
  id v20;

  v20 = a3;
  if (objc_msgSend_materialsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearMaterials(v20, v7, v8, v9);
    v13 = objc_msgSend_materialsCount(self, v10, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_materialsAtIndex_(self, v7, i, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addMaterials_(v20, v17, (uint64_t)v16, v18);

      }
    }
  }
  missingMaterial = self->_missingMaterial;
  if (missingMaterial)
    objc_msgSend_setMissingMaterial_(v20, v7, (uint64_t)missingMaterial, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v20 + 1) = self->_txnId;
    *((_BYTE *)v20 + 32) |= 1u;
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
  uint64_t v12;
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
  const char *v25;
  double v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_materials;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v30, v15, v34, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v31;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v13);
        v22 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v21), v17, (uint64_t)a3, v18, (_QWORD)v30);
        objc_msgSend_addMaterials_((void *)v12, v23, (uint64_t)v22, v24);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v30, v18, v34, 16);
    }
    while (v19);
  }

  v27 = objc_msgSend_copyWithZone_(self->_missingMaterial, v25, (uint64_t)a3, v26);
  v28 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v27;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v12 + 8) = self->_txnId;
    *(_BYTE *)(v12 + 32) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSMutableArray *materials;
  uint64_t v11;
  IDSQRProtoPutMaterialErrorIndication *missingMaterial;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_10;
  materials = self->_materials;
  v11 = v4[2];
  if ((unint64_t)materials | v11)
  {
    if (!objc_msgSend_isEqual_(materials, v8, v11, v9))
      goto LABEL_10;
  }
  missingMaterial = self->_missingMaterial;
  v13 = v4[3];
  if ((unint64_t)missingMaterial | v13)
  {
    if (!objc_msgSend_isEqual_(missingMaterial, v8, v13, v9))
      goto LABEL_10;
  }
  v14 = (v4[4] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) != 0 && self->_txnId == v4[1])
    {
      v14 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  unint64_t v10;

  v5 = objc_msgSend_hash(self->_materials, a2, v2, v3);
  v9 = objc_msgSend_hash(self->_missingMaterial, v6, v7, v8);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761u * self->_txnId;
  else
    v10 = 0;
  return v9 ^ v5 ^ v10;
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
  uint64_t i;
  const char *v14;
  double v15;
  IDSQRProtoPutMaterialErrorIndication *missingMaterial;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 2);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, v7, v22, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend_addMaterials_(self, v9, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v10, (_QWORD)v18);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v18, v10, v22, 16);
    }
    while (v11);
  }

  missingMaterial = self->_missingMaterial;
  v17 = *((_QWORD *)v4 + 3);
  if (missingMaterial)
  {
    if (v17)
      objc_msgSend_mergeFrom_(missingMaterial, v14, v17, v15);
  }
  else if (v17)
  {
    objc_msgSend_setMissingMaterial_(self, v14, v17, v15);
  }
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_txnId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSMutableArray)materials
{
  return self->_materials;
}

- (void)setMaterials:(id)a3
{
  objc_storeStrong((id *)&self->_materials, a3);
}

- (IDSQRProtoPutMaterialErrorIndication)missingMaterial
{
  return self->_missingMaterial;
}

- (void)setMissingMaterial:(id)a3
{
  objc_storeStrong((id *)&self->_missingMaterial, a3);
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingMaterial, 0);
  objc_storeStrong((id *)&self->_materials, 0);
}

@end
