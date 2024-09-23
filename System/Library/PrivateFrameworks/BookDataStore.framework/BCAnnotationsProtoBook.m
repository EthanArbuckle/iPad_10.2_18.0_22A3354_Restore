@implementation BCAnnotationsProtoBook

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)clearAnnotations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_removeAllObjects(self->_annotations, a2, v2, v3, v4);
}

- (void)addAnnotation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *annotations;
  NSMutableArray *v8;
  NSMutableArray *v9;
  char *v10;

  v4 = (const char *)a3;
  annotations = self->_annotations;
  v10 = (char *)v4;
  if (!annotations)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = self->_annotations;
    self->_annotations = v8;

    v4 = v10;
    annotations = self->_annotations;
  }
  objc_msgSend_addObject_(annotations, v4, (uint64_t)v4, v5, v6);

}

- (unint64_t)annotationsCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_count(self->_annotations, a2, v2, v3, v4);
}

- (id)annotationAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_objectAtIndex_(self->_annotations, a2, a3, v3, v4);
}

+ (Class)annotationType
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
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)BCAnnotationsProtoBook;
  -[BCAnnotationsProtoBook description](&v15, sel_description);
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
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *assetID;
  NSString *appVersion;
  NSString *assetVersion;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  assetID = self->_assetID;
  if (assetID)
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)assetID, (uint64_t)CFSTR("assetID"), v9);
  appVersion = self->_appVersion;
  if (appVersion)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)appVersion, (uint64_t)CFSTR("appVersion"), v9);
  assetVersion = self->_assetVersion;
  if (assetVersion)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)assetVersion, (uint64_t)CFSTR("assetVersion"), v9);
  if (objc_msgSend_count(self->_annotations, v7, (uint64_t)assetVersion, v8, v9))
  {
    v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v19 = objc_msgSend_count(self->_annotations, v15, v16, v17, v18);
    v23 = (void *)objc_msgSend_initWithCapacity_(v14, v20, v19, v21, v22);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v24 = self->_annotations;
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v26)
    {
      v31 = v26;
      v32 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v24);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v41 + 1) + 8 * i), v27, v28, v29, v30, (_QWORD)v41);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v23, v35, (uint64_t)v34, v36, v37);

        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKey_(v10, v38, (uint64_t)v23, (uint64_t)CFSTR("annotation"), v39);
  }
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return BCAnnotationsProtoBookReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_assetID)
    sub_227E5E3A8();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_appVersion)
    sub_227E5E3D0();
  PBDataWriterWriteStringField();
  if (self->_assetVersion)
    PBDataWriterWriteStringField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_annotations;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v9);
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
  NSString *assetVersion;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v32 = a3;
  objc_msgSend_setAssetID_(v32, v4, (uint64_t)self->_assetID, v5, v6);
  objc_msgSend_setAppVersion_(v32, v7, (uint64_t)self->_appVersion, v8, v9);
  assetVersion = self->_assetVersion;
  if (assetVersion)
    objc_msgSend_setAssetVersion_(v32, v10, (uint64_t)assetVersion, v11, v12);
  if (objc_msgSend_annotationsCount(self, v10, (uint64_t)assetVersion, v11, v12))
  {
    objc_msgSend_clearAnnotations(v32, v14, v15, v16, v17);
    v22 = objc_msgSend_annotationsCount(self, v18, v19, v20, v21);
    if (v22)
    {
      v26 = v22;
      for (i = 0; i != v26; ++i)
      {
        objc_msgSend_annotationAtIndex_(self, v23, i, v24, v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAnnotation_(v32, v29, (uint64_t)v28, v30, v31);

      }
    }
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = objc_msgSend_copyWithZone_(self->_assetID, v15, (uint64_t)a3, v16, v17);
  v19 = (void *)v14[3];
  v14[3] = v18;

  v23 = objc_msgSend_copyWithZone_(self->_appVersion, v20, (uint64_t)a3, v21, v22);
  v24 = (void *)v14[2];
  v14[2] = v23;

  v28 = objc_msgSend_copyWithZone_(self->_assetVersion, v25, (uint64_t)a3, v26, v27);
  v29 = (void *)v14[4];
  v14[4] = v28;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = self->_annotations;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v44, (uint64_t)v48, 16);
  if (v32)
  {
    v36 = v32;
    v37 = *(_QWORD *)v45;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v45 != v37)
          objc_enumerationMutation(v30);
        v39 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v38), v33, (uint64_t)a3, v34, v35, (_QWORD)v44);
        objc_msgSend_addAnnotation_(v14, v40, (uint64_t)v39, v41, v42);

        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v44, (uint64_t)v48, 16);
    }
    while (v36);
  }

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
  NSString *assetID;
  uint64_t v13;
  NSString *appVersion;
  uint64_t v15;
  NSString *assetVersion;
  uint64_t v17;
  NSMutableArray *annotations;
  uint64_t v19;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)
    && ((assetID = self->_assetID, v13 = v4[3], !((unint64_t)assetID | v13))
     || objc_msgSend_isEqual_(assetID, v9, v13, v10, v11))
    && ((appVersion = self->_appVersion, v15 = v4[2], !((unint64_t)appVersion | v15))
     || objc_msgSend_isEqual_(appVersion, v9, v15, v10, v11))
    && ((assetVersion = self->_assetVersion, v17 = v4[4], !((unint64_t)assetVersion | v17))
     || objc_msgSend_isEqual_(assetVersion, v9, v17, v10, v11)))
  {
    annotations = self->_annotations;
    v19 = v4[1];
    if ((unint64_t)annotations | v19)
      isEqual = objc_msgSend_isEqual_(annotations, v9, v19, v10, v11);
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
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = objc_msgSend_hash(self->_assetID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_appVersion, v7, v8, v9, v10) ^ v6;
  v16 = objc_msgSend_hash(self->_assetVersion, v12, v13, v14, v15);
  return v11 ^ v16 ^ objc_msgSend_hash(self->_annotations, v17, v18, v19, v20);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = *((_QWORD *)v7 + 3);
  if (v8)
    objc_msgSend_setAssetID_(self, v4, v8, v5, v6);
  v9 = *((_QWORD *)v7 + 2);
  if (v9)
    objc_msgSend_setAppVersion_(self, v4, v9, v5, v6);
  v10 = *((_QWORD *)v7 + 4);
  if (v10)
    objc_msgSend_setAssetVersion_(self, v4, v10, v5, v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = *((id *)v7 + 1);
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v13)
  {
    v17 = v13;
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v11);
        objc_msgSend_addAnnotation_(self, v14, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v15, v16, (_QWORD)v20);
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v17);
  }

}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (NSMutableArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
}

@end
