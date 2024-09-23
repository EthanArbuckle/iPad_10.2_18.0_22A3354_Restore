@implementation CKDPUpdateMissingAssetStatusRequest

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPUpdateMissingAssetStatusRequest;
  -[CKDPUpdateMissingAssetStatusRequest dealloc](&v3, sel_dealloc);
}

+ (id)options
{
  if (qword_1ED7009F0 != -1)
    dispatch_once(&qword_1ED7009F0, &unk_1E7834980);
  return (id)qword_1ED7009E8;
}

- (BOOL)hasMissingAssetStatusRecordID
{
  return self->_missingAssetStatusRecordID != 0;
}

- (void)setRecovered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recovered = a3;
}

- (void)setHasRecovered:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecovered
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAssetSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_assetSize = a3;
}

- (void)setHasAssetSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAssetPutReceipt
{
  return self->_assetPutReceipt != 0;
}

- (unint64_t)packageAssetSizesCount
{
  return self->_packageAssetSizes.count;
}

- (int64_t)packageAssetSizes
{
  return self->_packageAssetSizes.list;
}

- (void)clearPackageAssetSizes
{
  PBRepeatedInt64Clear();
}

- (void)addPackageAssetSize:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)packageAssetSizeAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_packageAssetSizes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  p_packageAssetSizes = &self->_packageAssetSizes;
  count = self->_packageAssetSizes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v10, v11, v12);

  }
  return p_packageAssetSizes->list[a3];
}

- (void)setPackageAssetSizes:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (void)clearPackagePutReceipts
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_packagePutReceipts, a2, v2);
}

- (void)addPackagePutReceipts:(id)a3
{
  const char *v4;
  NSMutableArray *packagePutReceipts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  packagePutReceipts = self->_packagePutReceipts;
  v8 = (char *)v4;
  if (!packagePutReceipts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_packagePutReceipts;
    self->_packagePutReceipts = v6;

    v4 = v8;
    packagePutReceipts = self->_packagePutReceipts;
  }
  objc_msgSend_addObject_(packagePutReceipts, v4, (uint64_t)v4);

}

- (unint64_t)packagePutReceiptsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_packagePutReceipts, a2, v2);
}

- (id)packagePutReceiptsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_packagePutReceipts, a2, a3);
}

+ (Class)packagePutReceiptsType
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
  v11.super_class = (Class)CKDPUpdateMissingAssetStatusRequest;
  -[CKDPUpdateMissingAssetStatusRequest description](&v11, sel_description);
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
  CKDPRecordIdentifier *missingAssetStatusRecordID;
  void *v8;
  const char *v9;
  char has;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSString *assetPutReceipt;
  void *v16;
  const char *v17;
  const char *v18;
  NSMutableArray *packagePutReceipts;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  if (missingAssetStatusRecordID)
  {
    objc_msgSend_dictionaryRepresentation(missingAssetStatusRecordID, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("missingAssetStatusRecordID"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_recovered);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("recovered"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_assetSize);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("assetSize"));

  }
  assetPutReceipt = self->_assetPutReceipt;
  if (assetPutReceipt)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)assetPutReceipt, CFSTR("assetPutReceipt"));
  PBRepeatedInt64NSArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("packageAssetSize"));

  packagePutReceipts = self->_packagePutReceipts;
  if (packagePutReceipts)
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)packagePutReceipts, CFSTR("packagePutReceipts"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB59470((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  NSMutableArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_missingAssetStatusRecordID)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_assetPutReceipt)
    PBDataWriterWriteStringField();
  if (self->_packageAssetSizes.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v6;
    }
    while (v6 < self->_packageAssetSizes.count);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_packagePutReceipts;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v14, v18, 16);
    }
    while (v10);
  }

}

- (unsigned)requestTypeCode
{
  return 80;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordIdentifier *missingAssetStatusRecordID;
  char has;
  NSString *assetPutReceipt;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  const char *v27;
  id v28;

  v4 = a3;
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  v28 = v4;
  if (missingAssetStatusRecordID)
  {
    objc_msgSend_setMissingAssetStatusRecordID_(v4, v5, (uint64_t)missingAssetStatusRecordID);
    v4 = v28;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_recovered;
    *((_BYTE *)v4 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_assetSize;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  assetPutReceipt = self->_assetPutReceipt;
  if (assetPutReceipt)
    objc_msgSend_setAssetPutReceipt_(v28, v5, (uint64_t)assetPutReceipt);
  if (objc_msgSend_packageAssetSizesCount(self, v5, (uint64_t)assetPutReceipt))
  {
    objc_msgSend_clearPackageAssetSizes(v28, v9, v10);
    v13 = objc_msgSend_packageAssetSizesCount(self, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        v16 = objc_msgSend_packageAssetSizeAtIndex_(self, v9, i);
        objc_msgSend_addPackageAssetSize_(v28, v17, v16);
      }
    }
  }
  if (objc_msgSend_packagePutReceiptsCount(self, v9, v10))
  {
    objc_msgSend_clearPackagePutReceipts(v28, v18, v19);
    v22 = objc_msgSend_packagePutReceiptsCount(self, v20, v21);
    if (v22)
    {
      v24 = v22;
      for (j = 0; j != v24; ++j)
      {
        objc_msgSend_packagePutReceiptsAtIndex_(self, v23, j);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPackagePutReceipts_(v28, v27, (uint64_t)v26);

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
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  char has;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_missingAssetStatusRecordID, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v12;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 64) = self->_recovered;
    *(_BYTE *)(v10 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 32) = self->_assetSize;
    *(_BYTE *)(v10 + 68) |= 1u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_assetPutReceipt, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v16;

  PBRepeatedInt64Copy();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = self->_packagePutReceipts;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, v32, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v18);
        v25 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v21, (uint64_t)a3, (_QWORD)v28);
        objc_msgSend_addPackagePutReceipts_((void *)v10, v26, (uint64_t)v25);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, v32, 16);
    }
    while (v22);
  }

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *missingAssetStatusRecordID;
  uint64_t v9;
  NSString *assetPutReceipt;
  uint64_t v11;
  const char *v12;
  NSMutableArray *packagePutReceipts;
  uint64_t v14;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_22;
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  v9 = v4[6];
  if ((unint64_t)missingAssetStatusRecordID | v9)
  {
    if (!objc_msgSend_isEqual_(missingAssetStatusRecordID, v7, v9))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) != 0)
    {
      if (self->_recovered)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_22;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_12;
    }
LABEL_22:
    isEqual = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
    goto LABEL_22;
LABEL_12:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_assetSize != v4[4])
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_22;
  }
  assetPutReceipt = self->_assetPutReceipt;
  v11 = v4[5];
  if ((unint64_t)assetPutReceipt | v11 && !objc_msgSend_isEqual_(assetPutReceipt, v7, v11)
    || !PBRepeatedInt64IsEqual())
  {
    goto LABEL_22;
  }
  packagePutReceipts = self->_packagePutReceipts;
  v14 = v4[7];
  if ((unint64_t)packagePutReceipts | v14)
    isEqual = objc_msgSend_isEqual_(packagePutReceipts, v12, v14);
  else
    isEqual = 1;
LABEL_23:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v4 = objc_msgSend_hash(self->_missingAssetStatusRecordID, a2, v2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_recovered;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_assetSize;
LABEL_6:
  v9 = v7 ^ v4 ^ v8 ^ objc_msgSend_hash(self->_assetPutReceipt, v5, v6);
  v10 = PBRepeatedInt64Hash();
  return v9 ^ v10 ^ objc_msgSend_hash(self->_packagePutReceipts, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordIdentifier *missingAssetStatusRecordID;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  v7 = *((_QWORD *)v5 + 6);
  if (missingAssetStatusRecordID)
  {
    if (v7)
      objc_msgSend_mergeFrom_(missingAssetStatusRecordID, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setMissingAssetStatusRecordID_(self, v4, v7);
  }
  v8 = *((_BYTE *)v5 + 68);
  if ((v8 & 2) != 0)
  {
    self->_recovered = *((_BYTE *)v5 + 64);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v5 + 68);
  }
  if ((v8 & 1) != 0)
  {
    self->_assetSize = *((_QWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v9 = *((_QWORD *)v5 + 5);
  if (v9)
    objc_msgSend_setAssetPutReceipt_(self, v4, v9);
  v10 = objc_msgSend_packageAssetSizesCount(v5, v4, v9);
  if (v10)
  {
    v12 = v10;
    for (i = 0; i != v12; ++i)
    {
      v14 = objc_msgSend_packageAssetSizeAtIndex_(v5, v11, i);
      objc_msgSend_addPackageAssetSize_(self, v15, v14);
    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = *((id *)v5 + 7);
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v23, v27, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v16);
        objc_msgSend_addPackagePutReceipts_(self, v19, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v23, v27, 16);
    }
    while (v20);
  }

}

- (CKDPRecordIdentifier)missingAssetStatusRecordID
{
  return self->_missingAssetStatusRecordID;
}

- (void)setMissingAssetStatusRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_missingAssetStatusRecordID, a3);
}

- (BOOL)recovered
{
  return self->_recovered;
}

- (int64_t)assetSize
{
  return self->_assetSize;
}

- (NSString)assetPutReceipt
{
  return self->_assetPutReceipt;
}

- (void)setAssetPutReceipt:(id)a3
{
  objc_storeStrong((id *)&self->_assetPutReceipt, a3);
}

- (NSMutableArray)packagePutReceipts
{
  return self->_packagePutReceipts;
}

- (void)setPackagePutReceipts:(id)a3
{
  objc_storeStrong((id *)&self->_packagePutReceipts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packagePutReceipts, 0);
  objc_storeStrong((id *)&self->_missingAssetStatusRecordID, 0);
  objc_storeStrong((id *)&self->_assetPutReceipt, 0);
}

@end
