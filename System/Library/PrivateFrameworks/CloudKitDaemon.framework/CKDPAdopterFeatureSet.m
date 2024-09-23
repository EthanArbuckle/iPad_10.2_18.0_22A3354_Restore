@implementation CKDPAdopterFeatureSet

- (int)minimumSchemaVersion
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_minimumSchemaVersion;
  else
    return 1;
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearZoneFeatures
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_zoneFeatures, a2, v2);
}

- (void)addZoneFeatures:(id)a3
{
  const char *v4;
  NSMutableArray *zoneFeatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  zoneFeatures = self->_zoneFeatures;
  v8 = (char *)v4;
  if (!zoneFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_zoneFeatures;
    self->_zoneFeatures = v6;

    v4 = v8;
    zoneFeatures = self->_zoneFeatures;
  }
  objc_msgSend_addObject_(zoneFeatures, v4, (uint64_t)v4);

}

- (unint64_t)zoneFeaturesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_zoneFeatures, a2, v2);
}

- (id)zoneFeaturesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_zoneFeatures, a2, a3);
}

+ (Class)zoneFeaturesType
{
  return (Class)objc_opt_class();
}

- (void)clearRecordFeatures
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_recordFeatures, a2, v2);
}

- (void)addRecordFeatures:(id)a3
{
  const char *v4;
  NSMutableArray *recordFeatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  recordFeatures = self->_recordFeatures;
  v8 = (char *)v4;
  if (!recordFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_recordFeatures;
    self->_recordFeatures = v6;

    v4 = v8;
    recordFeatures = self->_recordFeatures;
  }
  objc_msgSend_addObject_(recordFeatures, v4, (uint64_t)v4);

}

- (unint64_t)recordFeaturesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_recordFeatures, a2, v2);
}

- (id)recordFeaturesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_recordFeatures, a2, a3);
}

+ (Class)recordFeaturesType
{
  return (Class)objc_opt_class();
}

- (void)clearFieldFeatures
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_fieldFeatures, a2, v2);
}

- (void)addFieldFeatures:(id)a3
{
  const char *v4;
  NSMutableArray *fieldFeatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  fieldFeatures = self->_fieldFeatures;
  v8 = (char *)v4;
  if (!fieldFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fieldFeatures;
    self->_fieldFeatures = v6;

    v4 = v8;
    fieldFeatures = self->_fieldFeatures;
  }
  objc_msgSend_addObject_(fieldFeatures, v4, (uint64_t)v4);

}

- (unint64_t)fieldFeaturesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_fieldFeatures, a2, v2);
}

- (id)fieldFeaturesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldFeatures, a2, a3);
}

+ (Class)fieldFeaturesType
{
  return (Class)objc_opt_class();
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
  v11.super_class = (Class)CKDPAdopterFeatureSet;
  -[CKDPAdopterFeatureSet description](&v11, sel_description);
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
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  NSMutableArray *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  NSMutableArray *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_minimumSchemaVersion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, CFSTR("minimumSchemaVersion"));

  }
  if (objc_msgSend_count(self->_zoneFeatures, v4, v5))
  {
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v14 = objc_msgSend_count(self->_zoneFeatures, v12, v13);
    v16 = (void *)objc_msgSend_initWithCapacity_(v11, v15, v14);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v17 = self->_zoneFeatures;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v73, v79, 16);
    if (v19)
    {
      v22 = v19;
      v23 = *(_QWORD *)v74;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v74 != v23)
            objc_enumerationMutation(v17);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v73 + 1) + 8 * v24), v20, v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v26, (uint64_t)v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v73, v79, 16);
      }
      while (v22);
    }

    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v16, CFSTR("zoneFeatures"));
  }
  if (objc_msgSend_count(self->_recordFeatures, v9, v10))
  {
    v30 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v33 = objc_msgSend_count(self->_recordFeatures, v31, v32);
    v35 = (void *)objc_msgSend_initWithCapacity_(v30, v34, v33);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v36 = self->_recordFeatures;
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v69, v78, 16);
    if (v38)
    {
      v41 = v38;
      v42 = *(_QWORD *)v70;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v70 != v42)
            objc_enumerationMutation(v36);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v69 + 1) + 8 * v43), v39, v40);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v35, v45, (uint64_t)v44);

          ++v43;
        }
        while (v41 != v43);
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v69, v78, 16);
      }
      while (v41);
    }

    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v35, CFSTR("recordFeatures"));
  }
  if (objc_msgSend_count(self->_fieldFeatures, v28, v29))
  {
    v47 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v50 = objc_msgSend_count(self->_fieldFeatures, v48, v49);
    v52 = (void *)objc_msgSend_initWithCapacity_(v47, v51, v50);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v53 = self->_fieldFeatures;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v65, v77, 16);
    if (v55)
    {
      v58 = v55;
      v59 = *(_QWORD *)v66;
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v66 != v59)
            objc_enumerationMutation(v53);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v65 + 1) + 8 * v60), v56, v57, (_QWORD)v65);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v52, v62, (uint64_t)v61);

          ++v60;
        }
        while (v58 != v60);
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v65, v77, 16);
      }
      while (v58);
    }

    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v52, CFSTR("fieldFeatures"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAF4AAC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_zoneFeatures;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v34, v40, 16);
    }
    while (v8);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = self->_recordFeatures;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v30, v39, 16);
    }
    while (v15);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_fieldFeatures;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v26, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v26, v38, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  const char *v34;
  id v35;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_minimumSchemaVersion;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v35 = v4;
  if (objc_msgSend_zoneFeaturesCount(self, v5, v6))
  {
    objc_msgSend_clearZoneFeatures(v35, v7, v8);
    v11 = objc_msgSend_zoneFeaturesCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_zoneFeaturesAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addZoneFeatures_(v35, v15, (uint64_t)v14);

      }
    }
  }
  if (objc_msgSend_recordFeaturesCount(self, v7, v8))
  {
    objc_msgSend_clearRecordFeatures(v35, v16, v17);
    v20 = objc_msgSend_recordFeaturesCount(self, v18, v19);
    if (v20)
    {
      v21 = v20;
      for (j = 0; j != v21; ++j)
      {
        objc_msgSend_recordFeaturesAtIndex_(self, v16, j);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addRecordFeatures_(v35, v24, (uint64_t)v23);

      }
    }
  }
  if (objc_msgSend_fieldFeaturesCount(self, v16, v17))
  {
    objc_msgSend_clearFieldFeatures(v35, v25, v26);
    v29 = objc_msgSend_fieldFeaturesCount(self, v27, v28);
    if (v29)
    {
      v31 = v29;
      for (k = 0; k != v31; ++k)
      {
        objc_msgSend_fieldFeaturesAtIndex_(self, v30, k);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFieldFeatures_(v35, v34, (uint64_t)v33);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSMutableArray *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  NSMutableArray *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v11 = (void *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_minimumSchemaVersion;
    *(_BYTE *)(v10 + 40) |= 1u;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = self->_zoneFeatures;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v48, v54, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v49;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v12);
        v19 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v48 + 1) + 8 * v18), v15, (uint64_t)a3);
        objc_msgSend_addZoneFeatures_(v11, v20, (uint64_t)v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v48, v54, 16);
    }
    while (v16);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v21 = self->_recordFeatures;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v44, v53, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v45;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v21);
        v28 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v27), v24, (uint64_t)a3);
        objc_msgSend_addRecordFeatures_(v11, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v44, v53, 16);
    }
    while (v25);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v30 = self->_fieldFeatures;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v40, v52, 16);
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v41;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v30);
        v37 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v40 + 1) + 8 * v36), v33, (uint64_t)a3, (_QWORD)v40);
        objc_msgSend_addFieldFeatures_(v11, v38, (uint64_t)v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v40, v52, 16);
    }
    while (v34);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *zoneFeatures;
  uint64_t v9;
  NSMutableArray *recordFeatures;
  uint64_t v11;
  NSMutableArray *fieldFeatures;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[5] & 1) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((v4[5] & 1) != 0)
  {
LABEL_13:
    isEqual = 0;
    goto LABEL_14;
  }
  zoneFeatures = self->_zoneFeatures;
  v9 = v4[4];
  if ((unint64_t)zoneFeatures | v9 && !objc_msgSend_isEqual_(zoneFeatures, v7, v9))
    goto LABEL_13;
  recordFeatures = self->_recordFeatures;
  v11 = v4[3];
  if ((unint64_t)recordFeatures | v11)
  {
    if (!objc_msgSend_isEqual_(recordFeatures, v7, v11))
      goto LABEL_13;
  }
  fieldFeatures = self->_fieldFeatures;
  v13 = v4[1];
  if ((unint64_t)fieldFeatures | v13)
    isEqual = objc_msgSend_isEqual_(fieldFeatures, v7, v13);
  else
    isEqual = 1;
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_minimumSchemaVersion;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_zoneFeatures, a2, v2) ^ v4;
  v8 = objc_msgSend_hash(self->_recordFeatures, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_fieldFeatures, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_minimumSchemaVersion = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = *((id *)v4 + 4);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v35, v41, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend_addZoneFeatures_(self, v9, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v35, v41, 16);
    }
    while (v10);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v5[3];
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v31, v40, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v13);
        objc_msgSend_addRecordFeatures_(self, v16, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v31, v40, 16);
    }
    while (v17);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v5[1];
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v27, v39, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v28;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v20);
        objc_msgSend_addFieldFeatures_(self, v23, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v26++), (_QWORD)v27);
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v27, v39, 16);
    }
    while (v24);
  }

}

- (NSMutableArray)zoneFeatures
{
  return self->_zoneFeatures;
}

- (void)setZoneFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_zoneFeatures, a3);
}

- (NSMutableArray)recordFeatures
{
  return self->_recordFeatures;
}

- (void)setRecordFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_recordFeatures, a3);
}

- (NSMutableArray)fieldFeatures
{
  return self->_fieldFeatures;
}

- (void)setFieldFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_fieldFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneFeatures, 0);
  objc_storeStrong((id *)&self->_recordFeatures, 0);
  objc_storeStrong((id *)&self->_fieldFeatures, 0);
}

@end
