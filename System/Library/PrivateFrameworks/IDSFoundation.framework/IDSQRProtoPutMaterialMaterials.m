@implementation IDSQRProtoPutMaterialMaterials

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
  v13.super_class = (Class)IDSQRProtoPutMaterialMaterials;
  -[IDSQRProtoPutMaterialMaterials description](&v13, sel_description);
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
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_materials, v6, v7, v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend_count(self->_materials, v10, v11, v12);
    v16 = (void *)objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = self->_materials;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v33, v19, v37, 16);
    if (v20)
    {
      v24 = v20;
      v25 = *(_QWORD *)v34;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v17);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v26), v21, v22, v23, (_QWORD)v33);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v28, (uint64_t)v27, v29);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v33, v23, v37, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v30, (uint64_t)v16, v31, CFSTR("materials"));
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPutMaterialMaterialsReadFrom(self, (uint64_t)a3);
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
  const char *v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  double v20;
  id v21;

  v21 = a3;
  if (objc_msgSend_materialsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearMaterials(v21, v7, v8, v9);
    v13 = objc_msgSend_materialsCount(self, v10, v11, v12);
    if (v13)
    {
      v16 = v13;
      for (i = 0; i != v16; ++i)
      {
        objc_msgSend_materialsAtIndex_(self, v14, i, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addMaterials_(v21, v19, (uint64_t)v18, v20);

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
  void *v12;
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
  v12 = (void *)objc_msgSend_init(v8, v9, v10, v11);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_materials;
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
        objc_msgSend_addMaterials_(v12, v23, (uint64_t)v22, v24);

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
  NSMutableArray *materials;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    materials = self->_materials;
    v11 = v4[1];
    if ((unint64_t)materials | v11)
      isEqual = objc_msgSend_isEqual_(materials, v8, v11, v9);
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

  return objc_msgSend_hash(self->_materials, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *((id *)a3 + 1);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, v6, v17, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend_addMaterials_(self, v8, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v9, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v13, v9, v17, 16);
    }
    while (v10);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materials, 0);
}

@end
