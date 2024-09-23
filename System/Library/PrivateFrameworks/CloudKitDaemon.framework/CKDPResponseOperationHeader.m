@implementation CKDPResponseOperationHeader

- (NSMutableArray)throttleConfigs
{
  return self->_throttleConfigs;
}

- (NSMutableArray)assetAuthorizationResponses
{
  return self->_assetAuthorizationResponses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleConfigs, 0);
  objc_storeStrong((id *)&self->_assetAuthorizationResponses, 0);
}

- (void)clearAssetAuthorizationResponses
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_assetAuthorizationResponses, a2, v2);
}

- (void)addAssetAuthorizationResponses:(id)a3
{
  const char *v4;
  NSMutableArray *assetAuthorizationResponses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  assetAuthorizationResponses = self->_assetAuthorizationResponses;
  v8 = (char *)v4;
  if (!assetAuthorizationResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_assetAuthorizationResponses;
    self->_assetAuthorizationResponses = v6;

    v4 = v8;
    assetAuthorizationResponses = self->_assetAuthorizationResponses;
  }
  objc_msgSend_addObject_(assetAuthorizationResponses, v4, (uint64_t)v4);

}

- (unint64_t)assetAuthorizationResponsesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_assetAuthorizationResponses, a2, v2);
}

- (id)assetAuthorizationResponsesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assetAuthorizationResponses, a2, a3);
}

+ (Class)assetAuthorizationResponsesType
{
  return (Class)objc_opt_class();
}

- (void)clearThrottleConfigs
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_throttleConfigs, a2, v2);
}

- (void)addThrottleConfig:(id)a3
{
  const char *v4;
  NSMutableArray *throttleConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  throttleConfigs = self->_throttleConfigs;
  v8 = (char *)v4;
  if (!throttleConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_throttleConfigs;
    self->_throttleConfigs = v6;

    v4 = v8;
    throttleConfigs = self->_throttleConfigs;
  }
  objc_msgSend_addObject_(throttleConfigs, v4, (uint64_t)v4);

}

- (unint64_t)throttleConfigsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_throttleConfigs, a2, v2);
}

- (id)throttleConfigAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_throttleConfigs, a2, a3);
}

+ (Class)throttleConfigType
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
  v11.super_class = (Class)CKDPResponseOperationHeader;
  -[CKDPResponseOperationHeader description](&v11, sel_description);
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
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  NSMutableArray *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
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
  uint64_t v39;
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
  if (objc_msgSend_count(self->_assetAuthorizationResponses, v5, v6))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v12 = objc_msgSend_count(self->_assetAuthorizationResponses, v10, v11);
    v14 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v12);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = self->_assetAuthorizationResponses;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v48, v53, 16);
    if (v17)
    {
      v20 = v17;
      v21 = *(_QWORD *)v49;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(v15);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v48 + 1) + 8 * v22), v18, v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v48, v53, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v4, v25, (uint64_t)v14, CFSTR("assetAuthorizationResponses"));
  }
  if (objc_msgSend_count(self->_throttleConfigs, v7, v8))
  {
    v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v29 = objc_msgSend_count(self->_throttleConfigs, v27, v28);
    v31 = (void *)objc_msgSend_initWithCapacity_(v26, v30, v29);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = self->_throttleConfigs;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v44, v52, 16);
    if (v34)
    {
      v37 = v34;
      v38 = *(_QWORD *)v45;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v45 != v38)
            objc_enumerationMutation(v32);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v39), v35, v36, (_QWORD)v44);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v31, v41, (uint64_t)v40);

          ++v39;
        }
        while (v37 != v39);
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v44, v52, 16);
      }
      while (v37);
    }

    objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v31, CFSTR("throttleConfig"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BE9C87FC(self, (uint64_t)a3);
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
  v5 = self->_assetAuthorizationResponses;
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

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_throttleConfigs;
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
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  const char *v24;
  id v25;

  v25 = a3;
  if (objc_msgSend_assetAuthorizationResponsesCount(self, v4, v5))
  {
    objc_msgSend_clearAssetAuthorizationResponses(v25, v6, v7);
    v10 = objc_msgSend_assetAuthorizationResponsesCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_assetAuthorizationResponsesAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAssetAuthorizationResponses_(v25, v14, (uint64_t)v13);

      }
    }
  }
  if (objc_msgSend_throttleConfigsCount(self, v6, v7))
  {
    objc_msgSend_clearThrottleConfigs(v25, v15, v16);
    v19 = objc_msgSend_throttleConfigsCount(self, v17, v18);
    if (v19)
    {
      v21 = v19;
      for (j = 0; j != v21; ++j)
      {
        objc_msgSend_throttleConfigAtIndex_(self, v20, j);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addThrottleConfig_(v25, v24, (uint64_t)v23);

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
  void *v10;
  NSMutableArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSMutableArray *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
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
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend_init(v7, v8, v9);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = self->_assetAuthorizationResponses;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v34, v39, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v35;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v34 + 1) + 8 * v17), v14, (uint64_t)a3);
        objc_msgSend_addAssetAuthorizationResponses_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v34, v39, 16);
    }
    while (v15);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_throttleConfigs;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, v38, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v20);
        v27 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v26), v23, (uint64_t)a3, (_QWORD)v30);
        objc_msgSend_addThrottleConfig_(v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, v38, 16);
    }
    while (v24);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *assetAuthorizationResponses;
  uint64_t v9;
  NSMutableArray *throttleConfigs;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((assetAuthorizationResponses = self->_assetAuthorizationResponses,
         v9 = v4[1],
         !((unint64_t)assetAuthorizationResponses | v9))
     || objc_msgSend_isEqual_(assetAuthorizationResponses, v7, v9)))
  {
    throttleConfigs = self->_throttleConfigs;
    v11 = v4[2];
    if ((unint64_t)throttleConfigs | v11)
      isEqual = objc_msgSend_isEqual_(throttleConfigs, v7, v11);
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

  v4 = objc_msgSend_hash(self->_assetAuthorizationResponses, a2, v2);
  return objc_msgSend_hash(self->_throttleConfigs, v5, v6) ^ v4;
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
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  v4 = (id *)a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4[1];
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend_addAssetAuthorizationResponses_(self, v8, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v4[2];
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v12);
        objc_msgSend_addThrottleConfig_(self, v15, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v19, v27, 16);
    }
    while (v16);
  }

}

- (void)setAssetAuthorizationResponses:(id)a3
{
  objc_storeStrong((id *)&self->_assetAuthorizationResponses, a3);
}

- (void)setThrottleConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_throttleConfigs, a3);
}

@end
