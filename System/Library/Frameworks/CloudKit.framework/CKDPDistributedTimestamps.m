@implementation CKDPDistributedTimestamps

- (void)clearSiteIdentifiers
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_removeAllObjects(self->_siteIdentifiers, a2, v2, v3);
}

- (void)addSiteIdentifiers:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *siteIdentifiers;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  siteIdentifiers = self->_siteIdentifiers;
  v9 = (char *)v4;
  if (!siteIdentifiers)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_siteIdentifiers;
    self->_siteIdentifiers = v7;

    v4 = v9;
    siteIdentifiers = self->_siteIdentifiers;
  }
  objc_msgSend_addObject_(siteIdentifiers, v4, (uint64_t)v4, v5);

}

- (unint64_t)siteIdentifiersCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_siteIdentifiers, a2, v2, v3);
}

- (id)siteIdentifiersAtIndex:(unint64_t)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectAtIndex_(self->_siteIdentifiers, a2, a3, v3);
}

+ (Class)siteIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearSiteVersionVectors
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_removeAllObjects(self->_siteVersionVectors, a2, v2, v3);
}

- (void)addSiteVersionVectors:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *siteVersionVectors;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  siteVersionVectors = self->_siteVersionVectors;
  v9 = (char *)v4;
  if (!siteVersionVectors)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_siteVersionVectors;
    self->_siteVersionVectors = v7;

    v4 = v9;
    siteVersionVectors = self->_siteVersionVectors;
  }
  objc_msgSend_addObject_(siteVersionVectors, v4, (uint64_t)v4, v5);

}

- (unint64_t)siteVersionVectorsCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_siteVersionVectors, a2, v2, v3);
}

- (id)siteVersionVectorsAtIndex:(unint64_t)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectAtIndex_(self->_siteVersionVectors, a2, a3, v3);
}

+ (Class)siteVersionVectorsType
{
  return (Class)objc_opt_class();
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
  v13.super_class = (Class)CKDPDistributedTimestamps;
  -[CKDPDistributedTimestamps description](&v13, sel_description);
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
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  NSMutableArray *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_siteIdentifiers, v6, v7, v8))
  {
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(self->_siteIdentifiers, v13, v14, v15);
    v19 = (void *)objc_msgSend_initWithCapacity_(v12, v17, v16, v18);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v20 = self->_siteIdentifiers;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v59, (uint64_t)v64, 16);
    if (v22)
    {
      v26 = v22;
      v27 = *(_QWORD *)v60;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v60 != v27)
            objc_enumerationMutation(v20);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v59 + 1) + 8 * v28), v23, v24, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v19, v30, (uint64_t)v29, v31);

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v59, (uint64_t)v64, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v5, v32, (uint64_t)v19, (uint64_t)CFSTR("siteIdentifiers"));
  }
  if (objc_msgSend_count(self->_siteVersionVectors, v9, v10, v11))
  {
    v33 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v37 = objc_msgSend_count(self->_siteVersionVectors, v34, v35, v36);
    v40 = (void *)objc_msgSend_initWithCapacity_(v33, v38, v37, v39);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v41 = self->_siteVersionVectors;
    v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v55, (uint64_t)v63, 16);
    if (v43)
    {
      v47 = v43;
      v48 = *(_QWORD *)v56;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v56 != v48)
            objc_enumerationMutation(v41);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v55 + 1) + 8 * v49), v44, v45, v46, (_QWORD)v55);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v40, v51, (uint64_t)v50, v52);

          ++v49;
        }
        while (v47 != v49);
        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v55, (uint64_t)v63, 16);
      }
      while (v47);
    }

    objc_msgSend_setObject_forKey_(v5, v53, (uint64_t)v40, (uint64_t)CFSTR("siteVersionVectors"));
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDistributedTimestampsReadFrom(self, (uint64_t)a3);
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_siteIdentifiers;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, (uint64_t)v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, (uint64_t)v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_siteVersionVectors;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, (uint64_t)v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, (uint64_t)v27, 16);
    }
    while (v15);
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;

  v33 = a3;
  if (objc_msgSend_siteIdentifiersCount(self, v4, v5, v6))
  {
    objc_msgSend_clearSiteIdentifiers(v33, v7, v8, v9);
    v13 = objc_msgSend_siteIdentifiersCount(self, v10, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_siteIdentifiersAtIndex_(self, v7, i, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSiteIdentifiers_(v33, v17, (uint64_t)v16, v18);

      }
    }
  }
  if (objc_msgSend_siteVersionVectorsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearSiteVersionVectors(v33, v19, v20, v21);
    v25 = objc_msgSend_siteVersionVectorsCount(self, v22, v23, v24);
    if (v25)
    {
      v28 = v25;
      for (j = 0; j != v28; ++j)
      {
        objc_msgSend_siteVersionVectorsAtIndex_(self, v26, j, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSiteVersionVectors_(v33, v31, (uint64_t)v30, v32);

      }
    }
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
  void *v12;
  NSMutableArray *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSMutableArray *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (void *)objc_msgSend_init(v8, v9, v10, v11);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = self->_siteIdentifiers;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v40, (uint64_t)v45, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v41;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v13);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v40 + 1) + 8 * v20), v16, (uint64_t)a3, v17);
        objc_msgSend_addSiteIdentifiers_(v12, v22, (uint64_t)v21, v23);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v40, (uint64_t)v45, 16);
    }
    while (v18);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = self->_siteVersionVectors;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v36, (uint64_t)v44, 16);
  if (v26)
  {
    v29 = v26;
    v30 = *(_QWORD *)v37;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(v24);
        v32 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v36 + 1) + 8 * v31), v27, (uint64_t)a3, v28, (_QWORD)v36);
        objc_msgSend_addSiteVersionVectors_(v12, v33, (uint64_t)v32, v34);

        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v36, (uint64_t)v44, 16);
    }
    while (v29);
  }

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
  NSMutableArray *siteIdentifiers;
  uint64_t v11;
  NSMutableArray *siteVersionVectors;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((siteIdentifiers = self->_siteIdentifiers, v11 = v4[1], !((unint64_t)siteIdentifiers | v11))
     || objc_msgSend_isEqual_(siteIdentifiers, v8, v11, v9)))
  {
    siteVersionVectors = self->_siteVersionVectors;
    v13 = v4[2];
    if ((unint64_t)siteVersionVectors | v13)
      isEqual = objc_msgSend_isEqual_(siteVersionVectors, v8, v13, v9);
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

  v5 = objc_msgSend_hash(self->_siteIdentifiers, a2, v2, v3);
  return objc_msgSend_hash(self->_siteVersionVectors, v6, v7, v8) ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
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
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4[1];
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, (uint64_t)v30, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend_addSiteIdentifiers_(self, v8, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12++), v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, (uint64_t)v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v4[2];
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v21, (uint64_t)v29, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v13);
        objc_msgSend_addSiteVersionVectors_(self, v16, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), v17, (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v21, (uint64_t)v29, 16);
    }
    while (v18);
  }

}

- (NSMutableArray)siteIdentifiers
{
  return self->_siteIdentifiers;
}

- (void)setSiteIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_siteIdentifiers, a3);
}

- (NSMutableArray)siteVersionVectors
{
  return self->_siteVersionVectors;
}

- (void)setSiteVersionVectors:(id)a3
{
  objc_storeStrong((id *)&self->_siteVersionVectors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteVersionVectors, 0);
  objc_storeStrong((id *)&self->_siteIdentifiers, 0);
}

@end
