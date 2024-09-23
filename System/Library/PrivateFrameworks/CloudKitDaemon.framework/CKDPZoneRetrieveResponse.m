@implementation CKDPZoneRetrieveResponse

- (void)clearZoneSummarys
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_zoneSummarys, a2, v2);
}

- (void)addZoneSummary:(id)a3
{
  const char *v4;
  NSMutableArray *zoneSummarys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  zoneSummarys = self->_zoneSummarys;
  v8 = (char *)v4;
  if (!zoneSummarys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_zoneSummarys;
    self->_zoneSummarys = v6;

    v4 = v8;
    zoneSummarys = self->_zoneSummarys;
  }
  objc_msgSend_addObject_(zoneSummarys, v4, (uint64_t)v4);

}

- (unint64_t)zoneSummarysCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_zoneSummarys, a2, v2);
}

- (id)zoneSummaryAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_zoneSummarys, a2, a3);
}

+ (Class)zoneSummaryType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContinuationMarker
{
  return self->_continuationMarker != 0;
}

- (void)clearAnonymousZoneInfos
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_anonymousZoneInfos, a2, v2);
}

- (void)addAnonymousZoneInfo:(id)a3
{
  const char *v4;
  NSMutableArray *anonymousZoneInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  anonymousZoneInfos = self->_anonymousZoneInfos;
  v8 = (char *)v4;
  if (!anonymousZoneInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_anonymousZoneInfos;
    self->_anonymousZoneInfos = v6;

    v4 = v8;
    anonymousZoneInfos = self->_anonymousZoneInfos;
  }
  objc_msgSend_addObject_(anonymousZoneInfos, v4, (uint64_t)v4);

}

- (unint64_t)anonymousZoneInfosCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_anonymousZoneInfos, a2, v2);
}

- (id)anonymousZoneInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_anonymousZoneInfos, a2, a3);
}

+ (Class)anonymousZoneInfoType
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
  v11.super_class = (Class)CKDPZoneRetrieveResponse;
  -[CKDPZoneRetrieveResponse description](&v11, sel_description);
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
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  const char *v24;
  NSData *continuationMarker;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  NSMutableArray *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  const char *v41;
  const char *v42;
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
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_zoneSummarys, v5, v6))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend_count(self->_zoneSummarys, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v14 = self->_zoneSummarys;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v48, v53, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v48 + 1) + 8 * i), v17, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v48, v53, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, CFSTR("zoneSummary"));
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker)
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)continuationMarker, CFSTR("continuationMarker"));
  if (objc_msgSend_count(self->_anonymousZoneInfos, v7, (uint64_t)continuationMarker))
  {
    v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v29 = objc_msgSend_count(self->_anonymousZoneInfos, v27, v28);
    v31 = (void *)objc_msgSend_initWithCapacity_(v26, v30, v29);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = self->_anonymousZoneInfos;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v44, v52, 16);
    if (v34)
    {
      v37 = v34;
      v38 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v45 != v38)
            objc_enumerationMutation(v32);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v44 + 1) + 8 * j), v35, v36, (_QWORD)v44);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v31, v41, (uint64_t)v40);

        }
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v44, v52, 16);
      }
      while (v37);
    }

    objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v31, CFSTR("anonymousZoneInfo"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBA0B9C(self, (uint64_t)a3);
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
  v5 = self->_zoneSummarys;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
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
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  if (self->_continuationMarker)
    PBDataWriterWriteDataField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_anonymousZoneInfos;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
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
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  NSData *continuationMarker;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  const char *v25;
  id v26;

  v26 = a3;
  if (objc_msgSend_zoneSummarysCount(self, v4, v5))
  {
    objc_msgSend_clearZoneSummarys(v26, v6, v7);
    v10 = objc_msgSend_zoneSummarysCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_zoneSummaryAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addZoneSummary_(v26, v14, (uint64_t)v13);

      }
    }
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker)
    objc_msgSend_setContinuationMarker_(v26, v6, (uint64_t)continuationMarker);
  if (objc_msgSend_anonymousZoneInfosCount(self, v6, (uint64_t)continuationMarker))
  {
    objc_msgSend_clearAnonymousZoneInfos(v26, v16, v17);
    v20 = objc_msgSend_anonymousZoneInfosCount(self, v18, v19);
    if (v20)
    {
      v22 = v20;
      for (j = 0; j != v22; ++j)
      {
        objc_msgSend_anonymousZoneInfoAtIndex_(self, v21, j);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAnonymousZoneInfo_(v26, v25, (uint64_t)v24);

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
  _QWORD *v10;
  NSMutableArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = self->_zoneSummarys;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v37, v42, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v38;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v37 + 1) + 8 * v17), v14, (uint64_t)a3);
        objc_msgSend_addZoneSummary_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v37, v42, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend_copyWithZone_(self->_continuationMarker, v20, (uint64_t)a3);
  v22 = (void *)v10[2];
  v10[2] = v21;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = self->_anonymousZoneInfos;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v33, v41, 16);
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v34;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v23);
        v30 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v29), v26, (uint64_t)a3, (_QWORD)v33);
        objc_msgSend_addAnonymousZoneInfo_(v10, v31, (uint64_t)v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v33, v41, 16);
    }
    while (v27);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *zoneSummarys;
  uint64_t v9;
  NSData *continuationMarker;
  uint64_t v11;
  NSMutableArray *anonymousZoneInfos;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((zoneSummarys = self->_zoneSummarys, v9 = v4[3], !((unint64_t)zoneSummarys | v9))
     || objc_msgSend_isEqual_(zoneSummarys, v7, v9))
    && ((continuationMarker = self->_continuationMarker, v11 = v4[2], !((unint64_t)continuationMarker | v11))
     || objc_msgSend_isEqual_(continuationMarker, v7, v11)))
  {
    anonymousZoneInfos = self->_anonymousZoneInfos;
    v13 = v4[1];
    if ((unint64_t)anonymousZoneInfos | v13)
      isEqual = objc_msgSend_isEqual_(anonymousZoneInfos, v7, v13);
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
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_hash(self->_zoneSummarys, a2, v2);
  v7 = objc_msgSend_hash(self->_continuationMarker, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_anonymousZoneInfos, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
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
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = *((id *)v4 + 3);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, v30, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend_addZoneSummary_(self, v8, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, v30, 16);
    }
    while (v9);
  }

  v13 = *((_QWORD *)v4 + 2);
  if (v13)
    objc_msgSend_setContinuationMarker_(self, v12, v13);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = *((id *)v4 + 1);
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v29, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend_addAnonymousZoneInfo_(self, v17, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v21, v29, 16);
    }
    while (v18);
  }

}

- (NSMutableArray)zoneSummarys
{
  return self->_zoneSummarys;
}

- (void)setZoneSummarys:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSummarys, a3);
}

- (NSData)continuationMarker
{
  return self->_continuationMarker;
}

- (void)setContinuationMarker:(id)a3
{
  objc_storeStrong((id *)&self->_continuationMarker, a3);
}

- (NSMutableArray)anonymousZoneInfos
{
  return self->_anonymousZoneInfos;
}

- (void)setAnonymousZoneInfos:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousZoneInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSummarys, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
  objc_storeStrong((id *)&self->_anonymousZoneInfos, 0);
}

@end
